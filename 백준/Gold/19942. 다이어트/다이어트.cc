#include <iostream>
#include <vector>
using namespace std;

int n;
int minValues[4];
int foods[16][5];
vector<int> vec;

int minCost = -1;
vector<int> ans;
int ansCount = 0;

void recursion(int cur) 
{
    // calculate
    int sumValues[5] = {0, };
    for (int i = 0; i < vec.size(); i++)
    {
        // cout << vec[i] << " ";
        for (int j = 0; j < 5; j++)
        {
            sumValues[j] += foods[vec[i]][j];
        }
    }
    // cout << "\n";

    bool state = true;
    for (int i = 0; i < 4; i++)
    {
        if (minValues[i] > sumValues[i]) state = false;
    }
    
    if (state) {
        if (minCost == -1 || minCost > sumValues[4]) {
            minCost = sumValues[4];
            ansCount = vec.size();
            ans = vec;
        }
    }

    // return
    if (cur == n) return;

    // next
    for (int i = cur; i < n; i++)
    {
        vec.push_back(i);
        recursion(i+1);
        vec.pop_back();
    }
}

int main()
{
    ios::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);

    cin >> n;
    for (int i = 0; i < 4; i++)
    {
        cin >> minValues[i];
    }

    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < 5; j++)
        {
            cin >> foods[i][j];
        }
    }

    recursion(0);

    cout << minCost << "\n";

    if (minCost != -1) {
        for (int i = 0; i < ansCount; i++)
        {
            cout << ans[i] + 1 << " ";
        }
    }
    
    return 0;
}   