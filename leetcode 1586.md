# leetcode 1586 Binary Search Tree Iterator II
We will use STL stack and vector to solve this problem. This problem requires us to follow the instruction provided to move the iterator in the binary search tree for previous or next.
Also in the last part of the question, this question asked us to solve the problem without precalculating the values of the tree.
Thus we can come to the solution that every time we use the stack to maintain the left of the tree, and the vector is used to maintain all the elements that have been visited by the iterator.
We know that every time we pop the stack means that we go up to the upper nodes in the tree. In this sithation we have to go the that node's right and use stack to go left again to maintain all the nodes again.
The integer id is used to tell us where we are in the vector.

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
class BSTIterator {
public:
    BSTIterator(TreeNode* root) {
        while(root){
            stack1.push(root);
            root=root->left;
        }
    }
    
    bool hasNext() {
        return !stack1.empty()||id+1<stack2.size();
    }
    
    int next() {
        if(id+1<stack2.size()) return stack2[++id]->val;
        TreeNode* node1=stack1.top();id=stack2.size();
        stack1.pop();stack2.push_back(node1);
        int ret=node1->val;
        node1=node1->right;
        while(node1){
            stack1.push(node1);
            node1=node1->left;
        }
        return ret;
    }
    
    bool hasPrev() {
        return id>0;
    }
    
    int prev() {
        return stack2[--id]->val;
    }
private:
    int id=0;
    stack<TreeNode*> stack1;
    vector<TreeNode*> stack2;
};

/**
 * Your BSTIterator object will be instantiated and called as such:
 * BSTIterator* obj = new BSTIterator(root);
 * bool param_1 = obj->hasNext();
 * int param_2 = obj->next();
 * bool param_3 = obj->hasPrev();
 * int param_4 = obj->prev();
 */
```
