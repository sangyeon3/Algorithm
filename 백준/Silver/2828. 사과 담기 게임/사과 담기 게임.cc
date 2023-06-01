#include <iostream>
using namespace std;

int main() {

    ios::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);

    int n, m;
    cin >> n >> m;

    int basketStart = 1;

    int j;
    cin >> j;

    int moveCount = 0;
    int location;
    for (int i = 0; i < j; i++)
    {
        cin >> location;

        int basketEnd = basketStart + m-1;
        if (basketStart <= location && basketEnd >= location) continue;

        int move = 0;
        while (true) {
            if (basketEnd+move > n && basketStart-move < 1) break;
            if (basketEnd+move == location) {
                moveCount += move;
                basketStart += move;
                break;
            } else if (basketStart-move == location) {
                moveCount += move;
                basketStart -= move;
                break;
            }
            move++;
        }    
    }

    cout << moveCount << "\n";

    return 0;
}