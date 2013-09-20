#include <a_samp>
#include <foreach>

enum e_inv
{
	bool:afk,
	bool:is_afk,
	Float:last_hit,
	inv_warnings
};
new yInv_player[MAX_PLAYERS][e_inv];
new yInv_timer;

forward CheckPaused2();

public OnGameModeInit()
{
	print(" ---:: yInv by Yiin ");
	yInv_timer = SetTimer("CheckPaused2",5000,true);
	return CallLocalFunction("yInv_OnGameModeInit", "");
}
#if defined _ALS_OnGameModeInit
  #undef OnGameModeInit
#else
#define _ALS_OnGameModeInit
#endif
#define OnGameModeInit yInv_OnGameModeInit
forward yInv_OnGameModeInit();

public OnGameModeExit()
{
	KillTimer(yInv_timer);
	return CallLocalFunction("yInv_OnGameModeExit", "");
}
#if defined _ALS_OnGameModeExit
  #undef OnGameModeExit
#else
#define _ALS_OnGameModeExit
#endif
#define OnGameModeExit yInv_OnGameModeExit
forward yInv_OnGameModeExit();

public OnPlayerConnect(playerid)
{
    yInv_player[playerid][inv_warnings] = 0;
    yInv_player[playerid][last_hit] = 0;
    return CallLocalFunction("yInv_OnPlayerConnect", "i", playerid);
}
#if defined _ALS_OnPlayerConnect
  #undef OnPlayerConnect
#else
#define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect yInv_OnPlayerConnect
forward yInv_OnPlayerConnect(playerid);

public OnPlayerSpawn(playerid)
{
    yInv_player[playerid][inv_warnings] = 0;
    return CallLocalFunction("yInv_OnPlayerSpawn", "i", playerid);
}
#if defined _ALS_OnPlayerSpawn
  #undef OnPlayerSpawn
#else
#define _ALS_OnPlayerSpawn
#endif
#define OnPlayerSpawn yInv_OnPlayerSpawn
forward yInv_OnPlayerSpawn(playerid);

public OnPlayerUpdate(playerid)
{
    yInv_player[playerid][is_afk] = false;
    yInv_player[playerid][afk] = false;
    return CallLocalFunction("yInv_OnPlayerUpdate", "i", playerid);
}
#if defined _ALS_OnPlayerUpdate
  #undef OnPlayerUpdate
#else
#define _ALS_OnPlayerUpdate
#endif
#define OnPlayerUpdate yInv_OnPlayerUpdate
forward yInv_OnPlayerUpdate(playerid);

public OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid)
{
	if(yInv_player[playerid][afk] || GetPVarInt(playerid, "FREEZED")) return 1;
	new
		Float: hp,
		Float: arm,
		Float: HitPoints;
		
	GetPlayerHealth(playerid, hp);
	GetPlayerArmour(playerid, arm);
	HitPoints = hp + arm;

	if(yInv_player[playerid][last_hit] < HitPoints)
		yInv_player[playerid][inv_warnings]++;
	else
		yInv_player[playerid][inv_warnings] = 0;

	if(yInv_player[playerid][inv_warnings] > 15)
	{
		// ŽAIDĖJAS NAUDOJA INV
		Kick(playerid);
		CallLocalFunction("OnPlayerUseInv", "i", playerid);
	}

	yInv_player[playerid][last_hit] = HitPoints - amount;

	return CallLocalFunction("yInv_OnPlayerTakeDamage", "iifi", playerid, issuerid, amount, weaponid);
}
#if defined _ALS_OnPlayerTakeDamage
  #undef OnPlayerTakeDamage
#else
#define _ALS_OnPlayerTakeDamage
#endif
#define OnPlayerTakeDamage yInv_OnPlayerTakeDamage
forward yInv_OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid);

stock yInv_TogglePlayerControllable(playerid, toggle)
{
    SetPVarInt(playerid, "FREEZED", toggle);
    return TogglePlayerControllable(playerid, toggle);
}

#if defined _ALS_TogglePlayerControllable
    #undef TogglePlayerControllable
#else
    #define _ALS_TogglePlayerControllable
#endif
#define TogglePlayerControllable yInv_TogglePlayerControllable

public CheckPaused2()
{
	foreach(new i : Player)
	{
		if(yInv_player[i][is_afk])
	    	yInv_player[i][afk] = true;
	    yInv_player[i][is_afk] = true;
	}
	return 1;
}