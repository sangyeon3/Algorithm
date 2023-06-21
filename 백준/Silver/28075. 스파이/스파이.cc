#include <iostream>
#include <vector>
using namespace std;

int n, m;
int arr[7];
vector<int> vec;
int ans = 0;

int cal() {
    int sum = 0;
    for (int i = 0; i < n; i++)
    {
        if (i==0) { 
            sum += arr[vec[i]];
            continue;
        }
        if (vec[i-1] % 3 == vec[i] % 3) {
            sum += arr[vec[i]] / 2;
        } else {
            sum += arr[vec[i]];
        }
    }
    return sum;
}

void func(int size) {
    if (size == n) {
        int sum = cal();
        if (sum >= m) ans++;
        return;
    } 

    for (int i = 0; i < 6; i++)
    {
        vec.push_back(i);
        func(size+1);
        vec.pop_back();
    }   
}

int main() {

    ios::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);

    cin >> n >> m;

    for (int i = 0; i < 6; i++)
    {
        cin >> arr[i];
    }

    func(0);
    
    cout << ans << "\n";

    return 0;
}