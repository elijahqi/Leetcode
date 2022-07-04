# Leetcode 191 Number of 1 Bits


Convert interger to bitset.
Then use bitset's count to count the number of 1
```cpp
class Solution {
public:
    int hammingWeight(uint32_t n) {
        bitset<32> bt(n);
        return bt.count();
    }
};
```
