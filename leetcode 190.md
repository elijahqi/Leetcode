# Leetcode 190 Reverse Bits

convert it to bitset, then convert it to string.
Then convert it to integer.
```cpp
class Solution {
public:
    uint32_t reverseBits(uint32_t n) {
        bitset<32> bt(n);
        auto t=bt.to_string();
        reverse(begin(t),end(t));
        bitset<32> bt1(t);
        return bt1.to_ulong();
    }
};
```
