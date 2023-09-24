#include <iostream>
using namespace std;

int sushi[30001];

int main()
{
    ios::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);

    int n, d, k, c;
    cin >> n >> d >> k >> c;

    for (int i = 0; i < n; i++)
        cin >> sushi[i];

    int ans = 0;
    for (int i = 0; i < n; i++)
    {
        bool state[3001] = {false, };
        int count = 0;
        for (int j = 0; j < k; j++)
        {
            int index = (i+j) % n;
            if (state[sushi[index]]) continue;
            count++;
            state[sushi[index]] = true;
        }

        if (!state[c]) count++;
        ans = max(ans, count);
    }
    
    cout << ans << "\n";

    return 0;
}   
