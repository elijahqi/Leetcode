# Leetcode 1806 Minimum Number of Operations to Reinitialize a Permutation

Construct all the path from each element to other element.
Take 1 as an example and go from 1 until we encounter 1 again.

```cpp
class Solution {
public:
    int reinitializePermutation(int n) {
        vector<int> G(n,0);
        for (int i=0;i<n;++i) G[i]=i%2==0?i/2:(i-1)/2+n/2;
        int ret=1,cur=G[1];
        while(cur!=1){
            ++ret;cur=G[cur];
        }
        return ret;
    }
};
```
