# Leetcode 907 Sum of Subarray Minimums

This is a monotonic stack's application.
My method is to record how far can current ith number dominate which is smaller than all the elements between this range in the sequence.Then for that specific range all the subsequence will have ith element as the minimum elements. Then all consecutive subintervals within this interval can be used as answers. But it needs to be satisfied that these consecutive subintervals cover at least this i_th element. Another thing should be care about is the duplicate elements in the arrays.We need to calculate the length of the left and right extensions on one side only, so as to prevent the interval from being repeatedly covered by two identical elements.
```cpp
class Solution {
private:
    const int mod=1e9+7;
public:
    int sumSubarrayMins(vector<int>& arr) {
        vector<pair<int,int> >range(arr.size(),{0,0});
        stack<int> q;
        for (int i=0;i<arr.size();++i){
            int l=i;
            while(!q.empty()&&arr[i]<=arr[q.top()]){
                l=range[q.top()].first;q.pop();
            }
            q.push(i);
            range[i].first=l;
        }
        while(!q.empty()) q.pop();
        for (int i=arr.size()-1;i>=0;--i){
            int r=i;
            while(!q.empty()&&arr[i]<arr[q.top()]){
                r=range[q.top()].second;q.pop();
            }
            q.push(i);
            range[i].second=r;
        }
        int ret=0;
        for (int i=0;i<arr.size();++i){
            long long l=(i-range[i].first+1);
            long long r=(range[i].second-i+1);
            ret+=l*r%mod*arr[i]%mod;
            ret%=mod;
        }
        return ret;
    }
};
```
