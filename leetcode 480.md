# Leetcode 480 Sliding Window Median

Use BST to check for the median point.
```cpp

class Solution {
public:
    vector<double> medianSlidingWindow(vector<int>& nums, int k) {
        vector<double> ret;
        if (!k) return ret;
        multiset<int> wd(nums.begin(),nums.begin()+k);
        auto mid=next(wd.begin(),(k-1)/2);
        for (int i=k;i<=nums.size();++i){
            ret.push_back(((double)(*mid)+*next(mid,(k+1)%2))/2.0);
            if (i==nums.size()) break;
            wd.insert(nums[i]);
            if (nums[i]<*mid) --mid; 
            if (nums[i-k]<=*mid) ++mid;
            wd.erase(wd.lower_bound(nums[i-k])); 
        }
        return ret;
    }
};
```
