# Leetcode 139 Word Break
Use dynamic programming to judge whehter it's availuable to construct this.
```cpp
class Solution {
public:
    bool wordBreak(string s, vector<string>& wordDict) {
        dp.resize(s.size(),false);
        for (int i=0;i<s.size();++i){
            for (auto &w:wordDict){
                if (w.size()>(i+1)) continue;
                if (w==s.substr((i+1-w.size()),w.size())) {
                    if (!(i+1-w.size())) {dp[i]=true;break;}
                    if (dp[i-w.size()]) {dp[i]=true;break;}
                }
            }
        }
        return dp[s.size()-1];
    }
private:
    vector<bool> dp;
};
```
