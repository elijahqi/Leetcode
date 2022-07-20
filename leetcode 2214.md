# Leetcode 2214 Minimum Health to Beat Game


```cpp
class Solution {
public:
    long long minimumHealth(vector<int>& damage, int armor) {
        long long ret=1;
        int mx=0;
        for (int i=0;i<damage.size();++i) mx=max(mx,damage[i]),ret+=damage[i];
        return ret-min(mx,armor);
        
    }
};
```
