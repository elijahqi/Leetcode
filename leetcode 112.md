# Leetcode 112 Path Sum

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
    bool dfs(TreeNode *x,int tg,int now){
        if (!x) return false;
        now+=x->val;
        if (!x->left&&!x->right){
            if (tg==now) return true;
            now-=x->val;
            return false;
        }
        bool l=dfs(x->left,tg,now);
        bool r=dfs(x->right,tg,now);
        now-=x->val;
        if (l||r) return true;
        return false;
    }
public:
    bool hasPathSum(TreeNode* root, int targetSum) {
        if (!root) return false;
        return dfs(root,targetSum,0);
    }
};
```
