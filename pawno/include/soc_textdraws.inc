	#include <soc_defines>

	new PlayerText:firstptd[MAX_PLAYERS];
	new Text:firsttd;

	new Text:g_craft[5];
	new PlayerText:p_craft[14][MAX_PLAYERS];

	new Text:g_garage[44];
	new PlayerText:p_garage[23][MAX_PLAYERS];

	new Text:g_questList[5];
	new PlayerText:p_questList[4][MAX_PLAYERS];
	new Text:iStorage[4];

	new Text:g_pRepairBar[3];
	new PlayerText:p_pRepairBar[2][MAX_PLAYERS];

	new Text:g_crosshair;

	new PlayerText:p_gangzone[MAX_PLAYERS];

	new Text:g_tip_show;
	new PlayerText:p_tip_show[MAX_PLAYERS];

	new Text:g_tip[2];
	new PlayerText:p_tip[2][MAX_PLAYERS];

	new Text:g_task;
	new PlayerText:p_task[2][MAX_PLAYERS];

	new Text:g_taxi_stats;

	#define TAXI_MAX_SEATS 4
	new PlayerText:p_taxi_stats[TAXI_MAX_SEATS][MAX_PLAYERS];

	new PlayerText:p_stats[3][MAX_PLAYERS];
	new Text:g_stats[5];

	new Text:g_blood[3];

	new PlayerText:pArea[MAX_PLAYERS];
	new PlayerText:logo[MAX_PLAYERS];

	// Wanted level
	new Text:twanted[10];

	// Kuprinė
	new PlayerText:iBag[MAX_PLAYERS][65];

	// Skin pasirinkimas spawne
	new Text:iSkin[5];

	// Parduotuvė
	new Text:iShop[16];
	#define pShop pTrunk

	// Bagažinė
	new Text:iTrunk[16];
	new PlayerText:pTrunk[MAX_PLAYERS][2][37];

	// Mechanikų tune
	new Text:iTune[22];
	
	// Init
	new Text:Init0;
	new Text:Init1;
	new Text:Init2;
	new Text:Init3;
	new Text:Init4;
	
	new PlayerText:dmg[2][MAX_PLAYERS]; // dmg rodymas
	// Spidometras
	new	/*PlayerText:spd1[MAX_PLAYERS],
		PlayerText:spd2[MAX_PLAYERS],
		PlayerText:spd3[MAX_PLAYERS],
		PlayerText:spd4[MAX_PLAYERS],
		PlayerText:spd5[MAX_PLAYERS],
		PlayerText:spd6[MAX_PLAYERS],
		PlayerText:spd7[MAX_PLAYERS],
		PlayerText:spd8[MAX_PLAYERS],
		PlayerText:spd9[MAX_PLAYERS],
		PlayerText:spd10[MAX_PLAYERS],*/
		
	// GPS TextDrawai

	Text:menu[2],
	PlayerText:pmenu[12][MAX_PLAYERS],
/*
	PlayerText:menu1[MAX_PLAYERS],
	PlayerText:menu2[MAX_PLAYERS],
	PlayerText:menu3[MAX_PLAYERS],
	PlayerText:menu4[MAX_PLAYERS],
	PlayerText:menu5[MAX_PLAYERS],
	PlayerText:menu6[MAX_PLAYERS],
	PlayerText:menu7[MAX_PLAYERS],
	PlayerText:menu8[MAX_PLAYERS],
	PlayerText:menu9[MAX_PLAYERS],
	PlayerText:menu10[MAX_PLAYERS],
	PlayerText:menu11[MAX_PLAYERS],
	PlayerText:menu12[MAX_PLAYERS],
	PlayerText:menu14[MAX_PLAYERS],
*/
	// Degalinės skaitiklis
	PlayerText:kuro_kaina2[MAX_PLAYERS],
	PlayerText:kuro_kaina3[MAX_PLAYERS],
	PlayerText:kuro_kaina5[MAX_PLAYERS],
	PlayerText:kuro_kaina6[MAX_PLAYERS],
	PlayerText:kuro_kaina7[MAX_PLAYERS],
	PlayerText:kuro_kaina8[MAX_PLAYERS],
	PlayerText:kuro_kaina9[MAX_PLAYERS],
	PlayerText:kuro_kaina10[MAX_PLAYERS],
	PlayerText:kuro_kaina11[MAX_PLAYERS];

	//CarTurgus
	new Text:g_carShop[8];
	new PlayerText:p_carShop[9][MAX_PLAYERS];
	
	// NOTIFICATION
	new PlayerText:Notification0[MAX_PLAYERS];
	new PlayerText:Notification1[MAX_PLAYERS];
	new PlayerText:Notification2[MAX_PLAYERS];

	new PlayerText:infoList[MAX_PLAYERS];
	
	// SHOP
	new Text:Shop0;
	new Text:Shop1;
	new Text:Shop2;
	new Text:Shop3;
	new Text:Shop4;
	new Text:Shop5;
	new Text:Shop6;
	new Text:Shop7;
	new Text:Shop8;
	new Text:Shop9;
	new Text:Shop10;
	new Text:Shop11;
	new Text:Shop12;
	new Text:Shop13;
	new Text:Shop14;
	

//--------------------------------------------------

stock meniu(pid)
{
	pmenu[0][playerid] = CreatePlayerTextDraw(playerid, 166.117568, 128.333389, "GPS");
	PlayerTextDrawLetterSize(playerid, pmenu[0][playerid], 0.380822, 1.716665);
	PlayerTextDrawAlignment(playerid, pmenu[0][playerid], 1);
	PlayerTextDrawColor(playerid, pmenu[0][playerid], -1);
	PlayerTextDrawSetShadow(playerid, pmenu[0][playerid], 0);
	PlayerTextDrawSetOutline(playerid, pmenu[0][playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, pmenu[0][playerid], 51);
	PlayerTextDrawFont(playerid, pmenu[0][playerid], 2);
	PlayerTextDrawSetProportional(playerid, pmenu[0][playerid], 1);

	pmenu[1][playerid] = CreatePlayerTextDraw(playerid, 215.117538, 174.833404, "labai ilgas tekstas");
	PlayerTextDrawLetterSize(playerid, pmenu[1][playerid], 0.298940, 1.594166);
	PlayerTextDrawTextSize(playerid, pmenu[1][playerid], 20.235311, 93.916641);
	PlayerTextDrawAlignment(playerid, pmenu[1][playerid], 2);
	PlayerTextDrawColor(playerid, pmenu[1][playerid], -1);
	PlayerTextDrawUseBox(playerid, pmenu[1][playerid], true);
	PlayerTextDrawBoxColor(playerid, pmenu[1][playerid], 0);
	PlayerTextDrawSetShadow(playerid, pmenu[1][playerid], 0);
	PlayerTextDrawSetOutline(playerid, pmenu[1][playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, pmenu[1][playerid], 51);
	PlayerTextDrawFont(playerid, pmenu[1][playerid], 2);
	PlayerTextDrawSetProportional(playerid, pmenu[1][playerid], 1);
	PlayerTextDrawSetSelectable(playerid, pmenu[1][playerid], true);

	pmenu[2][playerid] = CreatePlayerTextDraw(playerid, 214.705810, 218.416381, "dar ilgesnis tekstas");
	PlayerTextDrawLetterSize(playerid, pmenu[2][playerid], 0.298940, 1.594166);
	PlayerTextDrawTextSize(playerid, pmenu[2][playerid], 20.235311, 93.916641);
	PlayerTextDrawAlignment(playerid, pmenu[2][playerid], 2);
	PlayerTextDrawColor(playerid, pmenu[2][playerid], -1);
	PlayerTextDrawUseBox(playerid, pmenu[2][playerid], true);
	PlayerTextDrawBoxColor(playerid, pmenu[2][playerid], 0);
	PlayerTextDrawSetShadow(playerid, pmenu[2][playerid], 0);
	PlayerTextDrawSetOutline(playerid, pmenu[2][playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, pmenu[2][playerid], 51);
	PlayerTextDrawFont(playerid, pmenu[2][playerid], 2);
	PlayerTextDrawSetProportional(playerid, pmenu[2][playerid], 1);
	PlayerTextDrawSetSelectable(playerid, pmenu[2][playerid], true);

	pmenu[3][playerid] = CreatePlayerTextDraw(playerid, 215.705810, 256.166290, "tokio ilgio tekstu nekurti");
	PlayerTextDrawLetterSize(playerid, pmenu[3][playerid], 0.298940, 1.594166);
	PlayerTextDrawTextSize(playerid, pmenu[3][playerid], 20.235311, 93.916641);
	PlayerTextDrawAlignment(playerid, pmenu[3][playerid], 2);
	PlayerTextDrawColor(playerid, pmenu[3][playerid], -1);
	PlayerTextDrawUseBox(playerid, pmenu[3][playerid], true);
	PlayerTextDrawBoxColor(playerid, pmenu[3][playerid], 0);
	PlayerTextDrawSetShadow(playerid, pmenu[3][playerid], 0);
	PlayerTextDrawSetOutline(playerid, pmenu[3][playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, pmenu[3][playerid], 51);
	PlayerTextDrawFont(playerid, pmenu[3][playerid], 2);
	PlayerTextDrawSetProportional(playerid, pmenu[3][playerid], 1);
	PlayerTextDrawSetSelectable(playerid, pmenu[3][playerid], true);

	pmenu[4][playerid] = CreatePlayerTextDraw(playerid, 328.705505, 174.916305, "toks pohui tekstas");
	PlayerTextDrawLetterSize(playerid, pmenu[4][playerid], 0.298940, 1.594166);
	PlayerTextDrawTextSize(playerid, pmenu[4][playerid], 20.235311, 93.916641);
	PlayerTextDrawAlignment(playerid, pmenu[4][playerid], 2);
	PlayerTextDrawColor(playerid, pmenu[4][playerid], -1);
	PlayerTextDrawUseBox(playerid, pmenu[4][playerid], true);
	PlayerTextDrawBoxColor(playerid, pmenu[4][playerid], 0);
	PlayerTextDrawSetShadow(playerid, pmenu[4][playerid], 0);
	PlayerTextDrawSetOutline(playerid, pmenu[4][playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, pmenu[4][playerid], 51);
	PlayerTextDrawFont(playerid, pmenu[4][playerid], 2);
	PlayerTextDrawSetProportional(playerid, pmenu[4][playerid], 1);
	PlayerTextDrawSetSelectable(playerid, pmenu[4][playerid], true);

	pmenu[5][playerid] = CreatePlayerTextDraw(playerid, 328.293762, 218.499633, "2 eiluciu tekstas");
	PlayerTextDrawLetterSize(playerid, pmenu[5][playerid], 0.298940, 1.594166);
	PlayerTextDrawTextSize(playerid, pmenu[5][playerid], 20.235311, 93.916641);
	PlayerTextDrawAlignment(playerid, pmenu[5][playerid], 2);
	PlayerTextDrawColor(playerid, pmenu[5][playerid], -1);
	PlayerTextDrawUseBox(playerid, pmenu[5][playerid], true);
	PlayerTextDrawBoxColor(playerid, pmenu[5][playerid], 0);
	PlayerTextDrawSetShadow(playerid, pmenu[5][playerid], 0);
	PlayerTextDrawSetOutline(playerid, pmenu[5][playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, pmenu[5][playerid], 51);
	PlayerTextDrawFont(playerid, pmenu[5][playerid], 2);
	PlayerTextDrawSetProportional(playerid, pmenu[5][playerid], 1);
	PlayerTextDrawSetSelectable(playerid, pmenu[5][playerid], true);

	pmenu[6][playerid] = CreatePlayerTextDraw(playerid, 327.881927, 256.249694, "row1_field1");
	PlayerTextDrawLetterSize(playerid, pmenu[6][playerid], 0.298940, 1.594166);
	PlayerTextDrawTextSize(playerid, pmenu[6][playerid], 20.235311, 93.916641);
	PlayerTextDrawAlignment(playerid, pmenu[6][playerid], 2);
	PlayerTextDrawColor(playerid, pmenu[6][playerid], -1);
	PlayerTextDrawUseBox(playerid, pmenu[6][playerid], true);
	PlayerTextDrawBoxColor(playerid, pmenu[6][playerid], 0);
	PlayerTextDrawSetShadow(playerid, pmenu[6][playerid], 0);
	PlayerTextDrawSetOutline(playerid, pmenu[6][playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, pmenu[6][playerid], 51);
	PlayerTextDrawFont(playerid, pmenu[6][playerid], 2);
	PlayerTextDrawSetProportional(playerid, pmenu[6][playerid], 1);
	PlayerTextDrawSetSelectable(playerid, pmenu[6][playerid], true);

	pmenu[7][playerid] = CreatePlayerTextDraw(playerid, 442.764129, 174.999725, "row1_field1");
	PlayerTextDrawLetterSize(playerid, pmenu[7][playerid], 0.298940, 1.594166);
	PlayerTextDrawTextSize(playerid, pmenu[7][playerid], 20.235311, 93.916641);
	PlayerTextDrawAlignment(playerid, pmenu[7][playerid], 2);
	PlayerTextDrawColor(playerid, pmenu[7][playerid], -1);
	PlayerTextDrawUseBox(playerid, pmenu[7][playerid], true);
	PlayerTextDrawBoxColor(playerid, pmenu[7][playerid], 0);
	PlayerTextDrawSetShadow(playerid, pmenu[7][playerid], 0);
	PlayerTextDrawSetOutline(playerid, pmenu[7][playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, pmenu[7][playerid], 51);
	PlayerTextDrawFont(playerid, pmenu[7][playerid], 2);
	PlayerTextDrawSetProportional(playerid, pmenu[7][playerid], 1);
	PlayerTextDrawSetSelectable(playerid, pmenu[7][playerid], true);

	pmenu[8][playerid] = CreatePlayerTextDraw(playerid, 443.293548, 218.583038, "row1_field1");
	PlayerTextDrawLetterSize(playerid, pmenu[8][playerid], 0.298940, 1.594166);
	PlayerTextDrawTextSize(playerid, pmenu[8][playerid], 20.235311, 93.916641);
	PlayerTextDrawAlignment(playerid, pmenu[8][playerid], 2);
	PlayerTextDrawColor(playerid, pmenu[8][playerid], -1);
	PlayerTextDrawUseBox(playerid, pmenu[8][playerid], true);
	PlayerTextDrawBoxColor(playerid, pmenu[8][playerid], 0);
	PlayerTextDrawSetShadow(playerid, pmenu[8][playerid], 0);
	PlayerTextDrawSetOutline(playerid, pmenu[8][playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, pmenu[8][playerid], 51);
	PlayerTextDrawFont(playerid, pmenu[8][playerid], 2);
	PlayerTextDrawSetProportional(playerid, pmenu[8][playerid], 1);
	PlayerTextDrawSetSelectable(playerid, pmenu[8][playerid], true);

	pmenu[9][playerid] = CreatePlayerTextDraw(playerid, 442.881835, 256.333038, "row1_field1");
	PlayerTextDrawLetterSize(playerid, pmenu[9][playerid], 0.298940, 1.594166);
	PlayerTextDrawTextSize(playerid, pmenu[9][playerid], 20.235311, 93.916641);
	PlayerTextDrawAlignment(playerid, pmenu[9][playerid], 2);
	PlayerTextDrawColor(playerid, pmenu[9][playerid], -1);
	PlayerTextDrawUseBox(playerid, pmenu[9][playerid], true);
	PlayerTextDrawBoxColor(playerid, pmenu[9][playerid], 0);
	PlayerTextDrawSetShadow(playerid, pmenu[9][playerid], 0);
	PlayerTextDrawSetOutline(playerid, pmenu[9][playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, pmenu[9][playerid], 51);
	PlayerTextDrawFont(playerid, pmenu[9][playerid], 2);
	PlayerTextDrawSetProportional(playerid, pmenu[9][playerid], 1);
	PlayerTextDrawSetSelectable(playerid, pmenu[9][playerid], true);

	pmenu[10][playerid] = CreatePlayerTextDraw(playerid, 202.000122, 314.499511, "atgal");
	PlayerTextDrawLetterSize(playerid, pmenu[10][playerid], 0.336587, 1.798333);
	PlayerTextDrawTextSize(playerid, pmenu[10][playerid], 10.823531, 111.416633);
	PlayerTextDrawAlignment(playerid, pmenu[10][playerid], 2);
	PlayerTextDrawColor(playerid, pmenu[10][playerid], -1);
	PlayerTextDrawUseBox(playerid, pmenu[10][playerid], true);
	PlayerTextDrawBoxColor(playerid, pmenu[10][playerid], 0);
	PlayerTextDrawSetShadow(playerid, pmenu[10][playerid], 0);
	PlayerTextDrawSetOutline(playerid, pmenu[10][playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, pmenu[10][playerid], 51);
	PlayerTextDrawFont(playerid, pmenu[10][playerid], 2);
	PlayerTextDrawSetProportional(playerid, pmenu[10][playerid], 1);
	PlayerTextDrawSetSelectable(playerid, pmenu[10][playerid], true);

	pmenu[11][playerid] = CreatePlayerTextDraw(playerid, 442.529541, 314.332855, "uzdaryti");
	PlayerTextDrawLetterSize(playerid, pmenu[11][playerid], 0.336587, 1.798333);
	PlayerTextDrawTextSize(playerid, pmenu[11][playerid], 10.823531, 111.416633);
	PlayerTextDrawAlignment(playerid, pmenu[11][playerid], 2);
	PlayerTextDrawColor(playerid, pmenu[11][playerid], -1);
	PlayerTextDrawUseBox(playerid, pmenu[11][playerid], true);
	PlayerTextDrawBoxColor(playerid, pmenu[11][playerid], 0);
	PlayerTextDrawSetShadow(playerid, pmenu[11][playerid], 0);
	PlayerTextDrawSetOutline(playerid, pmenu[11][playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, pmenu[11][playerid], 51);
	PlayerTextDrawFont(playerid, pmenu[11][playerid], 2);
	PlayerTextDrawSetProportional(playerid, pmenu[11][playerid], 1);
	PlayerTextDrawSetSelectable(playerid, pmenu[11][playerid], true);
}

stock TextDrawai()
{
	   // TextDraw'ai
		firsttd = TextDrawCreate(223.953, 33.249, "lol");
		TextDrawFont(firsttd, 4);

		g_craft[0] = TextDrawCreate(27.500000, 121.916664, "soc:menu");
		TextDrawLetterSize(g_craft[0], 0.000000, 0.000000);
		TextDrawTextSize(g_craft[0], 133.000000, 204.749832);
		TextDrawAlignment(g_craft[0], 1);
		TextDrawColor(g_craft[0], -1);
		TextDrawSetShadow(g_craft[0], 0);
		TextDrawSetOutline(g_craft[0], 0);
		TextDrawFont(g_craft[0], 4);

		g_craft[1] = TextDrawCreate(33.500000, 125.999992, "Daiktu gamyba");
		TextDrawLetterSize(g_craft[1], 0.248500, 1.424998);
		TextDrawAlignment(g_craft[1], 1);
		TextDrawColor(g_craft[1], -1);
		TextDrawSetShadow(g_craft[1], 0);
		TextDrawSetOutline(g_craft[1], 1);
		TextDrawBackgroundColor(g_craft[1], 51);
		TextDrawFont(g_craft[1], 2);
		TextDrawSetProportional(g_craft[1], 1);

		g_craft[2] = TextDrawCreate(62.000000, 285.250061, "Gaminti");
		TextDrawLetterSize(g_craft[2], 0.432999, 1.967499);
		TextDrawTextSize(g_craft[2], 15.000000, 60.666694);
		TextDrawAlignment(g_craft[2], 2);
		TextDrawColor(g_craft[2], -1);
		TextDrawUseBox(g_craft[2], true);
		TextDrawBoxColor(g_craft[2], 0);
		TextDrawSetShadow(g_craft[2], 0);
		TextDrawSetOutline(g_craft[2], 1);
		TextDrawBackgroundColor(g_craft[2], 51);
		TextDrawFont(g_craft[2], 1);
		TextDrawSetProportional(g_craft[2], 1);
		TextDrawSetSelectable(g_craft[2], true);

		g_craft[3] = TextDrawCreate(133.000000, 289.333282, "Uzdaryti");
		TextDrawLetterSize(g_craft[3], 0.203500, 1.419165);
		TextDrawTextSize(g_craft[3], 12.500000, 41.416667);
		TextDrawAlignment(g_craft[3], 2);
		TextDrawColor(g_craft[3], -1);
		TextDrawUseBox(g_craft[3], true);
		TextDrawBoxColor(g_craft[3], 0);
		TextDrawSetShadow(g_craft[3], 0);
		TextDrawSetOutline(g_craft[3], 1);
		TextDrawBackgroundColor(g_craft[3], 51);
		TextDrawFont(g_craft[3], 2);
		TextDrawSetProportional(g_craft[3], 1);
		TextDrawSetSelectable(g_craft[3], true);

		g_craft[4] = TextDrawCreate(31.500000, 144.083343, "LD_SPAC:white");
		TextDrawLetterSize(g_craft[4], 0.000000, 0.000000);
		TextDrawTextSize(g_craft[4], 125.000000, 112.000015);
		TextDrawAlignment(g_craft[4], 1);
		TextDrawColor(g_craft[4], 72);
		TextDrawSetShadow(g_craft[4], 0);
		TextDrawSetOutline(g_craft[4], 0);
		TextDrawFont(g_craft[4], 4);

		g_crosshair = TextDrawCreate(320.000000, 240.000000, "LD_BEAT:chit");
		TextDrawLetterSize(g_crosshair, 0.000000, 0.000000);
		TextDrawTextSize(g_crosshair, 7.000000, 7.000000);
		TextDrawAlignment(g_crosshair, 2);
		TextDrawColor(g_crosshair, -1);
		TextDrawSetShadow(g_crosshair, 0);
		TextDrawSetOutline(g_crosshair, 0);
		TextDrawFont(g_crosshair, 4);

		g_pRepairBar[0] = TextDrawCreate(193.000000, 405.000000, "LD_SPAC:white");
		TextDrawLetterSize(g_pRepairBar[0], 0.000000, 0.000000);
		TextDrawTextSize(g_pRepairBar[0], 248.000000, 27.000000);
		TextDrawAlignment(g_pRepairBar[0], 1);
		TextDrawColor(g_pRepairBar[0], 255);
		TextDrawSetShadow(g_pRepairBar[0], 0);
		TextDrawSetOutline(g_pRepairBar[0], 0);
		TextDrawFont(g_pRepairBar[0], 4);

		g_pRepairBar[1] = TextDrawCreate(194.000000, 406.000000, "LD_SPAC:white");
		TextDrawLetterSize(g_pRepairBar[1], 0.000000, 0.000000);
		TextDrawTextSize(g_pRepairBar[1], 246.000000, 25.000000);
		TextDrawAlignment(g_pRepairBar[1], 1);
		TextDrawColor(g_pRepairBar[1], 1480458495);
		TextDrawSetShadow(g_pRepairBar[1], 0);
		TextDrawSetOutline(g_pRepairBar[1], 0);
		TextDrawBackgroundColor(g_pRepairBar[1], 128);
		TextDrawFont(g_pRepairBar[1], 4);
		TextDrawSetProportional(g_pRepairBar[1], 1);

		g_pRepairBar[2] = TextDrawCreate(196.235321, 386.750030, "Remonto progresas:");
		TextDrawLetterSize(g_pRepairBar[2], 0.280588, 1.599999);
		TextDrawAlignment(g_pRepairBar[2], 1);
		TextDrawColor(g_pRepairBar[2], -1);
		TextDrawSetShadow(g_pRepairBar[2], 0);
		TextDrawSetOutline(g_pRepairBar[2], 1);
		TextDrawBackgroundColor(g_pRepairBar[2], 51);
		TextDrawFont(g_pRepairBar[2], 1);
		TextDrawSetProportional(g_pRepairBar[2], 1);

		g_blood[0] = TextDrawCreate(0, 0, "soc:hp70");
		TextDrawTextSize(g_blood[0], 640, 480);
		TextDrawFont(g_blood[0], 4);
		g_blood[1] = TextDrawCreate(0, 0, "soc:hp60");
		TextDrawTextSize(g_blood[1], 640, 480);
		TextDrawFont(g_blood[1], 4);
		g_blood[2] = TextDrawCreate(0, 0, "soc:hp40");
		TextDrawTextSize(g_blood[2], 640, 480);
		TextDrawFont(g_blood[2], 4);

		g_stats[0] = TextDrawCreate(548.235351, 49.583328, "hud:radar_cash");
		TextDrawLetterSize(g_stats[0], 0.000000, 0.000000);
		TextDrawTextSize(g_stats[0], 12.000000, 12.000000);
		TextDrawAlignment(g_stats[0], 1);
		TextDrawColor(g_stats[0], -1);
		TextDrawSetShadow(g_stats[0], 0);
		TextDrawSetOutline(g_stats[0], 0);
		TextDrawFont(g_stats[0], 4);

		g_stats[1] = TextDrawCreate(505.941253, 83.250015, "hud:radar_centre");
		TextDrawLetterSize(g_stats[1], 0.000000, 0.000000);
		TextDrawTextSize(g_stats[1], 12.000000, 12.000000);
		TextDrawAlignment(g_stats[1], 1);
		TextDrawColor(g_stats[1], -16776961);
		TextDrawSetShadow(g_stats[1], 0);
		TextDrawSetOutline(g_stats[1], 0);
		TextDrawFont(g_stats[1], 4);

		g_stats[2] = TextDrawCreate(548.352783, 63.833324, "hud:radar_ryder");
		TextDrawLetterSize(g_stats[2], 0.000000, 0.000000);
		TextDrawTextSize(g_stats[2], 12.000000, 12.000000);
		TextDrawAlignment(g_stats[2], 1);
		TextDrawColor(g_stats[2], -637533953);
		TextDrawSetShadow(g_stats[2], 0);
		TextDrawSetOutline(g_stats[2], 0);
		TextDrawFont(g_stats[2], 4);

		g_stats[3] = TextDrawCreate(520.941101, 86.916656, "LD_SPAC:white");
		TextDrawLetterSize(g_stats[3], 0.000000, 0.000000);
		TextDrawTextSize(g_stats[3], 103.058837, 5.833337);
		TextDrawAlignment(g_stats[3], 1);
		TextDrawColor(g_stats[3], 255);
		TextDrawSetShadow(g_stats[3], 0);
		TextDrawSetOutline(g_stats[3], 0);
		TextDrawFont(g_stats[3], 4);

		g_stats[4] = TextDrawCreate(522.035217, 88.324951, "LD_SPAC:white");
		TextDrawLetterSize(g_stats[4], 0.000000, 0.000000);
		TextDrawTextSize(g_stats[4], 101, 3.2);
		TextDrawAlignment(g_stats[4], 1);
		TextDrawColor(g_stats[4], 1442840831);
		TextDrawSetShadow(g_stats[4], 0);
		TextDrawSetOutline(g_stats[4], 0);
		TextDrawFont(g_stats[4], 4);

		g_taxi_stats = TextDrawCreate(22.588274, 141.166778, "Taksi informacija:");
		TextDrawLetterSize(g_taxi_stats, 0.288588, 1.862500);
		TextDrawAlignment(g_taxi_stats, 1);
		TextDrawColor(g_taxi_stats, -5762305);
		TextDrawSetShadow(g_taxi_stats, 0);
		TextDrawSetOutline(g_taxi_stats, 1);
		TextDrawBackgroundColor(g_taxi_stats, 51);
		TextDrawFont(g_taxi_stats, 2);
		TextDrawSetProportional(g_taxi_stats, 1);

		g_carShop[0] = TextDrawCreate(515.967712, 328.166656, "usebox");
		TextDrawLetterSize(g_carShop[0], 0.000000, 11.998149);
		TextDrawTextSize(g_carShop[0], 119.815551, 0.000000);
		TextDrawAlignment(g_carShop[0], 1);
		TextDrawColor(g_carShop[0], 0);
		TextDrawUseBox(g_carShop[0], true);
		TextDrawBoxColor(g_carShop[0], 54);
		TextDrawSetShadow(g_carShop[0], 0);
		TextDrawSetOutline(g_carShop[0], 0);
		TextDrawFont(g_carShop[0], 0);

		g_carShop[1] = TextDrawCreate(326.117614, 361.666687, "LD_SPAC:white");
		TextDrawLetterSize(g_carShop[1], 0.000000, 0.000000);
		TextDrawTextSize(g_carShop[1], 0.000000, 22.166624);
		TextDrawAlignment(g_carShop[1], 1);
		TextDrawColor(g_carShop[1], -1);
		TextDrawSetShadow(g_carShop[1], 0);
		TextDrawSetOutline(g_carShop[1], 0);
		TextDrawFont(g_carShop[1], 4);

		g_carShop[2] = TextDrawCreate(11.713085, 202.416641, "Keisti masina:");
		TextDrawLetterSize(g_carShop[2], 0.267744, 1.681666);
		TextDrawAlignment(g_carShop[2], 1);
		TextDrawColor(g_carShop[2], -1);
		TextDrawSetShadow(g_carShop[2], 0);
		TextDrawSetOutline(g_carShop[2], 1);
		TextDrawBackgroundColor(g_carShop[2], 51);
		TextDrawFont(g_carShop[2], 2);
		TextDrawSetProportional(g_carShop[2], 1);

		g_carShop[3] = TextDrawCreate(12.776043, 248.750198, "pirkti masina:~n~~y~ENTER");
		TextDrawLetterSize(g_carShop[3], 0.267744, 1.681666);
		TextDrawAlignment(g_carShop[3], 1);
		TextDrawColor(g_carShop[3], -1);
		TextDrawSetShadow(g_carShop[3], 0);
		TextDrawSetOutline(g_carShop[3], 1);
		TextDrawBackgroundColor(g_carShop[3], 51);
		TextDrawFont(g_carShop[3], 2);
		TextDrawSetProportional(g_carShop[3], 1);

		g_carShop[4] = TextDrawCreate(12.839001, 288.249908, "iseiti is pirkimo: ~n~~y~CTRL");
		TextDrawLetterSize(g_carShop[4], 0.267744, 1.681666);
		TextDrawAlignment(g_carShop[4], 1);
		TextDrawColor(g_carShop[4], -1);
		TextDrawSetShadow(g_carShop[4], 0);
		TextDrawSetOutline(g_carShop[4], 1);
		TextDrawBackgroundColor(g_carShop[4], 51);
		TextDrawFont(g_carShop[4], 2);
		TextDrawSetProportional(g_carShop[4], 1);

		g_carShop[5] = TextDrawCreate(12.181550, 221.083343, "LD_BEAT:left");
		TextDrawLetterSize(g_carShop[5], 0.000000, 0.000000);
		TextDrawTextSize(g_carShop[5], 17.000000, 17.499984);
		TextDrawAlignment(g_carShop[5], 1);
		TextDrawColor(g_carShop[5], -1);
		TextDrawSetShadow(g_carShop[5], 0);
		TextDrawSetOutline(g_carShop[5], 0);
		TextDrawFont(g_carShop[5], 4);

		g_carShop[6] = TextDrawCreate(36.607608, 220.916687, "LD_BEAT:RIGHT");
		TextDrawLetterSize(g_carShop[6], 0.000000, 0.000000);
		TextDrawTextSize(g_carShop[6], 17.000000, 17.499984);
		TextDrawAlignment(g_carShop[6], 1);
		TextDrawColor(g_carShop[6], -1);
		TextDrawSetShadow(g_carShop[6], 0);
		TextDrawSetOutline(g_carShop[6], 0);
		TextDrawFont(g_carShop[6], 4);

		g_carShop[7] = TextDrawCreate(12.427234, 328.333526, "isbandyti masina: ~n~~y~~k~~PED_SPRINT~");
		TextDrawLetterSize(g_carShop[7], 0.267744, 1.681666);
		TextDrawAlignment(g_carShop[7], 1);
		TextDrawColor(g_carShop[7], -1);
		TextDrawSetShadow(g_carShop[7], 0);
		TextDrawSetOutline(g_carShop[7], 1);
		TextDrawBackgroundColor(g_carShop[7], 51);
		TextDrawFont(g_carShop[7], 2);
		TextDrawSetProportional(g_carShop[7], 1);

		iSkin[0] = TextDrawCreate(284.860626, 103.833328, "Kas tu?");
		TextDrawLetterSize(iSkin[0], 0.382064, 2.049167);
		TextDrawAlignment(iSkin[0], 1);
		TextDrawColor(iSkin[0], -1);
		TextDrawSetShadow(iSkin[0], 0);
		TextDrawSetOutline(iSkin[0], 1);
		TextDrawBackgroundColor(iSkin[0], 51);
		TextDrawFont(iSkin[0], 2);
		TextDrawSetProportional(iSkin[0], 1);

		iSkin[1] = TextDrawCreate(227.232803, 200.083374, "LD_BEAT:left");
		TextDrawLetterSize(iSkin[1], 0.000000, 0.000000);
		TextDrawTextSize(iSkin[1], 25.768661, 25.666656);
		TextDrawAlignment(iSkin[1], 1);
		TextDrawColor(iSkin[1], -2139062017);
		TextDrawSetShadow(iSkin[1], -35);
		TextDrawSetOutline(iSkin[1], 0);
		TextDrawBackgroundColor(iSkin[1], 255);
		TextDrawFont(iSkin[1], 4);

		iSkin[2] = TextDrawCreate(380.034423, 199.916687, "LD_BEAT:right");
		TextDrawLetterSize(iSkin[2], 0.000000, 0.000000);
		TextDrawTextSize(iSkin[2], 25.768661, 25.666656);
		TextDrawAlignment(iSkin[2], 1);
		TextDrawColor(iSkin[2], -2139062017);
		TextDrawSetShadow(iSkin[2], -35);
		TextDrawSetOutline(iSkin[2], 0);
		TextDrawBackgroundColor(iSkin[2], 255);
		TextDrawFont(iSkin[2], 4);

		iSkin[3] = TextDrawCreate(323.748138, 358.750061, "pasirinkti:~n~~y~ENTER");
		TextDrawLetterSize(iSkin[3], 0.362386, 1.844998);
		TextDrawAlignment(iSkin[3], 2);
		TextDrawColor(iSkin[3], -1);
		TextDrawSetShadow(iSkin[3], 0);
		TextDrawSetOutline(iSkin[3], 1);
		TextDrawBackgroundColor(iSkin[3], 51);
		TextDrawFont(iSkin[3], 2);
		TextDrawSetProportional(iSkin[3], 1);


		menu[0] = TextDrawCreate(503.176025, 119.333320, "usebox");
		TextDrawLetterSize(menu[0], 0.000000, 25.058807);
		TextDrawTextSize(menu[0], 137.764709, 0.000000);
		TextDrawAlignment(menu[0], 1);
		TextDrawColor(menu[0], 0);
		TextDrawUseBox(menu[0], true);
		TextDrawBoxColor(menu[0], 33);
		TextDrawSetShadow(menu[0], 0);
		TextDrawSetOutline(menu[0], 0);
		TextDrawFont(menu[0], 0);

		menu[1] = TextDrawCreate(498.058349, 123.833335, "usebox");
		TextDrawLetterSize(menu[1], 0.000000, 23.976459);
		TextDrawTextSize(menu[1], 141.999969, 0.000000);
		TextDrawAlignment(menu[1], 1);
		TextDrawColor(menu[1], 0);
		TextDrawUseBox(menu[1], true);
		TextDrawBoxColor(menu[1], 112);
		TextDrawSetShadow(menu[1], 0);
		TextDrawSetOutline(menu[1], 0);
		TextDrawFont(menu[1], 0);

		iStorage[0] = TextDrawCreate(345.234283, 372.766632, "Padeti");
		TextDrawLetterSize(iStorage[0], 0.206000, 1.315000);
		TextDrawTextSize(iStorage[0], 30.000000, 45.546001);
		TextDrawAlignment(iStorage[0], 2);
		TextDrawColor(iStorage[0], -1);
		TextDrawUseBox(iStorage[0], true);
		TextDrawBoxColor(iStorage[0], 102);
		TextDrawSetShadow(iStorage[0], 0);
		TextDrawSetOutline(iStorage[0], 1);
		TextDrawBackgroundColor(iStorage[0], 51);
		TextDrawFont(iStorage[0], 2);
		TextDrawSetProportional(iStorage[0], 1);
		TextDrawSetSelectable(iStorage[0], true);

		iStorage[1] = TextDrawCreate(283.451416, 373.081756, "Pasiimti");
		TextDrawLetterSize(iStorage[1], 0.206000, 1.315000);
		TextDrawTextSize(iStorage[1], 30.000000, 45.546001);
		TextDrawAlignment(iStorage[1], 2);
		TextDrawColor(iStorage[1], -1);
		TextDrawUseBox(iStorage[1], true);
		TextDrawBoxColor(iStorage[1], 102);
		TextDrawSetShadow(iStorage[1], 0);
		TextDrawSetOutline(iStorage[1], 1);
		TextDrawBackgroundColor(iStorage[1], 51);
		TextDrawFont(iStorage[1], 2);
		TextDrawSetProportional(iStorage[1], 1);
		TextDrawSetSelectable(iStorage[1], true);

		iStorage[2] = TextDrawCreate(99.794708, 128.916015, "Pavadinimas                                     kiekis");
		TextDrawLetterSize(iStorage[2], 0.178000, 1.126000);
		TextDrawAlignment(iStorage[2], 1);
		TextDrawColor(iStorage[2], -1);
		TextDrawSetShadow(iStorage[2], 0);
		TextDrawSetOutline(iStorage[2], 1);
		TextDrawBackgroundColor(iStorage[2], 51);
		TextDrawFont(iStorage[2], 2);
		TextDrawSetProportional(iStorage[2], 1);

		iStorage[3] = TextDrawCreate(320.531127, 128.749343, "Pavadinimas                                     kiekis");
		TextDrawLetterSize(iStorage[3], 0.178000, 1.126000);
		TextDrawAlignment(iStorage[3], 1);
		TextDrawColor(iStorage[3], -1);
		TextDrawSetShadow(iStorage[3], 0);
		TextDrawSetOutline(iStorage[3], 1);
		TextDrawBackgroundColor(iStorage[3], 51);
		TextDrawFont(iStorage[3], 2);
		TextDrawSetProportional(iStorage[3], 1);

		iShop[0] = TextDrawCreate(77.772628, 104.416343, "soc:menu");
		TextDrawLetterSize(iShop[0], 0.000000, 0.000000);
		TextDrawTextSize(iShop[0], 478.828277, 293.999908);
		TextDrawAlignment(iShop[0], 1);
		TextDrawColor(iShop[0], -1);
		TextDrawSetShadow(iShop[0], 0);
		TextDrawSetOutline(iShop[0], 0);
		TextDrawFont(iShop[0], 4);

		iShop[1] = TextDrawCreate(103.212570, 111.928321, "Parduotuve");
		TextDrawLetterSize(iShop[1], 0.335000, 1.383000);
		TextDrawAlignment(iShop[1], 1);
		TextDrawColor(iShop[1], -1);
		TextDrawSetShadow(iShop[1], 0);
		TextDrawSetOutline(iShop[1], 1);
		TextDrawBackgroundColor(iShop[1], 51);
		TextDrawFont(iShop[1], 2);
		TextDrawSetProportional(iShop[1], 1);

		iShop[3] = TextDrawCreate(510.496276, 372.831634, "uzdaryti");
		TextDrawLetterSize(iShop[3], 0.206000, 1.315000);
		TextDrawTextSize(iShop[3], 30.000000, 45.546001);
		TextDrawAlignment(iShop[3], 2);
		TextDrawColor(iShop[3], -1);
		TextDrawUseBox(iShop[3], true);
		TextDrawBoxColor(iShop[3], 102);
		TextDrawSetShadow(iShop[3], 0);
		TextDrawSetOutline(iShop[3], 1);
		TextDrawBackgroundColor(iShop[3], 51);
		TextDrawFont(iShop[3], 2);
		TextDrawSetProportional(iShop[3], 1);
		TextDrawSetSelectable(iShop[3], true);

		iShop[2] = TextDrawCreate(345.234283, 372.766632, "parduoti");
		TextDrawLetterSize(iShop[2], 0.206000, 1.315000);
		TextDrawTextSize(iShop[2], 30.000000, 45.546001);
		TextDrawAlignment(iShop[2], 2);
		TextDrawColor(iShop[2], -1);
		TextDrawUseBox(iShop[2], true);
		TextDrawBoxColor(iShop[2], 102);
		TextDrawSetShadow(iShop[2], 0);
		TextDrawSetOutline(iShop[2], 1);
		TextDrawBackgroundColor(iShop[2], 51);
		TextDrawFont(iShop[2], 2);
		TextDrawSetProportional(iShop[2], 1);
		TextDrawSetSelectable(iShop[2], true);

		iShop[4] = TextDrawCreate(283.451416, 373.081756, "Pirkti");
		TextDrawLetterSize(iShop[4], 0.206000, 1.315000);
		TextDrawTextSize(iShop[4], 30.000000, 45.546001);
		TextDrawAlignment(iShop[4], 2);
		TextDrawColor(iShop[4], -1);
		TextDrawUseBox(iShop[4], true);
		TextDrawBoxColor(iShop[4], 102);
		TextDrawSetShadow(iShop[4], 0);
		TextDrawSetOutline(iShop[4], 1);
		TextDrawBackgroundColor(iShop[4], 51);
		TextDrawFont(iShop[4], 2);
		TextDrawSetProportional(iShop[4], 1);
		TextDrawSetSelectable(iShop[4], true);

		iShop[5] = TextDrawCreate(314.969329, 129.246688, "box");
		TextDrawLetterSize(iShop[5], 0.000000, 23.756704);
		TextDrawTextSize(iShop[5], 93.106002, 0.000000);
		TextDrawAlignment(iShop[5], 1);
		TextDrawColor(iShop[5], 0);
		TextDrawUseBox(iShop[5], true);
		TextDrawBoxColor(iShop[5], 102);
		TextDrawSetShadow(iShop[5], 0);
		TextDrawSetOutline(iShop[5], 0);
		TextDrawFont(iShop[5], 0);

		iShop[6] = TextDrawCreate(99.794708, 128.916015, "Pavadinimas                                     kiekis      kaina");
		TextDrawLetterSize(iShop[6], 0.178000, 1.126000);
		TextDrawAlignment(iShop[6], 1);
		TextDrawColor(iShop[6], -1);
		TextDrawSetShadow(iShop[6], 0);
		TextDrawSetOutline(iShop[6], 1);
		TextDrawBackgroundColor(iShop[6], 51);
		TextDrawFont(iShop[6], 2);
		TextDrawSetProportional(iShop[6], 1);

		iShop[7] = TextDrawCreate(85.737960, 134.749328, "-");
		TextDrawLetterSize(iShop[7], 19.249046, 1.311166);
		TextDrawAlignment(iShop[7], 1);
		TextDrawColor(iShop[7], -1);
		TextDrawSetShadow(iShop[7], 0);
		TextDrawSetOutline(iShop[7], 1);
		TextDrawBackgroundColor(iShop[7], 51);
		TextDrawFont(iShop[7], 2);
		TextDrawSetProportional(iShop[7], 1);

		iShop[8] = TextDrawCreate(230.043182, 347.081573, ">>>");
		TextDrawLetterSize(iShop[8], 0.250000, 1.184000);
		TextDrawTextSize(iShop[8], 10.307000, 37.916000);
		TextDrawAlignment(iShop[8], 2);
		TextDrawColor(iShop[8], -1);
		TextDrawSetShadow(iShop[8], 0);
		TextDrawSetOutline(iShop[8], 1);
		TextDrawBackgroundColor(iShop[8], 51);
		TextDrawFont(iShop[8], 2);
		TextDrawSetProportional(iShop[8], 1);
		TextDrawSetSelectable(iShop[8], true);

		iShop[9] = TextDrawCreate(175.256912, 347.581726, "<<<");
		TextDrawLetterSize(iShop[9], 0.250000, 1.184000);
		TextDrawTextSize(iShop[9], 10.307000, 37.916000);
		TextDrawAlignment(iShop[9], 2);
		TextDrawColor(iShop[9], -1);
		TextDrawSetShadow(iShop[9], 0);
		TextDrawSetOutline(iShop[9], 1);
		TextDrawBackgroundColor(iShop[9], 51);
		TextDrawFont(iShop[9], 2);
		TextDrawSetProportional(iShop[9], 1);
		TextDrawSetSelectable(iShop[9], true);

		iShop[10] = TextDrawCreate(538.048767, 129.080032, "box");
		TextDrawLetterSize(iShop[10], 0.000000, 23.756704);
		TextDrawTextSize(iShop[10], 315.185180, 0.000000);
		TextDrawAlignment(iShop[10], 1);
		TextDrawColor(iShop[10], 0);
		TextDrawUseBox(iShop[10], true);
		TextDrawBoxColor(iShop[10], 102);
		TextDrawSetShadow(iShop[10], 0);
		TextDrawSetOutline(iShop[10], 0);
		TextDrawFont(iShop[10], 0);

		iShop[11] = TextDrawCreate(313.034210, 134.582656, "-");
		TextDrawLetterSize(iShop[11], 19.249046, 1.311166);
		TextDrawAlignment(iShop[11], 1);
		TextDrawColor(iShop[11], -1);
		TextDrawSetShadow(iShop[11], 0);
		TextDrawSetOutline(iShop[11], 1);
		TextDrawBackgroundColor(iShop[11], 51);
		TextDrawFont(iShop[11], 2);
		TextDrawSetProportional(iShop[11], 1);

		iShop[12] = TextDrawCreate(527.756408, 111.761680, "Kuprine");
		TextDrawLetterSize(iShop[12], 0.335000, 1.383000);
		TextDrawAlignment(iShop[12], 3);
		TextDrawColor(iShop[12], -1);
		TextDrawSetShadow(iShop[12], 0);
		TextDrawSetOutline(iShop[12], 1);
		TextDrawBackgroundColor(iShop[12], 51);
		TextDrawFont(iShop[12], 2);
		TextDrawSetProportional(iShop[12], 1);

		iShop[13] = TextDrawCreate(320.531127, 128.749343, "Pavadinimas                                     kiekis      kaina");
		TextDrawLetterSize(iShop[13], 0.178000, 1.126000);
		TextDrawAlignment(iShop[13], 1);
		TextDrawColor(iShop[13], -1);
		TextDrawSetShadow(iShop[13], 0);
		TextDrawSetOutline(iShop[13], 1);
		TextDrawBackgroundColor(iShop[13], 51);
		TextDrawFont(iShop[13], 2);
		TextDrawSetProportional(iShop[13], 1);

		iShop[14] = TextDrawCreate(406.770874, 346.831695, "<<<");
		TextDrawLetterSize(iShop[14], 0.250000, 1.184000);
		TextDrawTextSize(iShop[14], 10.307000, 37.916000);
		TextDrawAlignment(iShop[14], 2);
		TextDrawColor(iShop[14], -1);
		TextDrawSetShadow(iShop[14], 0);
		TextDrawSetOutline(iShop[14], 1);
		TextDrawBackgroundColor(iShop[14], 51);
		TextDrawFont(iShop[14], 2);
		TextDrawSetProportional(iShop[14], 1);
		TextDrawSetSelectable(iShop[14], true);

		iShop[15] = TextDrawCreate(460.150451, 346.914886, ">>>");
		TextDrawLetterSize(iShop[15], 0.250000, 1.184000);
		TextDrawTextSize(iShop[15], 10.307000, 37.916000);
		TextDrawAlignment(iShop[15], 2);
		TextDrawColor(iShop[15], -1);
		TextDrawSetShadow(iShop[15], 0);
		TextDrawSetOutline(iShop[15], 1);
		TextDrawBackgroundColor(iShop[15], 51);
		TextDrawFont(iShop[15], 2);
		TextDrawSetProportional(iShop[15], 1);
		TextDrawSetSelectable(iShop[15], true);





		iTrunk[0] = TextDrawCreate(77.772628, 104.416343, "soc:menu");
		TextDrawLetterSize(iTrunk[0], 0.000000, 0.000000);
		TextDrawTextSize(iTrunk[0], 478.828277, 293.999908);
		TextDrawAlignment(iTrunk[0], 1);
		TextDrawColor(iTrunk[0], -1);
		TextDrawSetShadow(iTrunk[0], 0);
		TextDrawSetOutline(iTrunk[0], 0);
		TextDrawFont(iTrunk[0], 4);

		iTrunk[1] = TextDrawCreate(103.212570, 111.928321, "Bagazine");
		TextDrawLetterSize(iTrunk[1], 0.335000, 1.383000);
		TextDrawAlignment(iTrunk[1], 1);
		TextDrawColor(iTrunk[1], -1);
		TextDrawSetShadow(iTrunk[1], 0);
		TextDrawSetOutline(iTrunk[1], 1);
		TextDrawBackgroundColor(iTrunk[1], 51);
		TextDrawFont(iTrunk[1], 2);
		TextDrawSetProportional(iTrunk[1], 1);

		iTrunk[2] = TextDrawCreate(345.234283, 372.766632, "ismesti");
		TextDrawLetterSize(iTrunk[2], 0.206000, 1.315000);
		TextDrawTextSize(iTrunk[2], 30.000000, 45.546001);
		TextDrawAlignment(iTrunk[2], 2);
		TextDrawColor(iTrunk[2], -1);
		TextDrawUseBox(iTrunk[2], true);
		TextDrawBoxColor(iTrunk[2], 102);
		TextDrawSetShadow(iTrunk[2], 0);
		TextDrawSetOutline(iTrunk[2], 1);
		TextDrawBackgroundColor(iTrunk[2], 51);
		TextDrawFont(iTrunk[2], 2);
		TextDrawSetProportional(iTrunk[2], 1);
		TextDrawSetSelectable(iTrunk[2], true);

		iTrunk[3] = TextDrawCreate(510.496276, 372.831634, "uzdaryti");
		TextDrawLetterSize(iTrunk[3], 0.206000, 1.315000);
		TextDrawTextSize(iTrunk[3], 30.000000, 45.546001);
		TextDrawAlignment(iTrunk[3], 2);
		TextDrawColor(iTrunk[3], -1);
		TextDrawUseBox(iTrunk[3], true);
		TextDrawBoxColor(iTrunk[3], 102);
		TextDrawSetShadow(iTrunk[3], 0);
		TextDrawSetOutline(iTrunk[3], 1);
		TextDrawBackgroundColor(iTrunk[3], 51);
		TextDrawFont(iTrunk[3], 2);
		TextDrawSetProportional(iTrunk[3], 1);
		TextDrawSetSelectable(iTrunk[3], true);

		iTrunk[4] = TextDrawCreate(283.451416, 373.081756, "Perkelti");
		TextDrawLetterSize(iTrunk[4], 0.206000, 1.315000);
		TextDrawTextSize(iTrunk[4], 30.000000, 45.546001);
		TextDrawAlignment(iTrunk[4], 2);
		TextDrawColor(iTrunk[4], -1);
		TextDrawUseBox(iTrunk[4], true);
		TextDrawBoxColor(iTrunk[4], 102);
		TextDrawSetShadow(iTrunk[4], 0);
		TextDrawSetOutline(iTrunk[4], 1);
		TextDrawBackgroundColor(iTrunk[4], 51);
		TextDrawFont(iTrunk[4], 2);
		TextDrawSetProportional(iTrunk[4], 1);
		TextDrawSetSelectable(iTrunk[4], true);

		iTrunk[5] = TextDrawCreate(314.969329, 129.246688, "box");
		TextDrawLetterSize(iTrunk[5], 0.000000, 23.756704);
		TextDrawTextSize(iTrunk[5], 93.106002, 0.000000);
		TextDrawAlignment(iTrunk[5], 1);
		TextDrawColor(iTrunk[5], 0);
		TextDrawUseBox(iTrunk[5], true);
		TextDrawBoxColor(iTrunk[5], 102);
		TextDrawSetShadow(iTrunk[5], 0);
		TextDrawSetOutline(iTrunk[5], 0);
		TextDrawFont(iTrunk[5], 0);

		iTrunk[6] = TextDrawCreate(99.794708, 128.916015, "Pavadinimas                                     kiekis      svoris");
		TextDrawLetterSize(iTrunk[6], 0.178000, 1.126000);
		TextDrawAlignment(iTrunk[6], 1);
		TextDrawColor(iTrunk[6], -1);
		TextDrawSetShadow(iTrunk[6], 0);
		TextDrawSetOutline(iTrunk[6], 1);
		TextDrawBackgroundColor(iTrunk[6], 51);
		TextDrawFont(iTrunk[6], 2);
		TextDrawSetProportional(iTrunk[6], 1);

		iTrunk[7] = TextDrawCreate(85.737960, 134.749328, "-");
		TextDrawLetterSize(iTrunk[7], 19.249046, 1.311166);
		TextDrawAlignment(iTrunk[7], 1);
		TextDrawColor(iTrunk[7], -1);
		TextDrawSetShadow(iTrunk[7], 0);
		TextDrawSetOutline(iTrunk[7], 1);
		TextDrawBackgroundColor(iTrunk[7], 51);
		TextDrawFont(iTrunk[7], 2);
		TextDrawSetProportional(iTrunk[7], 1);

		iTrunk[8] = TextDrawCreate(230.043182, 347.081573, ">>>");
		TextDrawLetterSize(iTrunk[8], 0.250000, 1.184000);
		TextDrawTextSize(iTrunk[8], 10.307000, 37.916000);
		TextDrawAlignment(iTrunk[8], 2);
		TextDrawColor(iTrunk[8], -1);
		TextDrawSetShadow(iTrunk[8], 0);
		TextDrawSetOutline(iTrunk[8], 1);
		TextDrawBackgroundColor(iTrunk[8], 51);
		TextDrawFont(iTrunk[8], 2);
		TextDrawSetProportional(iTrunk[8], 1);
		TextDrawSetSelectable(iTrunk[8], true);

		iTrunk[9] = TextDrawCreate(175.256912, 347.581726, "<<<");
		TextDrawLetterSize(iTrunk[9], 0.250000, 1.184000);
		TextDrawTextSize(iTrunk[9], 10.307000, 37.916000);
		TextDrawAlignment(iTrunk[9], 2);
		TextDrawColor(iTrunk[9], -1);
		TextDrawSetShadow(iTrunk[9], 0);
		TextDrawSetOutline(iTrunk[9], 1);
		TextDrawBackgroundColor(iTrunk[9], 51);
		TextDrawFont(iTrunk[9], 2);
		TextDrawSetProportional(iTrunk[9], 1);
		TextDrawSetSelectable(iTrunk[9], true);

		iTrunk[10] = TextDrawCreate(538.048767, 129.080032, "box");
		TextDrawLetterSize(iTrunk[10], 0.000000, 23.756704);
		TextDrawTextSize(iTrunk[10], 315.185180, 0.000000);
		TextDrawAlignment(iTrunk[10], 1);
		TextDrawColor(iTrunk[10], 0);
		TextDrawUseBox(iTrunk[10], true);
		TextDrawBoxColor(iTrunk[10], 102);
		TextDrawSetShadow(iTrunk[10], 0);
		TextDrawSetOutline(iTrunk[10], 0);
		TextDrawFont(iTrunk[10], 0);

		iTrunk[11] = TextDrawCreate(313.034210, 134.582656, "-");
		TextDrawLetterSize(iTrunk[11], 19.249046, 1.311166);
		TextDrawAlignment(iTrunk[11], 1);
		TextDrawColor(iTrunk[11], -1);
		TextDrawSetShadow(iTrunk[11], 0);
		TextDrawSetOutline(iTrunk[11], 1);
		TextDrawBackgroundColor(iTrunk[11], 51);
		TextDrawFont(iTrunk[11], 2);
		TextDrawSetProportional(iTrunk[11], 1);

		iTrunk[12] = TextDrawCreate(527.756408, 111.761680, "Kuprine");
		TextDrawLetterSize(iTrunk[12], 0.335000, 1.383000);
		TextDrawAlignment(iTrunk[12], 3);
		TextDrawColor(iTrunk[12], -1);
		TextDrawSetShadow(iTrunk[12], 0);
		TextDrawSetOutline(iTrunk[12], 1);
		TextDrawBackgroundColor(iTrunk[12], 51);
		TextDrawFont(iTrunk[12], 2);
		TextDrawSetProportional(iTrunk[12], 1);

		iTrunk[13] = TextDrawCreate(320.531127, 128.749343, "Pavadinimas                                     kiekis      svoris");
		TextDrawLetterSize(iTrunk[13], 0.178000, 1.126000);
		TextDrawAlignment(iTrunk[13], 1);
		TextDrawColor(iTrunk[13], -1);
		TextDrawSetShadow(iTrunk[13], 0);
		TextDrawSetOutline(iTrunk[13], 1);
		TextDrawBackgroundColor(iTrunk[13], 51);
		TextDrawFont(iTrunk[13], 2);
		TextDrawSetProportional(iTrunk[13], 1);

		iTrunk[14] = TextDrawCreate(406.770874, 346.831695, "<<<");
		TextDrawLetterSize(iTrunk[14], 0.250000, 1.184000);
		TextDrawTextSize(iTrunk[14], 10.307000, 37.916000);
		TextDrawAlignment(iTrunk[14], 2);
		TextDrawColor(iTrunk[14], -1);
		TextDrawSetShadow(iTrunk[14], 0);
		TextDrawSetOutline(iTrunk[14], 1);
		TextDrawBackgroundColor(iTrunk[14], 51);
		TextDrawFont(iTrunk[14], 2);
		TextDrawSetProportional(iTrunk[14], 1);
		TextDrawSetSelectable(iTrunk[14], true);

		iTrunk[15] = TextDrawCreate(460.150451, 346.914886, ">>>");
		TextDrawLetterSize(iTrunk[15], 0.250000, 1.184000);
		TextDrawTextSize(iTrunk[15], 10.307000, 37.916000);
		TextDrawAlignment(iTrunk[15], 2);
		TextDrawColor(iTrunk[15], -1);
		TextDrawSetShadow(iTrunk[15], 0);
		TextDrawSetOutline(iTrunk[15], 1);
		TextDrawBackgroundColor(iTrunk[15], 51);
		TextDrawFont(iTrunk[15], 2);
		TextDrawSetProportional(iTrunk[15], 1);
		TextDrawSetSelectable(iTrunk[15], true);

		iTune[0] = TextDrawCreate(201.278472, 448.058105, "soc:menu");
		TextDrawLetterSize(iTune[0], 0.000000, 0.000000);
		TextDrawTextSize(iTune[0], 285.798187, -32.666690);
		TextDrawAlignment(iTune[0], 3);
		TextDrawColor(iTune[0], -1);
		TextDrawSetShadow(iTune[0], 0);
		TextDrawSetOutline(iTune[0], 0);
		TextDrawFont(iTune[0], 4);

		iTune[1] = TextDrawCreate(208.023437, 419.416687, "soc:icon_spalva");
		TextDrawLetterSize(iTune[1], 0.000000, 0.000000);
		TextDrawTextSize(iTune[1], 26.237182, 26.250000);
		TextDrawAlignment(iTune[1], 1);
		TextDrawColor(iTune[1], -1);
		TextDrawSetShadow(iTune[1], 0);
		TextDrawSetOutline(iTune[1], 0);
		TextDrawFont(iTune[1], 4);
		TextDrawSetSelectable(iTune[1], true);

		iTune[2] = TextDrawCreate(238.540267, 419.250000, "soc:icon_ratai");
		TextDrawLetterSize(iTune[2], 0.000000, 0.000000);
		TextDrawTextSize(iTune[2], 26.237182, 26.250000);
		TextDrawAlignment(iTune[2], 1);
		TextDrawColor(iTune[2], -1);
		TextDrawSetShadow(iTune[2], 0);
		TextDrawSetOutline(iTune[2], 0);
		TextDrawFont(iTune[2], 4);
		TextDrawSetSelectable(iTune[2], true);

		iTune[3] = TextDrawCreate(268.588775, 419.666625, "LD_SPAC:white");
		TextDrawLetterSize(iTune[3], 0.000000, 0.000000);
		TextDrawTextSize(iTune[3], 26.237182, 26.250000);
		TextDrawAlignment(iTune[3], 1);
		TextDrawColor(iTune[3], -1);
		TextDrawSetShadow(iTune[3], 0);
		TextDrawSetOutline(iTune[3], 0);
		TextDrawFont(iTune[3], 4);
		TextDrawSetSelectable(iTune[3], true);

		iTune[4] = TextDrawCreate(298.168853, 419.499938, "LD_SPAC:white");
		TextDrawLetterSize(iTune[4], 0.000000, 0.000000);
		TextDrawTextSize(iTune[4], 26.237182, 26.250000);
		TextDrawAlignment(iTune[4], 1);
		TextDrawColor(iTune[4], -1);
		TextDrawSetShadow(iTune[4], 0);
		TextDrawSetOutline(iTune[4], 0);
		TextDrawFont(iTune[4], 4);
		TextDrawSetSelectable(iTune[4], true);

		iTune[5] = TextDrawCreate(327.748901, 419.333251, "LD_SPAC:white");
		TextDrawLetterSize(iTune[5], 0.000000, 0.000000);
		TextDrawTextSize(iTune[5], 26.237182, 26.250000);
		TextDrawAlignment(iTune[5], 1);
		TextDrawColor(iTune[5], -1);
		TextDrawSetShadow(iTune[5], 0);
		TextDrawSetOutline(iTune[5], 0);
		TextDrawFont(iTune[5], 4);
		TextDrawSetSelectable(iTune[5], true);

		iTune[6] = TextDrawCreate(357.328948, 419.166564, "LD_SPAC:white");
		TextDrawLetterSize(iTune[6], 0.000000, 0.000000);
		TextDrawTextSize(iTune[6], 26.237182, 26.250000);
		TextDrawAlignment(iTune[6], 1);
		TextDrawColor(iTune[6], -1);
		TextDrawSetShadow(iTune[6], 0);
		TextDrawSetOutline(iTune[6], 0);
		TextDrawFont(iTune[6], 4);
		TextDrawSetSelectable(iTune[6], true);

		iTune[7] = TextDrawCreate(416.047119, 435.750061, "ATGAL");
		TextDrawLetterSize(iTune[7], 0.194187, 1.069164);
		TextDrawAlignment(iTune[7], 1);
		TextDrawColor(iTune[7], -1);
		TextDrawSetShadow(iTune[7], 0);
		TextDrawSetOutline(iTune[7], 1);
		TextDrawBackgroundColor(iTune[7], 51);
		TextDrawFont(iTune[7], 2);
		TextDrawSetProportional(iTune[7], 1);
		TextDrawSetSelectable(iTune[7], true);

		iTune[8] = TextDrawCreate(465.773681, 436.166717, "pirkti");
		TextDrawLetterSize(iTune[8], 0.194187, 1.069164);
		TextDrawTextSize(iTune[8], 9.370422, 26.249998);
		TextDrawAlignment(iTune[8], 2);
		TextDrawColor(iTune[8], -1);
		TextDrawSetShadow(iTune[8], 0);
		TextDrawSetOutline(iTune[8], 1);
		TextDrawBackgroundColor(iTune[8], 51);
		TextDrawFont(iTune[8], 2);
		TextDrawSetProportional(iTune[8], 1);
		TextDrawSetSelectable(iTune[8], true);

		iTune[9] = TextDrawCreate(417.578613, 435.416748, "Iseiti");
		TextDrawLetterSize(iTune[9], 0.194187, 1.069164);
		TextDrawAlignment(iTune[9], 1);
		TextDrawColor(iTune[9], -1);
		TextDrawSetShadow(iTune[9], 0);
		TextDrawSetOutline(iTune[9], 1);
		TextDrawBackgroundColor(iTune[9], 51);
		TextDrawFont(iTune[9], 2);
		TextDrawSetProportional(iTune[9], 1);
		TextDrawSetSelectable(iTune[9], true);

		iTune[10] = TextDrawCreate(386.908874, 419.583129, "LD_SPAC:white");
		TextDrawLetterSize(iTune[10], 0.000000, 0.000000);
		TextDrawTextSize(iTune[10], 26.237182, 26.250000);
		TextDrawAlignment(iTune[10], 1);
		TextDrawColor(iTune[10], -1);
		TextDrawSetShadow(iTune[10], 0);
		TextDrawSetOutline(iTune[10], 0);
		TextDrawFont(iTune[10], 4);
		TextDrawSetSelectable(iTune[10], true);

		iTune[11] = TextDrawCreate(217.019073, 389.841827, "soc:menu");
		TextDrawLetterSize(iTune[11], 0.000000, 0.000000);
		TextDrawTextSize(iTune[11], 250.658843, 25.083332);
		TextDrawAlignment(iTune[11], 1);
		TextDrawColor(iTune[11], -1);
		TextDrawSetShadow(iTune[11], 0);
		TextDrawSetOutline(iTune[11], 0);
		TextDrawFont(iTune[11], 4);

		iTune[12] = TextDrawCreate(223.484634, 392.583312, "LD_SPAC:white");
		TextDrawLetterSize(iTune[12], 0.000000, 0.000000);
		TextDrawTextSize(iTune[12], 20.614929, 19.833312);
		TextDrawAlignment(iTune[12], 1);
		TextDrawColor(iTune[12], -1);
		TextDrawSetShadow(iTune[12], 0);
		TextDrawSetOutline(iTune[12], 0);
		TextDrawFont(iTune[12], 4);
		TextDrawSetSelectable(iTune[12], true);

		iTune[13] = TextDrawCreate(247.442169, 392.999938, "LD_SPAC:white");
		TextDrawLetterSize(iTune[13], 0.000000, 0.000000);
		TextDrawTextSize(iTune[13], 20.614929, 19.833312);
		TextDrawAlignment(iTune[13], 1);
		TextDrawColor(iTune[13], -1);
		TextDrawSetShadow(iTune[13], 0);
		TextDrawSetOutline(iTune[13], 0);
		TextDrawFont(iTune[13], 4);
		TextDrawSetSelectable(iTune[13], true);

		iTune[14] = TextDrawCreate(271.399749, 393.416656, "LD_SPAC:white");
		TextDrawLetterSize(iTune[14], 0.000000, 0.000000);
		TextDrawTextSize(iTune[14], 20.614929, 19.833312);
		TextDrawAlignment(iTune[14], 1);
		TextDrawColor(iTune[14], -1);
		TextDrawSetShadow(iTune[14], 0);
		TextDrawSetOutline(iTune[14], 0);
		TextDrawFont(iTune[14], 4);
		TextDrawSetSelectable(iTune[14], true);

		iTune[15] = TextDrawCreate(295.357360, 393.249877, "LD_SPAC:white");
		TextDrawLetterSize(iTune[15], 0.000000, 0.000000);
		TextDrawTextSize(iTune[15], 20.614929, 19.833312);
		TextDrawAlignment(iTune[15], 1);
		TextDrawColor(iTune[15], -1);
		TextDrawSetShadow(iTune[15], 0);
		TextDrawSetOutline(iTune[15], 0);
		TextDrawFont(iTune[15], 4);
		TextDrawSetSelectable(iTune[15], true);

		iTune[16] = TextDrawCreate(318.846466, 393.083221, "LD_SPAC:white");
		TextDrawLetterSize(iTune[16], 0.000000, 0.000000);
		TextDrawTextSize(iTune[16], 20.614929, 19.833312);
		TextDrawAlignment(iTune[16], 1);
		TextDrawColor(iTune[16], -1);
		TextDrawSetShadow(iTune[16], 0);
		TextDrawSetOutline(iTune[16], 0);
		TextDrawFont(iTune[16], 4);
		TextDrawSetSelectable(iTune[16], true);

		iTune[17] = TextDrawCreate(342.803985, 392.916564, "LD_SPAC:white");
		TextDrawLetterSize(iTune[17], 0.000000, 0.000000);
		TextDrawTextSize(iTune[17], 20.614929, 19.833312);
		TextDrawAlignment(iTune[17], 1);
		TextDrawColor(iTune[17], -1);
		TextDrawSetShadow(iTune[17], 0);
		TextDrawSetOutline(iTune[17], 0);
		TextDrawFont(iTune[17], 4);
		TextDrawSetSelectable(iTune[17], true);

		iTune[18] = TextDrawCreate(366.761657, 393.333190, "LD_SPAC:white");
		TextDrawLetterSize(iTune[18], 0.000000, 0.000000);
		TextDrawTextSize(iTune[18], 20.614929, 19.833312);
		TextDrawAlignment(iTune[18], 1);
		TextDrawColor(iTune[18], -1);
		TextDrawSetShadow(iTune[18], 0);
		TextDrawSetOutline(iTune[18], 0);
		TextDrawFont(iTune[18], 4);
		TextDrawSetSelectable(iTune[18], true);

		iTune[19] = TextDrawCreate(390.719268, 393.166503, "LD_SPAC:white");
		TextDrawLetterSize(iTune[19], 0.000000, 0.000000);
		TextDrawTextSize(iTune[19], 20.614929, 19.833312);
		TextDrawAlignment(iTune[19], 1);
		TextDrawColor(iTune[19], -1);
		TextDrawSetShadow(iTune[19], 0);
		TextDrawSetOutline(iTune[19], 0);
		TextDrawFont(iTune[19], 4);
		TextDrawSetSelectable(iTune[19], true);

		iTune[20] = TextDrawCreate(414.817260, 392.999908, "LD_SPAC:white");
		TextDrawLetterSize(iTune[20], 0.000000, 0.000000);
		TextDrawTextSize(iTune[20], 20.614929, 19.833312);
		TextDrawAlignment(iTune[20], 1);
		TextDrawColor(iTune[20], -1);
		TextDrawSetShadow(iTune[20], 0);
		TextDrawSetOutline(iTune[20], 0);
		TextDrawFont(iTune[20], 4);
		TextDrawSetSelectable(iTune[20], true);

		iTune[21] = TextDrawCreate(438.446899, 393.124816, "LD_SPAC:white");
		TextDrawLetterSize(iTune[21], 0.000000, 0.000000);
		TextDrawTextSize(iTune[21], 20.614929, 19.833312);
		TextDrawAlignment(iTune[21], 1);
		TextDrawColor(iTune[21], -1);
		TextDrawSetShadow(iTune[21], 0);
		TextDrawSetOutline(iTune[21], 0);
		TextDrawFont(iTune[21], 4);
		TextDrawSetSelectable(iTune[21], true);
	    
	    // SHOP
	    Shop0 = TextDrawCreate(393.500, 85.125, "box");
		TextDrawLetterSize(Shop0, 0.000, 32.037);
		TextDrawTextSize(Shop0, 242.500, 0.000);
		TextDrawAlignment(Shop0, 1);
		TextDrawColor(Shop0, 0);
		TextDrawUseBox(Shop0, 1);
		TextDrawBoxColor(Shop0, 102);
		TextDrawFont(Shop0, 0);

		Shop1 = TextDrawCreate(389.500, 112.005, "box");
		TextDrawLetterSize(Shop1, 0.000, 25.649);
		TextDrawTextSize(Shop1, 246.500, 0.000);
		TextDrawAlignment(Shop1, 1);
		TextDrawColor(Shop1, 0);
		TextDrawUseBox(Shop1, 1);
		TextDrawBoxColor(Shop1, 102);
		TextDrawFont(Shop1, 0);

		Shop2 = TextDrawCreate(318.000, 89.599, "Parduotuve 24/7");
		TextDrawLetterSize(Shop2, 0.264, 1.286);
		TextDrawAlignment(Shop2, 2);
		TextDrawColor(Shop2, -1);
		TextDrawSetOutline(Shop2, 1);
		TextDrawBackgroundColor(Shop2, 51);
		TextDrawFont(Shop2, 2);
		TextDrawSetProportional(Shop2, 1);

		Shop3 = TextDrawCreate(361.500, 109.765, "svoris");
		TextDrawLetterSize(Shop3, 0.155, 1.009);
		TextDrawAlignment(Shop3, 1);
		TextDrawColor(Shop3, -1);
		TextDrawSetOutline(Shop3, 1);
		TextDrawBackgroundColor(Shop3, 51);
		TextDrawFont(Shop3, 2);
		TextDrawSetProportional(Shop3, 1);

		Shop4 = TextDrawCreate(312.000, 109.518, "kiekis");
		TextDrawLetterSize(Shop4, 0.155, 1.009);
		TextDrawAlignment(Shop4, 1);
		TextDrawColor(Shop4, -1);
		TextDrawSetOutline(Shop4, 1);
		TextDrawBackgroundColor(Shop4, 51);
		TextDrawFont(Shop4, 2);
		TextDrawSetProportional(Shop4, 1);

		Shop5 = TextDrawCreate(338.000, 110.013, "kaina");
		TextDrawLetterSize(Shop5, 0.155, 1.009);
		TextDrawAlignment(Shop5, 1);
		TextDrawColor(Shop5, -1);
		TextDrawSetOutline(Shop5, 1);
		TextDrawBackgroundColor(Shop5, 51);
		TextDrawFont(Shop5, 2);
		TextDrawSetProportional(Shop5, 1);

		Shop6 = TextDrawCreate(253.500, 109.273, "pavadinimas");
		TextDrawLetterSize(Shop6, 0.155, 1.009);
		TextDrawAlignment(Shop6, 1);
		TextDrawColor(Shop6, -1);
		TextDrawSetOutline(Shop6, 1);
		TextDrawBackgroundColor(Shop6, 51);
		TextDrawFont(Shop6, 2);
		TextDrawSetProportional(Shop6, 1);
		
		Shop7 = TextDrawCreate(242.500, 113.259, "-");
		TextDrawLetterSize(Shop8, 12.057, 1.271);
		TextDrawAlignment(Shop8, 1);
		TextDrawColor(Shop8, -1);
		TextDrawSetOutline(Shop8, 1);
		TextDrawBackgroundColor(Shop8, 51);
		TextDrawFont(Shop8, 2);
		TextDrawSetProportional(Shop8, 1);

		Shop8 = TextDrawCreate(254.500, 123.958, "test");
		TextDrawLetterSize(Shop7, 0.155, 1.009);
		TextDrawTextSize(Shop7, 382.500, 179.199);
		TextDrawAlignment(Shop7, 1);
		TextDrawColor(Shop7, -1);
		TextDrawUseBox(Shop7, 1);
		TextDrawBoxColor(Shop7, 102);
		TextDrawSetOutline(Shop7, 1);
		TextDrawBackgroundColor(Shop7, 51);
		TextDrawFont(Shop7, 2);
		TextDrawSetProportional(Shop7, 1);
		TextDrawSetSelectable(Shop7, true);

		Shop9 = TextDrawCreate(312.000, 123.958, "0k");
		TextDrawLetterSize(Shop9, 0.155, 1.009);
		TextDrawAlignment(Shop9, 1);
		TextDrawColor(Shop9, -1);
		TextDrawSetOutline(Shop9, 1);
		TextDrawBackgroundColor(Shop9, 51);
		TextDrawFont(Shop9, 2);
		TextDrawSetProportional(Shop9, 1);

		Shop10 = TextDrawCreate(339.000, 123.958, "0kn");
		TextDrawLetterSize(Shop10, 0.155, 1.009);
		TextDrawAlignment(Shop10, 1);
		TextDrawColor(Shop10, -1);
		TextDrawSetOutline(Shop10, 1);
		TextDrawBackgroundColor(Shop10, 51);
		TextDrawFont(Shop10, 2);
		TextDrawSetProportional(Shop10, 1);

		Shop11 = TextDrawCreate(363.500, 123.958, "0s");
		TextDrawLetterSize(Shop11, 0.155, 1.009);
		TextDrawAlignment(Shop11, 1);
		TextDrawColor(Shop11, -1);
		TextDrawSetOutline(Shop11, 1);
		TextDrawBackgroundColor(Shop11, 51);
		TextDrawFont(Shop11, 2);
		TextDrawSetProportional(Shop11, 1);

		Shop12 = TextDrawCreate(317.500, 354.665, "UZDARYTI");
		TextDrawLetterSize(Shop12, 0.266, 1.473);
		TextDrawTextSize(Shop12, -15.500, 70.185);
		TextDrawAlignment(Shop12, 2);
		TextDrawColor(Shop12, -1);
		TextDrawUseBox(Shop12, 1);
		TextDrawBoxColor(Shop12, 102);
		TextDrawSetOutline(Shop12, 1);
		TextDrawBackgroundColor(Shop12, 51);
		TextDrawFont(Shop12, 2);
		TextDrawSetProportional(Shop12, 1);
		TextDrawSetSelectable(Shop12, true);

		Shop13 = TextDrawCreate(254.500, 139.393, "test2");
		TextDrawLetterSize(Shop13, 0.155, 1.009);
		TextDrawTextSize(Shop13, 382.500, 132.906);
		TextDrawAlignment(Shop13, 1);
		TextDrawColor(Shop13, -1);
		TextDrawUseBox(Shop13, 1);
		TextDrawBoxColor(Shop13, 102);
		TextDrawSetOutline(Shop13, 1);
		TextDrawBackgroundColor(Shop13, 51);
		TextDrawFont(Shop13, 2);
		TextDrawSetProportional(Shop13, 1);
		TextDrawSetSelectable(Shop13, true);

		Shop14 = TextDrawCreate(243.000, 338.506, "-");
		TextDrawLetterSize(Shop14, 12.057, 1.271);
		TextDrawAlignment(Shop14, 1);
		TextDrawColor(Shop14, -1);
		TextDrawSetOutline(Shop14, 1);
		TextDrawBackgroundColor(Shop14, 51);
		TextDrawFont(Shop14, 2);
		TextDrawSetProportional(Shop14, 1);
	    
	    // Init
	    Init0 = TextDrawCreate(642.000, 0, "box");
		TextDrawLetterSize(Init0, 0.000, 7.730);
		TextDrawTextSize(Init0, -2.000, 0.000);
		TextDrawAlignment(Init0, 1);
		TextDrawColor(Init0, 0);
		TextDrawUseBox(Init0, 1);
		TextDrawBoxColor(Init0, 102);
		TextDrawFont(Init0, 0);

		Init1 = TextDrawCreate(642.000, 375.331, "box");
		TextDrawLetterSize(Init1, 0.000, 7.730);
		TextDrawTextSize(Init1, -2.000, 0.000);
		TextDrawAlignment(Init1, 1);
		TextDrawColor(Init1, 0);
		TextDrawUseBox(Init1, 1);
		TextDrawBoxColor(Init1, 102);
		TextDrawFont(Init1, 0);

		Init2 = TextDrawCreate(321.000, 161.279, "Prisijungimas~n~Sveikas atvykes i ~b~Story of Cities~w~ !");
		TextDrawLetterSize(Init2, 0.372, 2.077);
		TextDrawTextSize(Init2, 496.500, 335.252);
		TextDrawAlignment(Init2, 2);
		TextDrawColor(Init2, -1);
		TextDrawSetOutline(Init2, 1);
		TextDrawBackgroundColor(Init2, 51);
		TextDrawFont(Init2, 2);
		TextDrawSetProportional(Init2, 1);

		Init3 = TextDrawCreate(320.500, 214.792, "Zaidimui siame serveryje, reikalingas patch'as, kuri parsisiusti gali ~y~www.storyofcities.lt~w~~n~Be sio patch'o prisijungti nepavyks.");
		TextDrawLetterSize(Init3, 0.220, 1.248);
		TextDrawTextSize(Init3, 496.500, 335.252);
		TextDrawAlignment(Init3, 2);
		TextDrawColor(Init3, -1);
		TextDrawSetOutline(Init3, 1);
		TextDrawBackgroundColor(Init3, 51);
		TextDrawFont(Init3, 2);
		TextDrawSetProportional(Init3, 1);

		Init4 = TextDrawCreate(38.000, 194.133, "-");
		TextDrawLetterSize(Init4, 46.823, 2.817);
		TextDrawAlignment(Init4, 1);
		TextDrawColor(Init4, -1);
		TextDrawSetOutline(Init4, 1);
		TextDrawBackgroundColor(Init4, 51);
		TextDrawFont(Init4, 2);
		TextDrawSetProportional(Init4, 1);
	    
	    // Wanted level
	    twanted[0] = TextDrawCreate(602.000, 100, "]");
		TextDrawLetterSize(twanted[0], 0.449, 1.600);
		TextDrawTextSize(twanted[0], 221.000, 0.000);
		TextDrawAlignment(twanted[0], 2);
		TextDrawColor(twanted[0], -4259585);
		TextDrawSetOutline(twanted[0], 1);
		TextDrawBackgroundColor(twanted[0], 255);
		TextDrawFont(twanted[0], 0);
		TextDrawSetProportional(twanted[0], 1);

		twanted[1] = TextDrawCreate(592.000, 100, "]");
		TextDrawLetterSize(twanted[1], 0.449, 1.600);
		TextDrawTextSize(twanted[1], 221.000, 0.000);
		TextDrawAlignment(twanted[1], 2);
		TextDrawColor(twanted[1], -4259585);
		TextDrawSetOutline(twanted[1], 1);
		TextDrawBackgroundColor(twanted[1], 255);
		TextDrawFont(twanted[1], 0);
		TextDrawSetProportional(twanted[1], 1);

		twanted[2] = TextDrawCreate(582.000, 100, "]");
		TextDrawLetterSize(twanted[2], 0.449, 1.600);
		TextDrawTextSize(twanted[2], 221.000, 0.000);
		TextDrawAlignment(twanted[2], 2);
		TextDrawColor(twanted[2], -4259585);
		TextDrawSetOutline(twanted[2], 1);
		TextDrawBackgroundColor(twanted[2], 255);
		TextDrawFont(twanted[2], 0);
		TextDrawSetProportional(twanted[2], 1);

		twanted[3] = TextDrawCreate(572.000, 100, "]");
		TextDrawLetterSize(twanted[3], 0.449, 1.600);
		TextDrawTextSize(twanted[3], 221.000, 0.000);
		TextDrawAlignment(twanted[3], 2);
		TextDrawColor(twanted[3], -4259585);
		TextDrawSetOutline(twanted[3], 1);
		TextDrawBackgroundColor(twanted[3], 255);
		TextDrawFont(twanted[3], 0);
		TextDrawSetProportional(twanted[3], 1);

		twanted[4] = TextDrawCreate(562.000, 100, "]");
		TextDrawLetterSize(twanted[4], 0.449, 1.600);
		TextDrawTextSize(twanted[4], 221.000, 0.000);
		TextDrawAlignment(twanted[4], 2);
		TextDrawColor(twanted[4], -4259585);
		TextDrawSetOutline(twanted[4], 1);
		TextDrawBackgroundColor(twanted[4], 255);
		TextDrawFont(twanted[4], 0);
		TextDrawSetProportional(twanted[4], 1);

		twanted[5] = TextDrawCreate(552.000, 100, "]");
		TextDrawLetterSize(twanted[5], 0.449, 1.600);
		TextDrawTextSize(twanted[5], 221.000, 0.000);
		TextDrawAlignment(twanted[5], 2);
		TextDrawColor(twanted[5], -4259585);
		TextDrawSetOutline(twanted[5], 1);
		TextDrawBackgroundColor(twanted[5], 255);
		TextDrawFont(twanted[5], 0);
		TextDrawSetProportional(twanted[5], 1);

		twanted[6] = TextDrawCreate(542.000, 100, "]");
		TextDrawLetterSize(twanted[6], 0.449, 1.600);
		TextDrawTextSize(twanted[6], 221.000, 0.000);
		TextDrawAlignment(twanted[6], 2);
		TextDrawColor(twanted[6], -4259585);
		TextDrawSetOutline(twanted[6], 1);
		TextDrawBackgroundColor(twanted[6], 255);
		TextDrawFont(twanted[6], 0);
		TextDrawSetProportional(twanted[6], 1);

		twanted[7] = TextDrawCreate(532.000, 100, "]");
		TextDrawLetterSize(twanted[7], 0.449, 1.600);
		TextDrawTextSize(twanted[7], 221.000, 0.000);
		TextDrawAlignment(twanted[7], 2);
		TextDrawColor(twanted[7], -4259585);
		TextDrawSetOutline(twanted[7], 1);
		TextDrawBackgroundColor(twanted[7], 255);
		TextDrawFont(twanted[7], 0);
		TextDrawSetProportional(twanted[7], 1);

		twanted[8] = TextDrawCreate(522.000, 100, "]");
		TextDrawLetterSize(twanted[8], 0.449, 1.600);
		TextDrawTextSize(twanted[8], 221.000, 0.000);
		TextDrawAlignment(twanted[8], 2);
		TextDrawColor(twanted[8], -4259585);
		TextDrawSetOutline(twanted[8], 1);
		TextDrawBackgroundColor(twanted[8], 255);
		TextDrawFont(twanted[8], 0);
		TextDrawSetProportional(twanted[8], 1);

		twanted[9] = TextDrawCreate(512.000, 100, "]");
		TextDrawLetterSize(twanted[9], 0.449, 1.600);
		TextDrawTextSize(twanted[9], 221.000, 0.000);
		TextDrawAlignment(twanted[9], 2);
		TextDrawColor(twanted[9], -4259585);
		TextDrawSetOutline(twanted[9], 1);
		TextDrawBackgroundColor(twanted[9], 255);
		TextDrawFont(twanted[9], 0);
		TextDrawSetProportional(twanted[9], 1);

		g_questList[0] = TextDrawCreate(18.352951, 107.916618, "soc:menu");
		TextDrawLetterSize(g_questList[0], 0.000000, 0.000000);
		TextDrawTextSize(g_questList[0], 241.411651, 230.999893);
		TextDrawAlignment(g_questList[0], 1);
		TextDrawColor(g_questList[0], -1);
		TextDrawSetShadow(g_questList[0], 0);
		TextDrawSetOutline(g_questList[0], 0);
		TextDrawFont(g_questList[0], 4);

		g_questList[1] = TextDrawCreate(30.117645, 117.833358, "Uzduotys");
		TextDrawLetterSize(g_questList[1], 0.311176, 1.728332);
		TextDrawAlignment(g_questList[1], 1);
		TextDrawColor(g_questList[1], -1);
		TextDrawSetShadow(g_questList[1], 0);
		TextDrawSetOutline(g_questList[1], 1);
		TextDrawBackgroundColor(g_questList[1], 51);
		TextDrawFont(g_questList[1], 2);
		TextDrawSetProportional(g_questList[1], 1);

		g_questList[2] = TextDrawCreate(216.470458, 117.833404, "~w~~r~uzdaryti");
		TextDrawLetterSize(g_questList[2], 0.303176, 1.792499);
		TextDrawTextSize(g_questList[2], 20.705884, 71.166709);
		TextDrawAlignment(g_questList[2], 2);
		TextDrawColor(g_questList[2], -1);
		TextDrawUseBox(g_questList[2], true);
		TextDrawBoxColor(g_questList[2], 0);
		TextDrawSetShadow(g_questList[2], 0);
		TextDrawSetOutline(g_questList[2], 1);
		TextDrawBackgroundColor(g_questList[2], 51);
		TextDrawFont(g_questList[2], 2);
		TextDrawSetProportional(g_questList[2], 1);
		TextDrawSetSelectable(g_questList[2], true);

		g_questList[3] = TextDrawCreate(74.000053, 311.750091, "atgal");
		TextDrawLetterSize(g_questList[3], 0.244823, 1.547499);
		TextDrawTextSize(g_questList[3], 20.000000, 74.000000);
		TextDrawAlignment(g_questList[3], 2);
		TextDrawColor(g_questList[3], -1);
		TextDrawUseBox(g_questList[3], true);
		TextDrawBoxColor(g_questList[3], 0);
		TextDrawSetShadow(g_questList[3], 0);
		TextDrawSetOutline(g_questList[3], 1);
		TextDrawBackgroundColor(g_questList[3], 51);
		TextDrawFont(g_questList[3], 2);
		TextDrawSetProportional(g_questList[3], 1);
		TextDrawSetSelectable(g_questList[3], true);

		g_questList[4] = TextDrawCreate(195.885284, 311.916748, "kita");
		TextDrawLetterSize(g_questList[4], 0.244823, 1.547499);
		TextDrawTextSize(g_questList[4], 20.000000, 74.000000);
		TextDrawAlignment(g_questList[4], 2);
		TextDrawColor(g_questList[4], -1);
		TextDrawUseBox(g_questList[4], true);
		TextDrawBoxColor(g_questList[4], 0);
		TextDrawSetShadow(g_questList[4], 0);
		TextDrawSetOutline(g_questList[4], 1);
		TextDrawBackgroundColor(g_questList[4], 51);
		TextDrawFont(g_questList[4], 2);
		TextDrawSetProportional(g_questList[4], 1);
		TextDrawSetSelectable(g_questList[4], true);

		g_task = TextDrawCreate(214.588165, 362.833435, "soc:menu"); 
		TextDrawLetterSize(g_task, 0.000000, 0.000000);
		TextDrawTextSize(g_task, 200.941162, 83.416656);
		TextDrawAlignment(g_task, 1);
		TextDrawColor(g_task, -1);
		TextDrawSetShadow(g_task, 0);
		TextDrawSetOutline(g_task, 0);
		TextDrawFont(g_task, 4);

		g_tip_show = TextDrawCreate(462.588195, 147.583404, "soc:menu"); 
		TextDrawLetterSize(g_tip_show, 0.000000, 0.000000);
		TextDrawTextSize(g_tip_show, 203.576232, 20.358039);
		TextDrawAlignment(g_tip_show, 1);
		TextDrawColor(g_tip_show, -1);
		TextDrawSetShadow(g_tip_show, 0);
		TextDrawSetOutline(g_tip_show, 0);
		TextDrawFont(g_tip_show, 4);

		g_garage[0] = TextDrawCreate(646.235229, 200.000000, "usebox"); // main bg
		TextDrawLetterSize(g_garage[0], 0.000000, 29.261322);
		TextDrawTextSize(g_garage[0], -2.000000, 0.000000);
		TextDrawAlignment(g_garage[0], 1);
		TextDrawColor(g_garage[0], 0);
		TextDrawUseBox(g_garage[0], true);
		TextDrawBoxColor(g_garage[0], 102);
		TextDrawSetShadow(g_garage[0], 0);
		TextDrawSetOutline(g_garage[0], 0);
		TextDrawFont(g_garage[0], 0);

		g_garage[1] = TextDrawCreate(641.058837, 399.916839, "usebox"); // apatinis bg
		TextDrawLetterSize(g_garage[1], 0.000000, 6.164817);
		TextDrawTextSize(g_garage[1], -2.470587, 0.000000);
		TextDrawAlignment(g_garage[1], 1);
		TextDrawColor(g_garage[1], 0);
		TextDrawUseBox(g_garage[1], true);
		TextDrawBoxColor(g_garage[1], 111);
		TextDrawSetShadow(g_garage[1], 0);
		TextDrawSetOutline(g_garage[1], 0);
		TextDrawFont(g_garage[1], 0);

		g_garage[2] = TextDrawCreate(53.647033, 401.916778, "~y~enter~n~~w~rinktis"); // savaime aišku
		TextDrawLetterSize(g_garage[2], 0.254705, 1.524165);
		TextDrawAlignment(g_garage[2], 2);
		TextDrawColor(g_garage[2], -1);
		TextDrawSetShadow(g_garage[2], 0);
		TextDrawSetOutline(g_garage[2], 1);
		TextDrawBackgroundColor(g_garage[2], 51);
		TextDrawFont(g_garage[2], 2);
		TextDrawSetProportional(g_garage[2], 1);

		g_garage[3] = TextDrawCreate(124.764717, 401.750061, "~y~shift~n~~w~iseiti");
		TextDrawLetterSize(g_garage[3], 0.254705, 1.524165);
		TextDrawAlignment(g_garage[3], 2);
		TextDrawColor(g_garage[3], -1);
		TextDrawSetShadow(g_garage[3], 0);
		TextDrawSetOutline(g_garage[3], 1);
		TextDrawBackgroundColor(g_garage[3], 51);
		TextDrawFont(g_garage[3], 2);
		TextDrawSetProportional(g_garage[3], 1);


		#define start 35.764701
		#define diff 143.117592

		new j = 4;
		for(new i; i != 4; ++i)
		{
			g_garage[j] = TextDrawCreate(34.764701+diff*i, 248-41, "soc:gbg");
			TextDrawLetterSize(g_garage[j], 0.000000, 0.000000);
			TextDrawTextSize(g_garage[j], 128, 128); // 126, 46
			TextDrawAlignment(g_garage[j], 1);
			TextDrawColor(g_garage[j], 0xFFFFFFFF); // -1061109505
			TextDrawSetShadow(g_garage[j], 0);
			TextDrawSetOutline(g_garage[j], 0);
			TextDrawFont(g_garage[j], 4);

			++j;

			g_garage[j] = TextDrawCreate(35+diff*i, 306, "Bukle"); // 5
			TextDrawLetterSize(g_garage[j], 0.201998, 1.319998);
			TextDrawAlignment(g_garage[j], 1);
			TextDrawColor(g_garage[j], -1);
			TextDrawSetShadow(g_garage[j], 0);
			TextDrawSetOutline(g_garage[j], 1);
			TextDrawBackgroundColor(g_garage[j], 51);
			TextDrawFont(g_garage[j], 2);
			TextDrawSetProportional(g_garage[j], 1);

			++j;

			g_garage[j] = TextDrawCreate(35+diff*i, 320, "Greitis"); // 6
			TextDrawLetterSize(g_garage[j], 0.201998, 1.319998);
			TextDrawAlignment(g_garage[j], 1);
			TextDrawColor(g_garage[j], -1);
			TextDrawSetShadow(g_garage[j], 0);
			TextDrawSetOutline(g_garage[j], 1);
			TextDrawBackgroundColor(g_garage[j], 51);
			TextDrawFont(g_garage[j], 2);
			TextDrawSetProportional(g_garage[j], 1);

			++j;

			g_garage[j] = TextDrawCreate(35+diff*i, 320+14, "Degalai"); // 7
			TextDrawLetterSize(g_garage[j], 0.201998, 1.319998);
			TextDrawAlignment(g_garage[j], 1);
			TextDrawColor(g_garage[j], -1);
			TextDrawSetShadow(g_garage[j], 0);
			TextDrawSetOutline(g_garage[j], 1);
			TextDrawBackgroundColor(g_garage[j], 51);
			TextDrawFont(g_garage[j], 2);
			TextDrawSetProportional(g_garage[j], 1);

			++j;

			g_garage[j] = TextDrawCreate(35+diff*i, 320+14*2, "Bagazine"); // 8
			TextDrawLetterSize(g_garage[j], 0.201998, 1.319998);
			TextDrawAlignment(g_garage[j], 1);
			TextDrawColor(g_garage[j], -1);
			TextDrawSetShadow(g_garage[j], 0);
			TextDrawSetOutline(g_garage[j], 1);
			TextDrawBackgroundColor(g_garage[j], 51);
			TextDrawFont(g_garage[j], 2);
			TextDrawSetProportional(g_garage[j], 1);

			++j;

			g_garage[j] = TextDrawCreate(82+diff*i, 311, "LD_SPAC:white"); // 9
			TextDrawLetterSize(g_garage[j], 0.000000, 0.000000);
			TextDrawTextSize(g_garage[j], 80.000000, 4.000000);
			TextDrawAlignment(g_garage[j], 1);
			TextDrawColor(g_garage[j], 1145324799);
			TextDrawSetShadow(g_garage[j], 0);
			TextDrawSetOutline(g_garage[j], 0);
			TextDrawFont(g_garage[j], 4);

			++j;

			g_garage[j] = TextDrawCreate(82+diff*i, 311+14, "LD_SPAC:white"); // 10
			TextDrawLetterSize(g_garage[j], 0.000000, 0.000000);
			TextDrawTextSize(g_garage[j], 80.000000, 4.000000);
			TextDrawAlignment(g_garage[j], 1);
			TextDrawColor(g_garage[j], 1145324799);
			TextDrawSetShadow(g_garage[j], 0);
			TextDrawSetOutline(g_garage[j], 0);
			TextDrawFont(g_garage[j], 4);

			++j;

			g_garage[j] = TextDrawCreate(82+diff*i, 311+14*2, "LD_SPAC:white"); // 11
			TextDrawLetterSize(g_garage[j], 0.000000, 0.000000);
			TextDrawTextSize(g_garage[j], 80.000000, 4.000000);
			TextDrawAlignment(g_garage[j], 1);
			TextDrawColor(g_garage[j], 1145324799);
			TextDrawSetShadow(g_garage[j], 0);
			TextDrawSetOutline(g_garage[j], 0);
			TextDrawFont(g_garage[j], 4);

			++j;

			g_garage[j] = TextDrawCreate(82+diff*i, 311+14*3, "LD_SPAC:white"); // 12
			TextDrawLetterSize(g_garage[j], 0.000000, 0.000000);
			TextDrawTextSize(g_garage[j], 80.000000, 4.000000);
			TextDrawAlignment(g_garage[j], 1);
			TextDrawColor(g_garage[j], 1145324799);
			TextDrawSetShadow(g_garage[j], 0);
			TextDrawSetOutline(g_garage[j], 0);
			TextDrawFont(g_garage[j], 4);

			++j;

			g_garage[j] = TextDrawCreate(37+diff*i, 371.000000, "LD_SPAC:white"); // 13
			TextDrawLetterSize(g_garage[j], 0.000000, 0.000000);
			TextDrawTextSize(g_garage[j], 129.000000, 1.000000);
			TextDrawAlignment(g_garage[j], 1);
			TextDrawColor(g_garage[j], -1);
			TextDrawSetShadow(g_garage[j], 0);
			TextDrawSetOutline(g_garage[j], 0);
			TextDrawFont(g_garage[j], 4);

			++j;
		}

		#undef start
		#undef diff

		g_tip[0] = TextDrawCreate(473.882232, 117.250000, "soc:menu");
		TextDrawLetterSize(g_tip[0], 0.000000, 0.000000);
		TextDrawTextSize(g_tip[0], 158.587997, 116.666839);
		TextDrawAlignment(g_tip[0], 1);
		TextDrawColor(g_tip[0], -1);
		TextDrawSetShadow(g_tip[0], 0);
		TextDrawSetOutline(g_tip[0], 0);
		TextDrawFont(g_tip[0], 4);

		g_tip[1] = TextDrawCreate(552.470275, 215.249938, "Supratau");
		TextDrawLetterSize(g_tip[1], 0.246704, 1.454166);
		TextDrawTextSize(g_tip[1], 20.705884, 75.833328);
		TextDrawAlignment(g_tip[1], 2);
		TextDrawColor(g_tip[1], -1);
		TextDrawUseBox(g_tip[1], true);
		TextDrawBoxColor(g_tip[1], 0);
		TextDrawSetShadow(g_tip[1], 0);
		TextDrawSetOutline(g_tip[1], 1);
		TextDrawBackgroundColor(g_tip[1], 51);
		TextDrawFont(g_tip[1], 2);
		TextDrawSetProportional(g_tip[1], 1);
		TextDrawSetSelectable(g_tip[1], true);

		printf("TEXTDRAWS: %i", _:g_tip[1]+1);
		
		print( " ---:: TextDraw'ai" );
}

//--------------------------------------------------

stock hide_carshop(pid)
	{
 		PlayerTextDrawHide(pid, td_carshop_carinfo1);
		PlayerTextDrawHide(pid, td_carshop_carinfo2);
		PlayerTextDrawHide(pid, td_carshop_carinfo3);
		PlayerTextDrawHide(pid, td_carshop_carinfo4);
		PlayerTextDrawHide(pid, td_carshop_carinfo5);
		PlayerTextDrawHide(pid, td_carshop_carinfo6);
		PlayerTextDrawHide(pid, td_carshop_carinfo7);
		PlayerTextDrawHide(pid, td_carshop_carinfo8);
		PlayerTextDrawHide(pid, td_carshop_carinfo9);
		PlayerTextDrawHide(pid, td_carshop_carinfo10);
		PlayerTextDrawHide(pid, td_carshop_carinfo11);
		PlayerTextDrawHide(pid, td_carshop_carinfo12);
		PlayerTextDrawHide(pid, td_carshop_carinfo13);
		PlayerTextDrawHide(pid, td_carshop_carinfo14);
		PlayerTextDrawHide(pid, td_carshop_carinfo15);
		PlayerTextDrawHide(pid, td_carshop_carinfo16);
		PlayerTextDrawHide(pid, td_carshop_carinfo17);
		PlayerTextDrawHide(pid, td_carshop_carinfo18);
		PlayerTextDrawHide(pid, td_carshop_carinfo19);
	}

//--------------------------------------------------

stock pTextDrawai(pid)
{
	    // Kuprinė
		
		firstptd[pid] = CreatePlayerTextDraw( pid, 0, 0, " ");
		PlayerTextDrawFont( pid,firstptd[pid], 4);

		infoList[pid] = CreatePlayerTextDraw(playerid, 476.017150, 201.250122, "-");
		PlayerTextDrawLetterSize(playerid, infoList[pid], 0.241507, 1.395833);
		PlayerTextDrawTextSize(playerid, infoList[pid], 636.720336, 95.083305);
		PlayerTextDrawAlignment(playerid, infoList[pid], 1);
		PlayerTextDrawColor(playerid, infoList[pid], -1);
		PlayerTextDrawUseBox(playerid, infoList[pid], true);
		PlayerTextDrawBoxColor(playerid, infoList[pid], 0);
		PlayerTextDrawSetShadow(playerid, infoList[pid], 0);
		PlayerTextDrawSetOutline(playerid, infoList[pid], 1);
		PlayerTextDrawBackgroundColor(playerid, infoList[pid], 255);
		PlayerTextDrawFont(playerid, infoList[pid], 2);
		PlayerTextDrawSetProportional(playerid, infoList[pid], 1);
		PlayerTextDrawSetSelectable(playerid, infoList[pid], true);

		p_pRepairBar[0][playerid] = CreatePlayerTextDraw(playerid, 194.000000, 406.000000, "LD_SPAC:white");
		PlayerTextDrawLetterSize(playerid, p_pRepairBar[0][playerid], 0.000000, 0.000000);
		PlayerTextDrawTextSize(playerid, p_pRepairBar[0][playerid], 246.000000, 25.000000);
		PlayerTextDrawAlignment(playerid, p_pRepairBar[0][playerid], 1);
		PlayerTextDrawColor(playerid, p_pRepairBar[0][playerid], -4980481);
		PlayerTextDrawSetShadow(playerid, p_pRepairBar[0][playerid], 0);
		PlayerTextDrawSetOutline(playerid, p_pRepairBar[0][playerid], 0);
		PlayerTextDrawBackgroundColor(playerid, p_pRepairBar[0][playerid], 128);
		PlayerTextDrawFont(playerid, p_pRepairBar[0][playerid], 4);
		PlayerTextDrawSetProportional(playerid, p_pRepairBar[0][playerid], 1);

		p_pRepairBar[1][playerid] = CreatePlayerTextDraw(playerid, 194.000000, 406.000000, "LD_SPAC:white");
		PlayerTextDrawLetterSize(playerid, p_pRepairBar[1][playerid], 0.000000, 0.000000);
		PlayerTextDrawTextSize(playerid, p_pRepairBar[1][playerid], 246.000000, 16.000000);
		PlayerTextDrawAlignment(playerid, p_pRepairBar[1][playerid], 1);
		PlayerTextDrawColor(playerid, p_pRepairBar[1][playerid], -188);
		PlayerTextDrawSetShadow(playerid, p_pRepairBar[1][playerid], 0);
		PlayerTextDrawSetOutline(playerid, p_pRepairBar[1][playerid], 0);
		PlayerTextDrawBackgroundColor(playerid, p_pRepairBar[1][playerid], 128);
		PlayerTextDrawFont(playerid, p_pRepairBar[1][playerid], 4);
		PlayerTextDrawSetProportional(playerid, p_pRepairBar[1][playerid], 1);

		for(new i, Float:diff = 149.0; i != 6; ++i, diff += 16.0)
		{
			p_craft[i][playerid] = CreatePlayerTextDraw(playerid, 36.000000, diff, "material");
			PlayerTextDrawLetterSize(playerid,      p_craft[i][playerid], 0.163000, 1.168332);
			PlayerTextDrawTextSize(playerid,        p_craft[i][playerid], 152.000000, 30.333341);
			PlayerTextDrawAlignment(playerid,       p_craft[i][playerid], 1);
			PlayerTextDrawColor(playerid,           p_craft[i][playerid], -1);
			PlayerTextDrawUseBox(playerid,          p_craft[i][playerid], true);
			PlayerTextDrawBoxColor(playerid,        p_craft[i][playerid], 255);
			PlayerTextDrawSetShadow(playerid,       p_craft[i][playerid], 0);
			PlayerTextDrawSetOutline(playerid,      p_craft[i][playerid], 1);
			PlayerTextDrawBackgroundColor(playerid, p_craft[i][playerid], 51);
			PlayerTextDrawFont(playerid,            p_craft[i][playerid], 2);
			PlayerTextDrawSetProportional(playerid, p_craft[i][playerid], 1);
			PlayerTextDrawSetSelectable(playerid,   p_craft[i][playerid], true);

			p_craft[i+6][playerid] = CreatePlayerTextDraw(playerid, 151.000000, diff, "1");
			PlayerTextDrawLetterSize(playerid,      p_craft[i+6][playerid], 0.163000, 1.168332);
			PlayerTextDrawTextSize(playerid,        p_craft[i+6][playerid], 152.000000, 30.333341);
			PlayerTextDrawAlignment(playerid,       p_craft[i+6][playerid], 3);
			PlayerTextDrawColor(playerid,           p_craft[i+6][playerid], -1);
			PlayerTextDrawSetShadow(playerid,       p_craft[i+6][playerid], 0);
			PlayerTextDrawSetOutline(playerid,      p_craft[i+6][playerid], 1);
			PlayerTextDrawBackgroundColor(playerid, p_craft[i+6][playerid], 51);
			PlayerTextDrawFont(playerid,            p_craft[i+6][playerid], 2);
			PlayerTextDrawSetProportional(playerid, p_craft[i+6][playerid], 1);
		}
		p_craft[12][playerid] = CreatePlayerTextDraw(playerid, 32.500000, 306.833435, "Sekmes tikimybe: ~y~87~w~%");
		PlayerTextDrawLetterSize(playerid, p_craft[12][playerid], 0.216999, 1.407500);
		PlayerTextDrawAlignment(playerid, p_craft[12][playerid], 1);
		PlayerTextDrawColor(playerid, p_craft[12][playerid], -1);
		PlayerTextDrawSetShadow(playerid, p_craft[12][playerid], 0);
		PlayerTextDrawSetOutline(playerid, p_craft[12][playerid], 1);
		PlayerTextDrawBackgroundColor(playerid, p_craft[12][playerid], 51);
		PlayerTextDrawFont(playerid, p_craft[12][playerid], 2);
		PlayerTextDrawSetProportional(playerid, p_craft[12][playerid], 1);

		p_craft[13][playerid] = CreatePlayerTextDraw(playerid, 92.000000, 267.583282, "kuriamas daiktas");
		PlayerTextDrawLetterSize(playerid, p_craft[13][playerid], 0.177499, 1.267498);
		PlayerTextDrawTextSize(playerid, p_craft[13][playerid], 11.500000, 116.083389);
		PlayerTextDrawAlignment(playerid, p_craft[13][playerid], 2);
		PlayerTextDrawColor(playerid, p_craft[13][playerid], 255);
		PlayerTextDrawUseBox(playerid, p_craft[13][playerid], true);
		PlayerTextDrawBoxColor(playerid, p_craft[13][playerid], -5963521);
		PlayerTextDrawSetShadow(playerid, p_craft[13][playerid], 0);
		PlayerTextDrawSetOutline(playerid, p_craft[13][playerid], 0);
		PlayerTextDrawBackgroundColor(playerid, p_craft[13][playerid], 51);
		PlayerTextDrawFont(playerid, p_craft[13][playerid], 2);
		PlayerTextDrawSetProportional(playerid, p_craft[13][playerid], 1);
		PlayerTextDrawSetSelectable(playerid, p_craft[13][playerid], true);

		p_stats[0][playerid] = CreatePlayerTextDraw(playerid, 561.270080, 48.206703, "546 189 321");
		PlayerTextDrawLetterSize(playerid, p_stats[0][playerid], 0.243411, 1.459998);
		PlayerTextDrawAlignment(playerid, p_stats[0][playerid], 1);
		PlayerTextDrawColor(playerid, p_stats[0][playerid], -1); // 0xF2E6CEFF
		PlayerTextDrawSetShadow(playerid, p_stats[0][playerid], 0);
		PlayerTextDrawSetOutline(playerid, p_stats[0][playerid], 1);
		PlayerTextDrawBackgroundColor(playerid, p_stats[0][playerid], 51);
		PlayerTextDrawFont(playerid, p_stats[0][playerid], 2);
		PlayerTextDrawSetProportional(playerid, p_stats[0][playerid], 1);

		p_stats[1][playerid] = CreatePlayerTextDraw(playerid, 561.799438, 62.040042, "5 652");
		PlayerTextDrawLetterSize(playerid, p_stats[1][playerid], 0.243411, 1.459998);
		PlayerTextDrawAlignment(playerid, p_stats[1][playerid], 1);
		PlayerTextDrawColor(playerid, p_stats[1][playerid], -1);
		PlayerTextDrawSetShadow(playerid, p_stats[1][playerid], 0);
		PlayerTextDrawSetOutline(playerid, p_stats[1][playerid], 1);
		PlayerTextDrawBackgroundColor(playerid, p_stats[1][playerid], 51);
		PlayerTextDrawFont(playerid, p_stats[1][playerid], 2);
		PlayerTextDrawSetProportional(playerid, p_stats[1][playerid], 1);

		p_stats[2][playerid] = CreatePlayerTextDraw(playerid, 522.094055, 88.274932, "LD_SPAC:white");
		PlayerTextDrawLetterSize(playerid, p_stats[2][playerid], 0.000000, 0.000000);
		PlayerTextDrawTextSize(playerid, p_stats[2][playerid], 101, 3.2);
		PlayerTextDrawAlignment(playerid, p_stats[2][playerid], 1);
		PlayerTextDrawColor(playerid, p_stats[2][playerid], -822083329);
		PlayerTextDrawSetShadow(playerid, p_stats[2][playerid], 0);
		PlayerTextDrawSetOutline(playerid, p_stats[2][playerid], 0);
		PlayerTextDrawFont(playerid, p_stats[2][playerid], 4);

		new Float:tdiff = 166.25;
		for(new i; i != TAXI_MAX_SEATS; ++i)
		{
			p_taxi_stats[i][playerid] = CreatePlayerTextDraw(playerid, 36, tdiff, "Vardas_Pavarde ~y~21~w~km ( ~y~105~w~ lt )");
			PlayerTextDrawLetterSize(playerid, p_taxi_stats[i][playerid], 0.258940, 1.559166);
			PlayerTextDrawAlignment(playerid, p_taxi_stats[i][playerid], 1);
			PlayerTextDrawColor(playerid, p_taxi_stats[i][playerid], -1);
			PlayerTextDrawSetShadow(playerid, p_taxi_stats[i][playerid], 0);
			PlayerTextDrawSetOutline(playerid, p_taxi_stats[i][playerid], 1);
			PlayerTextDrawBackgroundColor(playerid, p_taxi_stats[i][playerid], 51);
			PlayerTextDrawFont(playerid, p_taxi_stats[i][playerid], 2);
			PlayerTextDrawSetProportional(playerid, p_taxi_stats[i][playerid], 1);
			tdiff += 17.916564;
		}

		p_gangzone[playerid] = CreatePlayerTextDraw(playerid, 626.352661, 284.083312, "Sia teritorija valdo '~y~Zulikai~w~'.~n~Ju itaka siai teritorijai: ~y~8540");
		PlayerTextDrawLetterSize(playerid, p_gangzone[playerid], 0.240117, 1.471667);
		PlayerTextDrawAlignment(playerid, p_gangzone[playerid], 3);
		PlayerTextDrawColor(playerid, p_gangzone[playerid], -1);
		PlayerTextDrawSetShadow(playerid, p_gangzone[playerid], 0);
		PlayerTextDrawSetOutline(playerid, p_gangzone[playerid], 1);
		PlayerTextDrawBackgroundColor(playerid, p_gangzone[playerid], 51);
		PlayerTextDrawFont(playerid, p_gangzone[playerid], 2);
		PlayerTextDrawSetProportional(playerid, p_gangzone[playerid], 1);

		p_carShop[0][playerid] = CreatePlayerTextDraw(playerid, 311.566284, 327.250091, "Elegy");
		PlayerTextDrawLetterSize(playerid, p_carShop[0][playerid], 0.366602, 2.078334);
		PlayerTextDrawAlignment(playerid, p_carShop[0][playerid], 2);
		PlayerTextDrawColor(playerid, p_carShop[0][playerid], -1);
		PlayerTextDrawSetShadow(playerid, p_carShop[0][playerid], 0);
		PlayerTextDrawSetOutline(playerid, p_carShop[0][playerid], 1);
		PlayerTextDrawBackgroundColor(playerid, p_carShop[0][playerid], 51);
		PlayerTextDrawFont(playerid, p_carShop[0][playerid], 2);
		PlayerTextDrawSetProportional(playerid, p_carShop[0][playerid], 1);

		p_carShop[1][playerid] = CreatePlayerTextDraw(playerid, 395.026611, 334.666809, "Infernus");
		PlayerTextDrawLetterSize(playerid, p_carShop[1][playerid], 0.262591, 1.518332);
		PlayerTextDrawAlignment(playerid, p_carShop[1][playerid], 2);
		PlayerTextDrawColor(playerid, p_carShop[1][playerid], -2139062017);
		PlayerTextDrawSetShadow(playerid, p_carShop[1][playerid], 0);
		PlayerTextDrawSetOutline(playerid, p_carShop[1][playerid], 1);
		PlayerTextDrawBackgroundColor(playerid, p_carShop[1][playerid], 51);
		PlayerTextDrawFont(playerid, p_carShop[1][playerid], 2);
		PlayerTextDrawSetProportional(playerid, p_carShop[1][playerid], 1);

		p_carShop[2][playerid] = CreatePlayerTextDraw(playerid, 232.043579, 334.500122, "Sabre");
		PlayerTextDrawLetterSize(playerid, p_carShop[2][playerid], 0.262591, 1.518332);
		PlayerTextDrawAlignment(playerid, p_carShop[2][playerid], 2);
		PlayerTextDrawColor(playerid, p_carShop[2][playerid], -2139062017);
		PlayerTextDrawSetShadow(playerid, p_carShop[2][playerid], 0);
		PlayerTextDrawSetOutline(playerid, p_carShop[2][playerid], 1);
		PlayerTextDrawBackgroundColor(playerid, p_carShop[2][playerid], 51);
		PlayerTextDrawFont(playerid, p_carShop[2][playerid], 2);
		PlayerTextDrawSetProportional(playerid, p_carShop[2][playerid], 1);

		p_carShop[3][playerid] = CreatePlayerTextDraw(playerid, 150.863830, 360.500122, "greitis: ~y~182 ~w~km/h");
		PlayerTextDrawLetterSize(playerid, p_carShop[3][playerid], 0.301946, 1.600000);
		PlayerTextDrawAlignment(playerid, p_carShop[3][playerid], 1);
		PlayerTextDrawColor(playerid, p_carShop[3][playerid], -1);
		PlayerTextDrawSetShadow(playerid, p_carShop[3][playerid], 0);
		PlayerTextDrawSetOutline(playerid, p_carShop[3][playerid], 1);
		PlayerTextDrawBackgroundColor(playerid, p_carShop[3][playerid], 51);
		PlayerTextDrawFont(playerid, p_carShop[3][playerid], 2);
		PlayerTextDrawSetProportional(playerid, p_carShop[3][playerid], 1);

		p_carShop[4][playerid] = CreatePlayerTextDraw(playerid, 150.926788, 376.666931, "svoris: ~y~5200 ~w~kg");
		PlayerTextDrawLetterSize(playerid, p_carShop[4][playerid], 0.301946, 1.600000);
		PlayerTextDrawAlignment(playerid, p_carShop[4][playerid], 1);
		PlayerTextDrawColor(playerid, p_carShop[4][playerid], -1);
		PlayerTextDrawSetShadow(playerid, p_carShop[4][playerid], 0);
		PlayerTextDrawSetOutline(playerid, p_carShop[4][playerid], 1);
		PlayerTextDrawBackgroundColor(playerid, p_carShop[4][playerid], 51);
		PlayerTextDrawFont(playerid, p_carShop[4][playerid], 2);
		PlayerTextDrawSetProportional(playerid, p_carShop[4][playerid], 1);

		p_carShop[5][playerid] = CreatePlayerTextDraw(playerid, 150.521224, 391.667144, "vietos: ~y~2");
		PlayerTextDrawLetterSize(playerid, p_carShop[5][playerid], 0.301946, 1.600000);
		PlayerTextDrawAlignment(playerid, p_carShop[5][playerid], 1);
		PlayerTextDrawColor(playerid, p_carShop[5][playerid], -1);
		PlayerTextDrawSetShadow(playerid, p_carShop[5][playerid], 0);
		PlayerTextDrawSetOutline(playerid, p_carShop[5][playerid], 1);
		PlayerTextDrawBackgroundColor(playerid, p_carShop[5][playerid], 51);
		PlayerTextDrawFont(playerid, p_carShop[5][playerid], 2);
		PlayerTextDrawSetProportional(playerid, p_carShop[5][playerid], 1);

		p_carShop[6][playerid] = CreatePlayerTextDraw(playerid, 341.980163, 360.333435, "Bagazines talpa: ~y~40 ~w~kg");
		PlayerTextDrawLetterSize(playerid, p_carShop[6][playerid], 0.301946, 1.600000);
		PlayerTextDrawAlignment(playerid, p_carShop[6][playerid], 1);
		PlayerTextDrawColor(playerid, p_carShop[6][playerid], -1);
		PlayerTextDrawSetShadow(playerid, p_carShop[6][playerid], 0);
		PlayerTextDrawSetOutline(playerid, p_carShop[6][playerid], 1);
		PlayerTextDrawBackgroundColor(playerid, p_carShop[6][playerid], 51);
		PlayerTextDrawFont(playerid, p_carShop[6][playerid], 2);
		PlayerTextDrawSetProportional(playerid, p_carShop[6][playerid], 1);

		p_carShop[7][playerid] = CreatePlayerTextDraw(playerid, 360.462463, 400.250366, "Kaina: ~w~~g~42000 ~w~lt");
		PlayerTextDrawLetterSize(playerid, p_carShop[7][playerid], 0.368297, 2.060832);
		PlayerTextDrawAlignment(playerid, p_carShop[7][playerid], 1);
		PlayerTextDrawColor(playerid, p_carShop[7][playerid], -1);
		PlayerTextDrawSetShadow(playerid, p_carShop[7][playerid], 0);
		PlayerTextDrawSetOutline(playerid, p_carShop[7][playerid], 1);
		PlayerTextDrawBackgroundColor(playerid, p_carShop[7][playerid], 51);
		PlayerTextDrawFont(playerid, p_carShop[7][playerid], 2);
		PlayerTextDrawSetProportional(playerid, p_carShop[7][playerid], 1);

		p_carShop[8][playerid] = CreatePlayerTextDraw(playerid, 217.368865, 422.541900, "rubinai: ~w~~r~420     ~y~SHIFT");
		PlayerTextDrawLetterSize(playerid, p_carShop[8][playerid], 0.255827, 1.582499);
		PlayerTextDrawAlignment(playerid, p_carShop[8][playerid], 1);
		PlayerTextDrawColor(playerid, p_carShop[8][playerid], -1);
		PlayerTextDrawSetShadow(playerid, p_carShop[8][playerid], 0);
		PlayerTextDrawSetOutline(playerid, p_carShop[8][playerid], 1);
		PlayerTextDrawBackgroundColor(playerid, p_carShop[8][playerid], 51);
		PlayerTextDrawFont(playerid, p_carShop[8][playerid], 2);
		PlayerTextDrawSetProportional(playerid, p_carShop[8][playerid], 1);

		dmg[0][playerid] = CreatePlayerTextDraw(playerid, 343.999694, 153.416870, "24.6");
		PlayerTextDrawLetterSize(playerid, dmg[0][playerid], 0.233529, 1.553333);
		PlayerTextDrawAlignment(playerid, dmg[0][playerid], 1);
		PlayerTextDrawColor(playerid, dmg[0][playerid], -1061109505);
		PlayerTextDrawSetShadow(playerid, dmg[0][playerid], 0);
		PlayerTextDrawSetOutline(playerid, dmg[0][playerid], 1);
		PlayerTextDrawBackgroundColor(playerid, dmg[0][playerid], 51);
		PlayerTextDrawFont(playerid, dmg[0][playerid], 2);
		PlayerTextDrawSetProportional(playerid, dmg[0][playerid], 1);

		dmg[1][playerid] = CreatePlayerTextDraw(playerid, 334.176147, 153.250213, "18.2");
		PlayerTextDrawLetterSize(playerid, dmg[1][playerid], 0.233529, 1.553333);
		PlayerTextDrawAlignment(playerid, dmg[1][playerid], 3);
		PlayerTextDrawColor(playerid, dmg[1][playerid], -16776961);
		PlayerTextDrawSetShadow(playerid, dmg[1][playerid], 0);
		PlayerTextDrawSetOutline(playerid, dmg[1][playerid], 1);
		PlayerTextDrawBackgroundColor(playerid, dmg[1][playerid], 51);
		PlayerTextDrawFont(playerid, dmg[1][playerid], 2);
		PlayerTextDrawSetProportional(playerid, dmg[1][playerid], 1);

		pTrunk[playerid][0][0] = CreatePlayerTextDraw(playerid, 204.336380, 346.913665, "1");
		PlayerTextDrawLetterSize(playerid, pTrunk[playerid][0][0], 0.250000, 1.184000);
		PlayerTextDrawAlignment(playerid, pTrunk[playerid][0][0], 2);
		PlayerTextDrawColor(playerid, pTrunk[playerid][0][0], -1);
		PlayerTextDrawSetShadow(playerid, pTrunk[playerid][0][0], 0);
		PlayerTextDrawSetOutline(playerid, pTrunk[playerid][0][0], 1);
		PlayerTextDrawBackgroundColor(playerid, pTrunk[playerid][0][0], 51);
		PlayerTextDrawFont(playerid, pTrunk[playerid][0][0], 2);
		PlayerTextDrawSetProportional(playerid, pTrunk[playerid][0][0], 1);

		Notification2[playerid] = CreatePlayerTextDraw(playerid, 316.251922, 114.916664, "Liko sedeti: 1654 sec");
		PlayerTextDrawLetterSize(playerid, Notification2[playerid], 0.344582, 1.594167);
		PlayerTextDrawTextSize(playerid, Notification2[playerid], 59.033664, 271.833343);
		PlayerTextDrawAlignment(playerid, Notification2[playerid], 2);
		PlayerTextDrawColor(playerid, Notification2[playerid], -1);
		PlayerTextDrawUseBox(playerid, Notification2[playerid], true);
		PlayerTextDrawBoxColor(playerid, Notification2[playerid], 13);
		PlayerTextDrawSetShadow(playerid, Notification2[playerid], 0);
		PlayerTextDrawSetOutline(playerid, Notification2[playerid], 1);
		PlayerTextDrawBackgroundColor(playerid, Notification2[playerid], 51);
		PlayerTextDrawFont(playerid, Notification2[playerid], 2);
		PlayerTextDrawSetProportional(playerid, Notification2[playerid], 1);

		new Float:trow = 147.415344;
		for(new i, j; i < 12; i++)
		{
			j++;
			pTrunk[playerid][0][j] = CreatePlayerTextDraw(playerid, 98.449707, trow, "pavadinimas");
			PlayerTextDrawLetterSize(playerid, pTrunk[playerid][0][j], 0.209000, 1.184000);
			PlayerTextDrawTextSize(playerid, pTrunk[playerid][0][j], 308.754821, 11.082666);
			PlayerTextDrawAlignment(playerid, pTrunk[playerid][0][j], 1);
			PlayerTextDrawColor(playerid, pTrunk[playerid][0][j], -1);
			PlayerTextDrawUseBox(playerid, pTrunk[playerid][0][j], true);
			PlayerTextDrawBoxColor(playerid, pTrunk[playerid][0][j], 102);
			PlayerTextDrawSetShadow(playerid, pTrunk[playerid][0][j], 0);
			PlayerTextDrawSetOutline(playerid, pTrunk[playerid][0][j], 1);
			PlayerTextDrawBackgroundColor(playerid, pTrunk[playerid][0][j], 51);
			PlayerTextDrawFont(playerid, pTrunk[playerid][0][j], 2);
			PlayerTextDrawSetProportional(playerid, pTrunk[playerid][0][j], 1);
			PlayerTextDrawSetSelectable(playerid, pTrunk[playerid][0][j], true);
			j++;

			pTrunk[playerid][0][j] = CreatePlayerTextDraw(playerid, 263.254440, trow, "kiekis");
			PlayerTextDrawLetterSize(playerid, pTrunk[playerid][0][j], 0.209000, 1.184000);
			PlayerTextDrawTextSize(playerid, pTrunk[playerid][0][j], 442.752014, 9.916000);
			PlayerTextDrawAlignment(playerid, pTrunk[playerid][0][j], 3);
			PlayerTextDrawColor(playerid, pTrunk[playerid][0][j], -1);
			PlayerTextDrawSetShadow(playerid, pTrunk[playerid][0][j], 0);
			PlayerTextDrawSetOutline(playerid, pTrunk[playerid][0][j], 1);
			PlayerTextDrawBackgroundColor(playerid, pTrunk[playerid][0][j], 51);
			PlayerTextDrawFont(playerid, pTrunk[playerid][0][j], 2);
			PlayerTextDrawSetProportional(playerid, pTrunk[playerid][0][j], 1);
			j++;

			pTrunk[playerid][0][j] = CreatePlayerTextDraw(playerid, 300.548828, trow, "svoris");
			PlayerTextDrawLetterSize(playerid, pTrunk[playerid][0][j], 0.209000, 1.184000);
			PlayerTextDrawTextSize(playerid, pTrunk[playerid][0][j], 442.752014, 9.916000);
			PlayerTextDrawAlignment(playerid, pTrunk[playerid][0][j], 3);
			PlayerTextDrawColor(playerid, pTrunk[playerid][0][j], -1);
			PlayerTextDrawSetShadow(playerid, pTrunk[playerid][0][j], 0);
			PlayerTextDrawSetOutline(playerid, pTrunk[playerid][0][j], 1);
			PlayerTextDrawBackgroundColor(playerid, pTrunk[playerid][0][j], 51);
			PlayerTextDrawFont(playerid, pTrunk[playerid][0][j], 2);
			PlayerTextDrawSetProportional(playerid, pTrunk[playerid][0][j], 1);
			
			trow += TRUNK_ROW;
		}

	/*	
		pTrunk[playerid][0][5] = CreatePlayerTextDraw(playerid, 98.951232, trow, "kma raktai");
		PlayerTextDrawLetterSize(playerid, pTrunk[playerid][0][5], 0.209000, 1.184000);
		PlayerTextDrawTextSize(playerid, pTrunk[playerid][0][5], 308.753906, 7.582664);
		PlayerTextDrawAlignment(playerid, pTrunk[playerid][0][5], 1);
		PlayerTextDrawColor(playerid, pTrunk[playerid][0][5], -1);
		PlayerTextDrawUseBox(playerid, pTrunk[playerid][0][5], true);
		PlayerTextDrawBoxColor(playerid, pTrunk[playerid][0][5], 102);
		PlayerTextDrawSetShadow(playerid, pTrunk[playerid][0][5], 0);
		PlayerTextDrawSetOutline(playerid, pTrunk[playerid][0][5], 1);
		PlayerTextDrawBackgroundColor(playerid, pTrunk[playerid][0][5], 51);
		PlayerTextDrawFont(playerid, pTrunk[playerid][0][5], 2);
		PlayerTextDrawSetProportional(playerid, pTrunk[playerid][0][5], 1);
		PlayerTextDrawSetSelectable(playerid, pTrunk[playerid][0][5], true);
	*/

		// 2

		pTrunk[playerid][1][0] = CreatePlayerTextDraw(playerid, 434.912109, 346.163604, "1");
		PlayerTextDrawLetterSize(playerid, pTrunk[playerid][1][0], 0.250000, 1.184000);
		PlayerTextDrawAlignment(playerid, pTrunk[playerid][1][0], 2);
		PlayerTextDrawColor(playerid, pTrunk[playerid][1][0], -1);
		PlayerTextDrawSetShadow(playerid, pTrunk[playerid][1][0], 0);
		PlayerTextDrawSetOutline(playerid, pTrunk[playerid][1][0], 1);
		PlayerTextDrawBackgroundColor(playerid, pTrunk[playerid][1][0], 51);
		PlayerTextDrawFont(playerid, pTrunk[playerid][1][0], 2);
		PlayerTextDrawSetProportional(playerid, pTrunk[playerid][1][0], 1);

		trow = 147.415344;
		for(new i, j; i < 12; i++)
		{
			j++;
			pTrunk[playerid][1][j] = CreatePlayerTextDraw(playerid, 320.591949, trow, "pavadinimas"); 
			PlayerTextDrawLetterSize(playerid, pTrunk[playerid][1][j], 0.209000, 1.184000);
			PlayerTextDrawTextSize(playerid, pTrunk[playerid][1][j], 532.239685, 11.082666);
			PlayerTextDrawAlignment(playerid, pTrunk[playerid][1][j], 1);
			PlayerTextDrawColor(playerid, pTrunk[playerid][1][j], -1);
			PlayerTextDrawUseBox(playerid, pTrunk[playerid][1][j], true);
			PlayerTextDrawBoxColor(playerid, pTrunk[playerid][1][j], 102);
			PlayerTextDrawSetShadow(playerid, pTrunk[playerid][1][j], 0);
			PlayerTextDrawSetOutline(playerid, pTrunk[playerid][1][j], 1);
			PlayerTextDrawBackgroundColor(playerid, pTrunk[playerid][1][j], 51);
			PlayerTextDrawFont(playerid, pTrunk[playerid][1][j], 2);
			PlayerTextDrawSetProportional(playerid, pTrunk[playerid][1][j], 1);
			PlayerTextDrawSetSelectable(playerid, pTrunk[playerid][1][j], true);
			j++;
			
			pTrunk[playerid][1][j] = CreatePlayerTextDraw(playerid, 485.396682, trow, "kiekis");
			PlayerTextDrawLetterSize(playerid, pTrunk[playerid][1][j], 0.209000, 1.184000);
			PlayerTextDrawTextSize(playerid, pTrunk[playerid][1][j], 442.752014, 9.916000);
			PlayerTextDrawAlignment(playerid, pTrunk[playerid][1][j], 3);
			PlayerTextDrawColor(playerid, pTrunk[playerid][1][j], -1);
			PlayerTextDrawSetShadow(playerid, pTrunk[playerid][1][j], 0);
			PlayerTextDrawSetOutline(playerid, pTrunk[playerid][1][j], 1);
			PlayerTextDrawBackgroundColor(playerid, pTrunk[playerid][1][j], 51);
			PlayerTextDrawFont(playerid, pTrunk[playerid][1][j], 2);
			PlayerTextDrawSetProportional(playerid, pTrunk[playerid][1][j], 1);
			j++;
			
			pTrunk[playerid][1][j] = CreatePlayerTextDraw(playerid, 522.69107, trow, "svoris");
			PlayerTextDrawLetterSize(playerid, pTrunk[playerid][1][j], 0.209000, 1.184000);
			PlayerTextDrawTextSize(playerid, pTrunk[playerid][1][j], 442.752014, 9.916000);
			PlayerTextDrawAlignment(playerid, pTrunk[playerid][1][j], 3);
			PlayerTextDrawColor(playerid, pTrunk[playerid][1][j], -1);
			PlayerTextDrawSetShadow(playerid, pTrunk[playerid][1][j], 0);
			PlayerTextDrawSetOutline(playerid, pTrunk[playerid][1][j], 1);
			PlayerTextDrawBackgroundColor(playerid, pTrunk[playerid][1][j], 51);
			PlayerTextDrawFont(playerid, pTrunk[playerid][1][j], 2);
			PlayerTextDrawSetProportional(playerid, pTrunk[playerid][1][j], 1);

			trow += TRUNK_ROW;
		}

		/*		pTrunk[playerid][1][2] = CreatePlayerTextDraw(playerid, 321.093200, 163.499359, "line2");
		PlayerTextDrawLetterSize(playerid, pTrunk[playerid][1][2], 0.209000, 1.184000);
		PlayerTextDrawTextSize(playerid, pTrunk[playerid][1][2], 532.238586, 14.582665);
		PlayerTextDrawAlignment(playerid, pTrunk[playerid][1][2], 1);
		PlayerTextDrawColor(playerid, pTrunk[playerid][1][2], -1);
		PlayerTextDrawUseBox(playerid, pTrunk[playerid][1][2], true);
		PlayerTextDrawBoxColor(playerid, pTrunk[playerid][1][2], 102);
		PlayerTextDrawSetShadow(playerid, pTrunk[playerid][1][2], 0);
		PlayerTextDrawSetOutline(playerid, pTrunk[playerid][1][2], 1);
		PlayerTextDrawBackgroundColor(playerid, pTrunk[playerid][1][2], 51);
		PlayerTextDrawFont(playerid, pTrunk[playerid][1][2], 2);
		PlayerTextDrawSetProportional(playerid, pTrunk[playerid][1][2], 1);
		PlayerTextDrawSetSelectable(playerid, pTrunk[playerid][1][2], true);*/


		pArea[playerid] = CreatePlayerTextDraw(playerid, 10.823298, 290.500091, "Noredamas ieiti, spausk ~y~ENTER~w~.");
		PlayerTextDrawLetterSize(playerid, pArea[playerid], 0.249528, 1.436664);
		PlayerTextDrawTextSize(playerid, pArea[playerid], 196.235168, 6.999999);
		PlayerTextDrawAlignment(playerid, pArea[playerid], 1);
		PlayerTextDrawColor(playerid, pArea[playerid], -1);
		PlayerTextDrawUseBox(playerid, pArea[playerid], true);
		PlayerTextDrawBoxColor(playerid, pArea[playerid], 0);
		PlayerTextDrawSetShadow(playerid, pArea[playerid], 0);
		PlayerTextDrawSetOutline(playerid, pArea[playerid], 1);
		PlayerTextDrawBackgroundColor(playerid, pArea[playerid], 51);
		PlayerTextDrawFont(playerid, pArea[playerid], 2);
		PlayerTextDrawSetProportional(playerid, pArea[playerid], 1);
		
	    iBag[pid][0] = CreatePlayerTextDraw( pid, 186.001, 103.833, "soc:menu");
		PlayerTextDrawTextSize( pid,iBag[pid][0], 275.958, 297.500);
		PlayerTextDrawAlignment( pid, iBag[pid][0], 1);
		PlayerTextDrawColor( pid, iBag[pid][0], -1);
		PlayerTextDrawFont( pid,iBag[pid][0], 4);

		iBag[pid][64] = CreatePlayerTextDraw(playerid, 31.390922, 116.666687, "-");
		PlayerTextDrawLetterSize(playerid, iBag[pid][64], 0.224639, 1.325832);
		PlayerTextDrawTextSize(playerid, iBag[pid][64], 183.191787, 37.916667);
		PlayerTextDrawAlignment(playerid, iBag[pid][64], 1);
		PlayerTextDrawColor(playerid, iBag[pid][64], -1);
		PlayerTextDrawUseBox(playerid, iBag[pid][64], true);
		PlayerTextDrawBoxColor(playerid, iBag[pid][64], 67);
		PlayerTextDrawSetShadow(playerid, iBag[pid][64], 0);
		PlayerTextDrawSetOutline(playerid, iBag[pid][64], 1);
		PlayerTextDrawBackgroundColor(playerid, iBag[pid][64], 51);
		PlayerTextDrawFont(playerid, iBag[pid][64], 2);
		PlayerTextDrawSetProportional(playerid, iBag[pid][64], 1);

		iBag[pid][1] = CreatePlayerTextDraw( pid, 201.602, 113.095, "Kuprine");
		PlayerTextDrawLetterSize( pid,iBag[pid][1], 0.335, 1.383);
		PlayerTextDrawAlignment( pid, iBag[pid][1], 1);
		PlayerTextDrawColor( pid, iBag[pid][1], -1);
		PlayerTextDrawSetOutline( pid,iBag[pid][1], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][1], 51);
		PlayerTextDrawFont( pid,iBag[pid][1], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][1], 1);

		iBag[pid][2] = CreatePlayerTextDraw( pid, 288.355, 373.583, "ismesti");
		PlayerTextDrawLetterSize( pid,iBag[pid][2], 0.206, 1.315);
		PlayerTextDrawTextSize( pid,iBag[pid][2], 30.000, 45.546);
		PlayerTextDrawAlignment( pid, iBag[pid][2], 2);
		PlayerTextDrawColor( pid, iBag[pid][2], -1);
		PlayerTextDrawUseBox( pid,iBag[pid][2], 1);
		PlayerTextDrawBoxColor( pid,iBag[pid][2], 102);
		PlayerTextDrawSetOutline( pid,iBag[pid][2], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][2], 51);
		PlayerTextDrawFont( pid,iBag[pid][2], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][2], 1);
		PlayerTextDrawSetSelectable( pid, iBag[pid][2], true);

		iBag[pid][3] = CreatePlayerTextDraw( pid, 343.671, 373.498, "Gaminti");
		PlayerTextDrawLetterSize( pid,iBag[pid][3], 0.206, 1.315);
		PlayerTextDrawTextSize( pid,iBag[pid][3], 30.000, 45.546);
		PlayerTextDrawAlignment( pid, iBag[pid][3], 2);
		PlayerTextDrawColor( pid, iBag[pid][3], -1);
		PlayerTextDrawUseBox( pid,iBag[pid][3], 1);
		PlayerTextDrawBoxColor( pid,iBag[pid][3], 102);
		PlayerTextDrawSetOutline( pid,iBag[pid][3], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][3], 51);
		PlayerTextDrawFont( pid,iBag[pid][3], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][3], 1);
		PlayerTextDrawSetSelectable( pid, iBag[pid][3], true);

		iBag[pid][4] = CreatePlayerTextDraw( pid, 420.072, 373.415, "uzdaryti");
		PlayerTextDrawLetterSize( pid,iBag[pid][4], 0.206, 1.315);
		PlayerTextDrawTextSize( pid,iBag[pid][4], 30.000, 45.546);
		PlayerTextDrawAlignment( pid, iBag[pid][4], 2);
		PlayerTextDrawColor( pid, iBag[pid][4], -1);
		PlayerTextDrawUseBox( pid,iBag[pid][4], 1);
		PlayerTextDrawBoxColor( pid,iBag[pid][4], 102);
		PlayerTextDrawSetOutline( pid,iBag[pid][4], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][4], 51);
		PlayerTextDrawFont( pid,iBag[pid][4], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][4], 1);
		PlayerTextDrawSetSelectable( pid, iBag[pid][4], true);

		iBag[pid][5] = CreatePlayerTextDraw( pid, 232.570, 373.665, "Naudoti");
		PlayerTextDrawLetterSize( pid,iBag[pid][5], 0.206, 1.315);
		PlayerTextDrawTextSize( pid,iBag[pid][5], 30.000, 45.546);
		PlayerTextDrawAlignment( pid, iBag[pid][5], 2);
		PlayerTextDrawColor( pid, iBag[pid][5], -1);
		PlayerTextDrawUseBox( pid,iBag[pid][5], 1);
		PlayerTextDrawBoxColor( pid,iBag[pid][5], 102);
		PlayerTextDrawSetOutline( pid,iBag[pid][5], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][5], 51);
		PlayerTextDrawFont( pid,iBag[pid][5], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][5], 1);
		PlayerTextDrawSetSelectable( pid, iBag[pid][5], true);

		iBag[pid][6] = CreatePlayerTextDraw( pid, 453.653, 131.000, "box");
		PlayerTextDrawLetterSize( pid,iBag[pid][6], 0.000, 23.663);
		PlayerTextDrawTextSize( pid,iBag[pid][6], 193.373, 0.000);
		PlayerTextDrawAlignment( pid, iBag[pid][6], 1);
		PlayerTextDrawColor( pid, iBag[pid][6], 0);
		PlayerTextDrawUseBox( pid,iBag[pid][6], 1);
		PlayerTextDrawBoxColor( pid,iBag[pid][6], 102);
		PlayerTextDrawFont( pid,iBag[pid][6], 0);

		iBag[pid][7] = CreatePlayerTextDraw( pid, 206.149, 130.666, "pavadinimas                                       kiekis   svoris   kaina(LT)");
		PlayerTextDrawLetterSize( pid,iBag[pid][7], 0.178, 1.126);
		PlayerTextDrawAlignment( pid, iBag[pid][7], 1);
		PlayerTextDrawColor( pid, iBag[pid][7], -1);
		PlayerTextDrawSetOutline( pid,iBag[pid][7], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][7], 51);
		PlayerTextDrawFont( pid,iBag[pid][7], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][7], 1);

		iBag[pid][8] = CreatePlayerTextDraw( pid, 186.470, 135.916, "-");
		PlayerTextDrawLetterSize( pid,iBag[pid][8], 22.361, 1.366);
		PlayerTextDrawAlignment( pid, iBag[pid][8], 1);
		PlayerTextDrawColor( pid, iBag[pid][8], -1);
		PlayerTextDrawSetOutline( pid,iBag[pid][8], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][8], 51);
		PlayerTextDrawFont( pid,iBag[pid][8], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][8], 1);
		
		iBag[pid][9] = CreatePlayerTextDraw( pid, 364.509, 348.165, ">>>");
		PlayerTextDrawLetterSize( pid,iBag[pid][9], 0.250, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][9], 10.307, 37.916);
		PlayerTextDrawAlignment( pid, iBag[pid][9], 2);
		PlayerTextDrawColor( pid, iBag[pid][9], -1);
		PlayerTextDrawSetOutline( pid,iBag[pid][9], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][9], 51);
		PlayerTextDrawFont( pid,iBag[pid][9], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][9], 1);
		PlayerTextDrawSetSelectable( pid, iBag[pid][9], true);

		iBag[pid][10] = CreatePlayerTextDraw( pid, 283.954, 348.165, "<<<");
		PlayerTextDrawLetterSize( pid,iBag[pid][10], 0.250, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][10], 10.307, 37.916);
		PlayerTextDrawAlignment( pid, iBag[pid][10], 2);
		PlayerTextDrawColor( pid, iBag[pid][10], -1);
		PlayerTextDrawSetOutline( pid,iBag[pid][10], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][10], 51);
		PlayerTextDrawFont( pid,iBag[pid][10], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][10], 1);
		PlayerTextDrawSetSelectable( pid, iBag[pid][10], true);

		iBag[pid][11] = CreatePlayerTextDraw( pid, 324.278, 348.165, "1");
		PlayerTextDrawLetterSize( pid,iBag[pid][11], 0.250, 1.184);
		PlayerTextDrawAlignment( pid, iBag[pid][11], 2);
		PlayerTextDrawColor( pid, iBag[pid][11], -1);
		PlayerTextDrawSetOutline( pid,iBag[pid][11], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][11], 51);
		PlayerTextDrawFont( pid,iBag[pid][11], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][11], 1);
		
		new Float:row = 148.582;
		iBag[pid][12] = CreatePlayerTextDraw( pid, 204.804, row, "11111111111111111111");
		PlayerTextDrawLetterSize( pid,iBag[pid][12], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][12], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][12], 1);
		PlayerTextDrawColor( pid, iBag[pid][12], -1);
		PlayerTextDrawUseBox( pid,iBag[pid][12], 1);
		PlayerTextDrawBoxColor( pid,iBag[pid][12], 102);
		PlayerTextDrawSetOutline( pid,iBag[pid][12], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][12], 51);
		PlayerTextDrawFont( pid,iBag[pid][12], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][12], 1);
		PlayerTextDrawSetSelectable( pid, iBag[pid][12], true);

		iBag[pid][13] = CreatePlayerTextDraw( pid, 369.756, row, "133");
		PlayerTextDrawLetterSize( pid,iBag[pid][13], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][13], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][13], 3);
		PlayerTextDrawColor( pid, iBag[pid][13], -1);
		PlayerTextDrawSetOutline( pid,iBag[pid][13], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][13], 51);
		PlayerTextDrawFont( pid,iBag[pid][13], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][13], 1);

		iBag[pid][14] = CreatePlayerTextDraw( pid, 403.520, row, "2.3kg");
		PlayerTextDrawLetterSize( pid,iBag[pid][14], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][14], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][14], 3);
		PlayerTextDrawColor( pid, iBag[pid][14], -1);
		PlayerTextDrawSetOutline( pid,iBag[pid][14], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][14], 51);
		PlayerTextDrawFont( pid,iBag[pid][14], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][14], 1);

		iBag[pid][15] = CreatePlayerTextDraw( pid, 441.971, row, "256$");
		PlayerTextDrawLetterSize( pid,iBag[pid][15], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][15], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][15], 3);
		PlayerTextDrawColor( pid, iBag[pid][15], -1);
		PlayerTextDrawSetOutline( pid,iBag[pid][15], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][15], 51);
		PlayerTextDrawFont( pid,iBag[pid][15], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][15], 1);
		row += BAG_ROW;
		
		iBag[pid][16] = CreatePlayerTextDraw( pid, 204.804, row, "22222222222222222222");
		PlayerTextDrawLetterSize( pid,iBag[pid][16], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][16], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][16], 1);
		PlayerTextDrawColor( pid, iBag[pid][16], -1);
		PlayerTextDrawUseBox( pid,iBag[pid][16], 1);
		PlayerTextDrawBoxColor( pid,iBag[pid][16], 102);
		PlayerTextDrawSetOutline( pid,iBag[pid][16], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][16], 51);
		PlayerTextDrawFont( pid,iBag[pid][16], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][16], 1);
		PlayerTextDrawSetSelectable( pid, iBag[pid][16], true);

		iBag[pid][17] = CreatePlayerTextDraw( pid, 369.756, row, "133");
		PlayerTextDrawLetterSize( pid,iBag[pid][17], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][17], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][17], 3);
		PlayerTextDrawColor( pid, iBag[pid][17], -1);
		PlayerTextDrawSetOutline( pid,iBag[pid][17], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][17], 51);
		PlayerTextDrawFont( pid,iBag[pid][17], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][17], 1);

		iBag[pid][18] = CreatePlayerTextDraw( pid, 403.520, row, "2.3kg");
		PlayerTextDrawLetterSize( pid,iBag[pid][18], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][18], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][18], 3);
		PlayerTextDrawColor( pid, iBag[pid][18], -1);
		PlayerTextDrawSetOutline( pid,iBag[pid][18], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][18], 51);
		PlayerTextDrawFont( pid,iBag[pid][18], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][18], 1);

		iBag[pid][19] = CreatePlayerTextDraw( pid, 441.971, row, "256$");
		PlayerTextDrawLetterSize( pid,iBag[pid][19], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][19], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][19], 3);
		PlayerTextDrawColor( pid, iBag[pid][19], -1);
		PlayerTextDrawSetOutline( pid,iBag[pid][19], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][19], 51);
		PlayerTextDrawFont( pid,iBag[pid][19], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][19], 1);
		row += BAG_ROW;
		
		iBag[pid][20] = CreatePlayerTextDraw( pid, 204.804, row, "3333333333333333333333");
		PlayerTextDrawLetterSize( pid,iBag[pid][20], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][20], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][20], 1);
		PlayerTextDrawColor( pid, iBag[pid][20], -1);
		PlayerTextDrawUseBox( pid,iBag[pid][20], 1);
		PlayerTextDrawBoxColor( pid,iBag[pid][20], 102);
		PlayerTextDrawSetOutline( pid,iBag[pid][20], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][20], 51);
		PlayerTextDrawFont( pid,iBag[pid][20], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][20], 1);
		PlayerTextDrawSetSelectable( pid, iBag[pid][20], true);

		iBag[pid][21] = CreatePlayerTextDraw( pid, 369.756, row, "133");
		PlayerTextDrawLetterSize( pid,iBag[pid][21], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][21], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][21], 3);
		PlayerTextDrawColor( pid, iBag[pid][21], -1);
		PlayerTextDrawSetOutline( pid,iBag[pid][21], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][21], 51);
		PlayerTextDrawFont( pid,iBag[pid][21], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][21], 1);

		iBag[pid][22] = CreatePlayerTextDraw( pid, 403.520, row, "2.3kg");
		PlayerTextDrawLetterSize( pid,iBag[pid][22], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][22], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][22], 3);
		PlayerTextDrawColor( pid, iBag[pid][22], -1);
		PlayerTextDrawSetOutline( pid,iBag[pid][22], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][22], 51);
		PlayerTextDrawFont( pid,iBag[pid][22], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][22], 1);

		iBag[pid][23] = CreatePlayerTextDraw( pid, 441.971, row, "256$");
		PlayerTextDrawLetterSize( pid,iBag[pid][23], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][23], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][23], 3);
		PlayerTextDrawColor( pid, iBag[pid][23], -1);
		PlayerTextDrawSetOutline( pid,iBag[pid][23], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][23], 51);
		PlayerTextDrawFont( pid,iBag[pid][23], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][23], 1);
		row += BAG_ROW;
		
		iBag[pid][24] = CreatePlayerTextDraw( pid, 204.804, row, "44444444444444444");
		PlayerTextDrawLetterSize( pid,iBag[pid][24], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][24], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][24], 1);
		PlayerTextDrawColor( pid, iBag[pid][24], -1);
		PlayerTextDrawUseBox( pid,iBag[pid][24], 1);
		PlayerTextDrawBoxColor( pid,iBag[pid][24], 102);
		PlayerTextDrawSetOutline( pid,iBag[pid][24], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][24], 51);
		PlayerTextDrawFont( pid,iBag[pid][24], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][24], 1);
		PlayerTextDrawSetSelectable( pid, iBag[pid][24], true);

		iBag[pid][25] = CreatePlayerTextDraw( pid, 369.756, row, "133");
		PlayerTextDrawLetterSize( pid,iBag[pid][25], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][25], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][25], 3);
		PlayerTextDrawColor( pid, iBag[pid][25], -1);
		PlayerTextDrawSetOutline( pid,iBag[pid][25], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][25], 51);
		PlayerTextDrawFont( pid,iBag[pid][25], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][25], 1);

		iBag[pid][26] = CreatePlayerTextDraw( pid, 403.520, row, "2.3kg");
		PlayerTextDrawLetterSize( pid,iBag[pid][26], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][26], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][26], 3);
		PlayerTextDrawColor( pid, iBag[pid][26], -1);
		PlayerTextDrawSetOutline( pid,iBag[pid][26], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][26], 51);
		PlayerTextDrawFont( pid,iBag[pid][26], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][26], 1);

		iBag[pid][27] = CreatePlayerTextDraw( pid, 441.971, row, "256$");
		PlayerTextDrawLetterSize( pid,iBag[pid][27], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][27], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][27], 3);
		PlayerTextDrawColor( pid, iBag[pid][27], -1);
		PlayerTextDrawSetOutline( pid,iBag[pid][27], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][27], 51);
		PlayerTextDrawFont( pid,iBag[pid][27], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][27], 1);
		row += BAG_ROW;
		
		iBag[pid][28] = CreatePlayerTextDraw( pid, 204.804, row, "5555555555555");
		PlayerTextDrawLetterSize( pid,iBag[pid][28], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][28], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][28], 1);
		PlayerTextDrawColor( pid, iBag[pid][28], -1);
		PlayerTextDrawUseBox( pid,iBag[pid][28], 1);
		PlayerTextDrawBoxColor( pid,iBag[pid][28], 102);
		PlayerTextDrawSetOutline( pid,iBag[pid][28], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][28], 51);
		PlayerTextDrawFont( pid,iBag[pid][28], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][28], 1);
		PlayerTextDrawSetSelectable( pid, iBag[pid][28], true);

		iBag[pid][29] = CreatePlayerTextDraw( pid, 369.756, row, "133");
		PlayerTextDrawLetterSize( pid,iBag[pid][29], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][29], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][29], 3);
		PlayerTextDrawColor( pid, iBag[pid][29], -1);
		PlayerTextDrawSetOutline( pid,iBag[pid][29], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][29], 51);
		PlayerTextDrawFont( pid,iBag[pid][29], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][29], 1);

		iBag[pid][30] = CreatePlayerTextDraw( pid, 403.520, row, "2.3kg");
		PlayerTextDrawLetterSize( pid,iBag[pid][30], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][30], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][30], 3);
		PlayerTextDrawColor( pid, iBag[pid][30], -1);
		PlayerTextDrawSetOutline( pid,iBag[pid][30], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][30], 51);
		PlayerTextDrawFont( pid,iBag[pid][30], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][30], 1);

		iBag[pid][31] = CreatePlayerTextDraw( pid, 441.971, row, "256$");
		PlayerTextDrawLetterSize( pid,iBag[pid][31], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][31], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][31], 3);
		PlayerTextDrawColor( pid, iBag[pid][31], -1);
		PlayerTextDrawSetOutline( pid,iBag[pid][31], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][31], 51);
		PlayerTextDrawFont( pid,iBag[pid][31], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][31], 1);
		row += BAG_ROW;
		
		iBag[pid][32] = CreatePlayerTextDraw( pid, 204.804, row, "666666666666666");
		PlayerTextDrawLetterSize( pid,iBag[pid][32], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][32], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][32], 1);
		PlayerTextDrawColor( pid, iBag[pid][32], -1);
		PlayerTextDrawUseBox( pid,iBag[pid][32], 1);
		PlayerTextDrawBoxColor( pid,iBag[pid][32], 102);
		PlayerTextDrawSetOutline( pid,iBag[pid][32], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][32], 51);
		PlayerTextDrawFont( pid,iBag[pid][32], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][32], 1);
		PlayerTextDrawSetSelectable( pid, iBag[pid][32], true);

		iBag[pid][33] = CreatePlayerTextDraw( pid, 369.756, row, "133");
		PlayerTextDrawLetterSize( pid,iBag[pid][33], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][33], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][33], 3);
		PlayerTextDrawColor( pid, iBag[pid][33], -1);
		PlayerTextDrawSetOutline( pid,iBag[pid][33], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][33], 51);
		PlayerTextDrawFont( pid,iBag[pid][33], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][33], 1);

		iBag[pid][34] = CreatePlayerTextDraw( pid, 403.520, row, "2.3kg");
		PlayerTextDrawLetterSize( pid,iBag[pid][34], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][34], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][34], 3);
		PlayerTextDrawColor( pid, iBag[pid][34], -1);
		PlayerTextDrawSetOutline( pid,iBag[pid][34], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][34], 51);
		PlayerTextDrawFont( pid,iBag[pid][34], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][34], 1);

		iBag[pid][35] = CreatePlayerTextDraw( pid, 441.971, row, "256$");
		PlayerTextDrawLetterSize( pid,iBag[pid][35], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][35], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][35], 3);
		PlayerTextDrawColor( pid, iBag[pid][35], -1);
		PlayerTextDrawSetOutline( pid,iBag[pid][35], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][35], 51);
		PlayerTextDrawFont( pid,iBag[pid][35], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][35], 1);
		row += BAG_ROW;
		
		iBag[pid][36] = CreatePlayerTextDraw( pid, 204.804, row, "77777777777777");
		PlayerTextDrawLetterSize( pid,iBag[pid][36], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][36], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][36], 1);
		PlayerTextDrawColor( pid, iBag[pid][36], -1);
		PlayerTextDrawUseBox( pid,iBag[pid][36], 1);
		PlayerTextDrawBoxColor( pid,iBag[pid][36], 102);
		PlayerTextDrawSetOutline( pid,iBag[pid][36], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][36], 51);
		PlayerTextDrawFont( pid,iBag[pid][36], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][36], 1);
		PlayerTextDrawSetSelectable( pid, iBag[pid][36], true);

		iBag[pid][37] = CreatePlayerTextDraw( pid, 369.756, row, "133");
		PlayerTextDrawLetterSize( pid,iBag[pid][37], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][37], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][37], 3);
		PlayerTextDrawColor( pid, iBag[pid][37], -1);
		PlayerTextDrawSetOutline( pid,iBag[pid][37], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][37], 51);
		PlayerTextDrawFont( pid,iBag[pid][37], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][37], 1);

		iBag[pid][38] = CreatePlayerTextDraw( pid, 403.520, row, "2.3kg");
		PlayerTextDrawLetterSize( pid,iBag[pid][38], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][38], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][38], 3);
		PlayerTextDrawColor( pid, iBag[pid][38], -1);
		PlayerTextDrawSetOutline( pid,iBag[pid][38], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][38], 51);
		PlayerTextDrawFont( pid,iBag[pid][38], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][38], 1);

		iBag[pid][39] = CreatePlayerTextDraw( pid, 441.971, row, "256$");
		PlayerTextDrawLetterSize( pid,iBag[pid][39], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][39], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][39], 3);
		PlayerTextDrawColor( pid, iBag[pid][39], -1);
		PlayerTextDrawSetOutline( pid,iBag[pid][39], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][39], 51);
		PlayerTextDrawFont( pid,iBag[pid][39], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][39], 1);
		row += BAG_ROW;
		
		iBag[pid][40] = CreatePlayerTextDraw( pid, 204.804, row, "88888888888888888");
		PlayerTextDrawLetterSize( pid,iBag[pid][40], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][40], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][40], 1);
		PlayerTextDrawColor( pid, iBag[pid][40], -1);
		PlayerTextDrawUseBox( pid,iBag[pid][40], 1);
		PlayerTextDrawBoxColor( pid,iBag[pid][40], 102);
		PlayerTextDrawSetOutline( pid,iBag[pid][40], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][40], 51);
		PlayerTextDrawFont( pid,iBag[pid][40], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][40], 1);
		PlayerTextDrawSetSelectable( pid, iBag[pid][40], true);

		iBag[pid][41] = CreatePlayerTextDraw( pid, 369.756, row, "133");
		PlayerTextDrawLetterSize( pid,iBag[pid][41], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][41], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][41], 3);
		PlayerTextDrawColor( pid, iBag[pid][41], -1);
		PlayerTextDrawSetOutline( pid,iBag[pid][41], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][41], 51);
		PlayerTextDrawFont( pid,iBag[pid][41], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][41], 1);

		iBag[pid][42] = CreatePlayerTextDraw( pid, 403.520, row, "2.3kg");
		PlayerTextDrawLetterSize( pid,iBag[pid][42], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][42], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][42], 3);
		PlayerTextDrawColor( pid, iBag[pid][42], -1);
		PlayerTextDrawSetOutline( pid,iBag[pid][42], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][42], 51);
		PlayerTextDrawFont( pid,iBag[pid][42], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][42], 1);

		iBag[pid][43] = CreatePlayerTextDraw( pid, 441.971, row, "256$");
		PlayerTextDrawLetterSize( pid,iBag[pid][43], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][43], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][43], 3);
		PlayerTextDrawColor( pid, iBag[pid][43], -1);
		PlayerTextDrawSetOutline( pid,iBag[pid][43], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][43], 51);
		PlayerTextDrawFont( pid,iBag[pid][43], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][43], 1);
		row += BAG_ROW;
		
		iBag[pid][44] = CreatePlayerTextDraw( pid, 204.804, row, "999999999999999999999999");
		PlayerTextDrawLetterSize( pid,iBag[pid][44], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][44], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][44], 1);
		PlayerTextDrawColor( pid, iBag[pid][44], -1);
		PlayerTextDrawUseBox( pid,iBag[pid][44], 1);
		PlayerTextDrawBoxColor( pid,iBag[pid][44], 102);
		PlayerTextDrawSetOutline( pid,iBag[pid][44], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][44], 51);
		PlayerTextDrawFont( pid,iBag[pid][44], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][44], 1);
		PlayerTextDrawSetSelectable( pid, iBag[pid][44], true);

		iBag[pid][45] = CreatePlayerTextDraw( pid, 369.756, row, "133");
		PlayerTextDrawLetterSize( pid,iBag[pid][45], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][45], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][45], 3);
		PlayerTextDrawColor( pid, iBag[pid][45], -1);
		PlayerTextDrawSetOutline( pid,iBag[pid][45], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][45], 51);
		PlayerTextDrawFont( pid,iBag[pid][45], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][45], 1);

		iBag[pid][46] = CreatePlayerTextDraw( pid, 403.520, row, "2.3kg");
		PlayerTextDrawLetterSize( pid,iBag[pid][46], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][46], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][46], 3);
		PlayerTextDrawColor( pid, iBag[pid][46], -1);
		PlayerTextDrawSetOutline( pid,iBag[pid][46], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][46], 51);
		PlayerTextDrawFont( pid,iBag[pid][46], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][46], 1);

		iBag[pid][47] = CreatePlayerTextDraw( pid, 441.971, row, "256$");
		PlayerTextDrawLetterSize( pid,iBag[pid][47], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][47], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][47], 3);
		PlayerTextDrawColor( pid, iBag[pid][47], -1);
		PlayerTextDrawSetOutline( pid,iBag[pid][47], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][47], 51);
		PlayerTextDrawFont( pid,iBag[pid][47], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][47], 1);
		row += BAG_ROW;
		
		iBag[pid][48] = CreatePlayerTextDraw( pid, 204.804, row, "101010101010101010101010");
		PlayerTextDrawLetterSize( pid,iBag[pid][48], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][48], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][48], 1);
		PlayerTextDrawColor( pid, iBag[pid][48], -1);
		PlayerTextDrawUseBox( pid,iBag[pid][48], 1);
		PlayerTextDrawBoxColor( pid,iBag[pid][48], 102);
		PlayerTextDrawSetOutline( pid,iBag[pid][48], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][48], 51);
		PlayerTextDrawFont( pid,iBag[pid][48], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][48], 1);
		PlayerTextDrawSetSelectable( pid, iBag[pid][48], true);

		iBag[pid][49] = CreatePlayerTextDraw( pid, 369.756, row, "133");
		PlayerTextDrawLetterSize( pid,iBag[pid][49], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][49], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][49], 3);
		PlayerTextDrawColor( pid, iBag[pid][49], -1);
		PlayerTextDrawSetOutline( pid,iBag[pid][49], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][49], 51);
		PlayerTextDrawFont( pid,iBag[pid][49], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][49], 1);

		iBag[pid][50] = CreatePlayerTextDraw( pid, 403.520, row, "2.3kg");
		PlayerTextDrawLetterSize( pid,iBag[pid][50], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][50], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][50], 3);
		PlayerTextDrawColor( pid, iBag[pid][50], -1);
		PlayerTextDrawSetOutline( pid,iBag[pid][50], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][50], 51);
		PlayerTextDrawFont( pid,iBag[pid][50], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][50], 1);

		iBag[pid][51] = CreatePlayerTextDraw( pid, 441.971, row, "256$");
		PlayerTextDrawLetterSize( pid,iBag[pid][51], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][51], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][51], 3);
		PlayerTextDrawColor( pid, iBag[pid][51], -1);
		PlayerTextDrawSetOutline( pid,iBag[pid][51], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][51], 51);
		PlayerTextDrawFont( pid,iBag[pid][51], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][51], 1);
		row += BAG_ROW;
		
		iBag[pid][52] = CreatePlayerTextDraw( pid, 204.804, row, "111111111111111111");
		PlayerTextDrawLetterSize( pid,iBag[pid][52], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][52], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][52], 1);
		PlayerTextDrawColor( pid, iBag[pid][52], -1);
		PlayerTextDrawUseBox( pid,iBag[pid][52], 1);
		PlayerTextDrawBoxColor( pid,iBag[pid][52], 102);
		PlayerTextDrawSetOutline( pid,iBag[pid][52], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][52], 51);
		PlayerTextDrawFont( pid,iBag[pid][52], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][52], 1);
		PlayerTextDrawSetSelectable( pid, iBag[pid][52], true);

		iBag[pid][53] = CreatePlayerTextDraw( pid, 369.756, row, "133");
		PlayerTextDrawLetterSize( pid,iBag[pid][53], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][53], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][53], 3);
		PlayerTextDrawColor( pid, iBag[pid][53], -1);
		PlayerTextDrawSetOutline( pid,iBag[pid][53], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][53], 51);
		PlayerTextDrawFont( pid,iBag[pid][53], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][53], 1);

		iBag[pid][54] = CreatePlayerTextDraw( pid, 403.520, row, "2.3kg");
		PlayerTextDrawLetterSize( pid,iBag[pid][54], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][54], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][54], 3);
		PlayerTextDrawColor( pid, iBag[pid][54], -1);
		PlayerTextDrawSetOutline( pid,iBag[pid][54], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][54], 51);
		PlayerTextDrawFont( pid,iBag[pid][54], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][54], 1);

		iBag[pid][55] = CreatePlayerTextDraw( pid, 441.971, row, "256$");
		PlayerTextDrawLetterSize( pid,iBag[pid][55], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][55], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][55], 3);
		PlayerTextDrawColor( pid, iBag[pid][55], -1);
		PlayerTextDrawSetOutline( pid,iBag[pid][55], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][55], 51);
		PlayerTextDrawFont( pid,iBag[pid][55], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][55], 1);
		row += BAG_ROW;
		
		iBag[pid][56] = CreatePlayerTextDraw( pid, 204.804, row, "121212121212121212");
		PlayerTextDrawLetterSize( pid,iBag[pid][56], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][56], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][56], 1);
		PlayerTextDrawColor( pid, iBag[pid][56], -1);
		PlayerTextDrawUseBox( pid,iBag[pid][56], 1);
		PlayerTextDrawBoxColor( pid,iBag[pid][56], 102);
		PlayerTextDrawSetOutline( pid,iBag[pid][56], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][56], 51);
		PlayerTextDrawFont( pid,iBag[pid][56], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][56], 1);
		PlayerTextDrawSetSelectable( pid, iBag[pid][56], true);

		iBag[pid][57] = CreatePlayerTextDraw( pid, 369.756, row, "133");
		PlayerTextDrawLetterSize( pid,iBag[pid][57], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][57], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][57], 3);
		PlayerTextDrawColor( pid, iBag[pid][57], -1);
		PlayerTextDrawSetOutline( pid,iBag[pid][57], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][57], 51);
		PlayerTextDrawFont( pid,iBag[pid][57], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][57], 1);

		iBag[pid][58] = CreatePlayerTextDraw( pid, 403.520, row, "2.3kg");
		PlayerTextDrawLetterSize( pid,iBag[pid][58], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][58], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][58], 3);
		PlayerTextDrawColor( pid, iBag[pid][58], -1);
		PlayerTextDrawSetOutline( pid,iBag[pid][58], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][58], 51);
		PlayerTextDrawFont( pid,iBag[pid][58], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][58], 1);

		iBag[pid][59] = CreatePlayerTextDraw( pid, 441.971, row, "256$");
		PlayerTextDrawLetterSize( pid,iBag[pid][59], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][59], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][59], 3);
		PlayerTextDrawColor( pid, iBag[pid][59], -1);
		PlayerTextDrawSetOutline( pid,iBag[pid][59], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][59], 51);
		PlayerTextDrawFont( pid,iBag[pid][59], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][59], 1);
		row += BAG_ROW;
		
		iBag[pid][60] = CreatePlayerTextDraw( pid, 204.804, row, "1313131313131313311331");
		PlayerTextDrawLetterSize( pid,iBag[pid][60], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][60], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][60], 1);
		PlayerTextDrawColor( pid, iBag[pid][60], -1);
		PlayerTextDrawUseBox( pid,iBag[pid][60], 1);
		PlayerTextDrawBoxColor( pid,iBag[pid][60], 102);
		PlayerTextDrawSetOutline( pid,iBag[pid][60], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][60], 51);
		PlayerTextDrawFont( pid,iBag[pid][60], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][60], 1);
		PlayerTextDrawSetSelectable( pid, iBag[pid][60], true);

		iBag[pid][61] = CreatePlayerTextDraw( pid, 369.756, row, "133");
		PlayerTextDrawLetterSize( pid,iBag[pid][61], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][61], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][61], 3);
		PlayerTextDrawColor( pid, iBag[pid][61], -1);
		PlayerTextDrawSetOutline( pid,iBag[pid][61], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][61], 51);
		PlayerTextDrawFont( pid,iBag[pid][61], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][61], 1);

		iBag[pid][62] = CreatePlayerTextDraw( pid, 403.520, row, "2.3kg");
		PlayerTextDrawLetterSize( pid,iBag[pid][62], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][62], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][62], 3);
		PlayerTextDrawColor( pid, iBag[pid][62], -1);
		PlayerTextDrawSetOutline( pid,iBag[pid][62], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][62], 51);
		PlayerTextDrawFont( pid,iBag[pid][62], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][62], 1);

		iBag[pid][63] = CreatePlayerTextDraw( pid, 441.971, row, "256$");
		PlayerTextDrawLetterSize( pid,iBag[pid][63], 0.210, 1.184);
		PlayerTextDrawTextSize( pid,iBag[pid][63], 442.752, 9.916);
		PlayerTextDrawAlignment( pid, iBag[pid][63], 3);
		PlayerTextDrawColor( pid, iBag[pid][63], -1);
		PlayerTextDrawSetOutline( pid,iBag[pid][63], 1);
		PlayerTextDrawBackgroundColor( pid,iBag[pid][63], 51);
		PlayerTextDrawFont( pid,iBag[pid][63], 2);
		PlayerTextDrawSetProportional( pid,iBag[pid][63], 1);
		
	    // Notification
	    Notification0[pid] = CreatePlayerTextDraw( pid, 438.000, 15.685, "box");
		PlayerTextDrawLetterSize( pid,Notification0[pid], 0.000, 0.703);
		PlayerTextDrawTextSize( pid,Notification0[pid], 195.500, 0.000);
		PlayerTextDrawAlignment( pid, Notification0[pid], 1);
		PlayerTextDrawColor( pid, Notification0[pid], 0);
		PlayerTextDrawUseBox( pid,Notification0[pid], 1);
		PlayerTextDrawBoxColor( pid,Notification0[pid], 23);
		PlayerTextDrawFont( pid,Notification0[pid], 0);

		Notification1[pid] = CreatePlayerTextDraw( pid, 319.500, 13.439, "pranesimas");
		PlayerTextDrawLetterSize( pid,Notification1[pid], 0.200, 1.077);
		PlayerTextDrawAlignment( pid, Notification1[pid], 2);
		PlayerTextDrawColor( pid, Notification1[pid], -1);
		PlayerTextDrawSetOutline( pid,Notification1[pid], -1);
		PlayerTextDrawBackgroundColor( pid,Notification1[pid], 51);
		PlayerTextDrawFont( pid,Notification1[pid], 2);
		PlayerTextDrawSetProportional( pid,Notification1[pid], 1);

		// Misijos

		p_questList[0][playerid] = CreatePlayerTextDraw(playerid, 138.540374, 309.300109, "( ~y~2~w~ )");
		PlayerTextDrawLetterSize(playerid, p_questList[0][playerid], 0.306470, 2.165833);
		PlayerTextDrawAlignment(playerid, p_questList[0][playerid], 2);
		PlayerTextDrawColor(playerid, p_questList[0][playerid], -1);
		PlayerTextDrawSetShadow(playerid, p_questList[0][playerid], 0);
		PlayerTextDrawSetOutline(playerid, p_questList[0][playerid], 1);
		PlayerTextDrawBackgroundColor(playerid, p_questList[0][playerid], 51);
		PlayerTextDrawFont(playerid, p_questList[0][playerid], 2);
		PlayerTextDrawSetProportional(playerid, p_questList[0][playerid], 1);

		p_questList[1][playerid] = CreatePlayerTextDraw(playerid, 31.077407, 139.999969, "~y~Apieskoti laiva del galimos kontrabandos");
		PlayerTextDrawLetterSize(playerid, p_questList[1][playerid], 0.210491, 1.460001);
		PlayerTextDrawTextSize(playerid, p_questList[1][playerid], 209.882339, 81.666664);
		PlayerTextDrawAlignment(playerid, p_questList[1][playerid], 1);
		PlayerTextDrawColor(playerid, p_questList[1][playerid], -1);
		PlayerTextDrawUseBox(playerid, p_questList[1][playerid], true);
		PlayerTextDrawBoxColor(playerid, p_questList[1][playerid], 0);
		PlayerTextDrawSetShadow(playerid, p_questList[1][playerid], 0);
		PlayerTextDrawSetOutline(playerid, p_questList[1][playerid], 1);
		PlayerTextDrawBackgroundColor(playerid, p_questList[1][playerid], 51);
		PlayerTextDrawFont(playerid, p_questList[1][playerid], 2);
		PlayerTextDrawSetProportional(playerid, p_questList[1][playerid], 1);

		p_questList[2][playerid] = CreatePlayerTextDraw(playerid, 36.705886, 179.666763, "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy t");
		PlayerTextDrawLetterSize(playerid, p_questList[2][playerid], 0.195931, 1.390000);
		PlayerTextDrawTextSize(playerid, p_questList[2][playerid], 242.352951, -2.916666);
		PlayerTextDrawAlignment(playerid, p_questList[2][playerid], 1);
		PlayerTextDrawColor(playerid, p_questList[2][playerid], -1);
		PlayerTextDrawUseBox(playerid, p_questList[2][playerid], true);
		PlayerTextDrawBoxColor(playerid, p_questList[2][playerid], 0);
		PlayerTextDrawSetShadow(playerid, p_questList[2][playerid], 0);
		PlayerTextDrawSetOutline(playerid, p_questList[2][playerid], 1);
		PlayerTextDrawBackgroundColor(playerid, p_questList[2][playerid], 51);
		PlayerTextDrawFont(playerid, p_questList[2][playerid], 2);
		PlayerTextDrawSetProportional(playerid, p_questList[2][playerid], 1);

		p_questList[3][pid] = CreatePlayerTextDraw(pid, 37.237365, 279.833282, "Atlygis:~n~~y~200~w~ lt, ~y~30~w~ patirties.");
		PlayerTextDrawLetterSize(pid, p_questList[3][pid], 0.195931, 1.390000);
		PlayerTextDrawTextSize(pid, p_questList[3][pid], 242.352951, -2.916666);
		PlayerTextDrawAlignment(pid, p_questList[3][pid], 1);
		PlayerTextDrawColor(pid, p_questList[3][pid], -1);
		PlayerTextDrawUseBox(pid, p_questList[3][pid], true);
		PlayerTextDrawBoxColor(pid, p_questList[3][pid], 0);
		PlayerTextDrawSetShadow(pid, p_questList[3][pid], 0);
		PlayerTextDrawSetOutline(pid, p_questList[3][pid], 1);
		PlayerTextDrawBackgroundColor(pid, p_questList[3][pid], 51);
		PlayerTextDrawFont(pid, p_questList[3][pid], 2);
		PlayerTextDrawSetProportional(pid, p_questList[3][pid], 1);

		// Patarimai

		p_tip[0][playerid] = CreatePlayerTextDraw(playerid, 481.470733, 139.833374, "Noredamas zvejoti privalai tureti meskere bei zinoma masalo. Pradejes ~y~/zvejoti~w~ lauk kol uzkibs zuvis.");
		PlayerTextDrawLetterSize(playerid, p_tip[0][playerid], 0.178941, 1.226666);
		PlayerTextDrawTextSize(playerid, p_tip[0][playerid], 625.411804, -1.749997);
		PlayerTextDrawAlignment(playerid, p_tip[0][playerid], 1);
		PlayerTextDrawColor(playerid, p_tip[0][playerid], -1);
		PlayerTextDrawUseBox(playerid, p_tip[0][playerid], true);
		PlayerTextDrawBoxColor(playerid, p_tip[0][playerid], 53);
		PlayerTextDrawSetShadow(playerid, p_tip[0][playerid], 0);
		PlayerTextDrawSetOutline(playerid, p_tip[0][playerid], 1);
		PlayerTextDrawBackgroundColor(playerid, p_tip[0][playerid], 51);
		PlayerTextDrawFont(playerid, p_tip[0][playerid], 2);
		PlayerTextDrawSetProportional(playerid, p_tip[0][playerid], 1);

		p_tip[1][playerid] = CreatePlayerTextDraw(playerid, 480.941345, 122.500045, "Zvejyba");
		PlayerTextDrawLetterSize(playerid, p_tip[1][playerid], 0.234470, 1.354999);
		PlayerTextDrawTextSize(playerid, p_tip[1][playerid], 625.411804, -1.749997);
		PlayerTextDrawAlignment(playerid, p_tip[1][playerid], 1);
		PlayerTextDrawColor(playerid, p_tip[1][playerid], -1);
		PlayerTextDrawSetShadow(playerid, p_tip[1][playerid], 0);
		PlayerTextDrawSetOutline(playerid, p_tip[1][playerid], 1);
		PlayerTextDrawBackgroundColor(playerid, p_tip[1][playerid], 51);
		PlayerTextDrawFont(playerid, p_tip[1][playerid], 2);
		PlayerTextDrawSetProportional(playerid, p_tip[1][playerid], 1);

		p_tip_show[playerid] = CreatePlayerTextDraw(playerid, 531.764770, 150.733306, "Masinos uzvedimas");
		PlayerTextDrawLetterSize(playerid, p_tip_show[playerid], 0.247647, 1.465831);
		PlayerTextDrawTextSize(playerid, p_tip_show[playerid], 20.705898, 131.833450);
		PlayerTextDrawAlignment(playerid, p_tip_show[playerid], 2);
		PlayerTextDrawColor(playerid, p_tip_show[playerid], -1);
		PlayerTextDrawUseBox(playerid, p_tip_show[playerid], true);
		PlayerTextDrawBoxColor(playerid, p_tip_show[playerid], 0);
		PlayerTextDrawSetShadow(playerid, p_tip_show[playerid], 0);
		PlayerTextDrawSetOutline(playerid, p_tip_show[playerid], 1);
		PlayerTextDrawBackgroundColor(playerid, p_tip_show[playerid], 51);
		PlayerTextDrawFont(playerid, p_tip_show[playerid], 2);
		PlayerTextDrawSetProportional(playerid, p_tip_show[playerid], 1);
		PlayerTextDrawSetSelectable(playerid, p_tip_show[playerid], true);

		p_task[0][playerid] = CreatePlayerTextDraw(playerid, 222.117675, 365.166717, "Pirmoji uzduotis");
		PlayerTextDrawLetterSize(playerid, p_task[0][playerid], 0.289528, 1.559165);
		PlayerTextDrawAlignment(playerid, p_task[0][playerid], 1);
		PlayerTextDrawColor(playerid, p_task[0][playerid], -1);
		PlayerTextDrawSetShadow(playerid, p_task[0][playerid], 0);
		PlayerTextDrawSetOutline(playerid, p_task[0][playerid], 1);
		PlayerTextDrawBackgroundColor(playerid, p_task[0][playerid], 51);
		PlayerTextDrawFont(playerid, p_task[0][playerid], 2);
		PlayerTextDrawSetProportional(playerid, p_task[0][playerid], 1);

		p_task[1][playerid] = CreatePlayerTextDraw(playerid, 224.529418, 383.666809, "Gidas patare tau nusipirkti zemelapi. Surask salia stoties esanti kioskeli.");
		PlayerTextDrawLetterSize(playerid, p_task[1][playerid], 0.217998, 1.331665);
		PlayerTextDrawTextSize(playerid, p_task[1][playerid], 406.588409, 134.749649);
		PlayerTextDrawAlignment(playerid, p_task[1][playerid], 1);
		PlayerTextDrawColor(playerid, p_task[1][playerid], -1);
		PlayerTextDrawUseBox(playerid, p_task[1][playerid], true);
		PlayerTextDrawBoxColor(playerid, p_task[1][playerid], 52);
		PlayerTextDrawSetShadow(playerid, p_task[1][playerid], 0);
		PlayerTextDrawSetOutline(playerid, p_task[1][playerid], 1);
		PlayerTextDrawBackgroundColor(playerid, p_task[1][playerid], 51);
		PlayerTextDrawFont(playerid, p_task[1][playerid], 2);
		PlayerTextDrawSetProportional(playerid, p_task[1][playerid], 1);


		


		p_garage[0][playerid] = CreatePlayerTextDraw(playerid, 38.117607, 222.483489, "Infernus");
		PlayerTextDrawLetterSize(playerid, p_garage[0][playerid], 0.446235, 2.066666);
		PlayerTextDrawAlignment(playerid, p_garage[0][playerid], 1);
		PlayerTextDrawColor(playerid, p_garage[0][playerid], -1);
		PlayerTextDrawSetShadow(playerid, p_garage[0][playerid], 0);
		PlayerTextDrawSetOutline(playerid, p_garage[0][playerid], 1);
		PlayerTextDrawBackgroundColor(playerid, p_garage[0][playerid], 51);
		PlayerTextDrawFont(playerid, p_garage[0][playerid], 2);
		PlayerTextDrawSetProportional(playerid, p_garage[0][playerid], 1);

		p_garage[1][playerid] = CreatePlayerTextDraw(playerid, 38.176433, 213.333450, "Pasirink savo masina");
		PlayerTextDrawLetterSize(playerid, p_garage[1][playerid], 0.251411, 1.337498);
		PlayerTextDrawAlignment(playerid, p_garage[1][playerid], 1);
		PlayerTextDrawColor(playerid, p_garage[1][playerid], -149);
		PlayerTextDrawSetShadow(playerid, p_garage[1][playerid], 0);
		PlayerTextDrawSetOutline(playerid, p_garage[1][playerid], 1);
		PlayerTextDrawBackgroundColor(playerid, p_garage[1][playerid], 51);
		PlayerTextDrawFont(playerid, p_garage[1][playerid], 2);
		PlayerTextDrawSetProportional(playerid, p_garage[1][playerid], 1);

		p_garage[2][playerid] = CreatePlayerTextDraw(playerid, 37.646938, 379.750335, "1 i 4");
		PlayerTextDrawLetterSize(playerid, p_garage[2][playerid], 0.284352, 1.553333);
		PlayerTextDrawAlignment(playerid, p_garage[2][playerid], 1);
		PlayerTextDrawColor(playerid, p_garage[2][playerid], -1);
		PlayerTextDrawSetShadow(playerid, p_garage[2][playerid], 0);
		PlayerTextDrawSetOutline(playerid, p_garage[2][playerid], 1);
		PlayerTextDrawBackgroundColor(playerid, p_garage[2][playerid], 51);
		PlayerTextDrawFont(playerid, p_garage[2][playerid], 2);
		PlayerTextDrawSetProportional(playerid, p_garage[2][playerid], 1);

#define start 35.764701
#define diff 143.117592

		new j = 3;

		for(new i; i != 4; ++i)
		{
			p_garage[j][playerid] = CreatePlayerTextDraw(playerid, start+diff*i-6, 202, "Masinos_picture"); // mašinos paveiksliukas
			PlayerTextDrawLetterSize(playerid, p_garage[j][playerid], 0.000000, 0.000000);
			PlayerTextDrawTextSize(playerid, p_garage[j][playerid], 126, 126);
			PlayerTextDrawAlignment(playerid, p_garage[j][playerid], 1);
			PlayerTextDrawColor(playerid, p_garage[j][playerid], -1);
			PlayerTextDrawSetShadow(playerid, p_garage[j][playerid], 0);
			PlayerTextDrawSetOutline(playerid, p_garage[j][playerid], 0);
			PlayerTextDrawBackgroundColor(playerid, p_garage[j][playerid], 0x00000000);
			PlayerTextDrawFont(playerid, p_garage[j][playerid], TEXT_DRAW_FONT_MODEL_PREVIEW);
			PlayerTextDrawSetPreviewModel(playerid, p_garage[j][playerid], 411);
			PlayerTextDrawSetPreviewRot(playerid, p_garage[j][playerid], -6, 5, 25, 1.0);

			++j;

			p_garage[j][playerid] = CreatePlayerTextDraw(playerid, 82+diff*i, 311, "LD_SPAC:white"); // status_bukle
			PlayerTextDrawLetterSize(playerid, p_garage[j][playerid], 0.000000, 0.000000);
			PlayerTextDrawTextSize(playerid, p_garage[j][playerid], 80.000000, 4.000000);
			PlayerTextDrawAlignment(playerid, p_garage[j][playerid], 1);
			PlayerTextDrawColor(playerid, p_garage[j][playerid], -1061109505);
			PlayerTextDrawSetShadow(playerid, p_garage[j][playerid], 0);
			PlayerTextDrawSetOutline(playerid, p_garage[j][playerid], 0);
			PlayerTextDrawFont(playerid, p_garage[j][playerid], 4);

			++j;

			p_garage[j][playerid] = CreatePlayerTextDraw(playerid, 82+diff*i, 311+14, "LD_SPAC:white"); // status_greitis
			PlayerTextDrawLetterSize(playerid, p_garage[j][playerid], 0.000000, 0.000000);
			PlayerTextDrawTextSize(playerid, p_garage[j][playerid], 80.000000, 4.000000);
			PlayerTextDrawAlignment(playerid, p_garage[j][playerid], 1);
			PlayerTextDrawColor(playerid, p_garage[j][playerid], -1061109505);
			PlayerTextDrawSetShadow(playerid, p_garage[j][playerid], 0);
			PlayerTextDrawSetOutline(playerid, p_garage[j][playerid], 0);
			PlayerTextDrawFont(playerid, p_garage[j][playerid], 4);

			++j;

			p_garage[j][playerid] = CreatePlayerTextDraw(playerid, 82+diff*i, 311+14*2, "LD_SPAC:white"); // status_svoris
			PlayerTextDrawLetterSize(playerid, p_garage[j][playerid], 0.000000, 0.000000);
			PlayerTextDrawTextSize(playerid, p_garage[j][playerid], 80.000000, 4.000000);
			PlayerTextDrawAlignment(playerid, p_garage[j][playerid], 1);
			PlayerTextDrawColor(playerid, p_garage[j][playerid], -1061109505);
			PlayerTextDrawSetShadow(playerid, p_garage[j][playerid], 0);
			PlayerTextDrawSetOutline(playerid, p_garage[j][playerid], 0);
			PlayerTextDrawFont(playerid, p_garage[j][playerid], 4);

			++j;

			p_garage[j][playerid] = CreatePlayerTextDraw(playerid, 82+diff*i, 311+14*3, "LD_SPAC:white"); // status_bagazine
			PlayerTextDrawLetterSize(playerid, p_garage[j][playerid], 0.000000, 0.000000);
			PlayerTextDrawTextSize(playerid, p_garage[j][playerid], 80.000000, 4.000000);
			PlayerTextDrawAlignment(playerid, p_garage[j][playerid], 1);
			PlayerTextDrawColor(playerid, p_garage[j][playerid], -1061109505);
			PlayerTextDrawSetShadow(playerid, p_garage[j][playerid], 0);
			PlayerTextDrawSetOutline(playerid, p_garage[j][playerid], 0);
			PlayerTextDrawFont(playerid, p_garage[j][playerid], 4);

			++j;

		}

#undef start
#undef diff

		
		// Degalinės skaičiukai
		kuro_kaina2[pid] = CreatePlayerTextDraw( pid,  320.000000, 340.000000, "Kuras             Kaina~n~~n~~n~~n~");
		PlayerTextDrawAlignment( pid,kuro_kaina2[pid], 2);
		PlayerTextDrawBackgroundColor( pid, kuro_kaina2[pid], 255);
		PlayerTextDrawFont( pid, kuro_kaina2[pid], 2);
		PlayerTextDrawLetterSize( pid, kuro_kaina2[pid], 0.349999, 1.500000);
		PlayerTextDrawColor( pid,  kuro_kaina2[pid], -1);
		PlayerTextDrawSetOutline( pid, kuro_kaina2[pid], 0);
		PlayerTextDrawSetProportional( pid, kuro_kaina2[pid], 1);
		PlayerTextDrawSetShadow(pid, kuro_kaina2[pid], 1);
		PlayerTextDrawUseBox( pid, kuro_kaina2[pid], 1);
		PlayerTextDrawBoxColor( pid, kuro_kaina2[pid], 572662408);
		PlayerTextDrawTextSize( pid, kuro_kaina2[pid], 0.000000, 193.000000);

		kuro_kaina3[pid] = CreatePlayerTextDraw( pid,  403.000000, 361.000000, "0");
		PlayerTextDrawAlignment( pid,kuro_kaina3[pid], 2);
		PlayerTextDrawBackgroundColor( pid, kuro_kaina3[pid], -1);
		PlayerTextDrawFont( pid, kuro_kaina3[pid], 1);
		PlayerTextDrawLetterSize( pid, kuro_kaina3[pid], 0.500000, 2.500000);
		PlayerTextDrawColor( pid,  kuro_kaina3[pid], 255);
		PlayerTextDrawSetOutline( pid, kuro_kaina3[pid], 1);
		PlayerTextDrawSetProportional( pid, kuro_kaina3[pid], 1);
		PlayerTextDrawUseBox( pid, kuro_kaina3[pid], 1);
		PlayerTextDrawBoxColor( pid, kuro_kaina3[pid], 153);
		PlayerTextDrawTextSize( pid, kuro_kaina3[pid], 0.000000, 11.000000);

		kuro_kaina5[pid] = CreatePlayerTextDraw( pid,  253.000000, 361.000000, "0");
		PlayerTextDrawAlignment( pid,kuro_kaina5[pid], 2);
		PlayerTextDrawBackgroundColor( pid, kuro_kaina5[pid], -1);
		PlayerTextDrawFont( pid, kuro_kaina5[pid], 1);
		PlayerTextDrawLetterSize( pid, kuro_kaina5[pid], 0.500000, 2.500000);
		PlayerTextDrawColor( pid,  kuro_kaina5[pid], 255);
		PlayerTextDrawSetOutline( pid, kuro_kaina5[pid], 1);
		PlayerTextDrawSetProportional( pid, kuro_kaina5[pid], 1);
		PlayerTextDrawUseBox( pid, kuro_kaina5[pid], 1);
		PlayerTextDrawBoxColor( pid, kuro_kaina5[pid], 153);
		PlayerTextDrawTextSize( pid, kuro_kaina5[pid], 0.000000, 11.000000);

		kuro_kaina6[pid] = CreatePlayerTextDraw( pid,  270.000000, 361.000000, "0");
		PlayerTextDrawAlignment( pid,kuro_kaina6[pid], 2);
		PlayerTextDrawBackgroundColor( pid, kuro_kaina6[pid], -1);
		PlayerTextDrawFont( pid, kuro_kaina6[pid], 1);
		PlayerTextDrawLetterSize( pid, kuro_kaina6[pid], 0.500000, 2.500000);
		PlayerTextDrawColor( pid,  kuro_kaina6[pid], 255);
		PlayerTextDrawSetOutline( pid, kuro_kaina6[pid], 1);
		PlayerTextDrawSetProportional( pid, kuro_kaina6[pid], 1);
		PlayerTextDrawUseBox( pid, kuro_kaina6[pid], 1);
		PlayerTextDrawBoxColor( pid, kuro_kaina6[pid], 153);
		PlayerTextDrawTextSize( pid, kuro_kaina6[pid], 0.000000, 11.000000);

		kuro_kaina7[pid] = CreatePlayerTextDraw( pid,  287.000000, 361.000000, "0");
		PlayerTextDrawAlignment( pid,kuro_kaina7[pid], 2);
		PlayerTextDrawBackgroundColor( pid, kuro_kaina7[pid], -1);
		PlayerTextDrawFont( pid, kuro_kaina7[pid], 1);
		PlayerTextDrawLetterSize( pid, kuro_kaina7[pid], 0.500000, 2.500000);
		PlayerTextDrawColor( pid,  kuro_kaina7[pid], 255);
		PlayerTextDrawSetOutline( pid, kuro_kaina7[pid], 1);
		PlayerTextDrawSetProportional( pid, kuro_kaina7[pid], 1);
		PlayerTextDrawUseBox( pid, kuro_kaina7[pid], 1);
		PlayerTextDrawBoxColor( pid, kuro_kaina7[pid], 153);
		PlayerTextDrawTextSize( pid, kuro_kaina7[pid], 0.000000, 11.000000);

		kuro_kaina8[pid] = CreatePlayerTextDraw( pid,  368.000000, 361.000000, "0");
		PlayerTextDrawAlignment( pid,kuro_kaina8[pid], 2);
		PlayerTextDrawBackgroundColor( pid, kuro_kaina8[pid], -1);
		PlayerTextDrawFont( pid, kuro_kaina8[pid], 1);
		PlayerTextDrawLetterSize( pid, kuro_kaina8[pid], 0.500000, 2.500000);
		PlayerTextDrawColor( pid,  kuro_kaina8[pid], 255);
		PlayerTextDrawSetOutline( pid, kuro_kaina8[pid], 1);
		PlayerTextDrawSetProportional( pid, kuro_kaina8[pid], 1);
		PlayerTextDrawUseBox( pid, kuro_kaina8[pid], 1);
		PlayerTextDrawBoxColor( pid, kuro_kaina8[pid], 153);
		PlayerTextDrawTextSize( pid, kuro_kaina8[pid], 0.000000, 11.000000);

		kuro_kaina9[pid] = CreatePlayerTextDraw( pid,  386.000000, 361.000000, "0");
		PlayerTextDrawAlignment( pid,kuro_kaina9[pid], 2);
		PlayerTextDrawBackgroundColor( pid, kuro_kaina9[pid], -1);
		PlayerTextDrawFont( pid, kuro_kaina9[pid], 1);
		PlayerTextDrawLetterSize( pid, kuro_kaina9[pid], 0.500000, 2.500000);
		PlayerTextDrawColor( pid,  kuro_kaina9[pid], 255);
		PlayerTextDrawSetOutline( pid, kuro_kaina9[pid], 1);
		PlayerTextDrawSetProportional( pid, kuro_kaina9[pid], 1);
		PlayerTextDrawUseBox( pid, kuro_kaina9[pid], 1);
		PlayerTextDrawBoxColor( pid, kuro_kaina9[pid], 153);
		PlayerTextDrawTextSize( pid, kuro_kaina9[pid], 0.000000, 11.000000);

		kuro_kaina10[pid] = CreatePlayerTextDraw( pid,  351.000000, 361.000000, "0");
		PlayerTextDrawAlignment( pid,kuro_kaina10[pid], 2);
		PlayerTextDrawBackgroundColor( pid, kuro_kaina10[pid], -1);
		PlayerTextDrawFont( pid, kuro_kaina10[pid], 1);
		PlayerTextDrawLetterSize( pid, kuro_kaina10[pid], 0.500000, 2.500000);
		PlayerTextDrawColor( pid,  kuro_kaina10[pid], 255);
		PlayerTextDrawSetOutline( pid, kuro_kaina10[pid], 1);
		PlayerTextDrawSetProportional( pid, kuro_kaina10[pid], 1);
		PlayerTextDrawUseBox( pid, kuro_kaina10[pid], 1);
		PlayerTextDrawBoxColor( pid, kuro_kaina10[pid], 153);
		PlayerTextDrawTextSize( pid, kuro_kaina10[pid], 0.000000, 11.000000);

		kuro_kaina11[pid] = CreatePlayerTextDraw( pid,  334.000000, 361.000000, "$");
		PlayerTextDrawAlignment( pid,kuro_kaina11[pid], 2);
		PlayerTextDrawBackgroundColor( pid, kuro_kaina11[pid], -1);
		PlayerTextDrawFont( pid, kuro_kaina11[pid], 1);
		PlayerTextDrawLetterSize( pid, kuro_kaina11[pid], 0.500000, 2.500000);
		PlayerTextDrawColor( pid,  kuro_kaina11[pid], 255);
		PlayerTextDrawSetOutline( pid, kuro_kaina11[pid], 1);
		PlayerTextDrawSetProportional( pid, kuro_kaina11[pid], 1);
		PlayerTextDrawUseBox( pid, kuro_kaina11[pid], 1);
		PlayerTextDrawBoxColor( pid, kuro_kaina11[pid], 153);
		PlayerTextDrawTextSize( pid, kuro_kaina11[pid], 0.000000, 11.000000);

		printf("PLAYER TEXTDRAWS: %i", _:kuro_kaina11[pid]+1);
	}

stock destroy_textdraws(pid)
{
	for(new i = 0; i < 65; i++)
	{
		PlayerTextDrawDestroy(pid, iBag[pid][i]);
		iBag[pid][i] = PlayerText:INVALID_TEXT_DRAW;
	}
	for(new i; i < 37; i++)
	{
		PlayerTextDrawDestroy(pid, pTrunk[pid][0][i]);
		PlayerTextDrawDestroy(pid, pTrunk[pid][1][i]);
	}

	for(new i; i != 9; ++i)
	{
		PlayerTextDrawDestroy( pid, p_carShop[i][pid] );
	}
	
	PlayerTextDrawDestroy( pid, infoList[pid] );

	PlayerTextDrawDestroy( pid, Notification2[pid] );

	PlayerTextDrawDestroy( pid, dmg[0][playerid] );
	PlayerTextDrawDestroy( pid, dmg[1][playerid] );


	PlayerTextDrawDestroy( pid, pArea[pid] );

	for(new i; i != TAXI_MAX_SEATS; ++i)
	{
		PlayerTextDrawDestroy( pid, p_taxi_stats[i][playerid] );
	}

	for(new i; i < 3; ++i)
	{
		PlayerTextDrawDestroy( pid, p_stats[i][playerid]);
	}
	for(new i; i != 23; ++i)
	{
		PlayerTextDrawDestroy( pid, p_garage[i][pid] );
	}

	PlayerTextDrawDestroy( pid, p_gangzone[playerid] );
	PlayerTextDrawDestroy( pid, p_tip_show[playerid] );
	PlayerTextDrawDestroy( pid, p_tip[0][playerid] );
	PlayerTextDrawDestroy( pid, p_tip[1][playerid] );

	DestroyPlayerProgressBar(pid, get.BagTalpa[pid]);
	DestroyPlayerProgressBar(pid, get.bar_zvejyba[pid]);

	PlayerTextDrawDestroy( pid, logo[pid] );
	PlayerTextDrawDestroy( pid, firstptd[pid] );
    
    PlayerTextDrawDestroy( pid, Notification0[pid]);
	Notification0[pid] = PlayerText:INVALID_TEXT_DRAW;
	PlayerTextDrawDestroy( pid, Notification1[pid]);
	Notification1[pid] = PlayerText:INVALID_TEXT_DRAW;

	for(new i; i < 12; ++i)
		PlayerTextDrawDestroy( pid, pmenu[i][pid] );

	PlayerTextDrawDestroy( pid, kuro_kaina2[pid]);
	PlayerTextDrawDestroy( pid, kuro_kaina3[pid]);
	PlayerTextDrawDestroy( pid, kuro_kaina5[pid]);
	PlayerTextDrawDestroy( pid, kuro_kaina6[pid]);
	PlayerTextDrawDestroy( pid, kuro_kaina7[pid]);
	PlayerTextDrawDestroy( pid, kuro_kaina8[pid]);
	PlayerTextDrawDestroy( pid, kuro_kaina9[pid]);
	PlayerTextDrawDestroy( pid, kuro_kaina10[pid]);
	PlayerTextDrawDestroy( pid, kuro_kaina11[pid]);
}