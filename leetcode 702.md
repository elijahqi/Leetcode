# Leetcode 702 Search in a Sorted Array of Unknown Size

给定未知长度的数组，然后要求同样做二分查找。
解题方法：首先使用倍增找到能够覆盖target的的右边界同时把旧有的右边界值赋值给左边界，然后在此2的阶乘次的空间内内做二分查找
```cpp
/**
 * // This is the ArrayReader's API interface.
 * // You should not implement it, or speculate about its implementation
 * class ArrayReader {
 *   public:
 *     int get(int index);
 * };
 */

class Solution {
public:
    int search(const ArrayReader& reader, int target) {
        int l=0,r=1;
        while(reader.get(r)<target){
            l=r;r<<=1;
        }
        int ret=-1;
        while(l<=r){
            int mid=(l+r)>>1;
            if (reader.get(mid)<target) {l=mid+1;continue;}
            if (reader.get(mid)>target) {r=mid-1;continue;}
            if (reader.get(mid)==target) {ret=mid;break;}
        }
        return ret;
    }
};
```
