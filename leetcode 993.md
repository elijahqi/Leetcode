# Leetcode 993  Cousins in Binary Tree

Use dfs to search the depth in the tree and also we should notice the two nodes can not have the same father.


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
    bool isCousins(TreeNode* root, int x, int y) {
        for (int i=1;i<=100;++i) fa[i]=i;
        dfs(root,0,0);
        return dep[x]==dep[y]&&fa[x]!=fa[y];
    }
private:
    int dep[110],fa[110];
    void dfs(TreeNode *x,int d,int f){
        if (!x) return;fa[x->val]=f;
        dep[x->val]=d;
        dfs(x->left,d+1,x->val);dfs(x->right,d+1,x->val);
    }
};
```
