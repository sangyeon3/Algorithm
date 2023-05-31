#include <iostream>
using namespace std;

int main() {

    int x, n;
    cin >> x >> n;

    int a, b;
    int sum = 0;
    for (int i = 0; i < n; i++)
    {
        cin >> a >> b;
        sum += (a*b);
    }

    if (x == sum) { 
        cout << "Yes\n";
    } else {
        cout << "No\n";
    }
    

    return 0;
}