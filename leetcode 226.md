# Leetcode 226 Kth Smallest Element in a BST
dfs the whole tree and change the left and right child 
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
    TreeNode* invertTree(TreeNode* root) {
        return dfs(root);
    }
private:
    TreeNode* dfs(TreeNode *x){
        if (!x) return nullptr;
        TreeNode *l=dfs(x->left);
        TreeNode *r=dfs(x->right);
        x->left=r;
        x->right=l;
        return x;
    }
};
```
