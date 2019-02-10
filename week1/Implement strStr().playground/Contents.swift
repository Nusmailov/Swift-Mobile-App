class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if needle.isEmpty{return 0}
        let haystackLen = haystack.count
        let needleLen = needle.count
        if haystackLen < needleLen{return -1}
        let firstChar = needle[needle.startIndex]
        for i in 0...haystackLen-needleLen
        {
            let firstIndex = haystack.index(haystack.startIndex, offsetBy: i)
            let endIndex = haystack.index(haystack.startIndex, offsetBy: i + needleLen)
            let subStr = haystack[firstIndex..<endIndex]
            if subStr == needle
            {
                return i
            }
        }
        return -1
    }
}
