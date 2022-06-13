# Leetcode 120 Triangle

Go through all the elements in the vector, try to find a path that have minimum value to go from the top to the bottom
```cpp
class Solution {
public:
    int minimumTotal(vector<vector<int>>& triangle) {
        dp.resize(triangle.size(),vector<int>());
        dp[0].push_back(triangle[0][0]);
        for (int i=0;i<triangle.size()-1;++i){
            dp[i+1].resize(triangle[i+1].size(),0x7f7f7f7f);
            for (int j=0;j<triangle[i].size();++j){
                if (dp[i][j]+triangle[i+1][j]<dp[i+1][j]) 
                    dp[i+1][j]=dp[i][j]+triangle[i+1][j];
                if (dp[i][j]+triangle[i+1][j+1]<dp[i+1][j+1])
                    dp[i+1][j+1]=dp[i][j]+triangle[i+1][j+1];
            }
        }
        int ret=0x7f7f7f7f;
        for (int i=0;i<triangle[triangle.size()-1].size();++i) ret=min(ret,dp[dp.size()-1][i]);
        return ret;
    }
private:
    vector<vector<int> >dp;
};
```
