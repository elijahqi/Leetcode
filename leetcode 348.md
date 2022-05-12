# Leetcode 348 

The time complexity is not good. Actually we can use the position to locate which line and which row. And just since there is only two player, we can use positive or negative to indicate who is positive or negative.
```cpp
class TicTacToe {
public:
    TicTacToe(int n) {
        mp.resize(n,vector<int>(n,0));   
        sz=n;
    }
    
    int move(int row, int col, int player) {
        mp[row][col]=player;int tot=0;int tot1=0;
        for (int i=0;i<sz;++i) {
            if (count(mp[i].begin(),mp[i].end(),1)==sz) return 1;
            if (count(mp[i].begin(),mp[i].end(),2)==sz) return 2;
            if (mp[i][i]==1)++tot;
            else if (mp[i][i]==2)--tot;
            if (mp[i][sz-i-1]==1)++tot1;
            else if (mp[i][sz-1-i]==2)--tot1;
            if (tot==sz) return 1;
            if (tot==-sz) return 2;
            if (tot1==sz) return 1;
            if (tot1==-sz) return 2;
        }
        for (int i=0;i<sz;++i){
            int cnt=0;
            for (int j=0;j<sz;++j) if (mp[j][i]==1) ++cnt;
            else if (mp[j][i]==2) --cnt;
            if (cnt==sz) return 1;
            if (cnt==-sz) return 2;
        }
        return 0;
    }
private:
    vector<vector<int> >mp;
    int sz;
};

/**
 * Your TicTacToe object will be instantiated and called as such:
 * TicTacToe* obj = new TicTacToe(n);
 * int param_1 = obj->move(row,col,player);
 */
```
