# Leetcode 230 Kth Smallest Element in a BST


DFS the whole tree, if can find in left sub tree the the remainder of k will be set to zero. Thus return left tree's answer is ok.
If (k-1)==0 then current node will become the answer.
If it's not the two situations above, the the answer will come from right subtree.
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
    int kthSmallest(TreeNode* root, int k) {
        return dfs(root,k);
    }
private:
    int dfs(TreeNode *x,int &k){
        if (!x) return -1;
        int ret=dfs(x->left,k);
        if (!k) return ret;
        if (!(--k)) return x->val;
        return dfs(x->right,k);
    }
    
};
```
