#include <iostream>
#include <vector>
using namespace std;

typedef long long ll;

int n, b;
ll ans = 0;
vector<int> vec;

int combination(int r, int c) {
    if (r == c) {
        // cout << "r c: " << r << " " << c << " " << 1 << "\n";
        return 1;
    }
    int up = 1, down = 1;
    for (int i = r; i > (r-c); i--)
        up *= i;
    for (int i = 1; i <= c; i++)
        down *= i;
    // cout << "r c: " << r << " " << c << " " << up/down << "\n";
    return up / down;
}

int calculate() {
    int total = b;
    int ret = 1;
    for (int c: vec) {
        ret *= combination(total, c);
        total -= c;
    }    
    return ret;
}

void printVector() {
    cout << "[";
    for (int c: vec) {
        cout << c << " ";
    }
    cout << "]\n";
}

void recursion(int sum) {
    // printVector();
    if (sum>=1) {
        ans += calculate();
    }
    if (vec.size() == b) {
        return;
    }
    for (int i = 1; sum+i <= b; i++)
    {
        vec.push_back(i);
        recursion(sum+i);
        vec.pop_back();
    }
}

int main() {

    ios::sync_with_stdio(0);
	cin.tie(0);
	cout.tie(0);

    cin >> n;

    while (n--) {
        cin >> b;
        ans = 0;
        recursion(0);
        cout << ans << "\n";
    }

    return 0;
}