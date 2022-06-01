# Leetcode 102 Binary Tree Level Order Traversal

Use vector to store the every depth's nodes.
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
public:
    vector<vector<int>> levelOrder(TreeNode* root) {
        ret.resize(2010,vector<int>());
        dfs(root,0);
        for (int i=ret.size()-1;i>=0;--i){
            if (ret[i].empty()) ret.pop_back();
        }
        return ret;
    }
    void dfs(TreeNode *x, int d){
        if (!x) return;
        ret[d].push_back(x->val);
        dfs(x->left,d+1);dfs(x->right,d+1);
    }
private:
    vector<vector<int> >ret;
};
```
