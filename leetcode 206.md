# Leetcode 206 Reverse Linked List

Just reverse it with o(n) time complexity and o(1) memory complexity
```cpp
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode() : val(0), next(nullptr) {}
 *     ListNode(int x) : val(x), next(nullptr) {}
 *     ListNode(int x, ListNode *next) : val(x), next(next) {}
 * };
 */
class Solution {
public:
    ListNode* reverseList(ListNode* head) {
        ListNode* pre=nullptr;
        while(head){
            ListNode *nxt=head->next;
            head->next=pre;
            pre=head;
            head=nxt;
        }
        return pre;
    }
};
```
