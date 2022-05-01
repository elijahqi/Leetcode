# Leetcode 1305 All Elements in Two Binary Search Trees

Using dfs to go through all these two trees and have two vectors. And use two pointers to go through the two vectors and merge them into one vector.

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
    vector<int> getAllElements(TreeNode* root1, TreeNode* root2) {
        dfs(root1,t1);dfs(root2,t2);
        int l=0,r=0;
        while(l<t1.size()&&r<t2.size()){
            if (t1[l]<t2[r]) ret.push_back(t1[l++]);
            else ret.push_back(t2[r++]);
        }
        while(l<t1.size()) ret.push_back(t1[l++]);
        while(r<t2.size()) ret.push_back(t2[r++]);
        return ret;
    }
private:
    vector<int> t1,t2;
    vector<int> ret;
    void dfs(TreeNode *x,vector<int>& tr){
        if (!x) return ;
        dfs(x->left,tr);
        tr.push_back(x->val);
        dfs(x->right,tr);
    }
};
```
