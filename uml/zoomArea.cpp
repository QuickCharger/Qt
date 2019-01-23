#include "zoomArea.h"

ZoomAreaShadow::ZoomAreaShadow(QWidget* parent)
{
	m_pEffect = new QGraphicsDropShadowEffect(parent);
	m_pEffect->setOffset(0, 0);
	m_pEffect->setColor(Qt::gray);
	m_pEffect->setBlurRadius(10);
	parent->setGraphicsEffect(m_pEffect);
}

ZoomAreaShadow::~ZoomAreaShadow()
{
	if (m_pEffect)
		delete m_pEffect;
}

ZoomArea::ZoomArea(QWidget *parent)
	: QWidget(parent)
	, m_pShadow(this)
{
	setFixedSize(s_kWidth, s_kHeigh);
}

ZoomArea::~ZoomArea()
{
}

void ZoomArea::slot_ScrollAreaValueChanged(int)
{
	move();
	update();
}

void ZoomArea::mousePressEvent(QMouseEvent *)
{

}

void ZoomArea::mouseMoveEvent(QMouseEvent *)
{

}

void ZoomArea::paintEvent(QPaintEvent *)
{
	QPainter painter(this);
	painter.fillRect(0, 0, this->width(), this->height(), Qt::white);
	move();
}

void ZoomArea::move()
{
	QWidget *w = parentWidget();
	if (w)
	{
		QWidget::move(w->width() - s_kWidth - s_kMarginWidth, w->height() - s_kHeigh - s_kMarginHeigh);
	}
}
