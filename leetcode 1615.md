# Leetcode 1615 

Check all the pairs and find the maximum number of pairs.
```cpp
class Solution {
private:
    vector<vector<int> >G;
    
public:
    int maximalNetworkRank(int n, vector<vector<int>>& roads) {
        G.resize(n);
        int ret=0;
        vector<int> in(n,0);
        for (auto &r:roads)
            G[r[0]].push_back(r[1]),G[r[1]].push_back(r[0]),in[r[1]]++,in[r[0]]++;
        
        int mx=-1,id=-1;
        for (int i=0;i<n;++i){
            for (int y:G[i]) in[y]--;
            for (int j=0;j<n;++j){
                if (i==j) continue;
                ret=max(ret,in[i]+in[j]);
            }
            for (int y:G[i]) ++in[y];
        }
        return ret;
        
    }
};
```
