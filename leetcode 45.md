# Leetcode 45 Jump Game II


Greedy Algorithm.let's have near and far.
Inbetween near and far, we can update far without update the steps that we have to jump.
And if current is greater than near(since if greater than), then we should update the near to current "far", and continue to update the far.

```cpp
class Solution {
public:
    int jump(vector<int>& nums) {
        int ret=0;
        int near=0,far=0;
        for (int i=0;i<nums.size();++i){
            if(i>near){
                ++ret;near=far;
            }
            far=max(far,i+nums[i]);
        }
        return ret;
    }
};
```
