
#pragma once

#include "Luau/Lexer.h"
#include <string>
#include <vector>

using namespace Luau;

struct WhitespaceInfo {
    int newlines;
    int spaces;
    bool has_comments;
    std::string preserved_text;
};

class WhitespaceAnalyzer {
private:
    std::vector<WhitespaceInfo> whitespace_map;
    
public:
    WhitespaceAnalyzer();
    void analyzeSource(const std::string& source);
    WhitespaceInfo getWhitespace(const Location& location);
    bool shouldPreserveWhitespace(const Location& location);
    
    static std::string preserveImportantWhitespace(const std::string& original, const std::string& formatted);
};
