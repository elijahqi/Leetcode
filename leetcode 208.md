# Leetcode 208  Implement Trie (Prefix Tree)
Classical Trie tree.
But there is an additional operation which is finding the prefix.
Then we can have a find function that return the node that we find.
If the returned point is nullptr then we can not find that prefix in the word.
```cpp
class Trie {
private:
    class TreeNode{
        public:
            bool is_word; 
            vector<TreeNode*> children;
            TreeNode():is_word(false),children(26,nullptr){}
            ~TreeNode(){
                for (int i=0;i<children.size();++i) {
                    if (children[i]) delete children[i];
                }
            }
    };
    TreeNode* root;
    TreeNode* find(string &s){
        TreeNode *cur=root;
        for (int i=0;i<s.size();++i){
            if (cur->children[s[i]-'a']==nullptr) return nullptr;
            cur=cur->children[s[i]-'a'];
        }
        return cur;
    }
public:
    Trie() {
        root=new TreeNode();
    }
    
    void insert(string word) {
        TreeNode *cur=root;
        for (int i=0;i<word.size();++i){
            if(cur->children[word[i]-'a']==nullptr) cur->children[word[i]-'a']=new TreeNode();
            cur=cur->children[word[i]-'a'];
        }
        cur->is_word=true;
    }
    
    bool search(string word) {
        auto find_it=find(word);
        if (find_it==nullptr) return false;
        return (find_it->is_word==true);
    }
    
    bool startsWith(string prefix) {
        auto find_it=find(prefix);
        return find_it!=nullptr;
    }
};

/**
 * Your Trie object will be instantiated and called as such:
 * Trie* obj = new Trie();
 * obj->insert(word);
 * bool param_2 = obj->search(word);
 * bool param_3 = obj->startsWith(prefix);
 */
```
