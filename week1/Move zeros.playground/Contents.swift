class Solution {
    func moveZeroes(_ v: inout [Int]) {
        var ans = [Int]()
        var cnt = 0
        for i in 0..<v.count{
            if v[i] != 0 {
                ans.append(v[i])
            }
            if v[i] == 0{cnt+=1;}
            
        }
        for _ in 0..<cnt{
            ans.append(0);
        }
        v = ans;
    }
}
