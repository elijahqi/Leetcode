# Leetcode 2305 Fair Distribution of Cookies

DFS+ branch
```cpp
class Solution {
public:
    vector<vector<int> >kc;
    int nn;int ret=INT_MAX;
    int kk;
    bool promising(){
        int trash=0;int mn=INT_MIN;
        for (int i=0;i<kk;++i) {
            mn=max(mn,accumulate(kc[i].begin(),kc[i].end(),trash));
            if (mn>=ret) return false;
        }
        return true;
    }
    void dfs(int x,vector<int>&cookies){
        if (x==nn){
            int mn=INT_MIN;
            int trash=0;
            for (int i=0;i<kk;++i) mn=max(mn,accumulate(kc[i].begin(),kc[i].end(),trash));
            ret=min(ret,mn);
            return;
        }
        if (!promising()) return;
        for (int i=0;i<kk;++i){
            kc[i].push_back(cookies[x]);
            dfs(x+1,cookies);
            kc[i].pop_back();
        }
    }
    int distributeCookies(vector<int>& cookies, int k) {
        kc.resize(k,vector<int>());
        kk=k;
        nn=cookies.size();
        dfs(0,cookies);
        return ret;
    }
};
```
