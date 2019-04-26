#include "CBuffer.h"
#include <stdlib.h>
#include <string.h>

CBuffer::CBuffer()
{
	Init();
}

CBuffer::CBuffer(int a_nBufferSize)
	: m_nBufferSize(a_nBufferSize)
{
	Init();
}

CBuffer::~CBuffer()
{
	if (m_pBuffer != nullptr)
	{
		delete[]m_pBuffer;
	}
}

void CBuffer::Init()
{
	if (m_pBuffer)
	{
		delete m_pBuffer;
	}
	m_nCurrentSize = 0;
	m_nCurrentPoint = 0;

	if (m_nBufferSize <= 0)
	{
		return;
	}

	m_pBuffer = new char[m_nBufferSize];
	if (m_pBuffer == nullptr)
	{
		return;
	}
}

void CBuffer::ReInit(int a_nBufferSize)
{
	m_nBufferSize = a_nBufferSize;
	Init();
}

bool CBuffer::Append(const char* a_pData, int a_size)
{
	if ((m_nCurrentSize + a_size) > m_nBufferSize)
	{
		SetErr("over Size.");
		return false;
	}
	if ((m_nCurrentPoint + m_nCurrentSize + a_size) > m_nBufferSize)
	{
		arrange();
	}
	memcpy(m_pBuffer + m_nCurrentPoint + m_nCurrentSize, a_pData, a_size);
	m_nCurrentSize += a_size;
	return true;
}

void CBuffer::DropFront(int a_nSize)
{
	if (a_nSize >= m_nCurrentSize)
	{
		m_nCurrentPoint = 0;
		m_nCurrentSize = 0;
		return;
	}
	m_nCurrentPoint += a_nSize;
	m_nCurrentSize -= a_nSize;
}

void CBuffer::DropBack(int a_nSize)
{
	if (a_nSize >= m_nCurrentSize)
	{
		m_nCurrentPoint = 0;
		m_nCurrentSize = 0;
	}
	m_nCurrentSize -= a_nSize;
}

void CBuffer::GetBuffer(char *&p, int& n)
{
	p = m_pBuffer + m_nCurrentPoint;
	n = m_nCurrentSize;
}

int CBuffer::Size()
{
	return m_nCurrentSize;
}

void CBuffer::Test()
{
	m_nBufferSize = 16;
	Init();
	this->Append("1234567890", 10);
	this->Append("1234", 4);
	this->Append("1234567890", 10);
	char *p = nullptr;
	int n = 0;
	GetBuffer(p, n);
	DropFront(8);
	GetBuffer(p, n);
	this->Append("12345", 5);
	this->Append("12345", 5);
	this->Append("12345", 5);
	DropFront(20);

	Init();
	this->Append("12345678901234567890",20);
	this->Append("1", 1);
	GetBuffer(p, n);
	DropFront(100);

	//DropBack(100);
}

void CBuffer::arrange()
{
	char *p = new char[m_nCurrentSize];
	memcpy(p, m_pBuffer + m_nCurrentPoint,m_nCurrentSize);
	memcpy(m_pBuffer, p, m_nCurrentSize);
	m_nCurrentPoint = 0;
	delete p;
}
