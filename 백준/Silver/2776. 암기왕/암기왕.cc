#include <iostream>
#include <algorithm>
using namespace std;

int arr[1000001];

int main() {

    cin.tie(NULL);
    ios_base::sync_with_stdio(false);

    int tc;
    cin >> tc;

    while (tc--) {
        int n, m;
        cin >> n;

        for (int i = 0; i < n; i++) cin >> arr[i];
        sort(arr, arr+n);

        cin >> m;
        for (int i = 0; i < m; i++){
            int a;
            cin >> a;
            cout << (binary_search(arr, arr+n, a) ? "1\n":"0\n");
        }
    }

    return 0;
}