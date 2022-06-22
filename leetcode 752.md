# Leetcode 752 Open the Lock

BFS help us find the shortest road.
Thus we can use BFS to check for the shortest way that we can change to it instead of using DP.
```cpp
class Solution {
public:
    int openLock(vector<string>& deadends, string target) {
        unordered_set<string> ds(deadends.begin(),deadends.end());
        unordered_map<string,bool> vis;
        queue<string> q;
        string s="0000";
        if (ds.find(s)!=ds.end()) return -1;
        q.push(s);
        vis[s]=true;
        int ret=0;
        while(!q.empty()){
            int n=q.size();
            for (int i=0;i<n;++i){
                auto cur=q.front();q.pop();
                if (cur==target) return ret;
                auto seq=single_turn_seqs(cur);
                for (auto &s:seq){
                    if (!vis[s]&&ds.find(s)==ds.end()) q.push(s),vis[s]=true;
                }
            }
            
            ++ret;
        }
        return -1;
    }
private:
    vector<string> single_turn_seqs(string &orig_seq) {
        vector<string> result;
        for (int i = 0; i < 4; ++i) {
            string temp = orig_seq;
            temp[i] = (orig_seq[i] - '0' + 1) % 10 + '0';
            result.push_back(temp);
            temp[i] = (orig_seq[i] - '0' - 1 + 10) % 10 + '0';
            result.push_back(temp);
        }
        return result;
    }
};
```
