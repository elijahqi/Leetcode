# Leetcode 287 Find the Duplicate Number
Two methods, we can assume each place will project to other places, then we can apply fast-slow pointer to find whether there exist a loop.
Second method is let the array to be sorted, and use binary search to seach.
```cpp
class Solution {
public:
    int findDuplicate(vector<int>& nums) {
        sort(begin(nums),end(nums));
        int ret=0;
        for (int i=0;i<nums.size()-1;++i){
            auto it=lower_bound(nums.begin()+i+1,nums.end(),nums[i]);
            if (it==nums.end()) continue;
            if (*it==nums[i]) return nums[i];
            
        }
        return ret;
    }
};
```


method 3:

```cpp
class Solution {
public:
    int findDuplicate(vector<int>& nums) {
        sort(begin(nums),end(nums));
        int ret=0;
        for (int i=0;i<nums.size()-1;++i){
            if ((i+1)<nums.size()&&nums[i]==nums[i+1]) return nums[i];
            
        }
        return ret;
    }
};s
```
