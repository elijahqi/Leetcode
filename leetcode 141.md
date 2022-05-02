# Leetcode 141
dfs, and if we encounter the same node, then we will return true.

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
    bool hasCycle(ListNode *head) {
        return dfs(head);
    }
private:
    bool dfs(ListNode *x){
        if (!x) return false;
        if (visit[x]) return true;
        visit[x]=1;
        return dfs(x->next);
    }
    unordered_map<ListNode*,bool> visit;
};
```
