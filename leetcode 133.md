# Leetcode 133 Clone Graph

```cpp
/*
// Definition for a Node.
class Node {
public:
    int val;
    vector<Node*> neighbors;
    Node() {
        val = 0;
        neighbors = vector<Node*>();
    }
    Node(int _val) {
        val = _val;
        neighbors = vector<Node*>();
    }
    Node(int _val, vector<Node*> _neighbors) {
        val = _val;
        neighbors = _neighbors;
    }
};
*/

class Solution {
public:
    Node* cloneGraph(Node* node) {
        if (!node) return nullptr;
        unordered_map<Node*,Node*> mp;
        unordered_map<Node*,bool> vis;
        Node* cur=mp[node]=new Node(node->val);
        queue<Node*> q;q.push(node);
        vis[node]=true;
        while(!q.empty()){
            auto x=q.front();q.pop();
            
            for (auto y:x->neighbors){
                
                auto find_it=mp.find(y);
                if (find_it==mp.end()){
                    auto yy=mp[y]=new Node(y->val);
                    mp[x]->neighbors.push_back(yy);
                }else{
                    mp[x]->neighbors.push_back(find_it->second);
                }
                if (vis[y]) continue;
                q.push(y);
                vis[y]=true;
            }
        }
        return cur;
    }
};
```
