#include <iostream>
#include <queue>
using namespace std;

int main()
{
    ios::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);

    int n, k;
    cin >> n >> k;

    // pq <초, 위치>
    priority_queue<pair<int, int> > pq;
    bool visited[100001] = {false, };

    pq.push(make_pair(0, n));
    int ans = INT32_MAX;

    while (!pq.empty()) {
        int sec = -pq.top().first, pos = pq.top().second;
        pq.pop();

        if (visited[pos]) continue;
        visited[pos] = true;

        if (pos == k) {
            ans = min(ans, sec);
        }
        if (pos+1 <= 100000 && !visited[pos+1]) {
            pq.push(make_pair(-(sec+1), pos+1));
        }
        if (pos-1 >= 0 && !visited[pos-1]) {
            pq.push(make_pair(-(sec+1), pos-1));
        }
        if (pos*2 >= 0 && pos*2 <= 100000 && !visited[pos*2]) {
            pq.push(make_pair(-sec, pos*2));
        }
    }

    cout << ans << "\n";

    return 0;
}   
