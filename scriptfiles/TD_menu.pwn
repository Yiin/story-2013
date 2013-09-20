// These textdraws has been generated using iPLEOMAX's TextDraw Editor.
// Thank you for using this tool!

//Global Textdraws:
new Text:Textdraw0 = Text:INVALID_TEXT_DRAW;

public OnFilterScriptInit() //or OnGameModeInit()
{
	Textdraw0 = TextDrawCreate(-0.500, -1.493, "soc:menu");
	TextDrawLetterSize(Textdraw0, 0.449, 1.600);
	TextDrawTextSize(Textdraw0, 272.500, 339.731);
	TextDrawAlignment(Textdraw0, 1);
	TextDrawColor(Textdraw0, -1);
	TextDrawSetOutline(Textdraw0, 1);
	TextDrawBackgroundColor(Textdraw0, 51);
	TextDrawFont(Textdraw0, 4);
	TextDrawSetProportional(Textdraw0, 1);

	return 1;
}

public OnFilterScriptExit() //or OnGameModeExit
{
	TextDrawDestroy(Textdraw0);
	Textdraw0 = Text:INVALID_TEXT_DRAW;

	return 1;
}

////////////////////////////////////////////////////////////////////////////////

