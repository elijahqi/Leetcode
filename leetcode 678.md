# Leetcode 678 Valid Parenthesis String


```java
class Solution {
    public boolean checkValidString(String s) {
        int cntmx=0;
        int cntmn=0;
        // If we encounter * we have different strategies to treat it.
        //Thus we should set up two cnt to count the two situations.
        //cnt mn we use as the right parentheses
        for (int i=0;i<s.length();++i){
            char c=s.charAt(i);
            if (c=='(') {++cntmn;++cntmx;}
            else if (c==')') {--cntmn;--cntmx;}
            else{
                ++cntmx;--cntmn;
                
            }
            if (cntmx<0) return false;
            if (cntmn<0) ++cntmn;
        }
        return cntmn==0;
    }
}
```
