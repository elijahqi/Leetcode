#Leetcode 105

In the tree inorder, if the nodes appear before that node, then it will be in the left sub-tree, otherwise it will be in the right sub-tree.
So we use map to store the location in the inorder,
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
    TreeNode* buildTree(vector<int>& preorder, vector<int>& inorder) {
        for (int i=0;i<inorder.size();++i) mp[inorder[i]]=i;
        return build(inorder,preorder,0,inorder.size()-1,0,preorder.size()-1);
    }
private:
    unordered_map<int,int>mp;
    TreeNode* build(vector<int>&inorder,vector<int>&preorder,int ib,int ie,int pb,int pe){
        if (pb>pe) return nullptr;
        int im=mp[preorder[pb]];
        int pm=pb+im-ib;
        auto x=new TreeNode(preorder[pb]);
        x->left=build(inorder,preorder,ib,im-1,pb+1,pm);
        x->right=build(inorder,preorder,im+1,ie,pm+1,pe);
        return x;
    }
};
```
