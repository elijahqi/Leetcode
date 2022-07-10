# Leetcode 2337 Move Pieces to Obtain a String

```cpp
class Solution {
public:
    bool canChange(string start, string target) {
        string s1,s2;
        for (int i=0;i<start.size();++i) if (start[i]!='_') s1.push_back(start[i]);
        for (int i=0;i<target.size();++i) if (target[i]!='_') s2.push_back(target[i]);
        if (s1!=s2) return false;
        map<pair<char,int>,int>mp;
        int cnt=0;
        for (int i=0;i<target.size();++i){
            if (target[i]=='_') continue;
            mp[make_pair(target[i],cnt++)]=i;
        }
        cnt=0;
        for (int i=0;i<start.size();++i){
            if (start[i]=='_') continue;
            auto t=mp[make_pair(start[i],cnt++)];
            if (start[i]=='L'){
                if (t>i) return false;
            }
            if (start[i]=='R'){
                if (t<i) return false;
            }
        }
        return true;
    }
};
```
