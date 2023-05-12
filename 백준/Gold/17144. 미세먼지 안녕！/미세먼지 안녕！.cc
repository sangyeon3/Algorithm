#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

typedef pair<int, int> pii;
int dy[4] = {1, -1, 0, 0};
int dx[4] = {0, 0, 1, -1};

int r, c, t;
int arr[51][51];
vector<pii> airCleaner;

void Input() {
    cin >> r >> c >> t;
    for (int i = 0; i < r; i++) {
        for (int j = 0; j < c; j++) {
            cin >> arr[i][j];
            if (arr[i][j] == -1) {
                airCleaner.push_back(make_pair(i, j));
            }
        }
    }
}

void printArr() {
    for (int i = 0; i < r; i++) {
        for (int j = 0; j < c; j++) {
            cout <<  arr[i][j] << " ";
        }
        cout << "\n";
    }
    cout << "\n";
}

void expandDust() {
    int nextArr[51][51] = {0, };
    for (pii air: airCleaner) {
        nextArr[air.first][air.second] = -1;
    }

    for (int i = 0; i < r; i++) {
        for (int j = 0; j < c; j++) {
            if (arr[i][j] == -1 || arr[i][j] == 0) continue;

            int addedDust = arr[i][j] / 5;
            int addedCount = 0;
            for (int k = 0; k < 4; k++)
            {
                int ny = i + dy[k], nx = j + dx[k];
                if (ny < 0 || nx < 0 || ny >= r || nx >= c) continue;
                if (arr[ny][nx] == -1) continue;

                addedCount++;
                nextArr[ny][nx] += addedDust;
            }
            nextArr[i][j] += (arr[i][j] - addedDust * addedCount);
        }
    }

    for (int i = 0; i < r; i++) {
        for (int j = 0; j < c; j++) { 
            arr[i][j] = nextArr[i][j];
        }
    }
}

void turn(pii start, pii moves[4], bool isUpPart) {
    int y = start.first, x = start.second;
    int dir = 0;

    while (dir < 4) {
        int ny = y + moves[dir].first, nx = x + moves[dir].second;
        // cout << "y x ny nx: " << y << " " << x << " " << ny << " " << nx << "\n";
        if ((ny < 0 || nx < 0 || ny >= r || nx >= c) 
        || (isUpPart && ny > start.first) || (!isUpPart && ny < start.first)) {
            dir += 1;
            continue;
        }
        if (arr[y][x] == -1) {
            y = ny; x = nx;
            continue;    
        }

        if (arr[ny][nx] == -1) {
            arr[y][x] = 0;
        } else {
            arr[y][x] = arr[ny][nx];
        }
        // cout << "y x ny nx: " << y << " " << x << " " << ny << " " << nx << "\n";
        // cout << "arr[y][x]: " << arr[y][x] << "\n";
        y = ny; x = nx;
    }
}

void cleanAir() {
    // 상단
    pii up_moves[4] = {make_pair(-1, 0), make_pair(0, 1), make_pair(1, 0), make_pair(0, -1)};
    turn(airCleaner[0], up_moves, true);

    // 하단
    pii down_moves[4] = {make_pair(1, 0), make_pair(0, 1), make_pair(-1, 0), make_pair(0, -1)};
    turn(airCleaner[1], down_moves, false);
}

int countDust() {
    int cnt = 0;
    for (int i = 0; i < r; i++) {
        for (int j = 0; j < c; j++) {
            if (arr[i][j] == -1) continue;
            cnt += arr[i][j];
        }
    }
    return cnt;
}

void Solution() {
    while (t--) {
        expandDust();
        cleanAir();
        // printArr();
    }
    cout << countDust() << "\n";
}

int main() {

    ios::sync_with_stdio(0);
	cin.tie(0);
	cout.tie(0);

    Input();
    Solution();    

    return 0;
}