#include <iostream>
#include <vector>
#include <queue>
#include <algorithm>
using namespace std;

typedef pair<int, int> pii;

int n;
vector<pii> vec[10001];

pii bfs(int start) {
    queue<pii> q;
    bool visited[10001] = {false, };

    q.push(make_pair(start, 0));
    visited[start] = true;

    int maxNode = start;
    int maxDist = 0;

    while (!q.empty()) {
        int cur = q.front().first;
        int dist = q.front().second;
        q.pop();

        if (dist > maxDist) {
            maxDist = dist;
            maxNode = cur;
        }

        for (pii next: vec[cur]) {
            if (visited[next.first]) continue;
            q.push(make_pair(next.first, next.second + dist));
            visited[next.first] = true;
        }
    }

    return make_pair(maxNode, maxDist);
}

int main() {

    ios::sync_with_stdio(0);
	cin.tie(0);
	cout.tie(0);

    cin >> n;

    int a, b, c;
    for (int i = 0; i < n-1; i++)
    {
        cin >> a >> b >> c;
        vec[a].push_back(make_pair(b, c));
        vec[b].push_back(make_pair(a, c));
    }

    // Solution
    pii endPoint = bfs(1);
    cout << bfs(endPoint.first).second << "\n";

    return 0;
}