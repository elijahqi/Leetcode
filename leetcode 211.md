# Leetcode 211 Design Add and Search Words Data Structure

Use unorderset combined with unordered map to store the info for the length of every length.
```cpp
class WordDictionary {
private:
    unordered_set<string> s;
    unordered_map<int,unordered_set<string> >mp;
    bool check(const string &s1,const string &s2){
        for (int i=0;i<s1.size();++i){
            if(s1[i]=='.') continue;
            if (s1[i]!=s2[i]) return false;
        }
        return true;
    }
public:
    WordDictionary() {
        
    }
    
    void addWord(string word) {
        s.insert(word);
        mp[word.size()].insert(word);
    }
    
    bool search(string word) {
        auto pos=word.find_first_of('.');
        if (pos==string::npos)
            return s.count(word);
        for (auto &w:mp[word.size()]){
            if (check(word,w)) return true;
        }
        return false;
    }
};

/**
 * Your WordDictionary object will be instantiated and called as such:
 * WordDictionary* obj = new WordDictionary();
 * obj->addWord(word);
 * bool param_2 = obj->search(word);
 */
```
