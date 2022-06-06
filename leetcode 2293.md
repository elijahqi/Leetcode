# Leetcode 2293 Min Max Game

```cpp
class Solution {
public:
    int minMaxGame(vector<int>& nums) {
        vector<vector<int> > ret(12,vector<int>());
        int sz=nums.size()/2;int tot=0;
        ret[tot++]=nums;
        while(sz){
            for (int i=0;i<sz;++i) {
                if (i&1) ret[tot].push_back(max(ret[tot-1][2*i],ret[tot-1][2*i+1]));
                else ret[tot].push_back(min(ret[tot-1][2*i],ret[tot-1][2*i+1]));
            }
            sz>>=1;++tot;
        }
        return ret[tot-1][0];
    }

    
};
```
