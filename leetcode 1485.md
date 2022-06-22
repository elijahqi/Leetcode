# Leetcode 1485 Clone Binary Tree With Random Pointer

```cpp
/**
 * Definition for a Node.
 * struct Node {
 *     int val;
 *     Node *left;
 *     Node *right;
 *     Node *random;
 *     Node() : val(0), left(nullptr), right(nullptr), random(nullptr) {}
 *     Node(int x) : val(x), left(nullptr), right(nullptr), random(nullptr) {}
 *     Node(int x, Node *left, Node *right, Node *random) : val(x), left(left), right(right), random(random) {}
 * };
 */

class Solution {
public:
    NodeCopy* copyRandomBinaryTree(Node* node) {
        if (!node) return nullptr;
        unordered_map<Node*,NodeCopy*> mp;
        
        NodeCopy* cur=mp[node]=new NodeCopy(node->val);
        queue<Node*> q;q.push(node);
        while(!q.empty()){
            auto x=q.front();q.pop();
            if (x->left){
                auto find_it=mp.find(x->left);
                if (find_it==mp.end()){
                    auto y=x->left;
                    auto yy=mp[y]=new NodeCopy(y->val);
                    mp[x]->left=yy;
                }else{
                    mp[x]->left=find_it->second;
                }
                q.push(x->left);
            }
            if (x->right){
                auto find_it=mp.find(x->right);
                if (find_it==mp.end()){
                    auto y=x->right;
                    auto yy=mp[y]=new NodeCopy(y->val);
                    mp[x]->right=yy;
                }else{
                    mp[x]->right=find_it->second;
                }
                q.push(x->right);
            }
            if (x->random){
                auto find_it=mp.find(x->random);
                if (find_it==mp.end()){
                    auto y=x->random;
                    auto yy=mp[y]=new NodeCopy(y->val);
                    mp[x]->random=yy;
                }else{
                    mp[x]->random=find_it->second;
                }
            }
        }
        return cur;
    }
};
```
