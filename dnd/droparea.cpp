#include "droparea.h"

#include <QPainter>
#include <QDragEnterEvent>
#include <QDragMoveEvent>
#include <QDragLeaveEvent>
#include <QMimeData>
#include <QDebug>

DropArea::DropArea(QWidget* parent)
	: QWidget(parent)
{
	setAcceptDrops(true);
}

DropArea::~DropArea()
{

}

void DropArea::paintEvent(QPaintEvent *)
{
	QPainter painter(this);

	static QPixmap map(this->width(), this->height());
	map.fill(Qt::white);
	painter.drawPixmap(0, 0, map);

	for (auto it = m_Images.begin(); it != m_Images.end(); ++it)
	{
		painter.drawPixmap(it->first.x() - it->second.width()/2, it->first.y() - it->second.height()/2, it->second);
	}
}


void DropArea::dragEnterEvent(QDragEnterEvent *event)
{
	event->acceptProposedAction();
}

void DropArea::dragMoveEvent(QDragMoveEvent *event)
{
	event->acceptProposedAction();
}

void DropArea::dragLeaveEvent(QDragLeaveEvent *event)
{
	event->accept();
}

void DropArea::dropEvent(QDropEvent *event)
{
	const QMimeData *mimeData = event->mimeData();

	if (mimeData->hasImage())
	{
		qDebug() << "mime has image";
		m_Images.push_back(qMakePair(event->pos(), mimeData->imageData().value<QPixmap>()));
	}
	else if (mimeData->hasText())
	{
		qDebug() << "mime has text: " << mimeData->text();
	}
	else {
		qDebug() << "mime has something cannot display";
	}

	setBackgroundRole(QPalette::Dark);
	event->acceptProposedAction();
}
