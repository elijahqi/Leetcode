# Leetcode 510 Inorder Successor in BST II


```cpp
/*
// Definition for a Node.
class Node {
public:
    int val;
    Node* left;
    Node* right;
    Node* parent;
};
*/

class Solution {
Node* dfs(Node* x){
    if (x->left) return dfs(x->left);
    else return x;
}
public:
    Node* inorderSuccessor(Node* node) {
        if (node->right) return dfs(node->right);
        while(node->parent&&node->parent->left!=node) {
            node=node->parent;
        }
        if (node->parent&&node->parent->left==node) return node->parent;
        return nullptr;
        
    }
};
```
