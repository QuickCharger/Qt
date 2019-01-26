#pragma once

#include "Qt.h"

class Curtail
{
public:
	Curtail();
	Curtail(int a_width, int a_heigh, int a_PointDiameter = 0, int a_PointDistance = 0);
	~Curtail();
	void SetWidthHeigh(int width, int heigh);
	void SetDiameter(int);
	void SetDistance(int);
	void Draw();
	const QPixmap& GetPixmap();
private:
	QPixmap * m_pCurtain = nullptr;
	int m_PointDiameter = 1;
	int m_PointDistance = 5;
	int m_Width = 100;
	int m_Heigh = 100;
};

