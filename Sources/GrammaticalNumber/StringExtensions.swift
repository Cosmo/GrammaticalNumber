import Foundation

extension String {
    private func prependCount(_ count: Int?) -> String {
        guard let count = count else { return self }
        return [String(count), self].joined(separator: " ")
    }
    
    func pluralized(count: Int? = nil, language: String = GrammaticalNumberRule.defaultLanguage) -> String {
        var word = self
        
        if count == 1 {
            return word.prependCount(count)
        }
        
        guard let rules = GrammaticalNumberRule.rules[language] else {
            return word.prependCount(count)
        }
        
        guard let rule = (rules.reversed().first { grammaticalNumberRule -> Bool in
            switch grammaticalNumberRule {
            case .uncountable(let rule), .irregular(let rule, _):
                return self.lowercased().contains(rule.lowercased())
            case .plural(let rule, _):
                return self.range(of: rule, options: [.regularExpression, .caseInsensitive], range: nil, locale: nil) != nil
            default: return false
            }
        }) else {
            return word.prependCount(count)
        }
        
        switch rule {
        case .irregular(let rule, let replacement), .plural(let rule, let replacement):
            word = word.replacingOccurrences(of: rule, with: replacement, options: [.regularExpression, .caseInsensitive])
        default: break
        }
        
        return word.prependCount(count)
    }
    
    func singularized(language: String = GrammaticalNumberRule.defaultLanguage) -> String {
        guard let rules = GrammaticalNumberRule.rules[language] else {
            return self
        }
        
        guard let rule = (rules.reversed().first { grammaticalNumberRule -> Bool in
            switch grammaticalNumberRule {
            case .uncountable(let rule), .irregular(_, let rule):
                return self.lowercased().contains(rule.lowercased())
            case .singular(let rule, _):
                return self.range(of: rule, options: [.regularExpression, .caseInsensitive], range: nil, locale: nil) != nil
            default: return false
            }
        }) else {
            return self
        }
        
        switch rule {
        case .irregular(let replacement, let rule), .singular(let rule, let replacement):
            return self.replacingOccurrences(of: rule, with: replacement, options: [.regularExpression, .caseInsensitive])
        default:
            return self
        }
    }
}
