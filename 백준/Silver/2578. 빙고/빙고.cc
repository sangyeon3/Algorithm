#include <iostream>
using namespace std;

bool checked[5][5] = {false, };

bool findBingo() {
    int bingo = 0;
    for (int i = 0; i < 5; i++) {
        bool vertical = true;
        bool horizontal = true;
        for (int j = 0; j < 5; j++) {
            if (!checked[i][j]) horizontal = false;
            if (!checked[j][i]) vertical = false;
        }
        if (vertical) bingo++;
        if (horizontal) bingo++;
    }

    bool b1 = true;
    bool b2 = true;
    for (int i = 0; i < 5; i++) {
        if (!checked[i][i]) b1 = false;
        if (!checked[i][4-i]) b2 = false;
    }
    if (b1) bingo++;
    if (b2) bingo++;

    if (bingo >= 3) return true;
    return false;
}

int main()
{
    ios::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);

    pair<int, int> board[26];
    int a;
    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5; j++) {
            cin >> a;
            board[a] = make_pair(i, j);
        }
    }

    int calls[5][5];
    for (int i = 0; i < 5; i++)
        for (int j = 0; j < 5; j++) cin >> calls[i][j];

    for (int i = 0; i < 5; i++)
    {
        for (int j = 0; j < 5; j++) {
            int num = calls[i][j];
            int y = board[num].first, x = board[num].second;
            checked[y][x] = true;

            if (findBingo()) {
                cout << i*5 + j + 1 << "\n";
                return 0;
            }
        }
    }
    
    return 0;
}   
