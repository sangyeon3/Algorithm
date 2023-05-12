#include <iostream>
using namespace std;

int n, m, k;
int r, c;
bool arr[41][41];
int sticker[11][11];
int cnt = 0;

void inputSticker() {
    cin >> r >> c;
    for (int i = 0; i < r; i++) {
        for (int j = 0; j < c; j++) {
            cin >> sticker[i][j];
        }
    }
}

bool isAvailable(int i, int j) {
    for (int u = 0; u < r; u++) {
        for (int v = 0; v < c; v++) {
            if (sticker[u][v] == 0) continue;
            if (arr[i+u][j+v]) {
                return false;
            }
        }
    }
    return true;
}

void updateNotebook(int i, int j) {
    for (int u = 0; u < r; u++) {
        for (int v = 0; v < c; v++) {
            if (sticker[u][v] == 0) continue;
            arr[i+u][j+v] = true;
            cnt++;
        }
    }
}

void rotateSticker() {
    int rotated[11][11] = {0, };
    for (int i = 0; i < r; i++) {
        for (int j = 0; j < c; j++) {
            rotated[j][r-i-1] = sticker[i][j];
        }
    }

    for (int i = 0; i < 11; i++) {
        for (int j = 0; j < 11; j++) {
            sticker[i][j] = rotated[i][j];
        }
    }
    int tmp = r;
    r = c;
    c = tmp;
}

void stick() {
    for (int k = 0; k < 4; k++)
    {
        for (int i = 0; i+r-1 < n; i++) {
            for (int j = 0; j+c-1 < m; j++) {
                if (!isAvailable(i, j)) continue;
                updateNotebook(i, j);
                return;
            }
        }
        rotateSticker();
    }
}

int main() {

    ios::sync_with_stdio(0);
	cin.tie(0);
	cout.tie(0);

    cin >> n >> m >> k;

    while (k--) {
        inputSticker();
        stick();
    }

    cout << cnt << "\n";
    
    return 0;
}