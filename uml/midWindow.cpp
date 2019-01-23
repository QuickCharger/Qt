#include "midWindow.h"
#include "curtail.h"

MidWindow::MidWindow(QWidget *parent)
	: QWidget(parent)
{
	this->setFixedHeight(s_kCurtainHeight);
	this->setFixedWidth(s_kCurtainWidth);

	m_pCurtain = new Curtail(s_kCurtainWidth, s_kCurtainHeight, s_kPointDiameter, s_kPointDistance);
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
