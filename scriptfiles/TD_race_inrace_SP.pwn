//Global Textdraws:

new Text:racesp;


racesp = TextDrawCreate(476.720855, 381.558288, "Laikas:");
TextDrawLetterSize(racesp, 0.449999, 1.600000);
TextDrawAlignment(racesp, 1);
TextDrawColor(racesp, -1);
TextDrawSetShadow(racesp, 0);
TextDrawSetOutline(racesp, 1);
TextDrawBackgroundColor(racesp, 51);
TextDrawFont(racesp, 1);
TextDrawSetProportional(racesp, 1);


//Player Textdraws:

new PlayerText:pracesp_laikas[MAX_PLAYERS];
new PlayerText:pracesp_liko[MAX_PLAYERS];


pracesp_laikas[playerid] = CreatePlayerTextDraw(playerid, 500.678497, 394.808410, "~y~64.59 ~w~sec");
PlayerTextDrawLetterSize(playerid, pracesp_laikas[playerid], 0.450937, 2.253334);
PlayerTextDrawAlignment(playerid, pracesp_laikas[playerid], 1);
PlayerTextDrawColor(playerid, pracesp_laikas[playerid], -1);
PlayerTextDrawSetShadow(playerid, pracesp_laikas[playerid], 0);
PlayerTextDrawSetOutline(playerid, pracesp_laikas[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, pracesp_laikas[playerid], 51);
PlayerTextDrawFont(playerid, pracesp_laikas[playerid], 2);
PlayerTextDrawSetProportional(playerid, pracesp_laikas[playerid], 1);

pracesp_liko[playerid] = CreatePlayerTextDraw(playerid, 476.783538, 368.558288, "Liko: ~y~24 ~w~km");
PlayerTextDrawLetterSize(playerid, pracesp_liko[playerid], 0.259311, 1.290832);
PlayerTextDrawAlignment(playerid, pracesp_liko[playerid], 1);
PlayerTextDrawColor(playerid, pracesp_liko[playerid], -1);
PlayerTextDrawSetShadow(playerid, pracesp_liko[playerid], 0);
PlayerTextDrawSetOutline(playerid, pracesp_liko[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, pracesp_liko[playerid], 51);
PlayerTextDrawFont(playerid, pracesp_liko[playerid], 2);
PlayerTextDrawSetProportional(playerid, pracesp_liko[playerid], 1);

