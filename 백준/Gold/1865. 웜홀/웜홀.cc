#include <iostream>
#include <vector>
using namespace std;

struct edge {
    int s, e, t;
    edge(int S, int E, int T): s(S), e(E), t(T) {}
};

#define INF 50000000

int n, m, w;
vector<edge> edges;

void Initialize() {
    edges.clear();
}

void Input() {
    cin >> n >> m >> w;

    int s, e, t;
    for (int i = 0; i < m; i++)     // 도로
    {
        cin >> s >> e >> t;
        edges.push_back(edge(s, e, t));
        edges.push_back(edge(e, s, t));
    }
    for (int i = 0; i < w; i++)     // 웜홀
    {
        cin >> s >> e >> t;
        edges.push_back(edge(s, e, -t));
    }
}

bool bellman_ford() {
    int distance[501];
    for (int i = 0; i < 501; i++)
        distance[i] = INF;


    distance[1] = 0;
    for (int i = 0; i < n; i++)
    {
        for (edge cur: edges) {
            // if (distance[cur.s] == INF) continue;
            if (distance[cur.e] > distance[cur.s] + cur.t) {
                distance[cur.e] = distance[cur.s] + cur.t;

                if (i == n-1) {
                    return true;
                }
            }
        }
    }
    return false;
}

void Solution() {

    if (bellman_ford()) {
        cout << "YES\n";
    } else {
        cout << "NO\n";
    }

    return;
}

int main() {

    ios::sync_with_stdio(0);
	cin.tie(0);
	cout.tie(0);

    int tc;
    cin >> tc;

    while (tc--) {
        Initialize();
        Input();
        Solution();
    }

    return 0;
}