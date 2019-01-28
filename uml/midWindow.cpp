#include "midWindow.h"
#include "curtail.h"

#include "component.h"

MidWindow::MidWindow(QWidget *parent)
	: QWidget(parent)
{
	this->setFixedHeight(s_kCurtainHeight);
	this->setFixedWidth(s_kCurtainWidth);

	m_pCurtain = new Curtail(s_kCurtainWidth, s_kCurtainHeight, s_kPointDiameter, s_kPointDistance);

	setAcceptDrops(true);

	test();
}

MidWindow::~MidWindow()
{
	if (m_pCurtain)
		delete m_pCurtain;
}

void MidWindow::paintEvent(QPaintEvent *)
{
	QPainter painter(this);
	painter.drawPixmap(0, 0, m_pCurtain->GetPixmap());
}

void MidWindow::dragEnterEvent(QDragEnterEvent *event)
{
	event->acceptProposedAction();
}

void MidWindow::dragMoveEvent(QDragMoveEvent *event)
{
	event->acceptProposedAction();
}

void MidWindow::dragLeaveEvent(QDragLeaveEvent *event)
{
	event->accept();
}

void MidWindow::dropEvent(QDropEvent *event)
{
	const QMimeData *mimeData = event->mimeData();

	if (mimeData->hasImage())
	{
		qDebug() << "has Image";
	}
	else if (mimeData->hasText())
	{
		qDebug() << "has Text: " << mimeData->text();
		QWidget *w = CreateComponent(mimeData->text(), this);
		//w->setParent(this);
		w->show();
		w->move(event->pos() - QPoint(w->width() / 2, w->height() / 2));
	}

	event->acceptProposedAction();
}

void MidWindow::test()
{
	CClassDiagram *c = new CClassDiagram();
	c->setParent(this);
	c->move(10, 10);
	c->Test();
}
