# Leetcode 137 Single Number II


Since this time we can divide the interger into two-bits to deal with them.
Then we do the for loop from 2^31 to 2^0 to check. Since every time every interger will appear for three times except one will only appear once.
Thus we %3 and use or operation to add to the final returned value.
```cpp
class Solution {
public:
    int singleNumber(vector<int>& nums) {
        int ret=0;
        for (int i=0;i<32;++i){
            int tp=1<<i;
            int tmp=0;
            for (int j=0;j<nums.size();++j) if(nums[j]&tp) ++tmp;
            tmp%=3;
            if (tmp) ret|=tp;
        }
        return ret;
    }
};
```
