# Leetcode 340 Longest Substring with At Most K Distinct Characters

Unordered_map+ sliding window

```cpp
class Solution {
public:
    int lengthOfLongestSubstringKDistinct(string s, int k) {
        int ret=0,cat;
        int l=0,r=0;
        while(r<s.size()){
            auto find_it=mp.find(s[r]);
            if(find_it==end(mp)){
                ++mp[s[r++]];++cat;
                while(cat>k){
                    find_it=mp.find(s[l]);
                    --mp[s[l]];
                    if (!mp[s[l]]) mp.erase(s[l]),--cat;
                    l++;
                }
                ret=max(ret,r-l);
                continue;
            }
            ++mp[s[r++]];
            ret=max(ret,r-l);
        }
        return ret;
    }
private:
    unordered_map<int,int> mp;
};
```
