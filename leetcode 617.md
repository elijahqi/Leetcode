# Leetcode 617 Merge Two Binary Trees

Use dfs to go through the whole binary tree, and add them together.

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
    TreeNode* mergeTrees(TreeNode* root1, TreeNode* root2) {
        return dfs(root1,root2);
    }
private:
    TreeNode* dfs(TreeNode *x1,TreeNode *x2){
        if (!x1&&!x2) return nullptr;
        if (!x1) return x2;
        if (!x2) return x1;
        x1->val+=x2->val;
        x1->left=dfs(x1->left,x2->left);
        x1->right=dfs(x1->right,x2->right);
        return x1;
    }
};
```
