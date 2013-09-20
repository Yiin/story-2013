//Global Textdraws:

new Text:bar_engine0;
new Text:bar_engine1;


bar_engine0 = TextDrawCreate(416.983917, 416.500000, "LD_SPAC:white");
TextDrawLetterSize(bar_engine0, 0.000000, 0.000000);
TextDrawTextSize(bar_engine0, 166.325042, 8.166687);
TextDrawAlignment(bar_engine0, 1);
TextDrawColor(bar_engine0, 255);
TextDrawSetShadow(bar_engine0, 0);
TextDrawSetOutline(bar_engine0, 0);
TextDrawFont(bar_engine0, 4);

bar_engine1 = TextDrawCreate(417.702758, 417.325042, "LD_SPAC:white");
TextDrawLetterSize(bar_engine1, 0.000000, 0.000000);
TextDrawTextSize(bar_engine1, 164.778839, 6.475018);
TextDrawAlignment(bar_engine1, 1);
TextDrawColor(bar_engine1, -1378294017);
TextDrawSetShadow(bar_engine1, 0);
TextDrawSetOutline(bar_engine1, 0);
TextDrawFont(bar_engine1, 4);


//Player Textdraws:

new PlayerText:bar_engine[MAX_PLAYERS];


bar_engine[pid] = CreatePlayerTextDraw(playerid, 417.016052, 417.099945, "LD_SPAC:white");
PlayerTextDrawLetterSize(playerid, bar_engine[pid], 0.000000, 0.000000);
PlayerTextDrawTextSize(playerid, bar_engine[pid], 165.762786, 6.883353);
PlayerTextDrawAlignment(playerid, bar_engine[pid], 1);
PlayerTextDrawColor(playerid, bar_engine[pid], -5963521);
PlayerTextDrawSetShadow(playerid, bar_engine[pid], 0);
PlayerTextDrawSetOutline(playerid, bar_engine[pid], 0);
PlayerTextDrawFont(playerid, bar_engine[pid], 4);

