# Leetcode 445 Add Two Numbers II

Just more complex than add two numbers. You need to go through the linked list
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
private:
    ListNode* reverse(ListNode *x){
        ListNode* pre=nullptr;
        while(x){
            ListNode *nxt=x->next;
            x->next=pre;pre=x;x=nxt;
        }
        return pre;
    }
    
public:
    ListNode* addTwoNumbers(ListNode* l1, ListNode* l2) {
        ListNode* st1=reverse(l1), *st2=reverse(l2);
        ListNode *st=nullptr,*cur=nullptr,*pre=nullptr;
        int car=0;
        while(st1&&st2){
            int s=(st1->val)+(st2->val)+car;
            cur=new ListNode(s%10);
            car=s/10;
            if (pre) pre->next=cur;
            else pre=cur,st=cur;
            pre=cur;
            st1=st1->next;st2=st2->next;
        }
        while(st1){
            int s=(st1->val)+car;
            cur=new ListNode(s%10);
            car=s/10;
            if (pre) pre->next=cur;
            else pre=cur,st=cur;
            pre=cur;st1=st1->next;
        }
        while(st2){
            int s=(st2->val)+car;
            cur=new ListNode(s%10);
            car=s/10;
            if (pre) pre->next=cur;
            else pre=cur,st=cur;
            pre=cur;st2=st2->next;
        }
        if (car){
            int s=car;
            cur=new ListNode(s%10);
            car=s/10;
            if (pre) pre->next=cur;
            else pre=cur,st=cur;
            pre=cur;
        }
        return reverse(st);
    }
};
```
