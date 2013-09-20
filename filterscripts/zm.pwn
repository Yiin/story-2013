#define FILTERSCRIPT				\
		by Yiin

#define ZOMBIES 5
		
#include <a_samp>
#include <foreach>

new zm_timer;
/*
enum zm_coords
{
	Float:zmx,
	Float:zmy,
	Float:zmz
};

new zm_spawn[ZOMBIES][zm_coords] =
{
	{
}*/

public OnFilterScriptInit()
{
	new txt[24];
	for(new j = 0; j < ZOMBIES; j++)
	{
		format(txt, 24, "Zombis_%i", j);
		ConnectNPC(txt, "npcidle");
	}
	zm_timer = SetTimer("zm_inAction", 100, 1);
	print("\n ---:: ZM Loaded ");
	return 1;
}

forward zm_inAction();
public zm_inAction()
{
	foreach(new i : Bot)
	{
	    if(GetPlayerDistanceFromPoint(i, 0,0,0) < 1000)
	    {
			new pid = GetClosestPlayer(i);
			printf("pid = %i", pid);
			if(pid != -1)
			{
				PlayerFacePlayer(i, pid);
				//ClearAnimations(i, 1);
				ApplyAnimation(i,"PED","WALK_DRUNK",1,1,1,1,0,200,1);
			}
		}
	}
}

stock GetClosestPlayer(botid)
{
	new Float:x, Float:y, Float:z;
	new Float:x2, Float:y2, Float:z2;
	new Float:dist = 9999.99;
	new pid = -1;
	GetPlayerPos(botid, x2, y2, z2);
	foreach(new i : Player)
	{
		GetPlayerPos(i, x,y,z);
		new Float:disttmp = GetPlayerDistanceFromPoint(botid, x2, y2, z2);
		if(disttmp < dist)
			dist = disttmp, pid = i;
	}
	return pid;
}

public OnFilterScriptExit()
{
	KillTimer(zm_timer);
	foreach(new j : Bot)
		Kick(j);
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	if(IsPlayerNPC(playerid)) return 1;
	SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraLookAt(playerid, 1958.3783, 1343.1572, 15.3746);
	return 1;
}

public OnPlayerConnect(playerid)
{
	if(IsPlayerNPC(playerid)) return 1;
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	if(IsPlayerNPC(playerid)) return 1;
	return 1;
}

public OnPlayerSpawn(playerid)
{
	if(IsPlayerNPC(playerid))
	{
		SetPlayerSkin(playerid, 14);
		SetPlayerPosFindZ(playerid, random(20) - 10,random(20) - 10,50);
		return 1;
	}
	return 1;
}

stock PlayerFacePlayer(playerid, giveplayerid) {
    new
        Float: pX,
        Float: pY,
        Float: pZ,
        Float: gX,
        Float: gY,
        Float: gZ
    ;
    if(GetPlayerPos(playerid, pX, pY, pZ) && GetPlayerPos(giveplayerid, gX, gY, gZ)) {
        SetPlayerFacingAngle(playerid, (pX = -atan2((gX - pX), (gY - pY))));
        return 1;
    }
    return false;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	if (strcmp("/mycommand", cmdtext, true, 10) == 0)
	{
		// Do something here
		return 1;
	}
	return 0;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}

public OnUnoccupiedVehicleUpdate(vehicleid, playerid, passenger_seat)
{
	return 1;
}

public OnVehicleDamageStatusUpdate(vehicleid, playerid)
{
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}

public OnEnterExitModShop(playerid, enterexit, interiorid)
{
	return 1;
}

public OnPlayerGiveDamage(playerid, damagedid, Float: amount, weaponid)
{
	return 1;
}

public OnPlayerTakeDamage(playerid, issuerid, Float: amount, weaponid)
{
	return 1;
}
