#include<bits/stdc++.h>
 
using  namespace std;
 
void  solve()
{
    long long c,f,b,s;
    cin>>c>>f>>b>>s;
    long long x1=360/f,x2=360/b;
    long long lcm=x1*x2/__gcd(x1,x2);
    float totalDeg = 360*1.0*s/c;
    if(totalDeg/lcm == (int)totalDeg/lcm){
    	cout<<totalDeg/30;
	}
	else {
		cout<<(1+((int)totalDeg/lcm))*lcm/30;
	}
}
int main()
{
    int t;
    cin>>t;
    while(t--);
    solve();
}
