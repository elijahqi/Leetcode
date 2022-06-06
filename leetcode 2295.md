# Leetcode 2295 Replace Elements in an Array

Implement as description

```cpp
class Solution {
public:
    int id[1100000];
    vector<int> arrayChange(vector<int>& nums, vector<vector<int>>& operations) {
        for (int i=0;i<nums.size();++i) id[nums[i]]=i;
        for (int i=0;i<operations.size();++i){
            int pos=id[operations[i][0]];
            nums[pos]=operations[i][1];
            id[operations[i][1]]=pos;
        }
        return nums;
    }
};
```
