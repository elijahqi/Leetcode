# Leetcode 127 Word Ladder


Use bfs + unordered set to do the search to find the shortest path.
```cpp
class Solution {
public:
    int ladderLength(string beginWord, string endWord, vector<string>& wordList) {
      unordered_set<string> s(wordList.begin(),wordList.end());
        if (!s.count(endWord)) return 0;
        queue<string> q;
        q.push(beginWord);
        int ret=0;
        while(!q.empty()){
            ++ret;
            for (int qwq=q.size();qwq>0;--qwq){
                auto s1=q.front();q.pop();
                auto l=s1.size();
                for (int i=0;i<l;++i){
                    auto t=s1[i];
                    for (int j='a';j<='z';++j){
                        s1[i]=j;
                        if (s1==endWord) return ret+1;
                        if (!s.count(s1)) continue;
                        s.erase(s1);
                        q.push(s1);
                    }
                    s1[i]=t;
                }
            }
        }
        return 0;
    }
};
```
