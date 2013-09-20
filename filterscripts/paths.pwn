#define FILTERSCRIPT
#define COLOR_SELECT 0xC80000FF
#define RELEASED(%0) \
	(((newkeys & (%0)) != (%0)) && ((oldkeys & (%0)) == (%0)))

#include <a_samp>
#include <a_mysql>
#include <foreach>
#include <zcmd>
#include <streamer>
#include "RouteConnector"

#define MAX_DOTS 1000

new gps_start[MAX_PLAYERS],
	gps_finish[MAX_PLAYERS],
//	gps_settings[MAX_PLAYERS][4],

	gps_selected[MAX_PLAYERS],

	// GPS TextDrawai
	Text:gps_menu1[MAX_PLAYERS],
	Text:gps_menu2[MAX_PLAYERS],
	Text:gps_menu3[MAX_PLAYERS],
	Text:gps_menu4[MAX_PLAYERS],
	Text:gps_menu5[MAX_PLAYERS],
	Text:gps_menu6[MAX_PLAYERS],
	Text:gps_menu7[MAX_PLAYERS],
	Text:gps_menu8[MAX_PLAYERS],
	Text:gps_menu9[MAX_PLAYERS],
	Text:gps_menu10[MAX_PLAYERS],
	Text:gps_menu11[MAX_PLAYERS],
	Text:gps_menu12[MAX_PLAYERS],
	Text:gps_menu14[MAX_PLAYERS];

stock Float:GDBP(Float:X, Float:Y, Float:Z, Float: PointX, Float: PointY, Float: PointZ) return floatsqroot(floatadd(floatadd(floatpower(floatsub(X, PointX), 2.0), floatpower(floatsub(Y, PointY), 2.0)), floatpower(floatsub(Z, PointZ), 2.0)));

main()
{
	print(" ---:: GPS :: --- ");
}

new Routes[MAX_PLAYERS][MAX_DOTS];


public OnFilterScriptInit()
{
	foreach(new i : Player) for(new x; x < MAX_DOTS; x++) Routes[i][x]=-1;
	foreach(new i : Player) gps_finish[i] = -1; // 16733

	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}

public OnPlayerConnect(playerid)
{
	DisablePlayerOPIDC(playerid);
    for(new x; x < MAX_DOTS; x++) Routes[playerid][x]=-1;
    gps_finish[playerid] = -1;
    gps_selected[playerid] = -1;
    DestroyRoutes(playerid);
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
    gps_meniu(playerid);
    return 1;
}

public OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ)
{
    new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x,y,z);
	EnablePlayerOPIDC(playerid);

	gps_start[playerid] = NearestNodeFromPoint(x,y,z);
	gps_finish[playerid] = NearestNodeFromPoint(fX, fY, fZ);
	GetNodePos(gps_finish[playerid], x,y,z);

	CalculatePath(gps_start[playerid],gps_finish[playerid],playerid+100);
    SetPlayerCheckpoint(playerid, x,y,z,3);
	return 1;
}

public OnPlayerClickTextDraw(playerid, Text:clickedid)
{
    // GPS MENIU
    if(gps_selected[playerid] == -1)
    {
	    if(clickedid == gps_menu2[playerid]) // DARBAI
		{
		    gps_selected[playerid] = 2;
			TextDrawSetString( gps_menu2[playerid], "Mechanikai");
			TextDrawSetString( gps_menu3[playerid], "Policija");
			TextDrawSetString( gps_menu4[playerid], "Medikai");
			TextDrawSetString( gps_menu5[playerid], "Taxi");
			TextDrawSetString( gps_menu6[playerid], "UAB Valytojai");
			TextDrawSetString( gps_menu7[playerid], "UAB Statybos");
			TextDrawSetString( gps_menu8[playerid], "Atgal");
			TextDrawSetString( gps_menu9[playerid], "Gaisrine");
			TextDrawSetString( gps_menu10[playerid], " ");
			TextDrawSetString( gps_menu14[playerid], "Kita");
			return 1;
		}
		if(clickedid == gps_menu3[playerid]) // PARDUOTUVES
		{
		    gps_selected[playerid] = 3;
			TextDrawSetString( gps_menu2[playerid], "Senu masinu turgus");
			TextDrawSetString( gps_menu3[playerid], "Masinu turgus");
			TextDrawSetString( gps_menu4[playerid], "VIP masinu salonas");
			TextDrawSetString( gps_menu5[playerid], "Maisto parduotuve");
			TextDrawSetString( gps_menu6[playerid], "Ginklu parduotuve");
			TextDrawSetString( gps_menu7[playerid], "Dviraciu parduotuve");
			TextDrawSetString( gps_menu8[playerid], "Atgal");
			TextDrawSetString( gps_menu9[playerid], "Nekilnojamasis turtas");
			TextDrawSetString( gps_menu10[playerid], "Garazai");
			TextDrawSetString( gps_menu14[playerid], "Kita");
			return 1;
		}
		if(clickedid == gps_menu4[playerid])
		{
		    gps_selected[playerid] = 4;
		    gps_degaline(playerid);
		    hide_gpsmenu(playerid);
		    return 1;
		}
		return 1;
	}
	if(gps_selected[playerid] == 2)
    {
		if(clickedid == gps_menu2[playerid])
		{
		    gps_mechanikai(playerid);
		    hide_gpsmenu(playerid);
	        return 1;
		}
		if(clickedid == gps_menu3[playerid])
		{
		    gps_policija(playerid);
		    hide_gpsmenu(playerid);
	        return 1;
		}
	}
	if(gps_selected[playerid] == 3)
    {
		if(clickedid == gps_menu2[playerid])
		{
		    gps_carturgus(playerid);
		    hide_gpsmenu(playerid);
	        return 1;
		}
		return 1;
	}
	if(clickedid == gps_menu8[playerid])
	{
	    gps_selected[playerid] = -1;
 		TextDrawSetString( gps_menu2[playerid], "Darbai");
		TextDrawSetString( gps_menu3[playerid], "Parduotuves");
		TextDrawSetString( gps_menu4[playerid], "Degaline");
		TextDrawSetString( gps_menu5[playerid], "Ligonine");
		TextDrawSetString( gps_menu6[playerid], "Savivaldybes");
		TextDrawSetString( gps_menu7[playerid], "Busto nuoma");
		TextDrawSetString( gps_menu9[playerid], " ");
		TextDrawSetString( gps_menu10[playerid], " ");
		TextDrawSetString( gps_menu14[playerid], "Kita");
		return 1;
	}
	if(clickedid == gps_menu11[playerid])
	{
	    hide_gpsmenu(playerid);
        return 1;
	}
	return 0;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(RELEASED(KEY_NO))
	    SelectTextDraw(playerid, COLOR_SELECT);
	return 1;
}

new counter[MAX_PLAYERS] = {0,...};

public GPS_WhenRouteIsCalculated(routeid,node_id_array[],amount_of_nodes)
{
	//printf("Calculated %d %d",routeid,amount_of_nodes);
	//if(information[0] != 0) return 0;

	if(routeid >= 100 && amount_of_nodes > 1)
	{
		counter[routeid-100]--;
	    DestroyRoutes(routeid-100);
		new Float:lastX,Float:lastY,Float:lastZ;

		//GetNodePos(node_id_array[0],lastX,lastY,lastZ);
		GetPlayerPos(routeid-100,lastX,lastY,lastZ);

		new _max;

		if(amount_of_nodes < 50) _max = amount_of_nodes;
		else _max = 50;

		for(new i=0; i < _max; i++)
		{
		    new Float:X,Float:Y,Float:Z;
		    GetNodePos(node_id_array[i],X,Y,Z);
		    CreateMapRoute(routeid-100,lastX,lastY,X,Y,0xFF0000FF);
		    lastX=X;
		    lastY=Y;
			//SetPlayerMapIcon(0,i,X,Y,Z,23,0,MAPICON_LOCAL);
		}
	//print("Calculated.");
	}
	return 1;
}
new bool:upgps = true;
public OnPlayerClosestNodeIDChange(playerid,old_NodeID,new_NodeID)
{
	if(gps_finish[playerid] == -1) return 1;

    if(new_NodeID == gps_finish[playerid])
    {
        SendClientMessage(playerid, 0x00FF00FF, "Tikslà pasiekei sëkmingai!");
        gps_finish[playerid] = -1;
        DestroyRoutes(playerid);
        DisablePlayerCheckpoint(playerid);
        DisablePlayerOPIDC(playerid);
        return 1;
	}
	else if(old_NodeID > 0 && upgps == true)
	{
		CalculatePath(new_NodeID,gps_finish[playerid],playerid+100);
		upgps = false;
		return 1;
	}
	upgps = true;
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	if(gps_finish[playerid] > 0)
	{
        SendClientMessage(playerid, 0x00FF00FF, "Tikslà pasiekei sëkmingai!");
        gps_finish[playerid] = -1;
        DestroyRoutes(playerid);
        DisablePlayerCheckpoint(playerid);
        DisablePlayerOPIDC(playerid);
        return 1;
	}
	return 1;
}

CreateMapRoute(playerid, Float:X1,Float:Y1,Float:X2,Float:Y2,color)
{
	new Float:Dis = 7.0; // Distance, in which distances "dots" should be created.

	new Float:TotalDis = GDBP(X1,Y1,0.0,X2,Y2,0.0); // The total distance between the two Points.

	new Points=floatround(TotalDis/Dis); // The number of dots whcih should be created, relying on the total difference / Dots distance. Very easy

	for(new i=1; i <= Points; i++)
	{
	    new Float:x,Float:y;
	    if(i != 0) // The first dot can't be calculated, because dividing through zero is not valid (see "/ Points*i" below). Secondly, directly setting x and y is faster :P
		{
			x = X1 + (((X2 - X1) / Points)*i);  // Setting off X's position by percentage.
			y = Y1 + (((Y2 - Y1) / Points)*i);  // Setting off Y's position by percentage.
		}
		else
		{
		    x=X1;
		    y=Y1;
		}

		new slot=0;

		while(slot <= MAX_DOTS)
		{
		    if(slot == MAX_DOTS)
		    {
		        slot = -1;
		        break;
		    }

		    if(Routes[playerid][slot] == -1)
		    {
		        break;
		    }
		    slot++;
		}
		if(slot == -1) return 0;
	    new zone = GangZoneCreate(x-(Dis/1.5),y-(Dis/1.5),x+(Dis/1.5),y+(Dis/1.5)); // GangZone from x/y to x/y [+7]
	    GangZoneShowForPlayer(playerid,zone,color); // -----------------------------------CHANGE!!!!!!!
	    Routes[playerid][slot]=zone;
	}

	//printf("LINECR... Distance: %f | Points: %d" , TotalDis, Points);
	return 1;
}

DestroyRoutes(playerid)
{
	for(new x; x < MAX_DOTS; x++)
	{
		if(Routes[playerid][x] != -1)
		{
		    GangZoneDestroy(Routes[playerid][x]);
		    Routes[playerid][x] = -1;
		}
	}
}
//------------------------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------------------------
COMMAND:gps(playerid, params[])
{
    show_gpsmenu(playerid);
	gps_selected[playerid] = -1;

	return 1;
}

CMD:car(playerid, params[])
{
    new Float:X,Float:Y,Float:Z;
    GetPlayerPos(playerid,X,Y,Z);
	CreateVehicle(411,X+2,Y+2,Z,0.0,-1,-1,999999);
	CreateVehicle(562,X-2,Y-2,Z,0.0,-1,-1,999999);
	return 1;
}
//------------------------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------------------------
stock gps_mechanikai(playerid)
{
	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x,y,z);
	gps_start[playerid] = NearestNodeFromPoint(x,y,z);
	gps_finish[playerid] = NearestNodeFromPoint(126.4247,-152.1327,1.5781);
	CalculatePath(gps_start[playerid],gps_finish[playerid],playerid+100);
	GetNodePos(gps_finish[playerid], x,y,z);
	
    DisablePlayerCheckpoint(playerid);
    SetPlayerCheckpoint(playerid,x,y,z,3);
}

stock gps_policija(playerid)
{
    new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x,y,z);
	gps_start[playerid] = NearestNodeFromPoint(x,y,z);
	gps_finish[playerid] = NearestNodeFromPoint(635.6248,-582.8887,16.3359);
	CalculatePath(gps_start[playerid],gps_finish[playerid],playerid+100);
	GetNodePos(gps_finish[playerid], x,y,z);

    DisablePlayerCheckpoint(playerid);
    SetPlayerCheckpoint(playerid,x,y,z,3);
}

stock gps_degaline(playerid)
{
    new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x,y,z);
	gps_start[playerid] = NearestNodeFromPoint(x,y,z);
	gps_finish[playerid] = NearestNodeFromPoint(64.1340,-229.7443,1.3215);
	CalculatePath(gps_start[playerid],gps_finish[playerid],playerid+100);
	GetNodePos(gps_finish[playerid], x,y,z);
	
    DisablePlayerCheckpoint(playerid);
    SetPlayerCheckpoint(playerid,x,y,z,3);
}

stock gps_carturgus(playerid)
{
	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x,y,z);
	gps_start[playerid] = NearestNodeFromPoint(x,y,z);
	gps_finish[playerid] = NearestNodeFromPoint(207.5, -220, 0.7);
	CalculatePath(gps_start[playerid],gps_finish[playerid],playerid+100);
	GetNodePos(gps_finish[playerid], x,y,z);
	
    DisablePlayerCheckpoint(playerid);
    SetPlayerCheckpoint(playerid,x,y,z, 3);
}
//------------------------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------------------------
stock show_gpsmenu(playerid)
{
	TextDrawSetSelectable( gps_menu2[playerid],  1);
	TextDrawSetSelectable( gps_menu3[playerid],  1);
	TextDrawSetSelectable( gps_menu4[playerid],  1);
	TextDrawSetSelectable( gps_menu5[playerid],  1);
	TextDrawSetSelectable( gps_menu6[playerid],  1);
	TextDrawSetSelectable( gps_menu7[playerid],  1);
	TextDrawSetSelectable( gps_menu8[playerid],  1);
	TextDrawSetSelectable( gps_menu9[playerid],  1);
	TextDrawSetSelectable( gps_menu10[playerid], 1);
	TextDrawSetSelectable( gps_menu11[playerid], 1);
	TextDrawSetSelectable( gps_menu14[playerid], 1);

	TextDrawShowForPlayer(playerid, gps_menu1[playerid]);
	TextDrawShowForPlayer(playerid, gps_menu2[playerid]);
	TextDrawShowForPlayer(playerid, gps_menu3[playerid]);
	TextDrawShowForPlayer(playerid, gps_menu4[playerid]);
	TextDrawShowForPlayer(playerid, gps_menu5[playerid]);
	TextDrawShowForPlayer(playerid, gps_menu6[playerid]);
	TextDrawShowForPlayer(playerid, gps_menu7[playerid]);
	TextDrawShowForPlayer(playerid, gps_menu8[playerid]);
	TextDrawShowForPlayer(playerid, gps_menu9[playerid]);
	TextDrawShowForPlayer(playerid, gps_menu10[playerid]);
	TextDrawShowForPlayer(playerid, gps_menu11[playerid]);
	TextDrawShowForPlayer(playerid, gps_menu12[playerid]);
	TextDrawShowForPlayer(playerid, gps_menu14[playerid]);

    TextDrawSetString( gps_menu2[playerid], "Darbai");
	TextDrawSetString( gps_menu3[playerid], "Parduotuves");
	TextDrawSetString( gps_menu4[playerid], "Degaline");
	TextDrawSetString( gps_menu5[playerid], "Ligonine");
	TextDrawSetString( gps_menu6[playerid], "Savivaldybes");
	TextDrawSetString( gps_menu7[playerid], "Busto nuoma");
	TextDrawSetString( gps_menu9[playerid], " ");
	TextDrawSetString( gps_menu10[playerid], " ");
	TextDrawSetString( gps_menu14[playerid], "Kita");
}
stock hide_gpsmenu(playerid)
{
	TextDrawHideForPlayer(playerid, gps_menu1[playerid]);
	TextDrawHideForPlayer(playerid, gps_menu2[playerid]);
	TextDrawHideForPlayer(playerid, gps_menu3[playerid]);
	TextDrawHideForPlayer(playerid, gps_menu4[playerid]);
	TextDrawHideForPlayer(playerid, gps_menu5[playerid]);
	TextDrawHideForPlayer(playerid, gps_menu6[playerid]);
	TextDrawHideForPlayer(playerid, gps_menu7[playerid]);
	TextDrawHideForPlayer(playerid, gps_menu8[playerid]);
	TextDrawHideForPlayer(playerid, gps_menu9[playerid]);
	TextDrawHideForPlayer(playerid, gps_menu10[playerid]);
	TextDrawHideForPlayer(playerid, gps_menu11[playerid]);
	TextDrawHideForPlayer(playerid, gps_menu12[playerid]);
	TextDrawHideForPlayer(playerid, gps_menu14[playerid]);
}
//------------------------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------------------------
stock gps_meniu(playerid)
{
	gps_menu1[playerid] = TextDrawCreate(320.000000, 110.000000, "GPS~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~");
	TextDrawAlignment( gps_menu1[playerid], 2);
	TextDrawBackgroundColor( gps_menu1[playerid], 255);
	TextDrawFont( gps_menu1[playerid], 2);
	TextDrawLetterSize( gps_menu1[playerid], 0.349999, 1.599998);
	TextDrawColor( gps_menu1[playerid], -1);
	TextDrawSetOutline( gps_menu1[playerid], 0);
	TextDrawSetProportional( gps_menu1[playerid], 1);
	TextDrawSetShadow( gps_menu1[playerid], 1);
	TextDrawUseBox( gps_menu1[playerid], 1);
	TextDrawBoxColor( gps_menu1[playerid], 85);
	TextDrawTextSize( gps_menu1[playerid], 10.000000, 410.000000);

	gps_menu2[playerid] = TextDrawCreate(183.000000, 149.000000, "Darbai");
	TextDrawAlignment( gps_menu2[playerid], 2);
	TextDrawBackgroundColor( gps_menu2[playerid], 255);
	TextDrawFont( gps_menu2[playerid], 1);
	TextDrawLetterSize( gps_menu2[playerid], 0.360000, 1.599998);
	TextDrawColor( gps_menu2[playerid], -1);
	TextDrawSetOutline( gps_menu2[playerid], 0);
	TextDrawSetProportional( gps_menu2[playerid], 1);
	TextDrawSetShadow( gps_menu2[playerid], 1);
	TextDrawUseBox( gps_menu2[playerid], 1);
	TextDrawBoxColor( gps_menu2[playerid], 0);
	TextDrawTextSize( gps_menu2[playerid], 15.000000, 52.000000);

	gps_menu3[playerid] = TextDrawCreate(320.000000, 150.000000, "Parduotuves");
	TextDrawAlignment( gps_menu3[playerid], 2);
	TextDrawBackgroundColor( gps_menu3[playerid], 255);
	TextDrawFont( gps_menu3[playerid], 1);
	TextDrawLetterSize( gps_menu3[playerid], 0.360000, 1.699998);
	TextDrawColor( gps_menu3[playerid], -1);
	TextDrawSetOutline( gps_menu3[playerid], 0);
	TextDrawSetProportional( gps_menu3[playerid], 1);
	TextDrawSetShadow( gps_menu3[playerid], 1);
	TextDrawUseBox( gps_menu3[playerid], 1);
	TextDrawBoxColor( gps_menu3[playerid], 0);
	TextDrawTextSize( gps_menu3[playerid], 15.000000, 52.000000);

	gps_menu4[playerid] = TextDrawCreate(460.000000, 150.000000, "Degaline");
	TextDrawAlignment( gps_menu4[playerid], 2);
	TextDrawBackgroundColor( gps_menu4[playerid], 255);
	TextDrawFont( gps_menu4[playerid], 1);
	TextDrawLetterSize( gps_menu4[playerid], 0.360000, 1.699998);
	TextDrawColor( gps_menu4[playerid], -1);
	TextDrawSetOutline( gps_menu4[playerid], 0);
	TextDrawSetProportional( gps_menu4[playerid], 1);
	TextDrawSetShadow( gps_menu4[playerid], 1);
	TextDrawUseBox( gps_menu4[playerid], 1);
	TextDrawBoxColor( gps_menu4[playerid], 0);
	TextDrawTextSize( gps_menu4[playerid], 15.000000, 52.000000);

	gps_menu5[playerid] = TextDrawCreate(184.000000, 200.000000, "Ligonine");
	TextDrawAlignment( gps_menu5[playerid], 2);
	TextDrawBackgroundColor( gps_menu5[playerid], 255);
	TextDrawFont( gps_menu5[playerid], 1);
	TextDrawLetterSize( gps_menu5[playerid], 0.360000, 1.699998);
	TextDrawColor( gps_menu5[playerid], -1);
	TextDrawSetOutline( gps_menu5[playerid], 0);
	TextDrawSetProportional( gps_menu5[playerid], 1);
	TextDrawSetShadow( gps_menu5[playerid], 1);
	TextDrawUseBox( gps_menu5[playerid], 1);
	TextDrawBoxColor( gps_menu5[playerid], 0);
	TextDrawTextSize( gps_menu5[playerid], 15.000000, 52.000000);

	gps_menu6[playerid] = TextDrawCreate(320.000000, 200.000000, "Savivaldybes");
	TextDrawAlignment( gps_menu6[playerid], 2);
	TextDrawBackgroundColor( gps_menu6[playerid], 255);
	TextDrawFont( gps_menu6[playerid], 1);
	TextDrawLetterSize( gps_menu6[playerid], 0.360000, 1.699998);
	TextDrawColor( gps_menu6[playerid], -1);
	TextDrawSetOutline( gps_menu6[playerid], 0);
	TextDrawSetProportional( gps_menu6[playerid], 1);
	TextDrawSetShadow( gps_menu6[playerid], 1);
	TextDrawUseBox( gps_menu6[playerid], 1);
	TextDrawBoxColor( gps_menu6[playerid], 0);
	TextDrawTextSize( gps_menu6[playerid], 15.000000, 52.000000);

	gps_menu7[playerid] = TextDrawCreate(460.000000, 200.000000, "Busto nuoma");
	TextDrawAlignment( gps_menu7[playerid], 2);
	TextDrawBackgroundColor( gps_menu7[playerid], 255);
	TextDrawFont( gps_menu7[playerid], 1);
	TextDrawLetterSize( gps_menu7[playerid], 0.360000, 1.699998);
	TextDrawColor( gps_menu7[playerid], -1);
	TextDrawSetOutline( gps_menu7[playerid], 0);
	TextDrawSetProportional( gps_menu7[playerid], 1);
	TextDrawSetShadow( gps_menu7[playerid], 1);
	TextDrawUseBox( gps_menu7[playerid], 1);
	TextDrawBoxColor( gps_menu7[playerid], 0);
	TextDrawTextSize( gps_menu7[playerid], 15.000000, 77.000000);

	gps_menu8[playerid] = TextDrawCreate(181.000000, 310.000000, "Nustatymai");
	TextDrawAlignment( gps_menu8[playerid], 2);
	TextDrawBackgroundColor( gps_menu8[playerid], 255);
	TextDrawFont( gps_menu8[playerid], 2);
	TextDrawLetterSize( gps_menu8[playerid], 0.300000, 1.499998);
	TextDrawColor( gps_menu8[playerid], -8968705);
	TextDrawSetOutline( gps_menu8[playerid], 0);
	TextDrawSetProportional( gps_menu8[playerid], 1);
	TextDrawSetShadow( gps_menu8[playerid], 1);
	TextDrawUseBox( gps_menu8[playerid], 1);
	TextDrawBoxColor( gps_menu8[playerid], 0);
	TextDrawTextSize( gps_menu8[playerid], 15.000000, 93.000000);

	gps_menu9[playerid] = TextDrawCreate(322.000000, 250.000000, " ");
	TextDrawAlignment( gps_menu9[playerid], 2);
	TextDrawBackgroundColor( gps_menu9[playerid], 255);
	TextDrawFont( gps_menu9[playerid], 1);
	TextDrawLetterSize( gps_menu9[playerid], 0.360000, 1.699998);
	TextDrawColor( gps_menu9[playerid], -1);
	TextDrawSetOutline( gps_menu9[playerid], 0);
	TextDrawSetProportional( gps_menu9[playerid], 1);
	TextDrawSetShadow( gps_menu9[playerid], 1);
	TextDrawUseBox( gps_menu9[playerid], 1);
	TextDrawBoxColor( gps_menu9[playerid], 0);
	TextDrawTextSize( gps_menu9[playerid], 15.000000, 93.000000);

	gps_menu10[playerid] = TextDrawCreate(462.000000, 250.000000, " ");
	TextDrawAlignment( gps_menu10[playerid], 2);
	TextDrawBackgroundColor( gps_menu10[playerid], 255);
	TextDrawFont( gps_menu10[playerid], 1);
	TextDrawLetterSize( gps_menu10[playerid], 0.360000, 1.699998);
	TextDrawColor( gps_menu10[playerid], -1);
	TextDrawSetOutline( gps_menu10[playerid], 0);
	TextDrawSetProportional( gps_menu10[playerid], 1);
	TextDrawSetShadow( gps_menu10[playerid], 1);
	TextDrawUseBox( gps_menu10[playerid], 1);
	TextDrawBoxColor( gps_menu10[playerid], 0);
	TextDrawTextSize( gps_menu10[playerid], 15.000000, 93.000000);

	gps_menu11[playerid] = TextDrawCreate(501.000000, 311.000000, "Close");
	TextDrawAlignment( gps_menu11[playerid], 2);
	TextDrawBackgroundColor( gps_menu11[playerid], 255);
	TextDrawFont( gps_menu11[playerid], 2);
	TextDrawLetterSize( gps_menu11[playerid], 0.330000, 1.700000);
	TextDrawColor( gps_menu11[playerid], -8968705);
	TextDrawSetOutline( gps_menu11[playerid], 0);
	TextDrawSetProportional( gps_menu11[playerid], 1);
	TextDrawSetShadow( gps_menu11[playerid], 1);
	TextDrawUseBox( gps_menu11[playerid], 1);
	TextDrawBoxColor( gps_menu11[playerid], 0);
	TextDrawTextSize( gps_menu11[playerid], 15.000000, 93.000000);

	gps_menu14[playerid] = TextDrawCreate(184.000000, 250.000000, "Kita");
	TextDrawAlignment( gps_menu14[playerid], 2);
	TextDrawBackgroundColor( gps_menu14[playerid], 255);
	TextDrawFont( gps_menu14[playerid], 1);
	TextDrawLetterSize( gps_menu14[playerid], 0.360000, 1.699998);
	TextDrawColor( gps_menu14[playerid], -1);
	TextDrawSetOutline( gps_menu14[playerid], 0);
	TextDrawSetProportional( gps_menu14[playerid], 1);
	TextDrawSetShadow( gps_menu14[playerid], 1);
	TextDrawUseBox( gps_menu14[playerid], 1);
	TextDrawBoxColor( gps_menu14[playerid], 0);
	TextDrawTextSize( gps_menu14[playerid], 15.000000, 93.000000);
}
