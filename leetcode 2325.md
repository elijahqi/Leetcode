# Leetcode 2325 Decode the Message
Pay attention to some constraints
```cpp
class Solution {
private:
    unordered_map<char,char> mp;
public:
    string decodeMessage(string key, string message) {
        int cnt=0;
        for (int i=0;i<key.size();++i) {
            if (!isalpha(key[i])) continue;
            auto find_it=mp.find(key[i]);
            if (find_it!=mp.end()) continue;
            mp[key[i]]='a'+cnt;
            cnt++;
        }
        for (int i=0;i<message.size();++i) {
            if (message[i]==' ') continue;
            message[i]=mp[message[i]];
        }
        return message;
    }
};
```
