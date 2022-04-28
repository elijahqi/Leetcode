Looking through this problem, we can find that it's classical trie tree proble. The key issue is just we need to split the "/" between each string from the 
original string.
While in the same time the hash_map unordered_map is also another method.


Trie solution:
```cpp
class FileSystem {
public:
    FileSystem() {
        root=new Node();
    }
    
    bool createPath(string path, int value) {
        vector<string> t=split_string(path);
        return insert(t,value);
    }
    
    int get(string path) {
        vector<string> t=split_string(path);
        return find(t);
    }
private:
    struct Node{
        int value;
        bool is_file;
        unordered_map<string,Node*> c;
        Node(){
            is_file=false;
            value=-1;
        }
    };
    Node *root=nullptr;
    vector<string> split_string(const string &path){
        vector<string> ret;string s;
        stringstream ss(path);
        while(getline(ss,s,'/')){
            if (s.size()) ret.push_back(s);
        }
        return ret;
    }
    bool insert(const vector<string> &v,int val){
        Node* cur=root;int n=v.size();
        for (int i=0;i<n;++i){
            if(cur->c.find(v[i])==cur->c.end()){
                if (i!=(n-1)) return false;
                else cur->c[v[i]]=new Node();
            }else if(i==n-1) return false;
            cur=cur->c[v[i]];
        }
        cur->is_file=true;
        cur->value=val;
        return true;
    }
    int find(const vector<string> &v){
        Node* cur=root;
        for (int i=0;i<v.size();++i){
            if(cur->c.find(v[i])==cur->c.end()) return -1;
            cur=cur->c[v[i]];
        }
        return cur->value;
    }
};

/**
 * Your FileSystem object will be instantiated and called as such:
 * FileSystem* obj = new FileSystem();
 * bool param_1 = obj->createPath(path,value);
 * int param_2 = obj->get(path);
 */
```
