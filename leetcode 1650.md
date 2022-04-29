# leetcode 1650

For this question it's quite similar to 1644 and leetcode 235.
But here it will not provide the current node, but instead of a parent strored in the structure.

And think of the double linked_list, we know that
the distance of (p->root + place p at q to common node )
is dqual to the distance of (q->root + place q at p and go to common node)

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
public:
    Node* lowestCommonAncestor(Node* p, Node * q) {
        Node *l=p,*r=q;
        while(l!=r){
            l=l==nullptr?q:l=l->parent;
            r=r==nullptr?p:r=r->parent;
        }
        return l;
    }
};
```
