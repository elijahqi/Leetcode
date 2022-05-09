# Leetcode 591 Tag Validator

Take a look at this question, it's a bracket matching problem. We use stack to simulate this problem first enter last out.

Firstly, we should focus on the " <![CDATA[ this situation >". if this exist on the end of the code, then this is not valid.
Second, we should check for the tag, the tag should all be uppercase letters and the length should be at least 1 character and less than 9 characters.
And then we should check whether there exist at least one tag. If not then it's invalid. Lastly, we should check </tag> is the end of the code string.
 

```cpp
class Solution {
public:
    bool isValid(string code) {
        stack<string> S;
        int i=0;
        while(i<code.size()){
            
            //exempt the situation for ![CDATA]
            if (i+8<code.size()&&code.substr(i,9)=="<![CDATA["){
                i+=9;
                while(i+2<code.size()&&code.substr(i,3)!="]]>") ++i;
                if (i+2==code.size()) return false;
                i+=3;
            }else if (i+1<code.size()&&code.substr(i,2)=="</"){
                i+=2;int bg=i;
                while(i<code.size()&&code[i]!='>') ++i;
                if (i==code.size()) return false;
                string tag=code.substr(bg,i-bg);
                if (S.empty()||S.top()!=tag) return false;
                S.pop();++i;
                if (S.empty()&&i!=code.size()) return false;
            }else if (code[i]=='<'){
                ++i;int bg=i;
                while(i<code.size()&&code[i]!='>') ++i;
                if (i==code.size()) return false;
                string tag=code.substr(bg,i-bg);
                if (!check(tag)) return false;
                if(!flag&&bg!=1) return false;
                flag=true;
                S.push(tag);++i;
            }else ++i;
        }
        if (!flag) return false;
        if (!S.empty()) return false;
        return true;
    }
private:
    bool check(string &a){
        if (a.size()<1||a.size()>9) return false;
        for (auto c:a){
            if (c<'A'||c>'Z') return false;
        }
        return true;
    }
    bool flag=false;
};
```
