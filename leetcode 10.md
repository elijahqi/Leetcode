# Leetcode 10

Given pattern string and string, we want to have a perfect match for the string s to match the pattern string. From the pattern string, '*' can be matched by
every character before it. For  '.' it can be match every single character from string s.

Thus if now we stand on the idp(patern position), and and the next of idp is '*' then we can do nothing and step 2 steps from idp to next. Or we want to use
this "*" to match whether it's same for the ids in the string s.

For not the same situation , we should have to check whether all character are all the same.

```cpp
class Solution {
public:
    bool isMatch(string s, string p) {
        s1=s;p1=p;
        return check_match(0,0);
    }
private:
    string s1, p1;
    bool check_match(int ids,int idp){
        if (idp>=p1.size()){
            return ids==s1.size();
        }
        if((idp+1)<p1.size()&&p1[idp+1]=='*'){
            if (check_match(ids,idp+2)) return true;
            if (ids<s1.size()&&(p1[idp]=='.'||p1[idp]==s1[ids])) return check_match(ids+1,idp);
        }else if(ids<s1.size()&&(p1[idp]=='.'||s1[ids]==p1[idp])){
            return check_match(ids+1,idp+1);
        }
        return false;
    }
};
```
