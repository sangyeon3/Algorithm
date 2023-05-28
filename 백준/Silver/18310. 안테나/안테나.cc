#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

typedef long long ll;

vector<int> vec;

int main() {

    ios::sync_with_stdio(0);
	cin.tie(0);
	cout.tie(0);

    int n;
    cin >> n;

    int a;
    for (int i = 0; i < n; i++) {
        cin >> a;
        vec.push_back(a);
    }

    sort(vec.begin(), vec.end());

    ll prevDiff = 0, nextDiff = 0;
    for (int i = 0; i < n; i++)
    {
        nextDiff += vec[i] - vec[0];
    }

    ll minDiff = nextDiff;
    int ansIndex = vec[0];
    for (int i = 1; i < n; i++)
    {
        ll diff = vec[i] - vec[i-1];
        prevDiff += i * diff;
        nextDiff -= (n-i) * diff;

        if (minDiff > prevDiff + nextDiff) {
            minDiff = prevDiff + nextDiff;
            ansIndex = vec[i];
        }
    }
    
    cout << ansIndex << "\n";

    return 0;
}