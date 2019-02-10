class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let chars = s.lowercased().components(separatedBy: CharacterSet.alphanumerics.inverted).flatMap({ $0.characters })
        
        for i in 0..<chars.count/2 {
            if chars[i] != chars[chars.count-i-1] {
                return false
            }
        }
        
        return true
    }
}
