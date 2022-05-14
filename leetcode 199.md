# Leetcode 199 Binary Tree Right Side View

For every depth the answer will be only one. Thus we just need to judge whether this depth is the first time to appear.

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
    vector<int> rightSideView(TreeNode* root) {
        dep.resize(110);
        for (int i=0;i<dep.size();++i) dep[i]=-1;
        dfs(root,0);
        if(dep[0]==-1) return ret;
        for (int i=0;i<=mx_dep;++i) ret.push_back(dep[i]);
        return ret;
    }
private:
    vector<int> ret;
    vector<int> dep;
    int mx_dep;
    void dfs(TreeNode *x,int de){
        if (!x) return ;
        mx_dep=max(mx_dep,de);
        dfs(x->right,de+1);
        if (dep[de]==-1) dep[de]=x->val;
        dfs(x->left,de+1);
    }
};
```
