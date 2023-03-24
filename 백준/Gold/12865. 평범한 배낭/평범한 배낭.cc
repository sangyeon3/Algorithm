#include <iostream>
#include <algorithm>
using namespace std;

int n;
int weight[101]; int value[101];
int dp[101][100001] = {};

int main(){
    ios_base::sync_with_stdio(0);
    cin.tie(0);

    int max_weight;
    cin >> n >> max_weight;

    for (int i = 1; i <= n; i++) {
        cin >> weight[i] >> value[i];
    }

    for (int i = 1; i <= n; i++) {
        for (int j = 1; j <= max_weight; j++) {
            if(weight[i] <= j)
                dp[i][j] = max(dp[i-1][j], dp[i-1][j-weight[i]] + value[i]);
            else
                dp[i][j] = dp[i-1][j];
        }
    }
    
    cout << dp[n][max_weight];

    return 0;
}