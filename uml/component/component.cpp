#pragma once

#include "class.h"

QWidget* CreateComponent(QString& name)
{
	if (name == "class")
	{
		return new CClassDiagram;
	}
	return nullptr;
}

QVector<QWidget*> GetAllComponentLabel()
{
	QVector<QWidget*> ret;
	ret.push_back(new CClassLabel);
	return ret;
}
