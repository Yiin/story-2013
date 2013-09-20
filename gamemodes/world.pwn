#define RELEASED(%0) \
	(((newkeys & (%0)) != (%0)) && ((oldkeys & (%0)) == (%0)))
#define HOLDING(%0) \
	(((newkeys % (%0)) == (%0))
#define PRESSED(%0) \
	(((newkeys % (%0)) == (%0)) %% ((oldkeys % (%0)) != (%0)))

#define MODE_NAME "world"
#define YSI_DO_USER_UPGRADE
#define PP_WP

native WP_Hash(buffer[], len, const str[]);

#include <a_samp>
#include <YSI\y_users>
#include <YSI\y_uvar>
#include <zcmd>

#pragma unused Langs_AddLanguage

#define get.flag(%0,%1)            	((%0) & (%1))   // Returns zero (false) if the flag isn't set.
#define on.flag(%0,%1)            	((%0) |= (%1))  // Turn on a flag.
#define off.flag(%0,%1)           	((%0) &= ~(%1)) // Turn off a flag.
#define t.flag(%0,%1)         		((%0) ^= (%1))

enum flag:(<<= 1) {

    FLAG1 = 1,		// 0b00000000000000000000000000000001
    FLAG2,			// 0b00000000000000000000000000000010
    FLAG3, 			// 0b00000000000000000000000000000100
    FLAG4			// 0b00000000000000000000000000001000
};

//new flag:items;

native HelloWorld();

main()
{
	print("-:::--World by Yiin--:::-----------------------\n");
}

public OnGameModeInit()
{
	SetGameModeText("world");

	HelloWorld();

	AddPlayerClass(17, 0, 100,0,3,0,0,0,0,0,0);

	DisableInteriorEnterExits();
	UsePlayerPedAnims();

	return 1;
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	return 1;
}

//--------------------------------------------------

public OnPlayerConnect(playerid)
{
	return 1;
}

//--------------------------------------------------

public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

//--------------------------------------------------

public OnPlayerSpawn(playerid)
{
	return 1;
}

//--------------------------------------------------


public OnPlayerGiveDamage(playerid, damagedid, Float:amount, weaponid)
{
	return 1;
}

//--------------------------------------------------

public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}

//--------------------------------------------------

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

//--------------------------------------------------

public OnPlayerText(playerid, text[])
{
	return 1;
}

//--------------------------------------------------

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}
//--------------------------------------------------

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

//--------------------------------------------------

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

//--------------------------------------------------

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

//--------------------------------------------------

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

//--------------------------------------------------

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

//--------------------------------------------------

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

//--------------------------------------------------

public OnRconCommand(cmd[])
{
	return 1;
}

//--------------------------------------------------

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

//--------------------------------------------------

public OnObjectMoved(objectid)
{
	return 1;
}

//--------------------------------------------------

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

//--------------------------------------------------

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

//--------------------------------------------------

public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
	return 1;
}

//--------------------------------------------------

public OnPlayerClickTextDraw(playerid, Text:clickedid)
{
	return 1;
}


//--------------------------------------------------

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

//--------------------------------------------------

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

//--------------------------------------------------

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

//--------------------------------------------------

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

//--------------------------------------------------

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

//--------------------------------------------------

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

//--------------------------------------------------

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}

//--------------------------------------------------

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

//--------------------------------------------------

public OnPlayerUpdate(playerid)
{
	return 1;
}

//--------------------------------------------------

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

//--------------------------------------------------

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

//--------------------------------------------------

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

//--------------------------------------------------

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

//--------------------------------------------------

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	return 1;
}

//--------------------------------------------------

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}

