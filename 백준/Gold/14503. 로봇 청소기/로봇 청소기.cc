#include <iostream>
using namespace std;

#define N 0
#define E 1
#define S 2
#define W 3
typedef pair<int, int> pii;
pii moves[4] = {make_pair(-1, 0), make_pair(0, 1), make_pair(1, 0), make_pair(0, -1)};
pii backMoves[4] = {make_pair(1, 0), make_pair(0, -1), make_pair(-1, 0), make_pair(0, 1)};

int main() {

    int n, m;
    cin >> n >> m;

    int r, c, dir;
    cin >> r >> c >> dir;

    int map[51][51];
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < m; j++)
            cin >> map[i][j];
    }

    map[r][c] = 2;
    int clean = 1;
    int rotateCount = 0;

    while(1) {
        // 네방향 모두 청소되어있거나 벽인 경우
        if (rotateCount >= 4) {
            int nr = r + backMoves[dir].first;
            int nc = c + backMoves[dir].second;
            if (map[nr][nc] == 1) {
                break;
            }
            r = nr; c = nc;
            rotateCount = 0;
            continue;
        }

        dir = (dir == N) ? W : (dir - 1);   // 회전
        rotateCount++;

        // 청소되면 0에서 1로 변경
        int nr = r + moves[dir].first;
        int nc = c + moves[dir].second;
        if (map[nr][nc] == 0) {   // 빈칸
            clean++;
            map[nr][nc] = 2;
            r = nr; c = nc;
            rotateCount = 0;
        }
    }
    
    cout << clean << "\n";

    return 0;
}