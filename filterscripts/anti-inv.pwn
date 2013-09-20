#define FILTERSCRIPT
#define COLOR_BLUE 0x576E86FF

#include <a_samp>

new
	bool: hp_w[MAX_PLAYERS],
	Float: last_hit[MAX_PLAYERS],
	inv_w[MAX_PLAYERS],
	timer_inv[MAX_PLAYERS];

forward inv(playerid);

public OnFilterScriptInit()
{
	print(" ---:: AntiINV by Yiin ::---");
	return 1;
}


public OnPlayerConnect(playerid)
{
	inv_w[playerid] = 0;
	return 1;
}

public OnPlayerSpawn(playerid)
{
    hp_w[playerid] = false;
	inv_w[playerid] = 0;
	return 1;
}

public OnPlayerGiveDamage(playerid, damagedid, Float:amount, weaponid)
{
	if(afk[damagedid] == true) return 1; // Put here your AFK checking.

	KillTimer(timer_inv[damagedid]);

	new
		Float: hp,
		Float: arm,
		Float: HitPoints
	;

	GetPlayerHealth(damagedid, hp);
	GetPlayerArmour(damagedid, arm);

	HitPoints = hp + arm;

	if(last_hit[damagedid] < HitPoints - 0.5){
		inv_w[damagedid]++;
	}

	if(inv_w[damagedid] == 20 || 30 || 40 || 50 ){
		SetPlayerHealth(damagedid, hp - ( hp * 0.5 ) );
		if(hp_w[damagedid] == false) {
			SendClientMessage(damagedid, COLOR_BLUE, "Wtf, gi á tave ðaudo, bent apsimesk, kad skauda..");
			hp_w[damagedid] = true;
		}
		inv_w[damagedid]++;
		if(inv_w[damagedid] > 50) Kick(playerid);
		return 1;
	}

	last_hit[damagedid] = HitPoints - amount;

	timer_inv[damagedid] = SetTimer("inv", 10000, false);

	return 1;
}

public inv(playerid)
{
	inv_w[playerid] = 0;
}
