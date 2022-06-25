# Leetcode 2116 Check if a Parentheses String Can Be Valid

This question is pretty similar to leetcode 678.
But the only thing that is different is that we have to change the right parenthesis to left parenthesis.
This in the code, we have to add cntmn with 2.
```java
class Solution {
    public boolean canBeValid(String s, String locked) {
        int cntmx=0;
        int cntmn=0;
        for (int i=0;i<s.length();++i){
            char c1=s.charAt(i);
            char c2=locked.charAt(i);
            if (c2=='1'){
                if(c1=='(') {++cntmx;++cntmn;}
                else {--cntmx;--cntmn;}
            }else{
                ++cntmx;--cntmn;
            }
            if (cntmx<0) return false;
            if (cntmn<0) cntmn+=2;
        }
        return cntmn==0;
    }
}
```
