#include <iostream>
using namespace std;

int main() {

    ios::sync_with_stdio(0);
	cin.tie(0);
	cout.tie(0);

    int n;
    cin >> n;

    int k=1;
    int dp[100001] = {0, 1, 2, 3, };

    for (int i = 4; i <= n; i++)
    {
        if ((k+1)*(k+1) == i) {
            dp[i] = 1;
            k++;
            continue;
        }

        dp[i] = dp[i-1] + 1;
        for (int j = 1; j <= k; j++)
        {
            dp[i] = min(dp[i], dp[j*j] + dp[i-j*j]);
        }
    }
    
    cout << dp[n] << "\n";

    return 0;
}