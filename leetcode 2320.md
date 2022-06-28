# Leetcode 2320 Count Number of Ways to Place Houses


Use Dynamic Programming, we only consider current place. This position we can place house or not. Thus the total number will be sum of previous two.
```cpp
const int mod=1e9+7;
class Solution {
public:
    int countHousePlacements(int n) {
        n=n+2;
        int pre1=1,pre2=1;
        for (int i=3;i<=n;++i){
            auto t=pre1+pre2;
            t%=mod;
            pre1=pre2;
            pre2=t;
        }
        return (long long) pre2*pre2%mod;
    }
};
```
