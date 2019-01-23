#pragma once

#include "Qt.h"

class ZoomAreaShadow
{
public:
	ZoomAreaShadow(QWidget* parent);
	~ZoomAreaShadow();
private:
	QGraphicsDropShadowEffect *m_pEffect = nullptr;
};

class ZoomArea : public QWidget
{
public:
	ZoomArea(QWidget *parent = nullptr);
	~ZoomArea();
	void slot_ScrollAreaValueChanged(int);

protected:
	void mousePressEvent(QMouseEvent *);
	void mouseMoveEvent(QMouseEvent *);
	void paintEvent(QPaintEvent *);

private:
	void move();
	ZoomAreaShadow m_pShadow;

	const int s_kWidth = 150;
	const int s_kHeigh = 150;
	const int s_kMarginWidth = 30;
	const int s_kMarginHeigh = 30;
};
