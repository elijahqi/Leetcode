# Leetcode 745 Prefix and Suffix Search

Time comlexity O(NL^2+QL);
Firstly, we construct a new trie tree.
we use '{' as the connection character between suffix and prefix.
In the insertion process, we should first insert the prefix into the TRIE.
Then we should append each suffix with each prefix as the combination into the trie and also update the index.
```cpp
class WordFilter {
private:
    class TreeNode{
        public:
            int index;
            vector<TreeNode*> children;
            TreeNode():index(-1),children(27,nullptr){}
    };
    TreeNode *root=new TreeNode();
    void insert(string &s,int id){
        TreeNode *cur=root;
        for (auto s1:s){
            if (cur->children[s1-'a']==nullptr) cur->children[s1-'a']=new TreeNode();
            cur=cur->children[s1-'a'];
            cur->index=id;
        }
    }
    TreeNode* find(string &s){
        TreeNode *cur=root;
        for (auto s1:s){
            if (cur->children[s1-'a']==nullptr) return nullptr;
            cur=cur->children[s1-'a'];
        }
        return cur;
    }
public:
    WordFilter(vector<string>& words) {
        for (int i=0;i<words.size();++i){
            string s="{"+words[i];
            insert(s,i);
            int sz=words[i].size();
            for (int j=0;j<sz;++j){
                s=words[i][sz-1-j]+s;
                insert(s,i);
            }
        }
    }
    
    int f(string prefix, string suffix) {
        string s=suffix+"{"+prefix;
        auto find_it=find(s);
        if (find_it==nullptr) return -1;
        return find_it->index;
    }
};

/**
 * Your WordFilter object will be instantiated and called as such:
 * WordFilter* obj = new WordFilter(words);
 * int param_1 = obj->f(prefix,suffix);
 */
```
