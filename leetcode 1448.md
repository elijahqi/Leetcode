# Leetcode 1448 Count Good Nodes in Binary Tree

dfs for the whole tree. And record the maximum value from the root to current node
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
    int goodNodes(TreeNode* root) {
        dfs(root,INT_MIN);
        return cnt;
    }
private:
    int cnt;
    void dfs(TreeNode *x,int mx){
        if (!x) return;
        if (x->val>=mx) cnt++,mx=x->val;
        dfs(x->left,mx);
        dfs(x->right,mx);
    }
};
```
