# Leetcode 239 Sliding Window Maximum

Monotonic Queue
```cpp
class Solution {
public:
    vector<int> maxSlidingWindow(vector<int>& nums, int k) {
        vector<int> ret;
        for (int i=0;i<nums.size();++i){
            while(!q.empty()&&q.back()<nums[i]) q.pop_back();
            q.push_back(nums[i]);
            if (i>=k-1){
                ret.push_back(q.front());
                if (nums[i-k+1]==q.front()) q.pop_front();
            }
        }
        return ret;
    }
private:
    deque<int> q;
};
```
