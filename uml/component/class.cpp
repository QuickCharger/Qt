#include "class.h"
#include "ui_class.h"

CClassLabel::CClassLabel()
{
	this->setText("CLASS");
}

CClassLabel::~CClassLabel()
{
}

void CClassLabel::mousePressEvent(QMouseEvent *event)
{
	if (event->button() == Qt::LeftButton)
		m_oldPos = event->pos();
}

void CClassLabel::mouseMoveEvent(QMouseEvent *event)
{
	if (event->buttons() & Qt::LeftButton)
	{
		int distance = (event->pos() - m_oldPos).manhattanLength();
		if (distance >= QApplication::startDragDistance())
		{
			//qDebug() << "enter drag " << rand();
			QMimeData *mimeData = new QMimeData;
			QDrag drag(this);
			CClassDiagram diagram;
			QPixmap map = diagram.grab();
			mimeData->setText("class");
			drag.setMimeData(mimeData);
			drag.setPixmap(map);
			drag.setHotSpot(QPoint(map.width() / 2, map.height() / 2));
			if (drag.exec(Qt::MoveAction) == Qt::MoveAction)
			{
				// do nothing;
			}
		}
	}
}

LineEdit::LineEdit(const char* pCh)
	: QLineEdit(pCh)
{
	setText(pCh);
	setReadOnly(true);
	connect(this, &QLineEdit::editingFinished, [this]() {
		setReadOnly(true);
		setStyleEditing(false);
	});
	m_act = new QAction(QApplication::style()->standardIcon(QStyle::SP_DialogCloseButton), "", this);
	addAction(m_act, QLineEdit::TrailingPosition);
	connect(m_act, &QAction::triggered, [&]() {
		delete this;
	});
}

LineEdit::~LineEdit()
{
	delete m_act;
}

void LineEdit::mouseDoubleClickEvent(QMouseEvent *e)
{
	setReadOnly(false);
	setStyleEditing(true);
}

void LineEdit::setStyleEditing(bool b)
{
	setProperty("editing", b ? 1 : 0);
	style()->polish(this);
}

CClassDiagram::CClassDiagram(QWidget* parent)
	: ui(new Ui::CClassDiagram)
	, QWidget(parent)
{
	ui->setupUi(this);

	this->setAttribute(Qt::WA_StyledBackground);

	setStyleSheet("CClassDiagram { background-color:#FFFFFF; border:2px solid gray; }"
		"[accessibleName=\"widget_attribute\"] { background-color:#FFFFFF; border:2px solid gray; }"
		"QLineEdit[editing=\"1\"] {background-color:#E0FFFF; border:1px solid blue;}"
	);

	connect(ui->btn_add_attribute, &QPushButton::clicked, [&]() {
		QLineEdit *l = new LineEdit("Attribute");
		ui->layout_attribute->addWidget(l);
		update();
	});
	connect(ui->btn_add_operation, &QPushButton::clicked, [&]() {
		QLabel *l = new QLabel("Operation");
		ui->layout_operation->addWidget(l);
		update();
	});
}

CClassDiagram::~CClassDiagram()
{
	delete ui;
}

void CClassDiagram::Test()
{
	ui->btn_add_attribute->clicked();
	ui->btn_add_operation->clicked();
}

void CClassDiagram::paintEvent(QPaintEvent *)
{
	//qDebug() << "CClassDiagram::paintEvent. sizeHint: " << sizeHint() << rand();
	setFixedSize(sizeHint());
}

void CClassDiagram::mousePressEvent(QMouseEvent *event)
{
	if (event->button() & Qt::LeftButton)
		m_oldPos = event->pos();
}

void CClassDiagram::mouseMoveEvent(QMouseEvent *event)
{
	if (event->buttons() & Qt::LeftButton)
	{
		if (m_oldPos.x() == 0 && m_oldPos.y() == 0)
			return;
		QPoint orgPoint = this->pos();
		QPoint p = event->pos();
		move(orgPoint + p - m_oldPos);
	}
}

void CClassDiagram::mouseReleaseEvent(QMouseEvent *)
{
	m_oldPos = QPoint(0, 0);
}
