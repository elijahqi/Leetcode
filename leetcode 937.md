# Leetcode 937 Reorder Data in Log Files

Split and use sort. The things I learned are that string has a function caleed find_first_of. and also I need to remember the string.substr function.
And for sort, if we want to construct a compare function we can easily use []. 

```cpp
class Solution {
public:
    vector<string> reorderLogFiles(vector<string>& logs) {
        vector<string> ret;
        vector<string> digitret;
        vector<pair<string,string> > letterret;
        
        for (const string &l:logs){
            int i=l.find_first_of(' ');
            if(isdigit(l[i+1])) digitret.push_back(l);
            else letterret.push_back({l.substr(0,i),l.substr(i+1)});
        }
        
        sort(letterret.begin(),letterret.end(),[](const auto &a,const auto &b){
            return a.second==b.second?a.first<b.first:a.second<b.second;
        });
        
        
        for (auto &i:letterret) ret.push_back(i.first+' '+i.second);
        for (auto &i:digitret) ret.push_back(i);
        return ret;
    }
};
```
