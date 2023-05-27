#include <iostream>
using namespace std;

int main() {

    ios::sync_with_stdio(0);
	cin.tie(0);
	cout.tie(0);

    int n;
    cin >> n;

    int divider = 10;
    int length = 1;
    int ans = 0;
    while (n/divider) {
        ans += ((divider-1)-(divider/10)+1) * length;
        divider *= 10;
        length++;
    }
    ans += (n - divider/10 + 1) * length;

    cout << ans << "\n";

    return 0;
}