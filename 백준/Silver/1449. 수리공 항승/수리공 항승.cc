#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;

int n, l;
vector<int> vec;

int main() {

    ios::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);

    cin >> n >> l;

    int a;
    for (int i = 0; i < n; i++)
    {
        cin >> a;
        vec.push_back(a);
    }

    sort(vec.begin(), vec.end());
    
    double end = 0;
    int count = 0;
    for (int location: vec) {
        if (end < location) {
            count++;
            end = location + l - 0.5;
        }
    }

    cout << count << "\n";

    return 0;
}