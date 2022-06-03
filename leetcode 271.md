# Leetcode 271 Encode and Decode Strings

Find one of the char that can not been exist in the string.
```cpp
class Codec {
public:

    // Encodes a list of strings to a single string.
    string encode(vector<string>& strs) {
        string ret="";
        for (int i=0;i<strs.size();++i) ret+=strs[i],ret+='\0';
        return ret;
    }

    // Decodes a single string to a list of strings.
    vector<string> decode(string s) {
        vector<string> ret;
        stringstream ss(s);
        string s1;
        while (getline(ss,s1,'\0')){
            ret.push_back(s1);
        }
        return ret;
    }
};

// Your Codec object will be instantiated and called as such:
// Codec codec;
// codec.decode(codec.encode(strs));
```
