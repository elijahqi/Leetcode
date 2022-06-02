# Leetcode 1748 Sum of Unique Elements

```cpp
class Solution {
public:
    int sumOfUnique(vector<int>& nums) {
        for (int i=0;i<nums.size();++i) ++mp[nums[i]];
        int ret=0;
        for (auto &i:mp){
            if (i.second>1) continue;
            ret+=i.first;
        }
        return ret;
    }
private:
    unordered_map<int,int> mp;
};
```
