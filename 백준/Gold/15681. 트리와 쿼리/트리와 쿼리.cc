#include <iostream>
#include <vector>
#include <cstring>
#include <queue>
using namespace std;

int N, R, Q;
vector<int> edges[100001];
int dp[100001];

void Input() {
    cin >> N >> R >> Q;

    int u, v;
    for (int i = 0; i < N-1; i++)
    {  
        cin >> u >> v;
        edges[u].push_back(v);
        edges[v].push_back(u);
    }
}

bool visited[100001] = {false, };
int dfs(int node) {
    if (visited[node]) return dp[node];
    visited[node] = true;

    for (int next: edges[node]) {
        if (visited[next]) continue;
        dp[node] += dfs(next);
    }
    return dp[node];
}

void Solution() {
    for (int i=1; i<=N; i++) dp[i] = 1;
    dfs(R);

    int node;
    for (int i = 0; i < Q; i++)
    {
        cin >> node;
        cout << dp[node] << "\n";
    }
    
}

int main() {

    ios::sync_with_stdio(0);
	cin.tie(0);
	cout.tie(0);

    Input();
    Solution();

    return 0;
}