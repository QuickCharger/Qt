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
	void SetObserve(QWidget* observe);

protected:
	void mousePressEvent(QMouseEvent *);
	void mouseMoveEvent(QMouseEvent *);
	void paintEvent(QPaintEvent *);

private:
	ZoomAreaShadow	m_pShadow;
	QWidget			*m_obj;
};
