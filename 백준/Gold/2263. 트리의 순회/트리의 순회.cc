#include <iostream>
#include <map>
using namespace std;

map<int, int> dict;
int inorder[100001];
int postorder[100001];

void traverse(int in_start, int in_end, int post_start, int post_end) {
    int root = postorder[post_end];
    cout << root << " ";


    int rootIndex = dict.find(root)->second;
    int leftChildSize = rootIndex - in_start;
    int newPostEnd = post_start+leftChildSize-1;
    if (in_start <= rootIndex-1) 
        traverse(in_start, rootIndex-1, post_start, newPostEnd);
    if (rootIndex+1 <= in_end)
        traverse(rootIndex+1, in_end, newPostEnd+1, post_end-1);
}

int main() {

    ios::sync_with_stdio(0);
	cin.tie(0);
	cout.tie(0);

    int n;
    cin >> n;

    for (int i = 0; i < n; i++)
    {
        cin >> inorder[i];
        dict[inorder[i]] = i;
    }
    
    for (int i = 0; i < n; i++)
    {
        cin >> postorder[i];
    }

    // Solution

    traverse(0, n-1, 0, n-1);

    return 0;
}