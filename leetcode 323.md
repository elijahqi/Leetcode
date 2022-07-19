# Leetcode 323 Number of Connected Components in an Undirected Graph

Union find+unordered_set to find the connected sub_graph
```cpp
class Solution {
private:
    vector<int> fa;
    int find(int x){
        while(x!=fa[x]) x=fa[x]=fa[fa[x]];
        return x;
    }
    void merge(int x,int y){
        int xx=find(x),yy=find(y);
        if (xx!=yy){
            fa[yy]=xx;
        }
    }
public:
    int countComponents(int n, vector<vector<int>>& edges) {
        fa.resize(n);
        for (int i=0;i<n;++i) fa[i]=i;
        for (auto &e:edges) merge(e[0],e[1]);
        unordered_set<int>s;
        for (int i=0;i<n;++i) s.insert(find(i));
        return s.size();
    }
};
```
