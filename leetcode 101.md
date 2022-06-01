# Leetcode 101 Symmetric Tree

Use dfs to go through the whole tree.

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
    bool isSymmetric(TreeNode* root) {
        return dfs(root,root);
    }
private:
    bool dfs(TreeNode* x1,TreeNode *x2){
        if (!x1&&!x2) return true;
        if (x1&&!x2) return false;
        if (!x1&&x2) return false;
        if (x1->val!=x2->val) return false;
        bool flag=dfs(x1->left,x2->right);
        flag&=dfs(x1->right,x2->left);
        return flag;
    }
};
```
