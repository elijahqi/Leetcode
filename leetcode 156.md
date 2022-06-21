# Leetcode 156 Binary Tree Upside Down

The right sub-trees are not required.

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
    TreeNode* upsideDownBinaryTree(TreeNode* root) {
        return dfs(root);
    }
private:
    TreeNode *dfs(TreeNode *x){
        if (!x||!x->left) return x;
        auto l=x->left,r=x->right;
        auto ret=dfs(l);
        l->left=r;
        l->right=x;
        x->left=x->right=nullptr;
        return ret;
    }
};
```
