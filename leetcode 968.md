# Leetcode 968 Binary Tree Cameras

Greedy +recursion
If we reach the leaf node we should set it to be covered.
For the camera and empty status, we should judge whether it's empty first then judge whether it's camera status.
For the root node, we should judge whether it's empty then we should check whether we should add one camera.
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
enum class State{empty,covered,camera};
class Solution {
public:
    int minCameraCover(TreeNode* root) {
        auto t=dfs(root);
        if (t==State::empty) ++ret;
        return ret;
    }
private:
    int ret=0;
    State dfs(TreeNode *x){
        if (!x) return State::covered;
        auto l=dfs(x->left);
        auto r=dfs(x->right);
        
        if (l==State::empty||r==State::empty) 
        {++ret;return State::camera;}
        if (l==State::camera||r==State::camera) return State::covered;
        return State::empty;
    }
};
```
