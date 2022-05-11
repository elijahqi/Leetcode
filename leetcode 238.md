# Leetcode 238 Product of Array Except Self
 Pay attention to the zero, they will cause problems.
```cpp
class Solution {
public:
    vector<int> productExceptSelf(vector<int>& nums) {
        int pro=1,num=0;
        for (int i=0;i<nums.size();++i) if (nums[i]) pro*=nums[i];else ++num;
        vector<int> ret;
        for (int i=0;i<nums.size();++i){
            if (!nums[i]){
                --num;
                if (!num) ret.push_back(pro);
                else ret.push_back(0);
                ++num;
                continue;
            }
            if (num) ret.push_back(0);
            else ret.push_back(pro/nums[i]);
        }
        return ret;
    }
};
```
