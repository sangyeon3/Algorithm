#include <iostream>
#include <queue>
#include <cmath>
using namespace std;

typedef pair<double, double> pdd;

struct entry {
    int node;
    double dist;

    entry(int n, double d): node(n), dist(d) {}
};

struct compare {
    bool operator()(entry a, entry b) {
        return a.dist > b.dist;
    }
};

pdd coordinates[101];

double calculateDistance(pdd a, pdd b) {
    double diff_x = a.first - b.first;
    double diff_y = a.second - b.second;
    return sqrt((diff_x * diff_x) + (diff_y * diff_y));
}

int main() {

    ios::sync_with_stdio(0);
	cin.tie(0);
	cout.tie(0);

    int n;
    cin >> n;

    for (int i = 0; i < n; i++)
    {
        cin >> coordinates[i].first >> coordinates[i].second;
    }
    
    priority_queue<entry, vector<entry>, compare> pq;
    bool visited[101] = {false, };
    double ans = 0;

    pq.push(entry(0, 0));

    while (!pq.empty()) {
        int cur = pq.top().node;
        double dist = pq.top().dist;
        pq.pop();

        if (visited[cur]) continue;
        visited[cur] = true;
        ans += dist;

        for (int i = 0; i < n; i++)
        {
            if (visited[i]) continue;
            double dist = calculateDistance(coordinates[i], coordinates[cur]);
            pq.push(entry(i, dist));
        }
    }

    cout << fixed;
    cout.precision(2);
    cout << ans << "\n";

    return 0;
}