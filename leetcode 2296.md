# Leetcode 2296 Design a Text Editor


Use string to mock all these process.
```cpp
class TextEditor {
public:
    
    TextEditor() {
        pos=0;
        q="";
    }
    
    void addText(string text) {
        q.insert(pos,text);
        pos+=text.size();
    }
    
    int deleteText(int k) {
        int mn,cnt;
        if (k>=pos) mn=0,k=pos;
        else mn=pos-k;
        cnt=pos-mn;
        q.erase(mn, k);
        pos=mn;
        return cnt;
    }
    
    string cursorLeft(int k) {
        pos-=k;
        if(pos<0) pos=0;
        if(pos<=10) return q.substr(0, pos);
        else return q.substr(pos-10, 10);
    }
    
    string cursorRight(int k) {
        pos+=k;
        if(pos>q.length()) pos=q.length();
        if(pos<=10) return q.substr(0,pos);
        else return q.substr(pos-10,10);
    }
private:
    string q;
    int pos;
};

/**
 * Your TextEditor object will be instantiated and called as such:
 * TextEditor* obj = new TextEditor();
 * obj->addText(text);
 * int param_2 = obj->deleteText(k);
 * string param_3 = obj->cursorLeft(k);
 * string param_4 = obj->cursorRight(k);
 */
```
