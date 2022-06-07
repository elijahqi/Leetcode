# Leetcode 138 Copy List with Random Pointer

if randoom node or next node does not exist then NEW it and store the pointer in the unordered_map
```cpp
/*
// Definition for a Node.
class Node {
public:
    int val;
    Node* next;
    Node* random;
    
    Node(int _val) {
        val = _val;
        next = NULL;
        random = NULL;
    }
};
*/

class Solution {
public:
    Node* copyRandomList(Node* head) {
        if(!head) return nullptr;
        unordered_map<Node *,Node *> mp;
        Node *cur=mp[head]=new Node(head->val);
        Node *ret=cur;
        while(head){
            if (head->random){
                auto find_it=mp.find(head->random);
                if (find_it==mp.end()){
                    find_it=mp.emplace(head->random,new Node(head->random->val)).first;
                }
                cur->random=find_it->second;
            }
            if (head->next){
                auto find_it=mp.find(head->next);
                if (find_it==mp.end()){
                    find_it=mp.emplace(head->next,new Node(head->next->val)).first;
                }
                cur->next=find_it->second;
            }
            head=head->next;
            cur=cur->next;
        }
        return ret;
    }
};
```
