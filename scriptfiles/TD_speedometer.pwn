//Global Textdraws:

new Text:Textdraw0;
new Text:Textdraw1;


Textdraw0 = TextDrawCreate(481.199981, 396.486663, "usebox");
TextDrawLetterSize(Textdraw0, 0.000000, 4.661110);
TextDrawTextSize(Textdraw0, 274.000000, 0.000000);
TextDrawAlignment(Textdraw0, 1);
TextDrawColor(Textdraw0, 0);
TextDrawUseBox(Textdraw0, true);
TextDrawBoxColor(Textdraw0, 63);
TextDrawSetShadow(Textdraw0, 0);
TextDrawSetOutline(Textdraw0, 0);
TextDrawFont(Textdraw0, 0);

Textdraw1 = TextDrawCreate(280.800048, 394.986755, "infernus");
TextDrawLetterSize(Textdraw1, 0.313199, 1.331199);
TextDrawAlignment(Textdraw1, 1);
TextDrawColor(Textdraw1, -1);
TextDrawSetShadow(Textdraw1, 0);
TextDrawSetOutline(Textdraw1, 1);
TextDrawBackgroundColor(Textdraw1, 51);
TextDrawFont(Textdraw1, 2);
TextDrawSetProportional(Textdraw1, 1);


//Player Textdraws:

new PlayerText:Textdraw0[MAX_PLAYERS];
new PlayerText:Textdraw1[MAX_PLAYERS];
new PlayerText:Textdraw2[MAX_PLAYERS];
new PlayerText:Textdraw3[MAX_PLAYERS];


Textdraw0[playerid] = CreatePlayerTextDraw(playerid, 283.200073, 400.213317, "89");
PlayerTextDrawLetterSize(playerid, Textdraw0[playerid], 0.811092, 4.486330);
PlayerTextDrawAlignment(playerid, Textdraw0[playerid], 1);
PlayerTextDrawColor(playerid, Textdraw0[playerid], -1);
PlayerTextDrawSetShadow(playerid, Textdraw0[playerid], 0);
PlayerTextDrawSetOutline(playerid, Textdraw0[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, Textdraw0[playerid], 255);
PlayerTextDrawFont(playerid, Textdraw0[playerid], 2);
PlayerTextDrawSetProportional(playerid, Textdraw0[playerid], 1);

Textdraw1[playerid] = CreatePlayerTextDraw(playerid, 356.000183, 406.933410, "kuras: ~b~24 ~w~l");
PlayerTextDrawLetterSize(playerid, Textdraw1[playerid], 0.246799, 1.234133);
PlayerTextDrawAlignment(playerid, Textdraw1[playerid], 1);
PlayerTextDrawColor(playerid, Textdraw1[playerid], -1);
PlayerTextDrawSetShadow(playerid, Textdraw1[playerid], 0);
PlayerTextDrawSetOutline(playerid, Textdraw1[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, Textdraw1[playerid], 255);
PlayerTextDrawFont(playerid, Textdraw1[playerid], 2);
PlayerTextDrawSetProportional(playerid, Textdraw1[playerid], 1);

Textdraw2[playerid] = CreatePlayerTextDraw(playerid, 356.199890, 417.640167, "rida: ~b~128 ~w~km");
PlayerTextDrawLetterSize(playerid, Textdraw2[playerid], 0.246799, 1.234133);
PlayerTextDrawAlignment(playerid, Textdraw2[playerid], 1);
PlayerTextDrawColor(playerid, Textdraw2[playerid], -1);
PlayerTextDrawSetShadow(playerid, Textdraw2[playerid], 0);
PlayerTextDrawSetOutline(playerid, Textdraw2[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, Textdraw2[playerid], 255);
PlayerTextDrawFont(playerid, Textdraw2[playerid], 2);
PlayerTextDrawSetProportional(playerid, Textdraw2[playerid], 1);

Textdraw3[playerid] = CreatePlayerTextDraw(playerid, 355.599945, 428.346893, "spyna: ~g~atrakinta");
PlayerTextDrawLetterSize(playerid, Textdraw3[playerid], 0.246799, 1.234133);
PlayerTextDrawAlignment(playerid, Textdraw3[playerid], 1);
PlayerTextDrawColor(playerid, Textdraw3[playerid], -1);
PlayerTextDrawSetShadow(playerid, Textdraw3[playerid], 0);
PlayerTextDrawSetOutline(playerid, Textdraw3[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, Textdraw3[playerid], 255);
PlayerTextDrawFont(playerid, Textdraw3[playerid], 2);
PlayerTextDrawSetProportional(playerid, Textdraw3[playerid], 1);

