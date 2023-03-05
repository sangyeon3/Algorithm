#include <iostream>
#include <vector>
#include <cstring>
using namespace std;

#define MAX 20

int N, M;
vector<int> adjacency[100010];
int depth[100010];
int parent[100010][MAX];

void dfs(int cur) {  
    for (int next: adjacency[cur]) {
        if (depth[next] != -1) continue;
        depth[next] = depth[cur] + 1;
        parent[next][0] = cur;
        dfs(next);
    }
}

// 나를 기준으로 2^k칸 떨어진 부모는
// 나를 기준으로 2^(k-1)칸 떨어진 부모의 2^(k-1)칸 떨어진 부모임
void connect() {
    for (int i=1; i<MAX; i++) {
        for (int j=2; j<=N; j++) {
            if (parent[j][i-1] == -1) continue;
            parent[j][i] = parent[parent[j][i-1]][i-1];
        }
    }
}

int LCA(int u, int v) {
    // u를 더 깊은 정점으로 선택
    if (depth[u] < depth[v]) {
        swap(u, v);
    }

    // 깊이 차 계산
    int diff = depth[u] - depth[v];

    // 깊이 차 = 0이 될 때까지 반복
    // 깊이 차를 2진수로 나타냈을 때, 1이면 뛰어야 함
    for (int i = 0; diff > 0; i++) {
        if (diff % 2 == 1) {
            u = parent[u][i];
        }
        diff /= 2;
    }

    // 두 정점이 다르다면
    // 뛸 수 있는 최대한 멀리부터 뛰어서 확인
    if (u != v) {
        for(int i = MAX-1; i>=0; i--) {
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

    cin >> N;

    int a, b;
    for (int i = 0; i < N-1; i++)
    {
        cin >> a >> b;
        adjacency[a].push_back(b);
        adjacency[b].push_back(a);
    }

    memset(depth, -1, sizeof(depth));
    memset(parent, -1, sizeof(parent));
    depth[1] = 0;

    // depth
    dfs(1);

    // parent
    connect();
    
    cin >> M;
    while(M--) {
        cin >> a >> b;
        cout << LCA(a, b) << "\n";
    }

    return 0;
}