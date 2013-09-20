#include <a_samp>
#include <YSI\y_groups>

main()
{
	print("main()");
}

public OnGameModeInit()
{
	print("OnGameModeInit()");
	return 1;
}

public OnGameModeExit()
{
    print("OnGameModeExit()");
	return 1;
}

public OnPlayerConnect(playerid)
{
	print("OnPlayerConnect()");
	return 1;
}

public OnPlayerRequestClass()
{
	print("OnPlayerRequestClass()");
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	print("OnPlayerDisconnect()");
	return 1;
}
