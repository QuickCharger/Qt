#include "class.h"
#include "Qt.h"

CClassLabel::CClassLabel()
{
	this->setText("CLASS");
}

CClassLabel::~CClassLabel()
{
}

void CClassLabel::mousePressEvent(QMouseEvent *event)
{
	if (event->button() == Qt::LeftButton)
		m_oldPos = event->pos();
}

void CClassLabel::mouseMoveEvent(QMouseEvent *event)
{
	if (event->buttons() & Qt::LeftButton)
	{
		int distance = (event->pos() - m_oldPos).manhattanLength();
		if (distance >= QApplication::startDragDistance())
		{
			qDebug() << "enter drag " << rand();
			QMimeData *mimeData = new QMimeData;
			QDrag drag(this);
			CClassDiagram diagram;
			QPixmap map = diagram.grab();
			mimeData->setText("class");
			drag.setMimeData(mimeData);
			drag.setPixmap(map);
			drag.setHotSpot(QPoint(map.width() / 2, map.height() / 2));
			if (drag.exec(Qt::MoveAction) == Qt::MoveAction)
			{
				// do nothing;
			}
		}
	}
}

CClassDiagram::CClassDiagram()
{
	QVBoxLayout *layout = new QVBoxLayout;
	{
		QLabel *l = new QLabel("CLASS");
		layout->addWidget(l);
	}
	{
		QVBoxLayout *layoutMember = new QVBoxLayout;
		QWidget *wMember = new QWidget;
		wMember->setLayout(layoutMember);
		layout->addWidget(wMember);
	}
	{
		QVBoxLayout *layoutFunc = new QVBoxLayout;
		QWidget *wFunc = new QWidget;
		wFunc->setLayout(layoutFunc);
		layout->addWidget(wFunc);
	}

	this->setLayout(layout);
}

CClassDiagram::~CClassDiagram()
{
}

void CClassDiagram::paintEvent(QPaintEvent *)
{
	QPainter painter(this);

	QPixmap* map = new QPixmap(this->width(), this->height());
	map->fill(Qt::white);

	painter.drawPixmap(0, 0, *map);
}

void CClassDiagram::mousePressEvent(QMouseEvent *event)
{
	if (event->button() & Qt::LeftButton)
		m_oldPos = event->pos();
}

void CClassDiagram::mouseMoveEvent(QMouseEvent *event)
{
	if (event->buttons() & Qt::LeftButton)
	{
		QPoint orgPoint = this->pos();
		QPoint p = event->pos();
		move(orgPoint + p - m_oldPos);
	}
}

void CClassDiagram::mouseReleaseEvent(QMouseEvent *)
{
}
