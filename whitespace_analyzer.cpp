
#include "whitespace_analyzer.hpp"
#include <algorithm>

WhitespaceAnalyzer::WhitespaceAnalyzer() {}

void WhitespaceAnalyzer::analyzeSource(const std::string& source) {
    // Simple whitespace analysis
    // In a real implementation, this would work with the lexer to map whitespace
    whitespace_map.clear();
    
    // Basic line-by-line analysis
    size_t pos = 0;
    int line = 1;
    
    while (pos < source.length()) {
        WhitespaceInfo info = {0, 0, false, ""};
        
        // Count leading whitespace
        while (pos < source.length() && (source[pos] == ' ' || source[pos] == '\t')) {
            if (source[pos] == ' ') info.spaces++;
            pos++;
        }
        
        // Count newlines
        while (pos < source.length() && source[pos] == '\n') {
            info.newlines++;
            pos++;
            line++;
        }
        
        // Check for comments
        if (pos < source.length() - 1 && source[pos] == '-' && source[pos + 1] == '-') {
            info.has_comments = true;
            // Skip to end of line
            while (pos < source.length() && source[pos] != '\n') {
                info.preserved_text += source[pos];
                pos++;
            }
        } else if (pos < source.length()) {
            pos++; // Skip regular character
        }
        
        whitespace_map.push_back(info);
    }
}

WhitespaceInfo WhitespaceAnalyzer::getWhitespace(const Location& location) {
    if (location.begin.line < 1 || location.begin.line > static_cast<int>(whitespace_map.size())) {
        return {0, 0, false, ""};
    }
    return whitespace_map[location.begin.line - 1];
}

bool WhitespaceAnalyzer::shouldPreserveWhitespace(const Location& location) {
    WhitespaceInfo info = getWhitespace(location);
    return info.newlines > 1 || info.has_comments; // Preserve double newlines and comments
}

std::string WhitespaceAnalyzer::preserveImportantWhitespace(const std::string& original, const std::string& formatted) {
    // Simple implementation - preserve double newlines
    std::string result = formatted;
    
    // Replace single newlines with double where appropriate
    // This is a simplified version - real implementation would be more sophisticated
    size_t pos = 0;
    while ((pos = result.find("\n\n\n", pos)) != std::string::npos) {
        result.replace(pos, 3, "\n\n"); // Replace triple with double
        pos += 2;
    }
    
    return result;
}
