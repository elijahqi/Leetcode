# Leetcode 359 Logger Rate Limiter


Use unordered_map to check
```cpp
class Logger {
public:
    Logger() {
        
    }
    
    bool shouldPrintMessage(int timestamp, string message) {
        if (mp.find(message)==mp.end()) {mp[message]=timestamp;return true;}
        
        if (mp[message]+10>timestamp) return false;
        mp[message]=timestamp;
        return true;
    }
private:
    unordered_map<string,int> mp;
};

/**
 * Your Logger object will be instantiated and called as such:
 * Logger* obj = new Logger();
 * bool param_1 = obj->shouldPrintMessage(timestamp,message);
 */
```
