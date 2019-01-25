#pragma once

#include <QtWidgets/QWidget>
#include <QMap>
#include <QPoint>
#include <QPixmap>

class DropArea : public QWidget
{
public:
	DropArea(QWidget* parent = 0);
	~DropArea();

protected:
	void paintEvent(QPaintEvent *event);

	void dragEnterEvent(QDragEnterEvent *event);
	void dragMoveEvent(QDragMoveEvent *event);
	void dragLeaveEvent(QDragLeaveEvent *event);
	void dropEvent(QDropEvent *event);

private:
	QVector<QPair<QPoint, QPixmap>> m_Images;
};
