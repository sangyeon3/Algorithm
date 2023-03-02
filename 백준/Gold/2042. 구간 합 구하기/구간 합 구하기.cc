#include <iostream>
#include <vector>
using namespace std;

typedef long long ll;

int n, m, k;
ll tree[1024*1024*2];
int base;

void update(ll idx, ll value) {
    idx += base;
    tree[idx] = value;
    while (idx > 1) {
        idx = idx >> 1;
        tree[idx] = tree[idx*2] + tree[idx*2+1];
    }
}

ll sum(ll left, ll right) {
    left += base;
    right += base;
    ll res = 0;

    while (left <= right) {
        if ((left & 1) == 1) {
            res += tree[left];
            left++;
        }
        if ((right & 1) == 0) {
            res += tree[right];
            right--;
        }
        left = left >> 1;
        right = right >> 1;
    }

    return res;
}

int main() {

    ios_base::sync_with_stdio(false); 
    cin.tie(NULL);
    cout.tie(NULL);

    cin >> n >> m >> k;

    for(base = 1; base < n; base = base << 1);

    ll a, b, c;
    // leaf init
    for (int i = 0; i < n; i++) {
        cin >> tree[base + i];
    }

    // other init
    for (int i = base-1; i > 0; i--)
        tree[i] = tree[i*2] + tree[i*2+1];

    // run
    for (int i = 0; i < m+k; i++) {
        cin >> a >> b >> c;
        if (a == 1) {
            update(b-1, c);
        } else {
            cout << sum(b-1, c-1) << "\n";
        }
    }
    
    return 0;
}