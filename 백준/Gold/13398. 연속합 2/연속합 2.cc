#include <iostream>
using namespace std;

int n;
int arr[100001];

void Input() {
    cin >> n;
    for (int i = 0; i < n; i++)
    {
        cin >> arr[i];
    }
}

void Solution() {
    int dp[100001][2];

    dp[0][0] = arr[0];
    dp[0][1] = 0;

    int ans = arr[0];
    for (int i = 1; i < n; i++)
    {
        dp[i][0] = max(dp[i-1][0], 0) + arr[i];
        dp[i][1] = max(dp[i-1][0], dp[i-1][1] + arr[i]);
        
        ans = max(ans, dp[i][0]);
        ans = max(ans, dp[i][1]);

        // cout << "num dp[0] dp[1]: " << arr[i] << " " << dp[i][0] << " " << dp[i][1] << "\n";
    }
    
    cout << ans << "\n";
}

int main() {

    Input();
    Solution();

    return 0;
}