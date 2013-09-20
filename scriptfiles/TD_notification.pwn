// These textdraws has been generated using iPLEOMAX's TextDraw Editor.
// Thank you for using this tool!

//Global Textdraws:
new Text:Textdraw0 = Text:INVALID_TEXT_DRAW;
new Text:Textdraw1 = Text:INVALID_TEXT_DRAW;

public OnFilterScriptInit() //or OnGameModeInit()
{
	Textdraw0 = TextDrawCreate(438.000, 15.685, "box");
	TextDrawLetterSize(Textdraw0, 0.000, 0.703);
	TextDrawTextSize(Textdraw0, 195.500, 0.000);
	TextDrawAlignment(Textdraw0, 1);
	TextDrawColor(Textdraw0, 0);
	TextDrawUseBox(Textdraw0, 1);
	TextDrawBoxColor(Textdraw0, 23);
	TextDrawFont(Textdraw0, 0);

	Textdraw1 = TextDrawCreate(319.500, 13.439, "uzvedei varikli");
	TextDrawLetterSize(Textdraw1, 0.200, 1.077);
	TextDrawAlignment(Textdraw1, 2);
	TextDrawColor(Textdraw1, -1);
	TextDrawSetOutline(Textdraw1, -1);
	TextDrawBackgroundColor(Textdraw1, 51);
	TextDrawFont(Textdraw1, 2);
	TextDrawSetProportional(Textdraw1, 1);

	return 1;
}

public OnFilterScriptExit() //or OnGameModeExit
{
	TextDrawDestroy(Textdraw0);
	Textdraw0 = Text:INVALID_TEXT_DRAW;

	TextDrawDestroy(Textdraw1);
	Textdraw1 = Text:INVALID_TEXT_DRAW;

	return 1;
}

////////////////////////////////////////////////////////////////////////////////

