# Leetcode 11 Container With Most Water
The most plain and simple way is to directly enumerate all cases then the complexity is n^2.
Thus we need to apply the two pointers method.
We set the two pointers l and r. Then we come from the two faraway sides. The thing is in between two sides, we have the max length of width. 
Then we applied the greedy algorithm, if left hand is small then we will move left to the right to try to have a large answer.
If right is small then it's the same.

```cpp
class Solution {
public:
    int maxArea(vector<int>& height) {
        int ret=0,l=0,r=height.size()-1;
        while(l<r){
            int ht=min(height[l],height[r]);
            ret=max(ret,ht*(r-l));
            if (height[l]<height[r])++l;
            else --r;
        }
        return ret;
    }
};
```
