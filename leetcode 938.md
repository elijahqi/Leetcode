# Leetcode 938 Range Sum of BST

Use dfs to go through the tree
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
    int rangeSumBST(TreeNode* root, int low, int high) {
        return dfs(root,low,high);
    }
private:
    int dfs(TreeNode *x,int l,int r){
        if (!x) return 0;
        int ret=0;
        if (x->val>=l&&x->val<=r) ret+=x->val;
        ret+=dfs(x->left,l,r);
        ret+=dfs(x->right,l,r);
        return ret;
    }
};
```
