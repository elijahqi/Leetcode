# Leetcode 103 Binary Tree Zigzag Level Order Traversal

in order traversal using DFS and reverse the result of even levels.
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
    vector<vector<int>> zigzagLevelOrder(TreeNode* root) {
        dfs(root,0);
        for (int i=0;i<ret.size();++i){
            if (i&1) reverse(ret[i].begin(),ret[i].end());
        }
        return ret;
    }
private:
    vector<vector<int> >ret;
    void dfs(TreeNode *x,int d){
        if(!x) return;if (d>=ret.size()) ret.push_back(vector<int>());
        ret[d].push_back(x->val);
        dfs(x->left,d+1);dfs(x->right,d+1);
    }
};
```
