#include <iostream>
using namespace std;

int main() {
	int weight;
	cin >> weight;

	int five = weight / 5;

	while (five >= 0) {
		if (weight % 5 == 0) {
			cout << five;
			return 0;
		}

		if ((weight - (five * 5)) % 3 == 0) {
			cout << five + ((weight - (five * 5)) / 3);
			return 0;
		}
		else
			five--;
	}
	cout << -1;

	return 0;
}