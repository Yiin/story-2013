//Global Textdraws:

new Text:Textdraw0;
new Text:Textdraw1;
new Text:Textdraw2;
new Text:Textdraw3;
new Text:Textdraw4;


Textdraw0 = TextDrawCreate(413.423065, 356.125152, "LD_BEAT:right");
TextDrawLetterSize(Textdraw0, 0.000000, 0.000000);
TextDrawTextSize(Textdraw0, 24.363098, 25.083311);
TextDrawAlignment(Textdraw0, 1);
TextDrawColor(Textdraw0, 855585535);
TextDrawSetShadow(Textdraw0, 0);
TextDrawSetOutline(Textdraw0, 0);
TextDrawFont(Textdraw0, 4);
TextDrawSetSelectable(Textdraw0, true);

Textdraw1 = TextDrawCreate(229.310165, 356.191833, "LD_BEAT:left");
TextDrawLetterSize(Textdraw1, 0.000000, 0.000000);
TextDrawTextSize(Textdraw1, 24.363098, 25.083311);
TextDrawAlignment(Textdraw1, 1);
TextDrawColor(Textdraw1, 855585535);
TextDrawSetShadow(Textdraw1, 0);
TextDrawSetOutline(Textdraw1, 0);
TextDrawFont(Textdraw1, 4);
TextDrawSetSelectable(Textdraw1, true);

Textdraw2 = TextDrawCreate(156.486007, 345.041656, "-");
TextDrawLetterSize(Textdraw2, 29.755348, 1.889915);
TextDrawAlignment(Textdraw2, 1);
TextDrawColor(Textdraw2, -1);
TextDrawSetShadow(Textdraw2, 0);
TextDrawSetOutline(Textdraw2, 1);
TextDrawBackgroundColor(Textdraw2, 51);
TextDrawFont(Textdraw2, 2);
TextDrawSetProportional(Textdraw2, 1);

Textdraw3 = TextDrawCreate(155.611938, 371.766754, "-");
TextDrawLetterSize(Textdraw3, 29.755348, 1.889915);
TextDrawAlignment(Textdraw3, 1);
TextDrawColor(Textdraw3, -1);
TextDrawSetShadow(Textdraw3, 0);
TextDrawSetOutline(Textdraw3, 1);
TextDrawBackgroundColor(Textdraw3, 51);
TextDrawFont(Textdraw3, 2);
TextDrawSetProportional(Textdraw3, 1);

Textdraw4 = TextDrawCreate(329.370758, 406.583282, "pirkti");
TextDrawLetterSize(Textdraw4, 0.360511, 1.774999);
TextDrawAlignment(Textdraw4, 2);
TextDrawColor(Textdraw4, 255);
TextDrawSetShadow(Textdraw4, 0);
TextDrawSetOutline(Textdraw4, 1);
TextDrawBackgroundColor(Textdraw4, 1107230975);
TextDrawFont(Textdraw4, 2);
TextDrawSetProportional(Textdraw4, 1);
TextDrawSetSelectable(Textdraw4, true);


//Player Textdraws:

new PlayerText:Textdraw0[MAX_PLAYERS];
new PlayerText:Textdraw1[MAX_PLAYERS];
new PlayerText:Textdraw2[MAX_PLAYERS];


Textdraw0[playerid] = CreatePlayerTextDraw(playerid, 333.000000, 333.549835, "Greitis: 213 km/h");
PlayerTextDrawLetterSize(playerid, Textdraw0[playerid], 0.400804, 2.002500);
PlayerTextDrawAlignment(playerid, Textdraw0[playerid], 2);
PlayerTextDrawColor(playerid, Textdraw0[playerid], -1);
PlayerTextDrawSetShadow(playerid, Textdraw0[playerid], 0);
PlayerTextDrawSetOutline(playerid, Textdraw0[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, Textdraw0[playerid], 51);
PlayerTextDrawFont(playerid, Textdraw0[playerid], 2);
PlayerTextDrawSetProportional(playerid, Textdraw0[playerid], 1);

Textdraw1[playerid] = CreatePlayerTextDraw(playerid, 333.484649, 381.158416, "kaina: 52000 lt");
PlayerTextDrawLetterSize(playerid, Textdraw1[playerid], 0.400804, 2.002500);
PlayerTextDrawAlignment(playerid, Textdraw1[playerid], 2);
PlayerTextDrawColor(playerid, Textdraw1[playerid], -1);
PlayerTextDrawSetShadow(playerid, Textdraw1[playerid], 0);
PlayerTextDrawSetOutline(playerid, Textdraw1[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, Textdraw1[playerid], 51);
PlayerTextDrawFont(playerid, Textdraw1[playerid], 2);
PlayerTextDrawSetProportional(playerid, Textdraw1[playerid], 1);

Textdraw2[playerid] = CreatePlayerTextDraw(playerid, 328.014343, 358.241699, "jester");
PlayerTextDrawLetterSize(playerid, Textdraw2[playerid], 0.400804, 2.002500);
PlayerTextDrawAlignment(playerid, Textdraw2[playerid], 2);
PlayerTextDrawColor(playerid, Textdraw2[playerid], 255);
PlayerTextDrawSetShadow(playerid, Textdraw2[playerid], 0);
PlayerTextDrawSetOutline(playerid, Textdraw2[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, Textdraw2[playerid], 15340339);
PlayerTextDrawFont(playerid, Textdraw2[playerid], 2);
PlayerTextDrawSetProportional(playerid, Textdraw2[playerid], 1);

