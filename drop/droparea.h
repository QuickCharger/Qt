#ifndef DROPAREA_H
#define DROPAREA_H

#include <QtWidgets/QLabel>

QT_BEGIN_NAMESPACE
class QMimeData;
QT_END_NAMESPACE

class dropArea : public QLabel
{
    Q_OBJECT

public:
    dropArea(QWidget *parent = 0);

protected:
    void dragEnterEvent(QDragEnterEvent *event);
    void dragMoveEvent(QDragMoveEvent *event);
    void dragLeaveEvent(QDragLeaveEvent *event);
    void dropEvent(QDropEvent *event);

private:
    QLabel *label;
};

#endif
