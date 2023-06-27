#include <iostream>
#include <queue>
using namespace std;

typedef pair<int, int> pii;
int dy[4] = {0, 0, 1, -1};
int dx[4] = {1, -1, 0, 0};

int n, m;
int map[1000][1000];
int dist[1000][1000];
pii start;

void bfs() {
    queue<pii> q;
    q.push(start);
    dist[start.first][start.second] = 0;

    while(!q.empty()) {
        int y = q.front().first, x = q.front().second;
        int cur = dist[y][x];
        q.pop();

        for (int i = 0; i < 4; i++)
        {
            int ny = y + dy[i], nx = x + dx[i];
            if (ny<0 || nx<0 || ny>=n || nx>=m) continue;
            if (dist[ny][nx] != -1 || map[ny][nx] != 1) continue;

            dist[ny][nx] = cur + 1;
            q.push(make_pair(ny, nx));
        }
    }
}

void print() {
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < m; j++)
        {
            cout << dist[i][j] << " ";
        }
        cout << "\n";
    }
}

int main()
{

    ios::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);

    cin >> n >> m;
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < m; j++)
        {
            cin >> map[i][j];

            dist[i][j] = -1;
            if (map[i][j] == 0) dist[i][j] = 0;
            if (map[i][j] == 2) start = make_pair(i, j);
        }
    }

    bfs();
    print();

    return 0;
}