#include <iostream>
using namespace std;

#define HOR 0
#define VER 1
#define CROSS 2

struct entry {
    int direction;
    int r, c;
    entry(int D, int R, int C): direction(D), r(R), c(C) {}
};

int N;
int map[17][17];
int ans = 0;

bool checkVisitable(entry e) {
    if (e.direction == HOR) {
        // 0이고 non-visited
        if (e.c + 1 >= N || map[e.r][e.c + 1]) return false;
        if (e.r == N-1 && e.c+1 == N-1) ans++;
    } else if (e.direction == VER) {
        if (e.r + 1 >= N || map[e.r + 1][e.c]) return false;
        if (e.r+1 == N-1 && e.c == N-1) ans++;
    } else {
        if (e.r + 1 >= N || e.c + 1 >= N) return false;
        if (map[e.r + 1][e.c + 1] || map[e.r][e.c + 1] || map[e.r + 1][e.c]) return false;
        if (e.r+1 == N-1 && e.c+1 == N-1) ans++;
    }
    return true;
}

void myFunc(entry e) {
    entry next = e;
    if (e.direction == HOR) {
            next = entry(e.direction, e.r, e.c+1);
            if (checkVisitable(next)) myFunc(next);
            next = entry(CROSS, e.r, e.c+1);
            if(checkVisitable(next)) myFunc(next);
    } else if (e.direction == VER) {
            next = entry(e.direction, e.r+1, e.c);
            if(checkVisitable(next)) myFunc(next);
            next = entry(CROSS, e.r+1, e.c);
            if(checkVisitable(next)) myFunc(next);
    } else {
            next = entry(e.direction, e.r+1, e.c+1);
            if(checkVisitable(next)) myFunc(next);
            next = entry(HOR, e.r+1, e.c+1);
            if(checkVisitable(next)) myFunc(next);
            next = entry(VER, e.r+1, e.c+1);
            if(checkVisitable(next)) myFunc(next);
    }
}

int main() {

    cin >> N;
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++)
            cin >> map[i][j];
    }

    myFunc(entry(HOR, 0, 0));
    cout << ans << "\n";
    return 0;
}