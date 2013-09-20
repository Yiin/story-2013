#define FILTERSCRIPT
#define by_Yiin

#include <a_samp>
new Text:tdjunk;
new Text:Textdraw0;
new Text:Textdraw1;

public OnFilterScriptInit()
{
    //AntiDeAMX();
	print("---:: Logotipas");
	
	tdjunk = TextDrawCreate(0,0," ");
	TextDrawFont(tdjunk, 0);
	
	Textdraw0 = TextDrawCreate(520.995544, 435.166748, "virtualLife");
	TextDrawLetterSize(Textdraw0, 0.347626, 1.196333);
	TextDrawAlignment(Textdraw0, 1);
	TextDrawColor(Textdraw0, -5963521);
	TextDrawSetShadow(Textdraw0, 0);
	TextDrawSetOutline(Textdraw0, 1);
	TextDrawFont(Textdraw0, 1);
	TextDrawSetProportional(Textdraw0, 1);

	Textdraw1 = TextDrawCreate(611.483398, 435.583374, "0.0.1");
	TextDrawLetterSize(Textdraw1, 0.284376, 1.178832);
	TextDrawAlignment(Textdraw1, 3);
	TextDrawColor(Textdraw1, 255);
	TextDrawSetShadow(Textdraw1, 0);
	TextDrawSetOutline(Textdraw1, 1);
	TextDrawFont(Textdraw1, 2);
	TextDrawSetProportional(Textdraw1, 1);
	
	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}



public OnPlayerRequestClass(playerid, classid)
{
	TextDrawShowForPlayer(playerid, Textdraw0);
	TextDrawShowForPlayer(playerid, Textdraw1);
	return 1;
}