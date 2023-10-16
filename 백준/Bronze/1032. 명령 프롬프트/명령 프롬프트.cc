#include <iostream>
using namespace std;

int main() {

    cin.tie(NULL);
    ios_base::sync_with_stdio(false);

    int n;
    cin >> n;

    string s[50];
    for (int i = 0; i < n; i++)
    {
        cin >> s[i];
    }

    string ans = "";
    for (int i = 0; i < s[0].size(); i++)
    {
        char c = s[0][i];
        bool state = true;
        for (int j = 1; j < n; j++)
        {
            if (s[j][i] != c) {
                state = false;
                break;
            }
        }

        if (state) ans += c;
        else ans += "?";
    }

    cout << ans << "\n";
    
    return 0;
}