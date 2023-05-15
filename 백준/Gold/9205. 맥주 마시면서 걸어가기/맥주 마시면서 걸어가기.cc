#include <iostream>
#include <cmath>
#include <cstring>
#include <queue>
using namespace std;

typedef pair<int, int> pii;

int n;
pii home, festival;
pii store[101];

void Input() {
    cin >> n;

    int a, b;
    cin >> a >> b;
    home = make_pair(a, b);

    for (int i = 0; i < n; i++)
    {
        cin >> a >> b;
        store[i] = make_pair(a, b);
    }

    cin >> a >> b;
    festival = make_pair(a, b);
}

bool visited[101];

bool bfs() {
    queue<pii> q;
    q.push(home);

    while (!q.empty()) {
        int y = q.front().first, x = q.front().second;
        q.pop();

        if ((abs(y - festival.first) + abs(x - festival.second)) <= 1000) { 
            return true;
        }
        for (int i = 0; i < n; i++)
        {
            if (visited[i]) continue;

            int ny = store[i].first, nx = store[i].second;
            if (abs(ny - y) + abs(nx - x) > 1000) continue;

            visited[i] = true;
            q.push(make_pair(ny, nx));
        }
    }
    return false;
}

void Solution() {
    if (bfs()) {
        cout << "happy\n";
    } else {
        cout << "sad\n";
    }
}

void Initialze() {
    memset(visited, false, sizeof(visited));
}

int main() {

    ios::sync_with_stdio(0);
	cin.tie(0);
	cout.tie(0);

    int tc;
    cin >> tc;

    while (tc--) {
        Initialze();
        Input();
        Solution();
    }

    return 0;
}