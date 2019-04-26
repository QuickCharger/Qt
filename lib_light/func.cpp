#include <string>
#include <vector>
#include "func.h"

void Split(const std::string &src, char delim, std::vector<std::string>& dsts, bool rep)
{
	std::string buf;
	size_t i = 0;
	while (i < src.length()) {
		if (src[i] != delim)
			buf += src[i];
		else if (rep == 1) {
			dsts.push_back(buf.c_str());
			buf.clear();
		}
		else if (buf.length() > 0) {
			dsts.push_back(buf.c_str());
			buf.clear();
		}
		i++;
	}
	if (!buf.empty())
		dsts.push_back(buf.c_str());
}

std::string Truncate(const std::string& a_strSource, const char *a_pCh)
{
	std::string str(a_strSource, 0, a_strSource.find_last_of(a_pCh));
	return str;
}

std::string getRandom()
{
	std::string str;
	const static char *pCh = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
	for (int i = 0; i < 15; ++i)
	{
		str += *(pCh + rand() % strlen(pCh));
	}
	return str;
}

std::string toStr(int i)
{
	char ch[32];
	memset(ch, 0, 32);
	sprintf(ch, "%d", i);
	return ch;
}
