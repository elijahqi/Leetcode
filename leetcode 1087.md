# leetcode 1087 Brace Expansion
Just violently search for all combinations and sort them using sort

```cpp
class Solution {
public:
    vector<string> expand(string s) {
        for (int i=0;i<s.size();++i){
            if (s[i]=='{'){
                string t;
                int j=i+1;
                for (;j<s.size();++j){
                    if (s[j]=='}') break;
                    if (s[j]!=',') t.push_back(s[j]);
                }
                st.push_back(t);
                i=j;
            }else st.push_back(string(1,s[i]));
            
        }   
        dfs(0, "");
        sort(ret.begin(), ret.end());
        return ret;
    }
private:
    vector<string> st,ret;
    void dfs(int x,string s1){
        if (x==st.size()){
            ret.push_back(s1);
            return;
        }
        for (int i=0;i<st[x].size();++i){
            s1.push_back(st[x][i]);
            dfs(x+1,s1);
            s1.pop_back();
        }
    }
};
```
