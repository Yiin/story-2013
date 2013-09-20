#include <a_samp>
#include <foreach>

new gPaused[MAX_PLAYERS];
new afkc[MAX_PLAYERS];

forward CheckPaused();
forward OPP_OnGameModeInit();
forward OPP_OnPlayerConnect(playerid);

public OPP_OnPlayerConnect(playerid)
{
    gPaused[playerid] = 0;
	afkc[playerid] = 0;
    return 1;
}

public CheckPaused()
{
	foreach(new i : Player)
	{
	    if(afkc[i] > 2 && gPaused[i] == 0)
		{
			gPaused[i] = 1;
			CallLocalFunction("OnPlayerPause","i",i);
		}
		else if(afkc[i] < 3 && gPaused[i] == 1)
		{
		    gPaused[i] = 0;
	        CallLocalFunction("OnPlayerUnpause","i",i);
		}
		afkc[i]++;
	}
	return 1;
}

public OPP_OnGameModeInit()
{
	SetTimer("CheckPaused",5000,true);
	return 1;
}
