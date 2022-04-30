# leetcode 26 Remove Duplicates from Sorted Array

We set two pointers l,r and update only if l != r

```cpp
class Solution {
public:
    int removeDuplicates(vector<int>& nums) {
        int l=0,r=0,n=nums.size();  
        for (;l<n&&r<n;++r){
            if (nums[l]==nums[r]) continue;
            nums[++l]=nums[r];
        }
        return l+1;
    }
};
```
