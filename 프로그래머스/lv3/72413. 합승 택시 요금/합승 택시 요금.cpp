#include <string>
#include <vector>
#include <iostream>
#include <algorithm>

using namespace std;

int arr[201][201];

int solution(int n, int s, int a, int b, vector<vector<int>> fares) {
    
    // 플로이드 워셜
    for(int i=1; i<=n; i++) {
        for(int j=1; j<=n; j++) {
            arr[i][j] = 1000000;
        }
        arr[i][i] = 0;
    }
    
    for(auto fare: fares) {
        arr[fare[0]][fare[1]] = fare[2];
        arr[fare[1]][fare[0]] = fare[2];
    }
    
    for(int i=1; i<=n; i++) {
        for(int j=1; j<=n; j++) {
            for(int k=1; k<=n; k++) {
                arr[j][k] = min(arr[j][k], arr[j][i] + arr[i][k]);
            }
        }
    }
    
    int answer = arr[s][a] + arr[s][b];
    for(int i=1; i<=n; i++) {
        if (i == s) continue;
        answer = min(answer, arr[s][i] + arr[i][a] + arr[i][b]);
    }
    
    return answer;
}