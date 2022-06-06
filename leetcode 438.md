# Leetcode 438
Sliding window, check whether it's same
```cpp
class Solution {
public:
    vector<int> findAnagrams(string s1, string s2) {
        int l1=s1.size(),l2=s2.size();
        vector<int> ret;
        vector<int> c1(26,0),c2(26,0);
        for (int i:s2) ++c2[i-'a'];
        for (int i=0;i<s1.size();++i){
            if (i>=l2) --c1[s1[i-l2]-'a'];
            ++c1[s1[i]-'a'];
            if (c1==c2) ret.push_back(i-l2+1);
        }
        return ret;
    }
};
```
