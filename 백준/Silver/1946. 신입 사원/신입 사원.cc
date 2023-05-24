#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

// https://tooo1.tistory.com/245

typedef pair<int, int> pii;

bool compare(pii a, pii b) {
    return a.first < b.first;
}

int main() {

    ios::sync_with_stdio(0);
	cin.tie(0);
	cout.tie(0);

    int tc;
    cin >> tc;

    while (tc--) {
        int n;
        cin >> n;

        vector<pii> vec;
        pii temp;
        for (int i = 0; i < n; i++)
        {
            cin >> temp.first >> temp.second;
            vec.push_back(temp);
        }
        
        sort(vec.begin(), vec.end(), compare);
        int prev = 0;
        int count = 1;

        for (int i = 1; i < n; i++)
        {
            if (vec[i].second < vec[prev].second) {
                count++;
                prev = i;
            }
        }

        cout << count << "\n";
        
    }
    
    return 0;
}