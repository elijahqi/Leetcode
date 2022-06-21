# Leetcode 111 Minimum Depth of Binary Tree

DFS, and update the data once we encounter a leaf.
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
    int minDepth(TreeNode* root) {
        if (!root) return 0;
        dfs(root,1);
        return mn;
    }
private:
    int mn=INT_MAX;
    void dfs(TreeNode *x,int d){
        if (!x) return;
        if (!x->left&&!x->right) {mn=min(mn,d);return;}
        dfs(x->left,d+1);
        dfs(x->right,d+1);
    }
};
```
