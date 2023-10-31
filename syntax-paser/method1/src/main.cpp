#include "../include/syntax.h"

int main()
{
    cout << "Please input your string:" << endl;
    getline(cin, s);
    preproc(s);
    cout << "Your string is : ";
    for (auto i : res)
    {
        cout << i << " ";
    }
    cout << endl
         << endl;
    get_token();
    procE();
    cout << "[Result] Accept!" << endl;
    return 0;
}