# Leetcode 820 Short Encoding of Words
Sort the string of vector, then brute force to insert every suffix into unordered_set.
```cpp
class Solution {

public:
    int minimumLengthEncoding(vector<string>& words) {
        sort(words.begin(),words.end(),[](const string &a,const string &b){ return a.size()>b.size();});
        unordered_set<string> s;
        int ret=0;
        for (auto &s1:words){
            auto find_it=s.find(s1);
            if (find_it!=s.end())continue;
            ret+=s1.size()+1;
            for (int i=0;i<s1.size();++i){
                s.insert(s1.substr(i,s1.size()-i));
            }
        }
        return ret;
    }
};
```
