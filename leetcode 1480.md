# Leetcode 1480 Running Sum of 1d Array

```cpp
class Solution {
public:
    vector<int> runningSum(vector<int>& nums) {
        vector<int> ret;int cnt=0;
        for (int i=0;i<nums.size();++i) cnt+=nums[i],ret.push_back(cnt);
        return ret;
    }
};
```
