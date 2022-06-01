# Leetcode 269 Alien Dictionary
These are the edges of the directed graph. For each node in the directed graph, calculate its entry degree, and then start the BFS traversal of the directed graph from the node with entry degree 0, and then save the traversal path and return it. Here is how to do it.
Topological sort, then first determine the relationship of existing positions by the order between itself string, and then determine the edges by the adjacency matrix. Topological sorting is to keep finding the case where one has no entry degree.
```cpp
class Solution {
public:
    string alienOrder(vector<string>& words) {
        e.resize(26,vector<bool>(26));
        in.resize(26);ext.resize(26);
        for (int i=0;i<words.size()-1;++i){
            int mn=min(words[i].size(),words[i+1].size()),j=0;
            for (int k=0;k<words[i].size();++k) ext[words[i][k]-'a']=true;
            for (;j<mn;++j){
                if (words[i][j]!=words[i+1][j]){
                    e[words[i][j]-'a'][words[i+1][j]-'a']=true;
                    break;
                }
            }
            if (j==mn&&words[i].size()>words[i+1].size()) return "";
        }
        for (int k=0;k<words[words.size()-1].size();++k) ext[words[words.size()-1][k]-'a']=true;
        int cnt=0;
        for (int i=0;i<26;++i) if (ext[i]) ++cnt;
        string ret;
        for (int i=0;i<26;++i){
            for (int j=0;j<26;++j){
                if(e[i][j]) ++in[j];
            }
        }
        queue<int> q;
        for (int i=0;i<26;++i) {
            if (!ext[i]) continue;
            if (!in[i]) q.push(i),ret+=char('a'+i);
        }
        while(!q.empty()){
            int x=q.front();q.pop();
            for (int i=0;i<26;++i){
                if (!e[x][i]) continue;
                --in[i];
                if (!in[i])q.push(i),ret+=char('a'+i);
            }
        }
        return ret.size()==cnt?ret:"";
    }
private:
    vector<vector<bool> >e;
    vector<int> in;
    vector<bool> ext;
};
```
