# Leetcode 453 Minimum Moves to Equal Array Elements
S + (n – 1) * m = x * n
min + m = x
We got: m = S – n * min
```cpp
class Solution {
public:
    int minMoves(vector<int>& nums) {
        auto t=*min_element(begin(nums),end(nums));
        int ret=0;
        for (auto i:nums) ret+=i;
        return ret-t*nums.size();
    }
};
```
