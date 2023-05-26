#include <iostream>
using namespace std;

int main() {

    ios::sync_with_stdio(0);
	cin.tie(0);
	cout.tie(0);

    int n;
    cin >> n;

    int* arr = new int[n];
    for (int i = 0; i < n; i++)
    {
        cin >> arr[i];
    }
    
    // Solution

    int index = -1;
    for (int i = n-2; i >= 0; i--)
    {
        if (arr[i] < arr[i+1]) {
            index = i;
            break;
        }
    }

    if (index == -1) {
        cout << "-1";
        return 0;
    }

    int* ans = new int[n];
    bool visited[10001] = {false, };
    for (int i = 0; i < index; i++)
    {
        visited[arr[i]] = true;
        ans[i] = arr[i];
    }

    int tmp = arr[index]+1;
    while (visited[tmp]) {
        tmp++;
    }
    visited[tmp] = true;
    ans[index] = tmp;

    tmp = 1;
    index++;
    while (index < n) {
        if (!visited[tmp]) {
            ans[index] = tmp;
            index++;
        } 
        tmp++;
    }
    
    for (int i = 0; i < n; i++)
    {
        cout << ans[i] << " ";
    }

    return 0;
}