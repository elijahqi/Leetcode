# Leetcode 443 String Compression


Double pointers i and j, i at the origin, traversed by j. When j detects the end of the duplicate, first add i to the array (starting from the beginning) and convert j to char and add it to the array as well.
```cpp
class Solution {
public:
    int compress(vector<char>& chars) {
        char last='|';int cnt=0;
        for (auto i:chars) {
            if (i!=last) {order.push_back({last,cnt});
                last=i;cnt=1;continue;}
            ++cnt;
        }
        int now=0;
        order.erase(order.begin());
        if (last==chars[chars.size()-1]) order.push_back({last,cnt});
        for (auto i:order){
            if(i.second==1) {chars[now++]=i.first;continue;}
            chars[now++]=i.first;
            string s=to_string(i.second);
            for (auto j:s)chars[now++]=j;
        }
        return now;
    }
private:
    
    vector<pair<char,int> > order;
};
```
