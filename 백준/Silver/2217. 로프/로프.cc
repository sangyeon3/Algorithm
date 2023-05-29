#include <iostream>
#include <algorithm>
using namespace std;

vector<int> vec;

int main() {

    ios::sync_with_stdio(0);
	cin.tie(0);
	cout.tie(0);

    int n;
    cin >> n;

    int a;
    for (int i = 0; i < n; i++) {
        cin >> a;
        vec.push_back(a);
    }

    sort(vec.begin(), vec.end());

    int ans = 0;
    for (int i = 0; i < n; i++)
    {
        ans = max(ans, vec[i] * (n-i));
    }
    cout << ans << "\n";

    return 0;
}