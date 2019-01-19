
#include <QtGui>
#include <QtWidgets/QVBoxLayout>

#include "droparea.h"
#include "dropsitewindow.h"

DropSiteWindow::DropSiteWindow()
{
    drop_area = new dropArea;

    QVBoxLayout *mainLayout = new QVBoxLayout;
    mainLayout->addWidget(drop_area);
    setLayout(mainLayout);
}
