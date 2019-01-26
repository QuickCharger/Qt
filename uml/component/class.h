#pragma once

#include "Qt.h"

class CClassLabel : public QLabel
{
public:
	CClassLabel();
	~CClassLabel();

protected:
	void mousePressEvent(QMouseEvent *);
	void mouseMoveEvent(QMouseEvent *);

private:
	QPoint	m_oldPos;
};

class CClassDiagram : public QFrame
{
public:
	CClassDiagram();
	~CClassDiagram();

protected:
	virtual void paintEvent(QPaintEvent *event);

	virtual void mousePressEvent(QMouseEvent *);
	virtual void mouseMoveEvent(QMouseEvent *);
	virtual void mouseReleaseEvent(QMouseEvent *);
private:
	QPoint	m_oldPos;
};
