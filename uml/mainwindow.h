#pragma once

#include "Qt.h"

namespace Ui {
	class MainWindow;
}

class MainWindow : public QMainWindow
{
	Q_OBJECT

public:
	explicit MainWindow(QWidget *parent = 0);
	~MainWindow();

	void InitUI();
	void InitComponent();

private:
	void initZoomArea();
	Ui::MainWindow *ui;
};
