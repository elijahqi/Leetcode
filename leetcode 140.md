# Leetcode 140 Word Break II

Use unordered_map to do the memorization.


```cpp
class Solution {
private:
    unordered_map<string,vector<string> >mp;
    vector<string> add(const vector<string> &prefix,string &s){
        vector<string> ret;
        for (auto &i:prefix) ret.push_back(i+" "+s);
        return ret;
    }
    vector<string> dfs(string &s,unordered_set<string> &st){
        auto find_it=mp.find(s);
        if (find_it!=mp.end()) return find_it->second;
        vector<string> ans;
        if (st.find(s)!=st.end()) ans.push_back(s);
        for (int i=1;i<s.size();++i){
            string rt=s.substr(i);
            if (st.find(rt)==st.end()) continue;
            string lt=s.substr(0,i);
            auto left_ans=add(dfs(lt,st),rt);
            ans.insert(end(ans),begin(left_ans),end(left_ans));
        }
        mp[s]=ans;
        return mp[s];
    }
public:
    
    vector<string> wordBreak(string s, vector<string>& wordDict) {
        unordered_set<string> st(begin(wordDict),end(wordDict));
        return dfs(s,st);
    }
};
```
