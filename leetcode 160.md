# Leetcode 160 Intersection of Two Linked Lists

if ListA is longer than ListB then we will firstly move ListA,
if ListB is longer than ListA then we will firstly move ListB.
Otherwise we will move both together.
Also we should judge at each place.

```cpp
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode(int x) : val(x), next(NULL) {}
 * };
 */
class Solution {
public:
    ListNode *getIntersectionNode(ListNode *headA, ListNode *headB) {
        int sz1=0,sz2=0;
        ListNode *st1=headA;
        ListNode *st2=headB;
        while(headA){
            ++sz1;
            headA=headA->next;
        }
        headA=st1;
        while(headB){
            headB=headB->next;
            ++sz2;
        }
        headB=st2;
        while(headA&&headB){
            if (headA==headB) return headA;
            if (sz1>sz2) {headA=headA->next;--sz1;continue;}
            if (sz1<sz2) {headB=headB->next;--sz2;continue;}
            headA=headA->next;
            headB=headB->next;
        }
        
        
        return ret;
    }
private:
    ListNode *ret=nullptr;
};
```
