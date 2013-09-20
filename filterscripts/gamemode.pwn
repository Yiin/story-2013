/*

Serveris pradëtas kurti 2012.12.01
Serverio kûrëjas MoDe, skype: pijokaz221

*/

#include <a_samp>
#include <zcmd>
#include <a_mysql>
#include <sscanf2>

#undef MAX_PLAYERS
#define MAX_PLAYERS 50

#define COLOR_MESSAGE 			0xEDF511FF
#define COLOR_ANNOUNCE          0x3AE840FF
#define COLOR_YELLOW        	0xEDF511FF
#define COLOR_RED           	0xF51111FF
#define COLOR_GRAY          	0x919191FF
#define COLOR_PURPLE			0x8C07ADFF
#define COLOR_GREEN 			0x33AA33AA
#define COLOR_WHITE				0xFFFFFF00

#define Blue    "{003DF5}"
#define Red     "{FF0000}"
#define Green   "{66FF00}"
#define White   "{FFFFFF}"

#define NAME					"Prison Break"
#define VERSION					"0.01"
#define MAPNAME         		"Prison"
#define WEBSITE             	"nera"
#define PRINT_NAME              "[Prison Break]"

#define MYSQL_HOST				"localhost"
#define MYSQL_DB				"prison"
#define MYSQL_USER				"root"
#define MYSQL_PASS				""

#define DIALOG_REGISTER         100
#define DIALOG_LOGIN            101

main()
{
    print("\n");
	print("==============================");
	print("   "NAME" v"VERSION"");
    print("   By MoDe");
	print("==============================");
	print("\n");
}

enum pInfo
{
    pScore,
    pMoney,
    pLevel,
    pVIP,
    pIstorija,
    pRank,
    pKills,
    pDeaths,
    pMuted,
    pJailed,
    pFrozen,
    pMutedTimes,
    pJailedTimes,
    pFrozenTimes,
    pBanned,
    pBannedBy[24],
    pLogins,
    pCookies,
    Float:pPosX,
    Float:pPosY,
    Float:pPosZ,
    Float:pPosA
}

new PlayerInfo[MAX_PLAYERS][pInfo];
new MoneyGiven[MAX_PLAYERS];
new IsRegistered[MAX_PLAYERS];
new Logged[MAX_PLAYERS];
new JustLogged[MAX_PLAYERS];

//kintamieji
new Text:Time, Text:Date;
//
forward settime(playerid);

public OnGameModeInit()
{
    print(""PRINT_NAME" Kraunami nustatymai...");
    mysql_connect(MYSQL_HOST, MYSQL_USER, MYSQL_DB, MYSQL_PASS);
    //mysql_query("CREATE TABLE IF NOT EXISTS playerdata(user VARCHAR(24), password VARCHAR(40), score INT(20), money INT(20), level INT(20), vip INT(20), kma INT(20), rank INT(20), kills INT(20), deaths INT(20), muted INT(20), jailed INT(20), frozen INT(20), mutedtimes INT(20), jailedtimes INT(20), frozentimes INT(20), banned INT(20), bannedby VARCHAR(24), logins INT(20), posx INT(20), posy INT(20), posz INT(20), posa INT(20), IP VARCHAR(15) )");
    mysql_debug(1);
    /////laikas
    SetTimer("settime",1000,true);
	Date = TextDrawCreate(547.000000,28.000000,"--");
	TextDrawFont(Date,3);
	TextDrawAlignment(Date, 0);
	TextDrawBackgroundColor(Date, 0x000000ff);
	TextDrawSetOutline(Date, 1);
	TextDrawSetProportional(Date, 1);
	TextDrawSetShadow(Date, 1);
	TextDrawLetterSize(Date,0.399999,1.600000);
    TextDrawColor(Date,0xffffffff);
	Time = TextDrawCreate(547.000000,11.000000,"--");
	TextDrawFont(Time,3);
	TextDrawAlignment(Time, 0);
	TextDrawBackgroundColor(Time, 0x000000ff);
	TextDrawSetOutline(Time, 1);
	TextDrawSetProportional(Time, 1);
	TextDrawSetShadow(Time, 1);
	TextDrawLetterSize(Time,0.499999,1.800000);
	TextDrawColor(Time,0xffffffff);
	///////laikas
	SetGameModeText(""NAME" v"VERSION"");
	AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);
	print(""PRINT_NAME" Nustatymai uþkrauti.");

	return 1;
}

public OnGameModeExit()
{
    TextDrawDestroy(Time), TextDrawDestroy(Date);
	return 1;
}

public OnPlayerRequestClass( playerid, classid )
{
	return SpawnPlayer(playerid), 1;
}

public OnPlayerConnect(playerid)
{
    TextDrawShowForPlayer(playerid, Time), TextDrawShowForPlayer(playerid, Date);
 	MoneyGiven[playerid] = -1;
    JustLogged[playerid] = 0;
    new query[300], pname[24];
    GetPlayerName(playerid, pname, 24);
    format(query, sizeof(query), "SELECT IP FROM `playerdata` WHERE user = '%s' LIMIT 1", pname);
    mysql_query(query);
    mysql_store_result();
    new rows = mysql_num_rows();
    if(!rows)
    {
        ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_INPUT, ""Blue"Uþsiregistruokite",""White"Sveiki atvykæ á "Red""NAME""White"!\n"White"Norëdami pradëti þaisti, turite uþsiregistruoti!\n\n"White"Áraðykite "Red"savo"White" slaptaþodá:", "Registruotis", "Atðaukti");
    }
    if(rows == 1)
    {
        new IP[2][15];
        mysql_fetch_field_row(IP[0],"IP");
        GetPlayerIp(playerid, IP[1], 15);
        if(strlen(IP[0]) != 0 && !strcmp(IP[0], IP[1], true))
        {
            MySQL_Login(playerid);
        }
        else if(!strlen(IP[0]) || strcmp(IP[0], IP[1], true))
        {
            ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_INPUT, ""Blue"Prisijunkite", ""White"Sveiki sugráþæ á "Red""NAME""White"!\n"White"Norëdami pradëti þaisti, turite prisijungti!\n\n"White"Áveskite "Red"savo"White" slaptaþodá:", "Prisijungti", "Atðaukti");
            IsRegistered[playerid] = 1;
        }
    }
    mysql_free_result();
    return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    TextDrawHideForPlayer(playerid, Time), TextDrawHideForPlayer(playerid, Date);
	if(Logged[playerid] == 1)
    {
        new Float:x, Float:y, Float:z, Float:a;
        GetPlayerPos(playerid, x, y, z);
        GetPlayerFacingAngle(playerid, a);
        PlayerInfo[playerid][pPosX] = x;
        PlayerInfo[playerid][pPosY] = y;
        PlayerInfo[playerid][pPosZ] = z;
        PlayerInfo[playerid][pPosA] = a;
        new score = GetPlayerScore(playerid);
        new money = GetPlayerMoney(playerid);
        new query[300], pname[24];
        GetPlayerName(playerid, pname, 24);
        format(query, sizeof(query), "UPDATE playerdata SET score=%d, money=%d, level=%d, vip=%d, istorija=%d, rank=%d, kills=%d, deaths=%d, muted=%d, jailed=%d, frozen=%d, mutedtimes=%d, jailedtimes=%d, frozentimes=%d, banned=%d, bannedby='%s', logins=%d, posx=%f, posy=%f, posz=%f, posa=%f  WHERE user='%s'",
		score,
		money,
		PlayerInfo[playerid][pLevel],
		PlayerInfo[playerid][pVIP],
		PlayerInfo[playerid][pIstorija],
		PlayerInfo[playerid][pRank],
		PlayerInfo[playerid][pKills],
		PlayerInfo[playerid][pDeaths],
		PlayerInfo[playerid][pMuted],
		PlayerInfo[playerid][pJailed],
		PlayerInfo[playerid][pFrozen],
		PlayerInfo[playerid][pMutedTimes],
		PlayerInfo[playerid][pJailedTimes],
		PlayerInfo[playerid][pFrozenTimes],
		PlayerInfo[playerid][pBanned],
		PlayerInfo[playerid][pBannedBy],
		PlayerInfo[playerid][pLogins],
  		PlayerInfo[playerid][pPosX],
        PlayerInfo[playerid][pPosY],
        PlayerInfo[playerid][pPosZ],
        PlayerInfo[playerid][pPosA],
		pname);
        mysql_query(query);
    }
    return 1;
}

public OnPlayerSpawn(playerid)
{
    if(MoneyGiven[playerid] != -1)
    {
        GivePlayerMoney(playerid, MoneyGiven[playerid]);
        MoneyGiven[playerid] = -1;
    }
    if(JustLogged[playerid] == 0)
    {
     	ShowPlayerDialog(playerid, 3, DIALOG_STYLE_LIST, "Pasirink Istorijà", "Þmogþudystë\nPagrobimas\nKontrobanda", "Rinktis", "");
	}
    if(JustLogged[playerid] == 1)
    {
    	JustLogged[playerid] = 0;
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
    //================================================================//
    //                              MySQL part                        //
    //================================================================//
    if(!Logged[playerid])
    {
        if(!IsRegistered[playerid])
        {
            ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_INPUT, ""Blue"Uþsiregistruokite",""White"Sveiki atvykæ á "Red""NAME""White"!\n"White"Norëdami pradëti þaisti, turite uþsiregistruoti!\n\n"White"Áraðykite "Red"savo"White" slaptaþodá:", "Registruotis", "Atðaukti");
            return 0;
        }
        if(IsRegistered[playerid] == 1)
        {
            ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_INPUT, ""Blue"Prisijunkite", ""White"Sveikas sugráþæs á "Red""NAME""White"!\n"White"Norëdami pradëti þaisti, turite prisijungti!\n\n"White"Áveskite "Red"savo"White" slaptaþodá:", "Prisijungti", "Atðaukti");
            return 0;
        }
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
	if(dialogid == DIALOG_REGISTER)
    {
        if(response)
        {
            if(!strlen(inputtext) || strlen(inputtext) > 100)
            {
            	SendClientMessage(playerid, 0xFF0000FF, "[KLAIDA] Slaptaþodis turi bûti 1-100 ilgumo!");
                ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_INPUT, ""Blue"Uþsiregistruokite",""White"Sveiki atvykæ á "Red""NAME""White"!\n"White"Norëdami pradëti þaisti, turite uþsiregistruoti!\n\n"White"Áraðykite "Red"savo"White" slaptaþodá:", "Registruotis", "Atðaukti");
            }
            else if(strlen(inputtext) > 0 && strlen(inputtext) < 100)
            {
                new escpass[100];
                mysql_real_escape_string(inputtext, escpass);
                MySQL_Register(playerid, escpass);
            }
        }
        if(!response)
        {
        		SendClientMessage(playerid, 0xFF0000FF, "[KLAIDA] Turite uþsiregistruoti prieð prisijungiant!");
                ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_INPUT, ""Blue"Uþsiregistruokite", ""White"Sveiki atvykæ á "Red""NAME""White"!\n"White"Norëdami pradëti þaisti, turite uþsiregistruoti!\n\n"White"Áraðykite "Red"savo"White" slaptaþodá:", "Registruotis", "Atðaukti");
        }
    }
    if(dialogid == DIALOG_LOGIN)
    {
        if(!response)
        {
                SendClientMessage(playerid, 0xFF0000FF, "[KLAIDA] Turite prisijungti prieð pradedant þaisti");
                ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_INPUT, ""Blue"Prisijunkite", ""White"Sveiki sugráþæ á "Red""NAME""White"!\n"White"Norëdami pradëti þaisti, turite prisijungti!\n\n"White"Áveskite "Red"savo"White" slaptaþodá:", "Prisijungti", "Atðaukti");
        }
        if(response)
        {
            new query[200], pname[24], escapepass[100];
            GetPlayerName(playerid, pname, 24);
            mysql_real_escape_string(inputtext, escapepass);
            format(query, sizeof(query), "SELECT `user` FROM playerdata WHERE user = '%s' AND password = SHA1('%s')", pname, escapepass);
            mysql_query(query);
            mysql_store_result();
            new numrows = mysql_num_rows();
            if(numrows == 1) MySQL_Login(playerid);
            if(!numrows)
            {
                ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_INPUT, ""Blue"Prisijunkite", ""White"Sveiki sugráþæ á "Red""NAME""White"!\n"White"Norëdami pradëti þaisti, turite prisijungti!\n\n"White"Áveskite "Red"savo"White" slaptaþodá:", "Prisijungti", "Atðaukti");
                SendClientMessage(playerid, 0xFF0000FF, "[KLAIDA] Neteisingas slaptaþodis!");
            }
            mysql_free_result();
        }
    }
    
    if(dialogid == 3)
    {
        if(response)
        {

            if(listitem == 0) 
            {
                PlayerInfo[playerid][pIstorija]=1;
                SetPlayerSkin(playerid, 100);
            }
            if(listitem == 1)
            {
                PlayerInfo[playerid][pIstorija]=2;
                SetPlayerSkin(playerid, 86);
            }
            if(listitem == 2) 
            {
                PlayerInfo[playerid][pIstorija]=3;
                SetPlayerSkin(playerid, 28);
            }
        }
        return 1;
    }
    return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}

public OnPlayerCommandPerformed(playerid, cmdtext[], success)
{
   if(!success) return SendClientMessage(playerid, 0xFF0000FF, "{FFFFFF}[SERVERIS]: {FF0000}Tokios komandos nëra! /pagalba.");
   return 1;
}

CMD:money(playerid, params[])
{
	GivePlayerMoney(playerid, 2470);
	SendClientMessage(playerid, 0xFF0000FF, "Gavai 2470$");
	return 1;
}

CMD:kill(playerid, params[])
{
	SetPlayerHealth(playerid, 0);
	SendClientMessage(playerid, 0xFF0000FF, "Nusiþudei");
	return 1;
}

CMD:guns(playerid, params[])
{
	GivePlayerWeapon(playerid, 1, 5000);
	GivePlayerWeapon(playerid, 9, 5000);
	GivePlayerWeapon(playerid, 24, 5000);
	GivePlayerWeapon(playerid, 25, 5000);
	GivePlayerWeapon(playerid, 28, 5000);
	GivePlayerWeapon(playerid, 35, 5000);
	GivePlayerWeapon(playerid, 37, 5000);
	GivePlayerWeapon(playerid, 38, 5000);
	SendClientMessage(playerid, 0xFF0000FF, "Gavai ginklus.");
	return 1;
}

COMMAND:komandos(playerid, params[])
{
	new string[512];
	strcat(string,"/rules - Serverio taisyklës (bûtina þinoti)\n");
	strcat(string,"/kill - Nusiþudyti\n");
	strcat(string,"/t [tekstas] - Nusiunèia þinutæ tik jûsø gaujai\n");
	strcat(string,"/stats - Profilio statistika\n");
	strcat(string,"/skills - Ágûdþiø statistika\n");
	strcat(string,"/guns - Ginklø pasirinkimas\n");
	strcat(string,"/clearguns - Iðvalyti visus pasirinktus ginklus\n");
	strcat(string,"/vkomandos - Vip komandos\n");
	strcat(string,"/akomandos - AdminLevel komandos\n");
	strcat(string,"/pm [þaidëjo id/vardas] [tekstas] - Nusiunèia privaèià þinutæ kitam þaidëjui\n");
	strcat(string,"/AdminLevel - Parodo prisijungusià administracijà\n");
	strcat(string,"/vip - Parodo prisijungusius vipus\n");
	strcat(string,"/top - Serverio TOP\n");
 	ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "Serverio Komandos", string, "Uþdaryti", "");
 	return true;
}

COMMAND:taisykles(playerid, params[])
{
	new string[512];
	strcat(string,"1. Draudþiama sukèiauti bet kokiais bûdais\n");
	strcat(string,"2. Draudþiama kenkti serverio veikimui\n");
	strcat(string,"3. Draudþiama keiktis, áþeidinëti kitus þaidëjus\n");
	strcat(string,"4. Draudþiama reklamuoti kità serverá ar svetainæ\n");
 	ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "Serverio Taisyklës", string, "Uþdaryti", "");
 	return true;
}

COMMAND:vkomandos(playerid, params[])
{
	new string[512];
	strcat(string,"/v [tekstas] - Nusiunèia þinutæ tik vipø chatui\n");
 	ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "Serverio Komandos", string, "Uþdaryti", "");
 	return true;
}

COMMAND:akomandos(playerid, params[])
{
	new string[512];
	strcat(string,"/a [tekstas] - Nusiunèia þinutæ tik adminø chatui\n");
	strcat(string,"/ban - uþblokuoti þaidëjà, tik 2 lygio\n");
	strcat(string,"/kick - iðmesti þaidëjà, tik 1 lygio\n");
	strcat(string,"/drop - iðmeta þaidëja á virðø (patikrinti ar invl)\n");
	strcat(string,"/spec - stebëti þaidëjà\n");
	strcat(string,"/specoff - nebestebëti þaidëjà\n");
 	ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "Serverio Komandos", string, "Uþdaryti", "");
 	return true;
}

public settime(playerid)
{
	new string[256],year,month,day,hours,minutes;
	getdate(year, month, day), gettime(hours, minutes);
	format(string, sizeof string, "%s%d.%s%d.%d", (year < 10) ? ("0") : (""), year, ((month < 10) ? ("0") : ("")), month, day);
	TextDrawSetString(Date, string);
	format(string, sizeof string, "%s%d:%s%d", (hours < 10) ? ("0") : (""), hours, (minutes < 10) ? ("0") : (""), minutes);
	TextDrawSetString(Time, string);
}

stock MySQL_Register(playerid, passwordstring[])
{
    new query[350], pname[24], IP[15];
    new Bannedby[20];
    format(Bannedby, 20, "Not Banned");
    GetPlayerName(playerid, pname, 24);
    GetPlayerIp(playerid, IP, 15);
    format(query, sizeof(query), "INSERT INTO playerdata (user, password, score, money, level, vip, istorija, rank, kills, deaths, muted, jailed, frozen, mutedtimes, jailedtimes, frozentimes, banned, bannedby, logins, posx, posy, posz, posa, IP) VALUES('%s', SHA1('%s'), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '%s', 0, 0, 0, 0, 0, '%s')", pname, passwordstring, Bannedby, IP);
    mysql_query(query);
    SendClientMessage(playerid, 0xFF0000FF, "Sëkmingai uþsiregistravai serveryje!");
    Logged[playerid] = 1;
    return 1;
}

stock MySQL_Login(playerid)
{
    new query[300], pname[24], savingstring[20];
    GetPlayerName(playerid, pname, 24);
    format(query, sizeof(query), "SELECT score, money, level, vip, istorija, rank, kills, deaths, muted, jailed, frozen, mutedtimes, jailedtimes, frozentimes, banned, bannedby, logins, posx, posy, posz, posa FROM playerdata WHERE user = '%s'", pname);
    mysql_query(query);
    mysql_store_result();
    while(mysql_fetch_row_format(query,"|"))
    {
        mysql_fetch_field_row(savingstring, "score"); SetPlayerScore(playerid, strval(savingstring));
        mysql_fetch_field_row(savingstring, "money"); MoneyGiven[playerid] = strval(savingstring);
        mysql_fetch_field_row(savingstring, "level"); PlayerInfo[playerid][pLevel] = strval(savingstring);
        mysql_fetch_field_row(savingstring, "vip"); PlayerInfo[playerid][pVIP] = strval(savingstring);
        mysql_fetch_field_row(savingstring, "istorija"); new skinas = strval(savingstring);
        mysql_fetch_field_row(savingstring, "rank"); PlayerInfo[playerid][pRank] = strval(savingstring);
        mysql_fetch_field_row(savingstring, "kills"); PlayerInfo[playerid][pKills] = strval(savingstring);
        mysql_fetch_field_row(savingstring, "deaths"); PlayerInfo[playerid][pDeaths] = strval(savingstring);
        mysql_fetch_field_row(savingstring, "muted"); PlayerInfo[playerid][pMuted] = strval(savingstring);
        mysql_fetch_field_row(savingstring, "jailed"); PlayerInfo[playerid][pJailed] = strval(savingstring);
        mysql_fetch_field_row(savingstring, "frozen"); PlayerInfo[playerid][pFrozen] = strval(savingstring);
        mysql_fetch_field_row(savingstring, "mutedtimes"); PlayerInfo[playerid][pMutedTimes] = strval(savingstring);
        mysql_fetch_field_row(savingstring, "jailedtimes"); PlayerInfo[playerid][pJailedTimes] = strval(savingstring);
        mysql_fetch_field_row(savingstring, "frozentimes"); PlayerInfo[playerid][pFrozenTimes] = strval(savingstring);
        mysql_fetch_field_row(savingstring, "banned"); PlayerInfo[playerid][pBanned] = strval(savingstring);
        mysql_fetch_field_row(savingstring, "bannedby"); PlayerInfo[playerid][pBannedBy] = strval(savingstring);
        mysql_fetch_field_row(savingstring, "logins"); PlayerInfo[playerid][pLogins] = strval(savingstring);
        mysql_fetch_field_row(savingstring, "posx"); PlayerInfo[playerid][pPosX] = strval(savingstring);
        mysql_fetch_field_row(savingstring, "posy"); PlayerInfo[playerid][pPosY] = strval(savingstring);
        mysql_fetch_field_row(savingstring, "posz"); PlayerInfo[playerid][pPosZ] = strval(savingstring);
        mysql_fetch_field_row(savingstring, "posa"); PlayerInfo[playerid][pPosA] = strval(savingstring);
    }
    mysql_free_result();
    JustLogged[playerid] = 1;
    Logged[playerid] = 1;
    PlayerInfo[playerid][pLogins]++;
 /*   SetPlayerPos(playerid, PlayerInfo[playerid][pPosX], PlayerInfo[playerid][pPosY], PlayerInfo[playerid][pPosZ]);
    SetPlayerFacingAngle(playerid, PlayerInfo[playerid][pPosA]);*/
    SetSpawnInfo(playerid, GetPlayerTeam(playerid), ReturnSkin(skinas),PlayerInfo[playerid][pPosX], PlayerInfo[playerid][pPosY], PlayerInfo[playerid][pPosZ],PlayerInfo[playerid][pPosA],0,0,0,0,0,0);
    SpawnPlayer(playerid);
    SendClientMessage(playerid, 0xFF0000FF, "Sëkmingai prisijungëte!");
    return 1;
}

stock GetName(playerid)
{
	new pname[24];
	GetPlayerName(playerid, pname, 24);
	return pname;
}

stock ReturnSkin(istorija)
{
	switch(istorija)
	{
	case 1: return 100;
	case 2: return 86;
	case 3: return 28;
	}
	return 1;
}
