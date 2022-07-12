# Leetcode 2263 Make Array Non-decreasing or Non-increasing
We can use the priority_queue to maintain the max or min number that we already have, and every time if it satisfy the requirements, then we continue. Otherwise, we will change the most significant large or small one to current one.,
```cpp
class Solution {
private:
    int non_decreasing(vector<int> &nums){
        priority_queue<int> q;
        q.push(nums[0]);int ret=0;
        for (int i=1;i<nums.size();++i){
            if (q.top()>=nums[i]){
                ret+=q.top()-nums[i];
                q.pop();
                q.push(nums[i]);
            }
            q.push(nums[i]);
        }
        return ret;
    }
    int non_increasing(vector<int> &nums){
        priority_queue<int,vector<int>,greater<int> >q;
        q.push(nums[0]);int ret=0;
        for (int i=1;i<nums.size();++i){
            if (q.top()<=nums[i]){
                ret+=nums[i]-q.top();
                q.pop();
                q.push(nums[i]);
            }
            q.push(nums[i]);
        }
        return ret;
    }
public:
    int convertArray(vector<int>& nums) {
        return min(non_decreasing(nums),non_increasing(nums));
    }
};
```
