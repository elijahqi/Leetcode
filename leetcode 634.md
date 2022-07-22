# Leetcode 634 Find the Derangement of An Array

n can be placed at n-1's places if n-1 array is already satisfy the requirements.
Also if n-2 array is already satisfy the requirements. Then we can assign i (n-1) opportunities to swap with n.
```cpp
class Solution {
private:
    const int mod=1e9+7;
public:
    int findDerangement(int n) {
        vector<int> dp(n+1,0);
        dp[0]=1;
        dp[1]=0;
        for (int i=2;i<=n;++i){
            dp[i]=(long long)(i-1)*(dp[i-1]+dp[i-2])%mod;
        }
        return dp[n];
    }
};
```
