#include <iostream>
#include <cstring>
#include <vector>
using namespace std;

typedef pair<int, int> pii;
int dy[4] = {-1, 1, 0, 0};
int dx[4] = {0, 0, 1, -1};

#define UP 0
#define DOWN 1
#define RIGHT 2
#define LEFT 3

typedef struct Shark {
    int y, x;
    int speed;
    int direction;
    int size;

    Shark() {y = -1; x = -1; speed = -1; direction = -1; size = -1;}
    Shark(int Y, int X, int s, int d, int z): y(Y), x(X), speed(s), direction(d), size(z) {}
} Shark;

int r, c, m;
int arr[101][101];
vector<Shark> sharks;
bool isLiving[10001];

void Input() {
    cin >> r >> c >> m;

    int y, x, s, d, z;
    for (int i = 0; i < m; i++) {
        cin >> y >> x >> s >> d >> z;
        arr[y-1][x-1] = i;
        sharks.push_back(Shark(y-1, x-1, s, d-1, z));
        isLiving[i] = true;
    }
}

void printArr() {
    for (int i = 0; i < r; i++) {
        for (int j = 0; j < c; j++)
            cout << arr[i][j] << " ";
        cout << "\n";
    }
}

int eatShark(int column) {
    for (int i=0; i<r; i++) {
        int index = arr[i][column];
        if (index == -1 || !isLiving[index]) continue;

        int size = sharks[index].size;
        if (size != -1) {
            isLiving[index] = false;
            return size;
        }
    }
    return 0;
}

void moveShark() {
    int newArr[101][101];
    memset(newArr, -1, sizeof(newArr));

    for (int i = 0; i < m; i++)
    {
        if (!isLiving[i]) continue;

        Shark shark = sharks[i];
        int ddy = dy[shark.direction] * shark.speed;
        int ddx = dx[shark.direction] * shark.speed;

        while (ddy != 0 || ddx != 0) { 
            // cout << "i ddy ddx: " << i << " " << ddy << " " << ddx << "\n";
            switch (shark.direction) {
                case UP:
                    if (shark.y + ddy < 0) {
                        ddy += shark.y;
                        ddy = -ddy;
                        shark.y = 0;
                        shark.direction = DOWN;
                    } else {
                        shark.y += ddy;
                        ddy = 0;
                    }
                    break;
                case DOWN:
                    if (shark.y + ddy >= r) {
                        ddy -= (r-1 - shark.y);
                        ddy = -ddy;
                        shark.y = r-1;
                        shark.direction = UP;
                    } else {
                        shark.y += ddy;
                        ddy = 0;
                    }
                    break;
                case RIGHT:
                    if (shark.x + ddx >= c) {
                        ddx -= (c-1 - shark.x);
                        ddx = -ddx;
                        shark.x = c-1;
                        shark.direction = LEFT;
                    } else {
                        shark.x += ddx;
                        ddx = 0;
                    }
                    break;
                case LEFT:
                    if (shark.x + ddx < 0) {
                        ddx += shark.x;
                        ddx = -ddx;
                        shark.x = 0;
                        shark.direction = RIGHT;
                    } else {
                        shark.x += ddx;
                        ddx = 0;
                    }
                    break;
            }
        }

        sharks[i] = shark;

        // 이동한 칸에 다른 상어 존재
        if (newArr[shark.y][shark.x] != -1) {
            int diff_index = newArr[shark.y][shark.x];
            Shark diff_shark = sharks[diff_index];
            if (shark.size > diff_shark.size) {
                isLiving[diff_index] = false;
                newArr[shark.y][shark.x] = i;
            } else {
                isLiving[i] = false;
            }
        } else {
            newArr[shark.y][shark.x] = i;
        }
    }

    for (int i = 0; i < r; i++) {
        for (int j = 0; j < c; j++)
            arr[i][j] = newArr[i][j];
    }
}

void Solution() {
    int ans = 0;
    for (int i = 0; i < c; i++) {
        int eaten = eatShark(i);
        // cout << "i eaten: " << i << " " << eaten << "\n";
        ans += eaten;
        moveShark();
    }
    cout << ans << "\n";
}

int main() {

    memset(arr, -1, sizeof(arr));
    
    Input();
    if (m == 0) { 
        cout << "0"; 
        return 0; 
    }

    Solution();

    return 0;
}