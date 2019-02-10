import UIKit

class Solution {
    func sortArrayByParity(_ A: [Int]) -> [Int] {
        var ans = [Int]()
        for i in A{
            if i%2==0{
                ans.append(i)
            }
        }
        for i in A{
            if i%2==1{
                ans.append(i)
            }
        }
        return ans
    }
}
