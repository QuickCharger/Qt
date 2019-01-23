#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "zoomArea.h"

MainWindow::MainWindow(QWidget *parent) :
	QMainWindow(parent),
	ui(new Ui::MainWindow)
{
	ui->setupUi(this);

	ui->zoomArea->setParent(ui->scrollArea);
	QScrollBar *pBar = ui->scrollArea->horizontalScrollBar();
	connect(pBar, &QScrollBar::valueChanged, ui->zoomArea, &ZoomArea::slot_ScrollAreaValueChanged);
	pBar = ui->scrollArea->verticalScrollBar();
	connect(pBar, &QScrollBar::valueChanged, ui->zoomArea, &ZoomArea::slot_ScrollAreaValueChanged);
}

MainWindow::~MainWindow()
{
	delete ui;
}
