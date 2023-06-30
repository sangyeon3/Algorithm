#include <iostream>
#include <queue>
#include <vector>
using namespace std;

int main()
{

    ios::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);

    int n, m;
    cin >> n >> m;

    int tmp;
    cin >> tmp;
    
    queue<int> q;
    bool knows[51] = {false, };

    int person;
    for (int i = 0; i < tmp; i++)
    {
        cin >> person;
        q.push(person);
        knows[person] = true;
    }
    
    vector<int> person_by_party[51];
    vector<int> party_by_person[51];

    for (int i = 0; i < m; i++)
    {
        cin >> tmp;
        for (int j = 0; j < tmp; j++)
        {
            cin >> person;
            person_by_party[i].push_back(person);
            party_by_person[person].push_back(i);
        }
    }

    bool party_state[51] = {false, };   // false면 거짓말 가능
    
    while (!q.empty()) {
        int knowingPerson = q.front();
        q.pop();

        for (int party: party_by_person[knowingPerson]) {
            if (party_state[party]) continue;
            party_state[party] = true;

            for (int per: person_by_party[party]) {
                if (knows[per]) continue;
                q.push(per);
                knows[per] = true;
            }
        }
    }

    int count = 0;
    for (int i = 0; i < m; i++)
    {
        if (!party_state[i]) count++;
    }

    cout << count << "\n";
    
    return 0;
}   