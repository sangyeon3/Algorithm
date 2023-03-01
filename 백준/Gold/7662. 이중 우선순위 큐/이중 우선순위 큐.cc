#include <iostream>
#include <queue>
#include <vector>
#include <map>
#include <string>
using namespace std;

priority_queue<int> max_heap;
priority_queue<int, vector<int>, greater<int> > min_heap;
map<int, int> counter;

void insert(int n) {
    max_heap.push(n);
    min_heap.push(n);

    auto iter = counter.find(n);
    if (iter != counter.end()) {
        iter->second += 1;
    } else {
        counter.insert(make_pair(n, 1));
    }
}

void pop_max() {
    if (max_heap.empty()) return;
    int top = max_heap.top();
    max_heap.pop();
    
    auto iter = counter.find(top);
    if (iter == counter.end() || iter->second < 1) { 
        pop_max();
    } else {
        iter->second -= 1;
        if (iter->second == 0) counter.erase(top);
    }
}

void pop_min() {
    if (min_heap.empty()) return;
    int top = min_heap.top();
    min_heap.pop();
    
    auto iter = counter.find(top);
    if (iter == counter.end() || iter->second < 1) { 
        pop_min();
    } else {
        iter->second -= 1;
        if (iter->second == 0) counter.erase(top);
    }
}

int main() {

    int tc;
    cin >> tc;

    while(tc--) {
        max_heap = priority_queue<int>();
        min_heap = priority_queue<int, vector<int>, greater<int> >();
        counter.clear();

        int k;
        cin >> k;

        char c;
        int n;
        while(k--) {
            cin >> c >> n;
            if (c == 'I') insert(n);
            else if (n == 1) pop_max();
            else pop_min();
        }

        string ans = "";
        while(!max_heap.empty()) {
            int top = max_heap.top();
            max_heap.pop();
            if (counter.find(top) != counter.end()) {
                ans += to_string(top) + " ";
                break;
            }
        }

        while(!min_heap.empty()) {
            int top = min_heap.top();
            min_heap.pop();
            if (counter.find(top) != counter.end()) {
                ans += to_string(top);
                break;
            }
        }

        if (ans == "") cout << "EMPTY\n";
        else cout << ans << "\n";
    }

    return 0;
}