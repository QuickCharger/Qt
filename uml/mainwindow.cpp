#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "zoomArea.h"
#include "component.h"

MainWindow::MainWindow(QWidget *parent) :
	QMainWindow(parent),
	ui(new Ui::MainWindow)
{
	ui->setupUi(this);

	InitUI();
	InitComponent();
}

MainWindow::~MainWindow()
{
	delete ui;
}

void MainWindow::InitUI()
{
	initZoomArea();
	ui->zoomArea->SetObserve(ui->scrollAreaWidgetContents);
}

void MainWindow::InitComponent()
{
	QListWidget* gadgetList = ui->gadgetList;
	QVector<QWidget*> allComponentLabel = GetAllComponentLabel();
	for (auto it = allComponentLabel.begin(); it != allComponentLabel.end(); ++it)
	{
		QListWidgetItem *item = new QListWidgetItem();
		gadgetList->addItem(item);
		gadgetList->setItemWidget(item, *it);
	}
}

/*
* 手动初始化zoomArea. ui中的zoomArea. 由于编辑器的限制 不能把zoomArea挂在scrollArea上
*/
void MainWindow::initZoomArea()
{
	QGridLayout* gridLayout = new QGridLayout(ui->scrollArea);
	gridLayout->setContentsMargins(0, 0, 30, 30);
	QSpacerItem *verticalSpacer = new QSpacerItem(0, 0, QSizePolicy::Minimum, QSizePolicy::Expanding);
	gridLayout->addItem(verticalSpacer, 0, 1);
	QSpacerItem *horizontalSpacer = new QSpacerItem(0, 0, QSizePolicy::Expanding, QSizePolicy::Minimum);
	gridLayout->addItem(horizontalSpacer, 1, 0);
	gridLayout->addWidget(ui->zoomArea, 1, 1);
}
