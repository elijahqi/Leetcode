# Leetcode 2322 Minimum Score After Removals on a Tree

Solution 1: two times DFS, recored the xorsum of each subtree. Also for each child, I record their father that's easier to check whether two of the edges are in the same subtree.
Thirdly, use O(n^2) to loop for every possible combinations.
```cpp
class Solution {
public:
    vector<unordered_set<int> >fa; 
    vector<bool> vis;
    vector<vector<int> >G;
    vector<int> dep;
    vector<int> xors;
    int sum;
    int minimumScore(vector<int>& nums, vector<vector<int>>& edges) {
        G.resize(nums.size());
        xors.resize(nums.size());
        dep.resize(nums.size(),0);
        fa.resize(nums.size());
        vis.resize(nums.size(),false);
        for (int i=0;i<edges.size();++i) G[edges[i][0]].push_back(edges[i][1]),G[edges[i][1]].push_back(edges[i][0]);
        
        unordered_set<int>s;
        dfs(0,s,0,nums);
        int ret=INT_MAX,sum=xors[0];
        for (int i=0;i<edges.size();++i){
            for (int j=i+1;j<edges.size();++j){
                if (dep[edges[i][0]]>dep[edges[i][1]]) swap(edges[i][0],edges[i][1]);
                if (dep[edges[j][0]]>dep[edges[j][1]]) swap(edges[j][0],edges[j][1]);
                int a=edges[i][0],b=edges[i][1];
                int c=edges[j][0],d=edges[j][1];
                if (dep[b]>dep[d]) swap(a,c),swap(b,d);
                auto find_it=fa[d].find(b);
                if (find_it==fa[d].end()){
                    int ans1=sum^xors[b]^xors[d];
                    int mx=max(ans1,max(xors[b],xors[d]));
                    int mn=min(ans1,min(xors[b],xors[d]));
                    ret=min(ret,mx-mn);
                }else{
                    int ans1=sum^xors[b];
                    int ans2=xors[b]^xors[d];
                    int ans3=xors[d];
                    int mx=max(ans1,max(ans2,ans3));
                    int mn=min(ans1,min(ans2,ans3));
                    ret=min(ret,mx-mn);
                }
            }
            
        }
        return ret;
    }
    void dfs(int x,unordered_set<int> &s,int d,vector<int> &nums){
        fa[x]=s;vis[x]=true;dep[x]=d;
        s.insert(x);xors[x]=nums[x];
        for (int i=0;i<G[x].size();++i){
            int y=G[x][i];
            if(vis[y]) continue;
            dfs(y,s,d+1,nums);
            xors[x]^=xors[y];
        }
        s.erase(x);
    }
};
```

