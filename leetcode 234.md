# Leetcode 234 Palindrome Linked List
For this question, to achieve the aim that we only use O(1) memory and O(n) time complexity. I learned a new method called fast and slow pointer.
The basic idea of the fast-slow pointer method, also known as the tortoise and hare algorithm, is to use two pointers that move at different speeds over a sequential structure such as an array or a linked table. This method is very useful for working with "circular" linked tables or arrays.

Thus for this question, our idea is 
1. use fast / slow pointers to find the middle node and see whether the list has odd/even number of elements.
2. Reverse the right half the list, and compare with the left half


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
    bool isPalindrome(ListNode* head) {
        ListNode *slow=head;
        ListNode *fast=head;
        // Fast and Slow pointer method
        while(fast && fast ->next){
            slow=slow->next;
            fast=fast->next->next;
        }
        // Then we need to judge whether the list is odd or even
        if (fast) slow=slow->next;
        slow=reverse(slow);
        while(slow){
            if (slow->val!=head->val) return false;
            slow=slow->next;head=head->next;
        }
        return true;
    }
private:
    ListNode* reverse(ListNode* x){
        ListNode *prev=nullptr,*next=nullptr;
        while(x){
            next=x->next;
            x->next=prev;
            prev=x;
            x=next;
        }
        return prev;
    }
};
```
