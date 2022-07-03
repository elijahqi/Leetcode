# Leetcode 437 Path Sum III

Use prefix sum to record, and also record the number times.
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
    unordered_map<int,int> sum;
    int tgsum=0;
    int ret=0;
    void dfs(TreeNode *x,long num){
        if (!x) return;
        num+=x->val;
        ret+=sum[num-tgsum];
        ++sum[num];
        dfs(x->left,num);
        dfs(x->right,num);
        --sum[num];
    }
public:
    int pathSum(TreeNode* root, int targetSum) {
        if (!root) return 0;
        tgsum=targetSum;
        sum[0]=1;
        dfs(root,0);
        return ret;
    }
};
```
