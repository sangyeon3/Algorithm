#include <iostream>
#include <queue>
using namespace std;

typedef pair<int, int> pii;

int n, m;
int moves[101] = {0, };

int bfs() {
    queue<pii> q;
    bool visited[101] = {false, };

    q.push(make_pair(1, 0));
    visited[1] = true;

    while (!q.empty()) {
        int cur = q.front().first;
        int dist = q.front().second;
        q.pop();

        for (int i = 1; i <= 6; i++)
        {
            int next = cur + i;
            if (next > 100 || visited[next]) continue;
            if (next == 100) {
                return dist + 1;
            }

            visited[next] = true;

            if (moves[next] != 0) {
                next = moves[next];
                visited[next] = true;
            }

            q.push(make_pair(next, dist+1));
        }
    }
    return 0;
}

int main() {


    ios::sync_with_stdio(0);
	cin.tie(0);
	cout.tie(0);

    cin >> n >> m;

    int x, y;
    for (int i = 0; i < n+m; i++)
    {
        cin >> x >> y;
        moves[x] = y;
    }

    cout << bfs();

    return 0;
}