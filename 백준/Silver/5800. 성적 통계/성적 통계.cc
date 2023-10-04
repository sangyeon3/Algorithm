#include <iostream>
#include <algorithm>
using namespace std;

int main() {

    cin.tie(NULL);
    ios_base::sync_with_stdio(false);

    int k;
    cin >> k;

    for (int i = 0; i < k; i++)
    {
        int n;
        cin >> n;

        int arr[51];
        for (int j = 0; j < n; j++) cin >> arr[j];

        sort(arr, arr+n);
            
        int max_gap = 0;
        for (int l = 0; l < n-1; l++) max_gap = max(max_gap, arr[l+1] - arr[l]);
        
        cout << "Class " << i+1 << "\n";
        cout << "Max " << arr[n-1] << ", Min " << arr[0] << ", Largest gap " << max_gap << "\n";
        
    }

    return 0;
}