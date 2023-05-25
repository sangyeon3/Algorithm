#include <iostream>
using namespace std;

int main() {

    ios::sync_with_stdio(0);
	cin.tie(0);
	cout.tie(0);

    int x;
    cin >> x;

    if (x == 64) {
        cout << "1\n";
        return 0;
    }

    int remain_sum = 0;
    int count = 0;
    int shortest = 64;

    while (true) {
        shortest /= 2;
        if (remain_sum + shortest < x) {
            remain_sum += shortest;
            count++;
        } else if (remain_sum + shortest == x) {
            count++;
            break;
        } 
    }

    cout << count << "\n";
    
    return 0;
}