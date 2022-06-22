# Leetcode 663 Equal Tree Partition

Need to consider more trival things.
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
    bool checkEqualTree(TreeNode* root) {
        dfs(root);
        if (sum%2) return false;
        dfs1(root,nullptr);
        return flag;
    }
private:
    int sum;
    bool flag=false;
    void dfs(TreeNode *x){
        if (!x) return ;
        sum+=x->val;
        dfs(x->left);
        dfs(x->right);
    }
    int dfs1(TreeNode *x,TreeNode *fa){
        if(!x) return 0x7f7f7f7f;
        int sm=0;
        auto l=dfs1(x->left,x);
        if (flag) return 0x7f7f7f7f;
        auto r=dfs1(x->right,x);
        
        if (flag) return 0x7f7f7f7f;
        if (l==(sum/2)) {flag=true;return 0x7f7f7f7f;}
        if (r==(sum/2)) {flag=true;return 0x7f7f7f7f;}
        if (flag) return 0x7f7f7f7f;
        if (l==0x7f7f7f7f) l=0;
        if (r==0x7f7f7f7f) r=0;
        sm=l+r+x->val;
        if (fa==nullptr) return -1;
        if ((sum-sm)==sm) {flag=true;return 0x7f7f7f7f;}
        return sm;
    }
};
```
