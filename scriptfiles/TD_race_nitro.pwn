//Global Textdraws:

new Text:nitro1;
new Text:nitro2;


nitro1 = TextDrawCreate(230.013107, 429.050048, "LD_SPAC:white");
TextDrawLetterSize(nitro1, 0.000000, 0.000000);
TextDrawTextSize(nitro1, 194.061584, 6.241703);
TextDrawAlignment(nitro1, 1);
TextDrawColor(nitro1, 255);
TextDrawSetShadow(nitro1, 0);
TextDrawSetOutline(nitro1, 0);
TextDrawFont(nitro1, 4);

nitro2 = TextDrawCreate(230.325195, 429.450164, "LD_SPAC:white");
TextDrawLetterSize(nitro2, 0.000000, 0.000000);
TextDrawTextSize(nitro2, 193.546127, 5.250037);
TextDrawAlignment(nitro2, 1);
TextDrawColor(nitro2, 5263615);
TextDrawSetShadow(nitro2, 0);
TextDrawSetOutline(nitro2, 0);
TextDrawFont(nitro2, 4);


//Player Textdraws:

new PlayerText:nitro0[MAX_PLAYERS];


nitro0[playerid] = CreatePlayerTextDraw(playerid, 14.634197, 25.908481, "LD_SPAC:white");
PlayerTextDrawLetterSize(playerid, nitro0[playerid], 0.000000, 0.000000);
PlayerTextDrawTextSize(playerid, nitro0[playerid], 204.087402, 11.666702);
PlayerTextDrawAlignment(playerid, nitro0[playerid], 1);
PlayerTextDrawColor(playerid, nitro0[playerid], 16777215);
PlayerTextDrawSetShadow(playerid, nitro0[playerid], 0);
PlayerTextDrawSetOutline(playerid, nitro0[playerid], 0);
PlayerTextDrawFont(playerid, nitro0[playerid], 4);

