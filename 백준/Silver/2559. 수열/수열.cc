#include <iostream>
using namespace std;

int main() {

    int n, k;
    cin >> n >> k;

    int sum = 0;
    int ans = -20000000;
    int arr[100001];

    for (int i = 0; i < n; i++)
    {
        cin >> arr[i];
        if (i < k) {
            sum += arr[i];
        } else {
            sum = sum + arr[i] - arr[i-k];
        }
        if (i >= k-1) {
            ans = max(ans, sum);
        }
    }

    cout << ans << "\n";

    return 0;
}