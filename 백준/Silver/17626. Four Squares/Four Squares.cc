#include <iostream>
#include <algorithm>
using namespace std;

int n;
int arr[50001];

int main() {

    ios::sync_with_stdio(0);
	cin.tie(0);
	cout.tie(0);

    cin >> n;

    arr[1] = 1;
    int square = 1;

    for (int i = 2; i <= n; i++)
    {
        if ((square+1) * (square+1) == i) {
            arr[i] = 1;
            square++;
            continue;
        }
        arr[i] = arr[i-1] + 1;
        for (int j = 2; j <= square; j++)
        {  
            arr[i] = min(arr[i], arr[j*j] + arr[i-j*j]);
        }
    }

    cout << arr[n] << "\n";

    return 0;
}