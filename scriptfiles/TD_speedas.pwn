//Global Textdraws:

new Text:Textdraw0;
new Text:Textdraw1;


Textdraw0 = TextDrawCreate(587.183166, 384.750152, "usebox");
TextDrawLetterSize(Textdraw0, 0.000000, 4.479625);
TextDrawTextSize(Textdraw0, 418.732360, 0.000000);
TextDrawAlignment(Textdraw0, 1);
TextDrawColor(Textdraw0, 0);
TextDrawUseBox(Textdraw0, true);
TextDrawBoxColor(Textdraw0, 102);
TextDrawSetShadow(Textdraw0, 0);
TextDrawSetOutline(Textdraw0, 0);
TextDrawFont(Textdraw0, 0);

Textdraw1 = TextDrawCreate(426.354095, 385.583160, "Greitis:");
TextDrawLetterSize(Textdraw1, 0.262591, 1.191666);
TextDrawAlignment(Textdraw1, 1);
TextDrawColor(Textdraw1, -1);
TextDrawSetShadow(Textdraw1, 0);
TextDrawSetOutline(Textdraw1, 1);
TextDrawBackgroundColor(Textdraw1, 51);
TextDrawFont(Textdraw1, 1);
TextDrawSetProportional(Textdraw1, 1);


//Player Textdraws:

new PlayerText:Textdraw0[MAX_PLAYERS];
new PlayerText:Textdraw1[MAX_PLAYERS];
new PlayerText:Textdraw2[MAX_PLAYERS];
new PlayerText:Textdraw3[MAX_PLAYERS];
new PlayerText:Textdraw4[MAX_PLAYERS];


Textdraw0[playerid] = CreatePlayerTextDraw(playerid, 424.011383, 393.166595, "123");
PlayerTextDrawLetterSize(playerid, Textdraw0[playerid], 0.713308, 3.466668);
PlayerTextDrawAlignment(playerid, Textdraw0[playerid], 1);
PlayerTextDrawColor(playerid, Textdraw0[playerid], -1);
PlayerTextDrawSetShadow(playerid, Textdraw0[playerid], 0);
PlayerTextDrawSetOutline(playerid, Textdraw0[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, Textdraw0[playerid], 51);
PlayerTextDrawFont(playerid, Textdraw0[playerid], 1);
PlayerTextDrawSetProportional(playerid, Textdraw0[playerid], 1);

Textdraw1[playerid] = CreatePlayerTextDraw(playerid, 478.516754, 386.058074, "Rida: ~y~256.8 ~w~km");
PlayerTextDrawLetterSize(playerid, Textdraw1[playerid], 0.262591, 1.191666);
PlayerTextDrawAlignment(playerid, Textdraw1[playerid], 1);
PlayerTextDrawColor(playerid, Textdraw1[playerid], -1);
PlayerTextDrawSetShadow(playerid, Textdraw1[playerid], 0);
PlayerTextDrawSetOutline(playerid, Textdraw1[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, Textdraw1[playerid], 255);
PlayerTextDrawFont(playerid, Textdraw1[playerid], 1);
PlayerTextDrawSetProportional(playerid, Textdraw1[playerid], 1);

Textdraw2[playerid] = CreatePlayerTextDraw(playerid, 478.486145, 398.433197, "Kuras: ~y~64 ~w~l.");
PlayerTextDrawLetterSize(playerid, Textdraw2[playerid], 0.262591, 1.191666);
PlayerTextDrawAlignment(playerid, Textdraw2[playerid], 1);
PlayerTextDrawColor(playerid, Textdraw2[playerid], -1);
PlayerTextDrawSetShadow(playerid, Textdraw2[playerid], 0);
PlayerTextDrawSetOutline(playerid, Textdraw2[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, Textdraw2[playerid], 255);
PlayerTextDrawFont(playerid, Textdraw2[playerid], 1);
PlayerTextDrawSetProportional(playerid, Textdraw2[playerid], 1);

Textdraw3[playerid] = CreatePlayerTextDraw(playerid, 479.017700, 411.566558, "Kuro tipas: ~y~Benzinas");
PlayerTextDrawLetterSize(playerid, Textdraw3[playerid], 0.262591, 1.191666);
PlayerTextDrawAlignment(playerid, Textdraw3[playerid], 1);
PlayerTextDrawColor(playerid, Textdraw3[playerid], -1);
PlayerTextDrawSetShadow(playerid, Textdraw3[playerid], 0);
PlayerTextDrawSetOutline(playerid, Textdraw3[playerid], 1);
PlayerTextDrawBackgroundColor(playerid, Textdraw3[playerid], 255);
PlayerTextDrawFont(playerid, Textdraw3[playerid], 1);
PlayerTextDrawSetProportional(playerid, Textdraw3[playerid], 1);

Textdraw4[playerid] = CreatePlayerTextDraw(playerid, 569.253295, 384.416809, "LD_BEAT:circle");
PlayerTextDrawLetterSize(playerid, Textdraw4[playerid], 0.000000, 0.000000);
PlayerTextDrawTextSize(playerid, Textdraw4[playerid], 14.524139, 16.916671);
PlayerTextDrawAlignment(playerid, Textdraw4[playerid], 1);
PlayerTextDrawColor(playerid, Textdraw4[playerid], 16711935);
PlayerTextDrawSetShadow(playerid, Textdraw4[playerid], 0);
PlayerTextDrawSetOutline(playerid, Textdraw4[playerid], 0);
PlayerTextDrawFont(playerid, Textdraw4[playerid], 4);

