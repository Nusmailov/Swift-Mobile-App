class Solution {
    func arrayPairSum(_ A: [Int]) -> Int {
        var v = A;
        v.sort();
        for i in 0..<v.count/2{
            v.swapAt(i,v.count-i-1);
        }
        var ans = 0
        for i in stride(from: 0, to: v.count, by: 2){
            ans += min(v[i],v[i+1])
        }
        return ans;
    }
}
