# Leetcode 417 Pacific Atlantic Water Flow

Use infinite loop to check all the matrix units. and use "|" operation to make sure that we can know the status that whether it can flow to which ocean.
```cpp
class Solution {
private:
    int dir[4][2]={{0,1},{0,-1},{1,0},{-1,0}};
public:
    vector<vector<int>> pacificAtlantic(vector<vector<int>>& heights) {
        vector<vector<int> >dp(heights.size(),vector<int>(heights[0].size(),0));
        for (int i=0;i<heights.size();++i){
            dp[i][0]|=1;
            dp[i][heights[0].size()-1]|=2;
        }
        for (int i=0;i<heights[0].size();++i){
            dp[0][i]|=1;
            dp[heights.size()-1][i]|=2;
        }
        while(true){
            bool flag=false;
            for (int i=0;i<heights.size();++i){
                for (int j=0;j<heights[i].size();++j){
                    for (int k=0;k<4;++k){
                        int x=i+dir[k][0];
                        int y=j+dir[k][1];
                        if (x<0||x>=heights.size()||y<0||y>=heights[i].size()) continue;
                        if (heights[x][y]>heights[i][j]) continue;
                        if ((dp[x][y]|dp[i][j])==dp[i][j]) continue;
                        dp[i][j]|=dp[x][y];
                        flag=true;
                    }
                }
            }
            if(!flag) break;
        }
        vector<vector<int> >ret;
        for (int i=0;i<heights.size();++i){
            for(int j=0;j<heights[i].size();++j){
                if (dp[i][j]==3) ret.push_back({i,j});
            }
        }
        return ret;
    }
};
```
