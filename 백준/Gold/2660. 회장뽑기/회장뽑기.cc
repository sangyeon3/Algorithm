#include <iostream>
#include <vector>
#include <queue>
using namespace std;

vector<int> relations[51];
int score[51];

void bfs(int start) {
    queue<int> q;
    bool visited[51] = {false, };

    q.push(start);
    visited[start] = true;
    int count = -1;

    while (!q.empty()) {
        int qSize = q.size();
        count++;

        while (qSize--) {
            int f = q.front();
            q.pop();

            for (int next: relations[f]) {
                if (visited[next]) continue;
                visited[next] = true;
                q.push(next);
            }
        }
    }

    score[start] = count;
}

int main() {
    int n;
    cin >> n;

    for (int i = 1; i <= n; i++)
        score[i] = -1;

    int a, b;
    while (true) {
        cin >> a >> b;
        if (a==-1 && b==-1) break;
        relations[a].push_back(b);
        relations[b].push_back(a);
    }

    for (int i = 1; i <= n; i++)
        bfs(i);
    
    int ansScore = 100;
    vector<int> ansVector;
    for (int i = 1; i <= n; i++) {
        if (ansScore > score[i]) {
            ansScore = score[i];
            ansVector.clear();
            ansVector.push_back(i);
        } else if (ansScore == score[i]) {
            ansVector.push_back(i);
        }
    }

    cout << ansScore << " " << ansVector.size() << "\n";
    for (int v: ansVector) cout << v << " ";
}