#include <a_samp>
#include <foreach>

enum e_inv
{
	bool:afk,
	bool:is_afk,
	Float:last_hit,
	inv_warnings
};
new player[MAX_PLAYERS][e_inv];
	
forward CheckPaused();

public OnFilterScriptInit()
{
	print(" ---:: yInv by Yiin ");   

	return SetTimer("CheckPaused",5000,true);
}

public OnFilterScriptExit()	return 1;

public OnPlayerConnect(playerid)
{
    player[playerid][inv_warnings] = 0;
    player[playerid][last_hit] = 0;
    
    return 1;
}

public OnPlayerSpawn(playerid)
{
    player[playerid][inv_warnings] = 0;
    
	return 1;
}

public OnPlayerUpdate(playerid)
{
    player[playerid][is_afk] = false;
    player[playerid][afk] = false;

	return 1;
}

public OnPlayerGiveDamage(playerid, damagedid, Float:amount, weaponid)
{
	if(player[damagedid][afk]) return 1;
	new
		Float: hp,
		Float: arm,
		Float: HitPoints;
		
	GetPlayerHealth(damagedid, hp);
	GetPlayerArmour(damagedid, arm);
	HitPoints = hp + arm;

	if(player[damagedid][last_hit] < HitPoints)
		player[damagedid][inv_warnings]++;
	else
		player[damagedid][inv_warnings] = 0;

	if(player[damagedid][inv_warnings] > 15)
	{
		// ŽAIDĖJAS NAUDOJA INV
		Kick(damagedid);
	}

	player[damagedid][last_hit] = HitPoints - amount;

	return 1;
}

public CheckPaused()
{
	foreach(new i : Player)
	{
		if(player[i][is_afk])
	    	player[i][afk] = true;
	    player[i][is_afk] = true;
	}
	return 1;
}