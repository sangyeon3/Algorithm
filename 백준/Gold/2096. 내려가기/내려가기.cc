#include <iostream>
using namespace std;

int main()
{

    ios::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);

    int n;
    cin >> n;

    int prev[3][2], cur[3][2];

    for (int i = 0; i < 3; i++)
    {
        cin >> cur[i][0];
        cur[i][1] = cur[i][0];
    }

    for (int j = 0; j < n-1; j++)
    {
        for (int i = 0; i < 3; i++)
        {
            prev[i][0] = cur[i][0];
            prev[i][1] = cur[i][1];
        }

        for (int i = 0; i < 3; i++)
        {   
            cin >> cur[i][0];
            cur[i][1] = cur[i][0];

            int minNum = 1000000, maxNum = -1;
            if (i>0) {
                minNum = min(minNum, prev[i-1][0]);
                maxNum = max(maxNum, prev[i-1][1]);
            }
            if (i<2) {
                minNum = min(minNum, prev[i+1][0]);
                maxNum = max(maxNum, prev[i+1][1]);
            }
            minNum = min(minNum, prev[i][0]);
            maxNum = max(maxNum, prev[i][1]);
            minNum = min(minNum, maxNum);
            maxNum = max(maxNum, minNum);

            cur[i][0] += minNum;
            cur[i][1] += maxNum;
        }
    }
    
    int minNum = 1000000, maxNum = -1;
    for (int i = 0; i < 3; i++)
    {
        minNum = min(minNum, cur[i][0]);
        maxNum = max(maxNum, cur[i][1]);
    }
    
    cout << maxNum << " " << minNum << "\n";

    return 0;
}   