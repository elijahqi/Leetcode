# Leetcode 1472 Design Browser History


Use vector to mock and also have index and last_index to record where the current website is in.
```cpp
class BrowserHistory {
public:
    BrowserHistory(string homepage) {
        visit(homepage);
    }
    
    void visit(string url) {
        if (++index<urls.size()) urls[index]=url;
        else urls.push_back(url);
        last_index=index;
    }
    
    string back(int steps) {
        index=max(0,index-steps);
        return urls[index];
    }
    
    string forward(int steps) {
        index=min(last_index,index+steps);
        return urls[index];
    }
private:
    vector<string> urls;
    int index=-1,last_index=-1;
};

/**
 * Your BrowserHistory object will be instantiated and called as such:
 * BrowserHistory* obj = new BrowserHistory(homepage);
 * obj->visit(url);
 * string param_2 = obj->back(steps);
 * string param_3 = obj->forward(steps);
 */
```
