#pragma once

#include "Qt.h"

class Curtail;

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

namespace Ui {
	class CClassDiagram;
}

class CClassDiagram : public QFrame
{
	Q_OBJECT

public:
	explicit CClassDiagram();
	~CClassDiagram();

protected:
	virtual void paintEvent(QPaintEvent *event);

	virtual void mousePressEvent(QMouseEvent *);
	virtual void mouseMoveEvent(QMouseEvent *);
	virtual void mouseReleaseEvent(QMouseEvent *);
private:
	QPoint	m_oldPos;
	Ui::CClassDiagram *ui;

	Curtail *m_pCurtain = nullptr;
};
