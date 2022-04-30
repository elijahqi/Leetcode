# leetcode 27 

We set l and r these two pointers, and we will always move r. The l will only be moved by nums[r]!=value, then we will assign r to the left.

```cpp
class Solution {
public:
    int removeElement(vector<int>& nums, int val) {
        int l=0,r=0,n=nums.size();
        for (;l<n&&r<n;++r){
            if (nums[r]==val) continue;
            nums[l++]=nums[r];
        }
        return l;
    }
};
```
