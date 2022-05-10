# Leetcode 338 Counting Bits


When x is the odd number it will add 1 than x-1.
If x is even, then x will have the same number of 1s as the x>>1
```cpp
class Solution {
public:
    vector<int> countBits(int n) {
        ret.resize(n+1,0);
        for (int i=1;i<=n;++i){
            if(i&1) ret[i]=ret[i-1]+1;
            else ret[i]=ret[i>>1];
        }
        return ret;
    }
private:
    vector<int> ret;
};
```
