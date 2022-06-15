# Leetcode 527 Word Abbreviation
Since the number of letters before the number of digits in the abbreviated form of each word is not necessarily the same, a pre array is used to record the length of the letters at the beginning of each word's abbreviated form, initialized to 1, and then all the abbreviated forms of words with a pre of 1 are found first, and then the conflict is handled. Iterate through each abbreviated string, make a while loop, create a new HashSet, then iterate through all the other strings, all found conflicting strings, put the coordinates of the conflicting strings into the HashSet, if there is no conflict, then the HashSet is empty, break directly, if there is a conflict, then also add the currently traversed position i to the If there is a conflict, the current position i is added to the HashSet, and then all the positions in the HashSet are iterated, and the abbreviation function is called on them, and the value of pre is incremented by 1 until no conflict exists.

```cpp
class Solution {
public:
    vector<string> wordsAbbreviation(vector<string>& words) {
        int n=words.size();
        vector<string> ret(n);
        vector<int> pre(n,1);
        for (int i=0;i<words.size();++i) ret[i]=gao(words[i],pre[i]);
        for (int i=0;i<n;++i){
            while(1){
                vector<int>op;
                for (int j=i+1;j<n;++j) if (ret[j]==ret[i]) op.push_back(j);
                if (op.empty()) break;
                op.push_back(i);
                for (auto i:op) ret[i]=gao(words[i],++pre[i]);
            }
        }
        return ret;
    }
private:
    string gao(string &a,int l){
        return (l>=a.size()-2)?a:a.substr(0,l)+to_string(a.size()-l-1)+a.back();
    }
};
```
