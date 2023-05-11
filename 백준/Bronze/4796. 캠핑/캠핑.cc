#include <iostream>
using namespace std;

int main() {

    ios::sync_with_stdio(0);
	cin.tie(0);
	cout.tie(0);

    long long l, p, v;
    for(int i=1;;i++) {
        cin >> l >> p >> v;
        if (l == 0 && p == 0 && v == 0) break;

        int ans = l * (v / p) + ((v % p) <= l ? (v%p) : l);
        cout << "Case " << i << ": " << ans << "\n";
    }

    return 0;
}