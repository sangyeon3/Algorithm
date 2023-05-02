#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;

    int arr[101][101] = {0, };

    int y, x;
    for(int k=0; k<n; k++) {
        cin >> y >> x;

        for(int i=0; i<10; i++) {
            for(int j=0; j<10; j++) {
                arr[i+y][j+x] = 1;
            }
        }
    }

    int cnt = 0;
    for(int i=0; i<100; i++) {
        for(int j=0; j<100; j++) {
            if (arr[i][j]) cnt++;
        }
    }

    cout << cnt << "\n";
}