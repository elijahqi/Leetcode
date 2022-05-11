# Leetcode 1641 Count Sorted Vowel Strings

count the valid number of lexicographically sorted vowels.
Every time we assign one of the ending letter, and call the function to calculate all the result just one previous it.
```cpp
class Solution {
private:
    int dp[55][5];
public:
    int countVowelStrings(int n) {
        if (!n) return 0;
        dp[0][0]=1;
        for (int i=0;i<n;++i){
        int tmp=0;
            for (int j=0;j<5;++j){
                tmp+=dp[i][j];
                dp[i+1][j]=tmp;
            }
        }
        int ret=0;
        for (int i=0;i<5;++i) ret+=dp[n][i];
        return ret;
    }
};
```
