#include <iostream>
#include <algorithm>
using namespace std;

int n, c;
int minHome = 1000000001, maxHome = -1;
int arr[200001];

void Input() {
    cin >> n >> c;

    for (int i = 0; i < n; i++) {
        cin >> arr[i];
        minHome = min(minHome, arr[i]);
        maxHome = max(maxHome, arr[i]);
    }
}

bool isAvaliable(int distance) {
    int count = 1;
    int prev = arr[0];
    for (int i=1; i<n; i++) {
        int diff = arr[i] - prev;
        if (diff >= distance) {
            prev = arr[i];
            count += 1;
        }
    }
    // cout << "distance count: " << distance << " " << count << "\n";
    if (count >= c) return true;
    return false;
}

void Solution() {
    sort(arr, arr+n);

    // Binary Search
    int l = 0, r = maxHome - minHome;
    int ans;
    while (l <= r) {
        int mid = (l+r)/2;
        // cout << "l r mid: " << l << " " << r << " " << mid << "\n";
        if (isAvaliable(mid)) {
            l = mid+1;
            ans = mid;
        }
        else r = mid-1;
    }
    cout << ans << "\n";
}

int main() {

    Input();
    Solution();

    return 0;
}