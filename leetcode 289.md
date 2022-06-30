# Leetcode 289  Game of Life
Search for every cell then record their neighbourhoods.
After go though the neighbourhoods arrays, to determine whether this cell is still living.
```cpp
class Solution {
private:
    int dir[8][2]={{-1,-1},{-1,0},{-1,1},{0,-1},{0,1},{1,1},{1,-1},{1,0}};
public:
    void gameOfLife(vector<vector<int>>& board) {
        vector<vector<int> >mp(board.size(),vector<int>(board[0].size(),0));
        for (int i=0;i<board.size();++i){
            for (int j=0;j<board[i].size();++j){
                for (int k=0;k<8;++k){
                    int x=i+dir[k][0];
                    int y=j+dir[k][1];
                    if(x<0||y<0||x>=board.size()||y>=board[i].size()) continue;
                    mp[i][j]+=board[x][y];
                }
            }
        }
        for (int i=0;i<board.size();++i){
            for (int j=0;j<board[i].size();++j){
                if (board[i][j]){
                    if (mp[i][j]==2||mp[i][j]==3) continue;
                    board[i][j]=0;
                }else{
                    if (mp[i][j]==3) board[i][j]=1;
                }
            }
        }
    }
};
```
