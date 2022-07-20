# Leetcode 2272 Substring With Largest Variance

Firstly, to this question, we can check all the combinations. Then the time complexity will be 26*26.
Then we let one of it be the maximum and the other one be the minimum. Use dp to have the maximum sum of the every consecutive subsequence.
Then another thing we should care about is that it has to have at least -1 within the consecutive subsequence. So whenever we encountered the -1.
```cpp
class Solution {
private:
    int get(vector<int> &nums){
        int n=nums.size();
        vector<int> dp1(n);
        dp1[0]=nums[0];
        for (int i=1;i<n;++i)
            dp1[i]=max(dp1[i-1]+nums[i],nums[i]);
        int cur_s=0,ret=0;
        for (int i=n-1;i>=0;--i){
            cur_s=max(cur_s+nums[i],nums[i]);
            if (nums[i]==-1){
                ret=max(ret,dp1[i]+cur_s-nums[i]);
            }
        }
        return ret;
    }
public:
    int largestVariance(string s) {
        vector<int> cnt(26);
        for (auto c:s) cnt[c-'a']++;
        const int n=s.size();
        int ret=0;
        for (int i=0;i<26;++i){
            for (int j=0;j<26;++j){
                if (!cnt[i]) continue;
                if (!cnt[j]) continue;
                if (i==j) continue;
                vector<int> nums(n,0);
                for (int k=0;k<n;++k){
                    if (s[k]=='a'+i) nums[k]=1;
                    else if(s[k]=='a'+j) nums[k]=-1;
                }
                ret=max(ret,get(nums));
            }
        }
        return ret;
    }
};
```
