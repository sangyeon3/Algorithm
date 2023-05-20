#include <iostream>
using namespace std;

typedef pair<int, int> pii;

bool isAvailable(int y, int x, int n) {
	return (y>=0 && x>=0 && y<n && x<n);
}

int main() {

	string k, d;
	int n;
	cin >> k >> d >> n;	
	
	pii king = make_pair(8-(int(k[1])-'0'), int(k[0])-65);
	pii dol = make_pair(8-(int(d[1])-'0'), int(d[0])-65);

	string dir;
	for (int i=0; i<n; i++) {
		cin >> dir;
		pii move;


		if (dir == "R") {
			move = make_pair(0, 1);
        } else if (dir == "L") {
			move = make_pair(0, -1);
        } else if (dir == "B") {
			move = make_pair(1, 0);
        } else if (dir == "T") {
			move = make_pair(-1, 0);
        } else if (dir == "RT") {
			move = make_pair(-1, 1);
        } else if (dir == "LT") {
			move = make_pair(-1, -1);
        } else if (dir == "RB") {
			move = make_pair(1, 1);
        } else if (dir == "LB") {
			move = make_pair(1, -1);
        }

		int ny = king.first + move.first, nx = king.second + move.second;
		if (!isAvailable(ny, nx, 8)) continue;
		if (ny == dol.first && nx == dol.second) {
			int dol_ny = dol.first + move.first, dol_nx = dol.second + move.second;
			if (!isAvailable(dol_ny, dol_nx, 8)) continue;
			dol = make_pair(dol_ny, dol_nx);
		}
		king = make_pair(ny, nx);
	}

	cout << (char)(king.second + 65) << 8-king.first << "\n";
    cout << (char)(dol.second + 65) << 8-dol.first << "\n";

	return 0;
}