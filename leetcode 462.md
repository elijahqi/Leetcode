# Leetcode 462  Minimum Moves to Equal Array Elements II

Find the minimum steps to make all elements in vector to be balanced.
we can use nth_element to choose the middle one and then all the other change to this one.
```cpp
class Solution {
public:
    int minMoves2(vector<int>& nums) {
        nth_element(begin(nums),begin(nums)+nums.size()/2,end(nums));
        auto t=*(nums.begin()+nums.size()/2);
        int ret=0;
        for (int i=0;i<nums.size();++i){
            ret+=abs(nums[i]-t);
        }
        return ret;
    }
};
```
