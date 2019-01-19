#pragma once

#include <QLabel>
#include <QMediaPlayer>
#include <QPushButton>
#include <QSlider>
#include <QWidget>

class CMusicPlayer : public QWidget
{
    Q_OBJECT

public:
    CMusicPlayer(QWidget *parent = 0);
    ~CMusicPlayer();

private slots:
    void openFile(bool);
    void pauseOrContinue(bool);
    void seekSlider(qint64);

private:
    void playFile(const QString &a_fileName);
    void refresh();

private:
    QString         m_lastOpenFilePath;
    QPushButton     *m_pOpenBtn = nullptr;
    QPushButton     *m_pPauseContinueBtn = nullptr;
    QSlider         *m_pSeekSlider = nullptr;
    QLabel          *m_pInfoLabel = nullptr;

    QMediaPlayer    *m_pMediaPlayer = nullptr;
};
