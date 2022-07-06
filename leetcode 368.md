# Leetcode 368 Largest Divisible Subset

```cpp
class Solution {
public:
    vector<int> largestDivisibleSubset(vector<int>& nums) {
        if (nums.size()==1) return {nums[0]};
        sort(begin(nums),end(nums));
        vector<int> dp(nums.size(),1);
        vector<int> pre(nums.size(),-1);
        for (int i=0;i<nums.size();++i){
            for (int j=0;j<i;++j){
                if (nums[i]%nums[j]==0) {
                    if ((dp[j]+1)>dp[i]) dp[i]=dp[j]+1,pre[i]=j;
                    
                }
            }
                
        }
        vector<int> ret;int mx=0,id=-1;
        for (int i=0;i<nums.size();++i){
            if (mx<dp[i]) mx=dp[i],id=i;
        }
        while(id!=-1){
            ret.push_back(nums[id]);
            id=pre[id];
        }
        return ret;
    }
};
```
