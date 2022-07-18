# Leetcode 1822 Sign of the Product of an Array


```cpp
class Solution {
public:
    int arraySign(vector<int>& nums) {
        bool flag=false;
        int cnt=0;
        for (int i=0;i<nums.size();++i){
            if(nums[i]==0) {flag=true;break;}
            if (nums[i]<0) ++cnt;
            
        }
        if (flag) return 0;
        return cnt%2?-1:1;
    }
};
```
