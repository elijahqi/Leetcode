This question is quite similar to leetcode 235.
Through drawing the graph we can find that it's same to the situation that we need to find the lowest common ancestor of two.
Since follow this step we will first find some of the ancestor, and then we will find the the lowest common ancestors of the temporary ancestor are quite same.
Then we repeat this process we will have the final answer.

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
    TreeNode* lowestCommonAncestor(TreeNode* root, vector<TreeNode*> &nodes) {
        set<TreeNode*> s(nodes.begin(),nodes.end());
        return dfs(root,s);
    }
private:
    TreeNode* dfs(TreeNode* x,const set<TreeNode*> &s){
        if (!x) return nullptr;
        if (s.count(x)) return x;
        TreeNode *l=dfs(x->left,s),
        *r=dfs(x->right,s);
        if (l&&r) return x;
        return l?l:r;
    }
};
```
