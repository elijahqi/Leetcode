#Leetcode 703
Use priority to store the k largest element of the vector
```cpp
class KthLargest {
public:
    KthLargest(int k, vector<int>& nums) {
        sort(nums.begin(),nums.end());
        sz=k;
        for (int i=nums.size()-1;(i>=0)&&(i>=((int)nums.size()-k));--i) {
            q.push(nums[i]);
            }
    }
    
    int add(int val) {
        if (q.size()<sz) {q.push(val);return q.top();} 
        if (val<q.top()) return q.top();
        q.pop();
        q.push(val);
        return q.top();
    }
private:
    int sz;
    priority_queue<int,vector<int>,greater<int> > q;
};

/**
 * Your KthLargest object will be instantiated and called as such:
 * KthLargest* obj = new KthLargest(k, nums);
 * int param_1 = obj->add(val);
 */
 ```
