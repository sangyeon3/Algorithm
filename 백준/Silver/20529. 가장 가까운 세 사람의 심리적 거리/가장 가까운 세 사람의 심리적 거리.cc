#include <iostream>
#include <vector>
using namespace std;

string mbti[33];
vector<int> vec;
int n;
int ans = 100;

int getDistance(string a, string b) {
    int ret = 0;
    for (int i = 0; i < 4; i++)
    {
        if (a[i] != b[i]) ret++;
    }
    return ret;
}

int calculate() {
    string a = mbti[vec[0]], b = mbti[vec[1]], c = mbti[vec[2]];
    return getDistance(a, b) + getDistance(b, c) + getDistance(a, c);
}

void myFunc(int idx) {
    if (vec.size() == 3) {
        // cout << vec[0] << " " << vec[1] << " " << vec[2] << "\n";
        ans = min(ans, calculate());
        return;
    }

    for (int i = idx; i < n; i++)
    {
        vec.push_back(i);
        myFunc(i+1);
        vec.pop_back();
    }
}

int main()
{

    ios::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);

    int tc;
    cin >> tc;
    
    while (tc--) {
        vec.clear();

        cin >> n;

        if (n > 32) {
            string s;
            for (int i = 0; i < n; i++)
            {
                cin >> s;
            }

            cout << "0\n";
            continue;
        }

        for (int i = 0; i < n; i++)
        {
            cin >> mbti[i];
        }

        ans = 100;
        myFunc(0);
        cout << ans << "\n";
    }
    
    return 0;
}