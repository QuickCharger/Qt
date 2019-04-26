#pragma once

#include <string>
#include <string.h>
#include <vector>

void Split(const std::string &src, char delim, std::vector<std::string>& dsts, bool rep = false);

std::string Truncate(const std::string& a_strSource, const char *a_pCh);

std::string getRandom();

std::string toStr(int i);
