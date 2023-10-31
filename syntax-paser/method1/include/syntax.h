#ifndef SYNTAX_H
#define SYNTAX_H

#include <iostream>
#include <vector>
#include <string>

using namespace std;

string s, token;
vector<string> res;
int location = 0, step = 1;

void procE();

void procT();

void procF();

void error()
{
    cout << endl;
    cout << "[ERROR] Parsing interrupt occurred" << endl;
    exit(0);
}

bool number(char c)
{
    return (c >= '0' && c <= '9');
}

bool number(string s)
{
    for (int i = 0; i < s.size(); i++)
    {
        if (!number(s[i]))
        {
            return false;
        }
    }
    return true;
}

bool opera(char s)
{
    return (s == '+' || s == '-' || s == '*' || s == '/' || s == '(' || s == ')');
}

// judge useless characters
bool useless_char(char s)
{
    return (s == ' ' || s == '\n' || s == '\t' || s == '\r');
}

// judge whether characters are legal
bool illegal(char s)
{
    return (!number(s) && !opera(s) && !useless_char(s));
}

// Preprocess user input: remove useless characters and judge whether it is legal
void preproc(string s)
{
    string temp = "";
    for (int i = 0; i < s.size(); i++)
    {
        if (illegal(s[i]))
        {
            error();
        }
        else if (opera(s[i]))
        {
            temp += s[i];
            res.push_back(temp);
            temp.clear();
        }
        else if (useless_char(s[i]))
        {
            continue;
        }
        else if (number(s[i]))
        {
            int j = i;
            while (number(s[j]))
            {
                j++;
            }
            while (i < j)
            {
                temp += s[i++];
            }
            i--;
            res.push_back(temp);
            temp.clear();
        }
    }
}

void print_token()
{
    cout << "[Token] " << token << endl;
}

void get_token()
{
    if (location < res.size())
    {
        token = res[location++];
    }
    print_token();
}

void procF()
{
    cout << "[Info] Enter function proF()" << endl;
    if (token == "(")
    {
        get_token();
        procE();
        if (token == ")")
        {
            get_token();
            cout << "[" << step++ << "] F -> (E)" << endl;
        }
        else
        {
            error();
        }
    }
    else if (number(token))
    {
        get_token();
        cout << "[" << step++ << "] F -> nums" << endl;
    }
    else
        error();
    cout << "[Info] Return from proF" << endl;
}

void procT()
{
    cout << "[Info] Enter function proT()" << endl;
    procF();
    if (token == "*")
    {
        get_token();
        procT();
        cout << "[" << step++ << "] T -> T * F" << endl;
    }
    else if (token == "/")
    {
        get_token();
        procT();
        cout << "[" << step++ << "] T -> T / F" << endl;
    }
    else
    {
        cout << "[" << step++ << "] T -> F" << endl;
    }
    cout << "[Info] Return from proT" << endl;
}

void procE()
{
    cout << "[Info] Enter function proE()" << endl;
    procT();
    if (token == "+")
    {
        get_token();
        procE();
        cout << "[" << step++ << "] E -> E + T" << endl;
    }
    else if (token == "-")
    {
        get_token();
        procE();
        cout << "[" << step++ << "] E -> E - T" << endl;
    }
    else
        cout << "[" << step++ << "] E -> T" << endl;
    cout << "[Info] Return from proE" << endl;
}

#endif