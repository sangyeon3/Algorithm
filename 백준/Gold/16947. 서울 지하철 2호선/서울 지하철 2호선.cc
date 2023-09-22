#include <iostream>
#include <vector>
#include <stack>
using namespace std;

int n;
vector<int> vec[3001];
int distances[3001];
bool visited[3001];

int bfs(int start) {
    for (int i = 0; i < n+1; i++) {
        distances[i] = -1;
        visited[i] = false;
    }
    
    stack<pair<int, int> > st;
    st.push(make_pair(start, 0));
    visited[start] = true;

    while (!st.empty()) {
        int cur = st.top().first;
        if (distances[cur] != -1) {
            st.pop();
            continue;
        }
        distances[cur] = st.top().second;
        st.pop();

        for (int next: vec[cur]) {
            if (distances[next] != -1) {
                if (distances[next] == distances[cur]-1) continue;
                return distances[next];
            } else {
                st.push(make_pair(next, distances[cur]+1));
            }
        }
    }
    return -1;
}

int main()
{
    ios::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);

    cin >> n;
    for (int i = 0; i < n; i++)
    {
        int a, b;
        cin >> a >> b;
        vec[a].push_back(b);
        vec[b].push_back(a);
    }

    for (int i = 1; i < n+1; i++)
    {
        cout << bfs(i) << " ";
    }

    return 0;
}