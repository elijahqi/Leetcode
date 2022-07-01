# Leetcode 326 Power of Three

```cpp
class Solution {
public:
    bool isPowerOfThree(int n) {
        long long x=1;
        while(x<=n){
            if (x==n) return true;
            x*=3;
        }
        return false;
    }
};
```
