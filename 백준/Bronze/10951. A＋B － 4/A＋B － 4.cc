#include <stdio.h>
using namespace std;

// EOF 참고 : https://takeknowledge.tistory.com/20

int main() {

    int a, b;
    while (scanf("%d %d", &a, &b) != EOF) {
        printf("%d\n", a+b);
    }

    return 0;
}