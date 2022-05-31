# Leetcode 981 Time Based Key-Value Store

Use vector as the value of the unordered_map;
Then do the binary search to search whether there are time before my query time.
```cpp
struct T {
  string value;
  int timestamp;
    bool operator < (const T &other)const {
        return timestamp<other.timestamp;
    }
  T(string value, int timestamp) : value(value), timestamp(timestamp) {}
};
class TimeMap {
public:
    TimeMap() {
        
    }
    
    void set(string key, string value, int timestamp) {
        mp[key].push_back(T(value, timestamp));
    }
    
    string get(string key, int timestamp) {
        if (!mp.count(key)) return "";
        const auto& a=mp[key];
        int l=0,r=a.size();
        while(l<r){
            int mid=(l+r)>>1;
            if (a[mid].timestamp>timestamp) r=mid;
            else l=mid+1;
        }
        return l==0?"":a[l-1].value;
    }
unordered_map<string, vector<T>> mp;
};

/**
 * Your TimeMap object will be instantiated and called as such:
 * TimeMap* obj = new TimeMap();
 * obj->set(key,value,timestamp);
 * string param_2 = obj->get(key,timestamp);
 */
```
