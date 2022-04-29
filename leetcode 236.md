# leetcode 236
For this question, we want to find the lowest binary tree's common ancestor. We can use dfs to find the least common ancestor. We can pass three parameters to the dfs function.
For each node, if we can both find two nodes from two subtrees, then we can say that this x would be the answer, we will return it. Ohterwise, we will return the answer returned from the subtree.

```cpp
/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode(int x) : val(x), left(NULL), right(NULL) {}
 * };
 */
class Solution {
public:
    TreeNode* lowestCommonAncestor(TreeNode* root, TreeNode* p, TreeNode* q) {
        return dfs(root,p,q);
    }
private:
    TreeNode* dfs(TreeNode* x, TreeNode* p, TreeNode* q){
        if (!x||x==p||x==q) return x;
        TreeNode* l=dfs(x->left,p,q);
        TreeNode* r=dfs(x->right,p,q);
        if (l&&r) return x;
        return l?l:r;
    }
};
```
