# Leetcode 416 Partition Equal Subset Sum
Use dp to check whether we can sum up to a certain number.
If that certain number is equal to sum/2 then return true.
```cpp
class Solution {
public:
    int sum=0;
    bool canPartition(vector<int>& nums) {
        sum=accumulate(begin(nums),end(nums),0);
        if (sum&1) return false;
        vector<bool> dp(sum+1,false);
        dp[0]=true;
        
        for (auto num:nums){
            
            for (int i=sum-num;i>=0;--i){
                if (dp[i]) dp[i+num]=true;
            }
            if (dp[sum/2]) return true;
        }
        return false;
    }
};
```
