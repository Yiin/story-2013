#if defined _clan_included
	#endinput
#endif
#define _clan_included

#include <a_mysql>

#define CLANHOST 			"localhost"
#define CLANUSER	 		"root"
#define CLANPASS		 	""
#define CLANDB				"gaujos"

/*Natives:
native CreateClan(playerid, clan_name[], clan_tag[], clan_pass[], clan_description[]);
native AddPlayerToClan(playerid, addid);
native RemovePlayerFromClan(playerid, removeid);
native LeaveClan(playerid);
native DisbandClan(playerid);
native ChangePlayerClanRank(playerid, giveid, rank);
native ChangeClanDescription(playerid, new_description[]);
native ChangeClanPassword(playerid, newpass[]);
native IsPlayerAnyClanMember(playerid);
native IsPlayerClanMember(playerid, clan_name[]);
native GetPlayerClan(playerid);
native GetPlayerClanRank(playerid);
native GetClanDescription(clan[]);
native GetClanMembers(clan[]);
native SendMessageToClanMembers(playerid, color, msg[]);
*/

stock ClanOnGameModeInit()
{
	mysql_connect(CLANHOST,CLANUSER,CLANDB,CLANPASS);
	mysql_debug(1);
    mysql_query("CREATE TABLE IF NOT EXISTS clans(clanname VARCHAR(30), clantag VARCHAR(5), clanpass VARCHAR(10), clandes VARCHAR(100), clanmotd VARCHAR(50))");
	mysql_query("CREATE TABLE IF NOT EXISTS members(clanname VARCHAR(30), playername VARCHAR(30), playerclanrank INT(5), isinclan INT(2))");
	return 1;
}

forward CLAN_OnPlayerSpawn(playerid);
public OnPlayerSpawn(playerid)
{
	if(funcidx("CLAN_OnPlayerSpawn") != -1) CallLocalFunction("CLAN_OnPlayerSpawn", "d", playerid);
	return 1;
}
#if defined _ALS_OnPlayerSpawn
        #undef OnPlayerSpawn
#else
        #define _ALS_OnPlayerSpawn
#endif
#define OnPlayerSpawn CLAN_OnPlayerSpawn

forward CLAN_OnPlayerText(playerid, text[]);
public OnPlayerText(playerid, text[])
{
	if(text[0] == '$')
  	{
  		new str[128], name[24];
		GetPlayerName(playerid, name, 24);
		format(str, 128, "{FF0000}[CLAN CHAT] {03F2FF}%s(%d): {FFFFFF}%s", name, playerid, text[1]);
		SendMessageToClanMembers(playerid, -1,str);
		return 0;
	}	
	if(funcidx("CLAN_OnPlayerText") != -1) CallLocalFunction("CLAN_OnPlayerText", "ds", playerid, text);
	return 1;
}
#if defined _ALS_OnPlayerText
        #undef OnPlayerText
#else
        #define _ALS_OnPlayerText
#endif
#define OnPlayerText CLAN_OnPlayerText

stock CreateClan(playerid, clan_name[], clan_tag[], clan_pass[], clan_description[])
{
	if(IsPlayerAnyClanMember(playerid) == 0)
	{
		CallLocalFunction("OnPlayerClanCreate", "is", playerid, clan_name);
		new clanquery3[100];
		format(clanquery3, sizeof(clanquery3), "SELECT clanname FROM clans WHERE clanname = '%s'", clan_name);
		mysql_query(clanquery3);
		mysql_store_result();
		new rows = mysql_num_rows();
		if(rows >= 1) return SendClientMessage(playerid,-1,"{FF0000}ERROR: {FFFFFF}Clan with that name already exists!");
		mysql_free_result();
		new clanquery[300];
		format(clanquery,sizeof(clanquery),"INSERT INTO clans(clanname, clantag, clanpass, clandes) VALUES('%s', '%s', '%s', '%s', '%s')", clan_name, clan_tag, clan_pass, clan_description);
		mysql_query(clanquery);
		new player_name[MAX_PLAYER_NAME];
		GetPlayerName(playerid,player_name,sizeof(player_name));
		new clanquery2[300];
		format(clanquery2,sizeof(clanquery2),"INSERT INTO members(clanname, playername, playerclanrank, isinclan) VALUES('%s', '%s', 4, 1)", clan_name, player_name);
		mysql_query(clanquery2);
		return 1;
	}
	else SendClientMessage(playerid,-1,"{FF0000}ERROR: {FFFFFF}You are already in a clan, you cant create new one!");
	return 1;
}

stock AddPlayerToClan(playerid, addid)
{
	if(GetPlayerClanRank(playerid) >= 2)
	{
		if(!IsPlayerAnyClanMember(addid))
		{
			CallLocalFunction("OnPlayerAddPlayerToClan", "iis", playerid, addid, GetPlayerClan(playerid));
			new player_name[MAX_PLAYER_NAME];
			GetPlayerName(playerid,player_name,sizeof(player_name));
			new add_name[MAX_PLAYER_NAME];
			GetPlayerName(addid,add_name,sizeof(add_name));
			new clanquery[300];
			format(clanquery,sizeof(clanquery),"INSERT INTO members(clanname, playername, playerclanrank, isinclan) VALUES('%s', '%s', 1, 1)", GetPlayerClan(playerid), add_name);
			mysql_query(clanquery);
			new msg_for_all[100];
			format(msg_for_all,sizeof(msg_for_all),"{03F2FF}CLAN: {00FF40}%s {FFFFFF}added {00FF40}%s {FFFFFF}to clan {FFFF00}%s", player_name, add_name, GetPlayerClan(playerid));
			SendClientMessageToAll(-1,msg_for_all);
			return 1;
		}
		else SendClientMessage(playerid,-1,"{FF0000}ERROR: {FFFFFF}Player is already in a clan!");
	}
	else SendClientMessage(playerid,-1,"{FF0000}ERROR: {FFFFFF}You must be an {00FF40}Officer {FFFFFF}or {00FF40}Clan Leader/Subleader {FFFFFF}to add people to clan!");
	return 1;
}

stock RemovePlayerFromClan(playerid, removeid)
{
	if(GetPlayerClanRank(playerid) >= 2)
	{
		if(IsPlayerClanMember(removeid,GetPlayerClan(playerid)))
		{
			CallLocalFunction("OnPlayerRemovePlayerFromClan", "iis", playerid, removeid, GetPlayerClan(playerid));
			new player_name[MAX_PLAYER_NAME];
			GetPlayerName(playerid,player_name,sizeof(player_name));
			new remove_name[MAX_PLAYER_NAME];
			GetPlayerName(removeid,remove_name,sizeof(remove_name));
			new clanquery[300];
			format(clanquery, sizeof(clanquery), "DELETE FROM members WHERE playername = '%s'", remove_name);
			mysql_query(clanquery);
			new msg_for_all[100];
			format(msg_for_all,sizeof(msg_for_all),"{03F2FF}CLAN: {00FF40}%s {FFFFFF}removed {00FF40}%s {FFFFFF}from clan {FFFF00}%s", player_name, remove_name, GetPlayerClan(playerid));
			SendClientMessageToAll(-1,msg_for_all);
			return 1;
		}
		else SendClientMessage(playerid,-1,"{FF0000}ERROR: {FFFFFF}Player is not in your clan!");
	}
	else SendClientMessage(playerid,-1,"{FF0000}ERROR: {FFFFFF}You must be an {00FF40}Officer {FFFFFF}or {00FF40}Clan Leader/Subleader {FFFFFF}to remove people from clan!");
	return 1;
}

stock LeaveClan(playerid)
{
	if(GetPlayerClanRank(playerid) < 4)
	{
		if(IsPlayerAnyClanMember(playerid) == 1)
		{
			CallLocalFunction("OnPlayerLeaveClan", "is", playerid, GetPlayerClan(playerid));
			new leave_name[MAX_PLAYER_NAME];
			GetPlayerName(playerid,leave_name,sizeof(leave_name));
			new msg_for_all[100];
			format(msg_for_all,sizeof(msg_for_all),"{03F2FF}CLAN: {00FF40}%s {FFFFFF}left clan {FFFF00}%s", leave_name, GetPlayerClan(playerid));
			SendClientMessageToAll(-1,msg_for_all);
			new clanquery[300];
			format(clanquery, sizeof(clanquery), "DELETE FROM members WHERE playername = '%s'", leave_name);
			mysql_query(clanquery);
		}
		else SendClientMessage(playerid,-1,"{FF0000}ERROR: {FFFFFF}You are not in a clan!");
	}
	else SendClientMessage(playerid,-1,"{FF0000}ERROR: {FFFFFF}Leaders can't leave clan! You can disband your clan or assign a new clan leader!");
	return 1;
}

stock DisbandClan(playerid)
{
	if(IsPlayerAnyClanMember(playerid))
	{
		if(GetPlayerClanRank(playerid) >= 4)
		{
			CallLocalFunction("OnPlayerDisbandClan", "is", playerid, GetPlayerClan(playerid));
			new player_name[MAX_PLAYER_NAME];
			GetPlayerName(playerid,player_name,sizeof(player_name));
			new msg_for_all[100];
			format(msg_for_all,sizeof(msg_for_all),"{03F2FF}CLAN: {00FF40}%s {FFFFFF}disbanded clan {00FF40}%s", player_name, GetPlayerClan(playerid));
			SendClientMessageToAll(-1,msg_for_all);
			new clanquery[300];
			format(clanquery, sizeof(clanquery), "DELETE FROM clans WHERE clanname = '%s'", GetPlayerClan(playerid));
			mysql_query(clanquery);
			return 1;
		}
		else SendClientMessage(playerid,-1,"{FF0000}ERROR: {FFFFFF}You are not clan leader!");
	}
	else SendClientMessage(playerid,-1,"{FF0000}ERROR: {FFFFFF}You are not in a clan!");
	return 1;
}

stock ChangePlayerClanRank(playerid, giveid, new_rank)
{
	if(IsPlayerAnyClanMember(playerid) == 1)
	{
		if(GetPlayerClanRank(playerid) >= 2)
		{
			if(IsPlayerClanMember(giveid,GetPlayerClan(playerid)))
			{
				CallLocalFunction("OnPlayerChangePlayerRank", "iii", playerid, giveid, new_rank);
				new player_name[MAX_PLAYER_NAME];
				GetPlayerName(playerid,player_name,sizeof(player_name));
				new give_name[MAX_PLAYER_NAME];
				GetPlayerName(giveid,give_name,sizeof(give_name));
				new clanquery[300];
				format(clanquery, sizeof(clanquery), "UPDATE members SET playerclanrank = %d WHERE playername = '%s'", new_rank, give_name);
				mysql_query(clanquery);
				new msg_for_all[100];
				format(msg_for_all,sizeof(msg_for_all),"{03F2FF}CLAN: {00FF40}%s {FFFFFF}changed rank of clanmate {00FF40}%s {FFFFFF}to rank %d (clan: {00FF40}%s)", player_name, give_name, new_rank, GetPlayerClan(playerid));
				SendClientMessageToAll(-1,msg_for_all);
			}
			else SendClientMessage(playerid,-1,"{FF0000}ERROR: {FFFFFF}Player is not in your clan!");
		}
		else SendClientMessage(playerid,-1,"{FF0000}ERROR: {FFFFFF}You must be an {00FF40}Officer {FFFFFF}or {00FF40}Clan Leader/Subleader {FFFFFF}to change members' clan rank!");
	}
	else SendClientMessage(playerid,-1,"{FF0000}ERROR: {FFFFFF}You are not part of a clan!");
	return 1;
}

stock ChangeClanDescription(playerid, new_description[])
{
	if(IsPlayerAnyClanMember(playerid) == 1)
	{
		if(GetPlayerClanRank(playerid) >= 2)
		{
			CallLocalFunction("OnPlayerChangeClanDescription", "is", playerid, new_description);
			new clanquery[300];
			format(clanquery, sizeof(clanquery), "UPDATE clans SET clandes = '%s' WHERE clanname = '%s'", new_description, GetPlayerClan(playerid));
			mysql_query(clanquery);
			new msg_for_play[100];
			format(msg_for_play,sizeof(msg_for_play),"{03F2FF}CLAN: {FFFFFF}You changed clan's description to {00FF40}%s", new_description);
			SendClientMessage(playerid,-1,msg_for_play);
		}
		else SendClientMessage(playerid,-1,"{FF0000}ERROR: {FFFFFF}You must be an {00FF40}Officer {FFFFFF}or {00FF40}Clan Leader/Subleader {FFFFFF}to change clan's description!");
	}
	else SendClientMessage(playerid,-1,"{FF0000}ERROR: {FFFFFF}You are not in a clan!");
	return 1;
}

stock ChangeClanPassword(playerid, new_pass[])
{
	if(IsPlayerAnyClanMember(playerid) == 1)
	{
		if(GetPlayerClanRank(playerid) >= 3)
		{
			CallLocalFunction("OnPlayerChangeClanPassword", "is", playerid, new_pass);
			new clanquery[300];
			format(clanquery, sizeof(clanquery), "UPDATE clans SET clanpass = '%s' WHERE clanname = '%s'", new_pass, GetPlayerClan(playerid));
			mysql_query(clanquery);
			new msg_for_play[100];
			format(msg_for_play,sizeof(msg_for_play),"{03F2FF}CLAN: {FFFFFF}You changed clan's password to {00FF40}%s", new_pass);
			SendClientMessage(playerid,-1,msg_for_play);
		}
		else SendClientMessage(playerid,-1,"{FF0000}ERROR: {FFFFFF}You must be {00FF40}Clan Leader/Subleader {FFFFFF}to change clan's password!");
	}
	else SendClientMessage(playerid,-1,"{FF0000}ERROR: {FFFFFF}You are not in a clan!");
	return 1;
}

stock IsPlayerAnyClanMember(playerid)
{
	new player_name[MAX_PLAYER_NAME];
	GetPlayerName(playerid,player_name,sizeof(player_name));
	new clanquery[100];
	format(clanquery, sizeof(clanquery), "SELECT playername FROM members WHERE playername = '%s'", player_name);
	mysql_query(clanquery);
	mysql_store_result();
	new rows = mysql_num_rows();
	mysql_free_result();
	if(!rows) return 0;
	else return 1; 
}

stock IsPlayerClanMember(playerid, clan_name[])
{
	new player_name[MAX_PLAYER_NAME];
	GetPlayerName(playerid,player_name,sizeof(player_name));
	new clanquery[100];
	format(clanquery, sizeof(clanquery), "SELECT clanname FROM members WHERE playername = '%s' AND clanname = '%s'", player_name, clan_name);
	mysql_query(clanquery);
	mysql_store_result();
	new rows = mysql_num_rows();
	mysql_free_result();
	if(!rows) return 0;
	else return 1; 
}

stock GetPlayerClan(playerid)
{
	new player_name[MAX_PLAYER_NAME];
	GetPlayerName(playerid,player_name,sizeof(player_name));
	new clan_name[100];
	new clanquery[100];
	format(clanquery, sizeof(clanquery), "SELECT clanname FROM members WHERE playername = '%s'", player_name);
	mysql_query(clanquery);
	mysql_store_result();
	mysql_fetch_row(clan_name); 
	mysql_free_result();
	return clan_name;
}

stock GetPlayerClanRank(playerid)
{
	new player_name[MAX_PLAYER_NAME];
	GetPlayerName(playerid,player_name,sizeof(player_name));
	new rank[10];
	new clanquery[100];
	format(clanquery, sizeof(clanquery), "SELECT playerclanrank FROM members WHERE playername = '%s'", player_name);
	mysql_query(clanquery);
	mysql_store_result();
	mysql_fetch_row(rank); 
	mysql_free_result();
	return strval(rank);
}

stock GetClanDescription(clan[])
{
	new clanquery[100];
	new clan_desc[100];
	format(clanquery, sizeof(clanquery), "SELECT clandes FROM clans WHERE clanname = '%s'", clan);
	mysql_query(clanquery);
	mysql_store_result();
	mysql_fetch_row(clan_desc); 
	mysql_free_result();
	return clan_desc;
}

stock GetClanMembers(clan[])
{
	new clanquery[200];
	new minfo[300], mreturn[300];
	new string[300];
	format(clanquery, sizeof(clanquery), "SELECT * FROM members WHERE clanname = '%s'", clan);
	mysql_query(clanquery);
	mysql_store_result();
	while(mysql_fetch_row_format(clanquery,"|"))
	{
		mysql_fetch_field_row(string,"playername"); 
		format(minfo,sizeof(minfo),"%s\n",string);
		strcat(mreturn, minfo);
	}
	mysql_free_result();
	return mreturn;
}

stock SendMessageToClanMembers(playerid, color, msg[])
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerAnyClanMember(playerid) == 1)
		{
			if(IsPlayerConnected(i) == 1)
			{
				if(strcmp(GetPlayerClan(playerid), GetPlayerClan(i), true, 30) == 0)
				{
					SendClientMessage(i, color, msg);
				}
			}
		}
	}
	return 1;
}

forward OnPlayerClanCreate(playerid, clan_name[]);
forward OnPlayerAddPlayerToClan(playerid, addid, clan_name[]);
forward OnPlayerRemovePlayerFromClan(playerid, removeid, clan_name[]);
forward OnPlayerLeaveClan(playerid, clan_name[]);
forward OnPlayerDisbandClan(playerid, clan_name[]);
forward OnPlayerChangeClanDescription(playerid, new_description[]);
forward OnPlayerChangeClanPassword(playerid, new_pass[]);
forward OnPlayerChangePlayerRank(playerid, giveid, new_rank);