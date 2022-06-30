# Leetcode 162 Find Peak Element

Use binary search or linear search find the peak point

Solution 1
```cpp
class Solution {
public:
    int findPeakElement(vector<int>& nums) {
        if (nums.size()==1) return 0;
        for (int i=1;i<nums.size();++i){
            if (nums[i]<nums[i-1]) return i-1;
        }
        return nums.size()-1;
    }
};
```


Solution2

```cpp
class Solution {
public:
    int findPeakElement(vector<int>& nums) {
        int l=0,r=nums.size()-1;
        while(l<r){
            int mid=(l+r)>>1;
            if (nums[mid]>nums[mid+1]) r=mid;
            else l=mid+1;
        }
        return l;
    }
};
```
