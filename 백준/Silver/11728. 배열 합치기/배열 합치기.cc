#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;

int n, m;
vector<int> vec;

int main() {

    ios::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);

    cin >> n >> m;

    int a;
    for (int i = 0; i < n + m; i++)
    {
        cin >> a;
        vec.push_back(a);
    }

    sort(vec.begin(), vec.end());
    
    for (int i: vec)
    {
        cout << i << " ";
    }

    return 0;
}