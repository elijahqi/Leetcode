# Leetcode 965 Univalued Binary Tree

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
    bool isUnivalTree(TreeNode* root) {
        val=-1;
        return check(root);
    }
private:
    int val;
    bool check(TreeNode *x){
        if (!x) return true;
        if (val<0) val=x->val;
        else if(val!=x->val) return false;
        if (!check(x->left)) return false;
        if (!check(x->right)) return false;
        return true;
    }
};
```
