#include <iostream>
#include <string>
#include <algorithm>
using namespace std;

int main(){
    ios_base::sync_with_stdio(0);
    cin.tie(0);

    string s1;
    string s2;
    cin >> s1 >> s2;

    int arr[1001][1001] = {};

    for (int i = 1; i <= s1.size(); i++) {
        for (int j = 1; j <= s2.size(); j++) {
            if(s1[i-1] == s2[j-1])
                arr[i][j] = arr[i-1][j-1] + 1;
            else
                arr[i][j] = max(arr[i-1][j], arr[i][j-1]);
        }
    }
    
    cout << arr[s1.size()][s2.size()];

    return 0;
}