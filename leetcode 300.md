# Leetcode 300 Longest Increasing Subsequence

Clasical Dynamic programming
Time complexity O(n^2)
```cpp
class Solution {
public:
    int lengthOfLIS(vector<int>& nums) {
        dp.resize(nums.size(),1);
        for (int i=0;i<nums.size();++i)
            for (int j=0;j<i;++j)
                if (nums[i]>nums[j]) dp[i]=max(dp[i],dp[j]+1);
        int ret=0;
        for (int i=0;i<nums.size();++i) ret=max(ret,dp[i]);
        return ret;
    }
private:
    vector<int> dp;
};
```

