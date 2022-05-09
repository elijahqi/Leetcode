# Leetcode 442 Find All Duplicates in an Array

The range of n is not huge, then I decide to use array directly.
If the value exist more than twice then I will skip the for loop

```cpp
class Solution {
public:
    vector<int> findDuplicates(vector<int>& nums) {
        vector<int> ret;
        for (int i=0;i<nums.size();++i){
            if (num[nums[i]]>1) continue;
            ++num[nums[i]];
            if (num[nums[i]]>1) ret.push_back(nums[i]);
        }
        return ret;
    }
private:
    int num[110000];
};
```
