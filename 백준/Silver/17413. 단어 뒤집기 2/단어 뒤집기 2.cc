#include <iostream>
using namespace std;

int main() {

    string s;
    getline(cin, s);

    int i=0, j;
    while (i < s.size()) {
        if (s[i] == '<') {
            j = i;
            while (j < s.size()) {
                cout << s[j];
                if (s[j] == '>') break;
                j++;
            }
            i = j+1;
        } else if (s[i] == ' ') {
            cout << s[i];
            i++;
        } else { // 단어
            j = i;
            while (j < s.size()) {
                j++;
                if (s[j] == '<' || s[j] == ' ') break;
            }
            for(int k=j-1; k>=i; k--) {
                cout << s[k];
            }
            i = j;
        }
    }

    return 0;
}