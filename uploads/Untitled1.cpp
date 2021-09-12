#include<bits/stdc++.h>
using namespace std;
struct game{
	int r1,r2,r3,r4,r5,maxx;
};
void solve(){
	int n;
	cin>>n;
	game a[n];
	for(int i=0;i<n;i++){
		cin>>a[i].r1>>a[i].r2>>a[i].r3>>a[i].r4>>a[i].r5;
	}
	game win = a[0];
	int pos = 0;
	for(int i=1;i<n;i++){
		int cnt = 0;
		if(win.r1<a[i].r1)cnt++;
		if(win.r2<a[i].r2)cnt++;
		if(win.r3<a[i].r3)cnt++;
		if(win.r4<a[i].r4)cnt++;
		if(win.r5<a[i].r5)cnt++;
		if(cnt<3){
			win = a[i];
			pos = i;
		}
	}
	for(int i=0;i<n;i++){
		if(i == pos )continue;
		int cnt = 0;
		if(win.r1<a[i].r1)cnt++;
		if(win.r2<a[i].r2)cnt++;
		if(win.r3<a[i].r3)cnt++;
		if(win.r4<a[i].r4)cnt++;
		if(win.r5<a[i].r5)cnt++;
		if(cnt<3){
			cout<<-1<<"\n";
			return;
		}
	}
	cout<<pos+1<<"\n";
}
int main(){
	ios_base::sync_with_stdio(0);
    cin.tie(0);
    cout.tie(0);
	int n;
	cin>>n;
	while(n--){
		solve();
	}
}
