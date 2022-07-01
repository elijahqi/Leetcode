# Leetcode 124 Binary Tree Maximum Path Sum
This is a tree process, we only need to compare the left tree and right tree and also remember to include this node's value.
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
    int ret;
    int dfs(TreeNode* x){
        if (!x) return 0;
        auto l=dfs(x->left);
        auto r=dfs(x->right);
        l=max(l,0);r=max(r,0);
        auto sm=l+r+x->val;
        ret=max(ret,sm);
        return max(l,r)+x->val;
    }
public:
    int maxPathSum(TreeNode* root) {
        ret=INT_MIN;
        ret=max(ret,dfs(root));
        return ret;
    }
};
```
