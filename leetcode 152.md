# Leetcode 152 Maximum Product Subarray

Record two values one is the biggest, the other one is the smallest. THen these two will probabily construct the potential answer.
```cpp
class Solution {
public:
    int maxProduct(vector<int>& nums) {
        dp.resize(nums.size());
        int ret=INT_MIN;
        for (int i=0;i<nums.size();++i){
            dp[i]={nums[i],nums[i]};
            if (i){
                dp[i].first=max(dp[i].first,max(dp[i-1].first*nums[i],dp[i-1].second*nums[i]));
                dp[i].second=min(dp[i].second,min(dp[i-1].first*nums[i],dp[i-1].second*nums[i]));
            }
            ret=max(ret,dp[i].first);
        }
        return ret;
    }
private:
    vector<pair<int,int> >dp;
};
```
