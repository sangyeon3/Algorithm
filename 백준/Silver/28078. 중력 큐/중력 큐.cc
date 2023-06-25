#include <iostream>
#include <deque>
using namespace std;

#define RIGHT 0
#define DOWN 1
#define LEFT 2
#define UP 3

#define BALL 0
#define WALL 1

deque<int> dq;
int counts[2] = {0, 0}; // 0은 ball, 1은 wall
int dir = RIGHT;

void pop_balls()
{
    if (dir == UP)
    {
        while (!dq.empty() && dq.back() == BALL)
        {
            dq.pop_back();
            counts[BALL]--;
        }
    }
    else if (dir == DOWN)
    {
        while (!dq.empty() && dq.front() == BALL)
        {
            dq.pop_front();
            counts[BALL]--;
        }
    }
}

int main()
{

    ios::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);

    int Q;
    cin >> Q;

    while (Q--)
    {
        string cmd;
        cin >> cmd;

        char c;
        if (cmd == "push")
        {
            cin >> c;

            int elem = (c == 'b' ? BALL : WALL);
            counts[elem]++;
            dq.push_back(elem);
            pop_balls();
        }
        else if (cmd == "pop")
        {
            // 비어있는 경우
            if (dq.empty()) continue;

            counts[dq.front()]--;
            dq.pop_front();

            pop_balls();
        }
        else if (cmd == "rotate")
        {
            cin >> c;

            int d = (c == 'l' ? -1 : 1);
            dir = (dir + d + 4) % 4;

            pop_balls();
        }
        else if (cmd == "count")
        {
            cin >> c;

            int elem = (c == 'b' ? BALL : WALL);
            cout << counts[elem] << "\n";
        }
    }

    return 0;
}