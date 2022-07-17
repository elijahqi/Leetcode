# Leetcode 99 Recover Binary Search Tree

```cpp
/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode() : val(0), left(nullptr), right(nullptr) {}
 *     TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
 *     TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
 * };
 */
class Solution {
private:
    unordered_map<int,TreeNode*> mp;
    vector<int>ret;
    void dfs(TreeNode *x){
        if (!x) return;
        dfs(x->left);
        mp[x->val]=x;ret.push_back(x->val);
        dfs(x->right);
    }
    //1 4 3 2 5
public:
    void recoverTree(TreeNode* root) {
        dfs(root);
        if (ret.size()<=1) return;
        int pre=ret[0],id[2]={0,0},cnt=0;
        for (int i=1;i<ret.size();++i){
            if (ret[i]<pre){
                if (!cnt) id[cnt++]=pre;
                id[cnt]=ret[i];
            }
            pre=ret[i];
        }
        swap(mp[id[0]]->val,mp[id[1]]->val);
        
    }
};
```
