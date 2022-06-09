# Leetcode 1461 Check If a String Contains All Binary Codes of Size K

Use hash table to store all the substring that length equal to k, and check whether the size is equal to $2^k$
```cpp

class Solution {
public:
    bool hasAllCodes(string_view s, int k) {
        const int n=s.size();
        if ((n-k+1)*k<(1<<k)) return false;
        unordered_set<string_view> st;
        for (int i=0;i<=n-k;++i) st.insert(s.substr(i,k));
        return st.size()==(1<<k);
    }
};
```
