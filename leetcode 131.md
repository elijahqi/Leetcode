# Leetcode 131 Palindrome Partitioning

Use backtracking to check all the situations.

```cpp
class Solution {
private:
    bool check(string &s){
        for (int i=0;i<s.size()/2;++i)
            if (s[i]!=s[s.size()-1-i]) return false;
        return true;
    }
    vector<vector<string> >ret;
    int nn;
    void dfs(vector<string> &ans,int now,string &s){
        if(now==nn) {
            ret.push_back(ans);
            return;
        }
        for (int i=now;i<nn;++i){
            string ss=s.substr(now,i-now+1);
            if(!check(ss)) continue;
            ans.push_back(ss);
            dfs(ans,i+1,s);
            ans.pop_back();
        }
    }
public:
    vector<vector<string>> partition(string s) {
        nn=s.size();
        vector<string> ans;
        dfs(ans,0,s);
        return ret;
    }
};
```
