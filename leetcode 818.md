# Leetcode 818 Race Car
https://zxi.mytechroad.com/blog/searching/leetcode-818-race-car/

```cpp
class Solution {
private:
    vector<int> dp;
    int dfs(int target){
        if (dp[target]) return dp[target];
        int n=ceil(log2(target+1));
        if (1<<n==target+1) return dp[target]=n;
        dp[target]=n+1+dfs((1<<n)-1-target);
        for (int i=0;i<n-1;++i){
            int cur=(1<<(n-1))-(1<<i);
            //AA...ARA...AR (n-1A + 1R + mA + 1R) + dp(left) 
            dp[target]=min(dp[target],n+i+1+dfs(target-cur)); 
        }
        return dp[target];
    }
public:
    int racecar(int target) {
        dp.resize(target+1,0);
        return dfs(target);
    }
};
```
