# Leetcode 724

Firstly add all to right part, and then use for loop to judge whether each part can be the answer.
```cpp
class Solution {
public:
    int pivotIndex(vector<int>& nums) {
        int suml=0,sumr=0;
        for (auto i:nums) sumr+=i;
        for (int i=0;i<nums.size();++i){
            sumr-=nums[i];
            if (suml==sumr) return i;
            suml+=nums[i];
        }
        return -1;
    }
};
```
