# Leetcode 1000 Minimum Cost to Merge Stones

The last step of this problem is to do a final simple merge of the stones that have been merged into K piles. So, the crux of the problem becomes how to optimally merge the original N piles of stones into K piles of stones, in other words, one needs to divide [0,N-1] into K intervals. For a DP problem divided into K intervals, we will obviously consider how to determine the first interval first, then the rest is divided into K-1 intervals in the remaining elements. This is the more common way of thinking.

So the state of this problem is designed as dp[i][j][k], which indicates what is the minimum cost we will subsume into k intervals from the i-th to the j-th elements. According to the above idea, we need to traverse the possible range of the first interval (i.e., splitting position m) and find the optimal split. That is


```
dp[i][j][k] = min(dp[i][m][1]+dp[m+1][j][k-1]) for i<=m<j
```
```cpp
class Solution {
public:
    int mergeStones(vector<int>& stones, int k) {
        memset(dp,0x7f,sizeof(dp));
        sum[0]=0;
        for (int i=0;i<stones.size();++i) sum[i+1]=sum[i]+stones[i];
        for (int i=0;i<stones.size();++i) dp[i][i][1]=0;
        for (int len=2;len<=stones.size();++len){
            for (int i=0;i+len<=stones.size();++i){
                int j=i+len-1;
                for (int kk=2;kk<=k;++kk){
                    if (kk>len) break;
                    for (int m=i;m<j;++m){
                        if (dp[i][m][1]==0x7f7f7f7f||dp[m+1][j][kk-1]==0x7f7f7f7f) continue;
                        dp[i][j][kk]=min(dp[i][j][kk],dp[i][m][1]+dp[m+1][j][kk-1]);
                    }
                }
                if (dp[i][j][k]!=0x7f7f7f7f){
                    dp[i][j][1]=dp[i][j][k]+sum[j+1]-sum[i];
                }
            }
        }
        if (dp[0][stones.size()-1][1]==0x7f7f7f7f) return -1;
        else return dp[0][stones.size()-1][1];
        
    }
private:
    int sum[33];
int dp[33][33][33];
    
};
```
