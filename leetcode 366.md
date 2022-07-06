# Leetcode 366 Find Leaves of Binary Tree

Use postorder to traverse the tree. And also calculate the depth(which is the nodes from the leaves to the parents).
If they are in the same depth, then put them in to one vector.
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
    int dfs(TreeNode *x,vector<vector<int> >&ret){
        if (!x) return 0;
        auto l=dfs(x->left,ret);
        auto r=dfs(x->right,ret);
        auto dep=max(l,r)+1;
        if (dep>ret.size()) ret.push_back(vector<int>());
        ret[dep-1].push_back(x->val);
        return dep;
    }
public:
    vector<vector<int>> findLeaves(TreeNode* root) {
        vector<vector<int> >ret;
        dfs(root,ret);
        return ret;
    }
};
```
