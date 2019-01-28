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

namespace Ui {
	class CClassDiagram;
}

/*
* Ë«»÷ÐÞ¸ÄÄÚÈÝ
*/
class LineEdit : public QLineEdit
{
	Q_OBJECT
public:
	LineEdit(const char* pCh);
	~LineEdit();
//protected:
	virtual void mouseDoubleClickEvent(QMouseEvent *);
//	virtual void mousePressEvent(QMouseEvent *);

private:
	void setStyleEditing(bool);
	QAction *m_act = nullptr;
};

class CClassDiagram : public QWidget
{
	Q_OBJECT

public:
	explicit CClassDiagram(QWidget* parent = 0);
	~CClassDiagram();
	void Test();

protected:
	virtual void paintEvent(QPaintEvent *event);

	virtual void mousePressEvent(QMouseEvent *);
	virtual void mouseMoveEvent(QMouseEvent *);
	virtual void mouseReleaseEvent(QMouseEvent *);
private:
	QPoint	m_oldPos;
	Ui::CClassDiagram *ui;
};
