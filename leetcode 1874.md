# Leetcode 1874 Minimize Product Sum of Two Arrays

There is a property such that use one big and one small from each of the array. Since we can not find any smaller method than this.

```cpp
class Solution {
public:
    int minProductSum(vector<int>& nums1, vector<int>& nums2) {
        sort(nums1.begin(),nums1.end());
        sort(nums2.begin(),nums2.end(),greater<int>());
        int ret=0;
        for (int i=0;i<nums1.size();++i){
            ret+=nums1[i]*nums2[i];
        }
        return ret;
    }
};
```
