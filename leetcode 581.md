# Leetcode 581 Shortest Unsorted Continuous Subarray

Greedy algorithm, if current location smaller than now max, then we must sort until this range.
Then use for loop to go back if our current location is bigger than min, then we must sort from this location
```cpp
class Solution {
public:
    int findUnsortedSubarray(vector<int>& nums) {
        int mx=INT_MIN,mn=INT_MAX;
        int lid=-1,rid=-1;
        for (int i=0;i<nums.size();++i){
            if (nums[i]>mx) mx=nums[i];
            if (nums[i]<mx) rid=i;
        }
        for (int i=nums.size()-1;~i;--i){
            if (nums[i]<mn) mn=nums[i];
            if (nums[i]>mn) lid=i;
        }
        if (lid==-1&&rid==-1) return 0;
        return rid-lid+1;
    }
};
```
