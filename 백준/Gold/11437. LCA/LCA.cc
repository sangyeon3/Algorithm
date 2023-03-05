#include <iostream>
#include <vector>
#include <cstring>
using namespace std;

#define MAX 16

int N, M;
vector<int> adjacency[50001];
int depth[50001];
int parent[50001][MAX];

void dfs(int cur) {
    for (int next: adjacency[cur]) {
        if (depth[next] == -1) {
            depth[next] = depth[cur] + 1;
            parent[next][0] = cur;
            dfs(next);
        }
    }
}

void connect_parent() {
    for (int j = 1; j < MAX; j++)
    {
        for (int i = 2; i <= N; i++)
        {
            int tmp = parent[i][j-1];
            if (tmp == -1) continue;
            parent[i][j] = parent[tmp][j-1];
        }
    }
}

int LCA(int u, int v) {
    // 낮은 depth의 노드를 u로 설정
    if (depth[u] < depth[v]) {
        swap(u, v);
    }

    int diff = depth[u] - depth[v];

    // 높이 맞추기
    for (int i = 0; diff > 0; i++)
    {
        if (diff % 2 == 1) {
            u = parent[u][i];
        }
        diff = diff >> 1;
    }

    // 공통 조상 찾을 때까지 멀리서부터 점프
    if (u != v) {
        for (int i = MAX - 1; i >= 0; i--)
        {
            if (parent[u][i] != -1 && parent[u][i] != parent[v][i]) {
                u = parent[u][i];
                v = parent[v][i];
            }
        }
        u = parent[u][0];
    }

    return u;
}

int main() {

    ios_base::sync_with_stdio(false);
	cin.tie(NULL);
	cout.tie(NULL);

    // init
    memset(depth, -1, sizeof(depth));
    memset(parent, -1, sizeof(parent));

    cin >> N;

    // 인접 리스트
    int a, b;
    for (int i = 1; i < N; i++)
    {
        cin >> a >> b;
        adjacency[a].push_back(b);
        adjacency[b].push_back(a);
    }

    // depth
    depth[1] = 0;
    dfs(1);

    // parent
    connect_parent();

    // lca
    cin >> M;
    while(M--) {
        cin >> a >> b;
        cout << LCA(a, b) << "\n";
    }
 
    return 0;
}