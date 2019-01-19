#include "mainwindow.h"
#include <QCamera>
#include <QCameraInfo>
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    m_QCamera = new QCamera(QCameraInfo::defaultCamera());
    m_QCamera->start();
    m_QCamera->exposure()->setFlashMode(QCameraExposure::FlashVideoLight);
}

MainWindow::~MainWindow()
{
    delete ui;
    if(m_QCamera)
    {
        delete m_QCamera;
        m_QCamera = nullptr;
    }
}
