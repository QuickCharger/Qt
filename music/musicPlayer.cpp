#include <QFileDialog>
#include <QStandardPaths>
#include <QStyle>
#include <QVBoxLayout>

#include "musicPlayer.h"

CMusicPlayer::CMusicPlayer(QWidget *parent)
    : QWidget(parent)
{
    /*
    * 打开文件
    */
    m_pOpenBtn = new QPushButton("&Open");
    connect(m_pOpenBtn, &QAbstractButton::clicked, this, &CMusicPlayer::openFile);

    /*
    * 暂停继续按钮
    */
    m_pPauseContinueBtn = new QPushButton();
    m_pPauseContinueBtn->setAccessibleDescription("pause");
    connect(m_pPauseContinueBtn, SIGNAL(clicked(bool)), this, SLOT(pauseOrContinue(bool)));

    /*
    * 轮动条
    */
    m_pSeekSlider = new QSlider;
//    connect(m_pSeedSlider, SIGNAL(), this, SLOT(seekSlider(qint64));

    /*
    * 文件信息
    */
    m_pInfoLabel = new QLabel;

    QVBoxLayout *pVLayout = new QVBoxLayout(this);
    pVLayout->addWidget(m_pOpenBtn);
    pVLayout->addWidget(m_pPauseContinueBtn);
    pVLayout->addWidget(m_pSeekSlider);
    pVLayout->addWidget(m_pInfoLabel);


    /*
    * 播放器
    */
    m_pMediaPlayer = new QMediaPlayer;
    connect(m_pMediaPlayer, SIGNAL(positionChanged(qint64)), this, SLOT(seekSlider(qint64)));

    refresh();

    setMinimumSize(800, 400);
}

CMusicPlayer::~CMusicPlayer()
{
    delete m_pOpenBtn;
    delete m_pPauseContinueBtn;
    delete m_pMediaPlayer;
}

void CMusicPlayer::openFile(bool a_checked)
{
    QString filePath;
    if(m_lastOpenFilePath.isEmpty())
    {
        const QStringList musicPaths = QStandardPaths::standardLocations(QStandardPaths::MusicLocation);
        filePath = musicPaths.first();
    }
    else
    {
        filePath = m_lastOpenFilePath;
    }
    filePath = QFileDialog::getOpenFileName(this, tr("Open File"),
                                     filePath.isEmpty() ? QDir::homePath() : filePath,
                                     tr("files (*.*)"));
    if (!filePath.isEmpty())
    {
        m_lastOpenFilePath = filePath;
        playFile(filePath);

        /*
        * 刷新显示文件信息
        */
        QString auth = m_pMediaPlayer->metaData("Author").toString();
        QString title = m_pMediaPlayer->metaData("Title").toString();
        QString name = QFileInfo(filePath).fileName();
//        qDebug() << "Auth: " << auth;
//        qDebug() << "title: " << title;
//        qDebug() << "name: " << name;

        QStringList list = m_pMediaPlayer->availableMetaData();
        for(auto it = list.begin(); it != list.end(); ++it)
        {
            qDebug() << *it;
        }
        m_pInfoLabel->setText(name + " " + auth + " " + title);

    }
}

void CMusicPlayer::pauseOrContinue(bool)
{
    const QString &btnDesc =m_pPauseContinueBtn->accessibleDescription();
    if(btnDesc == "play")
    {
        m_pMediaPlayer->play();
    }
    else if(btnDesc == "pause")
    {
        m_pMediaPlayer->pause();
    }
    refresh();
}

void CMusicPlayer::seekSlider(qint64 a_position)
{
//    qDebug() << a_position;
    m_pSeekSlider->setRange(0, 300);
    m_pSeekSlider->setValue(a_position/1000);
}

void CMusicPlayer::playFile(const QString &a_fileName)
{
    m_pMediaPlayer->setMedia(QUrl::fromLocalFile(a_fileName));
    m_pMediaPlayer->play();
    refresh();
}

/*
* 刷新界面
*/
void CMusicPlayer::refresh()
{
    QMediaPlayer::State state;
    state = m_pMediaPlayer->state();
    if(state == QMediaPlayer::PlayingState)
    {
        m_pPauseContinueBtn->setIcon(style()->standardIcon(QStyle::SP_MediaPause));
        m_pPauseContinueBtn->setAccessibleDescription("pause");
    }
    else if(state == QMediaPlayer::PausedState)
    {
        m_pPauseContinueBtn->setIcon(style()->standardIcon(QStyle::SP_MediaPlay));
        m_pPauseContinueBtn->setAccessibleDescription("play");
    }
    else if(state == QMediaPlayer::StoppedState)
    {
        // do nothing
    }

}
