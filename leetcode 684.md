# Leetcode 684 Redundant Connection

This question only requires us to find the last edge to construct a circle. Thus we can use union find data structure.
```cpp
class Solution {
private:
    vector<int> fa;
    int find(int x){
        while(x!=fa[x]) x=fa[x]=fa[fa[x]];
        return x;
    }
public:
    vector<int> findRedundantConnection(vector<vector<int>>& edges) {
        fa.resize(edges.size()+1,0);
        for (int i=1;i<=edges.size();++i) fa[i]=i;
        vector<int> ret;
        for (auto &e:edges){
            auto x=find(e[0]),y=find(e[1]);
            if (x==y){
                
                ret.push_back(e[0]);
                ret.push_back(e[1]);
                return ret;
            }
            fa[y]=x;
        }
        return ret;
    }
};
```
