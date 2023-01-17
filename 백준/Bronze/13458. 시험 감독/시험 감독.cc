#include <iostream>
using namespace std;

int main() {

    int n;
    cin >> n;

    int peoples[1000001];
    for (int i = 0; i < n; i++)
        cin >> peoples[i];

    int b, c;
    cin >> b >> c;

    long long ans = n;
    for (int i = 0; i < n; i++) {
        if (peoples[i] > b) {
            ans += ((peoples[i] - b) / c) + (((peoples[i] - b) % c) != 0 ? 1 : 0);
        }
    }
    cout << ans << "\n";
    
    return 0;
}