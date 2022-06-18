# Leetcode 55 Jump Game

Use loop to find all position, and if it's true then break;
And don't forget to initialize the first place.
```cpp
class Solution {
public:
    vector<bool> dp;
    bool canJump(vector<int>& nums) {
        dp.resize(nums.size()+1,false);
        dp[1]=true;
        for (int i=0;i<nums.size();++i){
            int p=i+1;
            if (!dp[p]) return false;
            if (p+nums[i]>=nums.size()) return true;
            for (int j=p+nums[i];j>p;--j){
                if (dp[j]==true) break;
                dp[j]=true;
            }
        }
        return dp[nums.size()];
    }
};
```
