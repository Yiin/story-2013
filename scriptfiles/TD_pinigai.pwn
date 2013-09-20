//Global Textdraws:

new Text:Textdraw0;
new Text:Textdraw1;
new Text:Textdraw2;
new Text:Textdraw3;


Textdraw0 = TextDrawCreate(611.500000, 80.249992, "usebox");
TextDrawLetterSize(Textdraw0, 0.000000, 1.737035);
TextDrawTextSize(Textdraw0, 494.500000, 0.000000);
TextDrawAlignment(Textdraw0, 1);
TextDrawColor(Textdraw0, 0);
TextDrawUseBox(Textdraw0, true);
TextDrawBoxColor(Textdraw0, 336860415);
TextDrawSetShadow(Textdraw0, 0);
TextDrawSetOutline(Textdraw0, 0);
TextDrawFont(Textdraw0, 0);

Textdraw1 = TextDrawCreate(610.300109, 82.533332, "usebox");
TextDrawLetterSize(Textdraw1, 0.000000, 1.287037);
TextDrawTextSize(Textdraw1, 496.449951, 0.000000);
TextDrawAlignment(Textdraw1, 1);
TextDrawColor(Textdraw1, 0);
TextDrawUseBox(Textdraw1, true);
TextDrawBoxColor(Textdraw1, 673720575);
TextDrawSetShadow(Textdraw1, 0);
TextDrawSetOutline(Textdraw1, 0);
TextDrawFont(Textdraw1, 0);

Textdraw2 = TextDrawCreate(559.500000, 93.333343, "-");
TextDrawLetterSize(Textdraw2, 10.487112, 0.722082);
TextDrawAlignment(Textdraw2, 2);
TextDrawColor(Textdraw2, -5963521);
TextDrawSetShadow(Textdraw2, 0);
TextDrawSetOutline(Textdraw2, 1);
TextDrawBackgroundColor(Textdraw2, 51);
TextDrawFont(Textdraw2, 2);
TextDrawSetProportional(Textdraw2, 1);

Textdraw3 = TextDrawCreate(558.000000, 75.083320, "-");
TextDrawLetterSize(Textdraw3, 10.487112, 0.722082);
TextDrawAlignment(Textdraw3, 2);
TextDrawColor(Textdraw3, -5963521);
TextDrawSetShadow(Textdraw3, 0);
TextDrawSetOutline(Textdraw3, 1);
TextDrawBackgroundColor(Textdraw3, 51);
TextDrawFont(Textdraw3, 2);
TextDrawSetProportional(Textdraw3, 1);


//Player Textdraws:

new PlayerText:Textdraw0[MAX_PLAYERS];


Textdraw0[playerid] = CreatePlayerTextDraw(playerid, 555.000000, 80.500007, "5284691 LT");
PlayerTextDrawLetterSize(playerid, Textdraw0[playerid], 0.273499, 1.460000);
PlayerTextDrawAlignment(playerid, Textdraw0[playerid], 2);
PlayerTextDrawColor(playerid, Textdraw0[playerid], 505290495);
PlayerTextDrawSetShadow(playerid, Textdraw0[playerid], 0);
PlayerTextDrawSetOutline(playerid, Textdraw0[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, Textdraw0[playerid], -5963521);
PlayerTextDrawFont(playerid, Textdraw0[playerid], 2);
PlayerTextDrawSetProportional(playerid, Textdraw0[playerid], 1);

