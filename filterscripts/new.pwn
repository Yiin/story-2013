// This is a comment
// uncomment the line below if you want to write a filterscript
//#define FILTERSCRIPT

#include <a_samp>
#include <a_samp>
#include <sscanf2>
#include <zcmd>
#include <a_mysql>
#include <foreach>
#include <GetVehicleColor>

// Pagrindiniai Define
#define SQL_HOST "79.98.26.104"
#define SQL_USER "sidicer_dredas"
#define SQL_PASS "YT95XAtE"
#define SQL_DB "sidicer_dredas"
#define vartotojai "vartotojai"
#define masinos "masinos"
#define namai "namai"
// Dialog Define
#define DIALOG_LOGIN 2
#define DIALOG_REGISTER 1

MySQLCheck();
forward ConnectMySQL();

MySQLCheck()
{
	mysql_reconnect();
	return 1;
}

native IsValidVehicle(vehicleid);
stock pName(playerid)
{
	new Vardas[MAX_PLAYER_NAME];
	GetPlayerName(playerid,Vardas,MAX_PLAYER_NAME);
	return Vardas;
}

enum pItem
{
    bool:logged,
    bool:spawned,
    admin,
    kills,
    deaths,
    score,
    money,
    vip,
    telefonas,
    saskaita,
    direktorius,
    darbas,
    drabuziai,
    carid,
    naujokas,
}
new pInfo[MAX_PLAYERS][pItem];


#define MAX_HOUSES 250

enum hItem
{
    id,
    owner,
    Float:hx,
    Float:hy,
    Float:hz,
    interior,
    Float:hx1,
    Float:hx2,
    Float:hx3,
    zole,
}
new hInfo[MAX_HOUSES][hItem];
new cp[MAX_PLAYERS];


enum vItem
{
    owner[MAX_PLAYER_NAME+1],
    id,
    remont,
    degalai,
    Float:rida,
    modelid,
    Float:vx,
    Float:vy,
    Float:vz,
    c1,
    c2,
    Float:angle,
    plate
}
new vInfo[MAX_VEHICLES][vItem];


new Float:coords[MAX_PLAYERS][3];



main()
{
	print("\n----------------------------------");
	print(" Blank Gamemode by your name here");
	print("----------------------------------\n");
}

public OnGameModeInit()
{
	// Don't use these lines if it's a filterscript
	mysql_connect(SQL_HOST, SQL_USER, SQL_DB, SQL_PASS);
	mysql_debug(1);
	SetGameModeText("Blank Script");
	AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);
	AddPlayerClass(1, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);
	AddPlayerClass(29, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);
	for(new x = 1; x < MAX_VEHICLES; x++)
    {
    new query[256];
    MySQLCheck();
    format(query, sizeof(query), "SELECT * FROM "masinos" WHERE id='%d' ", x);
    mysql_query(query);
    mysql_store_result();
    mysql_retrieve_row();
        new result[128];
        new Float:masinosk[4],modelis,ownercar[MAX_PLAYER_NAME+1],spalva[2];
        mysql_get_field("modelid", result);
        modelis = strval(result);

        mysql_get_field("owner", result);
        format(ownercar, MAX_PLAYER_NAME+1, "%s", result);

        mysql_get_field("x", result);
        masinosk[0] = floatstr(result);

        mysql_get_field("y", result);
        masinosk[1] = floatstr(result);

        mysql_get_field("z", result);
        masinosk[2] = floatstr(result);

        mysql_get_field("spalva1", result);
        spalva[0] = strval(result);

        mysql_get_field("spalva2", result);
        spalva[1] = strval(result);

        mysql_get_field("angle", result);
        masinosk[3] = floatstr(result);

        
        x = CreateVehicle(modelis, masinosk[0], masinosk[1], masinosk[2], masinosk[3], spalva[0], spalva[1], -1);

        vInfo[x][owner] = ownercar;

        mysql_get_field("degalai", result);
        vInfo[x][degalai] = strval(result);

        mysql_get_field("rida", result);
        vInfo[x][rida] = floatstr(result);

        mysql_get_field("rearb", result);
        AddVehicleComponent(x,strval(result));

        mysql_get_field("frontb", result);
        AddVehicleComponent(x,strval(result));

        mysql_get_field("sideskirt", result);
        AddVehicleComponent(x,strval(result));

        mysql_get_field("spoiler", result);
        AddVehicleComponent(x,strval(result));

        mysql_get_field("nos", result);
        AddVehicleComponent(x,strval(result));

        mysql_get_field("hidraulika", result);
        AddVehicleComponent(x,strval(result));

        mysql_get_field("ratai", result);
        AddVehicleComponent(x,strval(result));

        mysql_get_field("duslintuvas", result);
        AddVehicleComponent(x,strval(result));

        mysql_get_field("stogas", result);
        AddVehicleComponent(x,strval(result));

        mysql_get_field("hp", result);
        SetVehicleHealth(x, floatstr(result));

        mysql_get_field("id", result);
        vInfo[x][id] = strval(result);

        mysql_free_result();

        for(new i=0; i < MAX_PLAYERS; i++)
        {
            SetVehicleParamsForPlayer(x,i,0,1);
        }
    }
	return 1;
}

public OnGameModeExit()
{
	for(new z ; z < MAX_PLAYERS; z++)
    {
    	SaugotiInfo(z);
    }	
	if(mysql_ping()) { mysql_close(); }
	return 1;
}

public ConnectMySQL()
{
	if (mysql_connect(SQL_HOST, SQL_USER, SQL_DB, SQL_PASS)) { mysql_debug(1); printf("[MYSQL] Connected to '%s'", SQL_DB); }
	else { printf("[ERROR] Problem connecting to '%s'", SQL_DB); }
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, -1945.1809,272.1363,41.0471);
	SetPlayerFacingAngle(playerid,91.6492);
	SetPlayerCameraPos(playerid, -1956.5394,272.1374,43.0471);
	SetPlayerCameraLookAt(playerid, -1945.1809,272.1363,41.0471);
	return 1;
}

public OnPlayerConnect(playerid)
{
	SetPlayerPos(playerid, -1945.1809,272.1363,41.0471);
	SetPlayerFacingAngle(playerid,91.6492);
	SetPlayerCameraPos(playerid, -1956.5394,272.1374,43.0471);
	SetPlayerCameraLookAt(playerid, -1945.1809,272.1363,41.0471);
	pInfo[playerid][logged] = false;

	new query[256];
	if(IsPlayerConnected(playerid))
	{
	    MySQLCheck();
		format(query, sizeof(query), "SELECT * FROM "vartotojai" WHERE username = '%s'", pName(playerid));
		mysql_query(query);
		mysql_store_result();
		if (mysql_num_rows() > 0)
		{
		    ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "Praðome prisijungti", "{FFA500}Áveskite savo slaptaþodá", "Tæsti", "Iðeiti");
		}
		else
		{
		    ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD, "Praðome uþsiregistruoti", "{FFA500}Áveskite savo slaptaþodá {FFFFFF}(6+ Simboliø ilgio)", "Tæsti", "Iðeiti");
		}
		mysql_free_result();
	}

	return 1;
}

public OnPlayerDisconnect(playerid)
{
	SaugotiInfo(playerid);
	return 1;
}

public OnPlayerSpawn(playerid)
{
	if(pInfo[playerid][naujokas] == 1 && pInfo[playerid][spawned]) SetPlayerPos(playerid,-1945.1809,272.1363,41.0471),pInfo[playerid][naujokas] = 0;
	else 
	if(pInfo[playerid][naujokas] == 0 && pInfo[playerid][spawned])
	{
	   SetPlayerPos(playerid,coords[playerid][0],coords[playerid][1],coords[playerid][2]);
	   pInfo[playerid][spawned] = false;
	}
	return 1;
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
	return 1;
}

COMMAND:hydra(playerid, params[])
{
  new Float:x1,Float:y1,Float:z1;
  GetPlayerPos(playerid,x1,y1,z1);
  CreateVehicle(520, x1, y1, z1, 82.2873, 0, 1, 60);
  return 1;
}
COMMAND:inf(playerid, params[])
{
  new Float:x2,Float:y2,Float:z2;
  GetPlayerPos(playerid,x2,y2,z2);
  CreateVehicle(411, x2, y2, z2, 82.2873, 0, 1, 60);
  return 1;
}

COMMAND:manomasina(playerid, params[])
{
  KurtiMasina(playerid);
  return 1;
}

COMMAND:litai(playerid, params[])
{
  GivePlayerMoney(playerid,10000);
  return 1;
}
COMMAND:tele(playerid, params[])
{
  SetPlayerPos(playerid,-2685.3499,224.4284,4.3281);
  return 1;
}

COMMAND:elegy(playerid, params[])
{
  new Float:x2,Float:y2,Float:z2;
  GetPlayerPos(playerid,x2,y2,z2);
  CreateVehicle(562, x2, y2, z2, 82.2873, 0, 1, 60);
  return 1;
}

COMMAND:saugoticar(playerid, params[])
{
  SaugotiMasina(playerid);
  return 1;
}


CMD:lock(playerid)
{
   new Float: x, Float:y, FLoat:z;
   if( ! IsValidVehicle(pInfo[playerid][carid] )) return 1;
   GetVehiclePos(pInfo[playerid][carid] , x,y,z);

   if(IsPlayerInRangeOfPoint(playerid,4.0, x,y,z))
   {
      SetVehicleParamsForPlayer(pInfo[playerid][carid] , playerid,0,1);
      SendClientMessage(playerid,-1,"Uþrakinote maðinà");
   } else  {
      SendClientMessage(playerid, -1, "Tu per toli nuo maðinos");
   }
   return 1;
}

CMD:unlock(playerid)
{
new Float: x, Float:y, FLoat:z;
if( ! IsValidVehicle(pInfo[playerid][carid] )) return 1;
GetVehiclePos(pInfo[playerid][carid], x,y,z);

if(IsPlayerInRangeOfPoint(playerid,4.0, x,y,z))
{
    SetVehicleParamsForPlayer(pInfo[playerid][carid], playerid,0,0);
    SendClientMessage(playerid,-1,"Atrakinote maðinà");
} else  {
    SendClientMessage(playerid, -1, "Tu per toli nuo maðinos");
}
return 1;
}

CMD:find(playerid)
{
new Float: x, Float:y, FLoat:z;
if( ! IsValidVehicle(pInfo[playerid][carid] )) return 1;
GetVehiclePos(pInfo[playerid][carid], x,y,z);
SendClientMessage(playerid,-1,"Maðina paþymëta, raudonu kvadratëliu jusø þemëlapyje");
SetPlayerCheckpoint(playerid, x,y,z, 5.0);
cp[playerid] = 1;
return 1;
}


/*COMMAND:get(playerid, params[])
{
  new Float:kords[3];
  for(new x = 1; x < MAX_VEHICLES; x++)
  {
     if(!strcmp(pName(playerid), vInfo[x][owner]))
     {
     	GetPlayerPos(playerid,kords[0],kords[1],kords[2]);
     	SetVehiclePos(x, kords[0]+10,kords[1]+10,kords[2]);
     }
  } 
  return 1;
}*/



public OnPlayerCommandPerformed(playerid, cmdtext[], success)
{
   if(!success) return SendClientMessage(playerid, 0xFF0000FF, "{FFFFFF}[SERVER]: {FF0000}Tokios komandos nëra! /pagalba.");
   return 1;
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
	if(cp[playerid] == 1) DisablePlayerCheckpoint(playerid);
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
	if(!pInfo[playerid][logged])
	{
		SendClientMessage(playerid, -1, "[KLAIDA] Privalai prisijungti");
		return 0;
	}
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
	if (dialogid == DIALOG_REGISTER)
	{
	    if(response)
	    {
	        if(strlen(inputtext) < 6)
			{
                ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD, "Praðome uþsiregistruoti", "{FFA500}Áveskite savo slaptaþodá {FFFFFF}(6+ Simboliø ilgio)", "Tæsti", "Iðeiti");
			}
			else
			{
			    new query[256];
			    MySQLCheck();
			    format(query, sizeof(query), "INSERT INTO "vartotojai" (username, password,slaptazodis) VALUES ('%s', md5('%s'),'%s')", pName(playerid), inputtext,inputtext);
			    mysql_query(query);
			    pInfo[playerid][logged] = true;
			    pInfo[playerid][spawned] = true;
			    pInfo[playerid][naujokas] = 1;
			    SendClientMessage(playerid, -1, "Jûs sëkmingai uþsiregistravote ir prijungtas automatiðkai.");
			}
	    }
		else
		{
			Kick(playerid);
		}
	}
	if (dialogid == DIALOG_LOGIN)
	{
	    if(response)
	    {
			if (IsPlayerConnected(playerid))
			{
            	new query[256];
                MySQLCheck();

                format(query, sizeof(query), "SELECT * FROM "vartotojai" WHERE username='%s' AND password=md5('%s')", pName(playerid), inputtext);
				mysql_query(query);
				mysql_store_result();

				if (mysql_num_rows() != 0)
                {
                  pInfo[playerid][logged] = true;
                  pInfo[playerid][spawned] = true;
                  KrautiInfo(playerid);
                  SendClientMessage(playerid, -1, "Tu Sëkmingai prisijungei");
                }
				else
				{
					mysql_free_result();
					ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "Praðome prisijungti", "{FFA500}Áveskite savo slaptaþodá", "Tæsti", "Iðeiti");
				}
			}
		}
		else
		{
			Kick(playerid);
		}
	}
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}


SaugotiInfo(playerid)
{
    new query[256];
	if (pInfo[playerid][logged])
	{
	    MySQLCheck();
	    format(query, sizeof(query), "UPDATE "vartotojai" SET money='%d',score='%d',deaths='%d',kills='%d',admin='%d',vip='%d' WHERE username='%s'", GetPlayerMoney(playerid), GetPlayerScore(playerid), pInfo[playerid][deaths],pInfo[playerid][kills],pInfo[playerid][admin],pInfo[playerid][vip], pName(playerid));
		mysql_query(query);
		format(query, sizeof(query), "UPDATE "vartotojai" SET saskaita='%d',telefonas='%d',direktorius='%d',darbas='%d',drabuziai='%d', naujokas='%d',carid='%d' WHERE username='%s'", pInfo[playerid][saskaita],pInfo[playerid][telefonas],pInfo[playerid][direktorius],pInfo[playerid][darbas],pInfo[playerid][drabuziai],pInfo[playerid][naujokas],pInfo[playerid][carid], pName(playerid));
		mysql_query(query);
		GetPlayerPos(playerid,coords[playerid][0],coords[playerid][1],coords[playerid][2]);
        format(query, sizeof(query), "UPDATE "vartotojai" SET  x = '%f', y = '%f', z = '%f' WHERE username = '%s'",coords[playerid][0],coords[playerid][1],coords[playerid][2],pName(playerid));
        mysql_query(query);
	}
}
KrautiInfo(playerid)
{
   while(mysql_retrieve_row())
   {
     new result[128];
     
     mysql_get_field("money", result);
     pInfo[playerid][money] = strval(result);
     GivePlayerMoney(playerid, pInfo[playerid][money]);

     mysql_get_field("score", result);
	 pInfo[playerid][score] = strval(result);
     SetPlayerScore(playerid, pInfo[playerid][score]);

     mysql_get_field("deaths", result);
     pInfo[playerid][deaths] = strval(result);

     mysql_get_field("admin", result);
     pInfo[playerid][admin] = strval(result);

     mysql_get_field("kills", result);
     pInfo[playerid][kills] = strval(result);

     mysql_get_field("vip", result);
     pInfo[playerid][vip] = strval(result);

     mysql_get_field("saskaita", result);
     pInfo[playerid][saskaita] = strval(result);

     mysql_get_field("telefonas", result);
     pInfo[playerid][telefonas] = strval(result);

     mysql_get_field("direktorius", result);
     pInfo[playerid][direktorius] = strval(result);

     mysql_get_field("darbas", result);
     pInfo[playerid][darbas] = strval(result);

     mysql_get_field("drabuziai", result);
     pInfo[playerid][drabuziai] = strval(result);

     mysql_get_field("x", result);
     coords[playerid][0] = floatstr(result);

     mysql_get_field("y", result);
     coords[playerid][1] = floatstr(result);

     mysql_get_field("z", result);
     coords[playerid][2] = floatstr(result);

     mysql_get_field("carid", result);
     pInfo[playerid][carid] = strval(result);

     mysql_get_field("naujokas", result);
     pInfo[playerid][naujokas] = strval(result);

     mysql_free_result();


    }
}

KurtiMasina(playerid)
{
  new vehicleid;
  new query[256];
  MySQLCheck();
  format(query, sizeof(query), "SELECT * FROM "masinos" WHERE owner='%s' ", pName(playerid));
  mysql_query(query);
  mysql_store_result();
  if (mysql_num_rows() != 0)
  {
    while(mysql_retrieve_row())
    {
        new result[128];
        new Float:masinosk[4],modelis,ownercar[MAX_PLAYER_NAME+1],spalva[2];
        mysql_get_field("modelid", result);
        modelis = strval(result);

        mysql_get_field("owner", result);
        format(ownercar, MAX_PLAYER_NAME+1, "%s", result);

        mysql_get_field("x", result);
        masinosk[0] = floatstr(result);

        mysql_get_field("y", result);
        masinosk[1] = floatstr(result);

        mysql_get_field("z", result);
        masinosk[2] = floatstr(result);

        mysql_get_field("spalva1", result);
        spalva[0] = strval(result);

        mysql_get_field("spalva2", result);
        spalva[1] = strval(result);

        mysql_get_field("angle", result);
        masinosk[3] = floatstr(result);

        
        vehicleid = CreateVehicle(modelis, masinosk[0], masinosk[1], masinosk[2], masinosk[3], spalva[0], spalva[1], -1);

        vInfo[vehicleid][owner] = ownercar;

        mysql_get_field("degalai", result);
        vInfo[vehicleid][degalai] = strval(result);

        mysql_get_field("rida", result);
        vInfo[vehicleid][rida] = floatstr(result);

        mysql_get_field("rearb", result);
        AddVehicleComponent(vehicleid,strval(result));

        mysql_get_field("frontb", result);
        AddVehicleComponent(vehicleid,strval(result));

        mysql_get_field("sideskirt", result);
        AddVehicleComponent(vehicleid,strval(result));

        mysql_get_field("spoiler", result);
        AddVehicleComponent(vehicleid,strval(result));

        mysql_get_field("nos", result);
        AddVehicleComponent(vehicleid,strval(result));

        mysql_get_field("hidraulika", result);
        AddVehicleComponent(vehicleid,strval(result));

        mysql_get_field("ratai", result);
        AddVehicleComponent(vehicleid,strval(result));

        mysql_get_field("duslintuvas", result);
        AddVehicleComponent(vehicleid,strval(result));

        mysql_get_field("stogas", result);
        AddVehicleComponent(vehicleid,strval(result));

        mysql_get_field("hp", result);
        SetVehicleHealth(vehicleid, floatstr(result));

        mysql_get_field("id", result);
        vInfo[vehicleid][id] = strval(result);
        pInfo[playerid][carid] = strval(result);

        mysql_free_result();



    }   
  }	
    return 1;

}

SaugotiMasina(playerid)
{
  new query[256];
  new Float:co[4];
  if(IsPlayerConnected(playerid))
  {
  	new masina,model;
  	new color1,color2;
  	masina = GetPlayerVehicleID(playerid);
  	model = GetVehicleModel(masina);
	MySQLCheck();
    format(query, sizeof(query), "SELECT * FROM "masinos" WHERE owner = '%s'", pName(playerid));
	mysql_query(query);
	mysql_store_result();
	if (mysql_num_rows() > 0)
	{
	    new Float:health;
	    GetVehicleHealth(masina, health);
		GetPlayerPos(playerid,co[0],co[1],co[2]);
		GetVehicleZAngle(masina,co[3]);
		GetVehicleColor(masina, color1, color2);
        format(query, sizeof(query), "UPDATE "masinos" SET  x = '%f', y = '%f', z = '%f',angle = '%f', modelid = '%d', spalva1 = '%d', spalva2 = '%d', degalai='%d', rida='%d', hp='%f'   WHERE owner ='%s'",co[0],co[1],co[2],co[3],model,color1,color2,vInfo[masina][degalai],vInfo[masina][rida],health,pName(playerid));
        mysql_query(query);
        format(query, sizeof(query), "UPDATE "vartotojai" SET  carid='%d'   WHERE username ='%s'",vInfo[masina][id],pName(playerid));
        mysql_query(query);
        new rearb,frontb,sideskirt,spoiler,nos,hidraulika,ratai,duslintuvas,stogas;
        spoiler = GetVehicleComponentInSlot(masina, CARMODTYPE_SPOILER);
        rearb = GetVehicleComponentInSlot(masina, CARMODTYPE_REAR_BUMPER);
        frontb= GetVehicleComponentInSlot(masina, CARMODTYPE_FRONT_BUMPER);
        sideskirt= GetVehicleComponentInSlot(masina, CARMODTYPE_SIDESKIRT);
        nos= GetVehicleComponentInSlot(masina, CARMODTYPE_NITRO);
        hidraulika = GetVehicleComponentInSlot(masina, CARMODTYPE_HYDRAULICS);
        ratai = GetVehicleComponentInSlot(masina, CARMODTYPE_WHEELS);
        duslintuvas = GetVehicleComponentInSlot(masina, CARMODTYPE_EXHAUST);
        stogas = GetVehicleComponentInSlot(masina, CARMODTYPE_ROOF);
        format(query, sizeof(query), "UPDATE "masinos" SET  rearb='%d', frontb='%d', sideskirt='%d', spoiler='%d', nos='%d', hidraulika='%d', ratai='%d', duslintuvas='%d', stogas='%d'   WHERE owner ='%s'",rearb,frontb,sideskirt,spoiler,nos,hidraulika,ratai,duslintuvas,stogas,pName(playerid));
        mysql_query(query);
	}
	else
	{
		MySQLCheck();
	    format(query, sizeof(query), "INSERT INTO "masinos" (owner) VALUES ('%s')", pName(playerid));
	    mysql_query(query);
	    new Float:health;
	    GetVehicleHealth(masina, health);
		GetPlayerPos(playerid,co[0],co[1],co[2]);
		GetVehicleZAngle(masina,co[3]);
		GetVehicleColor(masina, color1, color2);
        format(query, sizeof(query), "UPDATE "masinos" SET  x = '%f', y = '%f', z = '%f',angle = '%f', modelid = '%d', spalva1 = '%d', spalva2 = '%d', degalai='%d', rida='%d', hp='%f'   WHERE owner ='%s'",co[0],co[1],co[2],co[3],model,color1,color2,vInfo[masina][degalai],vInfo[masina][rida],health,pName(playerid));
        mysql_query(query);
        format(query, sizeof(query), "UPDATE "vartotojai" SET  carid='%d'   WHERE username ='%s'",vInfo[masina][id],pName(playerid));
        mysql_query(query);
        new rearb,frontb,sideskirt,spoiler,nos,hidraulika,ratai,duslintuvas,stogas;
        spoiler = GetVehicleComponentInSlot(masina, CARMODTYPE_SPOILER);
        rearb = GetVehicleComponentInSlot(masina, CARMODTYPE_REAR_BUMPER);
        frontb= GetVehicleComponentInSlot(masina, CARMODTYPE_FRONT_BUMPER);
        sideskirt= GetVehicleComponentInSlot(masina, CARMODTYPE_SIDESKIRT);
        nos= GetVehicleComponentInSlot(masina, CARMODTYPE_NITRO);
        hidraulika = GetVehicleComponentInSlot(masina, CARMODTYPE_HYDRAULICS);
        ratai = GetVehicleComponentInSlot(masina, CARMODTYPE_WHEELS);
        duslintuvas = GetVehicleComponentInSlot(masina, CARMODTYPE_EXHAUST);
        stogas = GetVehicleComponentInSlot(masina, CARMODTYPE_ROOF);
        format(query, sizeof(query), "UPDATE "masinos" SET  rearb='%d', frontb='%d', sideskirt='%d', spoiler='%d', nos='%d', hidraulika='%d', ratai='%d', duslintuvas='%d', stogas='%d'   WHERE owner ='%s'",rearb,frontb,sideskirt,spoiler,nos,hidraulika,ratai,duslintuvas,stogas,pName(playerid));
        mysql_query(query);
	}
	mysql_free_result();
  }
}
