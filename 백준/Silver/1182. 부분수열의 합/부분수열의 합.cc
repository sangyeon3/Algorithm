#include <iostream>
#include <vector>
using namespace std;

int N, S;
vector<int> input;
vector<int> v;
int ans = 0;

void checkSum(){
    if(v.size() == 0) return;
    int sum = 0;
    for (int j = 0; j < v.size(); j++)
        sum += v[j];
    if(sum == S) ans++;
}

void sol(int i){
    if(i >= N) return;
    v.push_back(input[i]);
    checkSum();
    sol(i+1);
    v.pop_back();
    sol(i+1);
}

int main() {

    cin >> N >> S;

    int n;
    for (int i = 0; i < N; i++)
    {
        cin >> n;
        input.push_back(n);
    }
    
    sol(0);
    cout << ans << "\n";

    return 0;
}
