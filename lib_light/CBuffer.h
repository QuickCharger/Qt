#pragma once

#include "ErrRecord.h"

/*
* no overflow judge
*/
class CBuffer : public CErrRecord
{
public:
	CBuffer();
	CBuffer(int a_nBufferSize);
	virtual ~CBuffer();
	void Init();
	void ReInit(int a_nBufferSize);
	bool Append(const char* a_pData, int a_size);
	void DropFront(int a_nSize);
	void DropBack(int a_nSize);
	void GetBuffer(char *&p, int& n);
	int  Size();
	void Test();

private:
	void arrange();

private:
	char *m_pBuffer = nullptr;
	int m_nBufferSize = 102400;
	int m_nCurrentSize = 0;
	int m_nCurrentPoint = 0;
};
