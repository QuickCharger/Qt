#include <QtGui>

#include "droparea.h"

dropArea::dropArea(QWidget *parent)
    : QLabel(parent)
{
    setMinimumSize(200, 200);
    setFrameStyle(QFrame::Sunken | QFrame::StyledPanel);
    setAlignment(Qt::AlignCenter);
    setAcceptDrops(true);
    setAutoFillBackground(true);
}

void dropArea::dragEnterEvent(QDragEnterEvent *event)
{
    event->acceptProposedAction();
}

void dropArea::dragMoveEvent(QDragMoveEvent *event)
{
    event->acceptProposedAction();
}

void dropArea::dropEvent(QDropEvent *event)
{
    const QMimeData *mimeData = event->mimeData();

    if (mimeData->hasImage()) {
        setPixmap(qvariant_cast<QPixmap>(mimeData->imageData()));
    } else if (mimeData->hasHtml()) {
        setText(mimeData->html());
        setTextFormat(Qt::RichText);
    } else if (mimeData->hasText()) {
        setText(mimeData->text());    
        setTextFormat(Qt::PlainText);
    } else if (mimeData->hasUrls()) {
        QList<QUrl> urlList = mimeData->urls();
        QString text;
        for (int i = 0; i < urlList.size() && i < 32; ++i) {
            QString url = urlList.at(i).path();
            text += url + QString("\n");
        }
        setText(text);
    } else {
        setText(tr("Cannot display data"));
    }

    setBackgroundRole(QPalette::Dark);
    event->acceptProposedAction();
}

void dropArea::dragLeaveEvent(QDragLeaveEvent *event)
{
    event->accept();
}

