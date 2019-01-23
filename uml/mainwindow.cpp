#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "zoomArea.h"

MainWindow::MainWindow(QWidget *parent) :
	QMainWindow(parent),
	ui(new Ui::MainWindow)
{
	ui->setupUi(this);

	QGridLayout* gridLayout = new QGridLayout(ui->scrollArea);
	gridLayout->setContentsMargins(0, 0, 30, 30);
	QSpacerItem *verticalSpacer = new QSpacerItem(0, 0, QSizePolicy::Minimum, QSizePolicy::Expanding);
	gridLayout->addItem(verticalSpacer, 0, 1);
	QSpacerItem *horizontalSpacer = new QSpacerItem(0, 0, QSizePolicy::Expanding, QSizePolicy::Minimum);
	gridLayout->addItem(horizontalSpacer, 1, 0);
	gridLayout->addWidget(ui->zoomArea, 1, 1);
}

MainWindow::~MainWindow()
{
	delete ui;
}
