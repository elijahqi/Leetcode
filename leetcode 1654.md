# Leetcode 1654 Minimum Jumps to Reach Home

Use BFS to find the minimum route, the vis should be distributed to two directions.
```cpp
class Solution {
public:
    int minimumJumps(vector<int>& forbidden, int a, int b, int x) {
        if (!x) return 0;
        unordered_map<int,int> mp;
        unordered_map<int,int > vis[2];
        int mx=0;
        for (int i:forbidden) mx=max(mx,i),mp[i]++;
        mx=max(mx,a);mx=max(mx,b);mx=max(mx,x);
        int ret=0;
        queue<pair<int,int> >q; q.push({0,0});
        while(!q.empty()){
            int sz=q.size();++ret;
            for (int i=0;i<sz;++i){
                int cur=q.front().first;
                int dir=q.front().second;
                q.pop();
                int y=cur+a;
                if (!mp.count(y)){
                    if (y<=mx*2+b) {
                        if (!vis[0][y]) {
                            if (y==x) return ret;
                            vis[0][y]=1;
                            q.push({y,1});
                        }
                    }
                } 
                if (dir==-1) continue;
                y=cur-b;
                if (y<0) continue;
                if (mp.count(y)) continue;
                if (vis[1][y]) continue;
                if (y==x) return ret;
                vis[1][y]=1;
                q.push({y,-1});
            }
        }
        return -1;
        
    }
};
```
