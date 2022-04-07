# Leetcode 33 Search in Rotated Sorted Array

相当于是有两端上升序列，然后就在二分的时候增加一重判断如果发现mid比搜索的左右边界的值不同了，说明当前的左右边界应该是横跨了错乱的顺序 所以应该调整

```cpp
class Solution {
public:
    int search(vector<int>& nums, int target) {
        if (nums[0]==target) return 0;
        int l=0,r=nums.size()-1;
        while(l<r){
            int mid=(l+r)>>1;
            if (nums[mid]==target) return mid;
            if (nums[l]==target) return l;
            if (nums[r]==target) return r;
            if (nums[mid]>nums[l]){
                if (nums[mid]<target) l=mid+1;
                else if (nums[l]<target) r=mid-1;
                else l=mid+1;
            }else{
                if(target>nums[mid]){
                    if (target<nums[r]) l=mid+1;
                    else r=mid-1;
                    
                }else r=mid-1;
            }
            
        }
        return -1;
    }
};
```
