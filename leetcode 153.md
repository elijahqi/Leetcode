# Leetcode 153

Use Binary search, we divide the interval to [1->mid-1], [mid->r].
Thus the minimum. Since we will go out of the while loop if mid be the first place that not satisfy the requirement. Thus l will be the answer.
```cpp
class Solution {
public:
    int findMin(vector<int>& nums) {
        int l=0,r=nums.size()-1,mid;
        while(l<r){
            mid=l+r>>1;
            if (nums[mid]>nums[r]) l=mid+1;
            else r=mid;
        }
        return nums[l];
    }
};
```
