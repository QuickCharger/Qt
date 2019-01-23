#pragma once

#include "Qt.h"

class Curtail;

class MidWindow : public QWidget
{
	Q_OBJECT
public:
	explicit MidWindow(QWidget *parent = 0);
	~MidWindow();
protected:
	virtual void paintEvent(QPaintEvent *event);
private:
	Curtail *m_pCurtain = nullptr;
	const int s_kCurtainWidth = 2000;
	const int s_kCurtainHeight = 3000;
	const int s_kPointDiameter = 1;
	const int s_kPointDistance = 10;
};
