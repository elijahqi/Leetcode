# Leetcode 1291 Sequential Digits
Use for loop to enumerate the length of low string to the length of high string. Then for each size we can use O(1) to get every possible solutions. Use stoi convert them to integer and then store in deque. Finally use deque to pop_front and pop_back until the answer satisfy all the requirements.
```cpp
class Solution {
private:
    void make(deque<int> &ret,int le){
        string s;
        for (int i=0;i<le;++i) s.push_back('1'+i);
        for (int st='0'+1;st<='0'+10-le;++st){
            string s;
            for (int i=0;i<le;++i) s.push_back(st+i);
            ret.push_back(stoi(s));
        }
    }
public:
    vector<int> sequentialDigits(int low, int high) {
        deque<int> ret;
        string low_s=to_string(low);
        string high_s=to_string(high);
        for (int i=low_s.size();i<=high_s.size();++i) make(ret,i);
        while(!ret.empty()&&ret.front()<low) ret.pop_front();
        while(!ret.empty()&&ret.back()>high) ret.pop_back();
        vector<int> ret_v(begin(ret),end(ret));
        return ret_v;
    }
};
```
