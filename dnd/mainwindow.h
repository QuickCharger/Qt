#pragma once

#include <QWidget>

namespace Ui {
	class mainwindow;
}

class MainWindow : public QWidget
{
public:
	explicit MainWindow(QWidget *parent = 0);
	~MainWindow();

private:
	Ui::mainwindow *ui;
};
