# Leetcode 1465 Maximum Area of a Piece of Cake After Horizontal and Vertical Cuts
Greedy use sort to sort the arrays
```cpp
class Solution {
    const int mod=1e9+7;
public:
    int maxArea(int h, int w, vector<int>& horizontalCuts, vector<int>& verticalCuts) {
        sort(begin(horizontalCuts),end(horizontalCuts));
        sort(begin(verticalCuts),end(verticalCuts));
        vector<int> ht;
        vector<int> vt;
        ht.push_back(horizontalCuts[0]);
        vt.push_back(verticalCuts[0]);
        for (int i=1;i<horizontalCuts.size();++i) {
            ht.push_back(horizontalCuts[i]-horizontalCuts[i-1]);
        }
        for (int i=1;i<verticalCuts.size();++i) {
            vt.push_back(verticalCuts[i]-verticalCuts[i-1]);
        }
        ht.push_back(h-horizontalCuts.back());
        vt.push_back(w-verticalCuts.back());
        sort(begin(ht),end(ht),greater<int>());
        sort(begin(vt),end(vt),greater<int>());
        long long ret=0;
        for (int i=0;i<ht.size()&&i<vt.size();++i){
            ret=max(ret,((long long)ht[i]*vt[i]));
        }
        return ret%mod;
    }
};
```
