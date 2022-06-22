# Leetcode 743 Network Delay Time
Dijkstra, remember priority queue' default setting is big root heap
```cpp
class Solution {
public:
    vector<vector<pair<int,int> > >G;
    int networkDelayTime(vector<vector<int>>& times, int n, int k) {
        --k;
        G.resize(n);
        for (int i=0;i<times.size();++i) G[times[i][0]-1].push_back(make_pair(times[i][1],times[i][2]));
        vector<int> dis(n,INT_MAX);
        vector<bool> vis(n,false);
        dis[k]=0;
        priority_queue<pair<int,int>,vector<pair<int,int> >,greater<pair<int,int> > >q;
        q.push(make_pair(dis[k],k));
        while(!q.empty()){
            auto t=q.top();q.pop();
            auto x=t.second;
            if(vis[x]) continue;
            vis[x]=true;
            for (auto &e:G[x]){
                auto y=e.first-1;
                auto d=e.second;
                if(dis[x]+d<dis[y]){
                    dis[y]=dis[x]+d;
                    q.push(make_pair(dis[y],y));
                }
            }
        }
        int mx=INT_MIN;
        for (int i=0;i<n;++i){
            if (!vis[i]) return -1;
            mx=max(mx,dis[i]);
        }
        return mx;
    }
};
```
