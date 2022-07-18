# Leetcode 1304 Find N Unique Integers Sum up to Zero


```cpp
class Solution {
public:
    vector<int> sumZero(int n) {
        vector<int> ret;
        if (!n) {
            ret.push_back(0);
            return ret;
        }
       
        for (int i=1;i<=n/2;++i) {
            ret.push_back(i);
            ret.push_back(-i);
        }
        if (n%2) ret.push_back(0);
        return ret;
        
    }
};
```
