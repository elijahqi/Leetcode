# Leetcode 671 Second Minimum Node In a Binary Tree

Since all the elements are from the leaf nodes.
We can check for all the leaves and de-duplication.
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
    int findSecondMinimumValue(TreeNode* root) {
        dfs(root);
        sort(ret.begin(),ret.end());
        auto ed=unique(ret.begin(),ret.end());
        ret.erase(ed,ret.end());
        if (ret.size()<=1) return -1;
        return ret[1];
    }
private:
    vector<int> ret;
    void dfs(TreeNode *x){
        if (!x) return;
        if (!x->left&&!x->right) {ret.push_back(x->val);return;}
        dfs(x->left);
        dfs(x->right);
    }
};
```
