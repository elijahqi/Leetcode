# Leetcode 1647 Minimum Deletions to Make Character Frequencies Unique

Greedy to choose the one that already exists, and then reduce them to unique.
```cpp
class Solution {
public:
    int minDeletions(string s) {
        vector<int> cnt(26);
        unordered_set<int> st;
        for (auto c:s) ++cnt[c-'a'];
        int ret=0;
        for (int i=0;i<26;++i){
            int ct=cnt[i];
            while(ct>0&&!st.insert(ct--).second) ++ret;
        };
        return ret;
    }
};
```
