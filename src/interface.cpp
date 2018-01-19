#include <ph7.h>

#include <vector>

using namespace std;

vector<ph7* > ph7_ph7_instances;

extern "C"
{
	int ph7_ph7_new()
	{
		ph7* ph;
		if(ph7_init(&ph) != PH7_OK) {
			return -1;
		}
		ph7_ph7_instances.push_back(ph);
		return ph7_ph7_instances.size()-1;
	}
}