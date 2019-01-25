#pragma once

#include <QWidget>

class DragArea : public QWidget
{
public:
	DragArea(QWidget* parent = 0);
	~DragArea();

protected:
	void paintEvent(QPaintEvent *event);

	void mousePressEvent(QMouseEvent *);
	void mouseMoveEvent(QMouseEvent *);
private:
	QPoint m_Point;
};
