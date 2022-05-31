# Leetcode 953 Verifying an Alien Dictionary

This question says that there is an alien dictionary whose alphabetical order is different from that in English, but it still uses the original 26 letters. Now, given the dictionary order of this alien language and an array of words, ask whether these words are in alphabetical order. For normal alphabetical order, it is to compare the two words alphabetically, as long as there are letters that are different, then we can know the order of the two words. If the letters that are compared are all the same, but one word ends early, and there are letters after the other word, then the shorter one comes first. The overall comparison idea is still the same, that is, the order of letters should be used in its given order, so a HashMap is used to build a mapping between letters and their corresponding positions, so that when comparing the order of letters, the values can be taken directly from the HashMap. If the order of a pair does not match, it will return false, and the specific comparison method is the same as before, comparing letters one by one. If the letters on the corresponding bit are the same, it will be skipped directly; if the preceding letters are in the next order, it will return false directly, otherwise break off (note that the reason for not returning true directly here is that there may be cases that do not meet the requirements of the question later). When the outer for loop exits normally, return true, see the code as follows.

```cpp
class Solution {
public:
    bool isAlienSorted(vector<string>& words, string order) {
        for (int i=0;i<order.size();++i) mp[order[i]]=i;
        for (int i=1;i<words.size();++i){
            string w1=words[i-1],w2=words[i];
            int n1=w1.size(),n2=w2.size();
            for (int j=0;j<n1&&j<n2;++j){
                if (w1[j]==w2[j]) continue;
                if (mp[w1[j]]>mp[w2[j]]) return false;
                else break;
            }
            if (n1>n2&&w1.substr(0,n2)==w2) return false;
        }
        return true;
    }
private:
    unordered_map<char,int> mp;
};
```
