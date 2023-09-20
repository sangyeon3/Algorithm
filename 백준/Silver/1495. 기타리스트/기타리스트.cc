#include <iostream>
using namespace std;

int main()
{
    ios::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);

    int n, s, m;
    cin >> n >> s >> m;

    int v[51];
    for (int i = 0; i < n; i++)
    {
        cin >> v[i]; 
    }

    bool prev[1001] = {false, };
    bool cur[1001] = {false, };
    prev[s] = true;

    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j <= m; j++) cur[j] = false;

        for (int j = 0; j <= m; j++)
        {
            if (!prev[j]) continue;
            if (j + v[i] < m+1) {
                cur[j + v[i]] = true;
            }
            if (j - v[i] > -1) {
                cur[j - v[i]] = true;
            }
        }

        for (int j = 0; j <= m; j++) prev[j] = cur[j];
    }

    int max = -1;
    for (int j = 0; j <= m; j++) {
        if (prev[j]) max = j;
    }

    cout << max << "\n";
    
    return 0;
}   