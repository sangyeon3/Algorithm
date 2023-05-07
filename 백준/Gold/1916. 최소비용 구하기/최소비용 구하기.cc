#include <iostream>
#include <vector>
#include <queue>
using namespace std;

typedef pair<int, int> pii;
#define NODE first
#define COST second
#define INF 100000000

int n, m;
vector<pii> relations[1001];
int start, dest;

struct compare {
    bool operator()(pii a, pii b) {
        return a.COST > b.COST;
    }
};

void Input() {
    cin >> n >> m;
    
    int a, b, c;
    for (int i = 0; i < m; i++)
    {
        cin >> a >> b >> c;
        relations[a].push_back(make_pair(b, c));
    }

    cin >> start >> dest;
}

void Solution() {
    /* dijk */

    // init
    int distances[1001];
    for (int i = 1; i <= n; i++) {
        distances[i] = INF;
    }

    priority_queue<pii, vector<pii>, compare> pq;

    pq.push(make_pair(start, 0));
    distances[start] = 0;

    while (!pq.empty()) {
        int cur = pq.top().first;
        int cost = pq.top().second;
        pq.pop();

        if (distances[cur] < cost) continue;

        for (pii next: relations[cur]) {
            int nextCost = cost + next.COST;
            if (nextCost < distances[next.NODE]) {
                distances[next.NODE] = nextCost;
                pq.push(make_pair(next.NODE, nextCost));
            }
        }
    }
    
    cout << distances[dest] << "\n";
}

int main() {

    Input();
    Solution();

    return 0;
}