# Leetcode 547 

Use union find, and the edges are given by matrix.
Then we go though all the points, and check whether they are connected.

```cpp
class Solution {
public:
    int findCircleNum(vector<vector<int>>& isConnected) {
        fa.resize(isConnected.size()+10);
        vis.resize(isConnected.size()+10,false);
        for (int i=0;i<isConnected.size();++i) fa[i]=i;
        for (int i=0;i<isConnected.size();++i){
            for (int j=0;j<isConnected.size();++j){
                if (isConnected[i][j]) meg(i,j);
            }
        }
        int ret=0;
        for (int i=0;i<isConnected.size();++i) {
            if (!vis[find(i)]){
                vis[find(i)]=true;
                ++ret;
            }
        }
        return ret;
    }
private:
    vector<int> fa;
    vector<bool> vis;
    int find(int x){
        while(x!=fa[x]) x=fa[x]=fa[fa[x]];
        return x;
    }
    void meg(int a,int b){
        int x=find(a),y=find(b);
        if (x!=y) fa[y]=x;
    }
};
```
