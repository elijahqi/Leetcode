# Leetcode 117 Populating Next Right Pointers in Each Node II

Same as Leetcode 116

```cpp
/*
// Definition for a Node.
class Node {
public:
    int val;
    Node* left;
    Node* right;
    Node* next;

    Node() : val(0), left(NULL), right(NULL), next(NULL) {}

    Node(int _val) : val(_val), left(NULL), right(NULL), next(NULL) {}

    Node(int _val, Node* _left, Node* _right, Node* _next)
        : val(_val), left(_left), right(_right), next(_next) {}
};
*/

class Solution {
public:
    Node* connect(Node* root) {
        net.resize(5000);
        dfs(root,0);
        return root;
    }
private:
    vector<Node*> net;
    void dfs(Node *x, int de){
        if (!x) return;
        dfs(x->right,de+1);
        x->next=net[de];
        net[de]=x;
        dfs(x->left,de+1);
    }
};
```
