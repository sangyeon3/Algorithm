#include <iostream>
#include <algorithm>
#include <string.h>
using namespace std;

int m, n;
int arr[501][501] = {};
int dp[501][501] = {};

int func(int x, int y){
    if(x==m && y==n)
        return 1;
    if(dp[x][y] != -1) 
        return dp[x][y];

    dp[x][y] = 0;
    if(x+1 <= m && arr[x][y] > arr[x+1][y]){
        dp[x][y] += func(x+1, y);
    }
    if(y+1 <= n && arr[x][y] > arr[x][y+1]){
        dp[x][y] += func(x, y+1);
    }
    if(x-1 > 0 && arr[x][y] > arr[x-1][y]){
        dp[x][y] += func(x-1, y);
    }
    if(y-1 > 0 && arr[x][y] > arr[x][y-1]){
        dp[x][y] += func(x, y-1);
    }
    return dp[x][y];
}

int main(){
    ios_base::sync_with_stdio(0);
    cin.tie(0);

    cin >> m >> n;

    for (int i = 1; i <= m; i++)    {
        for (int j = 1; j <= n; j++) {
            dp[i][j] = -1;
            cin >> arr[i][j];
        }
    }

    cout << func(1,1);
    return 0;
}