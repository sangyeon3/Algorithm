#include <iostream>
#include <vector>
#include <queue>
using namespace std;

vector<int> relations[100001];
int parents[100001] = {0, };

void bfs() {
    queue<int> q;
    q.push(1);
    parents[1] = -1;

    while (!q.empty()) {
        int cur = q.front();
        q.pop();

        for(int next: relations[cur]) {
            if (parents[next] != 0) continue;
            parents[next] = cur;
            q.push(next);
        }
    }
}

int main()
{
    ios::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);

    int n;
    cin >> n;

    for (int i = 0; i < n-1; i++)
    {
        int a, b;
        cin >> a >> b;
        relations[a].push_back(b);
        relations[b].push_back(a);
    }

    bfs();

    for (int i = 2; i <= n; i++)
    {
        cout << parents[i] << "\n";
    }

    return 0;
}   
