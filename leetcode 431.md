# leetcode 431 Encode N-ary Tree to Binary Tree

This quesiton I don't have too much idea, thus I use official answer as reference.

The first child connect to father's left, and all the other sibling vertices will connect to first child's right.
Then we can apply recursion or BFS to solve this problem.

```cpp
/*
// Definition for a Node.
class Node {
public:
    int val;
    vector<Node*> children;

    Node() {}

    Node(int _val) {
        val = _val;
    }

    Node(int _val, vector<Node*> _children) {
        val = _val;
        children = _children;
    }
};
*/

/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode(int x) : val(x), left(NULL), right(NULL) {}
 * };
 */

class Codec {
public:
    // Encodes an n-ary tree to a binary tree.
    TreeNode* encode(Node* root) {
        if (!root) return nullptr;TreeNode *cur=nullptr;
        TreeNode *nroot= new TreeNode(root->val);
        if (!root->children.empty()){
            nroot->left=encode(root->children[0]);
            cur=nroot->left;
        }
        for (int i=1;i<root->children.size();++i){
            cur->right=encode(root->children[i]);
            cur=cur->right;
        }
        return nroot;
    }
	
    // Decodes your binary tree to an n-ary tree.
    Node* decode(TreeNode* root) {
        if (!root) return nullptr;
        Node *nroot=new Node(root->val);
        TreeNode *cur=nullptr;
        if(root->left)
            nroot->children.push_back(decode(root->left));
        cur=root->left;
        while(cur&&cur->right){
            nroot->children.push_back(decode(cur->right));
            cur=cur->right;
        }
        return nroot;
    }
};

// Your Codec object will be instantiated and called as such:
// Codec codec;
// codec.decode(codec.encode(root));
```
