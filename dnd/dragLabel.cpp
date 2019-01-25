#include "dragLabel.h"

#include <QPainter>
#include <QMouseEvent>
#include <QApplication>
#include <QMimeData>
#include <QDrag>

DragLabel::DragLabel(QWidget* parent)
	: QLabel(parent)
{

}

DragLabel::~DragLabel()
{

}

void DragLabel::mousePressEvent(QMouseEvent *event)
{
	if (event->button() == Qt::LeftButton)
		m_Point = event->pos();
}

void DragLabel::mouseMoveEvent(QMouseEvent *event)
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
			drag->setHotSpot(QPoint(map.width() / 2, map.height() / 2));
			if (drag->exec(Qt::MoveAction) == Qt::MoveAction)
				;
		}
	}
}
