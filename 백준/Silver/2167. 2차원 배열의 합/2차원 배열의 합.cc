#include <iostream>
using namespace std;

int n, m;
int arr[301][301];
int sum[301][301] = {0, };

int main() {

    ios::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);

    cin >> n >> m;

    for (int i = 1; i <= n; i++)
    {
        for (int j = 1; j <= m; j++)
        {
            cin >> arr[i][j];
            sum[i][j] += arr[i][j];
            sum[i][j] += (sum[i-1][j] + sum[i][j-1] - sum[i-1][j-1]);
        }
    }

    int k, i, j, x, y;
    cin >> k;
    while (k--) {
        cin >> i >> j >> x >> y;
        cout << sum[x][y] - sum[i-1][y] - sum[x][j-1] + sum[i-1][j-1] << "\n";
    }

    return 0;
}