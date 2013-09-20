// These textdraws has been generated using iPLEOMAX's TextDraw Editor.
// Thank you for using this tool!

//Global Textdraws:
new Text:Textdraw0 = Text:INVALID_TEXT_DRAW;
new Text:Textdraw1 = Text:INVALID_TEXT_DRAW;
new Text:Textdraw2 = Text:INVALID_TEXT_DRAW;
new Text:Textdraw3 = Text:INVALID_TEXT_DRAW;
new Text:Textdraw4 = Text:INVALID_TEXT_DRAW;

public OnFilterScriptInit() //or OnGameModeInit()
{
	Textdraw0 = TextDrawCreate(641.500, 2.992, "box");
	TextDrawLetterSize(Textdraw0, 0.000, 9.930);
	TextDrawTextSize(Textdraw0, -2.000, 0.000);
	TextDrawAlignment(Textdraw0, 1);
	TextDrawColor(Textdraw0, 0);
	TextDrawUseBox(Textdraw0, 1);
	TextDrawBoxColor(Textdraw0, 102);
	TextDrawFont(Textdraw0, 0);

	Textdraw1 = TextDrawCreate(642.000, 375.329, "box");
	TextDrawLetterSize(Textdraw1, 0.000, 7.730);
	TextDrawTextSize(Textdraw1, -2.000, 0.000);
	TextDrawAlignment(Textdraw1, 1);
	TextDrawColor(Textdraw1, 0);
	TextDrawUseBox(Textdraw1, 1);
	TextDrawBoxColor(Textdraw1, 102);
	TextDrawFont(Textdraw1, 0);

	Textdraw2 = TextDrawCreate(321.000, 161.279, "Prisijungimas~n~Spausk ~b~SPACE~w~ noredamas prisijungti.");
	TextDrawLetterSize(Textdraw2, 0.372, 2.075);
	TextDrawTextSize(Textdraw2, 496.500, 335.252);
	TextDrawAlignment(Textdraw2, 2);
	TextDrawColor(Textdraw2, -1);
	TextDrawSetOutline(Textdraw2, 1);
	TextDrawBackgroundColor(Textdraw2, 51);
	TextDrawFont(Textdraw2, 2);
	TextDrawSetProportional(Textdraw2, 1);

	Textdraw3 = TextDrawCreate(320.500, 214.792, "Zaidimui siame serveryje, reikalingas patch'as, kuri parsisiusti gali ~b~www.soc.lt~w~~n~Be sio patch'o prisijungti nepavyks.");
	TextDrawLetterSize(Textdraw3, 0.217, 1.248);
	TextDrawTextSize(Textdraw3, 496.500, 335.252);
	TextDrawAlignment(Textdraw3, 2);
	TextDrawColor(Textdraw3, -1);
	TextDrawSetOutline(Textdraw3, 1);
	TextDrawBackgroundColor(Textdraw3, 51);
	TextDrawFont(Textdraw3, 2);
	TextDrawSetProportional(Textdraw3, 1);

	Textdraw4 = TextDrawCreate(38.000, 194.132, "-");
	TextDrawLetterSize(Textdraw4, 46.823, 2.815);
	TextDrawAlignment(Textdraw4, 1);
	TextDrawColor(Textdraw4, -1);
	TextDrawSetOutline(Textdraw4, 1);
	TextDrawBackgroundColor(Textdraw4, 51);
	TextDrawFont(Textdraw4, 2);
	TextDrawSetProportional(Textdraw4, 1);

	return 1;
}

public OnFilterScriptExit() //or OnGameModeExit
{
	TextDrawDestroy(Textdraw0);
	Textdraw0 = Text:INVALID_TEXT_DRAW;

	TextDrawDestroy(Textdraw1);
	Textdraw1 = Text:INVALID_TEXT_DRAW;

	TextDrawDestroy(Textdraw2);
	Textdraw2 = Text:INVALID_TEXT_DRAW;

	TextDrawDestroy(Textdraw3);
	Textdraw3 = Text:INVALID_TEXT_DRAW;

	TextDrawDestroy(Textdraw4);
	Textdraw4 = Text:INVALID_TEXT_DRAW;

	return 1;
}

////////////////////////////////////////////////////////////////////////////////

