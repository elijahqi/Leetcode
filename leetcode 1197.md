# Leetcode 1197 Minimum Knight Moves

This is a shortest path problem, it require us to use BFS to search for the end point.
Also, if in the searching process, if the point has been visited,we should skip that point.
Also, this board is infinity huge. Thus we should have a bound for this BFS.
Since the way that the horse jump is a little bit wield. We have to set some addition value to the bound.
Plus, the board is symmetric, we can only search for the positive quadrant.
```cpp
class Solution {
public:
    int minKnightMoves(int x, int y) {
        x=abs(x);y=abs(y);
        map<pair<int,int>,int> mp;
        queue<pair<int,int> >q;
        q.push(make_pair(0,0));
        mp[make_pair(0,0)]=0;
        while(!q.empty()){
            auto cur=q.front();q.pop();
            if(cur.first==x&&cur.second==y) return mp[cur];
            for (int i=0;i<8;++i){
                int nx=cur.first+dir[i][0],ny=cur.second+dir[i][1];
                if (mp.find(make_pair(nx,ny))!=mp.end()) continue;
                if (check(nx,x,ny,y)) mp[make_pair(nx,ny)]=mp[cur]+1,q.push(make_pair(nx,ny));
            }
        }
        return 0;
    }
private:
    int dir[8][2]={{1, 2}, {1, -2}, {-1, 2}, {-1, -2},
                            {2, 1}, {2, -1}, {-2, 1}, {-2, -1}};
    bool check(int nx,int x,int ny,int y){
        return (nx>=-2&&nx<=x+2&&ny>=-2&&ny<=y+2);
    }
};
```
