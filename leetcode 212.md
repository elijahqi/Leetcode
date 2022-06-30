# Leetcode 212 Word Search II


DFS But TLE
```cpp
class Solution {
private:
    int dir[4][2]={{0,-1},{0,1},{1,0},{-1,0}};
    bool dfs(vector<vector<char> >&board,int x,int y,string &s,int d){
        if (d==s.size()) return true;
        auto c=board[x][y];
        board[x][y]='#';
        bool flag=false;
        for (int i=0;i<4;++i){
            int _x=x+dir[i][0];
            int _y=y+dir[i][1];
            if (_x<0||_x>=board.size()||_y<0||_y>=board[0].size()) continue;
            if (board[_x][_y]!=s[d]) continue;
            flag|=dfs(board,_x,_y,s,d+1);
            if (flag) break;
        }
        board[x][y]=c;
        return flag;
    }
    bool check(vector<vector<char> >&board,string &s){
        for (int i=0;i<board.size();++i){
            for (int j=0;j<board[0].size();++j){
                if (s[0]!=board[i][j]) continue;
                if (dfs(board,i,j,s,1)) return true;
            }
        }
        return false;
    }
public:
    vector<string> findWords(vector<vector<char>>& board, vector<string>& words) {
        unordered_set<string> s(begin(words),end(words));
        vector<string> ret;
        if (!board.size()) return ret;
        for (auto s1:s) if (check(board,s1)) ret.push_back(s1);
        return ret;
    }
};
```

Solution 2:
Insert all the words into trie. Then use dfs to go through the board.
The dfs path must exist in the trie path. Otherwise, it's useless to do the search.

```cpp
class Solution {
private:
    class TrieNode{
        public:
        vector<TrieNode*> children;
        string *word;
        TrieNode():children(26),word(nullptr){}
        ~TrieNode(){
            for (auto c:children) delete(c);
        }
    };
    TrieNode *root;
    void insert(TrieNode *root,string &s){
        TrieNode *cur=root;
        for (auto c:s){
            auto &nxt=cur->children[c-'a'];
            if (!nxt) nxt=new TrieNode();
            cur=nxt;
        }
        cur->word=&s;
    }
    vector<string> ret;
    int dir[4][2]={{0,1},{0,-1},{1,0},{-1,0}};
    void dfs(vector<vector<char> >&board,int x,int y, TrieNode *root){
        if (x<0||x>=board.size()||y<0||y>=board[x].size()||board[x][y]=='#') return;
        auto c=board[x][y];
        auto nxt=root->children[c-'a'];
        if (!nxt) return;
        if (nxt->word){
            ret.push_back(*nxt->word);
            nxt->word=nullptr;
            //If the result is searched, then we should change it to nullptr make sure it's not added to returned vector twice.
        }
        board[x][y]='#';
        for (int i=0;i<4;++i){
            int _x=x+dir[i][0];
            int _y=y+dir[i][1];
            dfs(board,_x,_y,nxt);
        }
        board[x][y]=c;
    }
public:
    vector<string> findWords(vector<vector<char>>& board, vector<string>& words) {
        root= new TrieNode();
        for (auto &s:words) insert(root,s);
        for (int i=0;i<board.size();++i)
            for (int j=0;j<board[i].size();++j) 
                dfs(board,i,j,root);
        return ret;
    }
};
```
