# leetcode 1644
This question is quite similar to leetcode 235 or leetcode 236. The difference is that p or q , or (p and q) will dispear(not appear in the tree).
Thus we will use the pair as the return type for the dfs. Just use it to store more information so that we will be able to know how many leaf nodes we already have.
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
