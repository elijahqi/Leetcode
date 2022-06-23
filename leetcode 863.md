# Leetcode 863 All Nodes Distance K in Binary Tree
Recursively compute the distance from root to target, and collect nodes accordingly.

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
    vector<int> distanceK(TreeNode* root, TreeNode* target, int k) {
        dfs(root,target,k);
        return ret;
    }
private:
    vector<int> ret;
    int dfs(TreeNode *x,TreeNode *target,int k){
        //if the returned value is -1, then the target is not in this sub tree
        if (!x) return -1;
        if (x==target) {dfs1(x,k);return 0;}
        auto l=dfs(x->left,target,k);
        auto r=dfs(x->right,target,k);
        //Target is in the left subtree
        if (l>=0){
            if (l==k-1) ret.push_back(x->val);
            dfs1(x->right,k-l-2);
            return l+1;
        }
        
        //Target is in the right subtree
        if (r>=0){
            if (r==k-1) ret.push_back(x->val);
            dfs1(x->left,k-r-2);
            return r+1;
        }
        
        return -1;
    }
    void dfs1(TreeNode *x,int d){
        if (!x) return;
        if (d<0) return;
        if (!d) {ret.push_back(x->val);return;}
        dfs1(x->left,d-1);
        dfs1(x->right,d-1);
    }
};
```
