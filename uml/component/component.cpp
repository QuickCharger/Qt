#pragma once

#include "class.h"

QWidget* CreateComponent(QString& name, QWidget* parent)
{
	if (name == "class")
	{
		return new CClassDiagram(parent);
	}
	return nullptr;
}

QVector<QWidget*> GetAllComponentLabel()
{
	QVector<QWidget*> ret;
	ret.push_back(new CClassLabel);
	return ret;
}
