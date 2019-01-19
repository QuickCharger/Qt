#include <QApplication>
#include "cbuildindlg.h"

int main( int argc, char *argv[])
{
//    QTextCodec::setCodecForLocale(QTextCodec::codecForName("Gb18030"));

    QApplication app( argc, argv);

//   QTextCodec::setCodecForTr(QTextCodec::codecForName("Gb18030"));

    CBuildinDlg w;
    w.show();

    return app.exec();
}
