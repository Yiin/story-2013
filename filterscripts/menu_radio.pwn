#define FILTERSCRIPT

#include <a_samp>
#include <streamer>
#include <YSI\y_hooks>
#include <YSI\y_iterate>
#include <3DMenu>

new Player3DMenu[MAX_PLAYERS];

public OnFilterScriptInit()
{
	for(new i = 0; i < MAX_PLAYERS; i++) Player3DMenu[i] = -1;
	return 1;
}

public OnFilterScriptExit()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
	    if(Player3DMenu[i] != -1)
	    {
	        Destroy3DMenu(Player3DMenu[i]);
	        StopAudioStreamForPlayer(i);
		}
	}
	return 0;
}

public OnPlayerConnect(playerid)
{
    Player3DMenu[playerid] = -1;
    return 0;
}

public OnPlayerCommandText(playerid,cmdtext[])
{
	if(!strcmp(cmdtext,"/show_radio_menu",true))
	{
		if(Player3DMenu[playerid] != -1) return SendClientMessage(playerid,-1,"You have been shown menu already.");
		if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT)
		{
  			SendClientMessage(playerid,-1,"Please, exit from vehicle/spectacing mode/passenger seat/death state.");
     		return 1;
		}
		new Float:x,Float:y,Float:z,Float:rot;
		GetPlayerPos(playerid,x,y,z);
		GetPlayerFacingAngle(playerid,rot);
		Player3DMenu[playerid] = Create3DMenu(x,y,z,rot,16,playerid);
		SetBoxText(Player3DMenu[playerid],0,"TechnoBase.FM",OBJECT_MATERIAL_SIZE_256x128,"Impact",36,0,0xFFFFFFFF,0xAAFF8200,0xAA808080,OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
		SetBoxText(Player3DMenu[playerid],1,"Radio Paradise",OBJECT_MATERIAL_SIZE_256x128,"Impact",36,0,0xFFFFFFFF,0xAAFF8200,0xAA808080,OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
		SetBoxText(Player3DMenu[playerid],2,"Sofa FM\nGroove Salad",OBJECT_MATERIAL_SIZE_256x128,"Impact",36,0,0xFFFFFFFF,0xAAFF8200,0xAA808080,OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
		SetBoxText(Player3DMenu[playerid],3," DEFJAY.DE",OBJECT_MATERIAL_SIZE_256x128,"Impact",36,0,0xFFFFFFFF,0xAAFF8200,0xAA808080,OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
		SetBoxText(Player3DMenu[playerid],4,"FREQUENCE3",OBJECT_MATERIAL_SIZE_256x128,"Impact",36,0,0xFFFFFFFF,0xAAFF8200,0xAA808080,OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
		SetBoxText(Player3DMenu[playerid],5,"Megahitradio",OBJECT_MATERIAL_SIZE_256x128,"Impact",36,0,0xFFFFFFFF,0xAAFF8200,0xAA808080,OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
		SetBoxText(Player3DMenu[playerid],6,"RockRadio1.Com",OBJECT_MATERIAL_SIZE_256x128,"Impact",36,0,0xFFFFFFFF,0xAAFF8200,0xAA808080,OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
		SetBoxText(Player3DMenu[playerid],7,"NOISEfm.pl",OBJECT_MATERIAL_SIZE_256x128,"Impact",36,0,0xFFFFFFFF,0xAAFF8200,0xAA808080,OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
		SetBoxText(Player3DMenu[playerid],8,"1POWER",OBJECT_MATERIAL_SIZE_256x128,"Impact",36,0,0xFFFFFFFF,0xAAFF8200,0xAA808080,OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
		SetBoxText(Player3DMenu[playerid],9,"friskyRadio",OBJECT_MATERIAL_SIZE_256x128,"Impact",36,0,0xFFFFFFFF,0xAAFF8200,0xAA808080,OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
		SetBoxText(Player3DMenu[playerid],10,"PulsRadio",OBJECT_MATERIAL_SIZE_256x128,"Impact",36,0,0xFFFFFFFF,0xAAFF8200,0xAA808080,OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
		SetBoxText(Player3DMenu[playerid],11,"DIGITALLY IMPORTED\nChillout",OBJECT_MATERIAL_SIZE_256x128,"Impact",36,0,0xFFFFFFFF,0xAAFF8200,0xAA808080,OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
		SetBoxText(Player3DMenu[playerid],12,"MixNation",OBJECT_MATERIAL_SIZE_256x128,"Impact",36,0,0xFFFFFFFF,0xAAFF8200,0xAA808080,OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
		SetBoxText(Player3DMenu[playerid],13,"TECHNO4EVER",OBJECT_MATERIAL_SIZE_256x128,"Impact",36,0,0xFFFFFFFF,0xAAFF8200,0xAA808080,OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
		SetBoxText(Player3DMenu[playerid],14,"Stop",OBJECT_MATERIAL_SIZE_256x128,"Impact",36,0,0xFFFFFFFF,0xAAFF8200,0xAA808080,OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
		SetBoxText(Player3DMenu[playerid],15,"Exit",OBJECT_MATERIAL_SIZE_256x128,"Impact",36,0,0xFFFFFFFF,0xAAFF8200,0xAA808080,OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
		SendClientMessage(playerid,-1,"Use ''Y'' and ''N'' to select box, press 'Space' to accept your choise.");
		Streamer_UpdateEx(playerid,x,y,z);
		Select3DMenu(playerid,Player3DMenu[playerid]);
		return 1;
	}
	return 0;
}

public OnPlayerSelect3DMenuBox(playerid,MenuID,selected)
{
	if(Player3DMenu[playerid] == MenuID)
	{
	    if(selected >= 0 && selected < 14) StopAudioStreamForPlayer(playerid);
	    if(selected == 0) PlayAudioStreamForPlayer(playerid,"http://78.159.104.167:80");
	    if(selected == 1) PlayAudioStreamForPlayer(playerid,"http://scfire-mtc-aa04.stream.aol.com:80/stream/1048");
	    if(selected == 2) PlayAudioStreamForPlayer(playerid,"http://scfire-mtc-aa04.stream.aol.com:80/stream/1018");
	    if(selected == 3) PlayAudioStreamForPlayer(playerid,"http://87.230.56.38:80");
	    if(selected == 4) PlayAudioStreamForPlayer(playerid,"http://193.251.154.242:8000");
		if(selected == 5) PlayAudioStreamForPlayer(playerid,"http://212.48.110.70:30710");
		if(selected == 6) PlayAudioStreamForPlayer(playerid,"http://78.129.227.10:8000");
		if(selected == 7) PlayAudioStreamForPlayer(playerid,"http://94.23.216.58:8000");
		if(selected == 8) PlayAudioStreamForPlayer(playerid,"http://scfire-dtc-aa03.stream.aol.com:80/stream/1044");
		if(selected == 9) PlayAudioStreamForPlayer(playerid,"http://scfire-ntc-aa02.stream.aol.com:80/stream/1015");
		if(selected == 10) PlayAudioStreamForPlayer(playerid,"http://87.98.131.132:5000");
		if(selected == 11) PlayAudioStreamForPlayer(playerid,"http://scfire-dtc-aa04.stream.aol.com:80/stream/1035");
		if(selected == 12) PlayAudioStreamForPlayer(playerid,"http://80.237.152.81:80");
		if(selected == 13) PlayAudioStreamForPlayer(playerid,"http://80.237.159.41:7000");
		if(selected == 14) StopAudioStreamForPlayer(playerid);
		if(selected == 15)
		{
			Destroy3DMenu(Player3DMenu[playerid]);
			Player3DMenu[playerid] = -1;
		}
	}
	return 0;
}
