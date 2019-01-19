#ifndef CBUILDINDLG_H
#define CBUILDINDLG_H

#include <QtWidgets/QDialog>
#include <QtWidgets/QDialog>
#include <QtGui>

class QTextEdit;
class QPushButton;

class CBuildinDlg : public QWidget
{
    Q_OBJECT
public:
    explicit CBuildinDlg(QWidget *parent = 0);
    virtual ~CBuildinDlg();

private:
    QTextEdit *displayTextEdit;
    QPushButton *colorPushBtn;
    QPushButton *errorPushBtn;
    QPushButton *filePushBtn;
    QPushButton *fontPushBtn;
    QPushButton *inputPushBtn;
    QPushButton *pagePushBtn;
    QPushButton *progressPushBtn;
    QPushButton *printPushBtn;


signals:

public slots:
    void doPushBtn();
};

#endif // CBUILDINDLG_H
