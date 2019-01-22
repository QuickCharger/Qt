#include "midWindow.h"
#include <QPainter>
#include <QDebug>

MidWindow::MidWindow(QWidget *parent)
    : QWidget(parent)
{
    this->setFixedHeight(2000);
    this->setFixedWidth(1000);
}

MidWindow::~MidWindow()
{

}

void MidWindow::paintEvent(QPaintEvent *event)
{
    QPainter painter(this);
    QPen pen;
    pen.setColor(Qt::darkCyan);
    pen.setWidth(s_kPointDiameter);
    painter.setPen(pen);

    for(auto i = 1; i < this->width(); i = i + s_kPointDistance)
        for(auto j = 1; j < this->height(); j = j + s_kPointDistance)
        {
            painter.drawPoint(i,j);
        }
}
