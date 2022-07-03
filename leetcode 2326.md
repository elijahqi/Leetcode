# Leetcode 2326 Spiral Matrix IV

Just like leetcode 54, we set up four pointers, and use loop to go over them.
If the linkedList is not exist, then we break out the loop.
THen go through all the components and check whether they are filled.
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
    vector<vector<int>> spiralMatrix(int m, int n, ListNode* head) {
        vector<vector<int> >ret(m,vector<int>(n,INT_MAX));
        int up=0,down=m-1;
        int left=0,right=n-1;
        while(1){
            for (int i=left;i<=right;++i) {
                if (!head) break;
                ret[up][i]=head->val;
                head=head->next;
            }
            if (++up>down) break;
            for (int i=up;i<=down;++i){
                if (!head) break;
                ret[i][right]=head->val;
                head=head->next;
            }
            if (--right<left) break;
            for (int i=right;i>=left;--i){
                if (!head) break;
                ret[down][i]=head->val;
                head=head->next;
            }
            if (--down<up) break;
            for (int i=down;i>=up;--i){
                if (!head) break;
                ret[i][left]=head->val;
                head=head->next;
            }
            if (++left>right) break;
        }
        for (int i=0;i<m;++i)
            for (int j=0;j<n;++j) if (ret[i][j]==INT_MAX) ret[i][j]=-1;
        return ret;
    }
};
```
