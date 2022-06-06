# Leetcode 740 Delete and Earn

Dynamic programming, firstly count the total number according to the value.
Then use dynamic programming, if we want to use the value from i-1 then we should not use i.
If we want to use i then we can not use i-2
```cpp
class Solution {
public:
    int deleteAndEarn(vector<int>& nums) {
        int mn=INT_MAX,mx=INT_MIN;
        memset(sum,0,sizeof(sum));
        memset(dp,0,sizeof(dp));
        for (int i=0;i<nums.size();++i){
            sum[nums[i]]+=nums[i];
            mn=min(mn,nums[i]);
            mx=max(mx,nums[i]);
        }
        dp[mn]=sum[mn];
        for (int i=mn+1;i<=mx;++i){
            dp[i]=max(dp[i-1],dp[i-2]+sum[i]);
        }
        return dp[mx];
    }
private:
    int sum[11000],dp[11000];
};
```
