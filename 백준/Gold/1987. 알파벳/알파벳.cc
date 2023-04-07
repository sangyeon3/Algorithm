#include <iostream>
#include <stack>
using namespace std;

struct entry {
    int y, x, count;
    entry(int y_, int x_, int count_): y(y_), x(x_), count(count_) {}
};

int r, c;
char arr[20][20];
pair<int, int> moves[4] = {make_pair(0, 1), make_pair(1, 0), make_pair(0, -1), make_pair(-1, 0)};
bool alpha[26] = {false, };
bool visited[20][20] = {false, };
int ans = 0;

void dfs(int y, int x, int count) {
    ans = max(ans, count);

    for (pair<int, int> move : moves)
    {
        int ny = y + move.first, nx = x + move.second;
        if (ny < 0 || nx < 0 || ny >= r || nx >= c) { continue; }
        if (visited[ny][nx] || alpha[int(arr[ny][nx]) - 65]) { continue; }
        visited[ny][nx] = true;
        alpha[int(arr[ny][nx])-65] = true;
        dfs(ny, nx, count + 1);
        visited[ny][nx] = false;
        alpha[int(arr[ny][nx])-65] = false;
    }
}

int main() {
    cin >> r >> c;
    char c_;
    for (int i = 0; i < r; i++) {
        for (int j = 0; j < c; j++) {
            cin >> c_;
            arr[i][j] = c_;
        }
    }

    visited[0][0] = true;
    alpha[int(arr[0][0])-65] = true;
    dfs(0, 0, 1);

    cout << ans << "\n";
}