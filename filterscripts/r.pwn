/*
Online Players Record v2 by AirKite
*/
#include <a_samp>
new oplayers, Precord, Drecord, Mrecord, Yrecord, THrecord, TMrecord;
new mname[][] = {"Sausio", "Vasario", "Kovo", "Balandþio", "Geguþës", "Birþelio", "Liepos", "Rugpjûèio", "Rugsëjo", "Spalio", "Lapkrièio", "Gruodþio"};
public OnFilterScriptInit()
{
	LoadRecord();
	oplayers=ConnectedPlayers();
	print("FS =Online Players Record= by Airkite, Loaded...");
	return 1;
}
public OnFilterScriptExit()
{
	print("FS =Online Players Record= by Airkite, Unloaded...");
	return 1;
}
public OnPlayerConnect(playerid)
{
	if(IsPlayerNPC(playerid)) { return 1; }
	SetTimerEx("Record", 5000, false, "d", playerid);
	return 1;
}
public OnPlayerDisconnect(playerid, reason)
{
    oplayers--;
	return 1;
}
///////////////////////////////////////////////////////////////////////////
forward LoadRecord();
public LoadRecord()
{
	new strFromFile[24], arrCoords[6][5], File: file = fopen("porecords", io_read);
	if (file)
	{
		fread(file, strFromFile);
		split(strFromFile, arrCoords, ',');
		Precord = strval(arrCoords[0]);
		Drecord = strval(arrCoords[1]);
		Mrecord = strval(arrCoords[2]);
		Yrecord = strval(arrCoords[3]);
		THrecord = strval(arrCoords[4]);
		TMrecord = strval(arrCoords[5]);
		fclose(file);
	}
	return 1;
}
forward SaveRecord();
public SaveRecord()
{
	new coordsstring[24];
	format(coordsstring, sizeof(coordsstring), "%d,%d,%d,%d,%d,%d", Precord, Drecord, Mrecord, Yrecord, THrecord, TMrecord);
	new File: file = fopen("porecords", io_write);
	fwrite(file, coordsstring);
	fclose(file);
	return 1;
}
forward Record(playerid);
public Record(playerid)
{
	if(Precord)
	{
		new string[92];
		format(string, sizeof(string), "**Prisijungusiø þaidëjø rekordas %d, uþfiksuotas %d %s %d, %d:%dh", Precord, Yrecord, mname[Mrecord-1], Drecord, THrecord, TMrecord);
		SendClientMessage(playerid, 0xA5D24DFF, string);
	}
	oplayers++;
    if(Precord < oplayers)
    {
        Precord=oplayers;
        gettime(THrecord, TMrecord); getdate(Yrecord, Mrecord, Drecord);
        new string[92];
		format(string, sizeof(string), "*Naujas prisijungusiø þaidëjø rekordas %d, uþfiksuotas %d %s %d, %d:%dh", Precord, Yrecord, mname[Mrecord-1], Drecord, THrecord, TMrecord);
        SendClientMessageToAll(0xFCB833FF, string);
        SaveRecord();
    }
	return 1;
}
stock split(const strsrc[], strdest[][], delimiter)
{
    new i, li;
    new aNum;
    new len;
    while(i <= strlen(strsrc))
    {
        if(strsrc[i] == delimiter || i == strlen(strsrc))
        {
            len = strmid(strdest[aNum], strsrc, li, i, 128);
            strdest[aNum][len] = 0;
            li = i+1;
            aNum++;
        }
        i++;
    }
    return 1;
}
forward ConnectedPlayers();
public ConnectedPlayers()
{
	new Connected;
	for(new i = 0; i < MAX_PLAYERS; i++) if(IsPlayerConnected(i) && !IsPlayerNPC(i)) Connected++;
	return Connected;
}
///////////////////////////////////////////////////////////////////////////
