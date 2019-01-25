#include "dragarea.h"

#include <QPainter>
#include <QMouseEvent>
#include <QApplication>
#include <QMimeData>
#include <QDrag>

DragArea::DragArea(QWidget* parent)
	: QWidget(parent)
{

}

DragArea::~DragArea()
{

}

void DragArea::paintEvent(QPaintEvent *)
{
	QPainter painter(this);

	static QPixmap map(this->width(), this->height());
	map.fill(Qt::black);

	painter.drawPixmap(0, 0, map);
}

void DragArea::mousePressEvent(QMouseEvent *event)
{
	if (event->button() == Qt::LeftButton)
		m_Point = event->pos();
}

void DragArea::mouseMoveEvent(QMouseEvent *event)
{
	if (event->buttons() & Qt::LeftButton) {
		int distance = (event->pos() - m_Point).manhattanLength();
		if (distance >= QApplication::startDragDistance())
		{
			QMimeData *mimeData = new QMimeData;
			QDrag *drag = new QDrag(this);
			QPixmap map = this->grab();
			mimeData->setImageData(map);
			drag->setMimeData(mimeData);
			drag->setPixmap(map);
			drag->setHotSpot(QPoint(map.width()/2, map.height()/2));
			if (drag->exec(Qt::MoveAction) == Qt::MoveAction)
				;
		}
	}
}
