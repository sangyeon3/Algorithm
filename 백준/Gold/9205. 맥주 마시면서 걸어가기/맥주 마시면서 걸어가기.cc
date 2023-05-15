#include <iostream>
#include <algorithm>
#include <cmath>
#include <cstring>
using namespace std;

typedef pair<int, int> pii;

int n;
pii home, festival;
pii store[101];
pii distances[101]; // store index, distance

bool compare(pii a, pii b) {
    return a.second < b.second;
}

void Input() {
    cin >> n;

    int a, b;
    cin >> a >> b;
    home = make_pair(a, b);

    for (int i = 0; i < n; i++)
    {
        cin >> a >> b;
        store[i] = make_pair(a, b);
        int d = abs(a - home.first) + abs(b - home.second);
        distances[i] = make_pair(i, d);
    }

    cin >> a >> b;
    festival = make_pair(a, b);
}

bool visited[101];

bool dfs(int y, int x) {
    int d = abs(festival.first - y) + abs(festival.second - x);
    if (d <= 1000) {
        return true;
    }
    for (int i = 0; i < n; i++)
    {
        if (visited[i]) continue;
        
        int distance = abs(store[i].first - y) + abs(store[i].second - x);
        if (distance > 1000) continue;

        visited[i] = true;
        if (dfs(store[i].first, store[i].second)) {
            return true;
        }
    }
    return false;
}

void Solution() {
    sort(distances, distances + n, compare);
    // cout << distances[0].second << " dss\n";
    if (dfs(home.first, home.second)) {
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