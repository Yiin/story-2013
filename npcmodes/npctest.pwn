//
// NPC Test Script
// Kye 2009
//

#include <a_npc>
#include <a_samp>
//#include <timer>

new zm_timer[2];
new target;

//native SetTimer_(const func[], const delay, const interval, const count);
//native SetTimerEx_(const func[], const delay, const interval, const count, const format[], {Float, _}:...);
//native KillTimer_(timer) = KillTimer;

//------------------------------------------

main()
{
    printf("npctest: main()");
}

//------------------------------------------

public OnNPCModeInit()
{
	printf("npctest: OnNPCModeInit");
	zm_timer[0] = SetTimer("zm_inAction", 10, 1);
	zm_timer[1] = SetTimer("zm_target", 5000, 1);
}

//------------------------------------------

forward zm_target();
public zm_target()
{
	target = GetClosestPlayer();
}

forward zm_inAction();
public zm_inAction()
{
	if(target != -1)
	{
 		new Float:x, Float:y, Float:z;
        GetMyPos(x,y,z);
   		PlayerFacePlayer(target);
     	GetXYInFrontOfPlayer(x,y,0.05);
      	SetMyPos(x,y,z);
	}
}

//------------------------------------------

GetXYInFrontOfPlayer(&Float:x, &Float:y, Float:distance)
{
    new Float:a;
    GetMyPos(x, y, a);
    GetMyFacingAngle(a);
    x += (distance * floatsin(-a, degrees));
    y += (distance * floatcos(-a, degrees));
}

//------------------------------------------

stock GetClosestPlayer()
{
	new Float:x, Float:y, Float:z;
	new Float:x2, Float:y2, Float:z2;
	new Float:dist = 9999.99;
	new pid = -1;
	new name[24];
	GetMyPos(x2, y2, z2);
	for(new i; i < MAX_PLAYERS; i++)
	{
	    if(IsPlayerStreamedIn(i))
	    {
			GetPlayerName(i, name, 24);
			if(strfind(name, "Zombis"))
			{
				GetPlayerPos(i, x,y,z);
				new Float:disttmp;
				GetDistanceFromMeToPoint(x, y, z, disttmp);
				if(disttmp < dist)
					dist = disttmp, pid = i;
			}
		}
	}
	return pid;
}

//------------------------------------------

stock PlayerFacePlayer(playerid) {
    new
        Float: pX,
        Float: pY,
        Float: pZ,
        Float: gX,
        Float: gY,
        Float: gZ
    ;
    if(GetMyPos(pX, pY, pZ) && GetPlayerPos(playerid, gX, gY, gZ)) {
        SetMyFacingAngle(pX = -atan2((gX - pX), (gY - pY)));
        return 1;
    }
    return false;
}

//------------------------------------------

public OnNPCModeExit()
{
	printf("npctest: OnNPCModeExit");
	KillTimer(zm_timer[0]);
	KillTimer(zm_timer[1]);
}

//------------------------------------------

public OnNPCConnect(myplayerid)
{
	printf("npctest: OnNPCConnect(My playerid=%d)", myplayerid);
}

//------------------------------------------

public OnNPCDisconnect(reason[])
{
	printf("npctest: OnNPCDisconnect(reason=%s)", reason);
}

//------------------------------------------

public OnNPCSpawn()
{
    printf("npctest: OnNPCSpawn");
}

//------------------------------------------

public OnNPCEnterVehicle(vehicleid, seatid)
{
	printf("npctest: OnNPCEnterVehicle(vehicleid=%d,seatid=%d)", vehicleid, seatid);
}

//------------------------------------------

public OnNPCExitVehicle()
{
    printf("npctest: OnNPCExitVehicle");
}

//------------------------------------------

public OnClientMessage(color, text[])
{
    printf("npctest: OnClientMessage(color=%d, text=%s)", color, text);
}

//------------------------------------------

public OnPlayerDeath(playerid)
{
    printf("npctest: OnPlayerDeath(playerid=%d)", playerid);
}

//------------------------------------------

public OnPlayerText(playerid, text[])
{
    printf("npctest: (CHAT)(from=%d, text=%s)", playerid, text);
}

//------------------------------------------

public OnPlayerStreamIn(playerid)
{
    printf("npctest: OnPlayerStreamIn(playerid=%d)", playerid);
}

//------------------------------------------

public OnPlayerStreamOut(playerid)
{
    printf("npctest: OnPlayerStreamOut(playerid=%d)", playerid);
}

//------------------------------------------

public OnVehicleStreamIn(vehicleid)
{
    printf("npctest: OnVehicleStreamIn(vehicleid=%d)", vehicleid);
}

//------------------------------------------

public OnVehicleStreamOut(vehicleid)
{
    printf("npctest: OnVehicleStreamOut(vehicleid=%d)", vehicleid);
}

//------------------------------------------



