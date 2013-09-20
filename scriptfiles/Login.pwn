/*
Filterscript generated using Zamaroht's TextDraw Editor Version 1.0.
Designed for SA-MP 0.3a.

Time and Date: 2012-9-10 @ 21:6:43

Instructions:
1- Compile this file using the compiler provided with the sa-mp server package.
2- Copy the .amx file to the filterscripts directory.
3- Add the filterscripts in the server.cfg file (more info here:
http://wiki.sa-mp.com/wiki/Server.cfg)
4- Run the server!

Disclaimer:
You have full rights over this file. You can distribute it, modify it, and
change it as much as you want, without having to give any special credits.
*/

#include <a_samp>

new Text:Textdraw1;
new Text:Textdraw2;
new Text:Textdraw3;
new Text:Textdraw4;

public OnFilterScriptInit()
{
	// Create the textdraws:

	Textdraw1 = TextDrawCreate(320.000000, -25.000000, "~n~");
	TextDrawAlignment(Textdraw1, 2);
	TextDrawBackgroundColor(Textdraw1, 255);
	TextDrawFont(Textdraw1, 1);
	TextDrawLetterSize(Textdraw1, 0.579999, 17.799999);
	TextDrawColor(Textdraw1, -1);
	TextDrawSetOutline(Textdraw1, 0);
	TextDrawSetProportional(Textdraw1, 1);
	TextDrawSetShadow(Textdraw1, 1);
	TextDrawUseBox(Textdraw1, 1);
	TextDrawBoxColor(Textdraw1, 255);
	TextDrawTextSize(Textdraw1, 1.000000, 641.000000);

	Textdraw2 = TextDrawCreate(320.000000, 315.000000, "~n~");
	TextDrawAlignment(Textdraw2, 2);
	TextDrawBackgroundColor(Textdraw2, 255);
	TextDrawFont(Textdraw2, 1);
	TextDrawLetterSize(Textdraw2, 0.579999, 17.799999);
	TextDrawColor(Textdraw2, -1);
	TextDrawSetOutline(Textdraw2, 0);
	TextDrawSetProportional(Textdraw2, 1);
	TextDrawSetShadow(Textdraw2, 1);
	TextDrawUseBox(Textdraw2, 1);
	TextDrawBoxColor(Textdraw2, 255);
	TextDrawTextSize(Textdraw2, 1.000000, 641.000000);

	Textdraw3 = TextDrawCreate(320.000000, 315.000000, "~n~");
	TextDrawAlignment(Textdraw3, 2);
	TextDrawBackgroundColor(Textdraw3, 255);
	TextDrawFont(Textdraw3, 1);
	TextDrawLetterSize(Textdraw3, 0.579999, -0.200002);
	TextDrawColor(Textdraw3, -1);
	TextDrawSetOutline(Textdraw3, 0);
	TextDrawSetProportional(Textdraw3, 1);
	TextDrawSetShadow(Textdraw3, 1);
	TextDrawUseBox(Textdraw3, 1);
	TextDrawBoxColor(Textdraw3, -65281);
	TextDrawTextSize(Textdraw3, 1.000000, 641.000000);

	Textdraw4 = TextDrawCreate(320.000000, 138.000000, "~n~");
	TextDrawAlignment(Textdraw4, 2);
	TextDrawBackgroundColor(Textdraw4, 255);
	TextDrawFont(Textdraw4, 1);
	TextDrawLetterSize(Textdraw4, 0.579999, -0.200002);
	TextDrawColor(Textdraw4, -1);
	TextDrawSetOutline(Textdraw4, 0);
	TextDrawSetProportional(Textdraw4, 1);
	TextDrawSetShadow(Textdraw4, 1);
	TextDrawUseBox(Textdraw4, 1);
	TextDrawBoxColor(Textdraw4, -65281);
	TextDrawTextSize(Textdraw4, 1.000000, 641.000000);

	return 1;
}

public OnFilterScriptExit()
{
	TextDrawHideForAll(Textdraw1);
	TextDrawDestroy(Textdraw1);
	TextDrawHideForAll(Textdraw2);
	TextDrawDestroy(Textdraw2);
	TextDrawHideForAll(Textdraw3);
	TextDrawDestroy(Textdraw3);
	TextDrawHideForAll(Textdraw4);
	TextDrawDestroy(Textdraw4);
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	TextDrawShowForPlayer(playerid, Textdraw1);
	TextDrawShowForPlayer(playerid, Textdraw2);
	TextDrawShowForPlayer(playerid, Textdraw3);
	TextDrawShowForPlayer(playerid, Textdraw4);
	return 1;
}

public OnPlayerSpawn(playerid)
{
	TextDrawHideForPlayer(playerid, Textdraw1);
	TextDrawHideForPlayer(playerid, Textdraw2);
	TextDrawHideForPlayer(playerid, Textdraw3);
	TextDrawHideForPlayer(playerid, Textdraw4);
	return 1;
}

