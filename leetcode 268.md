# Leetcode 268

```cpp
class Solution {
public:
    int missingNumber(vector<int>& nums) {
        vis.resize(nums.size()+10);
        for (int i=0;i<nums.size();++i) vis[nums[i]]=true;
        for (int i=0;i<=nums.size();++i) if (!vis[i]) return i;
        return 0;
    }
private:
    vector<bool> vis;
};
```
