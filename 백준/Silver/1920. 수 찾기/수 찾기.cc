#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int n, m;
int arr[100001];

void binary(int num, int l, int r){
    int mid = (l+r) / 2;
    if(l > r) {
        cout << "0\n";
        return;
    }
    if(num == arr[mid]){
        cout << "1\n";
        return;
    }
    else if(num < arr[mid]){
        binary(num, l, mid - 1);
    }
    else if(num > arr[mid]){
        binary(num, mid+1, r);
    }
}

int main(){
    ios_base::sync_with_stdio(0);
    cin.tie(0);

    cin >> n;

    for (int i = 0; i < n; i++){
        cin >> arr[i];
    }
    sort(arr, arr+n);

    cin >> m;
    int num;
    for (int i = 0; i < m; i++){
        cin >> num;
        binary(num, 0, n-1);
    }

    return 0;
}