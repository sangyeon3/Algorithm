#include <iostream>
#include <vector>
#include <queue>
using namespace std;

int main()
{
    ios::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);

    int tc;
    cin >> tc;
    
    while (tc--) {
        int n, d, c;
        cin >> n >> d >> c;

        vector<pair<int, int> > dependency[10001];
        for (int i = 0; i < d; i++)
        {
            int a, b, s;
            cin >> a >> b >> s;
            dependency[b].push_back(make_pair(a, s));
        }
        
        priority_queue<pair<int, int> > pq;
        bool state[10001] = {false, };

        pq.push(make_pair(0, c));
        int count = 0, ansTime = 0;

        while (!pq.empty()) {
            int time = -pq.top().first, computer = pq.top().second;
            pq.pop();
            if (state[computer]) continue;
            state[computer] = true;
            count++;
            ansTime = time;

            for (pair<int, int> pii: dependency[computer]) {
                pq.push(make_pair(-(time + pii.second), pii.first));
            }
        }

        cout << count << " " << ansTime << "\n";
    }

    return 0;
}   
