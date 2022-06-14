# Leetcode 583 Delete Operation for Two Strings

Minimum deletion to get the two strings to be the same.
So we have to get the longest common string, which indicates we can do the for loop to check the for longest common subsequence.
And use the sum of the two length to deduct the common subsequence
```cpp
class Solution {
public:
    int minDistance(string word1, string word2) {
        dp.resize(word1.size()+1,vector<int>(word2.size()+1,0));
        for (int i=1;i<=word1.size();++i){
            for (int j=1;j<=word2.size();++j){
                if (word1[i-1]==word2[j-1]) dp[i][j]=dp[i-1][j-1]+1;
                else dp[i][j]=max(dp[i-1][j],dp[i][j-1]);
            }
        }
        return word1.size()+word2.size()-dp[word1.size()][word2.size()]*2;
    }
    
private:
    vector<vector<int> >dp;
};
```
