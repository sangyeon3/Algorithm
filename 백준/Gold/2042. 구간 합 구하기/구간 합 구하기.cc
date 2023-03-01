#include <iostream>
using namespace std;
typedef long long ll;

int N, M, K;
int startIdx = 1;

ll tree[1024*1024*2];

void Input(){
    cin >> N >> M >> K;

    int tmp = N;
    while(tmp > 0){
        startIdx = startIdx << 1;
        tmp = tmp >> 1;
    }

    // 리프노드 설정
    for (int i = 0; i < N; i++)
        cin >> tree[startIdx+i];

    for (int i = startIdx+N; i < startIdx*2; i++)
        tree[i] = 0;
    
}

void Solution(){

    // 인터널 노드 계산
    int curIdx = startIdx >> 1;
    while(curIdx > 0){
        for(int i=0; i< curIdx; i++){
            tree[curIdx+i] = tree[2*(curIdx+i)] + tree[2*(curIdx+i)+1];
        }
        curIdx = curIdx >> 1;
    }


    // 업데이트 + 구간합 구하기
    ll a, b, c;
    for (int i = 0; i < M+K; i++)
    {
        cin >> a >> b >> c;
        if(a==1){ // b번째 수를 c로 변경
            tree[startIdx+b-1] = c;

            int curIdx = (startIdx+b-1) >> 1;
            while(curIdx > 0){
                tree[curIdx] = tree[curIdx*2] + tree[curIdx*2 +1];
                curIdx = curIdx >> 1;
            }
        }
        else if(a==2){ // b번째 수부터 c번째 수까지의 합 출력
            b = b + startIdx - 1;
            c = c + startIdx - 1; 

            ll sum = 0;
            while(b <= c){
                // b가 right_child라면
                if((b&1) == 1) sum += tree[b];
                // c가 left_child라면
                if((c&1) == 0) sum += tree[c];

                // a는 오른쪽부모, b는 왼쪽부모로 올라감
                b = (b+1) >> 1;
                c = (c-1) >> 1;
            }
            cout << sum << "\n";
        }

    }

    return;
}

int main() {

    ios_base::sync_with_stdio(false); 
    cin.tie(NULL);
    cout.tie(NULL);

    Input();    
    Solution();

    return 0;
}