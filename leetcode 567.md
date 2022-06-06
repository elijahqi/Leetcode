# Leetcode 567 Permutation in String

Sliding window, brute force for every character in the string.
```cpp
class Solution {
public:
    bool checkInclusion(string s1, string s2) {
        vector<int> c1(26,0);
        vector<int> c2(26,0);
        for (char i:s1) ++c1[i-'a'];
        for (int i=0;i<s2.size();++i){
            if (i>=s1.size()){
                --c2[s2[i-s1.size()]-'a'];
            }
            ++c2[s2[i]-'a'];
            if (c1==c2) return true;
        }
        return false;
    }

};
```
