#include <iostream>
#include <queue>
using namespace std;

int main()
{
    ios::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);

    int n;
    cin >> n;
    
    queue<pair<int, int> > q;
    int slices;
    for (int i = 0; i < n; i++)
    {
        cin >> slices;
        q.push(make_pair(i, slices));
    }

    int time = 1;
    int result[1001];
    while (!q.empty()) {
        int index = q.front().first, slices = q.front().second;
        q.pop();

        if (slices == 1) {
            result[index] = time;
        } else {
            slices--;
            q.push(make_pair(index, slices));
        }
        time++;
    }

    for (int i = 0; i < n; i++)
    {
        cout << result[i] << " ";
    }

    return 0;
}   