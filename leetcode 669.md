# Leetcode 669 Trim a Binary Search Tree

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
    TreeNode *dfs(TreeNode *x,int low,int high){
        if (!x) return x;
        auto l=dfs(x->left,low,high);
        auto r=dfs(x->right,low,high);
        x->left=l;
        x->right=r;
        if(!l&&r&&(x->val>high||x->val<low)) return r;
        if (l&&!r&&(x->val>high||x->val<low)) return l;
        if (x->val>high||x->val<low) return r;
        return x;
    }
    TreeNode* trimBST(TreeNode* root, int low, int high) {
        return dfs(root,low,high);
    }
};
```
