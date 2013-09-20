//Global Textdraws:

new Text:Textdraw0;
new Text:Textdraw1;
new Text:Textdraw2;
new Text:Textdraw3;
new Text:Textdraw4;
new Text:Textdraw5;
new Text:Textdraw6;
new Text:Textdraw7;


Textdraw0 = TextDrawCreate(599.364501, 389.416717, "usebox");
TextDrawLetterSize(Textdraw0, 0.000000, 4.868514);
TextDrawTextSize(Textdraw0, 335.803802, 0.000000);
TextDrawAlignment(Textdraw0, 1);
TextDrawColor(Textdraw0, 0);
TextDrawUseBox(Textdraw0, true);
TextDrawBoxColor(Textdraw0, 25);
TextDrawSetShadow(Textdraw0, 0);
TextDrawSetOutline(Textdraw0, 0);
TextDrawFont(Textdraw0, 0);

Textdraw1 = TextDrawCreate(597.553344, 392.750091, "usebox");
TextDrawLetterSize(Textdraw1, 0.000000, 4.212584);
TextDrawTextSize(Textdraw1, 338.614990, 0.000000);
TextDrawAlignment(Textdraw1, 1);
TextDrawColor(Textdraw1, 0);
TextDrawUseBox(Textdraw1, true);
TextDrawBoxColor(Textdraw1, 25);
TextDrawSetShadow(Textdraw1, 0);
TextDrawSetOutline(Textdraw1, 0);
TextDrawFont(Textdraw1, 0);

Textdraw2 = TextDrawCreate(396.837463, 412.416717, "km/h");
TextDrawLetterSize(Textdraw2, 0.449999, 1.600000);
TextDrawAlignment(Textdraw2, 1);
TextDrawColor(Textdraw2, -1);
TextDrawSetShadow(Textdraw2, 0);
TextDrawSetOutline(Textdraw2, 1);
TextDrawBackgroundColor(Textdraw2, 51);
TextDrawFont(Textdraw2, 1);
TextDrawSetProportional(Textdraw2, 1);

Textdraw3 = TextDrawCreate(569.253234, 405.999908, "v");
TextDrawLetterSize(Textdraw3, 0.697378, -1.497498);
TextDrawTextSize(Textdraw3, 587.994140, 25.083326);
TextDrawAlignment(Textdraw3, 1);
TextDrawColor(Textdraw3, -1);
TextDrawUseBox(Textdraw3, true);
TextDrawBoxColor(Textdraw3, 0);
TextDrawSetShadow(Textdraw3, 0);
TextDrawSetOutline(Textdraw3, 1);
TextDrawBackgroundColor(Textdraw3, 51);
TextDrawFont(Textdraw3, 2);
TextDrawSetProportional(Textdraw3, 1);
TextDrawSetSelectable(Textdraw3, true);

Textdraw4 = TextDrawCreate(569.316162, 412.833160, "v");
TextDrawLetterSize(Textdraw4, 0.697378, -1.497498);
TextDrawTextSize(Textdraw4, 587.994140, 27.416666);
TextDrawAlignment(Textdraw4, 1);
TextDrawColor(Textdraw4, -1);
TextDrawUseBox(Textdraw4, true);
TextDrawBoxColor(Textdraw4, 0);
TextDrawSetShadow(Textdraw4, 0);
TextDrawSetOutline(Textdraw4, 1);
TextDrawBackgroundColor(Textdraw4, 51);
TextDrawFont(Textdraw4, 2);
TextDrawSetProportional(Textdraw4, 1);
TextDrawSetSelectable(Textdraw4, true);

Textdraw5 = TextDrawCreate(569.379150, 420.833221, "v");
TextDrawLetterSize(Textdraw5, 0.697377, -1.497498);
TextDrawTextSize(Textdraw5, 587.994323, 32.083339);
TextDrawAlignment(Textdraw5, 1);
TextDrawColor(Textdraw5, -1);
TextDrawUseBox(Textdraw5, true);
TextDrawBoxColor(Textdraw5, 0);
TextDrawSetShadow(Textdraw5, 0);
TextDrawSetOutline(Textdraw5, 1);
TextDrawBackgroundColor(Textdraw5, 51);
TextDrawFont(Textdraw5, 2);
TextDrawSetProportional(Textdraw5, 1);
TextDrawSetSelectable(Textdraw5, true);

Textdraw6 = TextDrawCreate(478.486083, 385.916687, "usebox");
TextDrawLetterSize(Textdraw6, 0.000000, -6.603707);
TextDrawTextSize(Textdraw6, 593.958984, 0.000000);
TextDrawAlignment(Textdraw6, 1);
TextDrawColor(Textdraw6, 0);
TextDrawUseBox(Textdraw6, true);
TextDrawBoxColor(Textdraw6, 47);
TextDrawSetShadow(Textdraw6, 0);
TextDrawSetOutline(Textdraw6, 0);
TextDrawFont(Textdraw6, 0);

Textdraw7 = TextDrawCreate(569.757202, 372.000396, "~b~uzdaryti");
TextDrawLetterSize(Textdraw7, 0.192781, 1.051663);
TextDrawTextSize(Textdraw7, 11.244508, 45.500003);
TextDrawAlignment(Textdraw7, 2);
TextDrawColor(Textdraw7, -1);
TextDrawUseBox(Textdraw7, true);
TextDrawBoxColor(Textdraw7, 0);
TextDrawSetShadow(Textdraw7, 0);
TextDrawSetOutline(Textdraw7, 1);
TextDrawBackgroundColor(Textdraw7, 51);
TextDrawFont(Textdraw7, 2);
TextDrawSetProportional(Textdraw7, 1);
TextDrawSetSelectable(Textdraw7, true);


//Player Textdraws:

new PlayerText:Textdraw0[MAX_PLAYERS];
new PlayerText:Textdraw1[MAX_PLAYERS];
new PlayerText:Textdraw2[MAX_PLAYERS];
new PlayerText:Textdraw3[MAX_PLAYERS];
new PlayerText:Textdraw4[MAX_PLAYERS];
new PlayerText:Textdraw5[MAX_PLAYERS];
new PlayerText:Textdraw6[MAX_PLAYERS];
new PlayerText:Textdraw7[MAX_PLAYERS];
new PlayerText:Textdraw8[MAX_PLAYERS];
new PlayerText:Textdraw9[MAX_PLAYERS];
new PlayerText:Textdraw10[MAX_PLAYERS];


Textdraw0[playerid] = CreatePlayerTextDraw(playerid, 357.950286, 372.749877, "Turismo");
PlayerTextDrawLetterSize(playerid, Textdraw0[playerid], 0.639281, 2.620834);
PlayerTextDrawAlignment(playerid, Textdraw0[playerid], 1);
PlayerTextDrawColor(playerid, Textdraw0[playerid], -1);
PlayerTextDrawSetShadow(playerid, Textdraw0[playerid], 0);
PlayerTextDrawSetOutline(playerid, Textdraw0[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, Textdraw0[playerid], 255);
PlayerTextDrawFont(playerid, Textdraw0[playerid], 0);
PlayerTextDrawSetProportional(playerid, Textdraw0[playerid], 1);

Textdraw1[playerid] = CreatePlayerTextDraw(playerid, 352.859527, 398.249908, "128");
PlayerTextDrawLetterSize(playerid, Textdraw1[playerid], 0.672079, 3.320833);
PlayerTextDrawAlignment(playerid, Textdraw1[playerid], 1);
PlayerTextDrawColor(playerid, Textdraw1[playerid], -1);
PlayerTextDrawSetShadow(playerid, Textdraw1[playerid], 0);
PlayerTextDrawSetOutline(playerid, Textdraw1[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, Textdraw1[playerid], 255);
PlayerTextDrawFont(playerid, Textdraw1[playerid], 3);
PlayerTextDrawSetProportional(playerid, Textdraw1[playerid], 1);

Textdraw2[playerid] = CreatePlayerTextDraw(playerid, 450.780487, 391.833312, "degalai: ~b~24 ~w~l.");
PlayerTextDrawLetterSize(playerid, Textdraw2[playerid], 0.221360, 1.296666);
PlayerTextDrawAlignment(playerid, Textdraw2[playerid], 1);
PlayerTextDrawColor(playerid, Textdraw2[playerid], -1);
PlayerTextDrawSetShadow(playerid, Textdraw2[playerid], 0);
PlayerTextDrawSetOutline(playerid, Textdraw2[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, Textdraw2[playerid], 51);
PlayerTextDrawFont(playerid, Textdraw2[playerid], 2);
PlayerTextDrawSetProportional(playerid, Textdraw2[playerid], 1);

Textdraw3[playerid] = CreatePlayerTextDraw(playerid, 450.843414, 404.500152, "rida: ~b~512 ~w~km.");
PlayerTextDrawLetterSize(playerid, Textdraw3[playerid], 0.221360, 1.296666);
PlayerTextDrawAlignment(playerid, Textdraw3[playerid], 1);
PlayerTextDrawColor(playerid, Textdraw3[playerid], -1);
PlayerTextDrawSetShadow(playerid, Textdraw3[playerid], 0);
PlayerTextDrawSetOutline(playerid, Textdraw3[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, Textdraw3[playerid], 51);
PlayerTextDrawFont(playerid, Textdraw3[playerid], 2);
PlayerTextDrawSetProportional(playerid, Textdraw3[playerid], 1);

Textdraw4[playerid] = CreatePlayerTextDraw(playerid, 450.906341, 417.166870, "degalu tipas: ~y~dyzelis");
PlayerTextDrawLetterSize(playerid, Textdraw4[playerid], 0.221360, 1.296666);
PlayerTextDrawAlignment(playerid, Textdraw4[playerid], 1);
PlayerTextDrawColor(playerid, Textdraw4[playerid], -1);
PlayerTextDrawSetShadow(playerid, Textdraw4[playerid], 0);
PlayerTextDrawSetOutline(playerid, Textdraw4[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, Textdraw4[playerid], 51);
PlayerTextDrawFont(playerid, Textdraw4[playerid], 2);
PlayerTextDrawSetProportional(playerid, Textdraw4[playerid], 1);

Textdraw5[playerid] = CreatePlayerTextDraw(playerid, 500.975677, 331.583312, "~g~variklis");
PlayerTextDrawLetterSize(playerid, Textdraw5[playerid], 0.214332, 1.174165);
PlayerTextDrawTextSize(playerid, Textdraw5[playerid], 12.181570, 47.833320);
PlayerTextDrawAlignment(playerid, Textdraw5[playerid], 2);
PlayerTextDrawColor(playerid, Textdraw5[playerid], -1);
PlayerTextDrawUseBox(playerid, Textdraw5[playerid], true);
PlayerTextDrawBoxColor(playerid, Textdraw5[playerid], 0);
PlayerTextDrawSetShadow(playerid, Textdraw5[playerid], 0);
PlayerTextDrawSetOutline(playerid, Textdraw5[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, Textdraw5[playerid], 51);
PlayerTextDrawFont(playerid, Textdraw5[playerid], 2);
PlayerTextDrawSetProportional(playerid, Textdraw5[playerid], 1);
PlayerTextDrawSetSelectable(playerid, Textdraw5[playerid], true);

Textdraw6[playerid] = CreatePlayerTextDraw(playerid, 496.353118, 343.666839, "~r~spyna");
PlayerTextDrawLetterSize(playerid, Textdraw6[playerid], 0.214332, 1.174165);
PlayerTextDrawTextSize(playerid, Textdraw6[playerid], 12.181550, 31.499996);
PlayerTextDrawAlignment(playerid, Textdraw6[playerid], 2);
PlayerTextDrawColor(playerid, Textdraw6[playerid], -1);
PlayerTextDrawUseBox(playerid, Textdraw6[playerid], true);
PlayerTextDrawBoxColor(playerid, Textdraw6[playerid], 0);
PlayerTextDrawSetShadow(playerid, Textdraw6[playerid], 0);
PlayerTextDrawSetOutline(playerid, Textdraw6[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, Textdraw6[playerid], 51);
PlayerTextDrawFont(playerid, Textdraw6[playerid], 2);
PlayerTextDrawSetProportional(playerid, Textdraw6[playerid], 1);
PlayerTextDrawSetSelectable(playerid, Textdraw6[playerid], true);

Textdraw7[playerid] = CreatePlayerTextDraw(playerid, 515.157226, 355.750244, "~r~signalizacija");
PlayerTextDrawLetterSize(playerid, Textdraw7[playerid], 0.214332, 1.174165);
PlayerTextDrawTextSize(playerid, Textdraw7[playerid], 12.181549, 70.583328);
PlayerTextDrawAlignment(playerid, Textdraw7[playerid], 2);
PlayerTextDrawColor(playerid, Textdraw7[playerid], -1);
PlayerTextDrawUseBox(playerid, Textdraw7[playerid], true);
PlayerTextDrawBoxColor(playerid, Textdraw7[playerid], 0);
PlayerTextDrawSetShadow(playerid, Textdraw7[playerid], 0);
PlayerTextDrawSetOutline(playerid, Textdraw7[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, Textdraw7[playerid], 51);
PlayerTextDrawFont(playerid, Textdraw7[playerid], 2);
PlayerTextDrawSetProportional(playerid, Textdraw7[playerid], 1);
PlayerTextDrawSetSelectable(playerid, Textdraw7[playerid], true);

Textdraw8[playerid] = CreatePlayerTextDraw(playerid, 501.164367, 367.833709, "~g~sviesos");
PlayerTextDrawLetterSize(playerid, Textdraw8[playerid], 0.214332, 1.174165);
PlayerTextDrawTextSize(playerid, Textdraw8[playerid], 12.181550, 43.750003);
PlayerTextDrawAlignment(playerid, Textdraw8[playerid], 2);
PlayerTextDrawColor(playerid, Textdraw8[playerid], -1);
PlayerTextDrawUseBox(playerid, Textdraw8[playerid], true);
PlayerTextDrawBoxColor(playerid, Textdraw8[playerid], 0);
PlayerTextDrawSetShadow(playerid, Textdraw8[playerid], 0);
PlayerTextDrawSetOutline(playerid, Textdraw8[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, Textdraw8[playerid], 51);
PlayerTextDrawFont(playerid, Textdraw8[playerid], 2);
PlayerTextDrawSetProportional(playerid, Textdraw8[playerid], 1);
PlayerTextDrawSetSelectable(playerid, Textdraw8[playerid], true);

Textdraw9[playerid] = CreatePlayerTextDraw(playerid, 570.099548, 331.500396, "~g~bagazine");
PlayerTextDrawLetterSize(playerid, Textdraw9[playerid], 0.214332, 1.174165);
PlayerTextDrawTextSize(playerid, Textdraw9[playerid], 12.181550, 51.333324);
PlayerTextDrawAlignment(playerid, Textdraw9[playerid], 2);
PlayerTextDrawColor(playerid, Textdraw9[playerid], -1);
PlayerTextDrawUseBox(playerid, Textdraw9[playerid], true);
PlayerTextDrawBoxColor(playerid, Textdraw9[playerid], 0);
PlayerTextDrawSetShadow(playerid, Textdraw9[playerid], 0);
PlayerTextDrawSetOutline(playerid, Textdraw9[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, Textdraw9[playerid], 51);
PlayerTextDrawFont(playerid, Textdraw9[playerid], 2);
PlayerTextDrawSetProportional(playerid, Textdraw9[playerid], 1);
PlayerTextDrawSetSelectable(playerid, Textdraw9[playerid], true);

Textdraw10[playerid] = CreatePlayerTextDraw(playerid, 570.162658, 343.583770, "~g~kapotas");
PlayerTextDrawLetterSize(playerid, Textdraw10[playerid], 0.214332, 1.174165);
PlayerTextDrawTextSize(playerid, Textdraw10[playerid], 12.181550, 46.083328);
PlayerTextDrawAlignment(playerid, Textdraw10[playerid], 2);
PlayerTextDrawColor(playerid, Textdraw10[playerid], -1);
PlayerTextDrawUseBox(playerid, Textdraw10[playerid], true);
PlayerTextDrawBoxColor(playerid, Textdraw10[playerid], 0);
PlayerTextDrawSetShadow(playerid, Textdraw10[playerid], 0);
PlayerTextDrawSetOutline(playerid, Textdraw10[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, Textdraw10[playerid], 51);
PlayerTextDrawFont(playerid, Textdraw10[playerid], 2);
PlayerTextDrawSetProportional(playerid, Textdraw10[playerid], 1);
PlayerTextDrawSetSelectable(playerid, Textdraw10[playerid], true);

