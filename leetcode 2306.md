# Leetcode 2306  Naming a Company

Any idea = first letter + postfix string.
We can group all ideas by their first letter.

If two ideas ideas[i] and ideas[j] share a common postfix string,
then ideas[i] can not pair with any idea starts with ideas[j][0]
and ideas[j] can not pair with any idea starts with ideas[i][0].


```cpp
class Solution {
public:
    using ll= long long;
    long long distinctNames(vector<string>& ideas) {
        ll ret=0;
        cnt.resize(26);
        for (auto &i:ideas) cnt[i[0]-'a'].insert(i.substr(1));
        for (int i=0;i<26;++i){
            for (int j=i+1;j<26;++j){
                ll x=cnt[i].size(),y=cnt[j].size();
                int com=0;
                for (auto &s:cnt[i]){
                    if(cnt[j].find(s)!=cnt[j].end()) ++com;
                }
                ret+=(x-com)*(y-com)*2;
            }
        }
        return ret;
    }
private:
    vector<unordered_set<string> >cnt;
};
```
