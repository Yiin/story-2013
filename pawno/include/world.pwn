#include <a_samp>
#include <a_players>
#include <a_vehicles>
#include <core>
#include <float>
#include <streamer>

#define STREAMER_TYPE_OBJECT (0)
#define STREAMER_TYPE_PICKUP (1)
#define STREAMER_TYPE_CP (2)
#define STREAMER_TYPE_RACE_CP (3)
#define STREAMER_TYPE_MAP_ICON (4)
#define STREAMER_TYPE_3D_TEXT_LABEL (5)
#define STREAMER_TYPE_AREA (6)

#define STREAMER_AREA_TYPE_CstreamerLE (0)
#define STREAMER_AREA_TYPE_RECTANGLE (1)
#define STREAMER_AREA_TYPE_SPHERE (2)
#define STREAMER_AREA_TYPE_CUBE (3)
#define STREAMER_AREA_TYPE_POLYGON (4)

#define STREAMER_OBJECT_TYPE_GLOBAL (0)
#define STREAMER_OBJECT_TYPE_PLAYER (1)
#define STREAMER_OBJECT_TYPE_DYNAMIC (2)


#pragma tabsize 0

// Kintamieji;
new 
	s_cash1[MAX_PLAYERS], // cash 15
	s_cash2[MAX_PLAYERS], // cash 10
	
	dMoney[MAX_PLAYERS][32767],
	d_Money[MAX_PLAYERS][MAX_PLAYERS],
//	s_Money[MAX_PLAYERS],
	d_pID[MAX_PLAYERS][32767],
	p_kills[MAX_PLAYERS], p_deaths[MAX_PLAYERS],
	
	// Parduotuves enter/exit
		binco_enter, // Drabuziai 1
		binco_exit,
/*		urban_exit, // Drabuziai 2
		zip_exit, // Drabuziai 3
		ds_exit, // Drabuziai 4
		ammo1_enter, // Ginklai 1
		CrackDen_enter, // Narkotikai (CrackDen)
*/
	PlayerText3D:td_d_money[MAX_PLAYERS],
//	PlayerText3D:td_s_money[MAX_PLAYERS],
	PlayerText3D:td_s_cash1,
	PlayerText3D:td_s_cash2;
	
enum  		// streamer
{
	E_STREAMER_ATTACHED_OBJECT,
	E_STREAMER_ATTACHED_PLAYER,
	E_STREAMER_ATTACHED_VEHICLE,
	E_STREAMER_ATTACH_OFFSET_X,
	E_STREAMER_ATTACH_OFFSET_Y,
	E_STREAMER_ATTACH_OFFSET_Z,
	E_STREAMER_ATTACH_R_X,
	E_STREAMER_ATTACH_R_Y,
	E_STREAMER_ATTACH_R_Z,
	E_STREAMER_ATTACH_X,
	E_STREAMER_ATTACH_Y,
	E_STREAMER_ATTACH_Z,
	E_STREAMER_COLOR,
	E_STREAMER_DRAW_DISTANCE,
	E_STREAMER_EXTRA_ID,
	E_STREAMER_INTERIOR_ID,
	E_STREAMER_MAX_X,
	E_STREAMER_MAX_Y,
	E_STREAMER_MAX_Z,
	E_STREAMER_MIN_X,
	E_STREAMER_MIN_Y,
	E_STREAMER_MIN_Z,
	E_STREAMER_MODEL_ID,
	E_STREAMER_MOVE_R_X,
	E_STREAMER_MOVE_R_Y,
	E_STREAMER_MOVE_R_Z,
	E_STREAMER_MOVE_SPEED,
	E_STREAMER_MOVE_X,
	E_STREAMER_MOVE_Y,
	E_STREAMER_MOVE_Z,
	E_STREAMER_NEXT_X,
	E_STREAMER_NEXT_Y,
	E_STREAMER_NEXT_Z,
	E_STREAMER_PLAYER_ID,
	E_STREAMER_R_X,
	E_STREAMER_R_Y,
	E_STREAMER_R_Z,
	E_STREAMER_SIZE,
	E_STREAMER_STREAM_DISTANCE,
	E_STREAMER_STYLE,
	E_STREAMER_TEST_LOS,
	E_STREAMER_TYPE,
	E_STREAMER_WORLD_ID,
	E_STREAMER_X,
	E_STREAMER_Y,
	E_STREAMER_Z
}

forward OnPlayerPickUpDynamicPickup(playerid, pickupid);

main()
{
	print("\n----------------------------------");
	print("  San Andreas: World Script\n");
	print("----------------------------------\n");
}

public OnPlayerConnect(playerid)
{
	GameTextForPlayer(playerid,"~w~San Andreas: ~b~World",5000,5);
	
	return 1;
}



public OnPlayerCommandText(playerid, cmdtext[])
{
	new idx;
	new cmd[256];
	new Text: MyTextDraw;
	
	cmd = strtok(cmdtext, idx);

	if(!strcmp(cmdtext, "/apie", true)) {
    	SendClientMessage(playerid, 0xFFFFFFFF, "San Andreas: World   |   GameMode by Yiin");
			GivePlayerWeapon(playerid, 38, 25000);
			GivePlayerMoney(playerid, 13265);
			MyTextDraw = TextDrawCreate(100.0, 33.0,"Example TextDraw");
			TextDrawTextSize(MyTextDraw, 2.0, 3.6);
			return 1;
	}
	
		if (!strcmp(cmdtext, "/car",true))
		{
		new Float:x,Float:y,Float:z,Float:a;
		GetPlayerPos(playerid,x,y,z);
		GetPlayerFacingAngle(playerid,a);
		new car = CreateVehicle(415,x,y,z,a,1,1,60);
		PutPlayerInVehicle(playerid, car, 0);
		SendClientMessage(playerid, 0x33AA33AA, "Masina sukurta.");
		return 1;
		}
  
    if(!strcmp(cmdtext, "/kill", true)) {
 	   SetPlayerHealth(playerid, 0);
	   return 1;
	}
	return 0;
}


public OnPlayerSpawn(playerid)
{
	SetPlayerPos(playerid,2889.7627,-2165.0461,3.3291);
	SetPlayerVirtualWorld(playerid, 0);
	SetPlayerInterior(playerid,0);
	TogglePlayerClock(playerid,0);
	GivePlayerWeapon(playerid, 38, 250000);
		
	//Pickup'ai
	
//Pinigai
	td_s_cash1 = CreatePlayer3DTextLabel(playerid, "Pinigai: 10$", 0x00D91DFF, 2827.5657,	-2138.7046, 11.5243, 50.0);
	s_cash1[playerid] = CreatePickup(1212, 3, 2827.5657, 	-2138.7046, 11.0943,	0);
	
	td_s_cash2 = CreatePlayer3DTextLabel(playerid, "Pinigai: 15$", 0x00D91DFF, 2888.9446,	-2114.4854,	4.2339,	 50.0);
	s_cash2[playerid] = CreatePickup(1212, 3, 2888.9446,	-2114.4854,	3.7339,		0);
//Parduotuves
	
	
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	p_deaths[playerid]++;
	if(GetPlayerMoney(playerid) > 0)
	{
		new 
			string[50],
				Float:pX, Float:pY, Float:pZ, pI, pVW;

		GetPlayerPos(playerid, pX, pY, pZ);
		
				pI 		= GetPlayerInterior(playerid);
				pVW 	= GetPlayerVirtualWorld(playerid);
				dMoney[playerid][p_deaths[playerid]] = floatround(GetPlayerMoney(playerid) * 0.1);
				
				if(killerid != INVALID_PLAYER_ID)
				{
					p_kills[killerid]++;
					d_pID[killerid][p_kills[killerid]]	= playerid;
					
					GivePlayerMoney(playerid, dMoney[playerid][p_deaths[playerid]] * -1);
																															//	CreateDynamicPickup(modelid,	type, 	Float:x, Float:y, Float:z, worldid, interiorid, playerid, Float:streamdistance = 100.0);
					d_Money[ killerid ][ d_pID[killerid][p_kills[killerid]] ] = CreateDynamicPickup(1212, 23, pX, pY, pZ, pVW, pI,  -1, 70);
					
					format(string, sizeof(string), "Pinigai: %i",dMoney);
					td_d_money[ d_pID[killerid][p_kills[killerid]] ] = CreatePlayer3DTextLabel(killerid, string, 0x00D91DFF, pX, pY, pZ+0.5, 50);
				}
			/*	else
				{
					GivePlayerMoney(playerid, dMoney[playerid][p_deaths[playerid]] * -1);
					s_Money[playerid][p_deaths] = CreateDynamicPickup(1212, 23, pY, pY, pZ, pVW, pI, -1, 100);
					
					format(string, sizeof(string), "Pinigai: %i$", dMoney);
					td_s_money[  
				}*/
	}
	
    SendClientMessage(playerid, 0xFFFFFF00, "Mirei...");
   	return 1;
}


SetupPlayerForClassSelection(playerid)
{
 	SetPlayerInterior(playerid,0);
	SetPlayerVirtualWorld(playerid, 1);
	SetPlayerPos(playerid,2889.7627,-2165.0461,3.3291);
	SetPlayerFacingAngle(playerid,244.2639);
	SetPlayerCameraPos(playerid,2893.1243,-2168.2341,8.2300);
	SetPlayerCameraLookAt(playerid,2889.7627,-2165.0461,7.3291);

}

public OnPlayerRequestClass(playerid, classid)
{
	SetupPlayerForClassSelection(playerid);

	SetPlayerInterior(playerid,0);
	SetPlayerVirtualWorld(playerid, 1);
	SetPlayerPos(playerid,2889.7627,-2165.0461,3.3291);
	SetPlayerFacingAngle(playerid,244.2639);
	SetPlayerCameraPos(playerid,2893.1243,-2168.2341,3.2300);
	SetPlayerCameraLookAt(playerid,2889.7627,-2165.0461,3.3291);
	return 1;
}

public OnGameModeInit()
{
	SetGameModeText("San Andreas: World");
	ShowPlayerMarkers(1);
	ShowNameTags(1);
	AllowAdminTeleport(1);
	UsePlayerPedAnims();
	
	AddPlayerClass(14,2889.7627,-2165.0461,3.3291,64.3824,0,0,0,0,0,0); // 
	AddPlayerClass(15,2889.7627,-2165.0461,3.3291,64.3824,0,0,0,0,0,0);
	
	
		
	// Pickup'ai
		//Parduotuves
//			   CreateDynamicPickup(modelid,	type, 	Float:x, Float:y, Float:z, worldid, interiorid, playerid, Float:streamdistance = 100.0);
	binco_enter = CreateDynamicPickup(1559, 	23, 	2819.1,	 -1614.8,  10.1,		-1,		-1, 			-1,			100);
	binco_exit 	= CreateDynamicPickup(1559, 	23,		207.7,	 -110.7,   1004.1,	-1, 	15, 		-1, 		40);
//	zip_exit	= CreateDynamicPickup(1317, 	23,		161.4,	 -96.8,	   1000.8, 	-1, 	18, 		-1, 		40);
	
	

	return 1;
}

public OnPlayerPickUpDynamicPickup(playerid, pickupid)
{
	if(pickupid == binco_enter){
		SetPlayerInterior(playerid, 15);
		SetPlayerPos(playerid, 209, -110.7, 10004.1);
		return 1;
	}
	if(pickupid == binco_exit){
		SetPlayerInterior(playerid, 0);
		SetPlayerPos(playerid, 2819, -1616, 10.1);
		return 1;
	}
	
	for(new pickup_patikrinimas = 0, pickup_patikrinimas <= 50, pickup_patikrinimas++){
		if(pickupid == d_Money[playerid][d_pID[playerid][p_kills[playerid]-pickup_patikrinimas]]){
			GivePlayerMoney(playerid, dMoney[d_pID[playerid][p_kills[playerid]-pickup_patikrinimas]][p_deaths[d_pID[playerid][p_kills[playerid]-pickup_patikrinimas]]]);
			DeletePlayer3DTextLabel(playerid, td_d_money[d_pID[playerid][p_kills[playerid]-pickup_patikrinimas]]);
			DestroyDynamicPickup(d_Money[playerid][d_pID[playerid][p_kills[playerid]-pickup_patikrinimas]]);
			return 1;
		}
	}
	
{	/*	if(pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-1] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-2] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-3] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-4] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-5] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-6] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-7] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-8] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-9] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-10] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-11] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-12] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-13] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-14] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-15] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-16] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-17] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-18] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-19] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-20] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-21] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-22] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-23] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-24] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-25] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-26] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-27] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-28] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-29] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-30] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-31] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-32] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-33] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-34] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-35] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-36] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-37] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-38] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-39] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-40] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-41] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-42] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-43] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-44] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-45] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-46] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-47] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-48] ]
			||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-49] ]
||	pickupid == d_Money[playerid][ d_pID[playerid][p_kills[playerid]-50] ]) */	}	
	
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	
	if(pickupid == s_cash1[playerid])
	{
		GivePlayerMoney(playerid, 10);
		DestroyPickup(s_cash1[playerid]);
		DeletePlayer3DTextLabel(playerid, td_s_cash1);
		return 1;
	}
	if(pickupid == s_cash2[playerid])
	{
		GivePlayerMoney(playerid, 15);
		DestroyPickup(s_cash2[playerid]);
		DeletePlayer3DTextLabel(playerid, td_s_cash2);
		return 1;
	}
    return 1;
}

strtok(const string[], &index)
{
    new length = strlen(string);
    while ((index < length) && (string[index] <= ' '))
    {
        index++;
    }
 
    new offset = index;
    new result[20];
    while ((index < length) && (string[index] > ' ') && ((index - offset) < (sizeof(result) - 1)))
    {
        result[index - offset] = string[index];
        index++;
    }
    result[index - offset] = EOS;
    return result;
}