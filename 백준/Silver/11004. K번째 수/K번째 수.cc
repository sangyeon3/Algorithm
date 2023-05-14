#include <iostream>
#include <algorithm>
using namespace std;

int arr[5000001];

int main() {

    ios::sync_with_stdio(0);
	cin.tie(0);
	cout.tie(0);

    int n, k;
    cin >> n >> k;

    for (int i = 0; i < n; i++)
        cin >> arr[i];

    sort(arr, arr+n);
    
    cout << arr[k-1];

    return 0;
}