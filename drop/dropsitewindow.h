#ifndef DROPSITEWINDOW_H
#define DROPSITEWINDOW_H

#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE
QT_END_NAMESPACE

class dropArea;

class DropSiteWindow : public QWidget
{
    Q_OBJECT

public:
    DropSiteWindow();

private:
    dropArea *drop_area;
};

#endif
