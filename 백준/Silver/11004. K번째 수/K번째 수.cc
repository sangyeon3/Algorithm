#include <iostream>
#include <queue>
using namespace std;

struct compare {
    bool operator()(int a, int b) {
        return a > b;
    }
};

int main() {

    ios::sync_with_stdio(0);
	cin.tie(0);
	cout.tie(0);

    int n, k;
    cin >> n >> k;

    priority_queue<int> pq;
    int a;
    for (int i = 0; i < k; i++)
    {
        cin >> a;
        pq.push(a);
    }
    
    for (int i = 0; i < n-k; i++)
    {
        cin >> a;
        pq.push(a);
        // cout << pq.top() << "\n";
        pq.pop();
    }

    // for (int i = 0; i < k-1; i++)
    // {
    //     pq.pop();
    // }
    cout << pq.top();

    return 0;
}