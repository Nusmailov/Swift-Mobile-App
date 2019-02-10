import UIKit


class Solution {
    func sortedSquares(_ v: [Int]) -> [Int] {
        var ans = [Int]();
        for i in v{
            ans.append(i*i)
        }
        ans.sort()
        return ans
    }
}
