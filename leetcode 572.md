# Leetcode 572 Subtree of Another Tree


Then time complexity will be max(n,m). Use recursion to solve the quesiton.
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
    bool isSubtree(TreeNode* root, TreeNode* subRoot) {
        if (subRoot==nullptr) return true;
        if (root==nullptr) return false;
        if (judge(root,subRoot)) return true;
        return isSubtree(root->left,subRoot)||isSubtree(root->right,subRoot);
    }
private:
    bool judge(TreeNode *a,TreeNode *b){
        if (!a&&!b) return true;
        if (!a||!b) return false;
        if (!judge(a->left,b->left)) return false;
        if (!judge(a->right,b->right)) return false;
        if (a->val!=b->val) return false;
        return true;
    }
};
```
