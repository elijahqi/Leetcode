# Leetcode 96 Unique Binary Search Trees
Tree DP, use the number of left subtree times right subtree.
Then we loop every root.
```cpp
class Solution {
public:
    int numTrees(int n) {
        dp.resize(n+1,-1);
        return dfs(n);
    }
private:
vector<int> dp;
    int dfs(int n){
        if (n==0) return 1;
        if (n==1) return 1;
        if (dp[n]!=-1) return dp[n];
        dp[n]=0;
        for (int i=0;i<n;++i) dp[n]+=dfs(i)*dfs(n-i-1);
        return dp[n];
    }
};
```
