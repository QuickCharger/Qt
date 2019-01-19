#include "musicPlayer.h"
#include <QApplication>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    a.setApplicationDisplayName("QtWinExtras Music Player");

    CMusicPlayer w;
    w.show();

    return a.exec();
}
