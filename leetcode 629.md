# Leetcode 629 K Inverse Pairs Array

A DP problem with some difficulty.

The constraint dp[n][k] denotes the number of combinations in which the number of inverse pairs is k in any permutation from 1 to n.
```
For example, if we have some permutation of 1.. .4   
5 x x x x creates 4 new inverse pairs   
x 5 x x x creates 3 new inverse pairs   
...   
x x x x 5 creates 0 new inverse pairs   
```
As in the above example.    
Suppose xxxx represents all possible permutations of dp[4][j]. It is easy to see that xxxx5 does not increase the number of inverse pairs, so dp[4][j] is part of dp[5][j].   
Suppose xxxx represents all possible permutations of dp[4][j-1]. It is easy to know that xxx5x increases the number of inverse pairs by one, so dp[4][j-1] is a part of dp[5][j].   
Suppose xxxx represents all possible permutations of dp[4][j-2]. It is easy to know that xx5xx increases the number of two inverse pairs, so dp[4][j-2] is a part of dp[5][j].   
Suppose xxxx represents all possible permutations of dp[4][j-3]. It is easy to know that x5xxx increases the number of three inverse pairs, so dp[4][j-3] is a part of dp[5][j].   
Suppose xxxx represents all possible permutations of dp[4][j-4]. It is easy to know that 5xxxx increases the number of four inverse pairs, so dp[4][j-4] is a part of dp[5][j].   

Therefore, the recurrence relation can be obtained as
```cpp
dp[i][j] = dp[i-1][j] + dp[i-1][j-1] + dp[i-1][j-2] + ... +dp[i-1][j-i+1]
```
Using the above recursive relation directly will still time out. This recursive relation can be further simplified. Consider
```cpp
dp[i][j-1] = dp[i-1][j-1] + dp[i-1][j-2] + ... + dp[i-1][j-i]
```
Bringing dp[i][j-1] into dp[i][j], we get
```cpp
dp[i][j] = dp[i-1][j] + dp[i][j-1] - dp[i-1][j-i]
```
Note that the above relation has dp[i-1][j-i] only when j >= i. Otherwise, the last term is omitted.

In addition, the boundary condition of dp is d[i][0]=1, indicating that there is only one arrangement without any inverse pair, which is the order from smallest to largest.


```cpp
class Solution {
private:
    const int mod=1e9+7;
public:
    int kInversePairs(int n, int k) {
        vector<vector<int> >dp(n+1,vector<int>(k+1,0));
        for (int i=0;i<=n;++i) dp[i][0]=1;
        for (int i=1;i<=n;++i){
            
            for (int j=1;j<=k;++j){
                if(j>=i) {
                    dp[i][j]=((dp[i-1][j]+dp[i][j-1]-dp[i-1][j-i])%mod+mod)%mod;
                }else dp[i][j]=(dp[i-1][j]+dp[i][j-1])%mod;
                
                dp[i][j]%=mod;
                /*
                for (int z=0;z<=i-1;++z){
                    if (j<z) continue;
                    dp[i][j]+=dp[i-1][j-z];
                    dp[i][j]%=mod;
                }*/
            }
        }
        return dp[n][k];
    }
};
```
