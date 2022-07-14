# Leetcode 1755 Closest Subsequence Sum

We can divided the arrays into two parts. 
Pre_processing the second parts , and sorts that vector.
Every time we use brute force to check all the status and then use binary search to find the most near data.
Then brute force to go through all the data, and find the minimum.
```cpp
class Solution {
using ll= long long;
private:
    void pre_process(vector<ll>&mp,vector<int> &nums2){
        const int n=nums2.size();
        for (int s=0;s<(1<<n);++s){
            int cnt=0;long long sum=0;
            for (int i=0;i<n;++i) 
                if ((s>>i)&1) ++cnt,sum+=nums2[i];
            mp.push_back(sum);
        }
        sort(begin(mp),end(mp));
        
    }
public:
    int minAbsDifference(vector<int>& nums, int goal) {
        const int n=nums.size()/2;
        vector<int> nums1,nums2;
        for (int i=0;i<n;++i) nums1.push_back(nums[i]);
        for (int i=n;i<nums.size();++i) nums2.push_back(nums[i]);
        vector<ll> mp;
        pre_process(mp,nums2);
        long long ret=1ll<<60;
        
        for (int s=0;s<(1<<n);++s){
            long long cur=0;
            int cnt=0;
            for (int i=0;i<n;++i)
                if ((s>>i)&1) cur+=nums[i],cnt++;
            int j=nums.size()-cnt;
            auto find_it=lower_bound(begin(mp),end(mp),goal-cur);
            if (find_it!=mp.end()){
                ret=min(ret,abs(goal-(cur+*find_it)));
            }
            if (find_it!=mp.begin()){
                find_it=prev(find_it);
                ret=min(ret,abs(goal-(cur+*find_it)));
            }
        }
        return ret;
    }
};
```
