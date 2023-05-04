#include <iostream>
#include <vector>
#include <cstring>
using namespace std;

#define NODE first
#define DISTANCE second

int v;
vector<pair<int, int> > relations[100001];

void Input() {
    cin >> v;
    for (int i = 1; i <= v; i++) {
        int node, a, b;
        cin >> node;

        while (true) {
            cin >> a;
            if (a == -1) break;
            cin >> b;
            relations[node].push_back(make_pair(a, b));
        }
    }
}

bool visited[100001] = {false, };
int ans = 0, dest = 0;

void dfs(int node, int distance) {
    if (distance > ans) {
        ans = distance;
        dest = node;
    }

    for (pair<int, int> next: relations[node]) {
        if (visited[next.NODE]) continue;
        visited[next.NODE] = true;
        dfs(next.NODE, distance + next.DISTANCE);
        visited[next.NODE] = false;
    }
}

void Solution() {
    visited[1] = true;
    dfs(1, 0);

    memset(visited, false, sizeof(visited));
    visited[dest] = true;
    dfs(dest, 0);

    cout << ans << "\n";
}

int main() {
    Input();
    Solution();

    return 0;
}