#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>

class QCamera;

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();

private:
    Ui::MainWindow *ui;

    QCamera *m_QCamera;
};

#endif // MAINWINDOW_H
