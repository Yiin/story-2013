// These textdraws has been generated using iPLEOMAX's TextDraw Editor.
// Thank you for using this tool!

//Global Textdraws:
new Text:Textdraw0 = Text:INVALID_TEXT_DRAW;
new Text:oldWood_atgal = Text:INVALID_TEXT_DRAW;
new Text:oldWood_pirmyn = Text:INVALID_TEXT_DRAW;
new Text:oldWood_iseiti = Text:INVALID_TEXT_DRAW;
new Text:oldWood_pirkti = Text:INVALID_TEXT_DRAW;
new Text:oldWood_info = Text:INVALID_TEXT_DRAW;
new Text:Textdraw6 = Text:INVALID_TEXT_DRAW;
new Text:Textdraw7 = Text:INVALID_TEXT_DRAW;
new Text:Textdraw8 = Text:INVALID_TEXT_DRAW;

public OnFilterScriptInit() //or OnGameModeInit()
{
	Textdraw0 = TextDrawCreate(101.125, 312.665, "soc:oldwood");
	TextDrawTextSize(Textdraw0, 421.669, 125.416);
	TextDrawAlignment(Textdraw0, 1);
	TextDrawColor(Textdraw0, -1);
	TextDrawFont(Textdraw0, 4);

	

	Textdraw6 = TextDrawCreate(328.432, 326.083, "214");
	TextDrawLetterSize(Textdraw6, 0.592, 2.778);
	TextDrawAlignment(Textdraw6, 1);
	TextDrawColor(Textdraw6, 336199935);
	TextDrawSetOutline(Textdraw6, 1);
	TextDrawBackgroundColor(Textdraw6, -197);
	TextDrawFont(Textdraw6, 3);
	TextDrawSetProportional(Textdraw6, 1);

	Textdraw7 = TextDrawCreate(350.015, 355.747, "69");
	TextDrawLetterSize(Textdraw7, 0.592, 2.778);
	TextDrawAlignment(Textdraw7, 1);
	TextDrawColor(Textdraw7, 336199935);
	TextDrawSetOutline(Textdraw7, 1);
	TextDrawBackgroundColor(Textdraw7, -205);
	TextDrawFont(Textdraw7, 3);
	TextDrawSetProportional(Textdraw7, 1);

	Textdraw8 = TextDrawCreate(324.743, 385.997, "13200");
	TextDrawLetterSize(Textdraw8, 0.592, 2.778);
	TextDrawAlignment(Textdraw8, 1);
	TextDrawColor(Textdraw8, 336199935);
	TextDrawSetOutline(Textdraw8, 1);
	TextDrawBackgroundColor(Textdraw8, -205);
	TextDrawFont(Textdraw8, 3);
	TextDrawSetProportional(Textdraw8, 1);

	return 1;
}

public OnFilterScriptExit() //or OnGameModeExit
{
	TextDrawDestroy(Textdraw0);
	Textdraw0 = Text:INVALID_TEXT_DRAW;

	TextDrawDestroy(oldWood_atgal);
	oldWood_atgal = Text:INVALID_TEXT_DRAW;

	TextDrawDestroy(oldWood_pirmyn);
	oldWood_pirmyn = Text:INVALID_TEXT_DRAW;

	TextDrawDestroy(oldWood_iseiti);
	oldWood_iseiti = Text:INVALID_TEXT_DRAW;

	TextDrawDestroy(oldWood_pirkti);
	oldWood_pirkti = Text:INVALID_TEXT_DRAW;

	TextDrawDestroy(oldWood_info);
	oldWood_info = Text:INVALID_TEXT_DRAW;

	TextDrawDestroy(Textdraw6);
	Textdraw6 = Text:INVALID_TEXT_DRAW;

	TextDrawDestroy(Textdraw7);
	Textdraw7 = Text:INVALID_TEXT_DRAW;

	TextDrawDestroy(Textdraw8);
	Textdraw8 = Text:INVALID_TEXT_DRAW;

	return 1;
}

////////////////////////////////////////////////////////////////////////////////

