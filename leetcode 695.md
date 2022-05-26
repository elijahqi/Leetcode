# Leetcode 695 Max Area of Island

Use Union find to connect the 1 area.
finally go through all the area and find the maximum connected part.
```cpp
class Solution {
public:
    int maxAreaOfIsland(vector<vector<int>>& board) {
        int cnt=0;id.resize(board.size(),vector<int>());
        for (int i=0;i<board.size();++i){
            id[i].resize(board[i].size());
            for (int j=0;j<board[0].size();++j){
                id[i][j]=++cnt;
                
            }
        }
        fa.resize(cnt+10);
        sz.resize(cnt+10);
        for (int i=1;i<=cnt;++i) fa[i]=i,sz[i]=1;
        vis.resize(cnt+10);
        for (int i=1;i<=cnt;++i) vis[i]=-1;
        for (int i=0;i<board.size();++i){
            for (int j=0;j<board[i].size();++j){
                if (board[i][j]==0) continue;
                for (int k=0;k<4;++k){
                    int x=i+dir[k][0],y=j+dir[k][1];
                    if (x<0||x>=board.size()) continue;
                    if (y<0||y>=board[i].size()) continue;
                    if (board[x][y]==0) continue;
                    meg(id[i][j],id[x][y]);
                }
            }
        }
        int mx=0;
        for (int i=0;i<board.size();++i){
            for (int j=0;j<board[0].size();++j){
                if(board[i][j]==0) continue;
                mx=max(sz[find(id[i][j])],mx);
            }
        }
        return mx;
}
private:
    vector<vector<int> >id;
    vector<int> fa;
    vector<int> vis;
    vector<int> sz;
    int dir[4][2]={{-1,0},{1,0},{0,-1},{0,1}};
    int find(int x){
        while(x!=fa[x]) x=fa[x]=fa[fa[x]];
        return x;
    }
    void meg(int a,int b){
        int x=find(a),y=find(b);
        if (x!=y) fa[y]=x,sz[x]+=sz[y];
    }
};
```
