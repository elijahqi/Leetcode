# Leetcode 130 Surrounded Regions

Use union find to connect all the point and go through the surroundings, then judge all the points in the matrix, to make sure whether it will connect to the boarder.
```cpp
class Solution {
public:
    void solve(vector<vector<char>>& board) {
        int cnt=0;id.resize(board.size(),vector<int>());
        for (int i=0;i<board.size();++i){
            id[i].resize(board[i].size());
            for (int j=0;j<board[0].size();++j){
                id[i][j]=++cnt;
            }
        }
        fa.resize(cnt+10);
        for (int i=1;i<=cnt;++i) fa[i]=i;
        vis.resize(cnt+10);
        for (int i=1;i<=cnt;++i) vis[i]=-1;
        for (int i=0;i<board.size();++i){
            for (int j=0;j<board[i].size();++j){
                if (board[i][j]=='X') continue;
                for (int k=0;k<4;++k){
                    int x=i+dir[k][0],y=j+dir[k][1];
                    if (x<0||x>=board.size()) continue;
                    if (y<0||y>=board[i].size()) continue;
                    if (board[x][y]=='X') continue;
                    meg(id[i][j],id[x][y]);
                }
            }
        }
        
        for (int i=0;i<board.size();++i) vis[find(id[i][0])]=vis[find(id[i][board[i].size()-1])]=1;
        for (int i=0;i<board[0].size();++i) vis[find(id[0][i])]=vis[find(id[board.size()-1][i])]=1;
        
        for (int i=0;i<board.size();++i){
            for (int j=0;j<board[i].size();++j){
                if (board[i][j]=='O'){
                    if (vis[find(id[i][j])]==-1) board[i][j]='X';
                }
            }
        }
        
    }
private:
    vector<vector<int> >id;
    vector<int> fa;
    vector<int> vis;
    int dir[4][2]={{-1,0},{1,0},{0,-1},{0,1}};
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
