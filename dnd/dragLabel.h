#pragma once

#include <QLabel>

class DragLabel : public QLabel
{
public:
	DragLabel(QWidget* parent = 0);
	~DragLabel();

protected:

	void mousePressEvent(QMouseEvent *);
	void mouseMoveEvent(QMouseEvent *);
private:
	QPoint m_Point;
};
