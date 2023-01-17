#include <iostream>
using namespace std;

struct entry {
    int force;
    int robotIndex;
    entry(int f = -1, int r = -1): force(f), robotIndex(r) {}
};

int main() {

    int n, k;
    cin >> n >> k;

    entry belt[201];
    int force;
    for (int i = 0; i < 2*n; i++){
        cin >> force;
        belt[i] = entry(force, -1);
    }

    int up = 0;
    int robots[2000000];
    int robotIdx = 0;
    int robotCount = 0;
    int zeroCount = 0;
    int level = 0;

    while(1) {
        level++;
        // 회전
        up = ((up == 0) ? (2*n-1) : (up-1));
        // 로봇이 내리는 위치에 있는지 확인
        int down = (up + n -1) % (2*n);
        if (belt[down].robotIndex != -1) {
            robotCount--;
            robotIdx++;
            belt[down].robotIndex = -1;
        }
        // 로봇 이동
        if (robotCount > 0) {
            for (int i = robotIdx; i < robotIdx + robotCount; i++)
            {
                int nextIdx = (robots[i] + 1) % (2*n);
                if (belt[nextIdx].force > 0 && belt[nextIdx].robotIndex == -1) {
                    belt[nextIdx].force--;
                    if (belt[nextIdx].force == 0) zeroCount++;
                    belt[robots[i]].robotIndex = -1;
                    // 내리는 위치면 내림
                    if (nextIdx == down) {
                        robotIdx++;
                        robotCount--;
                        continue;
                    }
                    belt[nextIdx].robotIndex = i;
                    robots[i] = nextIdx;
                }
            }
        }

        if (belt[up].force > 0) {
            belt[up].force--;
            belt[up].robotIndex = robotIdx + robotCount;
            robots[robotIdx + robotCount] = up;
            robotCount++;
            if (belt[up].force == 0) zeroCount++;
        }

        if (zeroCount >= k) break;
    }
    cout << level << "\n";
    
    return 0;
}