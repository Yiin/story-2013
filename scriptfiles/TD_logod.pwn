// These textdraws has been generated using iPLEOMAX's TextDraw Editor.
// Thank you for using this tool!

//Global Textdraws:
new Text:Textdraw0 = Text:INVALID_TEXT_DRAW;

public OnFilterScriptInit() //or OnGameModeInit()
{
	Textdraw0 = TextDrawCreate(223.953, 33.249, "soc:logo");
	TextDrawTextSize(Textdraw0, 197.714, 218.750);
	TextDrawAlignment(Textdraw0, 1);
	TextDrawColor(Textdraw0, -1);
	TextDrawFont(Textdraw0, 4);

	return 1;
}

public OnFilterScriptExit() //or OnGameModeExit
{
	TextDrawDestroy(Textdraw0);
	Textdraw0 = Text:INVALID_TEXT_DRAW;

	return 1;
}

////////////////////////////////////////////////////////////////////////////////

