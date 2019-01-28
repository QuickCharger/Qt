#pragma once

#include "class.h"

QWidget* CreateComponent(QString& name, QWidget* parent = 0);
QVector<QWidget*> GetAllComponentLabel();
