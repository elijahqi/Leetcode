# Leetcode 2343 Query Kth Smallest Trimmed Number
Use nth_element to speed up the finding process
```cpp
class Solution {
private:
    
public:
    vector<int> smallestTrimmedNumbers(vector<string>& nums, vector<vector<int>>& queries) {

        
        vector<int> ret;
        for (int i=0;i<queries.size();++i){
            vector<pair<string,int> > tp;
            auto &q=queries[i];
            int k=q[0],d=q[1];
            for (int j=0;j<nums.size();++j){
                tp.push_back({nums[j].substr(nums[j].size()-d,d),j});
            }
            nth_element(begin(tp),tp.begin()+k-1,end(tp));
            
            ret.push_back(tp[k-1].second);
        }
        return ret;
    }
};
```
