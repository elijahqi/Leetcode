# Leetcode 2268 Minimum Number of Keypresses

Sort all the characters that we need to type, then use greedy algorithm to place from the minimum to the maximum.
```cpp
class Solution {
public:
    int minimumKeypresses(string s) {
        vector<int> cnt(26);
        for (auto &c:s) cnt[c-'a']++;
        sort(begin(cnt),end(cnt),greater<int>());
        int ret=0;
        for (int i=0;i<26;++i){
            ret+=cnt[i]*((i/9)+1);
        }
        return ret;
    }
};
```
