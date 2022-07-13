# Leetcode 2035 Partition Array Into Two Arrays to Minimize Sum Difference

Divided the total range of the arrays into two parts. Then the largest will be only 15.
If we select i elements from the first part, then we will need to select n/2-i elements from the second part.
Then we use that status to calculate the first part and then we would expect the second part's sum+first part's sum is more approaching to the target where is the total_sum/2 the
Then we preprocess the last part.
use unordered_map and vectors to process it.
```cpp
class Solution {
private:
    void pre_process(unordered_map<int,vector<long long> >&mp,vector<int> &nums2){
        const int n=nums2.size();
        for (int s=0;s<(1<<n);++s){
            int num=0;long long cnt=0;
            for (int i=0;i<n;++i){
                if ((s>>i)&1) num++,cnt+=nums2[i];
            }
            mp[num].push_back(cnt);
            
        }
        for (auto &it:mp){
            sort(begin(it.second),end(it.second));
        }
    }
public:
    int minimumDifference(vector<int>& nums) {
        const int n=nums.size()/2;
        vector<int> nums1,nums2;
        long long ret=1ll<<60;
        long long sum=accumulate(begin(nums),end(nums),0ll);
        for (int i=0;i<n;++i) nums1.push_back(nums[i]);
        for (int i=0;i<n;++i) nums2.push_back(nums[i+n]);
        unordered_map<int,vector<long long> >mp;
        pre_process(mp,nums2);
        for (int s=0;s<(1<<n);++s){
            long long cur=0;
            int cnt=0;
            for (int i=0;i<n;++i)
                if ((s>>i)&1) cur+=nums[i],cnt++;
            int j=n-cnt;
            auto find_it=lower_bound(begin(mp[j]),end(mp[j]),sum/2-cur);
            if (find_it!=mp[j].end()){
                ret=min(ret,abs(sum-2*(cur+*find_it)));
            }
            if (find_it!=mp[j].begin()){
                find_it=prev(find_it);
                ret=min(ret,abs(sum-2*(cur+*find_it)));
            }
        }
        return ret;
    }
};
```
