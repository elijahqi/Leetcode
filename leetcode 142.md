# Leetcode 142 Linked List Cycle II
if no cycle, then return nullptr
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
private:
    unordered_map<ListNode*,bool> mp;
public:
    ListNode *detectCycle(ListNode *head) {
        if (!head) return nullptr;
        mp[head]=true;
        while(head->next){
            if (mp[head->next]) return head->next;
            head=head->next;
            mp[head]=true;
        }
        return nullptr;
    }
};
```
