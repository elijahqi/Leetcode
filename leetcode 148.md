# Leetcode 148 Sort List
There are many common sorting methods, insertion sort, selection sort, heap sort, quick sort, bubble sort, merge sort, bucket sort, etc. They have different time complexity. Their time complexity is not the same, and here the topic limits the time must be O(nlgn), in line with the requirements of only fast sort, merge sort, heap sort, and according to the characteristics of the single-linked table, the most suitable to use merge sort. Why? This is due to the characteristics of the chain table itself, because it can not be directly accessed through the coordinates of the elements of the sort, if the new node, or can be considered, if only exchange nodes, it is best not to use. And the subsumption sort (also known as mixed sort) because it can use recursion to exchange numbers, naturally suitable for such structures as the chain table. The core of merge sort is a merge() function, which mainly merges two ordered chains, a separate topic in LeetCode, Merge Two Sorted Lists, and since two chains are ordered to merge easily, how can we split an unordered chain into two ordered chains? Let's think about it from a simple point of view, when two chained tables must be ordered? When there is only one node in each of the two chained tables, it must be ordered. The core of subordination is actually Divide and Conquer, which is to break the chain table into two parts from the middle, and then call the recursive function sortList() on the left and right side respectively to get the respective ordered chain table, and then merge(), so that the whole is ordered. Because the recursive function of the sub-linked table will still split into two halves again, when splitting to only one node of the chain table, can not continue to split, and this just meet the previous "a node must be ordered when", so you can carry out merge. Then we can go back and get an ordered chain table each time, and then merge until the whole length is restored. Here the method to break the chain table from the middle is to use the fast and slow pointers.

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
    ListNode* merge(ListNode *l,ListNode *r){
        auto *dummy=new ListNode(-1);
        auto *cur=dummy;
        while(l&&r){
            if (l->val<r->val){
                cur->next=l;
                l=l->next;
            }else{
                cur->next=r;
                r=r->next;
            }
            cur=cur->next;
        }
        if(l) cur->next=l;
        if(r) cur->next=r;
        return dummy->next;
    }
public:
    ListNode* sortList(ListNode* head) {
        if (!head||!head->next) return head;
        auto mid=head,fast=head,slow=head;
        while(fast&&fast->next){
            mid=slow;
            slow=slow->next;
            fast=fast->next->next;
        }
        mid->next=nullptr;
        return merge(sortList(head),sortList(slow));
    }
};
```
