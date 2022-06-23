# Leetcode 673 Number of Longest Increasing Subsequence
Add an array cnt to count the total number that that can reach current dp value.
For the last counting procedure, we should comply to if current dp value is equal to the current max value, we should sum them up.
```cpp
class Solution {
public:
    int findNumberOfLIS(vector<int>& nums) {
        int n=nums.size();
        vector<int> dp(n,0),cnt(n,0);
        for (int i=0;i<n;++i){
            dp[i]=cnt[i]=1;
            for (int j=0;j<i;++j){
                if (nums[j]<nums[i]){
                    int t=dp[j]+1;
                    if(t==dp[i]) cnt[i]+=cnt[j];
                    else if (t>dp[i]){
                        dp[i]=t;cnt[i]=cnt[j];
                    }
                }
            }
        }
        int mx=INT_MIN,ret=0;
        for (int i=0;i<n;++i) if (dp[i]>mx) mx=dp[i],ret=cnt[i];
        else if (dp[i]==mx) ret+=cnt[i];
        return ret;
    }
};
```
