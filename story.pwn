/*
	Viskas prasidëjo:  Monday, August 13, 2012 9:29 AM
*/

#include <soc_includes>
#include <Vectoral>

new zBag[MAX_PLAYERS];

new npchp[10];
new aimat[MAX_PLAYERS] = {-1, ...};

new pticks[MAX_PLAYERS];
native WP_Hash(buffer[], len, const str[]);

main()
{
	print(sprintf("\n\n\n\n\n\n\n\n\n\n\n\n\t\t---:: Story of %s: Pradþia | by %s\n\n\n\n\n\n\n\n\n\n\n\n", "Cities", "Yiin"));
}

public OnGameModeInit()
{
	SetGameModeText("story");

	mysql_debug( true );
	mysql_connect( MySQL_HOST,MySQL_USER,MySQL_DATA,MySQL_PASS );
	if( mysql_ping( ) >= 1 )    print( " ---:: MySQL" );
	else   						SendRconCommand( "exit" );
	
	AddPlayerClass(17, 0, 0,0,3,0,0,0,0,0,0);

	DisableInteriorEnterExits();
	UsePlayerPedAnims();
	EnableStuntBonusForAll(0);
	ShowPlayerMarkers(2);
	ShowNameTags(1);
	EnableTirePopping(1);

	print( " ---:: Vektoriai" );
	area_pd[0] = cvector();
	area_pd[1] = cvector();

    print( " ---:: Textdrawai" );
	// TextDrawai
	TextDrawai();
	
	print( " ---:: GPS" );
	
	// G P S
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		for(new gx; gx < MAX_DOTS; gx++)
			Routes[i][gx]=-1;
		pGPS[i][gps_finish] = -1;
	}
	
	print(" ---:: Daiktai" );
	
	// Daiktai / Inventorius a.k.a kuprinë
	for(new i = 0; i < MAX_PLAYERS; i++)
		zBag[i] = cvector();
	
	print( " ---:: Pickup'ai" );

	// Pickup'ai 2894
	CreateDynamicPickup(19132, 23,210.5, -220, 0.7); // pickup_carshop
	CreateDynamicPickup(1275, 23,94.3851,-160.0283,1.9045); // pickup_mech_darbas

    print( " ---:: Taimeriai" );

	// Taimeriai
	SetTimer("dmg_txtdraw", 5000, true);
	SetTimer("CheckPaused",2500,true);
	SetTimer("check_cars", 5000, true);
	SetTimer("spd", 300, true);

 	print( " ---:: Maðinos" );

 	// Maðinos (cars)
	Iter_Init(masinos);
	// Maðinø turgus (cars shop)
	c11 = random(6)+32; c12 = random(6)+32;
	c21 = random(6)+32; c22 = random(6)+32;
	c31 = random(6)+32; c32 = random(6)+32;
	c41 = random(6)+32; c42 = random(6)+32;
	c51 = random(6)+32; c52 = random(6)+32;
	c61 = random(6)+32; c62 = random(6)+32;
	c71 = random(6)+32; c72 = random(6)+32;
	c81 = random(6)+32; c82 = random(6)+32;

	oldwood_car[0] = CreateVehicle(475,196.5234,-245.7334,1.4120,270,c11,c12, 1000);	/* CAR|Sabre */ 	c[oldwood_car[0]][0] = c11;  	c[oldwood_car[0]][1] = c12;
	oldwood_car[1] = CreateVehicle(410,196.5234,-240.7334,1.4120,270,c21,c22, 1000);	/* CAR|Manana */    c[oldwood_car[1]][0] = c21;   c[oldwood_car[1]][1] = c22;
	oldwood_car[2] = CreateVehicle(412,196.5234,-235.7334,1.4120,270,c31,c32, 1000);	/* CAR|Voodoo */    c[oldwood_car[2]][0] = c31;   c[oldwood_car[2]][1] = c32;
	oldwood_car[3] = CreateVehicle(419,196.5234,-230.7334,1.4120,270,c41,c42, 1000);	/* CAR|Esperanto */ c[oldwood_car[3]][0] = c41;   c[oldwood_car[3]][1] = c42;
	oldwood_car[7] = CreateVehicle(542,217.4459,-230.4855,1.4120,90,c81,c82, 1000);	/* CAR|Clover */    c[oldwood_car[7]][0] = c81;   c[oldwood_car[7]][1] = c82;
	oldwood_car[6] = CreateVehicle(462,217.4459,-235.4855,1.4120,90,c71,c72, 1000);	/* MOTO|Faggio */   c[oldwood_car[6]][0] = c71;   c[oldwood_car[6]][1] = c72;
	oldwood_car[5] = CreateVehicle(549,217.4459,-240.4855,1.4120,90,c61,c62, 1000);	/* CAR|Tampa */     c[oldwood_car[5]][0] = c61;   c[oldwood_car[5]][1] = c62;
	oldwood_car[4] = CreateVehicle(492,217.4459,-245.4855,1.4120,90,c51,c52, 1000);	/* CAR|Greenwood */ c[oldwood_car[4]][0] = c51;   c[oldwood_car[4]][1] = c52;

	for(new i = 0; i < 8; i++)
	{
	    new Float:owx,Float:owy,Float:owz, Float:owr;
		GetXYInFrontOfVehicle(oldwood_car[i], owx, owy, owz, owr, 1);
		oldwood_carname[i] = CreateDynamicObject(2661, owx,owy,owz,0,0,owr);
		SetDynamicObjectMaterialText(oldwood_carname[i],0,IntToStr(i), OBJECT_MATERIAL_SIZE_256x128,"Impact",72,1,0xFFFFFFFF,0,OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
		AttachDynamicObjectToVehicle(oldwood_carname[i],oldwood_car[i],0,1.5,0.65,0,0,180);
		car[i][spyna] = true;
	}
	// Maðinos dël vaizdo

	// Darbinës maðinos
	// Mechanikø
	Iter_Add(masinos[0],CreateVehicle(525, 116.8165, -176.5995, 1.2597, -90.0000, -1, -1, 1000));
	Iter_Add(masinos[0],CreateVehicle(525, 116.8165, -192.6064, 1.2597, -90.0000, -1, -1, 1000));
	Iter_Add(masinos[0],CreateVehicle(525, 116.8165, -188.6503, 1.2597, -90.0000, -1, -1, 1000));
	Iter_Add(masinos[0],CreateVehicle(525, 116.8165, -184.7008, 1.2597, -90.0000, -1, -1, 1000));
	Iter_Add(masinos[0],CreateVehicle(525, 116.8165, -180.6522, 1.2597, -90.0000, -1, -1, 1000));
	Iter_Add(masinos[0],CreateVehicle(525, 116.8165, -172.6153, 1.2597, -90.0000, -1, -1, 1000));
	Iter_Add(masinos[0],CreateVehicle(525, 116.8165, -164.6331, 1.2597, -90.0000, -1, -1, 1000));
	Iter_Add(masinos[0],CreateVehicle(525, 116.8165, -168.6593, 1.2597, -90.0000, -1, -1, 1000));
	// PD
	Iter_Add(masinos[1],CreateVehicle(422, 627.9104, -549.3063, 16.2386, 90.0000, -1, -1, 1000));
	Iter_Add(masinos[1],CreateVehicle(422, 627.9104, -545.3784, 16.2386, 90.0000, -1, -1, 1000));
	Iter_Add(masinos[1],CreateVehicle(422, 627.9104, -561.2737, 16.2386, 90.0000, -1, -1, 1000));
	Iter_Add(masinos[1],CreateVehicle(422, 627.9104, -553.2798, 16.2386, 90.0000, -1, -1, 1000));
	Iter_Add(masinos[1],CreateVehicle(422, 627.9104, -557.4053, 16.2386, 90.0000, -1, -1, 1000));
	// Medikø
	Iter_Add(masinos[2],CreateVehicle(416, 1231.0508, 300.6068, 19.6615, 66.0000, -1, -1, 1000));
	Iter_Add(masinos[2],CreateVehicle(416, 1226.6160, 290.5382, 19.6615, 66.0000, -1, -1, 1000));
	Iter_Add(masinos[2],CreateVehicle(416, 1227.9360, 293.7022, 19.6615, 66.0000, -1, -1, 1000));
	Iter_Add(masinos[2],CreateVehicle(416, 1229.5253, 297.2028, 19.6615, 66.0000, -1, -1, 1000));
	// Taxi
	Iter_Add(masinos[3],CreateVehicle(438, 2248.1609, -59.8348, 26.1785, 0.0000, -1, -1, 1000));
	Iter_Add(masinos[3],CreateVehicle(438, 2260.3298, -47.5976, 26.1785, 90.0000, -1, -1, 1000));
	Iter_Add(masinos[3],CreateVehicle(438, 2251.9185, -59.8348, 26.1785, 0.0000, -1, -1, 1000));
	Iter_Add(masinos[3],CreateVehicle(438, 2256.2302, -59.8348, 26.1785, 0.0000, -1, -1, 1000));
	Iter_Add(masinos[3],CreateVehicle(438, 2260.3298, -55.5637, 26.1785, 90.0000, -1, -1, 1000));
	Iter_Add(masinos[3],CreateVehicle(438, 2260.3298, -51.5628, 26.1785, 90.0000, -1, -1, 1000));
	Iter_Add(masinos[3],CreateVehicle(438, 2237.4985, -59.5941, 26.1785, -90.0000, -1, -1, 1000));
	Iter_Add(masinos[3],CreateVehicle(438, 2257.0354, -43.3233, 26.1785, 180.0000, -1, -1, 1000));
	Iter_Add(masinos[3],CreateVehicle(438, 2253.3311, -43.3233, 26.1785, 180.0000, -1, -1, 1000));
	Iter_Add(masinos[3],CreateVehicle(438, 2249.3752, -43.3233, 26.1785, 180.0000, -1, -1, 1000));
	Iter_Add(masinos[3],CreateVehicle(438, 2245.2964, -43.3233, 26.1785, 180.0000, -1, -1, 1000));
	Iter_Add(masinos[3],CreateVehicle(438, 2241.1843, -43.3233, 26.1785, 180.0000, -1, -1, 1000));
	Iter_Add(masinos[3],CreateVehicle(438, 2237.4985, -47.5900, 26.1785, -90.0000, -1, -1, 1000));
	Iter_Add(masinos[3],CreateVehicle(438, 2237.4985, -51.6277, 26.1785, -90.0000, -1, -1, 1000));
	Iter_Add(masinos[3],CreateVehicle(438, 2237.4985, -55.6945, 26.1785, -90.0000, -1, -1, 1000));
	// Gaisrinë
	Iter_Add(masinos[4],CreateVehicle(544, 790.1470, -609.3479, 16.6156, 180.0000, -1, -1, 1000));
	Iter_Add(masinos[4],CreateVehicle(544, 830.0048, -609.3479, 16.6156, 180.0000, -1, -1, 1000));
	Iter_Add(masinos[4],CreateVehicle(544, 825.0118, -609.3479, 16.6156, 180.0000, -1, -1, 1000));
	Iter_Add(masinos[4],CreateVehicle(544, 820.0944, -609.3479, 16.6156, 180.0000, -1, -1, 1000));
	Iter_Add(masinos[4],CreateVehicle(544, 797.5569, -609.3479, 16.6156, 180.0000, -1, -1, 1000));

	for(new j = 0; j < 5; j++)
		foreach(new i : masinos[j])
		{
			car[i][spyna] = true;
			car[i][degalai] = random(10)+20;
			car[i][rida] = 0;
		}
    print( " ---:: Vietos (Areas)" );

	// Vietos (Areas)
	foreach(new j : masinos[1])
	{
	    new Float:xx,Float:yy,Float:zz, tmp;
	    GetVehiclePos(j,xx,yy,zz);
	    tmp = CreateDynamicSphere(xx,yy,zz,20);
		cvector_push_back(area_pd[0], tmp);
		cvector_push_back(area_pd[1], j);
		AttachDynamicAreaToVehicle(tmp, j);
	}
	area[mech_tune] = CreateDynamicRectangle(96.3-4,-174.8-4, 96.3+4, -174.8+4, 0);
	area[mech_repair] = CreateDynamicRectangle(96.3-4,-191.5-4, 96.3+4, -191.5+4, 0);
    
	// Objektai
	Objektai();
	kma_vartai = CreateDynamicObject(971, 160.18, -178.59, 1.94,   0.00, 180.00, 0.00);
    printf( " ---:: Dinaminiai objektai(%i)", CountDynamicObjects() );
    for(new i = 0; i < 5; i++)
    	printf("masinos[%i] = %i", i, Iter_Count(masinos[i]));
    print( " ---:: story pakrautas" );
	return 1;
}

public OnGameModeExit()
{
    foreach (new i : Player)
	{
	    SavePlayer(i);
	}
	mysql_close( );
	return 1;
}

new bool: at_class[MAX_PLAYERS];
public OnPlayerRequestClass(pid, classid)
{
	if( IsPlayerNPC(pid) ) return 1;
	
	if( zinfo[loggedin] ) {
	    notification(pid, "Prasome prisijungti is naujo.");
	    Kick(pid);
	    return 1;
	}
	
	if( at_class p ) return 1;
	//TextDraw'ai
	pTextDrawai(pid);
 	BagTalpa p = CreatePlayerProgressBar(pid,205.00, 362.00, 237.50, 1.50, 2004318207, 30000.0);
 	bar_zvejyba p = CreatePlayerProgressBar(pid,264.00, 414.00, 100.50, 1.50, -979146241, 100.0);
	meniu(pid);

	wiper(pid);
	SendClientMessage(pid, COLOR_SERVER, "{FFFFFF}Prisijungei prie {ff3600}Story of Cities{FFFFFF}. Smagiai praleisk laika!");

	new
		Float: camerapos[][6] = {
	{448.5773,-498.8351,69.9491,	569.1663,-422.6969,28.0138},
	{956.8905,-104.0216,29.2097,	804.0623,-173.3506,22.7567},
	{2061.3721,10.9882,46.3747,		2144.3799,148.5721,-6.5045}
	};  new rand = random(3);

	SetPlayerWeather(pid, 30);

	SetPlayerCameraPos(pid, camerapos[rand][0], camerapos[rand][1], camerapos[rand][2]);
	SetPlayerPos(pid,camerapos[rand][0], camerapos[rand][1], camerapos[rand][2]-2);
	SetPlayerCameraLookAt(pid, camerapos[rand][3],camerapos[rand][4],camerapos[rand][5]);
	Streamer_Update(pid);

	TextDrawShowForPlayer(pid, Init0);
	TextDrawShowForPlayer(pid, Init1);
	TextDrawShowForPlayer(pid, Init2);
	TextDrawShowForPlayer(pid, Init3);
	TextDrawShowForPlayer(pid, Init4);

	at_class p = true;
	
	soc(pid, "init");
    
	return 1;
}

//--------------------------------------------------

public OnPlayerConnect(pid)
{
	if( IsPlayerNPC(pid) ) return 1;
	
	wiper(pid);
	SendClientMessage(pid, 0xffffffff, "{ffffff}Prisijungei prie {ff3600}Story of Cities{ffffff}. Smagiai praleisk laika!");
	
 	zinfo[loggedin] = false;
	zinfo[from_reg] = false;
	zinfo[from_login] = false;
	zinfo[ac] = false;
	zinfo[afk] = false;
	at_class p = false;
	BagUse p[pageid] = 0;
	for(new i = 0; i < 13; i++)
        BagUse p[bagedit:i] = -1;
	afkc p = 0;
	trylog p = 0;
	TogglePlayerClock(pid, 0);

    DisablePlayerOPIDC(pid);
    for(new gx=0; gx < MAX_DOTS; gx++) Routes p[gx]=-1;
    pGPS p[gps_finish] = -1;
    pGPS p[gps_selected] = -1;
    DestroyRoutes(pid);

	warning_car p = 0;

	SetPlayerVirtualWorld(pid, random(500)+65536);

	return 1;
}

//--------------------------------------------------

public OnPlayerDisconnect(pid, reason)
{
    if( IsPlayerNPC(pid) ) return 1;
    
	if( zinfo[loggedin] )
	{
	    if( reason == 2 ) pinfo[kb]++;
	    
	    pGPS p[gps_finish] = -1;
	    pGPS p[gps_selected] = -1;
	    DestroyRoutes(pid);

		SavePlayer(pid);

		warning_car p = 0;
	}
	destroy_textdraws(pid);
	zinfo[ac] = false;
	zinfo[loggedin] = false;
	at_class p = false;
	return 1;
}

//--------------------------------------------------

public OnPlayerSpawn(pid)
{
    if( IsPlayerNPC(pid) )
	{
	    npc_temp = pid;
		SetPlayerSkin(pid,44);
		new Float:x, Float:y, Float:z;
		GetPlayerPos(0, x,y,z);
		SetPlayerPos(pid, x+random(5),y+random(5),z);
		npchp p = 100;
		print("npc spawninosi");
		return 1;
	}
    
    if( ! zinfo[loggedin] ) Kick(pid);
    
    if( zinfo[from_login] || zinfo[from_reg] )
    {
        if( zinfo[from_login] )
        {
        	SetPlayerMoney(pid, Bag p[pinigai]);
			SetPlayerScore(pid, pinfo[patirtis]);
 			SetPlayerSkin(pid, pinfo[skin_last]);
		 	SetPlayerInterior(pid, pinfo[interior]);
		    SetPlayerVirtualWorld(pid, pinfo[virtualworld]);
		}
        zinfo[from_login] = false;
        zinfo[from_reg] = false;
        return 1;
	}

    oldwood_selected p = 1;
    
	SetPlayerSkin(pid, pinfo[skin_last]);

	SetPlayerPos(pid, 683.1002,-479.3609,16.3359);
	SetPlayerArmour(pid, 100);

	SetPlayerWeather(pid, 6);

	inv_w p = 0;

	return 1;
}
new logocolor[MAX_PLAYERS],
	timer_logo_unfade[MAX_PLAYERS],
	timer_logo_fade[MAX_PLAYERS];
	
PUBLIC: logo_fade(pid)
{
    logocolor p -= 5;
	PlayerTextDrawColor(pid, logo p, logocolor p);
	PlayerTextDrawShow(pid, logo p);
	if( logocolor p <= -256)
	{
		KillTimer(timer_logo_fade p);
		PlayerTextDrawHide(pid,logo p);
	}
}
PUBLIC: logo_unfade(pid)
{
    logocolor p += 5;
	PlayerTextDrawColor(pid, logo p, logocolor p);
	PlayerTextDrawShow(pid, logo p);
	if( logocolor p >= -1) KillTimer(timer_logo_unfade p);
}
stock logo_appear(pid)
{
	logocolor p = -256;
	timer_logo_unfade p = SetTimerEx("logo_unfade", 40, 1, "i", pid);
}
stock logo_disappear(pid)
{
    logocolor p = -1;
	timer_logo_fade p = SetTimerEx("logo_fade", 40, 1, "i", pid);
}

//--------------------------------------------------

public OnPlayerGiveDamage(pid, damagedid, Float:amount, weaponid)
{
	return 1;
}


//--------------------------------------------------

public OnPlayerClickMap(pid, Float:fX, Float:fY, Float:fZ)
{
    if( tickcheck2(pid)) return 1;
    if( !IsItemInBag(pid, gps)) return 1;
    new Float:x, Float:y, Float:z;
    GetPlayerPos(pid, x,y,z);
	EnablePlayerOPIDC(pid);

	pGPS p[gps_start] = NearestNodeFromPoint(x,y,z);
	pGPS p[gps_finish] = NearestNodeFromPoint(fX, fY, fZ);
	GetNodePos(pGPS p[gps_finish], x,y,z);

	CalculatePath(pGPS p[gps_start],pGPS p[gps_finish],pid+100);
    SetPlayerCheckpoint(pid, x,y,z,3);
	return 1;
}

//--------------------------------------------------

PUBLIC: OnPlayerPause(pid)
{
	textlabel p[text_afk] = Create3DTextLabel("Miega", COLOR_BLUE, 0,0,0,30,0);
	Attach3DTextLabelToPlayer(textlabel p[text_afk], pid, 0,0,-1);
	if( !IsPlayerInAnyVehicle(pid))
 		ApplyAnimation(pid,"CRACK","crckidle2",10.0,1,0,0,1,60000,1);
	else
	    freeze(pid);
	return 1;
}

CMD:lol(pid)
{
	TogglePlayerSpectating(pid, 1);
	TogglePlayerSpectating(pid, 0);
	SetCameraBehindPlayer(pid);
	return 1;
}

CMD:weather(pid, params[])
{
    SetPlayerWeather(pid, strval(params));
	return 1;
}

CMD:gauja(pid)
{
	SetPlayerPos(pid, 873.16, -38.72, 63.39);
	return 1;
}

CMD:pause(pid, params[])
{
    ApplyAnimation(pid,"CRACK","crckidle2",10.0,1,0,0,1,60000,1);
    return 1;
}

CMD:pause2(pid, params[])
{
    ApplyAnimation(pid,"CRACK","crckidle2",1.0,0,0,0,1,0,1);
	return 1;
}

CMD:unpause(pid, params[])
{
	ClearAnimations(pid);
	return 1;
}

//--------------------------------------------------

PUBLIC: OnPlayerUnpause(pid)
{
	Delete3DTextLabel(textlabel p[text_afk]);
	if( !IsPlayerInAnyVehicle(pid))
		ClearAnimations(pid, 1);
	else
	    unfreeze(pid);
	return notification(pid, "Pabudai");
}

//--------------------------------------------------

public OnPlayerDeath(pid, killerid, reason)
{
	pinfo[skin_last] = GetPlayerSkin(pid);
	return 1;
}

//--------------------------------------------------

public OnVehicleDeath(vehicleid, killerid)
{
    car[vehicleid][spyna] = true;
	return 1;
}

//--------------------------------------------------

public OnPlayerText(pid, text[])
{
    if( tickcheck(pid)) return 0;
	return 1;
}

//--------------------------------------------------

public OnPlayerEnterVehicle(pid, vehicleid, ispassenger)
{
    if( tickcheck(pid)) return 0;
    printf("vehicleid = %i", vehicleid);
	if( pinfo[carid] == vehicleid)
	{
	    if(  zinfo[new_car] )
	    {
		    new i;
		    for(i = 0; i < 8; i++)
				if( vehicleid == oldwood_car[i])
				{
					oldwood_car[i] = -1;
					break;
				}
			printf("i = %i", i);
			timer_car_buy p = SetTimerEx("car_buy_timer", 1000, 1, "i", pid);
			car[vehicleid][degalai] = 20;
			car[vehicleid][spyna] = false;
			notification(pid, "atrakinai masina");

			zinfo[new_car] = false;
			mDB p[spalva1] = c[vehicleid][0];
	    	mDB p[spalva2] = c[vehicleid][1];

	    	SetDynamicObjectMaterialText(oldwood_carname[i],0,"SoC", OBJECT_MATERIAL_SIZE_256x128,"Impact",48,1,0,0,OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
		} else if(  car[vehicleid][spyna] ) {
		    car[vehicleid][spyna] = false;
			notification(pid, "atrakinai masina");
		}
		return 1;
	}
	
	for(new i = 0; i < 5; i++)
		foreach (new veh : masinos[i])
	        if( vehicleid == veh)
	            if( car[veh][spyna])
				{
					car[veh][spyna] = false;
					return notification(pid, "atrakinai masina");
				}
				else return 1;

	return 1;
}
//--------------------------------------------------

public OnPlayerExitVehicle(pid, vehicleid)
{
    if( tickcheck(pid)) return 0;
	return 1;
}

//--------------------------------------------------

public OnPlayerStateChange(pid, newstate, oldstate)
{
    if( tickcheck(pid)) return 1;
/*	if( newstate == PLAYER_STATE_DRIVER)
	{
	    if( !IsPlayerOnBicycle(pid))
	    {
		    new string[16], vehid = GetPlayerVehicleID(pid);
		    if( car[vehid][spyna])
		    {
		        notification(pid, "prasome prisijungti is naujo");
		        Kick(pid);
		        return 1;
		    }
			PlayerTextDrawShow(pid, spd1 p);
			PlayerTextDrawShow(pid, spd2 p);
			PlayerTextDrawShow(pid, spd3 p);
			PlayerTextDrawShow(pid, spd4 p);
			PlayerTextDrawShow(pid, spd5 p);
			PlayerTextDrawShow(pid, spd6 p);
			PlayerTextDrawShow(pid, spd7 p);
			PlayerTextDrawShow(pid, spd8 p);
			PlayerTextDrawShow(pid, spd9 p);
			PlayerTextDrawShow(pid, spd10 p);
			format(string, 16, "%s", GetVehicleName(vehid));
			PlayerTextDrawSetString(pid,spd10 p, string);
			if( car[vehid][variklis] == false)
			{
			    new bool: e[7];
			    GetVehicleParamsEx(vehid, e[6], e[0], e[1], e[2], e[3], e[4], e[5]);
			    SetVehicleParamsEx(vehid, false, e[0], e[1], e[2], e[3], e[4], e[5]);
			}
			TogglePlayerDynamicArea(pid, area[mech_tune], 1);
			TogglePlayerDynamicArea(pid, area[mech_repair], 1);
			
		    return 1;
	    }
	}
	
	if( newstate == PLAYER_STATE_PASSENGER)
	    return 1;
	    
	if( oldstate == PLAYER_STATE_DRIVER)
	{
	    PlayerTextDrawHide(pid, spd1 p);
		PlayerTextDrawHide(pid, spd2 p);
		PlayerTextDrawHide(pid, spd3 p);
		PlayerTextDrawHide(pid, spd4 p);
		PlayerTextDrawHide(pid, spd5 p);
		PlayerTextDrawHide(pid, spd6 p);
		PlayerTextDrawHide(pid, spd7 p);
		PlayerTextDrawHide(pid, spd8 p);
		PlayerTextDrawHide(pid, spd9 p);
		PlayerTextDrawHide(pid, spd10 p);
		PlayerTextDrawHide(pid, bar_engine p);
		TextDrawHideForPlayer(pid, bar_engine0);
		TextDrawHideForPlayer(pid, bar_engine1);
		TogglePlayerDynamicArea(pid, area[mech_tune], 0);
		TogglePlayerDynamicArea(pid, area[mech_repair], 0);
		KillTimer(timer_engine p);
	    return 1;
	}
	if( oldstate == PLAYER_STATE_PASSENGER && newstate == PLAYER_STATE_ONFOOT)
	{
	    return 1;
	}
	if( (oldstate == PLAYER_STATE_DRIVER && newstate == PLAYER_STATE_PASSENGER) || (oldstate == PLAYER_STATE_PASSENGER && newstate == PLAYER_STATE_DRIVER))
	{
	    notification(pid, "WTF??");
	    Kick(pid);
	    return 1;
	}*/
	return 1;
}

//--------------------------------------------------

public OnPlayerEnterCheckpoint(pid)
{
    if( pGPS p[gps_finish] > 0)
	{
        gps_atvyko(pid);
        return notification(pid, "Tiksla pasiekei sekmingai!");
	}
	DisablePlayerCheckpoint(pid);
	return 1;
}
stock gps_atvyko(pid)
{
	pGPS p[gps_finish] = -1;
	DestroyRoutes(pid);
    DisablePlayerCheckpoint(pid);
    DisablePlayerOPIDC(pid);
}
//--------------------------------------------------

public OnPlayerLeaveCheckpoint(pid)
{
	return 1;
}

//--------------------------------------------------

public OnPlayerEnterRaceCheckpoint(pid)
{
	return 1;
}

//--------------------------------------------------

public OnPlayerLeaveRaceCheckpoint(pid)
{
	return 1;
}

//--------------------------------------------------

public OnRconCommand(cmd[])
{
	return 1;
}

//--------------------------------------------------

public OnPlayerRequestSpawn(pid)
{
	if( IsPlayerNPC(pid)) return 1;
	if( !zinfo[ac]) return 0;
	return 1;
}

//--------------------------------------------------

public OnObjectMoved(objectid)
{
	return 1;
}

//--------------------------------------------------

public OnPlayerObjectMoved(pid, objectid)
{
	return 1;
}

//--------------------------------------------------

public OnPlayerPickUpDynamicPickup(pid, pickupid)
{
	switch(pickupid)
	{
		case pickup_carshop:
		{
		    menu_selected p = MENU_CARSHOP_OLD;
		    zinfo[in_carshop] = true;
		    SetPlayerPos(pid,207.5, -220, 0.7);
			freeze(pid);
			SetPlayerCameraPos(pid, 203.5217,-243.0611,1.9603);
			SetPlayerCameraLookAt(pid, 196.5234,-245.7334,0.4920, CAMERA_MOVE);
			oldwood_selected p = 1;
			
			// Maðinø pavadinimai/objektai
			

			// Textdrawai
			PlayerTextDrawShow(pid, oldWood_greitis p);
			PlayerTextDrawShow(pid, oldWood_kuras p);
			PlayerTextDrawShow(pid, oldWood_kaina p);
			TextDrawShowForPlayer(pid, oldWood);
			TextDrawShowForPlayer(pid, oldWood_atgal);
			TextDrawShowForPlayer(pid, oldWood_pirmyn);
			TextDrawShowForPlayer(pid, oldWood_iseiti);
			TextDrawShowForPlayer(pid, oldWood_pirkti);
			TextDrawShowForPlayer(pid, oldWood_info);

			PlayerTextDrawSetString(pid, oldWood_greitis p, oldwoodcars[0][oWgreitis]);
			PlayerTextDrawSetString(pid, oldWood_kuras p, oldwoodcars[0][oWkuras]);
			PlayerTextDrawSetString(pid, oldWood_kaina p, strfloat(oldwoodcars[0][oWkaina]));

			SelectTextDraw(pid, COLOR_SELECT);

			return 1;
		}
		case pickup_mech_darbas:
		{
			if( pinfo[darbas] == 0)
			{
		 		pinfo[darbas] = 1;
		   		pinfo[skin_darbo] = 50;
		   		SetPlayerSkin(pid, 50);
		   		return notification(pid, "Tu priimtas i darba!");
	   		}
	   		if( pinfo[darbas] == MECHANIKAS)
			{
			    pinfo[darbas] = 0;
		   		SetPlayerSkin(pid, pinfo[skin]);
		   		return notification(pid, "Tu isejai is darbo..");
			}
			else
			    return notification(pid, "esi isidarbines kitur");
		}
	}

	return 1;
}



//--------------------------------------------------

public OnPlayerClickPlayerTextDraw(pid, PlayerText:playertextid)
{
    if( tickcheck(pid)) return 1;
	if( menu_selected p == MENU_BAG)
	{
	    for(new i = 12; i < 61; i+=4)
		{
		    if( playertextid == iBag p[i])
		    {
		        if( BagUse p[lastitem] != PlayerText:-1)
		        {
			        if( Used p[BagUse p[item]]  )
						PlayerTextDrawColor( pid, BagUse p[lastitem], COLOR_OK);
			        else
						PlayerTextDrawColor( pid, BagUse p[lastitem], -1);
	                PlayerTextDrawShow(pid, BagUse p[lastitem]);
	                BagUse p[item] = -1;
	                if( BagUse p[lastitem] == iBag p[i] && BagUse p[selecteditem] == iBag p[i])
					{
	                    BagUse p[selecteditem] = PlayerText:-1;
	                    BagUse p[lastitem] = PlayerText:-1;
						return 1;
					}
				}
		        BagUse p[lastitem] = PlayerText:iBag p[i];
		        BagUse p[item] = BagUse p[bagedit:((i-12)/4)];
		        if( Used p[BagUse p[item]])
		            PlayerTextDrawSetString(pid, iBag p[5], "padeti");
				else
				    PlayerTextDrawSetString(pid, iBag p[5], "naudoti");
		        PlayerTextDrawShow(pid, iBag p[5]);
	        	notification(pid, ItemName[BagUse p[item]]);
		        PlayerTextDrawColor( pid, iBag p[i], COLOR_SELECT);
                PlayerTextDrawShow(pid, iBag p[i]);
                BagUse p[selecteditem] = PlayerText:iBag p[i];
		        return 1;
			}
		}
        if( playertextid == iBag p[4])
        {
            hide_bag(pid);
            PlayerTextDrawColor( pid, BagUse p[lastitem], -1);
            BagUse p[selecteditem] = PlayerText:-1;
            BagUse p[lastitem] = PlayerText:-1;
			BagUse p[item] = -1;
            CancelSelectTextDraw(pid);
            return 1;
		}
		if( playertextid == iBag p[5])
		{
		    if( BagUse p[item] == -1) return 1;
		    if( ! Used p[BagUse p[item]] )
				switch(BagUse p[item])
				{
				    case meskere:   {   if( IsPlayerHaveAnyWeapon(pid)) return notification(pid, "ginklai ir meskere vienu metu rankose netelpa");
										SetPlayerAttachedObject(pid, MAX_PLAYER_ATTACHED_OBJECTS-1, 18632, 6,0,0,0,180);
										Used p[meskere] = true;
							   		}
					case raktai_mech_car: 	foreach(new veh : masinos[0])
						                        if( IsPlayerInRangeOfVehicle(pid,veh,6))
												    if( !car[veh][spyna])
												    {
												        car[veh][spyna] = true;
												        notification(pid, "Uzrakinai masina");
												        foreach(new i : Player)
															if( !Bag[i][raktai_mech_car]) SetVehicleParamsForPlayer(veh, i, 0, 1);
															else SetVehicleParamsForPlayer(veh, i, 0, 0);
												    }
                    case raktai_pd_car: 	foreach(new veh : masinos[1])
						                        if( IsPlayerInRangeOfVehicle(pid,veh,6))
												    if( !car[veh][spyna])
												    {
												        car[veh][spyna] = true;
												        notification(pid, "Uzrakinai masina");
												        foreach(new i : Player)
															if( !Bag[i][raktai_pd_car]) SetVehicleParamsForPlayer(veh, i, 0, 1);
															else SetVehicleParamsForPlayer(veh, i, 0, 0);
												    }
                    case raktai_med_car: 	foreach(new veh : masinos[2])
						                        if( IsPlayerInRangeOfVehicle(pid,veh,6))
												    if( !car[veh][spyna])
												    {
												        car[veh][spyna] = true;
												        notification(pid, "Uzrakinai masina");
												        foreach(new i : Player)
															if( !Bag[i][raktai_med_car]) SetVehicleParamsForPlayer(veh, i, 0, 1);
															else SetVehicleParamsForPlayer(veh, i, 0, 0);
												    }
                    case raktai_taxi_car: 	foreach(new veh : masinos[3])
						                        if( IsPlayerInRangeOfVehicle(pid,veh,6))
												    if( !car[veh][spyna])
												    {
												        car[veh][spyna] = true;
												        notification(pid, "Uzrakinai masina");
												        foreach(new i : Player)
															if( !Bag[i][raktai_taxi_car]) SetVehicleParamsForPlayer(veh, i, 0, 1);
															else SetVehicleParamsForPlayer(veh, i, 0, 0);
												    }
                    case raktai_fire_car: 	foreach(new veh : masinos[4])
						                        if( IsPlayerInRangeOfVehicle(pid,veh,6))
												    if( !car[veh][spyna])
												    {
												        car[veh][spyna] = true;
												        notification(pid, "Uzrakinai masina");
												        foreach(new i : Player)
															if( !Bag[i][raktai_fire_car]) SetVehicleParamsForPlayer(veh, i, 0, 1);
															else SetVehicleParamsForPlayer(veh, i, 0, 0);
												    }
				    case gps:       { hide_bag(pid); show_menu(pid); menu_gps(pid); return 1; }
        			// Pistoletai
				    case ninemm: 	if( Bag p[kulkosp] != 0)
				                    {
				                        if( Used p[meskere])
				                        {
				                            StopPlayerHoldingObject(pid);
											Used p[meskere] = false;
				                        }
										GivePlayerWeapon(pid, 22, Bag p[kulkosp]);
					                    Used p[BagUse p[item]] = true;
					                    Used p[tazeris] = false;
					                    Used p[deagle] = false;
									}
									else notification(pid, "Nera kulku..");
					case tazeris:   if( Bag p[kulkosp] != 0)
				                    {
				                        if( Used p[meskere])
				                        {
				                            StopPlayerHoldingObject(pid);
											Used p[meskere] = false;
				                        }
										GivePlayerWeapon(pid, 23, Bag p[kulkosp]),
						                Used p[BagUse p[item]] = true;
					                    Used p[ninemm] = false;
					                    Used p[deagle] = false;
									}
									else notification(pid, "Nera kulku..");
                    case deagle:    if( Bag p[kulkosp] != 0)
				                    {
				                        if( Used p[meskere])
				                        {
				                            StopPlayerHoldingObject(pid);
											Used p[meskere] = false;
				                        }
										GivePlayerWeapon(pid, 24, Bag p[kulkosp]);
						                Used p[BagUse p[item]] = true;
					                    Used p[tazeris] = false;
					                    Used p[ninemm] = false;
									}
									else notification(pid, "Nera kulku..");
					// Shotgun'ai
					case shotgun:   if( Bag p[kulkoss] != 0)
				                    {
				                        if( Used p[meskere])
				                        {
				                            StopPlayerHoldingObject(pid);
											Used p[meskere] = false;
				                        }
										GivePlayerWeapon(pid, 25, Bag p[kulkoss]),
						                Used p[BagUse p[item]] = true;
					                    Used p[sawnoff] = false;
					                    Used p[combat] = false;
									}
									else notification(pid, "Nera kulku..");
                    case sawnoff:   if( Bag p[kulkoss] != 0)
				                    {
				                        if( Used p[meskere])
				                        {
				                            StopPlayerHoldingObject(pid);
											Used p[meskere] = false;
				                        }
										GivePlayerWeapon(pid, 26, Bag p[kulkoss]),
						                Used p[BagUse p[item]] = true;
					                    Used p[shotgun] = false;
					                    Used p[combat] = false;
									}
									else notification(pid, "Nera kulku..");
                    case combat:    if( Bag p[kulkoss] != 0)
				                    {
				                        if( Used p[meskere])
				                        {
				                            StopPlayerHoldingObject(pid);
											Used p[meskere] = false;
				                        }
										GivePlayerWeapon(pid, 27, Bag p[kulkoss]),
						                Used p[BagUse p[item]] = true;
					                    Used p[shotgun] = false;
					                    Used p[sawnoff] = false;
									}
									else notification(pid, "Nera kulku..");
					// SMG's
					case tec:   	if( Bag p[kulkossm] != 0)
				                    {
				                        if( Used p[meskere])
				                        {
				                            StopPlayerHoldingObject(pid);
											Used p[meskere] = false;
				                        }
										GivePlayerWeapon(pid, 32, Bag p[kulkossm]),
						                Used p[BagUse p[item]] = true;
					                    Used p[uzi] = false;
					                    Used p[mp5] = false;
									}
									else notification(pid, "Nera kulku..");
                    case uzi:   	if( Bag p[kulkossm] != 0)
				                    {
				                        if( Used p[meskere])
				                        {
				                            StopPlayerHoldingObject(pid);
											Used p[meskere] = false;
				                        }
										GivePlayerWeapon(pid, 28, Bag p[kulkossm]),
						                Used p[BagUse p[item]] = true;
					                    Used p[tec] = false;
					                    Used p[mp5] = false;
									}
									else notification(pid, "Nera kulku..");
                    case mp5:   	if( Bag p[kulkossm] != 0)
				                    {
				                        if( Used p[meskere])
				                        {
				                            StopPlayerHoldingObject(pid);
											Used p[meskere] = false;
				                        }
										GivePlayerWeapon(pid, 29, Bag p[kulkossm]),
						                Used p[BagUse p[item]] = true;
					                    Used p[tec] = false;
					                    Used p[uzi] = false;
									}
									else notification(pid, "Nera kulku..");
					// Rifle's
					case m4:		if( Bag p[kulkosr] != 0)
				                    {
				                        if( Used p[meskere])
				                        {
				                            StopPlayerHoldingObject(pid);
											Used p[meskere] = false;
				                        }
										GivePlayerWeapon(pid, 31, Bag p[kulkosr]),
						                Used p[BagUse p[item]] = true;
					                    Used p[ak] = false;
									}
									else notification(pid, "Nera kulku..");
                    case ak:   		if( Bag p[kulkosr] != 0)
				                    {
				                        if( Used p[meskere])
				                        {
				                            StopPlayerHoldingObject(pid);
											Used p[meskere] = false;
				                        }
										GivePlayerWeapon(pid, 30, Bag p[kulkosr]),
						                Used p[BagUse p[item]] = true;
					                    Used p[m4] = false;
									}
									else notification(pid, "Nera kulku..");
					// AWP + SShotgun
					case rifle:   	if( Bag p[kulkosa] != 0)
				                    {
				                        if( Used p[meskere])
				                        {
				                            StopPlayerHoldingObject(pid);
											Used p[meskere] = false;
				                        }
										GivePlayerWeapon(pid, 33, Bag p[kulkosa]),
						                Used p[BagUse p[item]] = true;
					                    Used p[awp] = false;
									}
									else notification(pid, "Nera kulku..");
                    case awp:   	if( Bag p[kulkosa] != 0)
				                    {
				                        if( Used p[meskere])
				                        {
				                            StopPlayerHoldingObject(pid);
											Used p[meskere] = false;
				                        }
										GivePlayerWeapon(pid, 34, Bag p[kulkosa]),
						                Used p[BagUse p[item]] = true;
					                    Used p[rifle] = false;
									}
									else notification(pid, "Nera kulku..");
					// BAD GUNS
					case flamegun:  if( Bag p[kulkosb] != 0)
				                    {
				                        if( Used p[meskere])
				                        {
				                            StopPlayerHoldingObject(pid);
											Used p[meskere] = false;
				                        }
										GivePlayerWeapon(pid, 37, Bag p[kulkosb]),
						                Used p[BagUse p[item]] = true;
					                    Used p[minigun] = false;
					                    Used p[rocket] = false;
					                    Used p[trocket] = false;
									}
									else notification(pid, "Nera kulku..");
                    case minigun:   if( Bag p[kulkosb] != 0)
				                    {
				                        if( Used p[meskere])
				                        {
				                            StopPlayerHoldingObject(pid);
											Used p[meskere] = false;
				                        }
										GivePlayerWeapon(pid, 38, Bag p[kulkosb]),
						                Used p[BagUse p[item]] = true;
					                    Used p[flamegun] = false;
					                    Used p[rocket] = false;
					                    Used p[trocket] = false;
									}
									else notification(pid, "Nera kulku..");
                    case rocket:   	if( Bag p[kulkosb] != 0)
				                    {
				                        if( Used p[meskere])
				                        {
				                            StopPlayerHoldingObject(pid);
											Used p[meskere] = false;
				                        }
										GivePlayerWeapon(pid, 35, Bag p[kulkosb]),
						                Used p[BagUse p[item]] = true;
					                    Used p[flamegun] = false;
					                    Used p[minigun] = false;
					                    Used p[trocket] = false;
									}
									else notification(pid, "Nera kulku..");
         			case trocket:	if( Bag p[kulkosb] != 0)
				                    {
				                        if( Used p[meskere])
				                        {
				                            StopPlayerHoldingObject(pid);
											Used p[meskere] = false;
				                        }
										GivePlayerWeapon(pid, 36, Bag p[kulkosb]),
						                Used p[BagUse p[item]] = true;
					                    Used p[flamegun] = false;
					                    Used p[minigun] = false;
					                    Used p[rocket] = false;
									}
									else notification(pid, "Nera kulku..");
				}
			else
			    switch(BagUse p[item])
				{
				    case meskere:   StopPlayerHoldingObject(pid),
									Used p[meskere] = false;
				    case gps:       gps_atvyko(pid);
				    
				    case ninemm: 	RemovePlayerWeapon(pid, 22),
				                    Used p[BagUse p[item]] = false;
				    case tazeris: 	RemovePlayerWeapon(pid, 23),
				                    Used p[BagUse p[item]] = false;
				    case deagle: 	RemovePlayerWeapon(pid, 24),
				                    Used p[BagUse p[item]] = false;

				    case tec:		RemovePlayerWeapon(pid, 25),
				                    Used p[BagUse p[item]] = false;
				    case uzi:	 	RemovePlayerWeapon(pid, 26),
				                    Used p[BagUse p[item]] = false;
				    case mp5:	 	RemovePlayerWeapon(pid, 27),
				                    Used p[BagUse p[item]] = false;

				    case shotgun: 	RemovePlayerWeapon(pid, 32),
				                    Used p[BagUse p[item]] = false;
				    case sawnoff: 	RemovePlayerWeapon(pid, 28),
				                    Used p[BagUse p[item]] = false;
				    case combat: 	RemovePlayerWeapon(pid, 29),
				                    Used p[BagUse p[item]] = false;

				    case m4:	 	RemovePlayerWeapon(pid, 31),
				                    Used p[BagUse p[item]] = false;
				    case ak:	 	RemovePlayerWeapon(pid, 30),
				                    Used p[BagUse p[item]] = false;

				    case rifle: 	RemovePlayerWeapon(pid, 33),
				                    Used p[BagUse p[item]] = false;
				    case awp:	 	RemovePlayerWeapon(pid, 34),
				                    Used p[BagUse p[item]] = false;

				    case flamegun: 	RemovePlayerWeapon(pid, 37),
				                    Used p[BagUse p[item]] = false;
				    case minigun: 	RemovePlayerWeapon(pid, 38),
				                    Used p[BagUse p[item]] = false;
				    case rocket: 	RemovePlayerWeapon(pid, 35),
				                    Used p[BagUse p[item]] = false;
				    case trocket: 	RemovePlayerWeapon(pid, 36),
				                    Used p[BagUse p[item]] = false;
				}
			load_bag(pid, 3);
			return 1;
		}
		if( playertextid == iBag p[2])
		{
		    if( BagUse p[item] != -1)
		    {
		        if( GetItemAmount(pid,BagUse p[item]) > 1)
				{
		        	ShowDialog(pid, Show:<drop_item>, DIALOG_STYLE_INPUT, "{ffffff}Kuprinë", "Kiek iðmesti?", "Iðmesti", "Atðaukti");
		        	return 1;
				}
		        RemoveItem(pid,BagUse p[item], -1);
			    if( BagUse p[item] > 23 && BagUse p[item] < 48)
							    RemovePlayerWeapon(pid, BagUse p[item] - 3);
				switch(BagUse p[item])
				{
				    case raktai_mech_car:   foreach(new veh : masinos[0])
				                                if( car[veh][spyna]) SetVehicleParamsForPlayer(veh, pid, 0, 1);
												else SetVehicleParamsForPlayer(veh, pid, 0, 0);
                    case raktai_pd_car:   	foreach(new veh : masinos[1])
				                                if( car[veh][spyna]) SetVehicleParamsForPlayer(veh, pid, 0, 1);
												else SetVehicleParamsForPlayer(veh, pid, 0, 0);
                    case raktai_med_car:   	foreach(new veh : masinos[2])
				                                if( car[veh][spyna]) SetVehicleParamsForPlayer(veh, pid, 0, 1);
												else SetVehicleParamsForPlayer(veh, pid, 0, 0);
                    case raktai_taxi_car:   foreach(new veh : masinos[3])
				                                if( car[veh][spyna]) SetVehicleParamsForPlayer(veh, pid, 0, 1);
												else SetVehicleParamsForPlayer(veh, pid, 0, 0);
                    case raktai_fire_car:   foreach(new veh : masinos[4])
				                                if( car[veh][spyna]) SetVehicleParamsForPlayer(veh, pid, 0, 1);
												else SetVehicleParamsForPlayer(veh, pid, 0, 0);
		/*pinigai*/	case pinigai:   SetPlayerMoney(pid, Bag p[pinigai]);
				    case 62..67:	{
				        new gunas = BagUse p[item] - 60;
						if( Bag p[talpa:gunas] == 0) RemovePlayerWeapon(pid, PlayerWeaponInSlot(pid, gunas));
      						else SetPlayerAmmo(pid, gunas, Bag p[talpa:BagUse p[item]]);
					}
				}
		        PlayerTextDrawColor( pid, BagUse p[selecteditem], -1);
		        PlayerTextDrawColor( pid, BagUse p[lastitem], -1);
		        BagUse p[selecteditem] = PlayerText:-1;
	            BagUse p[lastitem] = PlayerText:-1;
		        load_bag(pid, 3);
		    }
		    else notification(pid, "nieko nepasirinkai");
		    return 1;
		}
		if( playertextid == iBag p[9])
		{
  			if( BagUse p[bagedit:10] == -1)
     			return 1;
            load_bag(pid, 1);
			return 1;
		}
		if( playertextid == iBag p[10])
		{
		    if( BagUse p[pageid] == 0) return 1;
			load_bag(pid, 2);
			return 1;
		}
	    return 1;
	}
	if( menu_selected p == MENU_GPS)
	{
	    // GPS MENIU
	    if( playertextid == menu11 p)
		{
		    hide_menu(pid);
		    
		    CancelSelectTextDraw(pid);
	        return 1;
		}
		if( pGPS p[gps_selected] != -1)
		{
		    if( playertextid == menu8 p)
			{
			    if( pGPS p[gps_selected] == 82)
			    {
			        pGPS p[gps_selected] = 8;
			        PlayerTextDrawSetString(pid, menu2 p, "GPS spalva");
					PlayerTextDrawSetString(pid, menu3 p, " ");
					PlayerTextDrawSetString(pid, menu4 p, " ");
					PlayerTextDrawSetString(pid, menu5 p, " ");
					PlayerTextDrawSetString(pid, menu6 p, " ");
					PlayerTextDrawSetString(pid, menu7 p, " ");
					PlayerTextDrawSetString(pid, menu8 p, "Atgal");
					PlayerTextDrawSetString(pid, menu9 p, " ");
					PlayerTextDrawSetString(pid, menu10 p, " ");
					PlayerTextDrawSetString(pid, menu14 p, " ");
					return 1;
			    }
			    pGPS p[gps_selected] = -1;
		 		hide_menu(pid);
		 		show_menu(pid);
				menu_gps(pid);
				return 1;
			}
		}
	    if( pGPS p[gps_selected] == -1)
	    {
		    if( playertextid == menu2 p) // DARBAI
			{
			    pGPS p[gps_selected] = 2;
				PlayerTextDrawSetString(pid, menu2 p, "Mechanikai");
				PlayerTextDrawSetString(pid, menu3 p, "Policija");
				PlayerTextDrawSetString(pid, menu4 p, "Medikai");
				PlayerTextDrawSetString(pid, menu5 p, "Taxi");
				PlayerTextDrawSetString(pid, menu6 p, "UAB Valytojai");
				PlayerTextDrawSetString(pid, menu7 p, "UAB Statybos");
				PlayerTextDrawSetString(pid, menu8 p, "Atgal");
				PlayerTextDrawSetString(pid, menu9 p, "Gaisrine");
				PlayerTextDrawSetString(pid, menu10 p, " ");
				PlayerTextDrawSetString(pid, menu14 p, "Kita");
				return 1;
			}
			if( playertextid == menu3 p) // PARDUOTUVES
			{
			    pGPS p[gps_selected] = 3;
				PlayerTextDrawSetString(pid, menu2 p, "Senu masinu turgus");
				PlayerTextDrawSetString(pid, menu3 p, "Masinu turgus");
				PlayerTextDrawSetString(pid, menu4 p, "vip masinu salonas");
				PlayerTextDrawSetString(pid, menu5 p, "Prekybos centras");
				PlayerTextDrawSetString(pid, menu6 p, "Ginklu parduotuve");
				PlayerTextDrawSetString(pid, menu7 p, "Dviraciu parduotuve");
				PlayerTextDrawSetString(pid, menu8 p, "Atgal");
				PlayerTextDrawSetString(pid, menu9 p, "Nekilnojamasis turtas");
				PlayerTextDrawSetString(pid, menu10 p, "Garazai");
				PlayerTextDrawSetString(pid, menu14 p, "Kita");
				return 1;
			}
			if( playertextid == menu4 p)
			{
			    pGPS p[gps_selected] = 4;

			    gps_degaline(pid);
			    
			    hide_menu(pid);
			    CancelSelectTextDraw(pid);
			    return 1;
			}
			if( playertextid == menu5 p)
			{
			    gps_ligonine(pid);
			    
			    hide_menu(pid);
			    CancelSelectTextDraw(pid);
			    return 1;
			}
			if( playertextid == menu8 p) // NUSTATYMAI
			{
			    pGPS p[gps_selected] = 8;
				PlayerTextDrawSetString(pid, menu2 p, "GPS spalva");
				PlayerTextDrawSetString(pid, menu3 p, " ");
				PlayerTextDrawSetString(pid, menu4 p, " ");
				PlayerTextDrawSetString(pid, menu5 p, " ");
				PlayerTextDrawSetString(pid, menu6 p, " ");
				PlayerTextDrawSetString(pid, menu7 p, " ");
				PlayerTextDrawSetString(pid, menu8 p, "Atgal");
				PlayerTextDrawSetString(pid, menu9 p, " ");
				PlayerTextDrawSetString(pid, menu10 p, " ");
				PlayerTextDrawSetString(pid, menu14 p, " ");
			    return 1;
			}
			return 1;
		}
		if( pGPS p[gps_selected] == 2)
	    {
			if( playertextid == menu2 p)
			{
			    gps_mechanikai(pid);
			    
			    hide_menu(pid);
			    CancelSelectTextDraw(pid);
		        return 1;
			}
			if( playertextid == menu3 p)
			{
			    gps_policija(pid);
			    
			    hide_menu(pid);
			    CancelSelectTextDraw(pid);
		        return 1;
			}
			if( playertextid == menu4 p)
			{
			    gps_medikai(pid);
			    
			    hide_menu(pid);
			    CancelSelectTextDraw(pid);
		        return 1;
			}
			if( playertextid == menu9 p)
			{
			    gps_gaisrine(pid);
			    
			    hide_menu(pid);
			    CancelSelectTextDraw(pid);
		        return 1;
			}
		}
		if( pGPS p[gps_selected] == 3)
	    {
			if( playertextid == menu2 p)
			{
			    gps_carturgus(pid);
			    
			    hide_menu(pid);
			    CancelSelectTextDraw(pid);
		        return 1;
			}
			if( playertextid == menu5 p)
			{
			    gps_parduotuve(pid);
			    
			    hide_menu(pid);
			    CancelSelectTextDraw(pid);
		        return 1;
			}
			return 1;
		}
		if( pGPS p[gps_selected] == 8)
	    {
	        if( playertextid == menu2 p)
			{
			    pGPS p[gps_selected] = 82;
			    PlayerTextDrawSetString(pid, menu2 p, "Raudona");
				PlayerTextDrawSetString(pid, menu3 p, "Melyna");
				PlayerTextDrawSetString(pid, menu4 p, "Zalia");
				PlayerTextDrawSetString(pid, menu5 p, "Geltona");
				PlayerTextDrawSetString(pid, menu6 p, "Purpurine");
				PlayerTextDrawSetString(pid, menu7 p, "Morkine");
				PlayerTextDrawSetString(pid, menu8 p, "Atgal");
				PlayerTextDrawSetString(pid, menu9 p, "Zydra");
				PlayerTextDrawSetString(pid, menu10 p, "Ivesti RGB");
				PlayerTextDrawSetString(pid, menu14 p, "Violetine");
			    return 1;
			}
	        return 1;
	    }
	    if( pGPS p[gps_selected] == 82)
	    {
	        if( playertextid == menu2 p)
			    pGPS p[gps_color] = RGBAToHex(255, 0, 0, 255);
            if( playertextid == menu3 p)
			    pGPS p[gps_color] = RGBAToHex(0, 0, 255, 255);
            if( playertextid == menu4 p)
			    pGPS p[gps_color] = RGBAToHex(0, 255, 0, 255);
            if( playertextid == menu5 p)
			    pGPS p[gps_color] = RGBAToHex(255, 255, 0, 255);
            if( playertextid == menu6 p)
			    pGPS p[gps_color] = RGBAToHex(255, 178, 234, 255);
            if( playertextid == menu7 p)
			    pGPS p[gps_color] = RGBAToHex(255, 100, 0, 255);
            if( playertextid == menu9 p)
			    pGPS p[gps_color] = RGBAToHex(42, 167, 255, 255);
            if( playertextid == menu10 p)
			{
                ShowDialog(pid, Show:<gps_rgb_red>,DIALOG_STYLE_INPUT,"GPS Spalvos kodas", "{FFFFFF}RGB spalvø kodus gali rasti internete.\nJá sudaro 9 skaièiai. Po tris kiekvienai spalvai.\nÁvesk pirmus 3 skaièius (RRR XXXXXX) {FF0000}raudonai{FFFFFF} spalvai. (0-255)", "Ávesti", "Atgal");
				return 1;
			}
			if( playertextid == menu14 p)
			    pGPS p[gps_color] = RGBAToHex(196, 0, 196, 255);

   			pGPS p[gps_selected] = 8;
			PlayerTextDrawSetString(pid, menu2 p, "GPS spalva");
			PlayerTextDrawSetString(pid, menu3 p, " ");
			PlayerTextDrawSetString(pid, menu4 p, " ");
			PlayerTextDrawSetString(pid, menu5 p, " ");
			PlayerTextDrawSetString(pid, menu6 p, " ");
			PlayerTextDrawSetString(pid, menu7 p, " ");
			PlayerTextDrawSetString(pid, menu8 p, "Atgal");
			PlayerTextDrawSetString(pid, menu9 p, " ");
			PlayerTextDrawSetString(pid, menu10 p, " ");
			PlayerTextDrawSetString(pid, menu14 p, " ");
			return 1;
		}
	}
	if( menu_selected p == MENU_PMENU)
	{
	    if( playertextid == menu11 p)
		{
		    
		    hide_menu(pid);
			CancelSelectTextDraw(pid);
	        return 1;
		}
		if( playertextid == menu2 p)
		{
		    if( (IsPlayerInCircle(pid,64.1340,-229.7443, 10) ||
				IsPlayerInCircle(pid, 2237.4167,27.6812,10) ||
				IsPlayerInCircle(pid, 656.0121,-564.694,10)) && IsPlayerDriver(pid) && ! zinfo[pila_degalus] )
			{
			    
				hide_menu(pid);
				CancelSelectTextDraw(pid);
				pcd p = GetPlayerVehicleID(pid);
				degaline(pid);
				timer_degaline[pcd p] = SetTimerEx("degaline_use", 1200, true, "i", pid);
		    	zinfo[pila_degalus] = true;
				return 1;
			}
		}

	    if( playertextid == menu5 p) // Kuprinë / BAG / INVENTORIUS
	    {
	        hide_menu(pid);
			CancelSelectTextDraw(pid);
	        new string[124];
			strdel(string0, 0, 2050);
			strcat(string0, "{FFFF00}Pavadinimas\t\t\tKiekis\tSvoris\tKaina\n__________________________________________\n");
			if( IsBagEmpty(pid))
			{
			    format(string, 124, "{00FF00}Tuðèia\t\t\t\t{FFFFFF}-\t-\t-\n");
				strcat(string0, string);
			}
			else for(new i = 0; talpa:i != talpa; i++)
			{
			    if( GetItemAmount(pid, i) == 0) continue;
				format(string, 124, "{00FF00}%s\t{FFFFFF}%i\t%i\t%i\n", ItemName[i], GetItemAmount(pid, i), GetPlayerItemsWeight(pid, i), GetPlayerItemsValue(pid, i));
				strcat(string0, string);
			}
			ShowDialog(pid, Show:<kuprine>, 0, "Kuprinë", string0, "Tvarkyti", "Uþdaryti");
	        return 1;
	    }
	    return 1;
	}

	
	if( playertextid == Intro10 p)
	{
		CancelSelectTextDraw(pid);
		hide_intro(pid);
		unfreeze(pid);
	    spawn_from_reg(pid);
	    return 1;
	}
	if( playertextid == Intro13 p)
	{
	    CancelSelectTextDraw(pid);
		hide_intro(pid);
		unfreeze(pid);
		intro(pid);
		return 1;
	}
	return 1;
}


//--------------------------------------------------

public OnPlayerClickTextDraw(pid, Text:clickedid)
{
    if( tickcheck(pid)) return 1;
	// oldWood
	if( menu_selected p == MENU_CARSHOP_OLD)
	{
	    notification(pid, IntToStr(oldwood_selected p));
	    if( clickedid == oldWood_pirmyn)
		    oldwood_LoadNext(pid);
		    
		if( clickedid == oldWood_atgal)
		    oldwood_LoadPrev(pid);
		    
		if( clickedid == oldWood_iseiti) // NEPIRKTI
		    oldwood_Nepirkti(pid);

		if( clickedid == oldWood_pirkti) // PIRKTI
		    oldwood_Pirkti(pid);
		return 1;
	}
	// APIE
    if( clickedid == apie2)
	{
		hide_apie(pid);

		CancelSelectTextDraw(pid);

        strdel(string0, 0, 2050);
	    strcat(string0, "{FFAE00}_____________________________________Serveris_____________________________________\n{96FF00}");
		strcat(string0, "{89B0FF}ðá serverá kuriame toká, kokiame ir patys norëtumëme þaisti. Visa informacija,\nvisas þaidimo stilius yra perteikti kaip galima kokybiðkiau ir paprasèiau.\n");
		strcat(string0, "Þaidimo esmë paprasta. Jûs patys kuriate miestø istorijà, kaupiate kultûros\ntaðkus, uþ kuriuos miesto valdþia stato naujus pastatus, tobulina esamus. \n");
		strcat(string0, "Pajamø ðaltinis yra ne vienas, taèiau efektyviausias, þinoma, yra darbas.\nDarbà galima suvokti labai skirtingai. Ið esmës pelningiausia yra kurti savo ámonæ,\n");
		strcat(string0, "ádarbinti darbuotojus, ir pardavinëti savo paslaugas. Taèiau á savo verslà\ntenka labai daug investuoti, ir laiko ir pinigø, todël prieð imantis kaþko didelio, teks\n");
		strcat(string0, "ir paèiam to pasiekti. Galite dirbti, galite uþsiiminëti nelegalia\nveikla, galite save kelti á kandidatus miesto valdþioje, galite bendradarbiauti su kitais\n");
	 	strcat(string0, "miestais kurdami bendrus projektus, kuriems prireiks bendrø pastangø tam pasiekti.\nGalite bûti pamaldus tikintysis arba keletà miestø valdanèios mafijos krikðtatëvis\n");
	 	strcat(string0, "viskas tik jûsø rankose. Jeigu turite ádomiø ádëjø, mielai kvieèiame jomis pasidalinti.\nÞaidimà siekiame padaryti kuo malonesná, tad istorijà kurkite su atsakomybe :)");
		ShowDialog(pid, Show:<apie>, DIALOG_STYLE_MSGBOX, "{FFA031}Story of Cities", string0, "Gryþti", "Uþdaryti");
		return 1;
	}
	if( clickedid == apie3)
	{
		hide_apie(pid);

		CancelSelectTextDraw(pid);

        strdel(string0, 0, 2050);
	    strcat(string0, "{FFAE00}_____________________________________D.U.K_____________________________________\n{96FF00}");
		strcat(string0, "{89B0FF}Prie daugiausiai uþduodamø klausimø ir raðysime daugiausiai uþduodamus \nklausimus, o ne klausimus, kurie kaip kitiems atrodo 'Turëtø bûti daugiausiai uþduodami'.\n\n");
		strcat(string0, "{89B0FF}Klausimas: kà reiðkia tas tl;dr po registracijos iððokusiame lange?\n{80FF2B}Atsakymas: Angliðkas trumpinys sakinio 'Too Long; Didnt Read', kuris reiðkia 'Per ilgas, neskaièiau'.\n\n");
		strcat(string0, "{89B0FF}Klausimas: ar galiu prisidëti prie projekto, labai graþiai mapinu ir gerai scriptinu.\n{80FF2B}Atsakymas: Kol kas mums per akis uþtenka 3 þmoniø, jeigu mums jûsø prireiks, susirasime patys ;)\n\n");
		strcat(string0, "{89B0FF}Klausimas: kur man rasti kur kas randasi, nei minimape iconø yra, nei /gps neveikia.\n{80FF2B}Atsakymas: Minimape yra viena icona - spawn'as. Jame yra þemëlapis, paspausk prie jo ENTER.\n\n");
		strcat(string0, "{89B0FF}Klausimas: kodël negaliu iðvaþiuoti ið miesteliø teritorijos?\n{80FF2B}Atsakymas: Nes pagal visà ádëjà tu randiesi vidurá laukø, kur viskà kuri pats, o 3 didmiesèiai ðalia, visai nesiderntø.\n");
	 	strcat(string0, "Reikia LV garaþø, o gal atsibodo tie patys miesteliai? Kaupkit miestui kultûros taðkus, \nmokëkit mokesèius, o tada praðykit valdþios. Ir jà rinkit atsakingai, nes nuo jos daug kas priklauso.\n\n");
	 	strcat(string0, "{89B0FF}Klausimas: kaip nusipirkti adminà, noriu bûti adminas, uþbaninsiu visus èyterius!\n{80FF2B}Atsakymas: Ið esmës dël to ir nëra admino. Pakolkas anti èytas gan neblogai susitvarko ir vienas.");
		ShowDialog(pid, Show:<apie>, DIALOG_STYLE_MSGBOX, "{FFA031}Story of Cities", string0, "Gryþti", "Uþdaryti");
		return 1;
	}
	if( clickedid == apie4)
	{
		hide_apie(pid);

		CancelSelectTextDraw(pid);

        strdel(string0, 0, 2050);
	    strcat(string0, "{FFAE00}_____________________________________Komandos_____________________________________\n{96FF00}");
		strcat(string0, "{89B0FF}/fix - sutvarko þinomus bugus.\n");
		strcat(string0, "/apie - Visa þaidimo pagrindinë informacija (kaip jau turbût pastebëjai)\n\
						 /mech - Mechanikø vidus\n\
						 /pause\n/unpause\n/spawn - nekelia á spawnà\n/zvejoti");
		strcat(string0, "/carturgus - nukelia á senø maðinø turgø.\n/carturgusv - Nuteleportuoja á maðinø turgaus interjerà (a little bug will appear).\n");
		strcat(string0, "/car - spawnina Elegy & Infernus \n/clearcar - Panaikina asmeninæ maðinà.\n/money suma - Pinigai. Pvz.: /money 123456");
		ShowDialog(pid, Show:<apie>, DIALOG_STYLE_MSGBOX, "{FFA031}Story of Cities", string0, "Gryþti", "Uþdaryti");
		return 1;
	}
	if( clickedid == apie5)
	{
		hide_apie(pid);

		CancelSelectTextDraw(pid);

        strdel(string0, 0, 2050);
	    strcat(string0, "{FFAE00}_____________________________________Pasiekimai_____________________________________\n{96FF00}");
		strcat(string0, "{89B0FF}ðá serverá kuriame toká, kokiame ir patys norëtumëme þaisti. Visa informacija,\nvisas þaidimo stilius yra perteikti kaip galima kokybiðkiau ir paprasèiau.\n");
		strcat(string0, "Þaidimo esmë paprasta. Jûs patys kuriate miestø istorijà, kaupiate kultûros\ntaðkus, uþ kuriuos miesto valdþia stato naujus pastatus, tobulina esamus. \n");
		strcat(string0, "Pajamø ðaltinis yra ne vienas, taèiau efektyviausias, þinoma, yra darbas.\nDarbà galima suvokti labai skirtingai. Ið esmës pelningiausia yra kurti savo ámonæ,\n");
		strcat(string0, "ádarbinti darbuotojus, ir pardavinëti savo paslaugas. Taèiau á savo verslà\ntenka labai daug investuoti, ir laiko ir pinigø, todël prieð imantis kaþko didelio, teks\n");
		strcat(string0, "ir paèiam pasiekti toká lygá. Galite dirbti, galite uþsiiminëti nelegalia\nveikla, galite save kelti á kandidatus á miesto valdþià, galite bendradarbiauti su kitais\n");
	 	strcat(string0, "miestais kurdami bendrus projektus, kuriems prireiks bendrø pastangø tam pasiekti.\nGalite bûti pamaldus tikintysis arba keletà miestø valdanèios mafijos krikðtatëvis\n");
	 	strcat(string0, "viskas tik jûsø rankose. Jeigu turite ádomiø ádëjø, mielai kvieèiame jomis pasidalinti.\nÞaidimà siekiame padaryti kuo malonesná, tad istorijà kurkite su atsakomybe :)");
		ShowDialog(pid, Show:<apie>, DIALOG_STYLE_MSGBOX, "{FFA031}Story of Cities", string0, "Gryþti", "Uþdaryti");
		return 1;
	}
	if( clickedid == apie6)
	{
		hide_apie(pid);

		CancelSelectTextDraw(pid);

        strdel(string0, 0, 2050);
	    strcat(string0, "{FFAE00}_____________________________________V.I.P._____________________________________\n{96FF00}");
		strcat(string0, "{89B0FF}Mes nesiekiame padaryti þaidimo stiliaus panaðaus á Pay To Win, todël\nvip'ams suteikiame tik asmeniðkai þaidëjui naudingas paslaugas, neátakojant kitø\n");
		strcat(string0, "þaidëjø þaidimo. Bûdamas vip'u priklausomai nuo vip lygio gauni puikiø privalumø!\n\n");
		strcat(string0, "vip I:   30% maþesnës kainos, 2xp/min, `vip I` maðinos, draugø sàraðas praplëstas \niki 20 draugø, vip nicko spalva.\n\n");
		strcat(string0, "vip II:  30% maþesnës kainos, 3xp/min, `vip I` ir `vip II` maðinos, vip namai, \nvip skin'ai, draugø sàraðas praplëstas iki 30 draugø, vip nicko spalva.\n\n");
		strcat(string0, "vip III: 30% maþesnës kainos, 5xp/min, `vip I` ir `vip II` ir `vip III` maðinos, \nvip namai, vip skin'ai, draugø sàraðas praplëstas iki 50 draugø, \nvisø ginklø þala 50% didesnë, galimybë raðyti á Global chat'à, vip nicko spalva.\n\n");
	 	strcat(string0, "\nKainos:\nvip I:   2lt/savaitei. 6lt/mën.\nvip II:  4lt/savaitei. 12lt/mën.\nvip III: 8lt/savaitei. 24lt/mën.\n");
		ShowDialog(pid, Show:<apie>, DIALOG_STYLE_MSGBOX, "{FFA031}Story of Cities", string0, "Gryþti", "Uþdaryti");
		return 1;
	}
	if( clickedid == apie7)
	{
		hide_apie(pid);

		CancelSelectTextDraw(pid);

        strdel(string0, 0, 2050);
	    strcat(string0, "{FFAE00}_____________________________________Mygtukai_____________________________________\n{96FF00}");
		strcat(string0, "{89B0FF}Pagrindinis mygtukas - SPACE. Su juo pilate kurà, atidarinëjat vartus, \nbendraujat su npc, naudojates objektais ir daug ko kito.\n");
		strcat(string0, "E - Maðinos uþvedimas, uþgesinimas. \nQ - Iðplëstinis maðinos valdymas.\nN - Nustatymai.\nY - Visa kita.");
		ShowDialog(pid, Show:<apie>, DIALOG_STYLE_MSGBOX, "{FFA031}Story of Cities", string0, "Gryþti", "Uþdaryti");
		return 1;
	}
	if( clickedid == apie8)
	{
		hide_apie(pid);

		CancelSelectTextDraw(pid);

        strdel(string0, 0, 2050);
	    strcat(string0, "{FFAE00}_______________________________Naujienos________________________________\n{96FF00}");
		strcat(string0, "{89B0FF}ðá serverá kuriame toká, kokiame ir patys norëtumëme þaisti. Visa informacija,\nvisas þaidimo stilius yra perteikti kaip galima kokybiðkiau ir paprasèiau.\n");
		strcat(string0, "Þaidimo esmë paprasta. Jûs patys kuriate miestø istorijà, kaupiate kultûros\ntaðkus, uþ kuriuos miesto valdþia stato naujus pastatus, tobulina esamus. \n");
		strcat(string0, "Pajamø ðaltinis yra ne vienas, taèiau efektyviausias, þinoma, yra darbas.\nDarbà galima suvokti labai skirtingai. Ið esmës pelningiausia yra kurti savo ámonæ,\n");
		strcat(string0, "ádarbinti darbuotojus, ir pardavinëti savo paslaugas. Taèiau á savo verslà\ntenka labai daug investuoti, ir laiko ir pinigø, todël prieð imantis kaþko didelio, teks\n");
		strcat(string0, "ir paèiam pasiekti toká lygá. Galite dirbti, galite uþsiiminëti nelegalia\nveikla, galite save kelti á kandidatus á miesto valdþià, galite bendradarbiauti su kitais\n");
	 	strcat(string0, "miestais kurdami bendrus projektus, kuriems prireiks bendrø pastangø tam pasiekti.\nGalite bûti pamaldus tikintysis arba keletà miestø valdanèios mafijos krikðtatëvis\n");
	 	strcat(string0, "viskas tik jûsø rankose. Jeigu turite ádomiø ádëjø, mielai kvieèiame jomis pasidalinti.\nÞaidimà siekiame padaryti kuo malonesná, tad istorijà kurkite su atsakomybe :)");
		ShowDialog(pid, Show:<apie>, DIALOG_STYLE_MSGBOX, "{FFA031}Story of Cities", string0, "Gryþti", "Uþdaryti");
		return 1;
	}
	if( clickedid == apie9)
	{
		hide_apie(pid);

		CancelSelectTextDraw(pid);

        strdel(string0, 0, 2050);
	    strcat(string0, "{FFAE00}_____________________________________TOP_____________________________________\n{96FF00}");
		strcat(string0, "{89B0FF}ðá serverá kuriame toká, kokiame ir patys norëtumëme þaisti. Visa informacija,\nvisas þaidimo stilius yra perteikti kaip galima kokybiðkiau ir paprasèiau.\n");
		strcat(string0, "Þaidimo esmë paprasta. Jûs patys kuriate miestø istorijà, kaupiate kultûros\ntaðkus, uþ kuriuos miesto valdþia stato naujus pastatus, tobulina esamus. \n");
		strcat(string0, "Pajamø ðaltinis yra ne vienas, taèiau efektyviausias, þinoma, yra darbas.\nDarbà galima suvokti labai skirtingai. Ið esmës pelningiausia yra kurti savo ámonæ,\n");
		strcat(string0, "ádarbinti darbuotojus, ir pardavinëti savo paslaugas. Taèiau á savo verslà\ntenka labai daug investuoti, ir laiko ir pinigø, todël prieð imantis kaþko didelio, teks\n");
		strcat(string0, "ir paèiam pasiekti toká lygá. Galite dirbti, galite uþsiiminëti nelegalia\nveikla, galite save kelti á kandidatus á miesto valdþià, galite bendradarbiauti su kitais\n");
	 	strcat(string0, "miestais kurdami bendrus projektus, kuriems prireiks bendrø pastangø tam pasiekti.\nGalite bûti pamaldus tikintysis arba keletà miestø valdanèios mafijos krikðtatëvis\n");
	 	strcat(string0, "viskas tik jûsø rankose. Jeigu turite ádomiø ádëjø, mielai kvieèiame jomis pasidalinti.\nÞaidimà siekiame padaryti kuo malonesná, tad istorijà kurkite su atsakomybe :)");
		ShowDialog(pid, Show:<apie>, DIALOG_STYLE_MSGBOX, "{FFA031}Story of Cities", string0, "Gryþti", "Uþdaryti");
		return 1;
	}
	if( clickedid == apie10)
	{
		hide_apie(pid);

		CancelSelectTextDraw(pid);

        strdel(string0, 0, 2050);
	    strcat(string0, "{FFAE00}_____________________________________Teksto spalvos_____________________________________\n{96FF00}");
		strcat(string0, "{89B0FF}ðá serverá kuriame toká, kokiame ir patys norëtumëme þaisti. Visa informacija,\nvisas þaidimo stilius yra perteikti kaip galima kokybiðkiau ir paprasèiau.\n");
		strcat(string0, "Þaidimo esmë paprasta. Jûs patys kuriate miestø istorijà, kaupiate kultûros\ntaðkus, uþ kuriuos miesto valdþia stato naujus pastatus, tobulina esamus. \n");
		strcat(string0, "Pajamø ðaltinis yra ne vienas, taèiau efektyviausias, þinoma, yra darbas.\nDarbà galima suvokti labai skirtingai. Ið esmës pelningiausia yra kurti savo ámonæ,\n");
		strcat(string0, "ádarbinti darbuotojus, ir pardavinëti savo paslaugas. Taèiau á savo verslà\ntenka labai daug investuoti, ir laiko ir pinigø, todël prieð imantis kaþko didelio, teks\n");
		strcat(string0, "ir paèiam pasiekti toká lygá. Galite dirbti, galite uþsiiminëti nelegalia\nveikla, galite save kelti á kandidatus á miesto valdþià, galite bendradarbiauti su kitais\n");
	 	strcat(string0, "miestais kurdami bendrus projektus, kuriems prireiks bendrø pastangø tam pasiekti.\nGalite bûti pamaldus tikintysis arba keletà miestø valdanèios mafijos krikðtatëvis\n");
	 	strcat(string0, "viskas tik jûsø rankose. Jeigu turite ádomiø ádëjø, mielai kvieèiame jomis pasidalinti.\nÞaidimà siekiame padaryti kuo malonesná, tad istorijà kurkite su atsakomybe :)");
		ShowDialog(pid, Show:<apie>, DIALOG_STYLE_MSGBOX, "{FFA031}Story of Cities", string0, "Gryþti", "Uþdaryti");
		return 1;
	}
	if( clickedid == apie11)
	{
		hide_apie(pid);

		CancelSelectTextDraw(pid);

		return 1;
	}
	return 1;
}

//--------------------------------------------------

public OnUnoccupiedVehicleUpdate(vehicleid, pid, passenger_seat)
{
	return 1;
}

//--------------------------------------------------

public OnVehicleMod(pid, vehicleid, componentid)
{
	return 1;
}

//--------------------------------------------------

public OnVehiclePaintjob(pid, vehicleid, paintjobid)
{
	return 1;
}

//--------------------------------------------------

public OnVehicleRespray(pid, vehicleid, color1, color2)
{
	return 1;
}

//--------------------------------------------------

public OnPlayerSelectedMenuRow(pid, row)
{
	return 1;
}

//--------------------------------------------------

public OnPlayerExitedMenu(pid)
{
	return 1;
}

//--------------------------------------------------

public OnPlayerInteriorChange(pid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerEnterDynamicArea(pid, areaid)
{
    if(cvector_find(area_pd[0], areaid)) KillTimer(timer_areapd p), timer_areapd p = SetTimerEx("AreaPD", 777, 1, "ii", pid, areaid);
    if( areaid == area[mech_repair]) show_area(pid, AreaName[0]);
	else if( areaid == area[mech_tune]) show_area(pid, AreaName[1]);
	
	return 1;
}

forward AreaPD(pid, areaid);
public AreaPD(pid, areaid)
{
	if(IsPlayerInAnyVehicle(pid))
	{
		new vehid = cvector_get(area_pd[1], cvector_find(area_pd[0], areaid));
		new pvehid = GetPlayerVehicleID(pid);
		new Float:xx,Float:yy,Float:zz;
		if(GetVehicleDriver(vehid) != INVALID_PLAYER_ID)
		{
		    GetVehicleVelocity(pvehid, xx,yy,zz);
		    SetVehicleVelocity(pvehid, xx*0.9,yy*0.9,zz*0.9);
		}
	}
}

stock GetVehicleDriver(vehid)
{
        foreach(new i : Player)
        {
                if(IsPlayerInVehicle(i, vehid))
                {
                        if(GetPlayerState(i) == PLAYER_STATE_DRIVER)
                        return i;
                 }
        }
        return INVALID_PLAYER_ID;
}

public OnPlayerLeaveDynamicArea(pid, areaid)
{
	if(cvector_find(area_pd[0], areaid)) KillTimer(timer_areapd p);
	hide_area(pid);
	return 1;
}

stock show_area(pid, areaname[])
{
	PlayerTextDrawSetString(pid, pArea p, areaname);
	PlayerTextDrawShow(pid, pArea p);
}

stock hide_area(pid)
{
	PlayerTextDrawHide(pid, pArea p);
}

//--------------------------------------------------

public OnPlayerKeyStateChange(pid, newkeys, oldkeys)
{
    if( RELEASED(KEY_NO))
	{
	    SelectTextDraw(pid, COLOR_SELECT);
		return 1;
	}
    if( RELEASED(KEY_ACTION))
    {
        if( tickcheck2(pid)) return 1;
		if( GetVehicleModel(GetPlayerVehicleID(pid)) == 525)
		{
			new veh = GetPlayerVehicleID(pid),
				closestveh = GetClosestVehicleEx(pid, veh),
			Float: vx[2],Float: vy[2],Float: vz[2],Float: va[2];
			GetXYInRearOfVehicle(veh, vx[0], vy[0], vz[0], va[0], 4);
			SetPlayerCheckpoint(pid,vx[0], vy[0], vz[0],1);
			GetXYInFrontOfVehicle(closestveh, vx[1], vy[1], vz[1], va[1], 4);
            if( IsTrailerAttachedToVehicle(veh))
            	DetachTrailerFromVehicle(veh);
			if( floatabs(GetDistanceBetweenPoints(vx[0],vy[0],vz[0], vx[1],vy[1],vz[1])) < 5 && !IsTrailerAttachedToVehicle(veh))
			    AttachTrailerToVehicle(closestveh, veh);
			printf("floatabs = %f || veh = %i || closestveh = %i", floatabs(GetDistanceBetweenPoints(vx[0],vy[0],vz[0], vx[1],vy[1],vz[1])), veh, closestveh);
			return 1;
		}
		if( IsPlayerInAnyDynamicArea(pid))
		{
			if( IsPlayerInDynamicArea(pid, area[mech_tune]))
			{
				new vehid = GetPlayerVehicleID(pid);
    			SetPlayerVirtualWorld(pid, pid + 1337);
    			SetVehicleVirtualWorld(vehid, pid + 1337);
				SetPlayerPos(pid, 106.47699737549, -144.75399780273, 2365.846923828 + 1);
				Streamer_Update(pid);
				SetVehicleZAngle(vehid,89.9580);
				SetVehiclePos(vehid,104.2621,-149.9144,2367.4868);
				SetPlayerCameraPos(pid, 99.76, -152.38, 2368.99);
				SetPlayerCameraLookAt(pid, 103.52, -149.57, 2367.28);
				return notification(pid, "tu esi arenoje : mech_tune");
			}
		    return 1;
		}
		return 1;
    }
	if( RELEASED(KEY_SPRINT))
	{
	    if( zinfo[zvejoja_kimba])
	    {
			if( pActivities p[fishing_lvl] >= 100)
			{
			    KillTimer(timer_zvejyba p[kimba]);
			    zinfo[zvejoja_kimba] = false;
			    unfreezeEx(pid);
			    HidePlayerProgressBar(pid, bar_zvejyba p);
			    new zuviS = random(15) + 67;
			    AddItem(pid, zuviS, 1);
			    return 1;
			}
	        pActivities p[fishing_lvl] += 5;
			SetPlayerProgressBarValue(pid, bar_zvejyba p, pActivities p[fishing_lvl]);
			ShowPlayerProgressBar(pid, bar_zvejyba p);
	        return 1;
	    }
	    else if( zinfo[zvejoja_idle])
		{
		    KillTimer(timer_zvejyba p[idle]);
		    zinfo[zvejoja_idle] = false;
		    unfreezeEx(pid);
		    notification(pid, "Istraukei vala");
		    return 1;
		}
	    return 1;
	}
	if( HOLDING( KEY_FIRE ))
	{
	    if( aimat p >= 0)
	    {
	        notification(pid, "aimat >= 0");
	        timer_dmgnpc p = SetTimerEx("dmgnpc", 255, 1, "i", pid);
			return 1;
	    }
	}
	    
	if( RELEASED(KEY_FIRE))
	{
	    if( timer_dmgnpc p > 0)
		{
			KillTimer(timer_dmgnpc p);
			timer_dmgnpc p = 0;
			return 1;
		}
        if( pinfo[darbas] == MECHANIKAS)
 		{
			if( IsPlayerInCircle(pid, 160.18, -178.59, 10) && GetPlayerVirtualWorld(pid) == 0 && (GetPlayerWeapon(pid) == 0 || 1))
			{
			    if( !IsItemInBag(pid, raktai_kma))
	 		    {
	 		        notification(pid, "Neturi KMA raktu.");
	 		        return 1;
				}
			    if( !kma_vartai_pos)
			    {
					MoveDynamicObject(kma_vartai, 160.18, -178.59, -5, 2);
					kma_vartai_pos = true;
					notification(pid,  "Vartai atidaromi");
					return 1;
				}
				if( kma_vartai_pos)
				{
				    MoveDynamicObject(kma_vartai, 160.18, -178.59, 1.94, 2);
					kma_vartai_pos = false;
					notification(pid,  "Vartai uzdaromi");
					return 1;
				}
			}
		}

		if( zinfo[pila_degalus]  )
		{
		    new string[64];
		    zinfo[pila_degalus] = false;
		    KillTimer(timer_degaline[pcd p]);
		    pcd p = 0;
		    unfreeze(pid);
		    PlayerTextDrawHide(pid, kuro_kaina2 p);
			PlayerTextDrawHide(pid, kuro_kaina3 p);
			PlayerTextDrawHide(pid, kuro_kaina5 p);
			PlayerTextDrawHide(pid, kuro_kaina6 p);
			PlayerTextDrawHide(pid, kuro_kaina7 p);
			PlayerTextDrawHide(pid, kuro_kaina8 p);
			PlayerTextDrawHide(pid, kuro_kaina9 p);
			PlayerTextDrawHide(pid, kuro_kaina10 p);
			PlayerTextDrawHide(pid, kuro_kaina11 p);
			//format(string, 64, ");
		    notification(pid, sprintf("Baigei pilti degalus. Kaina : ~g~%i", ipilti_kaina p[0]));
		    ipilti_kaina p[0] = 0;
		    ipilti_degalai p[0] = 0;
		    return 1;
		}
		return 1;
	}
	if( RELEASED(KEY_SECONDARY_ATTACK))
	{
	    if( zinfo[pila_degalus]  )
		{
		    new string[64];
		    zinfo[pila_degalus] = false;
		    KillTimer(timer_degaline[pcd p]);
		    pcd p = 0;
		    unfreeze(pid);
		    PlayerTextDrawHide(pid, kuro_kaina2 p);
			PlayerTextDrawHide(pid, kuro_kaina3 p);
			PlayerTextDrawHide(pid, kuro_kaina5 p);
			PlayerTextDrawHide(pid, kuro_kaina6 p);
			PlayerTextDrawHide(pid, kuro_kaina7 p);
			PlayerTextDrawHide(pid, kuro_kaina8 p);
			PlayerTextDrawHide(pid, kuro_kaina9 p);
			PlayerTextDrawHide(pid, kuro_kaina10 p);
			PlayerTextDrawHide(pid, kuro_kaina11 p);
			format(string, 64, "Baigei pilti degalus. Kaina : ~g~%i", ipilti_kaina p[0]);
		    notification(pid, string);
		    ipilti_kaina p[0] = 0;
		    ipilti_degalai p[0] = 0;
		    return 1;
		}
		return 1;
	}
	return 1;
}

PUBLIC:dmgnpc(pid)
{
    new panim = GetPlayerAnimationIndex(pid);
    notification(pid, IntToStr(panim));
	if( panim >= 1160 && panim <= 1167)
	{
	    notification(pid,"lol");
	    npchp[aimat p] -= 5;
		notification(pid, IntToStr(npchp[aimat p]));
		if( npchp[aimat p] <= 0) Kick(aimat p);
	}
	
	return 1;
}

//--------------------------------------------------

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

//--------------------------------------------------

public OnPlayerUpdate(pid)
{
	//SendClientMessage(pid, -1, IntToStr(GetPlayerAnimationIndex(pid)));
    afkc p = 0;
	return 1;
}

//--------------------------------------------------

public OnPlayerStreamIn(pid, forplayerid)
{
	if( zinfo[afk])
		ApplyAnimation(pid,"CRACK","crckidle2",1.0,0,0,0,1,0,1);
	return 1;
}

//--------------------------------------------------

public OnPlayerStreamOut(pid, forplayerid)
{
	return 1;
}

//--------------------------------------------------

public OnVehicleStreamIn(vehicleid, forplayerid)
{
    foreach (new veh : masinos[0])
    {
        if( vehicleid == veh)
        {
			if( car[vehicleid][spyna])
			{
				if( !IsItemInBag(forplayerid, raktai_mech_car))
					SetVehicleParamsForPlayer(vehicleid, forplayerid, 0, 1);
				else
				    SetVehicleParamsForPlayer(vehicleid, forplayerid, 0, 0);
			}
			else
			    SetVehicleParamsForPlayer(vehicleid, forplayerid, 0, 0);
			return 1;
		}
	}
	foreach (new veh : masinos[1])
    {
        if( vehicleid == veh)
        {
			if( car[vehicleid][spyna])
			{
				if( !IsItemInBag(forplayerid, raktai_pd_car))
					SetVehicleParamsForPlayer(vehicleid, forplayerid, 0, 1);
				else
				    SetVehicleParamsForPlayer(vehicleid, forplayerid, 0, 0);
			}
			else
			    SetVehicleParamsForPlayer(vehicleid, forplayerid, 0, 0);
			return 1;
		}
	}
	foreach (new veh : masinos[2])
    {
        if( vehicleid == veh)
        {
			if( car[vehicleid][spyna])
			{
				if( !IsItemInBag(forplayerid, raktai_med_car))
					SetVehicleParamsForPlayer(vehicleid, forplayerid, 0, 1);
				else
				    SetVehicleParamsForPlayer(vehicleid, forplayerid, 0, 0);
			}
			else
			    SetVehicleParamsForPlayer(vehicleid, forplayerid, 0, 0);
			return 1;
		}
	}
	foreach (new veh : masinos[3])
    {
        if( vehicleid == veh)
        {
			if( car[vehicleid][spyna])
			{
				if( !IsItemInBag(forplayerid, raktai_taxi_car))
					SetVehicleParamsForPlayer(vehicleid, forplayerid, 0, 1);
				else
				    SetVehicleParamsForPlayer(vehicleid, forplayerid, 0, 0);
			}
			else
			    SetVehicleParamsForPlayer(vehicleid, forplayerid, 0, 0);
			return 1;
		}
	}
	foreach (new veh : masinos[4])
    {
        if( vehicleid == veh)
        {
			if( car[vehicleid][spyna])
			{
				if( !IsItemInBag(forplayerid, raktai_fire_car))
					SetVehicleParamsForPlayer(vehicleid, forplayerid, 0, 1);
				else
				    SetVehicleParamsForPlayer(vehicleid, forplayerid, 0, 0);
			}
			else
			    SetVehicleParamsForPlayer(vehicleid, forplayerid, 0, 0);
			return 1;
		}
	}
	if( car[vehicleid][spyna])
	    SetVehicleParamsForPlayer(vehicleid, forplayerid, 0, 1);
	return 1;
}

//--------------------------------------------------

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

new counter[MAX_PLAYERS] = {0,...};

public GPS_WhenRouteIsCalculated(routeid,node_id_array[],amount_of_nodes)
{
	if( routeid >= 100 && amount_of_nodes > 1)
	{
		counter[routeid-100]--;
	    DestroyRoutes(routeid-100);
		new Float:lastX,Float:lastY,Float:lastZ;

		GetPlayerPos(routeid-100,lastX,lastY,lastZ);

		new _max;

		if( amount_of_nodes < 50) _max = amount_of_nodes;
		else _max = 50;

		for(new i=0; i < _max; i++)
		{
		    new Float:gX,Float:gY,Float:gZ;
		    GetNodePos(node_id_array[i],gX,gY,gZ);
		    CreateMapRoute(routeid-100,lastX,lastY,gX,gY,pGPS[routeid-100][gps_color]);
		    lastX=gX;
		    lastY=gY;
		}
	}
	return 1;
}
new bool:upgps = true;
public OnPlayerClosestNodeIDChange(pid,old_NodeID,new_NodeID)
{
	if( pGPS p[gps_finish] == -1) return 1;

    if( new_NodeID == pGPS p[gps_finish])
    {
        notification(pid, "Tiksla pasiekei sekmingai!");
        gps_atvyko(pid);
        return 1;
	}
	else if( old_NodeID > 0 && upgps  )
	{
		CalculatePath(new_NodeID,pGPS p[gps_finish],pid+100);
		upgps = false;
		return 1;
	}
	upgps = true;
	return 1;
}

//--------------------------------------------------------------------------------------------------------------------//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//--------------------------------------------------------------------------------------------------------------------//

// Komandos
// soc_
CMD:soc_aim(pid, params[])
{
	new id = strval(params);
	if( id != -1)
	{
 		notification(pid, "taikaisi i bota");
   		aimat p = id;
	}
	else
	    aimat p = -1;
	    
	return 1;
}

CMD:slock(pid, params[])
{
	if(strval(params))
		soc(pid, "lock 1");
	else
	    soc(pid, "lock 0");
	return 1;
}

CMD:cfreeze(pid, params[])
{
    if(strval(params))
		soc(pid, "freeze 1");
	else
	    soc(pid, "freeze 0");
	return 1;
}

CMD:add_bots(pid, params[])
{
	new string[18];
	for(new i = 0; i < strval(params); i++)
	{
		format(string, 18, "bot%i", random(1000) + 1000);
		ConnectNPC(string, "npcidle");
	}
	return 1;
}

// Darbø komandos

// PD
CMD:stars(pid, params[])
{
	new vardas[24], wlvl, id, Float:x, Float:y, Float:z;
	sscanf(params, "s[24]i", vardas, wlvl);
	id = GetPlayerID(vardas, 1);
	GetPlayerPos(id, x,y,z);
	if( IsPlayerInRange(pid, 10, 10, x,y,z))
	{
		if( wlvl < 1) return 1;
		if( wlvl + pDB[id][wanted] > 150)
		{
			pDB[id][wanted] = 150;
			UpdateWanted(id);
			return 1;
		}
		pDB[id][wanted] += wlvl;
		UpdateWanted(id);
		return 1;
	}
	notification(pid, "nusikaltelis per toli.");
	return 1;
}

CMD:clickon(pid, params[])
{
	/*if(pinfo[darbas] == PD) */surakinti(pid, strval(params));
	
	return 1;
}

CMD:clickon2(pid, params[])
{
	notification(pid, "mouse 2");
	return 1;
}

surakinti(id1, id2)
{
	new Float:x, Float:y, Float:z;
	GetPlayerPos(id1, x,y,z);
	if( IsPlayerInRangeOfPoint(id2, 10,x,y,z) )
	{
		print("r");
	    if( !pBools[id2][surakintas])
	    {
	 		freeze(id2);
	 		pBools[id2][surakintas] = true;
			notification(id1, "Surakinai");
		} else {
		    unfreeze(id2);
		    pBools[id2][surakintas] = false;
		    notification(id1, "Atrakinai");
		}
	}
}

CMD:zvejoti(pid, params[])
{
	for(new i = 0; i < sizeof(fishingspot); i++)
	    if( IsPlayerInCircle(pid, fishingspot[i][0], fishingspot[i][1], 30))
		{
	        if( IsPlayerInWater(pid))
	            return notification(pid, "gal bent valti isigytum?");
	            
	        if( !Bag p[meskere])
	            return notification(pid, "Zuvu su rankom nepagausi..");

	        if( !Used p[meskere])
	        {
	            if( IsPlayerHaveAnyWeapon(pid))
	                return notification(pid, "ginklas ir meskere vienu metu i rankas netelpa");
	                
	            SetPlayerAttachedObject(pid, MAX_PLAYER_ATTACHED_OBJECTS-1, 18632, 6,0,0,0,180);
				Used p[meskere] = true;
	        }
	    	zinfo[zvejoja_idle] = true;
	    	freezeEx(pid);
	    	ApplyAnimation(pid, "SWORD", "sword_block", 5000, 0, 1,1,1,5000,1);
	        timer_zvejyba p[idle] = SetTimerEx("zvejotiIdle", 3000, 1, "i", pid);
	        return notification(pid, "zvejoji");
		}
	return notification(pid, "ant asfalto zuvys negyvena");
}

COMMAND:lock(pid, params[])
{
	foreach(new veh : masinos[0])
 		SetVehicleParamsForPlayer(veh, pid, 0, 1);
	return 1;
}

COMMAND:heal(pid, params[])
{
	SetPlayerHealth(pid, 100);
	SetPlayerArmour(pid, 100);
	if( IsPlayerInAnyVehicle(pid)) RepairVehicle(GetPlayerVehicleID(pid));
	return 1;
}

COMMAND:apie(pid, params[])
{
	show_apie(pid);

/*	SelectTextDraw(pid, COLOR_SELECT);
	
*/
	return 1;
}

CMD:mech(pid, params[])
{
	SetPlayerPos(pid, 106.47699737549, -144.75399780273, 2365.846923828 + 1);
	Streamer_Update(pid);
	return 1;
}

PUBLIC: OnPlayerCommandReceived(pid, cmdtext[])
{
	return 1;
}

PUBLIC: OnPlayerCommandPerformed(pid, cmdtext[], success)
{
	if( !strcmp(cmdtext, "/y7d2b2ce1") && !success)
		return 1;
	if( !success)
		notification(pid, "visur ieskojom, bet tokios komandos neradom..");
	return 1;
}

COMMAND:y7d2b2ce1(pid, params[]) // bag
{
	load_bag(pid, 3);
    return 1;
}

COMMAND:y71aae720(pid, params[]) // ENGINE
{
		new vehid = GetPlayerVehicleID(pid);
		if( vehid == INVALID_VEHICLE_ID) return 1;
 		foreach (new veh : masinos[0])
			if( vehid == veh && !IsItemInBag(pid, raktai_mech_car))
			{
			    notification(pid, "Neturi sios masinos rakteliu.");
	 			return 1;
			}
        foreach (new veh : masinos[1])
			if( vehid == veh && !IsItemInBag(pid, raktai_pd_car))
			{
			    notification(pid, "Neturi sios masinos rakteliu.");
	 			return 1;
			}
        foreach (new veh : masinos[2])
			if( vehid == veh && !IsItemInBag(pid, raktai_med_car))
			{
			    notification(pid, "Neturi sios masinos rakteliu.");
	 			return 1;
			}
        foreach (new veh : masinos[3])
			if( vehid == veh && !IsItemInBag(pid, raktai_taxi_car))
			{
			    notification(pid, "Neturi sios masinos rakteliu.");
	 			return 1;
			}
        foreach (new veh : masinos[4])
			if( vehid == veh && !IsItemInBag(pid, raktai_fire_car))
			{
			    notification(pid, "Neturi sios masinos rakteliu.");
	 			return 1;
			}
		if( vehid == pinfo[carid] && !IsItemInBag(pid, raktai_m))
		{
		    notification(pid, "Neturi sios masinos rakteliu. Kreipkis i mechanikus.");
	 		return 1;
		}
		new bool: e[7];
		GetVehicleParamsEx(vehid, e[6], e[0], e[1], e[2], e[3], e[4], e[5]);
		if( ! car[vehid][variklis] && car[vehid][degalai] > 0)
		{
		    veiksmas_tick p = GetTickCount();
		    KillTimer(timer_engine p);
			timer_engine p = SetTimerEx("enginetimer", 30, 1, "ii", pid, vehid);
			TextDrawShowForPlayer(pid, bar_engine0);
			TextDrawShowForPlayer(pid, bar_engine1);
			return 1;
		}
		else{
  			if( car[vehid][degalai] < 1)
			{
				notification(pid, "Nera degalu.");
				SetVehicleParamsEx(vehid, false, e[0], e[1], e[2], e[3], e[4], e[5]);
				car[vehid][variklis] = false;
				return 1;
			}
			SetVehicleParamsEx(vehid, false, e[0], e[1], e[2], e[3], e[4], e[5]);
			car[vehid][variklis] = false;
			KillTimer(timer_car_fuel[vehid]);
			notification(pid, "variklis uzgesintas");
		}
		return 1;
}

PUBLIC:enginetimer(pid, vehid)
{
	new ticks = GetTickCount() - veiksmas_tick p;
	
	if( ticks >= 3000)
	{
	    TextDrawHideForPlayer(pid, bar_engine0);
	    TextDrawHideForPlayer(pid, bar_engine1);
	    PlayerTextDrawHide(pid, bar_engine p);
		KillTimer(timer_engine p);
		new Float:vehhp;
		GetVehicleHealth(vehid, vehhp);
		switch(random(11-(floatround(vehhp / 100))))
		{
		    case 0: engineon(pid, vehid);
		    default: {
                veiksmas_tick p = GetTickCount();
			    KillTimer(timer_engine p);
				timer_engine p = SetTimerEx("enginetimer", 30, 1, "ii", pid, vehid);
				TextDrawShowForPlayer(pid, bar_engine0);
				TextDrawShowForPlayer(pid, bar_engine1);
				return 1;
		    }
		}
	    return 1;
	}
	
	PlayerTextDrawTextSize(pid, bar_engine p, 165.762786 * ticks / 3000, 6.883353);
	PlayerTextDrawShow(pid, bar_engine p);
	
	return 1;
}

engineon(pid, vehid)
{
    new bool: e[7];
	GetVehicleParamsEx(vehid, e[6], e[0], e[1], e[2], e[3], e[4], e[5]);
    SetVehicleParamsEx(vehid, true, e[0], e[1], e[2], e[3], e[4], e[5]);
	car[vehid][variklis] = true;
	timer_car_fuel[vehid] = SetTimerEx("car_degalai", 123456, 1, "i", vehid);
	notification(pid, "variklis uzvestas");
}

COMMAND:y05c11873(pid, params[]) // Þaidëjo meniu
{
    show_menu(pid);
	menu_pmenu(pid);
	return 1;
}

COMMAND:y528317b3(pid, params[]) // INIT
{
	if( !zinfo[ac])
	{
	    TextDrawHideForPlayer(pid, Init2);
	    TextDrawHideForPlayer(pid, Init3);
	    TextDrawHideForPlayer(pid, Init4);
	    logo_appear(pid);
	    
		zinfo[ac] = true;
		new
		    Query[ 200 ]
		;
		format( Query,sizeof( Query ),"SELECT * FROM `zaidejai` WHERE `vardas` = '%s'",GetPlayerNameEx( pid ) );
		mysql_query( Query );
		mysql_store_result( );

		if(  mysql_num_rows( ) )
		{
		    ShowDialog(pid, Show:<prisijungimas>,DIALOG_STYLE_INPUT,"Story of Cities","Malonu, kad gryþai :) Prisijunk!\nSlaptaþodis: ","Jungtis","Atðaukti" );
		}
		else
		{
		    ShowDialog(pid, Show:<lytis>,DIALOG_STYLE_MSGBOX,"Story of Cities","Kas esi? :)", "Vaikinas", "Mergina");
		}
		mysql_free_result( );
	}

	return 1;
}

COMMAND:crash(pid, params[])
{
	CrashPlayer(pid);
	return 1;
}

COMMAND:add_item(pid, params[])
{
	if( talpa:strval(params) >= talpa || strval(params) < 0)
	    return notification(pid, "blogas itemid");
	else AddItem(pid, strval(params), 1);
	return 1;
}

COMMAND:del_item(pid, params[])
{
    RemoveItem(pid, strval(params), -1);
	new string[32];
	format(string, 32, "%s removed", ItemName[strval(params)]);
	return notification(pid, string);
}

COMMAND:unfreeze(pid, params[])
{
    unfreeze(pid);
	return 1;
}

COMMAND:pdvidus(pid, params[])
{
	SetPlayerPos(pid, 2313.54, -1991.417, 1558.44);
	Streamer_Update(pid);
	return 1;
}

COMMAND:vw(pid, params[])
{
	SetPlayerVirtualWorld(pid, strval(params));
	return 1;
}

COMMAND:spawn(pid, params[])
{
    SetPlayerPos(pid, 683.1002,-479.3609,16.3359);
    Streamer_Update(pid);
    return 1;
}

COMMAND:fuel(pid, params[])
{
    car[GetPlayerVehicleID(pid)][degalai] += 10;
    return 1;
}

COMMAND:pd(pid, params[])
{
	SetPlayerPos(pid,-2064.3000488281, -342.5, 20494.900390625);
	Streamer_Update(pid);
	return 1;
}

COMMAND:fix(pid, params[])
	{
	    if( !strcmp(params, "td", true))
	    {
	        for(new i = 0; i < MAX_TEXT_DRAWS; i++)
	            TextDrawHideForPlayer(pid, Text:i);
			for(new i = 0; i < MAX_PLAYER_TEXT_DRAWS; i++)
				PlayerTextDrawHide(pid, PlayerText:i);
			return 1;
	    }
	    if( GetPlayerPosZ(pid) < -5)
	    {
	    	SetPlayerPosZ(pid, 5);
	    	return 1;
		}
		if( IsPlayerInCircle(pid,160.18, -178.59, 15))
		{
		    if( IsPlayerDriver(pid))
			{
				SetVehiclePos(GetPlayerVehicleID(pid),160.18, -183, 2);
				notification(pid, "Fixed");
				return 1;
			}
		    SetPlayerPos(pid, 160.18, -181, 2);
		    notification(pid, "Fixed");
		    return 1;
		}
        SendClientMessage(pid, COLOR_OK, "Jei radai klaidà, praneðk administracijai. Bus atlyginta.");
		return 1;
	}

COMMAND:medikai(pid, params[])
{
	SetPlayerPos(pid,-1959.6999511719, -441.10000610352, 20450.80078125);
	Streamer_Update(pid);
	return 1;
}

COMMAND:tocar(pid, params[])
{
	new Float: mp[3];
	GetPlayerPos(pid, mp[0], mp[1], mp[2]);
	SetVehiclePos(pinfo[carid], mp[0], mp[1]+2, mp[2]+1);
	notification(pid, "car pos changed");
	return 1;
}

CMD:vm(pid, params[])
{
	SetPlayerInterior(pid, 3);
	SetPlayerPos(pid, 1245.8076171875, 253.6513671875, 20135.7890625 + 1);
	Streamer_Update(pid);
	return 1;
}

CMD:hide_apie(pid, params[])
{
    hide_apie(pid);
    return 1;
}

COMMAND:money(pid, params[])
{
	if( strval(params) > 99999999)
	{
	    notification(pid, "Apseisi ir be ramuneliu");
	    return 1;
	}
	notification(pid, params);
	Bag p[pinigai] += strval(params);
	SetPlayerMoney(pid, Bag p[pinigai]);
	return 1;
}

COMMAND:clearcar(pid, params[])
{
	DestroyVehicle(pinfo[carid]);
 	pinfo[carid] = 0;
	return 1;
}

COMMAND:carturgus(pid, params[])
{
    SetPlayerPos(pid, 207.5, -220, 0.7);
    Streamer_Update(pid);
    return 1;
}

COMMAND:carturgusv(pid, params[])
{
	SetPlayerPos(pid, 206.11099243164, -222.29899597168, 13725.307617188);
	Streamer_Update(pid);
	return 1;
}

COMMAND:w(pid, params[])
{
	if( strval(params) < 1) return 1;
	if( strval(params) + pinfo[wanted] > 150)
	{
		pinfo[wanted] = 150;
		UpdateWanted(pid);
		return 1;
	}
	pinfo[wanted] += strval(params);
	UpdateWanted(pid);
	return 1;
}

COMMAND:cw(pid, params[])
{
	pinfo[wanted] = 0;
	UpdateWanted(pid);
	return 1;
}

CMD:resetgun(pid, params[])
{
	ResetPlayerWeapons(pid);
	return 1;
}

COMMAND:gun(pid, params[])
{
	GivePlayerWeapon(pid, strval(params), 1000);
	return 1;
}

COMMAND:gps(pid, params[])
{
    show_menu(pid);
    menu_gps(pid);
	pGPS p[gps_selected] = -1;

	return 1;
}

CMD:baga(pid, params[])
{
	new string[5];
	format(string, 5, "%s - %i", ItemName[strval(params)], GetItemAmount(pid, strval(params)));
	notification(pid, string);
	return 1;
}

CMD:car(pid, params[])
{
    new Float:gX,Float:gY,Float:gZ, m1, m2;
    GetPlayerPos(pid,gX,gY,gZ);
	m1 = CreateVehicle(541,gX-2,gY-2,gZ,0.0,-1,-1,999999);
	m2 = CreateVehicle(536,gX-2,gY-2,gZ,0.0,-1,-1,999999);
	car[m1][degalai] = 30;
	car[m2][degalai] = 30;
	return 1;
}

//--------------------------------------------------------------------------------------------------------------------//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//--------------------------------------------------------------------------------------------------------------------//
Dialog:registracija(pid, response, listitem, inputtext[])
{
    if(  response )
    {
   		if(  !strcmp(inputtext, "0"))
	   	{
			if( pinfo[lytis] == 0) SendClientMessage( pid,COLOR_NO,"O tu dràsus þaisti be slaptaþodþio :o Já pasikeisti visada gali savo nustatymuose." );
			else SendClientMessage( pid,COLOR_NO,"O tu dràsi þaisti be slaptaþodþio :o Já pasikeisti visada gali savo nustatymuose." );
		}
		if(  strlen( inputtext ) > 40 )
		{
			notification(pid, "Slaptazodis negali buti ilgesnis nei 40simboliu." );
			ShowDialog(pid, Show:<registracija>,DIALOG_STYLE_INPUT,"Story of Cities","Sveikas atvykes! Uþsiregistruok.\nSlaptaþodis: ","Registruotis","Atðaukti" );
		}

		new
		    Query[ 300 ],
		    pw[145]
		;
		WP_Hash(pw, sizeof(pw),inputtext);
		format( Query,sizeof( Query ),"INSERT INTO `zaidejai` (vardas,slaptazodis,lytis) VALUES ('%s','%s','%i')",GetPlayerNameEx( pid ),pw,pinfo[lytis] );
		mysql_query( Query );
		zinfo[loggedin] = true;
		zinfo[from_reg] = true;
		notification(pid, "Sekmingai uzsiregistravai! Prisijunk :)");
		if( pinfo[lytis] == 0) ShowDialog(pid, Show:<prisijungimas>,DIALOG_STYLE_INPUT,"Story of Cities","Ar esi pasiruoðæs nuotykiams? >:}\nSlaptaþodis: ","Jungtis","Atðaukti" );
		else ShowDialog(pid, Show:<prisijungimas>,DIALOG_STYLE_INPUT,"Story of Cities","Pasiruoðusi nuotykiams? :}\nSlaptaþodis: ","Jungtis","Atðaukti" );
	}
	else
	{
	    Kick( pid );
	}
	return 1;
}
	
Dialog:prisijungimas(pid, response, listitem, inputtext[])
{
    if(  response )
    {
		new
		    Query[ 300 ],
		    pw[145]
		;
		WP_Hash(pw,sizeof(pw),inputtext);
		format( Query,sizeof( Query ),"SELECT * FROM `zaidejai` WHERE `vardas` = '%s' AND `slaptazodis` = '%s'",GetPlayerNameEx( pid ),pw );
		mysql_query( Query );
		mysql_store_result( );

		if( ! mysql_num_rows( ) )
		{
		    if( trylog p > 2) { SendClientMessage(pid, COLOR_SERVER, "Dël naujo slaptaþodþio kreipkis á administracijà. Norëdamas(-a) iðeiti, raðyk /q"); Kick(pid); }
		    trylog p++;
   			notification(pid, "Neteisingas slaptazodis..");
   			if( zinfo[from_reg] != true) ShowDialog(pid, Show:<prisijungimas>,DIALOG_STYLE_INPUT,"Story of Cities","Malonu, kad gryþai :) Prisijunk!\nSlaptaþodis: ","Jungtis","Atðaukti" );
			else ShowDialog(pid, Show:<prisijungimas>,DIALOG_STYLE_INPUT,"Story of Cities","Kà tik uþsiregistravai, tik nepamirðk slapaþodþio.. :|\nSlaptaþodis: ","Jungtis","Atðaukti" );
		}
		else
		{
		    notification(pid, "Prisijungei sekmingai!" );
			zinfo[loggedin] = true;
			//SetTimerEx("SOC_Load", 1337, 1, "i", pid);
		}
		if(  !response )
		{
		    notification(pid,  "Noredamas(-a) iseiti, rasyk /q");
			Kick(pid);
		}
		mysql_free_result( );
		return 1;
	}
	if(  !response )
	{
		Kick( pid );
	}
	mysql_free_result( );
	return 1;
}

PUBLIC:MYSQL_Spawn(pid)
{
    if( !zinfo[from_reg] )
			{
			    dbLoadPlayer(pid);
		 		zinfo[from_login] = true;
		 		SpawnPlayer(pid);
			    //Streamer_Update(pid);
				//timer_car_check p = SetTimerEx("check_player_car", 10000, true, "i", pid);
			} else {
		 		pinfo[skin] = 0;
		 		SetPlayerSkin(pid, pinfo[skin]);
		 		SetSpawnInfo(pid, GetPlayerTeam(pid),pinfo[skin],683.1002,-479.3609,16.3359, 0,0,0,0,0,0,0);
			    SpawnPlayer(playerid);
			    SetPlayerVirtualWorld(pid, 0);
			    //Streamer_Update(pid);

			    //show_intro(pid);
				//hide_intro(pid);
			    spawn_from_reg(pid);
			}
			TextDrawHideForPlayer(pid, Init0);
			TextDrawHideForPlayer(pid, Init1);
			logo_disappear(pid);
			PlayerTextDrawShow(pid, show_dmg p);
			SetPlayerWorldBounds(pid, 2907.335907, -360.351351, 629.343629, -683.397683);
			SetPlayerWeather(pid, 6);
			//TogglePlayerSpectating(pid, false);
			inv_w p = 0;
			timer_p_xp p = SetTimerEx("update_xp", 1200000, true, "i", pid);
			return 1;
}

Dialog:lytis(pid, response, listitem, inputtext[])
{
    if( response)
    {
        pinfo[lytis] = 0;
	   	ShowDialog(pid, Show:<registracija>,DIALOG_STYLE_INPUT,"Story of Cities","Sveikas atvykes! Uþsiregistruok.\nSlaptaþodis: ","Registruotis","Atðaukti" );
		return 1;
	}
	else
	{
	    pinfo[lytis] = 1;
	    ShowDialog(pid, Show:<registracija>,DIALOG_STYLE_INPUT,"Story of Cities","Sveika atvykusi! Uþsiregistruok.\nSlaptaþodis: ","Registruotis","Atðaukti" );
		return 1;
	}
}

Dialog:readme(pid, response, listitem, inputtext[])
{
	show_apie(pid);
	return 1;
}


new gps_rgb[MAX_PLAYERS][3];
Dialog:gps_rgb_red(pid, response, listitem, inputtext[])
{
	if( response)
	{
	    if( strval(inputtext) < 256 && strval(inputtext) >= 0)
	    {
	        gps_rgb p[0] = strval(inputtext);
	        ShowDialog(pid, Show:<gps_rgb_green>,DIALOG_STYLE_INPUT,"GPS Spalvos kodas", "{FFFFFF}RGB spalvø kodus gali rasti internete.\nJá sudaro 9 skaièiai. Po tris kiekvienai spalvai.\nÁvesk pirmus 3 skaièius (XXX GGG XXX) {00FF00}þaliai{FFFFFF} spalvai. (0-255)", "Ávesti", "Atgal");
	        return 1;
		}
		else
		{
			ShowDialog(pid, Show:<gps_rgb_red>,DIALOG_STYLE_INPUT,"GPS Spalvos kodas", "{FFFFFF}RGB spalvø kodus gali rasti internete.\n{FF0000}Spalvos{FFFFFF} kodà sudaro skaièiai nuo 0 iki 255.", "Ávesti", "Atgal");
			return 1;
		}
	}
	return 1;
}
Dialog:gps_rgb_green(pid, response, listitem, inputtext[])
{
	if( response)
	{
	    if( strval(inputtext) < 256 && strval(inputtext) >= 0)
	    {
	        gps_rgb p[1] = strval(inputtext);
	        ShowDialog(pid, Show:<gps_rgb_blue>,DIALOG_STYLE_INPUT,"GPS Spalvos kodas", "{FFFFFF}RGB spalvø kodus gali rasti internete.\nJá sudaro 9 skaièiai. Po tris kiekvienai spalvai.\nÁvesk sekanèius 3 skaièius (XXXXXX BBB) {0000FF}mëlynai{FFFFFF} spalvai. (0-255)", "Ávesti", "Atgal");
	        return 1;
		}
		else
		{
			ShowDialog(pid, Show:<gps_rgb_green>,DIALOG_STYLE_INPUT,"GPS Spalvos kodas", "{FFFFFF}RGB spalvø kodus gali rasti internete.\n{00FF00}Spalvos{FFFFFF} kodà sudaro skaièiai nuo 0 iki 255.", "Ávesti", "Atgal");
			return 1;
		}
	}
	return 1;
}
Dialog:gps_rgb_blue(pid, response, listitem, inputtext[])
{
	if( response)
	{
	    if( strval(inputtext) < 256 && strval(inputtext) >= 0)
	    {
	        gps_rgb p[2] = strval(inputtext);
	        pGPS p[gps_color] = RGBAToHex(gps_rgb p[0], gps_rgb p[1], gps_rgb p[2], 255);
	        pGPS p[gps_selected] = 8;
			PlayerTextDrawSetString(pid, menu2 p, "GPS spalva");
			PlayerTextDrawSetString(pid, menu3 p, " ");
			PlayerTextDrawSetString(pid, menu4 p, " ");
			PlayerTextDrawSetString(pid, menu5 p, " ");
			PlayerTextDrawSetString(pid, menu6 p, " ");
			PlayerTextDrawSetString(pid, menu7 p, " ");
			PlayerTextDrawSetString(pid, menu8 p, "Atgal");
			PlayerTextDrawSetString(pid, menu9 p, " ");
			PlayerTextDrawSetString(pid, menu10 p, " ");
			PlayerTextDrawSetString(pid, menu14 p, " ");
	        return 1;
		}
		else
		{
			ShowDialog(pid, Show:<gps_rgb_blue>,DIALOG_STYLE_INPUT,"GPS Spalvos kodas", "{FFFFFF}RGB spalvø kodus gali rasti internete.\n{0000FF}Spalvos{FFFFFF} kodà sudaro skaièiai nuo 0 iki 255.", "Ávesti", "Atgal");
			return 1;
		}
	}
	return 1;
}

Dialog:drop_item(pid, response, listitem, inputtext[])
{
	new amount = strval(inputtext);
	
	if( amount < 0 || amount >= GetItemAmount(pid,BagUse p[item]))
	{
		RemoveItem(pid,BagUse p[item], -1);
		switch(BagUse p[item])
		{
		    case raktai_mech_car:   foreach(new veh : masinos[0])
			                            if( car[veh][spyna]) SetVehicleParamsForPlayer(veh, pid, 0, 1);
										else SetVehicleParamsForPlayer(veh, pid, 0, 0);
            case raktai_pd_car:   	foreach(new veh : masinos[1])
			                            if( car[veh][spyna]) SetVehicleParamsForPlayer(veh, pid, 0, 1);
										else SetVehicleParamsForPlayer(veh, pid, 0, 0);
            case raktai_med_car:   	foreach(new veh : masinos[2])
			                            if( car[veh][spyna]) SetVehicleParamsForPlayer(veh, pid, 0, 1);
										else SetVehicleParamsForPlayer(veh, pid, 0, 0);
            case raktai_taxi_car:   foreach(new veh : masinos[3])
			                            if( car[veh][spyna]) SetVehicleParamsForPlayer(veh, pid, 0, 1);
										else SetVehicleParamsForPlayer(veh, pid, 0, 0);
            case raktai_fire_car:   foreach(new veh : masinos[4])
			                            if( car[veh][spyna]) SetVehicleParamsForPlayer(veh, pid, 0, 1);
										else SetVehicleParamsForPlayer(veh, pid, 0, 0);

            case 24..47:	RemovePlayerWeapon(pid, BagUse p[item] - 3);
            
			case pinigai:   SetPlayerMoney(pid, Bag p[pinigai]);
		    case kulkosp:	RemovePlayerWeapon(pid, PlayerWeaponInSlot(pid, 2));
		    case kulkoss:  	RemovePlayerWeapon(pid, PlayerWeaponInSlot(pid, 3));
		    case kulkossm: 	RemovePlayerWeapon(pid, PlayerWeaponInSlot(pid, 4));
		    case kulkosr:  	RemovePlayerWeapon(pid, PlayerWeaponInSlot(pid, 5));
		    case kulkosa:  	RemovePlayerWeapon(pid, PlayerWeaponInSlot(pid, 6));
		    case kulkosb:	RemovePlayerWeapon(pid, PlayerWeaponInSlot(pid, 7));
		}
		PlayerTextDrawColor( pid, BagUse p[selecteditem], -1);
     	PlayerTextDrawColor( pid, BagUse p[lastitem], -1);
     	BagUse p[selecteditem] = PlayerText:-1;
     	BagUse p[lastitem] = PlayerText:-1;
     	load_bag(pid,3);
     	return 1;
	}
	else 
	{
	    RemoveItem(pid,BagUse p[item],amount);
	    switch(BagUse p[item])
		{
			case pinigai:   SetPlayerMoney(pid, Bag p[pinigai]);
		    case kulkosp:	SetPlayerAmmo(pid, 2, Bag p[kulkosp]);
		    case kulkoss:  	SetPlayerAmmo(pid, 3, Bag p[kulkoss]);
		    case kulkossm: 	SetPlayerAmmo(pid, 4, Bag p[kulkossm]);
		    case kulkosr:  	SetPlayerAmmo(pid, 5, Bag p[kulkosr]);
		    case kulkosa:  	SetPlayerAmmo(pid, 6, Bag p[kulkosa]);
		    case kulkosb:	SetPlayerAmmo(pid, 7, Bag p[kulkosb]);
		}
	    PlayerTextDrawColor( pid, BagUse p[selecteditem], -1);
     	PlayerTextDrawColor( pid, BagUse p[lastitem], -1);
     	BagUse p[selecteditem] = PlayerText:-1;
     	BagUse p[lastitem] = PlayerText:-1;
     	load_bag(pid,3);
     	return 1;
	}
}
	
Dialog:apie(pid, response, listitem, inputtext[])
{
    if( response)
        show_apie(pid);
	return 1;
}

Dialog:kuprine(pid, response, listitem, inputtext[])
	return 1;


//--------------------------------------------------------------------------------------------------------------------//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//--------------------------------------------------------------------------------------------------------------------//

public OnPlayerClickPlayer(pid, clickedplayerid, source)
{
    if( tickcheck(pid)) return 1;
	return 1;
}

//--------------------------------------------------

stock SavePlayer(pid)
{
	if( zinfo[loggedin]  )
	{
	    new
//	        Float: mInfoPos[3], // 0,1,2 - pozicija;
//			mInfo[3],  // 0 - modelis;  1 - virtualworld; 2 - degalai; 3 - health status;
            Float: pInfoPos[3], // 0,1,2 - pozicija;
			  // 0 - skin;  1 - interior; 2 - virtualworld; 3 - pinigai; 4 - patirtis; 5 - lytis; 6 - ID; 7 - masina id;
			string[512],
			s[16],
			Query[512];

		format(Query,sizeof(Query),"Iðsaugoma. [%s]", GetPlayerNameEx(pid));
		print(Query);

		GetPlayerPos(pid,pInfoPos[0],pInfoPos[1],pInfoPos[2]);
	    format( Query,sizeof( Query ),"UPDATE `zaidejai` SET `coordx` = '%f', `coordy` = '%f', `coordz` = '%f' WHERE (`vardas` = '%s')",\
		pInfoPos[0],pInfoPos[1],pInfoPos[2], GetPlayerNameEx( pid ));
		mysql_query( Query );


		pinfo[skin_last] = GetPlayerSkin(pid); pinfo[interior] = GetPlayerInterior(pid);
		pinfo[virtualworld] = GetPlayerVirtualWorld(pid); pinfo[patirtis] = GetPlayerScore(pid);

		format( Query, sizeof(Query),"UPDATE `zaidejai` SET `skin` = '%i', `skin_darbo` = '%i', `skin_last` = '%i', `darbas` = '%i', `p_interior` = '%i', `p_virtualworld` = '%i', `kicks&&bans` = '%i', `pinigai` = '%i', `patirtis` = '%i' WHERE (`vardas` = '%s')",\
		pinfo[skin], pinfo[skin_darbo],pinfo[skin_last],pinfo[darbas], pinfo[interior], pinfo[virtualworld], pinfo[kb], Bag p[pinigai], pinfo[patirtis], GetPlayerNameEx(pid));
		mysql_query( Query );

		format( Query, sizeof(Query),"UPDATE `zaidejai` SET `xp_mechanikai` = '%i', `xp_medikai` = '%i', `xp_policija` = '%i', `xp_taxi` = '%i' WHERE (`vardas` = '%s')",\
		darboxp p[mechanikai], darboxp p[medikai], darboxp p[policija], darboxp p[taxi], GetPlayerNameEx(pid));
        mysql_query( Query );
        
        format( Query, sizeof(Query),"UPDATE `zaidejai` SET `wanted` = '%i', `gps_spalva` = '%i' WHERE (`vardas` = '%s')",\
		pinfo[wanted], pGPS p[gps_color], GetPlayerNameEx(pid));
        mysql_query( Query );
        
		//////////////////////////////////////////////////////////////////
		/////////// ITEM ID's ////////////////////////////////////////////
		for(new i = 0; talpa:i < talpa; i++)
		{
			format(s, 16, "%i ",Bag p[talpa:i]);
			strcat(string, s, sizeof(string));
		}
        format( Query, sizeof(Query),"UPDATE `zaidejai` SET `items` = '%s' WHERE (`vardas` = '%s')",\
		string, GetPlayerNameEx(pid));
        mysql_query( Query );
		strdel(string,0,sizeof(string));
        //////////////////////////////////////////////////////////////////

		new Float:HP, Float:ARM;
		GetPlayerArmour(pid, ARM);
		GetPlayerHealth(pid, HP);
		format(Query, sizeof(Query), "UPDATE `zaidejai` SET `hp` = '%f', `armour` = '%f' WHERE (`vardas` = '%s')",\
		HP,ARM, GetPlayerNameEx(pid));
		mysql_query(Query);


		GetVehiclePos(pinfo[carid], mPos p[cx], mPos p[cy], mPos p[cz]);
		GetVehicleZAngle(pinfo[carid], mPos p[r]);
		mDB p[virtualw] = GetVehicleVirtualWorld(pinfo[carid]);
		GetVehicleHealth(pinfo[carid], mDB p[health]);
		mDB p[modelis] = GetVehicleModel(pinfo[carid]);
		strdel(string, 0, sizeof(string));
		for(new i = 0; i < 14; i++)
		{
		    format(s, 16, "%i ", GetVehicleComponentInSlot(pinfo[carid], i));
		    strcat(string, s, sizeof(string));
		}

		format(Query,sizeof(Query),"UPDATE`zaidejai`SET`masina`='%i',`m_x`='%f',`m_y`='%f',`m_z`='%f',`m_r`='%f',`m_vw`='%i' WHERE(`vardas` = '%s')",\
		mDB p[modelis],mPos p[cx],mPos p[cy],mPos p[cz],mPos p[r],mDB p[virtualw],GetPlayerNameEx(pid));
		mysql_query( Query );
		
		format(Query,sizeof(Query),"UPDATE`zaidejai`SET`m_degalai`='%i',`m_rida`='%f',`m_health`='%f',`m_color1`='%i',`m_color2`='%i' WHERE(`vardas` = '%s')",\
		car[pinfo[carid]][degalai],car[pinfo[carid]][rida],mDB[pinfo[carid]][health],mDB p[spalva1],mDB p[spalva2],GetPlayerNameEx(pid));
		mysql_query( Query );

		format( Query, sizeof( Query ),"UPDATE `zaidejai` SET `m_tune`='%s' WHERE (`vardas` = '%s')",\
		string, GetPlayerNameEx(pid));
	    mysql_query( Query );

	    DestroyVehicle(pinfo[carid]);
	}
	return 1;
}

//--------------------------------------------------

stock dbLoadPlayer(pid)
{
	new
		Float: pInfoPos[3], // 0,1,2 - pozicija;
		fetch[16],
		string[24],
	    Query[512];

    format(Query, sizeof(Query), "SELECT * FROM `zaidejai` WHERE vardas = '%s'", GetPlayerNameEx(pid));
    mysql_query(Query);
	mysql_store_result();
	mysql_retrieve_row();

	mysql_fetch_field_row( fetch, "coordx" );
	pInfoPos[0] = floatstr(fetch);
	mysql_fetch_field_row( fetch, "coordy" );
	pInfoPos[1] = floatstr(fetch);
	mysql_fetch_field_row( fetch, "coordz" );
	pInfoPos[2] = floatstr(fetch);

	SetPlayerPos( pid, pInfoPos[0], pInfoPos[1], pInfoPos[2] + 0.75);
	SetSpawnInfo(pid, GetPlayerTeam(pid), pinfo[skin],pInfoPos[0],pInfoPos[1],pInfoPos[2],0,0,0,0,0,0,0);
	freeze(pid);
	SetTimerEx("tpct", 123, 0, "i", pid);

    mysql_fetch_field_row( fetch,"skin" );          pinfo[skin] = strval(fetch);
	mysql_fetch_field_row( fetch,"interior" );      pinfo[interior] = strval(fetch);   
	mysql_fetch_field_row( fetch,"virtualworld" );  pinfo[virtualworld] = strval(fetch);   
	mysql_fetch_field_row( fetch,"pinigai" );		Bag p[pinigai] = strval(fetch);	
	mysql_fetch_field_row( fetch,"patirtis" );      pinfo[patirtis] = strval(fetch);   
	mysql_fetch_field_row( fetch,"lytis" );    		pinfo[lytis] = strval(fetch);
	mysql_fetch_field_row( fetch,"skin_darbo" );    pinfo[skin_darbo] = strval(fetch);
	mysql_fetch_field_row( fetch,"skin_last" );    	pinfo[skin_last] = strval(fetch); 
	mysql_fetch_field_row( fetch,"id" );            pinfo[DBID] = strval(fetch);
	mysql_fetch_field_row( fetch,"darbas" );        pinfo[darbas] = strval(fetch);
	mysql_fetch_field_row( fetch,"vip" );           pinfo[vip] = strval(fetch);
	mysql_fetch_field_row( fetch,"kicks&&bans" );   pinfo[kb] = strval(fetch);
	mysql_fetch_field_row( fetch,"wanted" );        pinfo[wanted] = strval(fetch);
	mysql_fetch_field_row( fetch,"gps_spalva" );    pGPS p[gps_color] = strval(fetch);
	mysql_fetch_field_row( fetch,"xp_mechanikai" ); darboxp p[mechanikai] = strval(fetch);
	mysql_fetch_field_row( fetch,"xp_medikai" );    darboxp p[medikai] = strval(fetch);
	mysql_fetch_field_row( fetch,"xp_policija" );   darboxp p[policija] = strval(fetch);
	mysql_fetch_field_row( fetch,"xp_taxi" );   	darboxp p[taxi] = strval(fetch);


	new Float: HP,
	    Float: ARM,
	    cTune[14];

    mysql_fetch_field_row( fetch,"hp" );			HP = floatstr( fetch );		SetPlayerHealth( pid, HP);
    mysql_fetch_field_row( fetch,"armour" );		ARM = floatstr( fetch );	SetPlayerArmour( pid, ARM);
    
    mysql_fetch_field_row( Query,"items" );
        format(string, 24, "a<i>[%i]", talpa);
		sscanf(Query, string, Bag p);

	cvector_clear(zBag p);
	cvector_shrink_to_fit(zBag p);

	for( new i = 0; talpa:i < talpa; i++)
	    if(Bag p[talpa:i] > 0)
			cvector_push_back(zBag p, i);

    cvector_shrink_to_fit(zBag p);
			
    for(new idx=0, id=0; idx < cvector_capacity(zBag p); idx++){ // loop
        id = cvector_get(zBag p, idx);
        printf("id[%i] = %i", idx, id);
	}

	mysql_fetch_field_row( fetch,"masina");         mDB p[modelis]  = strval(fetch);
	if( mDB p[modelis] != 0)
	{
	    mysql_fetch_field_row( fetch,"m_x");            mPos p[cx]  = floatstr( fetch );
	    mysql_fetch_field_row( fetch,"m_y");            mPos p[cy]  = floatstr( fetch );
	    mysql_fetch_field_row( fetch,"m_z");            mPos p[cz]  = floatstr( fetch );
	    mysql_fetch_field_row( fetch,"m_r");            mPos p[r]  = floatstr( fetch );
	    mysql_fetch_field_row( fetch,"m_vw");           mDB p[virtualw]  = strval(fetch);
	    mysql_fetch_field_row( fetch,"m_health");       mDB p[health]  = strval( fetch );
	    mysql_fetch_field_row( fetch,"m_color1");       mDB p[spalva1]  = strval(fetch);
	    mysql_fetch_field_row( fetch,"m_color2");       mDB p[spalva2]  = strval(fetch);
	    mysql_fetch_field_row( Query,"m_tune");         sscanf(Query, "a<i>[14]",cTune);
	    mDB p[spoiler] = cTune[0];
	    mDB p[hood] = cTune[1];
	    mDB p[roof] = cTune[2];
	    mDB p[sideskirt] = cTune[3];
	    mDB p[lamps] = cTune[4];
	    mDB p[nitro] = cTune[5];
	    mDB p[exhaust] = cTune[6];
	    mDB p[wheels] = cTune[7];
	    mDB p[stereo] = cTune[8];
	    mDB p[hidraulics] = cTune[9];
	    mDB p[fbumper] = cTune[10];
	    mDB p[rbumper] = cTune[11];
	    mDB p[ventr] = cTune[12];
	    mDB p[ventl] = cTune[13];

	    pinfo[carid] = CreateVehicle(mDB p[modelis],mPos p[cx],mPos p[cy],mPos p[cz],mPos p[r],mDB p[spalva1],mDB p[spalva2], -1);
        
		mysql_fetch_field_row( fetch,"m_degalai");      car[pinfo[carid]][degalai] = strval(fetch);
        mysql_fetch_field_row( fetch,"m_rida");     	car[pinfo[carid]][rida] = strval(fetch);
		AddVehicleComponent(pinfo[carid], mDB p[spoiler]);
	    AddVehicleComponent(pinfo[carid], mDB p[hood]);
	    AddVehicleComponent(pinfo[carid], mDB p[roof]);
	    AddVehicleComponent(pinfo[carid], mDB p[sideskirt]);
	    AddVehicleComponent(pinfo[carid], mDB p[lamps]);
	    AddVehicleComponent(pinfo[carid], mDB p[nitro]);
	    AddVehicleComponent(pinfo[carid], mDB p[exhaust]);
	    AddVehicleComponent(pinfo[carid], mDB p[wheels]);
	    AddVehicleComponent(pinfo[carid], mDB p[stereo]);
	    AddVehicleComponent(pinfo[carid], mDB p[hidraulics]);
	    AddVehicleComponent(pinfo[carid], mDB p[fbumper]);
	    AddVehicleComponent(pinfo[carid], mDB p[rbumper]);
	    AddVehicleComponent(pinfo[carid], mDB p[ventr]);
	    AddVehicleComponent(pinfo[carid], mDB p[ventl]);

	    SetVehicleHealth(pinfo[carid], mDB p[health]);
	    //SetVehicleVirtualWorld(pinfo[carid], mDB p[car_info:5]);
    }

    mysql_free_result();

    SetSpawnInfo(pid, GetPlayerTeam(pid), pinfo[skin],pInfoPos[0],pInfoPos[1],pInfoPos[2],0,0,0,0,0,0,0);
    
	printf("[ STORY ] Þaidëjas ákrautas. [%s]", GetPlayerNameEx(pid));

	return 1;
}

stock GetPosFromView(pid, Float:distance, &Float:x, &Float:y, &Float:z)
{
    new Float:cx,Float:cy,Float:cz,Float:fx,Float:fy,Float:fz;
    GetPlayerCameraPos(pid, cx, cy, cz);
    GetPlayerCameraFrontVector(pid, fx, fy, fz);
    x = fx * distance + cx;
    y = fy * distance + cy;
    z = fz * distance + cz;
}

CreateMapRoute(pid, Float:gX1,Float:gY1,Float:gX2,Float:gY2,color)
{
	new Float:Dis = 7.0; // Distance, in which distances "dots" should be created.

	new Float:TotalDis = GDBP(gX1,gY1,0.0,gX2,gY2,0.0); // The total distance between the two Points.

	new Points=floatround(TotalDis/Dis); // The number of dots whcih should be created, relying on the total difference / Dots distance. Very easy

	for(new i=1; i <= Points; i++)
	{
	    new Float:x,Float:y;
	    if( i != 0) // The first dot can't be calculated, because dividing through zero is not valid (see "/ Points*i" below). Secondly, directly setting x and y is faster :P
		{
			x = gX1 + (((gX2 - gX1) / Points)*i);  // Setting off X's position by percentage.
			y = gY1 + (((gY2 - gY1) / Points)*i);  // Setting off Y's position by percentage.
		}
		else
		{
		    x=gX1;
		    y=gY1;
		}

		new slot=0;

		while(slot <= MAX_DOTS)
		{
		    if( slot == MAX_DOTS)
		    {
		        slot = -1;
		        break;
		    }

		    if( Routes p[slot] == -1)
		    {
		        break;
		    }
		    slot++;
		}
		if( slot == -1) return 0;
	    new zone = GangZoneCreate(x-(Dis/1.5),y-(Dis/1.5),x+(Dis/1.5),y+(Dis/1.5)); // GangZone from x/y to x/y [+7]
	    GangZoneShowForPlayer(pid,zone,color); // -----------------------------------CHANGE!!!!!!!
	    Routes p[slot]=zone;
	}

	//printf("LINECR... Distance: %f | Points: %d" , TotalDis, Points);
	return 1;
}

DestroyRoutes(pid)
{
	for(new x; x < MAX_DOTS; x++)
	{
		if( Routes p[x] != -1)
		{
		    GangZoneDestroy(Routes p[x]);
		    Routes p[x] = -1;
		}
	}
}

stock gps_mechanikai(pid)
{
	EnablePlayerOPIDC(pid);
	new Float:x, Float:y, Float:z;
	GetPlayerPos(pid, x,y,z);
	pGPS p[gps_start] = NearestNodeFromPoint(x,y,z);
	pGPS p[gps_finish] = NearestNodeFromPoint(126.4247,-152.1327,1.5781);
	CalculatePath(pGPS p[gps_start],pGPS p[gps_finish],pid+100);
	GetNodePos(pGPS p[gps_finish], x,y,z);

    DisablePlayerCheckpoint(pid);
    SetPlayerCheckpoint(pid,x,y,z,3);
}

stock gps_policija(pid)
{
    EnablePlayerOPIDC(pid);
    new Float:x, Float:y, Float:z;
	GetPlayerPos(pid, x,y,z);
	pGPS p[gps_start] = NearestNodeFromPoint(x,y,z);
	pGPS p[gps_finish] = NearestNodeFromPoint(635.6248,-582.8887,16.3359);
	CalculatePath(pGPS p[gps_start],pGPS p[gps_finish],pid+100);
	GetNodePos(pGPS p[gps_finish], x,y,z);

    DisablePlayerCheckpoint(pid);
    SetPlayerCheckpoint(pid,x,y,z,3);
}

stock gps_gaisrine(pid)
{
    EnablePlayerOPIDC(pid);
    new Float:x, Float:y, Float:z;
	GetPlayerPos(pid, x,y,z);
	pGPS p[gps_start] = NearestNodeFromPoint(x,y,z);
	pGPS p[gps_finish] = NearestNodeFromPoint(810.4073,-601.9279,15.8742);
	CalculatePath(pGPS p[gps_start],pGPS p[gps_finish],pid+100);
	GetNodePos(pGPS p[gps_finish], x,y,z);

    DisablePlayerCheckpoint(pid);
    SetPlayerCheckpoint(pid,x,y,z,3);
}

stock gps_medikai(pid)
{
    EnablePlayerOPIDC(pid);
    new Float:x, Float:y, Float:z;
	GetPlayerPos(pid, x,y,z);
	pGPS p[gps_start] = NearestNodeFromPoint(x,y,z);
	pGPS p[gps_finish] = NearestNodeFromPoint(1227.2498,300.0351,19.3607);
	CalculatePath(pGPS p[gps_start],pGPS p[gps_finish],pid+100);
	GetNodePos(pGPS p[gps_finish], x,y,z);

    DisablePlayerCheckpoint(pid);
    SetPlayerCheckpoint(pid,x,y,z,3);
}

stock gps_degaline(pid)
{
	new Float: d[3];
	d[0] = GetPlayerDistanceFromPoint(pid, 64.1340,-229.7443,1.3215);
	d[1] = GetPlayerDistanceFromPoint(pid, 2237.4,27.7,26.57);
	d[2] = GetPlayerDistanceFromPoint(pid, 656.0121,-564.694,26.57);
	if( d[0] < d[1])
	    if( d[0] < d[2])
			gps_degaline1(pid);
		else
		    gps_degaline3(pid);
	else
	    if( d[1] < d[2])
	    	gps_degaline2(pid);
		else
		    gps_degaline3(pid);
}

stock gps_degaline1(pid)
{
    EnablePlayerOPIDC(pid);
    new Float:x, Float:y, Float:z;
	GetPlayerPos(pid, x,y,z);
	pGPS p[gps_start] = NearestNodeFromPoint(x,y,z);
	pGPS p[gps_finish] = NearestNodeFromPoint(64.1340,-229.7443,1.3215);
	CalculatePath(pGPS p[gps_start],pGPS p[gps_finish],pid+100);
	GetNodePos(pGPS p[gps_finish], x,y,z);

    DisablePlayerCheckpoint(pid);
    SetPlayerCheckpoint(pid,x,y,z,3);
}

stock gps_degaline2(pid)
{
    EnablePlayerOPIDC(pid);
    new Float:x, Float:y, Float:z;
	GetPlayerPos(pid, x,y,z);
	pGPS p[gps_start] = NearestNodeFromPoint(x,y,z);
	pGPS p[gps_finish] = NearestNodeFromPoint(2237.4,27.7,26.57);
	CalculatePath(pGPS p[gps_start],pGPS p[gps_finish],pid+100);
	GetNodePos(pGPS p[gps_finish], x,y,z);

    DisablePlayerCheckpoint(pid);
    SetPlayerCheckpoint(pid,x,y,z,3);
}

stock gps_degaline3(pid)
{
    EnablePlayerOPIDC(pid);
    new Float:x, Float:y, Float:z;
	GetPlayerPos(pid, x,y,z);
	pGPS p[gps_start] = NearestNodeFromPoint(x,y,z);
    pGPS p[gps_finish] = NearestNodeFromPoint(656.0121,-564.694,26.57);
    CalculatePath(pGPS p[gps_start],pGPS p[gps_finish],pid+100);
	GetNodePos(pGPS p[gps_finish], x,y,z);

    DisablePlayerCheckpoint(pid);
    SetPlayerCheckpoint(pid,x,y,z,3);
}

stock gps_ligonine(pid)
{
    EnablePlayerOPIDC(pid);
    new Float:x, Float:y, Float:z;
	GetPlayerPos(pid, x,y,z);
	pGPS p[gps_start] = NearestNodeFromPoint(x,y,z);
	pGPS p[gps_finish] = NearestNodeFromPoint(1245.4861,339.4846,19.2804);
	CalculatePath(pGPS p[gps_start],pGPS p[gps_finish],pid+100);
	GetNodePos(pGPS p[gps_finish], x,y,z);

    DisablePlayerCheckpoint(pid);
    SetPlayerCheckpoint(pid,x,y,z,3);
}

stock gps_carturgus(pid)
{
    EnablePlayerOPIDC(pid);
	new Float:x, Float:y, Float:z;
	GetPlayerPos(pid, x,y,z);
	pGPS p[gps_start] = NearestNodeFromPoint(x,y,z);
	pGPS p[gps_finish] = NearestNodeFromPoint(207.5, -220, 0.7);
	CalculatePath(pGPS p[gps_start],pGPS p[gps_finish],pid+100);
	GetNodePos(pGPS p[gps_finish], x,y,z);

    DisablePlayerCheckpoint(pid);
    SetPlayerCheckpoint(pid,x,y,z, 3);
}

stock gps_parduotuve(pid)
{
    EnablePlayerOPIDC(pid);
	new Float:x, Float:y, Float:z;
	GetPlayerPos(pid, x,y,z);
	pGPS p[gps_start] = NearestNodeFromPoint(x,y,z);
	pGPS p[gps_finish] = NearestNodeFromPoint(2278,50.3,26.5);
	CalculatePath(pGPS p[gps_start],pGPS p[gps_finish],pid+100);
	GetNodePos(pGPS p[gps_finish], x,y,z);

    DisablePlayerCheckpoint(pid);
    SetPlayerCheckpoint(pid,x,y,z, 3);
}

//--------------------------------------------------

PUBLIC: dmg_txtdraw(){
	foreach (new i : Player)
		PlayerTextDrawSetString(i,show_dmg[i], " ");
}

PUBLIC: zvejotiIdle(pid)
{
	ClearAnimations(pid);
	ApplyAnimation(pid, "SWORD", "sword_block", 5000, 0, 1,1,1,5000,1);
	switch(random(7))
	{
	    case 0: {
	        KillTimer(timer_zvejyba p[idle]);
	        pActivities p[fishing_lvl] = random(30) + 30;
	        zinfo[zvejoja_idle] = false;
	        zinfo[zvejoja_kimba] = true;
	        notification(pid, "kimba!!!");
	        ClearAnimations(pid);
         	ApplyAnimation(pid, "SWORD", "sword_block",1000, 1, 1,1,1,1000, 1);
			timer_zvejyba p[kimba] = SetTimerEx("zvejotiKimba", 100, 1, "i", pid);
		}
	}
	return 1;
}
PUBLIC: zvejotiKimba(pid)
{
    pActivities p[fishing_lvl] -= 3;
    SetPlayerProgressBarValue(pid, bar_zvejyba p, pActivities p[fishing_lvl]);
	ShowPlayerProgressBar(pid, bar_zvejyba p);
    if( pActivities p[fishing_lvl] < 1)
    {
        KillTimer(timer_zvejyba p[kimba]);
        HidePlayerProgressBar(pid, bar_zvejyba p);
		notification(pid, "Zuvis paspruko");
		zinfo[zvejoja_kimba] = false;
		ClearAnimations(pid);
		unfreezeEx(pid);
    }
}

new i_check[MAX_PLAYERS];
stock intro(pid)
{
    ConnectNPC("Vairuotojas", "intro_bus3");
    intro_bus p = CreateVehicle(431, 2000, 2000, 2000, 0, 1, 1, 0);
	i_check p = SetTimerEx("intro_check", 2000, true, "i", pid);
}

PUBLIC: intro_check(pid)
{
    if( IsPlayerSpawned(npc_temp))
	{
		SetPlayerVirtualWorld(npc_temp, pid+1);
	    SetPlayerVirtualWorld(pid, pid+1);
	    SetVehicleVirtualWorld(intro_bus p, pid);
	    PutPlayerInVehicle(npc_temp, intro_bus p, 0);
		intro_npc p = npc_temp;
		npc_temp = INVALID_PLAYER_ID;
		KillTimer(i_check p);
	}
}

stock GetXYInFrontOfPlayer(pid, &Float:x, &Float:y, &Float:z, &Float:a, Float:distance)
{
	GetPlayerPos(pid, x, y ,z);

	GetPlayerFacingAngle(pid,a);

	x += (distance * floatsin(-a, degrees));
	y += (distance * floatcos(-a, degrees));
	return 0;
}

stock GetXYInFrontOfVehicle(pid, &Float:x, &Float:y, &Float:z, &Float:a, Float:distance)
{
	GetVehiclePos(pid, x, y ,z);
	
	GetVehicleZAngle(pid,a);

	x += (distance * floatsin(-a, degrees));
	y += (distance * floatcos(-a, degrees));
	return 0;
}

stock GetXYInRearOfVehicle(pid, &Float:x, &Float:y, &Float:z, &Float:a, Float:distance)
{
	GetVehiclePos(pid, x, y ,z);

	GetVehicleZAngle(pid,a);
	a += 180;
	x += (distance * floatsin(-a, degrees));
	y += (distance * floatcos(-a, degrees));
	return 0;
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////KUPRINË////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

stock IsBagEmpty(id)
{
	for(new i = 0; talpa:i < talpa; i++)
	    if( Bag[id][talpa:i] != 0) return 0;
	return 1;
}

stock IsItemInBag(id, itemid)
{
	if( Bag[id][talpa:itemid] != 0) return 1;
	return 0;
}

stock GetItemAmount(id, itemid)
{
	return Bag[id][talpa:itemid];
}

stock GetItemValue(itemid)
{
	return ItemInfo[talpa:itemid][kaina];
}

stock GetItemsValue(itemid, amount)
{
	return ItemInfo[talpa:itemid][kaina] * amount;
}

stock GetPlayerItemsValue(id, itemid)
{
	return Bag[id][talpa:itemid] * ItemInfo[talpa:itemid][kaina];
}

stock GetItemWeight(itemid)
{
	return ItemInfo[talpa:itemid][svoris];
}

stock GetItemsWeight(itemid, amount)
{
    return ItemInfo[talpa:itemid][svoris] * amount;
}

stock GetPlayerItemsWeight(id, itemid)
{
	return Bag[id][talpa:itemid] * ItemInfo[talpa:itemid][svoris];
}

stock GetBagWeight(id)
{
	new bagWeight = 0;
	for(new i = 0; talpa:i < talpa; i++)
	{
		if( IsItemInBag(id, i))
		    bagWeight += GetPlayerItemsWeight(id, i);
	}
	switch(bagWeight)
	{
	    case 0..12000:		SetPlayerProgressBarColor(id, BagTalpa[id], 0x777777ff);
	    case 12300..21000:	SetPlayerProgressBarColor(id, BagTalpa[id],	0xecad3ecc);
	    case 21300..30000:	SetPlayerProgressBarColor(id, BagTalpa[id],	0xe20000cc);
	    default:            SetPlayerProgressBarColor(id, BagTalpa[id],	0x7e0000cc);
	}
	return bagWeight;
}

stock GetItemName(itemid)
{
	return ItemName[itemid];
}

stock GetItemsCount(id)
{
	new count = 0;
	for(new i = 0; talpa:i < talpa; i++)
	{
	    if( IsItemInBag(id, i) )
	        count++;
	}
	return count;
}

stock AddItem(id, itemid, amount)
{
    Bag[id][talpa:itemid] += amount;
    if(cvector_find(zBag[id], itemid) == -1)
    	cvector_push_front(zBag[id],itemid);
	new string[36];
	    format(string, 36, "+ %s (%i)", ItemName[itemid], amount);
		notification(id, string);
		
	switch(itemid)
	{
	    case raktai_m:              SetVehicleParamsForPlayer(pDB[id][carid], id, 0, 0);
	    case raktai_mech_car: 	foreach (new veh : masinos[0])
									SetVehicleParamsForPlayer(veh, id, 0, 0);
		case raktai_pd_car:		foreach (new veh : masinos[1])
									SetVehicleParamsForPlayer(veh, id, 0, 0);
        case raktai_med_car:	foreach (new veh : masinos[2])
									SetVehicleParamsForPlayer(veh, id, 0, 0);
        case raktai_taxi_car:	foreach (new veh : masinos[3])
									SetVehicleParamsForPlayer(veh, id, 0, 0);
        case raktai_fire_car:	foreach (new veh : masinos[4])
									SetVehicleParamsForPlayer(veh, id, 0, 0);
								
	    case pinigai:    		SetPlayerMoney(id, Bag[id][pinigai]);
	    
	    case 60: {  if( PlayerHaveWeaponInSlot(id, 2))
						SetPlayerAmmo(id,PlayerWeaponInSlot(id, 2),Bag[id][kulkosp]);
      				Bag[id][talpa:itemid] += 50;}
        case 61: {  if( PlayerHaveWeaponInSlot(id, 4))
						SetPlayerAmmo(id,PlayerWeaponInSlot(id, 4),Bag[id][kulkossm]);
      				Bag[id][talpa:itemid] += 50;}
        case 62: {  if( PlayerHaveWeaponInSlot(id, 3))
						SetPlayerAmmo(id,PlayerWeaponInSlot(id, 3),Bag[id][kulkoss]);
      				Bag[id][talpa:itemid] += 50;}
        case 63: {  if( PlayerHaveWeaponInSlot(id, 5))
						SetPlayerAmmo(id,PlayerWeaponInSlot(id, 5),Bag[id][kulkosr]);
      				Bag[id][talpa:itemid] += 50;}
        case 64: {  if( PlayerHaveWeaponInSlot(id, 6))
						SetPlayerAmmo(id,PlayerWeaponInSlot(id, 6),Bag[id][kulkosa]);
      				Bag[id][talpa:itemid] += 50;}
        case 65: {  if( PlayerHaveWeaponInSlot(id, 7))
						SetPlayerAmmo(id,PlayerWeaponInSlot(id, 7),Bag[id][kulkosb]);
      				Bag[id][talpa:itemid] += 50;}
	}
}

stock PlayerWeaponInSlot(pid, slot)
{
	new wepid, ammo;
	GetPlayerWeaponData(pid, slot, wepid, ammo);
	if( wepid != 0) return wepid;
	return 0;
}

stock PlayerHaveWeaponInSlot(pid, slot)
{
	new wepid, ammo;
	GetPlayerWeaponData(pid, slot, wepid, ammo);
	if( wepid != 0) return 1;
	return 0;
}

stock RemoveItem(id, itemid, amount)
{
	if( amount == -1 || Bag[id][talpa:itemid] <= amount)
		Bag[id][talpa:itemid] = 0,
		cvector_remove(zBag[id], cvector_find(zBag[id], itemid));
	else
	    Bag[id][talpa:itemid] -= amount;
	if( Bag[id][talpa:itemid] == 0 && itemid > 24 && itemid < 38)
		RemovePlayerWeapon(id, itemid - 3);
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

stock CrashPlayer(pid)
{
	GameTextForPlayer(pid, "•¤¶§!$$%&'()*+,-./01~!@#$^&*()_-+={[}]:;'<,>.?/", 1000, 0);
 	GameTextForPlayer(pid, "•¤¶§!$$%&'()*+,-./01~!@#$^&*()_-+={[}]:;'<,>.?/", 2000, 1);
    GameTextForPlayer(pid, "•¤¶§!$$%&'()*+,-./01~!@#$^&*()_-+={[}]:;'<,>.?/", 3000, 2);
    GameTextForPlayer(pid, "•¤¶§!$$%&'()*+,-./01~!@#$^&*()_-+={[}]:;'<,>.?/", 4000, 3);
    GameTextForPlayer(pid, "•¤¶§!$$%&'()*+,-./01~!@#$^&*()_-+={[}]:;'<,>.?/", 5000, 4);
    GameTextForPlayer(pid, "•¤¶§!$$%&'()*+,-./01~!@#$^&*()_-+={[}]:;'<,>.?/", 6000, 5);
    GameTextForPlayer(pid, "•¤¶§!$$%&'()*+,-./01~!@#$^&*()_-+={[}]:;'<,>.?/", 7000, 6);
}

PUBLIC: update_xp(pid)
{
	new xp = GetPlayerScore(pid);
	if( ! zinfo[afk] )							SetPlayerScore(pid, xp + 1);
	if( pinfo[patirtis] == 1 && ! zinfo[afk] ) SetPlayerScore(pid, xp + 2);
	if( pinfo[patirtis] == 2 && ! zinfo[afk] ) SetPlayerScore(pid, xp + 3);
	if( pinfo[patirtis] == 3 && ! zinfo[afk] ) SetPlayerScore(pid, xp + 5);

	if( zinfo[afk]  ) 				   		   switch(random(1)){
													    case 0: SetPlayerScore(pid, xp + 1);
													    default:SetPlayerScore(pid, xp);  }
	if( pinfo[vip] == 1 && zinfo[afk] ) switch(random(1)){
														case 0: SetPlayerScore(pid, xp + 2);
														default:SetPlayerScore(pid, xp);   }
    if( pinfo[vip] == 2 && zinfo[afk] ) switch(random(1)){
														case 0: SetPlayerScore(pid, xp + 3);
														default:SetPlayerScore(pid, xp);   }
    if( pinfo[vip] == 3 && zinfo[afk] ) switch(random(1)){
														case 0: SetPlayerScore(pid, xp + 5);
														default:SetPlayerScore(pid, xp);   }
}

stock IsPlayerSpawned(pid){
	new statex = GetPlayerState(pid);
	if( statex != PLAYER_STATE_NONE && statex != PLAYER_STATE_WASTED && statex != PLAYER_STATE_SPAWNED) return true;
	return false;
}

stock UpdateWanted(pid)
{
	switch(pinfo[wanted])
	{
	    case 2..6: 		{
		                	ClearWanted(pid);
							TextDrawShowForPlayer(pid, twanted[0]);}
	    case 7..14: 	{
	                    	ClearWanted(pid);
							for(new i = 0; i <  2; i++) TextDrawShowForPlayer(pid, twanted[i]);}
	    case 15..25:	{
							ClearWanted(pid);
							for(new i = 0; i <  3; i++) TextDrawShowForPlayer(pid, twanted[i]);}
	    case 26..39:	{
							ClearWanted(pid);
							for(new i = 0; i <  4; i++) TextDrawShowForPlayer(pid, twanted[i]);}
	    case 40..56:	{
							ClearWanted(pid);
							for(new i = 0; i <  5; i++) TextDrawShowForPlayer(pid, twanted[i]);}
	    case 57..76:    {
	                    	ClearWanted(pid);
							for(new i = 0; i <  6; i++) TextDrawShowForPlayer(pid, twanted[i]);}
	    case 77..99:    {
	                    	ClearWanted(pid);
							for(new i = 0; i <  7; i++) TextDrawShowForPlayer(pid, twanted[i]);}
	    case 100..125:  {
	                    	ClearWanted(pid);
							for(new i = 0; i <  8; i++) TextDrawShowForPlayer(pid, twanted[i]);}
	    case 126..149:  {
	                    	ClearWanted(pid);
							for(new i = 0; i <  9; i++) TextDrawShowForPlayer(pid, twanted[i]);}
	    case 150:    	for(new i = 0; i <  10; i++) TextDrawShowForPlayer(pid, twanted[i]);
	    default:        ClearWanted(pid);
	}
}

stock ClearWanted(pid)
{
	for(new i = 9; i >= 0; i--)
							TextDrawHideForPlayer(pid, twanted[i]);
}

//--------------------------------------------------

PUBLIC: check_cars()
	{
		new Float:zAngle;
	    if( oldwood_car[0] != -1)
	    {
		    RepairVehicle(oldwood_car[0]);
		    GetVehicleZAngle(oldwood_car[0], zAngle);
			if( GetVehicleDistanceFromPoint(oldwood_car[0], 196.5234,-245.7334,1.1437) > 2 || zAngle > 280 || zAngle < 260){
				SetVehiclePos(oldwood_car[0],196.5234,-245.7334,1.1437);
				SetVehicleZAngle(oldwood_car[0], 270);
			}
		}
        if( oldwood_car[1] != -1)
        {
			RepairVehicle(oldwood_car[1]);
		    GetVehicleZAngle(oldwood_car[1], zAngle);
			if( GetVehicleDistanceFromPoint(oldwood_car[1], 196.5234,-240.7334,1.1437) > 2 || zAngle > 280 || zAngle < 260){
 				SetVehiclePos(oldwood_car[1],196.5234,-240.7334,1.1437);
 				SetVehicleZAngle(oldwood_car[1], 270);
  		 	}
		}
	    if( oldwood_car[2] != -1)
	    {
	    	RepairVehicle(oldwood_car[2]);
		    GetVehicleZAngle(oldwood_car[2], zAngle);
			if( GetVehicleDistanceFromPoint(oldwood_car[2], 196.5234,-235.7334,1.1437) > 2 || zAngle > 280 || zAngle < 260){
		    	SetVehiclePos(oldwood_car[2],196.5234,-235.7334,1.1437);
		    	SetVehicleZAngle(oldwood_car[2], 270);
			}
		}
		if( oldwood_car[3] != -1)
		{
	 		RepairVehicle(oldwood_car[3]);
		    GetVehicleZAngle(oldwood_car[3], zAngle);
			if( GetVehicleDistanceFromPoint(oldwood_car[3], 196.5234,-230.7334,1.1437) > 2 || zAngle > 280 || zAngle < 260){
		    	SetVehiclePos(oldwood_car[3],196.5234,-230.7334,1.1437);
		    	SetVehicleZAngle(oldwood_car[3], 270);
		    }
		}
	    if( oldwood_car[4] != -1)
	    {
	    	RepairVehicle(oldwood_car[4]);
		    GetVehicleZAngle(oldwood_car[4], zAngle);
			if( GetVehicleDistanceFromPoint(oldwood_car[4], 217.4459,-245.4855,1.1437) > 2 || zAngle > 100 || zAngle < 80){
		    	SetVehiclePos(oldwood_car[4],217.4459,-245.4855,1.1437);
		    	SetVehicleZAngle(oldwood_car[4], 90);
		    }
		}
	    if( oldwood_car[5] != -1)
		{
	    	RepairVehicle(oldwood_car[5]);
		    GetVehicleZAngle(oldwood_car[5], zAngle);
			if( GetVehicleDistanceFromPoint(oldwood_car[5], 217.4459,-240.4855,1.1437) > 2 || zAngle > 100 || zAngle < 80){
		    	SetVehiclePos(oldwood_car[5],217.4459,-240.4855,1.1437);
		    	SetVehicleZAngle(oldwood_car[5], 90);
		    }
		}
	    if( oldwood_car[6] != -1)
	    {
	    	RepairVehicle(oldwood_car[6]);
		    GetVehicleZAngle(oldwood_car[6], zAngle);
			if( GetVehicleDistanceFromPoint(oldwood_car[6], 217.4459,-235.4855,1.1437) > 2 || zAngle > 100 || zAngle < 80){
		    	SetVehiclePos(oldwood_car[6],217.4459,-235.4855,1.1437);
		    	SetVehicleZAngle(oldwood_car[6], 90);
		    }
		}
	    if( oldwood_car[7] != -1)
	    {
	    	RepairVehicle(oldwood_car[7]);
		    GetVehicleZAngle(oldwood_car[7], zAngle);
			if( GetVehicleDistanceFromPoint(oldwood_car[7], 217.4459,-230.4855,1.1437) > 2 || zAngle > 100 || zAngle < 80){
		    	SetVehiclePos(oldwood_car[7],217.4459,-230.4855,1.1437);
		    	SetVehicleZAngle(oldwood_car[7], 90);
			}
		}
		return 1;
	}

//--------------------------------------------------

stock degaline(pid)
	{
	    if( IsPlayerInAnyVehicle(pid))
	    {
		    RemovePlayerFromVehicle(pid);

		    ipilti_degalai p[0] = 0;
		    ipilti_degalai p[1] = 0;
		    ipilti_degalai p[2] = 0;
		    ipilti_degalai p[3] = 0;
		    //Kuras    Kaina
		    // 567 	  10 893
			PlayerTextDrawShow(pid, kuro_kaina2 p);
			PlayerTextDrawShow(pid, kuro_kaina3 p);
			PlayerTextDrawShow(pid, kuro_kaina5 p);
			PlayerTextDrawShow(pid, kuro_kaina6 p);
			PlayerTextDrawShow(pid, kuro_kaina7 p);
			PlayerTextDrawShow(pid, kuro_kaina8 p);
			PlayerTextDrawShow(pid, kuro_kaina9 p);
			PlayerTextDrawShow(pid, kuro_kaina10 p);
			PlayerTextDrawShow(pid, kuro_kaina11 p);
			ApplyAnimation(pid, "VENDING", "VEND_Use", 1, 0, 0, 0, 0, 1500, 1);
	    }
	}

//--------------------------------------------------
PUBLIC: degaline_use(pid)
	{
	    freeze(pid);
	    new string[2];
        car[pcd p][degalai]++;
        ipilti_degalai p[0]++;
        ipilti_degalai p[3]++;
        if( ipilti_degalai p[3] == 10){ ipilti_degalai p[3] = 0; ipilti_degalai p[2]++; }
        if( ipilti_degalai p[2] == 10){ ipilti_degalai p[2] = 0; ipilti_degalai p[1]++; }
        
        ipilti_kaina p[0]+=3;
        ipilti_kaina p[4]+=3;
        if( ipilti_kaina p[4] == 12){ ipilti_kaina p[4] = 2; ipilti_kaina p[3]++; }
        if( ipilti_kaina p[4] == 11){ ipilti_kaina p[4] = 1; ipilti_kaina p[3]++; }
        if( ipilti_kaina p[4] == 10){ ipilti_kaina p[4] = 0; ipilti_kaina p[3]++; }
        if( ipilti_kaina p[3] == 10){ ipilti_kaina p[3] = 0; ipilti_kaina p[2]++; }
        if( ipilti_kaina p[2] == 10){ ipilti_kaina p[2] = 0; ipilti_kaina p[1]++; }

		format(string, 2, "%i", ipilti_degalai p[3]);
		PlayerTextDrawSetString(pid,kuro_kaina7 p, string);
		format(string, 2, "%i", ipilti_degalai p[2]);
		PlayerTextDrawSetString(pid,kuro_kaina6 p, string);
		format(string, 2, "%i", ipilti_degalai p[1]);
		PlayerTextDrawSetString(pid,kuro_kaina5 p, string);
		
		format(string, 2, "%i", ipilti_kaina p[4]);
		PlayerTextDrawSetString(pid,kuro_kaina3 p, string);
		format(string, 2, "%i", ipilti_kaina p[3]);
		PlayerTextDrawSetString(pid,kuro_kaina9 p, string);
		format(string, 2, "%i", ipilti_kaina p[2]);
		PlayerTextDrawSetString(pid,kuro_kaina8 p, string);
		format(string, 2, "%i", ipilti_kaina p[1]);
		PlayerTextDrawSetString(pid,kuro_kaina10 p, string);

	    return 1;
	}

//--------------------------------------------------

stock freeze(pid)
{
   	TogglePlayerControllable(pid, 0);
}

stock freezeEx(pid)
{
	new Float:vX, Float:vY, Float:vZ, Float:vA;
	GetXYInFrontOfPlayer(pid, vX, vY, vZ, vA, 6);
	vX = vX + random(3) + 2;
	vY = vY + random(3) + 2;
	SetPlayerCameraPos(pid, vX, vY, vZ + 4);
	GetPlayerPos(pid, vX,vY,vZ);
	SetPlayerCameraLookAt(pid,vX,vY,vZ,CAMERA_MOVE);
	freeze(pid);
}

//--------------------------------------------------

stock unfreeze(pid)
{
   	TogglePlayerControllable(pid, 1);
}

stock unfreezeEx(pid)
{
    TogglePlayerControllable(pid, 1);
	SetCameraBehindPlayer(pid);
	ClearAnimations(pid);
}

//--------------------------------------------------

PUBLIC: car_degalai(pid)
	{
	    if( IsPlayerDriver(pid))
	    {
		    new bool: e[7], vehid = GetPlayerVehicleID(pid);
		    GetVehicleParamsEx(vehid, e[6], e[0], e[1], e[2], e[3], e[4], e[5]);

		    if( car[vehid][degalai] > 0)
		    {
				if( ! e[6] ) SetVehicleParamsEx(vehid, true, e[0], e[1], e[2], e[3], e[4], e[5]);
		 		car[vehid][degalai]--;
	 		}
	 		if( car[vehid][degalai] < 1)
	 		{
				SetVehicleParamsEx(vehid, false, e[0], e[1], e[2], e[3], e[4], e[5]);
				notification(pid, "Nebera degalu");
			}
		}
	}
	
stock spawn_from_reg(pid)
{
    	//timer_car_check p = SetTimerEx("check_player_car", 10000, true, "i", pid);
		new string[256];
		
		strdel(string0,0,2050);
	    format(string, 256, "{FFAE00}|____________________________________|Serverio ReadMe|____________________________________|\n{96FF00}%s,\nmalonu kad prisijungei prie mûsø!\n\n", GetPlayerNameEx(pid));
	    format(string0, 2050, string);
		strcat(string0, "{89B0FF}Kad þaidimas bûtø kiek ámanoma malonesnis, rekomenduoju perskaityti \ninformacijà, pateiktà þemiau. \n\nVisø pirma, praktiðkai visos durys, visi vartai yra darinëjami su ENTER.");
		strcat(string0, "Taip pat ir su \nNPC.\n \nAntra, jeigu tik kokia techninë bëda iðtiko, visada yra komanda /fix. Ji automatiðkai \naptiks ir sutvarkys mums þinomus bugus, kuriø iðtaisyti neina. \n\n");
		strcat(string0, "Treèia, negadinkite sau nervø ir neeksperementuokite su anti èytu. Að tikrai neturiu \ndidelio noro klausytis kaip èia netyèia viskas buvo, kaip jûs nieko nedarëte, bet \nmaðina pati ");
		strcat(string0, "uþsitiuningavo arba kaþkas á jus atsitrenkë ir jûs nuskridote +300km/h \ngreièiu tiesiai á mechanikø garaþà kur jums susitaisë maðina. Serveryje yra \npasiekimø sistema. Visi þaidëjai ");
		strcat(string0, "pasiekæ 100k patirties be jokio kicko ar bano nuo \nantièyto, gaus prizà. O að dosnus. Jeigu per visiðkà atsitiktinumà buvote neteisingai \niðmetas ar uþbanintas, ir jeigu tai árodysite ");
	 	strcat(string0, "kickas ar banas bus anuliuotas.\n\nNa ir visà detalesnæ informacijà rasite paraðæ komandà '/apie'.\n\nSëkmës þaidime!");
		ShowDialog(pid, Show:<readme>, DIALOG_STYLE_MSGBOX, "{FFA031}Story of Cities", string0, "Þaisti! :)", "");
}

//--------------------------------------------------
PUBLIC: CheckPaused()
{
	foreach(new i : Player)
	{
	    if( afkc[i] > 2 && ! pBools[i][afk] )
		{
			pBools[i][afk] = true;
			CallLocalFunction("OnPlayerPause","i",i);
		}
		else if( afkc[i] < 3 && pBools[i][afk] )
		{
		    pBools[i][afk] = false;
	        CallLocalFunction("OnPlayerUnpause","i",i);
		}
		afkc[i]++;
	}
	return 1;
}

PUBLIC: car_buy_timer(pid)
	{
	    if( !IsPlayerInCircle(pid,207.3731,-237.1049, 25))
	    {
			if( IsPlayerInVehicle(pid, pinfo[carid]))
			{
   				new Float:owx,Float:owy,Float:owz, Float:owr;
			    c11 = random(6)+32; c12 = random(6)+32;
				c21 = random(6)+32; c22 = random(6)+32;
				c31 = random(6)+32; c32 = random(6)+32;
				c41 = random(6)+32; c42 = random(6)+32;
				c51 = random(6)+32; c52 = random(6)+32;
				c61 = random(6)+32; c62 = random(6)+32;
				c71 = random(6)+32; c72 = random(6)+32;
				c81 = random(6)+32; c82 = random(6)+32;

			    if( oldwood_car[0] == -1)
			    {
					oldwood_car[0] = CreateVehicle(475,196.5234,-245.7334,4.3920,270,c11,c12, 1000);
                    c[oldwood_car[0]][0] = c11;   c[oldwood_car[0]][1] = c12;
					car_sold[0] = false;
					
					GetXYInFrontOfVehicle(oldwood_car[0], owx, owy, owz, owr, 1);
					SetDynamicObjectMaterialText(oldwood_carname[0],0,GetVehicleName(oldwood_car[0]), OBJECT_MATERIAL_SIZE_256x128,"Impact",72,1,0xFFFFFFFF,0,OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
					AttachDynamicObjectToVehicle(oldwood_carname[0],oldwood_car[0],0,1.5,0.65, 0,0,180);
					
					KillTimer(timer_car_buy p);
				}
				if( oldwood_car[1] == -1)
			    {
					oldwood_car[1] = CreateVehicle(410,196.5234,-240.7334,4.3920,270,c21,c22, 1000);
                    c[oldwood_car[1]][0] = c21;   c[oldwood_car[1]][1] = c22;
					car_sold[1] = false;
					
					GetXYInFrontOfVehicle(oldwood_car[1], owx, owy, owz, owr, 1);
					SetDynamicObjectMaterialText(oldwood_carname[1],0,GetVehicleName(oldwood_car[1]), OBJECT_MATERIAL_SIZE_256x128,"Impact",72,1,0xFFFFFFFF,0,OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
					AttachDynamicObjectToVehicle(oldwood_carname[1],oldwood_car[1],0,1.5,0.65, 0,0,180);
					
					KillTimer(timer_car_buy p);
				}
				if( oldwood_car[2] == -1)
			    {
					oldwood_car[2] = CreateVehicle(412,196.5234,-235.7334,4.3920,270,c31,c32, 1000);
                    c[oldwood_car[2]][0] = c31;   c[oldwood_car[2]][1] = c32;
					car_sold[2] = false;
					
					GetXYInFrontOfVehicle(oldwood_car[2], owx, owy, owz, owr, 1);
					SetDynamicObjectMaterialText(oldwood_carname[2],0,GetVehicleName(oldwood_car[2]), OBJECT_MATERIAL_SIZE_256x128,"Impact",72,1,0xFFFFFFFF,0,OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
					AttachDynamicObjectToVehicle(oldwood_carname[2],oldwood_car[2],0,1.5,0.65, 0,0,180);
					
					KillTimer(timer_car_buy p);
				}
				if( oldwood_car[3] == -1)
			    {
					oldwood_car[3] = CreateVehicle(419,196.5234,-230.7334,4.3920,270,c41,c42, 1000);
                    c[oldwood_car[3]][0] = c41;   c[oldwood_car[3]][1] = c42;
					car_sold[3] = false;
					
					GetXYInFrontOfVehicle(oldwood_car[3], owx, owy, owz, owr, 1);
					SetDynamicObjectMaterialText(oldwood_carname[3],0,GetVehicleName(oldwood_car[3]), OBJECT_MATERIAL_SIZE_256x128,"Impact",72,1,0xFFFFFFFF,0,OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
					AttachDynamicObjectToVehicle(oldwood_carname[3],oldwood_car[3],0,1.5,0.65, 0,0,180);
					
					KillTimer(timer_car_buy p);
				}
				if( oldwood_car[4] == -1)
			    {
					oldwood_car[4] = CreateVehicle(492,217.4459,-245.4855,1.4120,90,c51,c52, 1000);
                    c[oldwood_car[4]][0] = c51;   c[oldwood_car[4]][1] = c52;
					car_sold[4] = false;
					
					GetXYInFrontOfVehicle(oldwood_car[4], owx, owy, owz, owr, 1);
					SetDynamicObjectMaterialText(oldwood_carname[4],0,GetVehicleName(oldwood_car[4]), OBJECT_MATERIAL_SIZE_256x128,"Impact",72,1,0xFFFFFFFF,0,OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
					AttachDynamicObjectToVehicle(oldwood_carname[4],oldwood_car[4],0,1.5,0.65, 0,0,180);
					
					KillTimer(timer_car_buy p);
				}
				if( oldwood_car[5] == -1)
			    {
					oldwood_car[5] = CreateVehicle(549,217.4459,-240.4855,1.4120,90,c61,c62, 1000);
                    c[oldwood_car[5]][0] = c61;   c[oldwood_car[5]][1] = c62;
					car_sold[5] = false;
					
					GetXYInFrontOfVehicle(oldwood_car[5], owx, owy, owz, owr, 1);
					SetDynamicObjectMaterialText(oldwood_carname[5],0,GetVehicleName(oldwood_car[5]), OBJECT_MATERIAL_SIZE_256x128,"Impact",72,1,0xFFFFFFFF,0,OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
					AttachDynamicObjectToVehicle(oldwood_carname[5],oldwood_car[5],0,1.5,0.65, 0,0,180);
					
					KillTimer(timer_car_buy p);
				}
				if( oldwood_car[6] == -1)
			    {
					oldwood_car[6] = CreateVehicle(462,217.4459,-235.4855,1.4120,90,c71,c72, 1000);
                    c[oldwood_car[6]][0] = c71;   c[oldwood_car[6]][1] = c72;
					car_sold[6] = false;
					
					GetXYInFrontOfVehicle(oldwood_car[6], owx, owy, owz, owr, 1);
					SetDynamicObjectMaterialText(oldwood_carname[6],0,GetVehicleName(oldwood_car[6]), OBJECT_MATERIAL_SIZE_256x128,"Impact",72,1,0xFFFFFFFF,0,OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
					AttachDynamicObjectToVehicle(oldwood_carname[6],oldwood_car[6],0,1.5,0.65, 0,0,180);
					
					KillTimer(timer_car_buy p);
				}
				if( oldwood_car[7] == -1)
			    {
					oldwood_car[7] = CreateVehicle(542,217.4459,-230.4855,1.4120,90,c81,c82, 1000);
                    c[oldwood_car[7]][0] = c81;   c[oldwood_car[7]][1] = c82;
					car_sold[7] = false;
					
					GetXYInFrontOfVehicle(oldwood_car[7], owx, owy, owz, owr, 1);
					SetDynamicObjectMaterialText(oldwood_carname[7],0,GetVehicleName(oldwood_car[7]), OBJECT_MATERIAL_SIZE_256x128,"Impact",72,1,0xFFFFFFFF,0,OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
					AttachDynamicObjectToVehicle(oldwood_carname[7],oldwood_car[7],0,1.5,0.65, 0,0,180);
					
					KillTimer(timer_car_buy p);
				}
			}
	    }
	}

new lastspeed[MAX_PLAYERS],
	Float:vhp[MAX_PLAYERS][2],
	Float:a_vvel[MAX_VEHICLES][3];

PUBLIC: spd()
{
	foreach (new i : Player)
	{
	    if( IsPlayerDriver(i))
	    {
			new string[16], x = GetPlayerSpeed(i, false), m = GetPlayerVehicleID(i);
		 	GetVehicleHealth(m,vhp[i][0]);
			if( lastspeed[i] > x-90 && vhp[i][0] < vhp[i][1] - 400.0)
			{
				avarija(i,m);
				return 1;
			}
			if( x > 300)
			{
			    TogglePlayerControllable(i, false);
			    SetTimerEx("tpct", 3000, false, "i", i);
			    return 1;
			}
			format(string, 16, "%i", x);
			PlayerTextDrawSetString(i,spd2[i], string);

			car[m][rida] += (float(x) / 18000);

			format(string, 16, "%i", car[m][degalai]);
			PlayerTextDrawSetString(i,spd8[i], string);

			format(string, 16, "%.1f", car[m][rida]);
			PlayerTextDrawSetString(i,spd9[i], string);
			vhp[i][1] = vhp[i][0];
			lastspeed[i] = x;
			GetVehicleVelocity(m, a_vvel[m][0],a_vvel[m][1],a_vvel[m][2]);
		}
	}
	return 1;
}

stock avarija(pid,m)
{
	ClearAnimations(pid);
    ApplyAnimation(pid, "PARACHUTE", "FALL_skyDive_DIE",4,0,0,0,1,0);
	new Float:px, Float:py, Float:pz;
	GetVehiclePos(m, px,py,pz);
	SetPlayerPos(pid, px,py,pz+2);
	SetPlayerVelocity(pid,a_vvel[m][0],a_vvel[m][1],pz+1);
	SendClientMessage(pid, COLOR_NO, "Bum");
	lastspeed p = 0;
	vhp p[1] = 0;
	//SetTimer("tpct", 2000, false);
}

PUBLIC: tpct(pid)
{
    TogglePlayerControllable(pid, true);
}

//--------------------------------------------------

stock add_shop_item(shopid, itemid)
{

}

stock del_shop_item(shopid, itemid)
{

}

stock IsItemInShop(shopid, itemid)
{

}

stock SaveShops()
{

}

stock LoadShops()
{

}

stock ReloadShops()
{

}

//--------------------------------------------------


stock hide_bag(pid)
{
	for(new i = 0; i < 65; i++)
	    PlayerTextDrawHide(pid, iBag p[i]);
    HidePlayerProgressBar(pid, BagTalpa p);
}

stock load_bag(pid,side = 0) // kkk
{
	hide_bag(pid);
	new fitem = 0,
    	string[32], n = 12,j = 0,
    	Float:itembagsvoris;
    	
    switch(side)
	{
	    case 0: fitem = 0;
	    case 1: fitem = LoadBagNext(pid);
	    case 2: fitem = LoadBagPrev(pid);
	    case 3: fitem = GetCurrentPage(pid);
	}
        
    format(string, 32, "%i", BagUse p[pageid]+1);
	PlayerTextDrawSetString(pid, iBag p[11],string);
	PlayerTextDrawShow(pid, iBag p[11]);
        
	menu_selected p = MENU_BAG;
	BagUse p[lastitem] = PlayerText:-1;
	BagUse p[selecteditem] = PlayerText:-1;
	BagUse p[item] = -1;
	BagUse p[row13] = -1;

	for(new i = 0; i < 12; i++)
    	PlayerTextDrawShow(pid, iBag p[i]);
    	
    PlayerTextDrawShow(pid, iBag p[64]);
    
	SetPlayerProgressBarValue(pid, BagTalpa p, GetBagWeight(pid));
    ShowPlayerProgressBar(pid, BagTalpa p);
    if( BagUse p[pageid] == 0)
		PlayerTextDrawHide(pid, iBag p[10]);
	else
	    PlayerTextDrawShow(pid, iBag p[10]);
    if( BagUse p[pageid]+1 == GetMaxPages(pid))
        PlayerTextDrawHide(pid, iBag p[9]);
	else
        PlayerTextDrawShow(pid, iBag p[9]);
    UpdateAmmo(pid);
	if( !IsBagEmpty(pid))
	/*	for(new i = fitem; talpa:i < talpa && j < 13; i++)
		{*/
		for(new idx=fitem, i=0; idx < cvector_capacity(zBag p) && j < 13; idx++)
		{
        	i = cvector_get(zBag p, idx);
			if( GetItemAmount(pid, i) == 0) continue;
			BagUse p[bagedit:j] = i;
			j++;

			if( Used p[i]  )
				PlayerTextDrawColor( pid, iBag p[n], COLOR_OK);
			else
				PlayerTextDrawColor( pid, iBag p[n], -1);
				
			format(string, 32, "%s", ItemName[i]);
			PlayerTextDrawSetString(pid,iBag p[n], string);
			PlayerTextDrawShow(pid, iBag p[n]);
				n++;
			format(string, 32, "%i",GetItemAmount(pid, i));
			PlayerTextDrawSetString(pid,iBag p[n], string);
			PlayerTextDrawShow(pid, iBag p[n]);
				n++;
			itembagsvoris = GetPlayerItemsWeight(pid, i);
			format(string, 32, "%.1fkg",itembagsvoris / 1000);
			PlayerTextDrawSetString(pid,iBag p[n], string);
			PlayerTextDrawShow(pid, iBag p[n]);
				n++;
			format(string, 32, "%i",GetPlayerItemsValue(pid, i));
			PlayerTextDrawSetString(pid,iBag p[n], string);
			PlayerTextDrawShow(pid, iBag p[n]);
				n++;
		}
}

stock LoadBagNext(pid)
{
    BagUse p[pageid]++;
	new /*j = 0, */pg = BagUse p[pageid] * 13;
	for(new j=0; j < cvector_capacity(zBag p); j++)
	    if(j == pg)
	        return j;
/*	for(new i = 0; talpa:i < talpa; i++)
	{
	    if( GetItemAmount(pid, i) == 0) continue;
	    else j++;
	    if( j == pg)
	        return i;
	}*/
	return 0;
}

stock LoadBagPrev(pid)
{
    BagUse p[pageid]--;
	new /*j = 0, */pg = BagUse p[pageid] * 13;
	for(new j=0; j < cvector_capacity(zBag p); j++)
	    if(j == pg)
	        return j;
	        
/*	for(new i = 0; talpa:i < talpa; i++)
	{
	    if( GetItemAmount(pid, i) == 0) continue;
	    else j++;
	    if( j == pg)
	    	return j;
	}*/
	return 0;
}

stock GetCurrentPage(pid)
{
    new /*j = 0,*/ pg = BagUse p[pageid] * 13;
    for(new j=0; j < cvector_capacity(zBag p); j++)
	    if(j == pg)
	        return j;
	        
/*	for(new i = 0; talpa:i < talpa; i++)
	{
	    if( GetItemAmount(pid, i) == 0) continue;
	    else j++;
	    if( j == pg)
	    	return i;
	}*/
	return 0;
}

stock GetMaxPages(pid)
{
	if( IsBagEmpty(pid)) return 1;
	new j = 0, pages = 0;
	for(new i = 0; talpa:i < talpa; i++)
	    if( GetItemAmount(pid, i) == 0) continue;
	    else j++;
	while(j >= 13)
	{
		j -= 13;
		pages++;
	}
	if( j == 0) return pages;
	else return pages+1;
}

stock UpdateAmmo(pid)
{
	new wepid,ammo;
	for(new i = 62; i < 68; i++)
	{
	    GetPlayerWeaponData(pid, i, wepid, ammo);
	    if( wepid != 0)
			Bag p[talpa:i] = ammo;
	}
}

stock notification(pid, text[], time = 0, repeat = 0)
{
	if(!time)
	    show_notification(pid, text);
	else
	    SetTimerEx("show_notification", time, repeat, "is", pid, text);
	return 1;
}

forward show_notification(pid, text[]);
public show_notification(pid, text[])
{
	KillTimer(timer_notification p);
    PlayerTextDrawShow(pid, Notification0 p);
	PlayerTextDrawShow(pid, Notification1 p);
	PlayerTextDrawSetString(pid,Notification1 p, text);
	timer_notification p = SetTimerEx("hide_notification", 2000, false, "i", pid);
	return 1;
}

PUBLIC: hide_notification(pid)
{
	PlayerTextDrawHide(pid, Notification0 p);
    PlayerTextDrawHide(pid, Notification1 p);
}

stock show_menu(pid)
{
	PlayerTextDrawSetSelectable( pid, menu2 p,  1);
	PlayerTextDrawSetSelectable( pid, menu3 p,  1);
	PlayerTextDrawSetSelectable( pid, menu4 p,  1);
	PlayerTextDrawSetSelectable( pid, menu5 p,  1);
	PlayerTextDrawSetSelectable( pid, menu6 p,  1);
	PlayerTextDrawSetSelectable( pid, menu7 p,  1);
	PlayerTextDrawSetSelectable( pid, menu8 p,  1);
	PlayerTextDrawSetSelectable( pid, menu9 p,  1);
	PlayerTextDrawSetSelectable( pid, menu10 p, 1);
	PlayerTextDrawSetSelectable( pid, menu11 p, 1);
	PlayerTextDrawSetSelectable( pid, menu14 p, 1);

	PlayerTextDrawShow(pid, menu1 p);
	PlayerTextDrawShow(pid, menu2 p);
	PlayerTextDrawShow(pid, menu3 p);
	PlayerTextDrawShow(pid, menu4 p);
	PlayerTextDrawShow(pid, menu5 p);
	PlayerTextDrawShow(pid, menu6 p);
	PlayerTextDrawShow(pid, menu7 p);
	PlayerTextDrawShow(pid, menu8 p);
	PlayerTextDrawShow(pid, menu9 p);
	PlayerTextDrawShow(pid, menu10 p);
	PlayerTextDrawShow(pid, menu11 p);
	PlayerTextDrawShow(pid, menu12 p);
	PlayerTextDrawShow(pid, menu14 p);
}
stock hide_menu(pid)
{
    menu_selected p = 0;
	PlayerTextDrawHide(pid, menu1 p);
	PlayerTextDrawHide(pid, menu2 p);
	PlayerTextDrawHide(pid, menu3 p);
	PlayerTextDrawHide(pid, menu4 p);
	PlayerTextDrawHide(pid, menu5 p);
	PlayerTextDrawHide(pid, menu6 p);
	PlayerTextDrawHide(pid, menu7 p);
	PlayerTextDrawHide(pid, menu8 p);
	PlayerTextDrawHide(pid, menu9 p);
	PlayerTextDrawHide(pid, menu10 p);
	PlayerTextDrawHide(pid, menu11 p);
	PlayerTextDrawHide(pid, menu12 p);
	PlayerTextDrawHide(pid, menu14 p);
}

stock hide_oldwood(pid)
{
	PlayerTextDrawHide(pid, oldWood_greitis p);
	PlayerTextDrawHide(pid, oldWood_kuras p);
	PlayerTextDrawHide(pid, oldWood_kaina p);
	TextDrawHideForPlayer(pid, oldWood);
	TextDrawHideForPlayer(pid, oldWood_atgal);
	TextDrawHideForPlayer(pid, oldWood_pirmyn);
	TextDrawHideForPlayer(pid, oldWood_iseiti);
	TextDrawHideForPlayer(pid, oldWood_pirkti);
	TextDrawHideForPlayer(pid, oldWood_info);
}

stock menu_gps(pid)
{
	menu_selected p = MENU_GPS;
    PlayerTextDrawSetString(pid, menu1 p, "GPS~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~");
	PlayerTextDrawSetString(pid, menu2 p, "Darbai");
	PlayerTextDrawSetString(pid, menu3 p, "Parduotuves");
	PlayerTextDrawSetString(pid, menu4 p, "Degaline");
	PlayerTextDrawSetString(pid, menu5 p, "Ligonine");
	PlayerTextDrawSetString(pid, menu6 p, "Savivaldybes");
	PlayerTextDrawSetString(pid, menu7 p, "Busto nuoma");
	PlayerTextDrawSetString(pid, menu8 p, "Nustatymai");
	PlayerTextDrawSetString(pid, menu9 p, " ");
	PlayerTextDrawSetString(pid, menu10 p, " ");
	PlayerTextDrawSetString(pid, menu14 p, "Kita");
}

stock menu_pmenu(pid)
{
	menu_selected p = MENU_PMENU;
    PlayerTextDrawSetString(pid, menu1 p, "Zaidejo meniu~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~");
	if( IsPlayerInCircle(pid,64.1340,-229.7443, 10) || IsPlayerInCircle(pid, 2237.4167,27.6812,10) && IsPlayerDriver(pid) && ! zinfo[pila_degalus] )
		    PlayerTextDrawSetString(pid, menu2 p, "Pilti degalus");
	else    PlayerTextDrawSetString(pid, menu2 p, " ");
	PlayerTextDrawSetString(pid, menu3 p, " ");
	PlayerTextDrawSetString(pid, menu4 p, " ");
	PlayerTextDrawSetString(pid, menu5 p, "Kuprine");
	PlayerTextDrawSetString(pid, menu6 p, "Draugai");
	PlayerTextDrawSetString(pid, menu7 p, "Namas");
	PlayerTextDrawSetString(pid, menu8 p, "Transportas");
	PlayerTextDrawSetString(pid, menu9 p, "Taskai");
	PlayerTextDrawSetString(pid, menu10 p, "World");
	PlayerTextDrawSetString(pid, menu14 p, "vip meniu");
}

stock oldwood_LoadNext(pid)
{
if( oldwood_selected p < 1 || oldwood_selected p > 8)
				oldwood_selected p = 1;

		    switch(oldwood_selected p)
		    {
		        case 1:
		        {
			        SetPlayerCameraPos(pid, 203.5217,-238.0611,1.25);
		            SetPlayerCameraLookAt(pid, 196.5234,-240.7334,1.3920, CAMERA_MOVE);

		            PlayerTextDrawSetString(pid,oldWood_greitis p,oldwoodcars[oldwood_selected p][oWgreitis]);
		            PlayerTextDrawSetString(pid,oldWood_kuras p,oldwoodcars[oldwood_selected p][oWkuras]);
		            if( !pinfo[vip])
		            	PlayerTextDrawSetString(pid,oldWood_kaina p,strfloat(oldwoodcars[oldwood_selected p][oWkaina]));
					else
					    PlayerTextDrawSetString(pid,oldWood_kaina p,strfloat(oldwoodcars[oldwood_selected p][oWkaina]*0.7));

				    oldwood_selected p = 2;
				    return 1;
			    }
			    case 2:
		        {
			        SetPlayerCameraPos(pid, 203.5217,-233.0611,1.25);
	            	SetPlayerCameraLookAt(pid, 196.5234,-235.7334,1.3920, CAMERA_MOVE);

		            PlayerTextDrawSetString(pid,oldWood_greitis p,oldwoodcars[oldwood_selected p][oWgreitis]);
		            PlayerTextDrawSetString(pid,oldWood_kuras p,oldwoodcars[oldwood_selected p][oWkuras]);
		            if( !pinfo[vip])
		            	PlayerTextDrawSetString(pid,oldWood_kaina p,strfloat(oldwoodcars[oldwood_selected p][oWkaina]));
					else
					    PlayerTextDrawSetString(pid,oldWood_kaina p,strfloat(oldwoodcars[oldwood_selected p][oWkaina]*0.7));

				    oldwood_selected p = 3;
				    return 1;
			    }
			    case 3:
		        {
			        SetPlayerCameraPos(pid, 203.5217,-228.0611,1.25);
	            SetPlayerCameraLookAt(pid, 196.5234,-230.7334,1.3920, CAMERA_MOVE);

		            PlayerTextDrawSetString(pid,oldWood_greitis p,oldwoodcars[oldwood_selected p][oWgreitis]);
		            PlayerTextDrawSetString(pid,oldWood_kuras p,oldwoodcars[oldwood_selected p][oWkuras]);
		            if( !pinfo[vip])
		            	PlayerTextDrawSetString(pid,oldWood_kaina p,strfloat(oldwoodcars[oldwood_selected p][oWkaina]));
					else
					    PlayerTextDrawSetString(pid,oldWood_kaina p,strfloat(oldwoodcars[oldwood_selected p][oWkaina]*0.7));

				    oldwood_selected p = 4;
				    return 1;
			    }
			    case 7:
		        {
			        SetPlayerCameraPos(pid, 211.7014,-228.3306,1.25);
	            	SetPlayerCameraLookAt(pid,217.4459,-230.4855,1.4120, CAMERA_MOVE);

		            PlayerTextDrawSetString(pid,oldWood_greitis p,oldwoodcars[oldwood_selected p][oWgreitis]);
		            PlayerTextDrawSetString(pid,oldWood_kuras p,oldwoodcars[oldwood_selected p][oWkuras]);
		            if( !pinfo[vip])
		            	PlayerTextDrawSetString(pid,oldWood_kaina p,strfloat(oldwoodcars[oldwood_selected p][oWkaina]));
					else
					    PlayerTextDrawSetString(pid,oldWood_kaina p,strfloat(oldwoodcars[oldwood_selected p][oWkaina]*0.7));

				    oldwood_selected p = 8;
				    return 1;
			    }
			    case 6:
		        {
			        SetPlayerCameraPos(pid, 211.7014,-233.3306,1.25);
			    	SetPlayerCameraLookAt(pid, 217.4459,-235.4855,1.4120, CAMERA_MOVE);

		            PlayerTextDrawSetString(pid,oldWood_greitis p,oldwoodcars[oldwood_selected p][oWgreitis]);
		            PlayerTextDrawSetString(pid,oldWood_kuras p,oldwoodcars[oldwood_selected p][oWkuras]);
		            if( !pinfo[vip])
		            	PlayerTextDrawSetString(pid,oldWood_kaina p,strfloat(oldwoodcars[oldwood_selected p][oWkaina]));
					else
					    PlayerTextDrawSetString(pid,oldWood_kaina p,strfloat(oldwoodcars[oldwood_selected p][oWkaina]*0.7));

				    oldwood_selected p = 7;
				    return 1;
			    }
			    case 5:
		        {
			        SetPlayerCameraPos(pid, 211.7014,-238.3306,1.25);
	           	 	SetPlayerCameraLookAt(pid, 217.4459,-240.4855,1.4120, CAMERA_MOVE);

		            PlayerTextDrawSetString(pid,oldWood_greitis p,oldwoodcars[oldwood_selected p][oWgreitis]);
		            PlayerTextDrawSetString(pid,oldWood_kuras p,oldwoodcars[oldwood_selected p][oWkuras]);
		            if( !pinfo[vip])
		            	PlayerTextDrawSetString(pid,oldWood_kaina p,strfloat(oldwoodcars[oldwood_selected p][oWkaina]));
					else
					    PlayerTextDrawSetString(pid,oldWood_kaina p,strfloat(oldwoodcars[oldwood_selected p][oWkaina]*0.7));

				    oldwood_selected p = 6;
				    return 1;
			    }
			    case 4:
		        {
			        SetPlayerCameraPos(pid, 211.7014,-243.3306,1.25);
	            	SetPlayerCameraLookAt(pid, 217.4459,-245.4855,1.4120, CAMERA_MOVE);

		            PlayerTextDrawSetString(pid,oldWood_greitis p,oldwoodcars[oldwood_selected p][oWgreitis]);
		            PlayerTextDrawSetString(pid,oldWood_kuras p,oldwoodcars[oldwood_selected p][oWkuras]);
		            if( !pinfo[vip])
		            	PlayerTextDrawSetString(pid,oldWood_kaina p,strfloat(oldwoodcars[oldwood_selected p][oWkaina]));
					else
				    PlayerTextDrawSetString(pid,oldWood_kaina p,strfloat(oldwoodcars[oldwood_selected p][oWkaina]*0.7));

				    oldwood_selected p = 5;
				    return 1;
			    }
			    case 8:
		        {
			        SetPlayerCameraPos(pid, 203.5217,-243.0611,1.25);
			    	SetPlayerCameraLookAt(pid,196.5234,-245.7334,1.3920, CAMERA_MOVE);

              		PlayerTextDrawSetString(pid,oldWood_greitis p,oldwoodcars[0][oWgreitis]);
		            PlayerTextDrawSetString(pid,oldWood_kuras p,oldwoodcars[0][oWkuras]);
		            PlayerTextDrawSetString(pid,oldWood_kaina p,strfloat(oldwoodcars[0][oWkaina]));

				    oldwood_selected p = 1;
				    return 1;
			    }
		    }
	return 1;
}

stock oldwood_LoadPrev(pid)
{
		    if( oldwood_selected p < 1 || oldwood_selected p > 8)
				oldwood_selected p = 1;

            switch(oldwood_selected p)
		    {
		        case 6:
		        {
			        SetPlayerCameraPos(pid,210.7014,-243.3306,1.25);
			    	SetPlayerCameraLookAt(pid, 217.4459,-245.4855,1.4120,CAMERA_MOVE);

		            PlayerTextDrawSetString(pid,oldWood_greitis p,oldwoodcars[4][oWgreitis]);
		            PlayerTextDrawSetString(pid,oldWood_kuras p,oldwoodcars[4][oWkuras]);
		            PlayerTextDrawSetString(pid,oldWood_kaina p,strfloat(oldwoodcars[4][oWkaina]));

				    oldwood_selected p = 5;
				    return 1;
			    }
			    case 2:
		        {
			        SetPlayerCameraPos(pid,203.5217,-243.0611,1.25);
	            	SetPlayerCameraLookAt(pid, 196.5234,-245.7334,1.3920, CAMERA_MOVE);

		            PlayerTextDrawSetString(pid,oldWood_greitis p,oldwoodcars[oldwood_selected p-2][oWgreitis]);
		            PlayerTextDrawSetString(pid,oldWood_kuras p,oldwoodcars[oldwood_selected p-2][oWkuras]);
              		PlayerTextDrawSetString(pid,oldWood_kaina p,strfloat(oldwoodcars[oldwood_selected p-2][oWkaina]));

				    oldwood_selected p = 1;
				    return 1;
			    }
			    case 3:
		        {
			        SetPlayerCameraPos(pid, 203.5217,-238.0611,1.25);
	           		SetPlayerCameraLookAt(pid, 196.5234,-240.7334,1.3920, CAMERA_MOVE);

		            PlayerTextDrawSetString(pid,oldWood_greitis p,oldwoodcars[oldwood_selected p-2][oWgreitis]);
		            PlayerTextDrawSetString(pid,oldWood_kuras p,oldwoodcars[oldwood_selected p-2][oWkuras]);
 		            PlayerTextDrawSetString(pid,oldWood_kaina p,strfloat(oldwoodcars[oldwood_selected p-2][oWkaina]));

				    oldwood_selected p = 2;
				    return 1;
			    }
			    case 4:
		        {
			        SetPlayerCameraPos(pid, 203.5217,-233.0611,1.25);
	            	SetPlayerCameraLookAt(pid, 196.5234,-235.7334,1.3920, CAMERA_MOVE);

		            PlayerTextDrawSetString(pid,oldWood_greitis p,oldwoodcars[oldwood_selected p-2][oWgreitis]);
		            PlayerTextDrawSetString(pid,oldWood_kuras p,oldwoodcars[oldwood_selected p-2][oWkuras]);
             		PlayerTextDrawSetString(pid,oldWood_kaina p,strfloat(oldwoodcars[oldwood_selected p-2][oWkaina]));

				    oldwood_selected p = 3;
				    return 1;
			    }
			    case 5:
		        {
			        SetPlayerCameraPos(pid, 203.5217,-228.0611,1.25);
	            	SetPlayerCameraLookAt(pid, 196.5234,-230.7334,1.3920, CAMERA_MOVE);

		            PlayerTextDrawSetString(pid,oldWood_greitis p,oldwoodcars[oldwood_selected p-2][oWgreitis]);
		            PlayerTextDrawSetString(pid,oldWood_kuras p,oldwoodcars[oldwood_selected p-2][oWkuras]);
              		PlayerTextDrawSetString(pid,oldWood_kaina p,strfloat(oldwoodcars[oldwood_selected p-2][oWkaina]));

				    oldwood_selected p = 4;
				    return 1;
			    }
			    case 1:
		        {
			        SetPlayerCameraPos(pid, 210.7014,-228.3306,1.25);
	            	SetPlayerCameraLookAt(pid, 217.4459,-230.4855,1.4120, CAMERA_MOVE);

		            PlayerTextDrawSetString(pid,oldWood_greitis p,oldwoodcars[oldwood_selected p-2][oWgreitis]);
		            PlayerTextDrawSetString(pid,oldWood_kuras p,oldwoodcars[oldwood_selected p-2][oWkuras]);
              		PlayerTextDrawSetString(pid,oldWood_kaina p,strfloat(oldwoodcars[oldwood_selected p-2][oWkaina]));

				    oldwood_selected p = 8;
				    return 1;
			    }
			    case 8:
		        {
			        SetPlayerCameraPos(pid, 211.7014,-233.3306,1.25);
	            	SetPlayerCameraLookAt(pid, 217.4459,-235.4855,1.4120, CAMERA_MOVE);

		            PlayerTextDrawSetString(pid,oldWood_greitis p,oldwoodcars[oldwood_selected p-2][oWgreitis]);
		            PlayerTextDrawSetString(pid,oldWood_kuras p,oldwoodcars[oldwood_selected p-2][oWkuras]);
		            PlayerTextDrawSetString(pid,oldWood_kaina p,strfloat(oldwoodcars[oldwood_selected p-2][oWkaina]));

				    oldwood_selected p = 7;
				    return 1;
			    }
			    case 7:
		        {
			        SetPlayerCameraPos(pid, 210.7551,-238.6093,1.25);
	            	SetPlayerCameraLookAt(pid, 217.4459,-240.4855,1.4120, CAMERA_MOVE);

		            PlayerTextDrawSetString(pid,oldWood_greitis p,oldwoodcars[oldwood_selected p-2][oWgreitis]);
		            PlayerTextDrawSetString(pid,oldWood_kuras p,oldwoodcars[oldwood_selected p-2][oWkuras]);
		            PlayerTextDrawSetString(pid,oldWood_kaina p,strfloat(oldwoodcars[oldwood_selected p-2][oWkaina]));

				    oldwood_selected p = 6;
				    return 1;
			    }
			}
			return 1;
		}
		
stock oldwood_Pirkti(pid)
{
	if( zinfo[in_carshop])
	{
      	new pMoney = Bag p[pinigai];
		if( pinfo[carid] == 0)
		{
			if( car_sold[oldwood_selected p-1] )
			{
				notification(pid, "si masina pardavimui dar neparuosta.");
      			return 1;
			}
			if( pinfo[vip])
			{
				if( pMoney < oldwoodcars[oldwood_selected p-1][oWkaina] * 0.7) return 1;
				Bag p[pinigai] -= (oldwoodcars[oldwood_selected p-1][oWkaina] * 0.7);
				SetPlayerMoney(pid, Bag p[pinigai]);
			}
			else{
			if( pMoney < oldwoodcars[oldwood_selected p-1][oWkaina]) return 1;
				Bag p[pinigai] -= oldwoodcars[oldwood_selected p-1][oWkaina];
				SetPlayerMoney(pid, Bag p[pinigai]);
			}
			car_sold[oldwood_selected p-1] = true;
			pinfo[carid] = oldwood_car[oldwood_selected p-1];
			printf("oldwood_selected p-1 = %i",oldwood_selected p-1);
			car[oldwood_car[oldwood_selected p-1]][spyna] = true;
			AddItem(pid, raktai_m, 1);
			notification(pid, "Sekmes kelyje!");
			zinfo[new_car] = true;
			zinfo[in_carshop] = false;
           	CancelSelectTextDraw(pid);

		    hide_oldwood(pid);
			SetCameraBehindPlayer(pid);
			unfreeze(pid);
			return 1;
		}
		else
		{
		    notification(pid, "Tavo dokumentuose jau yra uzregistruota masina.");
		    return 1;
		}
	}
	return 1;
}
		
stock oldwood_Nepirkti(pid)
{
	CancelSelectTextDraw(pid);
    hide_oldwood(pid);

	oldwood_selected p = 1;
	SetCameraBehindPlayer(pid);
	unfreeze(pid);
	notification(pid, "eh. sugryzk, kai apsispresi..");
    zinfo[in_carshop] = false;
    return 1;
}

stock soc(pid, text[])
{
	new txt[64];
	format(txt, 64, "soc_%s", text);
	SendClientMessage(playerid, 0, txt);
}


//--------------------------------------------------

stock GetPlayerNameEx( pid )
	{
		new
			Name[ MAX_PLAYER_NAME ]
		;
		GetPlayerName( pid,Name,MAX_PLAYER_NAME );
		return Name;
	}
//--------------------------------------------------
	
stock tickcheck(pid)
{
	if( tickcount() < pticks p + 100)
	{
		return 1;
	}
	else
	{
	    pticks p = tickcount();
 		return 0;
	}
}

stock tickcheck2(pid)
{
	if( tickcount() < pticks p + 1000)
	{
		return 1;
	}
	else
	{
	    pticks p = tickcount();
 		return 0;
	}
}

stock tickcheck3(pid)
{
    if( tickcount() < pticks p + 500)
	{
		return 1;
	}
	else
	{
	    pticks p = tickcount();
 		return 0;
	}
}
//--------------------------------------------------
stock GetPlayerID(const playername[], partofname=0) //By Jan "DracoBlue" Schütze (edited by Gabriel "Larcius" Cordes)
{
	new playername1[MAX_STRING];
	foreach(new i : Player)
	{
		GetPlayerName(i,playername1,sizeof(playername1));
		if (strcmp(playername1,playername,true)==0)
		{
			return i;
		}
 	}
	new correctsigns_userid=-1;
	new tmpuname[MAX_STRING];
	new hasmultiple=-1;
	if( partofname)
	{
		foreach(new i : Player)
		{
			GetPlayerName(i,tmpuname,sizeof(tmpuname));
			if (!strfind(tmpuname,playername,true))
			{
				hasmultiple++;
				correctsigns_userid=i;
			}
			if (hasmultiple>0)
			{
				return -2;
			}
		}
  	}
	return correctsigns_userid;
}
