#include "cbuildindlg.h"
#include <QtGui/QtGui>
#include <QtPrintSupport/QtPrintSupport>
#include <QtWidgets/QtWidgets>

CBuildinDlg::CBuildinDlg(QWidget *parent) :
    QWidget(parent)
{
    displayTextEdit = new QTextEdit(tr("Qt Standard Dialog"));
    colorPushBtn = new QPushButton(tr("color"));
    errorPushBtn = new QPushButton(tr("error"));
    filePushBtn = new QPushButton(tr("file"));
    fontPushBtn = new QPushButton(tr("font"));
    inputPushBtn = new QPushButton(tr("input"));
    pagePushBtn = new QPushButton(tr("page"));
    progressPushBtn = new QPushButton(tr("progress"));
    printPushBtn = new QPushButton(tr("print"));

    QGridLayout *gridLayout = new QGridLayout;
    gridLayout->addWidget(colorPushBtn, 0, 0, 1, 1);
    gridLayout->addWidget(errorPushBtn, 0, 1, 1, 1);
    gridLayout->addWidget(filePushBtn, 0, 2, 1, 1);
    gridLayout->addWidget(fontPushBtn, 1, 0, 1, 1);
    gridLayout->addWidget(inputPushBtn, 1, 1, 1, 1);
    gridLayout->addWidget(pagePushBtn, 1, 2, 1, 1);
    gridLayout->addWidget(progressPushBtn, 2, 0, 1, 1);
    gridLayout->addWidget(printPushBtn, 2, 1, 1, 1);
    gridLayout->addWidget(displayTextEdit, 3, 0, 3, 3);

    setLayout(gridLayout);

    connect(colorPushBtn, SIGNAL(clicked()), this, SLOT(doPushBtn()));
    connect(errorPushBtn, SIGNAL(clicked()), this, SLOT(doPushBtn()));
    connect(filePushBtn, SIGNAL(clicked()), this, SLOT(doPushBtn()));
    connect(fontPushBtn, SIGNAL(clicked()), this, SLOT(doPushBtn()));
    connect(inputPushBtn, SIGNAL(clicked()), this, SLOT(doPushBtn()));
    connect(pagePushBtn, SIGNAL(clicked()), this, SLOT(doPushBtn()));
    connect(progressPushBtn, SIGNAL(clicked()), this, SLOT(doPushBtn()));
    connect(printPushBtn, SIGNAL(clicked()), this, SLOT(doPushBtn()));

    setWindowTitle(tr("in-build dialog"));
    resize(400, 300);
}

CBuildinDlg::~CBuildinDlg()
{
    delete displayTextEdit;
    delete colorPushBtn;
    delete errorPushBtn;
    delete filePushBtn;
    delete fontPushBtn;
    delete inputPushBtn;
    delete pagePushBtn;
    delete progressPushBtn;
    delete printPushBtn;
}

void CBuildinDlg::doPushBtn()
{
    //将 QObject::sender()转变类型
    QPushButton *btn = qobject_cast<QPushButton*>(sender());

    if(btn == colorPushBtn)
    {
        //创建调色板，设置为 TextEdit的调色板
        QPalette palette = displayTextEdit->palette();

        //弹出调色板对话框，并获取颜色
        const QColor &color = QColorDialog::getColor(palette.color(QPalette::Base), this);

        //如果颜色有效，则设置调色板颜色,并把调色板加入displayText
        if(color.isValid())
        {
            palette.setColor(QPalette::Base, color);
            displayTextEdit->setPalette(palette);
        }
    }
    else if(btn == errorPushBtn)
    {
  //      QErrorMessage box(this);

        QErrorMessage *box = new QErrorMessage(this);
        box->setWindowTitle(tr("错误消息框"));
        box->showMessage(tr("错误消息框实例1."));
        box->showMessage(tr("错误消息框实例2."));
        box->showMessage(tr("错误消息框实例3."));
        box->showMessage(tr("错误消息框实例4."));
        box->showMessage(tr("zz."));
//        box.exec();
        box->show();
    }
    else if( btn == filePushBtn)
    {
        //确定文件位置
//        QString fileName = QFileDialog::getOpenFileName( this, tr("打开文件"), "c:/windows", tr("任何文件(*.*)" ";;文本文件(*.txt)" ";;xml文件(*.xml"));
        //确定文件夹位置

        //(父窗口，标题，默认路径，过滤器)
        QString fileName = QFileDialog::getExistingDirectory(this, tr("打开文件"), "c:/windows",QFileDialog::ShowDirsOnly);
        displayTextEdit->setText(fileName);
    }
    else if( btn == fontPushBtn )
    {
        bool ok;
        //ok作为输出参数，用于表示用户的选择状态，如果单击“确定”，ok变为true， 单击取消，ok变为false
        const QFont &font = QFontDialog::getFont(&ok, displayTextEdit->font(), this, tr("字体对话框"));

        if(ok)
            displayTextEdit->setFont(font);
    }
    else if( btn == inputPushBtn)
    {
        bool ok;
        //(父窗口,标题栏,标签内容,用户输入的内容的显示模式,行编辑器默认显示的内容,ok作用同fontPushBtn中的ok)
        QString text = QInputDialog::getText(this,tr("输入对话框"),tr("输入文本"), QLineEdit::Normal, QDir::home().dirName(), &ok);
        if(ok && !text.isEmpty())
        {
            displayTextEdit->setText(text);
        }
    }
    else if( btn == pagePushBtn)
    {
//        QPrinter printer;
//        QPageSetupDialog dlg(&printer, this);
//        dlg.setWindowTitle(tr("页设置对话框"));
//        if(dlg.exec() == QDialog::Accepted)
//        {
//            //dosomething
//        }
    }
    else if( btn == progressPushBtn)
    {
        QProgressDialog progress(tr("正在复制文件..."),tr("取消"),0, 10000, this);
        //设置模态对话框
        progress.setWindowModality(Qt::WindowModal);
        progress.setWindowTitle(tr("进度对话框"));
        //不能用exec() 如果用exec  会发生阻塞
        progress.show();

        for( int i = 0; i < 10000; i++)
        {
            progress.setValue(i);
            qApp->processEvents();
            if(progress.wasCanceled())
                break;\
            qDebug() << i;
        }
        progress.setValue(10000);
    }
    else if( btn == printPushBtn)
    {
//        QPrinter printer;
//        QPrintDialog dlg(&printer, this);
//        dlg.setWindowTitle(tr("打印对话框"));
//        if(dlg.exec() == QDialog::Accepted)
//        {
//            //dosomething
//        }
    }

}
