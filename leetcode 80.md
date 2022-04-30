# Leetcode 80 Remove Duplicates from Sorted Array II

it's similar to the removed duplicates from sorted array, but only keep two if duplicated exist

```cpp
class Solution {
public:
    int removeDuplicates(vector<int>& nums) {
        int n=nums.size();
        if (n<=2) return n;int count=1;
        int id=1,len=1,last=nums[0];
        while(id<n){
            count=1;
            while(id<n&&nums[id]==last){
                ++count,++id;
            }
            if (count>=2)nums[len++]=last;
            if (id<n){
                last=nums[id++];
                nums[len++]=last;
            }
        }
        return len;
    }
};
```
