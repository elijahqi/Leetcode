# Leetcode 763 Partition Labels

This problem requires us to split the string into as many as possible substrings.
Use brute force, find where is every character last exists.
```cpp
class Solution {
public:
    vector<int> partitionLabels(string s) {
        vector<int> ret;
        int mx=0,st=0;
        for (int i=0;i<s.size();++i){
            mx=max(mx,(int)s.find_last_of(s[i]));
            if (i==mx){
                ret.push_back(mx-st+1);
                st=mx+1;
            }
        }
        return ret;
    }
};
```
