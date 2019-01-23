#include "curtail.h"

Curtail::Curtail()
{
}

Curtail::Curtail(int a_width, int a_heigh, int a_PointDiameter, int a_PointDistance)
{
	SetWidthHeigh(a_width, a_heigh);
	SetDiameter(a_PointDiameter);
	SetDistance(a_PointDistance);
	Draw();
}

Curtail::~Curtail()
{
	if (m_pCurtain)
		delete m_pCurtain;
}

void Curtail::SetWidthHeigh(int width, int heigh)
{
	m_Width = width;
	m_Heigh = heigh;
}

void Curtail::SetDiameter(int a_diameter)
{
	this->m_PointDiameter = a_diameter;
}

void Curtail::SetDistance(int a_distance)
{
	this->m_PointDistance = a_distance;
}

void Curtail::Draw()
{
	if (m_pCurtain)
		delete m_pCurtain;

	m_pCurtain = new QPixmap(m_Width, m_Heigh);
	m_pCurtain->fill(Qt::white);

	QPen pen;
	pen.setWidth(m_PointDiameter);

	QPainter painter(m_pCurtain);
	painter.setPen(pen);

	for (auto i = 1; i < m_Width; i = i + m_PointDistance)
		for (auto j = 1; j < m_Heigh; j = j + m_PointDistance)
		{
			painter.drawPoint(i, j);
		}
}

const QPixmap& Curtail::GetPixmap()
{
	return *m_pCurtain;
}
