#pragma once

#include <QWidget>

class MidWindow : public QWidget
{
    Q_OBJECT
public:
    explicit MidWindow(QWidget *parent=0);
    ~MidWindow();
protected:
    virtual void paintEvent(QPaintEvent *event);
private:

    const int s_kPointDiameter = 1;
    const int s_kPointDistance = 10;
};

