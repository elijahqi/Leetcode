# Leetcode 1696 Jump Game VI

Use monotone stack, since we only need the largest value from previous dp value, then add nums[i-1]
```cpp
class Solution {
public:
    int maxResult(vector<int>& nums, int k) {
        vector<int> dp(nums.size()+1,-0x7f7f7f7f);
        dp[1]=nums[0];
        deque<pair<int,int> >q;
        q.push_back(make_pair(dp[1],1));
        for (int i=2;i<=nums.size();++i){
            auto t=q.front();
            while(!q.empty()&&(i-q.front().second>k)) q.pop_front();
            dp[i]=q.front().first+nums[i-1];
            while(!q.empty()&&dp[i]>=q.back().first) q.pop_back();
            q.push_back(make_pair(dp[i],i));
        }
        return dp[nums.size()];
    }
};
```
