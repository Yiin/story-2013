/*









							Story of Cities

								MAIN








*/

/*
	Viskas prasidëjo:  Monday, August 13, 2012 9:29 AM
	à,è,æ,ë,á,ð,ø,û,þ
	À,È,Æ,Ë,Á,Ð,Ø,Û,Þ

	Su pakvietimu:
		Medikai
		Taxi
		Mechanikai
		Serifas
		Gaisrininkai
		Furistai

	Be pakvietimo:
		Statybininkai
		Valytojai
		Pastininkai

		TODO:

		pabaigti mechanikus (maðinø tune, direktoriaus valdymo meniu), 
		gaisrininkus (direktoriaus valdymo meniu), 
		taxi (direktoriaus valdymo meniu), fûristus (prekiø paëmimas, 
		iðveþiojimas, direktoriaus valdymo meniu), ásidarbinimà á darbus 
		be pakvietimo, padaryti darbus be pakvietimo (picerininkus, 
		laiðkaneðius (gal, nþn ar jie bus 100%), statybininkus.
		nu ir dar mafijas


		Story of Cities - tai savotiðkiausias SA:MP projektas, kuriame þaidþia tik patys geriausi ir 
		iððûkius mëgstantys þmonës. Tai virtuali realybë, kuri leidþia pasijusti lyg gyvenant antrà kartà 
		malonumø kupiname pasaulyje. Èia vieta, kurioje gali pats susikurti sau nuotaikià tokià, kokios nori. 
		Poilsis, pramogos, draugai, konfliktai ir viskas, kà sugebësi sugalvoti tik èia, ribø neturinèiame 
		Story of Cities pasaulyje. Miestø dulkës jau sëda, judesys jau randasi bei laukia naujos gyvybës. 
		Jei tu esi tas, kuris ruoðiasi kaþkà nuveikti, tada niekas tau to sutrukdyti negali, nes tavo kelio 
		pradþia jau laukia þengianèio tavæs á nuostabøjá Story of Cities pasaulá! 


		// Technikinë.
		SetPlayerCameraPos(playerid, 111.273925,-168.333984,2368.414794);
		SetPlayerCameraLookAt(playerid, 102.307380,-164.593231,2366.046630);
		SetVehiclePos(vehicleid, 106.0853,-166.7648,2366.8882);
		SetVehicleZAngle(vehicleid, 90.6065);


		// tune 
		SetVehiclePos(vehicleid, 104.6220,-149.9780,2367.5825);
		SetVehicleZAngle(vehicleid, 91.1186);

		// tune.ratai
		SetPlayerCameraPos(playerid, 101.426483,-147.339599,2367.898681);
		SetPlayerCameraLookAt(playerid, 107.937255,-154.609710,2365.718017);

		// tune.priekinis_bamperis
		SetPlayerCameraPos(playerid, 100.420532,-148.681457,2367.898681);
		SetPlayerCameraLookAt(playerid, 108.768081,-153.578552,2365.381347);

		// tune.galinis_bamperis
		SetPlayerCameraPos(playerid, 108.893196,-147.704742,2368.383056);
		SetPlayerCameraLookAt(playerid, 100.920127,-153.206542,2365.901123);

		// tune.soninis_bamperis
		SetPlayerCameraPos(playerid, 104.630210,-152.525390,2367.883056);
		SetPlayerCameraLookAt(playerid, 104.522102,-142.710678,2365.969970);

		// tune.duslintuvas
		SetPlayerCameraPos(playerid, 107.960357,-148.022888,2367.030273);
		SetPlayerCameraLookAt(playerid, 102.264007,-156.182006,2368.020507);

		// tune.stogas
		SetPlayerCameraPos(playerid, 102.583244,-151.562927,2369.206787);
		SetPlayerCameraLookAt(playerid, 110.623611,-146.653030,2365.853271);
*/
native WP_Hash(buffer[], len, const str[]);

#include <soc_includes>

#include "junk.soc"
#include "notice_board.soc"
#include "sockets.soc"
#include "commands.soc"
#include "gang.soc"
#include "inventory.soc"
#include "storage.soc"
#include "npcs.soc"
#include "vehicles.soc"
#include "crafting.soc"
#include "player.soc"
#include "quests.soc"
// darbai
#include "job_furistai.soc"
#include "job_serifas.soc"

main()
{
	//print(f("\n\n\n\n\n\n\n\n\n\n\n\n\x\x---:: Story of %s: Pradþia | by %s\n\n\n\n\n\n\n\n\n\n\n\n", "Cities", "Yiin"));
	AddServerRule("• Scripteris", "Yiin");
	AddServerRule(" Maperis", "mTevas");
	AddServerRule(" Maperis ", "Compadre_Estebano");
	SetServerRule("version", "52");
	SetServerRule("gravity", "Default");
	SetServerRule("weather", "Debesuota");
	
	return 1;
}

Callback::OnGameModeInit()
{
	sql_debug( true );
	sqlHandle = sql_connect( SQL_HANDLER_MYSQL,MySQL_HOST,MySQL_USER,MySQL_PASS,MySQL_DATA );
	if( ! sql_ping( sqlHandle ) )	print( " ---:: MySQL" );
	else									print( "MYSQL ERROR" );

	servcon_load();

	print( " ---:: Init default variables" );
	{
		AddPlayerClass(17, 0, 0,0,4096,0,0,0,0,0,0);
		DisableInteriorEnterExits();
		UsePlayerPedAnims();
		EnableStuntBonusForAll(0);
		ShowPlayerMarkers(2);


		npc[gun_dealer] = INVALID_PLAYER_ID;
		aGarazas[eRepairVehicle] = INVALID_VEHICLE_ID;

		//ChangeOPCNIURate(300);
		for(new i = 0; i < MAX_PLAYERS; ++i)
		{
			pTemp[i][socket] = -1;
			for(new j; j < MAX_DOTS; ++j)
				Routes[i][j] = -1;
			pTemp[i][gps_dest_node] = -1;
		}

		for(new i; i < MAX_VEHICLES; ++i)
			car[i][car_id] = INVALID_VEHICLE_ID;

		for(new i; i < MAX_FIRES; ++i)
			for(new j; j < 5; j++)
				fire[i][j] = -1;
	}

	print( " ---:: Textdrawai" );
	{
		TextDrawai();
	}
	
	print( " ---:: Pickup'ai" );
	{

	}

	print( " ---:: Taimeriai" );
	{
		SetTimer("CheckPaused",3000, true);
		SetTimer("UpdateDealer", 1000*60*20, true);
	}

	print( " ---:: Maðinos" );
	{
		// Maðinos (cars)
		Iter_Init(masinos);
		
		// SetDynamicObjectMaterialText(oldwood_carname[i],0,IntToStr(i), OBJECT_MATERIAL_SIZE_256x128,"Impact",72,1,0xFFFFFFFF,0,OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
		// Maðinos dël vaizdo

		//LoadHousesInt();

		// Darbinës maðinos
		// Mechanikø
		createVehicle(562, 10000, 10000, 10000, 0, 0, 0, 0, 0, "lol");
/*
		Iter_Add(masinos[0],createVehicle(CAR_MECHANIKU, 92.3318,-158.0180,1.4535,178.0278, -1, -1, 1000, fuel(CAR_MECHANIKU),"MECH:01",-1, MECHANIKAS));
		Iter_Add(masinos[0],createVehicle(CAR_MECHANIKU, 92.3806,-168.1444,1.4469,180.4267, -1, -1, 1000, fuel(CAR_MECHANIKU),"MECH:02",-1, MECHANIKAS));
		Iter_Add(masinos[0],createVehicle(CAR_MECHANIKU, 92.0870,-178.5368,1.4579,179.5699, -1, -1, 1000, fuel(CAR_MECHANIKU),"MECH:03",-1, MECHANIKAS));
		Iter_Add(masinos[0],createVehicle(CAR_MECHANIKU, 92.0873,-188.3259,1.4572,177.7576, -1, -1, 1000, fuel(CAR_MECHANIKU),"MECH:04",-1, MECHANIKAS));
		Iter_Add(masinos[0],createVehicle(CAR_MECHANIKU, 80.8979,-188.8328,1.4494,183.1071, -1, -1, 1000, fuel(CAR_MECHANIKU),"MECH:05",-1, MECHANIKAS));
		Iter_Add(masinos[0],createVehicle(CAR_MECHANIKU, 80.6472,-178.7098,1.4540,180.3370, -1, -1, 1000, fuel(CAR_MECHANIKU),"MECH:06",-1, MECHANIKAS));
		Iter_Add(masinos[0],createVehicle(CAR_MECHANIKU, 80.7633,-168.9300,1.4441,180.1956, -1, -1, 1000, fuel(CAR_MECHANIKU),"MECH:07",-1, MECHANIKAS));
		Iter_Add(masinos[0],createVehicle(CAR_MECHANIKU, 80.7801,-158.5687,1.4557,181.4787, -1, -1, 1000, fuel(CAR_MECHANIKU),"MECH:08",-1, MECHANIKAS));
		// PD
		Iter_Add(masinos[1],createVehicle(CAR_PD, 627.9104, -549.3063, 16.2386, 90.0000, 1, 1, 1000, fuel(CAR_PD),"PD:01",-1, PD));
		Iter_Add(masinos[1],createVehicle(CAR_PD, 627.9104, -545.3784, 16.2386, 90.0000, 1, 1, 1000, fuel(CAR_PD),"PD:02",-1, PD));
		Iter_Add(masinos[1],createVehicle(CAR_PD, 627.9104, -561.2737, 16.2386, 90.0000, 1, 1, 1000, fuel(CAR_PD),"PD:03",-1, PD));
		Iter_Add(masinos[1],createVehicle(CAR_PD, 627.9104, -553.2798, 16.2386, 90.0000, 1, 1, 1000, fuel(CAR_PD),"PD:04",-1, PD));
		Iter_Add(masinos[1],createVehicle(CAR_PD, 627.9104, -557.4053, 16.2386, 90.0000, 1, 1, 1000, fuel(CAR_PD),"PD:05",-1, PD));
		// Medikø
		Iter_Add(masinos[2],createVehicle(CAR_MEDIKU, 1270.2308,281.6114,19.4608,156.1067, -1, -1, 1000, fuel(CAR_MEDIKU),"MED:01",-1, MEDIKAS));
		Iter_Add(masinos[2],createVehicle(CAR_MEDIKU, 1274.0781,279.9264,19.4613,155.7564, -1, -1, 1000, fuel(CAR_MEDIKU),"MED:02",-1, MEDIKAS));
		Iter_Add(masinos[2],createVehicle(CAR_MEDIKU, 1277.9229,278.2418,19.4610,156.1559, -1, -1, 1000, fuel(CAR_MEDIKU),"MED:03",-1, MEDIKAS));
		Iter_Add(masinos[2],createVehicle(CAR_MEDIKU, 1281.9733,276.5561,19.4611,156.3335, -1, -1, 1000, fuel(CAR_MEDIKU),"MED:04",-1, MEDIKAS));
		Iter_Add(masinos[2],createVehicle(CAR_MEDIKU, 1285.9362,274.9818,19.4610,157.0959, -1, -1, 1000, fuel(CAR_MEDIKU),"MED:05",-1, MEDIKAS));
		// Taxi
		Iter_Add(masinos[3],createVehicle(CAR_TAXI, 2279.9417, -60.1436, 26.2009, 90.0000, -1, -1, 1000, fuel(CAR_TAXI),"TAXI:01",-1, TAXI));
		Iter_Add(masinos[3],createVehicle(CAR_TAXI, 2271.9417, -60.1436, 26.2009, 90.0000, -1, -1, 1000, fuel(CAR_TAXI),"TAXI:02",-1, TAXI));
		Iter_Add(masinos[3],createVehicle(CAR_TAXI, 2263.9417, -60.1436, 26.2009, 90.0000, -1, -1, 1000, fuel(CAR_TAXI),"TAXI:03",-1, TAXI));
		Iter_Add(masinos[3],createVehicle(CAR_TAXI, 2255.9417, -60.1436, 26.2009, 90.0000, -1, -1, 1000, fuel(CAR_TAXI),"TAXI:04",-1, TAXI));
		Iter_Add(masinos[3],createVehicle(CAR_TAXI, 2255.9417, -41.3660, 26.2009, 90.0000, -1, -1, 1000, fuel(CAR_TAXI),"TAXI:05",-1, TAXI));
		Iter_Add(masinos[3],createVehicle(CAR_TAXI, 2263.9417, -41.3660, 26.2009, 90.0000, -1, -1, 1000, fuel(CAR_TAXI),"TAXI:06",-1, TAXI));
		Iter_Add(masinos[3],createVehicle(CAR_TAXI, 2271.9417, -41.3660, 26.2009, 90.0000, -1, -1, 1000, fuel(CAR_TAXI),"TAXI:07",-1, TAXI));
		Iter_Add(masinos[3],createVehicle(CAR_TAXI, 2279.9417, -41.3660, 26.2009, 90.0000, -1, -1, 1000, fuel(CAR_TAXI),"TAXI:08",-1, TAXI));
		// Gaisrinë
		Iter_Add(masinos[4],createVehicle(CAR_GAISRINE, 790.1470, -609.3479, 16.6156, 180.0000, -1, -1, 1000, fuel(CAR_GAISRINE),"FIRE:01",-1, GAISRININKAS));
		Iter_Add(masinos[4],createVehicle(CAR_GAISRINE, 830.0048, -609.3479, 16.6156, 180.0000, -1, -1, 1000, fuel(CAR_GAISRINE),"FIRE:02",-1, GAISRININKAS));
		Iter_Add(masinos[4],createVehicle(CAR_GAISRINE, 825.0118, -609.3479, 16.6156, 180.0000, -1, -1, 1000, fuel(CAR_GAISRINE),"FIRE:03",-1, GAISRININKAS));
		Iter_Add(masinos[4],createVehicle(CAR_GAISRINE, 820.0944, -609.3479, 16.6156, 180.0000, -1, -1, 1000, fuel(CAR_GAISRINE),"FIRE:04",-1, GAISRININKAS));
		Iter_Add(masinos[4],createVehicle(CAR_GAISRINE, 797.5569, -609.3479, 16.6156, 180.0000, -1, -1, 1000, fuel(CAR_GAISRINE),"FIRE:05",-1, GAISRININKAS));
			// interjere
		Iter_Add(masinos[4],createVehicle(CAR_GAISRINE, 809.55371, -621.40234, 5002.14892, 180.0000, -1, -1, 1000, fuel(CAR_GAISRINE),"FIRE:06",-1, GAISRININKAS));
		Iter_Add(masinos[4],createVehicle(CAR_GAISRINE, 803.24316, -621.40234, 5002.14892, 180.0000, -1, -1, 1000, fuel(CAR_GAISRINE),"FIRE:07",-1, GAISRININKAS));
		Iter_Add(masinos[4],createVehicle(CAR_GAISRINE, 796.93554, -621.40234, 5002.14892, 180.0000, -1, -1, 1000, fuel(CAR_GAISRINE),"FIRE:08",-1, GAISRININKAS));
		// Valytojø
		Iter_Add(masinos[5],createVehicle(CAR_VALYTOJAI, 1267.6448, 390.8228, 19.2810, 426.4900, -1, -1, 100, fuel(CAR_VALYTOJAI),"WASH:01",-1, VALYTOJAS));
		Iter_Add(masinos[5],createVehicle(CAR_VALYTOJAI, 1254.0431, 388.9535, 19.2810, 246.4900, -1, -1, 100, fuel(CAR_VALYTOJAI),"WASH:02",-1, VALYTOJAS));
		Iter_Add(masinos[5],createVehicle(CAR_VALYTOJAI, 1255.5820, 392.7734, 19.2810, 246.4900, -1, -1, 100, fuel(CAR_VALYTOJAI),"WASH:03",-1, VALYTOJAS));
		Iter_Add(masinos[5],createVehicle(CAR_VALYTOJAI, 1257.3704, 396.7862, 19.2810, 246.4900, -1, -1, 100, fuel(CAR_VALYTOJAI),"WASH:04",-1, VALYTOJAS));
		Iter_Add(masinos[5],createVehicle(CAR_VALYTOJAI, 1261.0146, 375.1584, 19.2810, 426.4900, -1, -1, 100, fuel(CAR_VALYTOJAI),"WASH:05",-1, VALYTOJAS));
		Iter_Add(masinos[5],createVehicle(CAR_VALYTOJAI, 1266.0344, 387.0244, 19.2810, 426.4900, -1, -1, 100, fuel(CAR_VALYTOJAI),"WASH:06",-1, VALYTOJAS));
		Iter_Add(masinos[5],createVehicle(CAR_VALYTOJAI, 1264.3654, 382.9994, 19.2810, 426.4900, -1, -1, 100, fuel(CAR_VALYTOJAI),"WASH:07",-1, VALYTOJAS));
		Iter_Add(masinos[5],createVehicle(CAR_VALYTOJAI, 1262.7128, 379.1866, 19.2810, 426.4900, -1, -1, 100, fuel(CAR_VALYTOJAI),"WASH:08",-1, VALYTOJAS));
		// Fûristø
		Iter_Add(masinos[6],createVehicle(CAR_FURA, 131.9479, -55.2239, 3.1126, 0.0000, -1, -1, 100, fuel(CAR_FURA),"FURA:01",-1, FURISTAS));
		Iter_Add(masinos[6],createVehicle(CAR_FURA, 137.8000, -55.2239, 3.1126, 0.0000, -1, -1, 100, fuel(CAR_FURA),"FURA:02",-1, FURISTAS));
		Iter_Add(masinos[6],createVehicle(CAR_FURA, 142.4000, -55.2239, 3.1126, 0.0000, -1, -1, 100, fuel(CAR_FURA),"FURA:03",-1, FURISTAS));
		Iter_Add(masinos[6],createVehicle(CAR_FURA, 148.2000, -55.2239, 3.1126, 0.0000, -1, -1, 100, fuel(CAR_FURA),"FURA:04",-1, FURISTAS));
		Iter_Add(masinos[6],createVehicle(CAR_FURA, 152.8000, -55.2239, 3.1126, 0.0000, -1, -1, 100, fuel(CAR_FURA),"FURA:05",-1, FURISTAS));
		Iter_Add(masinos[6],createVehicle(CAR_FURA, 158.6000, -55.2239, 3.1126, 0.0000, -1, -1, 100, fuel(CAR_FURA),"FURA:06",-1, FURISTAS));
		Iter_Add(masinos[6],createVehicle(CAR_FURA, 163.0000, -55.2239, 3.1126, 0.0000, -1, -1, 100, fuel(CAR_FURA),"FURA:07",-1, FURISTAS));
		Iter_Add(masinos[6],createVehicle(CAR_FURA, 168.9000, -55.2239, 3.1126, 0.0000, -1, -1, 100, fuel(CAR_FURA),"FURA:08",-1, FURISTAS));
		// maþesnës
		Iter_Add(masinos[7],createVehicle(CAR_KROVINIAMS, 216.6741, -7.1588, 2.6648, 90.0000, -1, -1, 100, fuel(CAR_KROVINIAMS),"KROV:01",-1, FURISTAS));
		Iter_Add(masinos[7],createVehicle(CAR_KROVINIAMS, 216.6741, -3.1588, 2.6648, 90.0000, -1, -1, 100, fuel(CAR_KROVINIAMS),"KROV:02",-1, FURISTAS));
		Iter_Add(masinos[7],createVehicle(CAR_KROVINIAMS, 216.6741, 0.8990, 2.6648, 90.0000, -1, -1, 100, fuel(CAR_KROVINIAMS),"KROV:03",-1, FURISTAS));
		Iter_Add(masinos[7],createVehicle(CAR_KROVINIAMS, 216.6741, 4.8990, 2.6648, 90.0000, -1, -1, 100, fuel(CAR_KROVINIAMS),"KROV:04",-1, FURISTAS));
		Iter_Add(masinos[7],createVehicle(CAR_KROVINIAMS, 216.6741, 8.8990, 2.6648, 90.0000, -1, -1, 100, fuel(CAR_KROVINIAMS),"KROV:05",-1, FURISTAS));
		Iter_Add(masinos[7],createVehicle(CAR_KROVINIAMS, 216.6741, 12.8990, 2.6648, 90.0000, -1, -1, 100, fuel(CAR_KROVINIAMS),"KROV:06",-1, FURISTAS));
		*/
	}

	print( " ---:: Vietos (Areas)" );
	{
		for(new i; i != sizeof fishingspot; ++i)
			area[fishing_area][i] = CreateDynamicCircle(fishingspot[i][0],fishingspot[i][1], 30);
		
		area[miestas1] = CreateDynamicRectangle(2162.109, -175.7813, 2572.266, 246.0938);
		area[miestas2] = CreateDynamicRectangle(1154.297, 105.4688, 1482.422, 451.1719);
		area[miestas3] = CreateDynamicRectangle(562.5, -679.6875, 849.6094, -410.1563);
		area[miestas4] = CreateDynamicRectangle(82.03125, -304.6875, 392.5781, 46.875);

		area[arGarage] = CreateDynamicSphere(pos_garazas, 5);

		//area[medikai_in1] = CreateDynamicSphere(pos_medikai_in1,5); // mediku iejimas pagrindinis

		area[mech_tune] = CreateDynamicSphere(pos_mech_tune, 4);
		area[mech_repair] = CreateDynamicSphere(pos_mech_taisykla, 4);
		area[mech_tech] = CreateDynamicSphere(pos_mech_technikine, 4);

		createEntry(pos_medikai_in, 5, IEJIMAS); // mediku iejimas medikams
		createEntry(pos_medikai_out,5, ISEJIMAS); // mediku isejimas

		createEntry(pos_oldwood_in, 2, IEJIMAS); // oldwood iejimas
		createEntry(pos_oldwood_out,3, ISEJIMAS); // oldwood iðëjimas

		createEntry(pos_akra_in, 	3, IEJIMAS); // akra áëjimas
		createEntry(pos_akra_out, 	6, ISEJIMAS); // akra iðëjimas

		createEntry(pos_mech_in, 	3, IEJIMAS); // mechanikai áëjimas
		createEntry(pos_mech_out, 	3, ISEJIMAS); // mechanikai iðëjimas

		createEntry(pos_pd_in, 		3, IEJIMAS); // mentø áëjimas
		createEntry(pos_pd_out,	 	3, ISEJIMAS); // mentø iðëjimas

		createEntry(pos_taxi_in, 	3, IEJIMAS); // taxi áëjimas
		createEntry(pos_taxi_out, 	3, ISEJIMAS); // taxi iðëjimas

		area[spawn_shop_area] = CreateDynamicSphere(692.5636,-436.1428,10.1359, 5);

		Create3DTextLabel("Kà èia tikiesi pamatyti?",0xecad3ecc,0,0,0,0,0,0);
		Create3DTextLabel("Persirengimas", 0x0090ffFF, pos_medikai_persirengimas,7,0,0);
		Create3DTextLabel("Ásidarbinimas", 0x0090ffFF, pos_medikai_isidarbinimas,7,0,0);
		Create3DTextLabel("Daiktø spintelë", 0x0090ffFF, pos_medikai_daiktai,7,0,0);
		Create3DTextLabel("Persirengimas", COLOR_SOC, pos_mech_persirengimas,7,0,0);
		Create3DTextLabel("Ásidarbinimas", COLOR_SOC, pos_mech_isidarbinimas,7,0,0);
		Create3DTextLabel("Árankiai", COLOR_SOC, pos_mech_daiktai, 7,0,0);
		Create3DTextLabel("Tune parduotuvë", COLOR_SOC, pos_mech_tuneshop, 7,0,0);
	}

	print( " ---:: NPC" );				ConnectNPCs();
	print( " ---:: Objectai" );		LoadObjects();
	print( " ---:: Parduotuvës" );	LoadShops();
	print( " ---:: Gaujos" );			LoadGangs();
	print( " ---:: Darbai" );			LoadJobs();

	NOTICE_BOARD::Init();

	new A[50];
	new B[] = "te'%''\'st";
	sql_escape_string(sqlHandle, B, B);
	strcpy(A, B);
	print(A);
	resetMySQL();

	print( " ---:: story pakrautas" );
	return 1;
}

func resetMySQL()
{
	new y,m,d, tm <t>;

	getdate(y,m,d);

	t[tm_mday] = d;
	t[tm_mon] = m - 1;
	t[tm_year] = y - 1900;
    
	mktime(t);

	// 1 2 3 4 5 6 7

	sql_query(sqlHandle, F("UPDATE zaidejai SET t_today = 0, v_today = 0, v2_today = 0 WHERE last_logout != '%i %i %i'", y,m,d), QUERY_THREADED);
	if(!t[tm_wday])
		sql_query(sqlHandle,   "UPDATE zaidejai SET t_week = 0, v_week = 0, v2_week = 0 WHERE 1", QUERY_THREADED);
	if(!((_:(t[tm_wday]) + _:1) % 2))
	{
		for(new i = 1; i != DARBAI; ++i)
		{
			darbai[i][dFondas] += darbai[i][dAktyvumas] * 2;
			darbai[i][dAktyvumas] = 0;
		}
		sql_query(sqlHandle, "UPDATE darbai SET aktyvumas = 0 WHERE 1", QUERY_THREADED);
	}
}

func LoadJobs()
{
	new const Result:r = sql_query(sqlHandle, "SELECT * FROM darbai WHERE 1", QUERY_CACHED);

	if(sql_num_rows(r)) do
	{
		new const id = sql_get_field_assoc_int(r, "id");
		darbai[id][dFondas] = sql_get_field_assoc_int(r, "fondas");
		darbai[id][dPatirtis] = sql_get_field_assoc_int(r, "patirtis");
		darbai[id][dAktyvumas] = sql_get_field_assoc_int(r, "aktyvumas");

		static array[30][50];
		sql_get_field_assoc(r, "rangai", gt);
		sscanf(gt, "p<|>a<s[50]>[30]", array);
		for( new i ; i != 30 ; ++i )
		{
			sscanf(array[i], "p</>e<s[24]ii>", rangai[id][i]);
		}
		new const Result:v = sql_query(sqlHandle, F("SELECT id FROM masinos WHERE tipas = %i", id), QUERY_CACHED);
		if(sql_num_rows(v)) do
		{
			LoadVehicle(sql_get_field_assoc_int(v, "id"));

		} while (sql_next_row(v));
	} 
	while (sql_next_row(r));
}

func SaveJobs()
{
	for(new i = 1; i < DARBAI; ++i)
	{
		sql_query(sqlHandle, 
		F("UPDATE darbai SET fondas = %i, patirtis = %i, aktyvumas = %i WHERE id = %i", darbai[i][dFondas],darbai[i][dPatirtis],darbai[i][dAktyvumas],i), 
		QUERY_NONE);

		static buffer[900];
		buffer[0] = EOS;
		for(new j; j != 30; ++j)
		{
			strcat(buffer, f("%s/%i/%i|", rangai[i][j][r_name], rangai[i][j][r_skin_m], rangai[i][j][r_skin_v]));
		}
		sql_query(sqlHandle, F("UPDATE darbai SET rangai = '%s' WHERE id = %i", buffer, i), QUERY_NONE);
	}
	for(new j; j != MAX_VEHICLES; ++j)
	{
		if(car[j][car_tipas] > 0 && car[j][car_tipas] < DARBU_COUNT)
		{
			SaveVehicle(j, QUERY_NONE, .isJobVehicle = true);
		}
	}
}

func LoadGangs()
{
	new const Result:r = sql_query(sqlHandle, "SELECT * FROM gaujos WHERE 1", QUERY_CACHED);

	if(sql_num_rows(r)) do
	{
		new const id = sql_get_field_assoc_int(r, "id");
		vset.g_kill_count[id] = sql_get_field_assoc_int(r, "g_kill_count");
		vset.g_wins[id] = sql_get_field_assoc_int(r, "g_wins");
		vset.g_losses[id] = sql_get_field_assoc_int(r, "g_losses");
	}
	while(sql_next_row(r));
}

func LoadObjects()
{
	new const Result:r = sql_query(sqlHandle, "SELECT * FROM objektai WHERE 1", QUERY_CACHED);


	CreateObject(7586, 257.94058, -249.33295, -5.73620,   0.00000, 0.00000, 0.00000);
	pd_vartai = CreateDynamicObject(989, 632.9222, -581.4429, 17.1822, 0, 0, 16.8270);

	for(new i; i < sizeof medziai; ++i)
	{
		objects[gTree(i)][obj_id] = CreateDynamicObject(MEDIS, medziai[i][mX], medziai[i][mY], medziai[i][mZ]-1, 0, 0, medziai[i][mRX]);
		objects[gTree(i)][obj_other_ids][obj_area_id] = CreateDynamicSphere(medziai[i][mX], medziai[i][mY], medziai[i][mZ], 4);
		object.flag.on(gTree(i), fIsActive);
		objects[gTree(i)][obj_other_info][obj_counting] = 300;
	}

	new const rows = sql_num_rows(r);

	new gTag_i;
	for(new i; i != rows; ++i, sql_next_row(r))
	{
		static buffer[64];
		
		sql_get_field_assoc(r, "pos", buffer);
		extract buffer -> new Float:_x1,Float:_y1,Float:_z1,Float:_x2,Float:_y2,Float:_z2;

		switch(sql_get_field_assoc_int(r, "tipas"))
		{
			case OBJ_GANG_TAG:
			{
				objects[gTag(gTag_i)][obj_id] = CreateDynamicObject(

					sql_get_field_assoc_int(r, "modelis"), 
					coords<1>, 
					coords<2>
				);

				objects[gTag(gTag_i)][obj_dbid] = sql_get_field_assoc_int(r, "id");
				objects[gTag(gTag_i)][obj_flags] = e_obj:sql_get_field_assoc_int(r, "flags");
				
				sql_get_field_assoc(r, "data", buffer);

				extract buffer -> new id1, id2, influence, upgrade;
				objects[gTag(gTag_i)][obj_other_ids][obj_gang_id] = id1;
				objects[gTag(gTag_i)][obj_other_ids][obj_player_id] = id2;
				objects[gTag(gTag_i)][obj_other_info][obj_gang_influence] = influence;
				objects[gTag(gTag_i)][obj_upgrade] = e_obj_upgrade:upgrade;

				if( object.flag.get(gTag(gTag_i), fIsActive) )
				{
					new const Result:r1 = sql_query(sqlHandle, F("SELECT gauja_name FROM zaidejai WHERE id = %i", objects[gTag(gTag_i)][obj_other_ids][obj_gang_id]), QUERY_CACHED);
					sql_get_field_assoc(r1, "gauja_name", buffer);
					objects[gTag(gTag_i)][obj_other_ids][obj_text_id] = Create3DTextLabel(F("Teritorijà valdo '%s'", buffer), COLOR_SOC, coords<1>, 20, 0, 0);
					objects[gTag(gTag_i)][obj_other_ids][obj_area_id] = CreateDynamicCircle(_x1,_y1,50);

				} else {

					objects[gTag(gTag_i)][obj_other_ids][obj_text_id] = Create3DTextLabel("Teritorija neuþimta", COLOR_SOC, coords<1>, 20, 0, 0);
				}

				gTag_i++;
				gTag_count++;
			}
		}
	}
	printf("     - %i", CountDynamicObjects());
}

func SaveObjects()
{
	for(new i; i < gTag_count; ++i)
	{
		sql_query(sqlHandle, F("UPDATE objektai SET flags = %i, data = '%i %i %i %i' WHERE id = %i", _:objects[gTag(i)][obj_flags], objects[gTag(i)][obj_other_ids][obj_gang_id], objects[gTag(i)][obj_other_ids][obj_player_id], objects[gTag(i)][obj_other_info][obj_gang_influence], objects[gTag(i)][obj_dbid], objects[gTag(i)][obj_upgrade]), QUERY_NONE);
	}
}


Callback::OnGameModeExit()
{
	DOF2_Exit();
	SaveObjects();
	SaveJobs();
	for (new i = 0; i < MAX_PLAYERS; ++i)
	{
		if(IsPlayerConnected(i) && player.bool.get(i, bPrisijunges))
		{
			set.gmexit[i] = 1;
			PLAYER::Save(i);
		}
	}

	sql_disconnect( sqlHandle );
	return 1;
}

Callback::OnPlayerRequestClass(pid, classid)
{
	if( IsPlayerNPC(pid) ) return 1;
	//if( player.bool.get(pid,bPrisijunges)) return 1;

	if(player.bool.get(pid,bUzsiregistravo))
	{
		printf("( STORY ) Þaidëjas prisiregistravo. (%s)", GetPlayerNameEx(pid));
		pinfo[skin] = SKIN_NEWBIE;
		SetSpawnInfo(pid, 1,pinfo[skin],694.4459,-465.0982,5.7520, 7.3087,0,0,0,0,0,0);
		SpawnPlayer(pid);

	} else {

		printf("( STORY ) Þaidëjas ákrautas. (%s)", GetPlayerNameEx(pid));
		SetPlayerVirtualWorld(pid, VW_DEFAULT);
		SetSpawnInfo(pid, 1, PLAYER::ReturnSkin(pid) ,fget.spawn_x[pid],fget.spawn_y[pid],fget.spawn_z[pid],0,0,0,0,0,0,0);
		del.spawn_x[pid];
		del.spawn_y[pid];
		del.spawn_z[pid];
		SpawnPlayer(pid);
	}

	return 1;
}

//--------------------------------------------------

Callback::OnPlayerConnect(pid)
{
	if( IsPlayerNPC(pid) )
	{
		return 1;
	}
	new ip[16];
	GetPlayerIp(pid,ip,16);
	map_insert(MAP_IP, ip, pid);
	playerIP[pid] = ip;

	TogglePlayerSpectating(pid, true);
	wiper(pid);
	SetPlayerColor(pid, PlayerColors[pid]);
	GPS::AddPlayer(pid);
	
	TogglePlayerClock(pid, 0);

	////DisablePlayerOPIDC(pid);
	resetPlayerVariables(pid);

	SetPlayerVirtualWorld(pid, random(500)+65536);

	//TextDraw'ai
	pTextDrawai(pid);
	set.BagTalpa[pid] = CreatePlayerProgressBar(pid,205.00, 362.00, 237.50, 1.50, 2004318207, 30000.0);
	//set.bar_zvejyba = CreatePlayerProgressBar(pid,264.00, 414.00, 100.50, 1.50, -979146241, 100.0);
	meniu(pid);

	SetPlayerWeather(pid, 0);

	new success;
	foreach(new i : Player)
	{
		if(IsPlayerSpawned(i) && player.bool.get(i,bPrisijunges))
		{
			if(IsPlayerInAnyVehicle(i))
				PlayerSpectateVehicle(pid, GetPlayerVehicleID(i));
			else
				PlayerSpectatePlayer(pid, i);

			++success;

			break;
		}
	}
	if( ! success )
	{
		static Float:CCamPos[7][2][3] = {

		  {{233.837921,-498.035156,44.880439},  	{241.919296,-503.177215,42.008056}  	},
		  {{228.281188,40.731430,7.430503},     	{220.159942,35.167049,5.674664}     	},
		  {{863.084289,-13.007917,76.346267},   	{865.383972,-21.453987,71.511474}   	},
		  {{1454.927490,-305.930633,26.546848}, 	{1446.908447,-300.290557,24.576097} 	},
		  {{2352.672363,-664.975036,136.689483},	{2357.546630,-658.185363,131.199325}	},
		  {{1049.693359,522.506652,23.078781},  	{1045.958007,513.419555,21.215373}  	},
		  {{591.365539,165.333572,19.570011},   	{600.623168,161.686508,18.572305}   	}

		};  new const rand = random(7);


		inline delay()
		{
			SetPlayerCameraPos(pid, CCamPos[rand][0][0], CCamPos[rand][0][1], CCamPos[rand][0][2]);
			setPlayerPosZ(pid,CCamPos[rand][0][0], CCamPos[rand][0][1], CCamPos[rand][0][2]+50);
			SetPlayerCameraLookAt(pid, CCamPos[rand][1][0],CCamPos[rand][1][1],CCamPos[rand][1][2]);
		}
		setTimer(using inline delay, 100, 0);
	}

	TextDrawShowForPlayer(pid, Init2);
	TextDrawShowForPlayer(pid, Init3);
	TextDrawShowForPlayer(pid, Init4);

	//set.at_class[pid] = 1;

	inline welcome_msg()
	{
		wiper(pid);
		infoMsg(pid, "%s, prisijungei prie "C_Y"Story of Cities"C_SOC".", GetPlayerNameEx(pid));
	}
	setTimer(using inline welcome_msg, 0, false);

	return 1;
}

//--------------------------------------------------

Callback::OnPlayerDisconnect(pid, reason)
{
	if( IsPlayerNPC(pid) ) return 1;
	if(pTemp[pid][socket] != -1)
		socket_close_remote_client(socket_server, tinfo[socket]);

	map_remove(MAP_IP, IntToStr(pTemp[pid][socket]));
	GPS::RemovePlayer(pid);
	CRAFT::ReturnAllItems(pid);

	if(ptemp[lova] != -1)
	{
		lova_in_use{ptemp[lova]} = false;
		ptemp[lova] = -1;
	}

	if(timer_degaline[pcd[pid]])
	{
		killTimer(timer_degaline[pcd[pid]]);
		timer_degaline[pcd[pid]] = 0;
	}
	if(get.timer_onfirecar[pid])
	{
		killTimer(get.timer_onfirecar[pid]);
		del.timer_onfirecar[pid];
	}
	if(get.timer_onfire[pid])
	{
		killTimer(get.timer_onfire[pid]);
		del.timer_onfire[pid];
	}
	if(get.area_pd[pid])
	{
		killTimer(get.area_pd[pid]);
		del.area_pd[pid];
	}
	if(get.repairT[pid])
	{
      hideRepairBar(pid);
		killTimer(get.repairT[pid]);
		del.repairT[pid];
		--aGarazas[ePeopleCount];
	}

	if(player.bool.get(pid, bIsInCarShop))
	{
		hide_vehicleShop(pid);
	}
	if(player.bool.get(pid,bPrisijunges))
	{
		PLAYER::Freeze(pid, false);
		if( reason == 2 )
			pinfo[kb]++;

		new const veh = getPlayerVehicleID(pid);
		if(veh != INVALID_VEHICLE_ID)
		switch(car[veh][car_tipas])
		{
			case TAXI:
			{
				foreach(new i : Player)
				{
					if(getPlayerVehicleID(i) == veh && GetPlayerState(i) == PLAYER_STATE_PASSENGER)
					{
						new const suma = floatround((car[veh][rida] - pTemp[i][taxi_diff]) * kaina_TAXI);

						PlayerTextDrawHide(pid, p_taxi_stats[GetPlayerVehicleSeat(i)-1][pid]);

						if(PLAYER::GetMoney(i) < suma)
						{
							PLAYER::GiveMoney(pid, PLAYER::GetMoney(i));
							notification2(i, F("~w~Suma uz TAXI paslaugas: ~y~%i ~w~lt, taciau apmoketi gali tik ~y~%i ~w~lt.", PLAYER::GetMoney(i)));
							del.money[i];
							
						} else {

							PLAYER::GiveMoney(pid, suma);
							PLAYER::GiveMoney(i, -suma);
							notification2(i, F("Suma uz TAXI paslaugas: ~y~%i", suma));
						}
						player.bool.off(i, bIsInTaxi);
						RemovePlayerFromVehicle(i);
					}
				}
			}
		}

		if(player.bool.get(pid, bIsInTaxi))
		{
			new const suma = floatround((car[get.lastTAXI[pid]][rida] - tinfo[taxi_diff]) * kaina_TAXI);
			new const taxiDriver = get.TaxiDriver[pid];

			PlayerTextDrawHide(taxiDriver, p_taxi_stats[GetPlayerVehicleSeat(pid)-1][taxiDriver]);

			if(PLAYER::GetMoney(pid) < suma)
			{
				PLAYER::GiveMoney(taxiDriver, PLAYER::GetMoney(pid));
				notification(taxiDriver, f("%s uz kelione sumoketi nebeuztenka pinigu, todel sumokejo likusiais ~y~%i ~w~lt", GetPlayerNameEx(pid), PLAYER::GetMoney(pid)));
				del.money[pid];
			
			} else {

				PLAYER::GiveMoney(taxiDriver, suma);
				notification(taxiDriver, f("%s uz kelione sumokejo %i lt", GetPlayerNameEx(pid), suma));
				PLAYER::GiveMoney(pid, -suma);
			}
		}

		PLAYER::Save(pid);

		tinfo[gps_dest_node] = -1;

		resetPlayerVariables(pid);
		DestroyRoutes(pid);
	}
	destroy_textdraws(pid);
	//del.at_class[pid];
	return 1;
}

//--------------------------------------------------

Callback::OnPlayerSpawn(pid)
{
	PreloadAnims(pid);

	if( IsPlayerNPC(pid) )
	{
		return 1;
	}
	
	if( ! player.bool.get(pid,bPrisijunges) ) Kick(pid);

	if(get.spec[pid]) return spect(pid);

	SetPlayerTeam(pid, 1);

	for(new i; i < 5; ++i)
	{
		TextDrawShowForPlayer(pid, g_stats[i]);
	}
	for(new i; i < 3; ++i)
	{
		PlayerTextDrawShow(pid, p_stats[i][pid]);
	}
	
	if( player.bool.get(pid, bKatikPrisijunge) )
	{
		inline delay() soc(pid, FADEOUT);
		setTimer(using inline delay, 1000, false);
		if(pinfo[current_quest])
		{
			TogglePlayerDynamicArea(pid, area[spawn_shop_area], 0);
		}
		if(pinfo[current_quest] != -1)
		{
			showQuest(pid);
			switch(pinfo[current_quest])
			{
				case 1,2: showTip(pid, TIP_NPC_TALK);
			}
		}
		if( ! player.bool.get(pid,bUzsiregistravo) )
		{
			SetPlayerScore(pid, pinfo[patirtis]);
			if(player.flag.get(pid, fIsInJail))
			{
				toTheJail(pid);
			}
			if(player.flag.get(pid, fSurakintas))
			{
				PLAYER::Freeze(pid, true, SURAKINTAS);
			}
			if(player.flag.get(pid, fMirsta))
			{
				pinfo[death_state] = DEATH_STATE_HOSPITAL;
			}
			if(player.flag.get(pid, fOnFire))
			{
				new coords<1>;
				GetPlayerPos(pid, coords<1>);
				startFire(coords<1>, 0, pid);
			}
			if(pinfo[death_state] == DEATH_STATE_HOSPITAL)
			{
				if(getHospitalSlot() != -1)
				{
					new const x = getHospitalSlot();
					ptemp[lova] = x;
					lova_in_use{x} = true;

					#define b[%0] Ligonines_lova[ptemp[lova]][%0]

					fade_setPlayerPos(pid, b[0], b[1], b[2], .a = b[3]);

					#undef b

				} else {

					new const x = random(sizeof randomHospitalSpawn);

					#define b[%0] randomHospitalSpawn[x][%0]

					fade_setPlayerPos(pid, b[0], b[1], b[2], .a = b[3]);
					ptemp[hospital_diff] = gettime();

					#undef b
				}
			}
		
		} else {
			// Spawnas po registracijos. First time at the game.
			SetPlayerVirtualWorld(pid, VW_SkinSelect+pid);
			skinSelect(pid);
		}
		player.bool.off(pid,bKatikPrisijunge);

		switch(PLAYER::JOB::GetDirector(pid))
		{
			case -1: 			sendMsgToAll(f(#LIGHT"( "#DARK"info"#LIGHT" )  %s prisijungë.", GetPlayerNameEx(pid)));
			case MECHANIKAS: 	sendMsgToAll(f(#LIGHT"( "#DARK"info"#LIGHT" )  %s, mechanikø direktorius, prisijungë.", GetPlayerNameEx(pid)));
			case PD: 			sendMsgToAll(f(#LIGHT"( "#DARK"info"#LIGHT" )  %s, teisësaugos direktorius, prisijungë.", GetPlayerNameEx(pid)));
			case MEDIKAS: 		sendMsgToAll(f(#LIGHT"( "#DARK"info"#LIGHT" )  %s, ligoninës direktorius, prisijungë.", GetPlayerNameEx(pid)));
			case TAXI: 			sendMsgToAll(f(#LIGHT"( "#DARK"info"#LIGHT" )  %s, taksi direktorius, prisijungë.", GetPlayerNameEx(pid)));
			case GAISRININKAS:sendMsgToAll(f(#LIGHT"( "#DARK"info"#LIGHT" )  %s, gaisrinës direktorius, prisijungë.", GetPlayerNameEx(pid)));
			case VALYTOJAS: 	sendMsgToAll(f(#LIGHT"( "#DARK"info"#LIGHT" )  %s, valytojø direktorius, prisijungë.", GetPlayerNameEx(pid)));
		}
		updateMarkersForPlayer(pid);

		tinfo[textlabel] = Create3DTextLabel(" ", -1, 0,0,0, 20, 0, 0);
		Attach3DTextLabelToPlayer(tinfo[textlabel], pid, 0, 0, -1);

		return 1;
	}
	

	//setPlayerPos(pid, 683.1002,-479.3609,16.3359);
	PLAYER::SetHealth(pid, 0);

	if(player.flag.get(pid, fMirsta))
		suzeistas(pid);

	return 1;
}

func logo_appear(pid)
{
	static logocolor[MP];
	static timer_logo_fade[MP];

	logocolor[pid] = -256;
	inline timer()
	{
		if((logocolor[pid] += 5) >= (-1))
		{
			killTimer(timer_logo_fade[pid]);

		} else {

			PlayerTextDrawColor(pid, logo[pid], logocolor[pid]);
			PlayerTextDrawShow(pid, logo[pid]);
		}
	}
	timer_logo_fade[pid] = setTimer(using inline timer, 40, true);
}
func logo_disappear(pid)
{
	static logocolor[MP];
	static timer_logo_unfade[MP];

	logocolor[pid] = -1;
	inline timer()
	{
		if( (logocolor[pid] -= 5) <= (-256))
		{
			killTimer(timer_logo_unfade[pid]);
			PlayerTextDrawHide(pid,logo[pid]);
		
		} else {

			PlayerTextDrawColor(pid, logo[pid], logocolor[pid]);
			PlayerTextDrawShow(pid, logo[pid]);
		}
	}
	timer_logo_unfade[pid] = setTimer(using inline timer, 40, true);
}

//--------------------------------------------------


Callback::OnPlayerGiveDamage(pid, damagedid, Float:amount, weaponid)
{
	set.LastDamageBy[damagedid] = pid;
	set.LastDamageByReason[pid] = weaponid;

	DamagePlayer(damagedid, amount, weaponid, PLAYER::GetHealth(damagedid), pid);
	return 1;
}

Callback::OnPlayerTakeDamage(pid, issuerid, Float: amount, weaponid)
{
	set.LastDamageBy[pid] = issuerid;
	set.LastDamageByReason[pid] = weaponid;
	if(IsPlayerNPC(issuerid))
		DamagePlayer(pid, amount, weaponid, PLAYER::GetHealth(pid), issuerid);
	else
	if(issuerid == INVALID_PLAYER_ID && player.bool.get(pid,bPrisijunges))
		DamagePlayer(pid, amount, weaponid, PLAYER::GetHealth(pid), INVALID_PLAYER_ID),
		PLAYER::SetPain(pid, PLAYER::GetPain(pid) + floatround(amount) * 100);
	notification(pid, F("HP left - %.1f", PLAYER::GetHealth(pid)));
	return 1;
}

func getHospitalSlot()
{
	for(new i; i < sizeof Ligonines_lova; ++i)
	{
		if(!lova_in_use[i])
		{
			return i;
		}
	}
	return -1;
}

//--------------------------------------------------

Callback::OnPlayerClickMap(pid, Float:fX, Float:fY, Float:fZ)
{
	if( tickcheck(pid, 1000)) return 1;

	DisablePlayerPoint(pid);
	SetPlayerPoint(pid,fX,fY,fZ);

	//if( !IsItemInBag(pid, gps)) return 1;
	//if( get.wash[pid] && !get.wash_pause[pid]) return 1;
	
	//GPS::start(pid, fX, fY, fZ);
	return 1;
}

//--------------------------------------------------

public::OnPlayerPause(pid)
{
	if( /*!*/ IsPlayerInAnyVehicle(pid))
	{
/*		inline anim() applyAnimation(pid,"CRACK","crckidle2",10.0,1,0,0,1,60000,1);
		setTimer(using inline anim, 200, 0);

	} else {
*/
		PLAYER::Freeze(pid, true, PAUSED);
	}
	return 1;
}

//--------------------------------------------------

public::OnPlayerUnpause(pid)
{
	if( /*!*/ IsPlayerInAnyVehicle(pid))
/*		ClearAnimations(pid, 1);
	else
*/		PLAYER::Freeze(pid, false, PAUSED);
	
	return notification(pid, "Pabudai");
}

//--------------------------------------------------

Callback::OnPlayerDeath(pid, killerid, reason)
{
	killerid = get.LastDamageBy[pid];
	reason = get.LastDamageByReason[pid];

	//if(!player.bool.get(pid, bMirsta))
	//	suzeistas(pid);

	UnuseWeaponInSlot(pid, 0);

	new coords<1>;
	GetPlayerPos(pid, coords<1>);
	SetSpawnInfo(pid, 1, GetPlayerSkin(pid), coords<1>, 0, 0,0,0,0,0,0);

	return 1;
}

//------------------------------------gta--------------

public::onVehicleDeath(vehicleid, killerid)
{
	socf(killerid,IS_CAR_IN_WATER,"%i", getVehicle(vehicleid));
	new const i = getVehicle(vehicleid);
	getVehiclePos(vehicleid, car[i][_x555], car[i][_y555], car[i][_z555]);
	infoMsg(killerid, "%f %f %f", car[i][_x555], car[i][_y555], car[i][_z555]);

	if( ! car[vehicleid][car_tipas])
	{
		vehToRemont(vehicleid);
	
	} else {

		car[vehicleid][car_status] = cNeedsRepair;
		despawnVehicle(vehicleid);
	}

	return 1;
}

public::onVehicleSpawn(vehicleid)
{
	return 1;
}

public::onVehicleDamageStatusUpdate(vehicleid, playerid)
{
	return 1;
}

public::onUnoccupiedVehicleUpdate(vehicleid, pid, passenger_seat)
{
	updateVehicleHealth(vehicleid);

	if( ! vehicle.bool.get(vehicleid, fVariklis))
	{
		//setVehicleVelocity(vehicleid, 0, 0, 0);
	}
	return 1;
}

public::onVehicleMod(pid, vehicleid, componentid)
{
	return 1;
}

public::onVehiclePaintjob(pid, vehicleid, paintjobid)
{
	return 1;
}

public::onVehicleRespray(pid, vehicleid, color1, color2)
{
	return 1;
}

public::onVehicleStreamIn(vehicleid, forplayerid)
{
	checkKeys(vehicleid, forplayerid);
	return 1;
}

public::onVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

//--------------------------------------------------

Callback::OnPlayerText(pid, text[])
{
	if( tickcheck(pid, 100)) return 0;
	SetPlayerChatBubble(pid, text, COLOR_SOC, 30, 5000);
	return 1;
}

//--------------------------------------------------

public::onPlayerEnterVehicle(pid, vehicleid, ispassenger)
{
	if( vehicle.bool.get(vehicleid, fIsOnFire) || car[vehicleid][car_status] == cRepair)
	{
		notification(pid, "masina dega");
		ClearAnimations(pid, 1);
		setVehicleParamsForPlayer(vehicleid, pid, 0, 1);
		return 1;
	}
	if( !vehicle.bool.get(vehicleid, fVariklis))
	{
		engineoff(vehicleid);

	} else {

		engineon(vehicleid);
	}
	
	if( vehicle.bool.get(vehicleid, fSpyna))
	{
		if(checkKeys(vehicleid, pid))
		{
			ClearAnimations(pid, 1);
			return notification(pid, "neturi raktu siai masinai");

		} else {

			vehicle.bool.off(vehicleid, fSpyna);
			return notification(pid, "atrakinai masina");
		}
	}

	return 1;
}
//--------------------------------------------------

public::onPlayerExitVehicle(pid, vehicleid)
{
	if(vehicleid >= MAX_VEHICLES) return 1;

	TextDrawHideForPlayer(pid, g_taxi_stats);
/*
	if(car[ vehicleid ][car_tipas] == 0)
	{
		killVehicle(vehicleid);
		return 1;
	}
*/
	TogglePlayerDynamicArea(pid, area[mech_tune], 0);
	TogglePlayerDynamicArea(pid, area[mech_repair], 0);
	TogglePlayerDynamicArea(pid, area[mech_tech], 0);
	if(car[ vehicleid ][driver] == pid)
	{
		car[vehicleid][driver] = INVALID_PLAYER_ID;
		switch(car[vehicleid][car_tipas])
		{
			case TAXI:
			{
				foreach(new i : Player)
				{
					if(getPlayerVehicleID(i) == vehicleid && GetPlayerState(i) == PLAYER_STATE_PASSENGER)
					{
						new const suma = floatround((car[vehicleid][rida] - pTemp[i][taxi_diff]) * kaina_TAXI);

						PlayerTextDrawHide(pid, p_taxi_stats[GetPlayerVehicleSeat(i)-1][pid]);

						if(PLAYER::GetMoney(i) < suma)
						{
							PLAYER::GiveMoney(pid, PLAYER::GetMoney(i));
							notification(i, f("~w~vairuotojas islipo. uz paslaugas sumokejai likusius savo ~y~%i ~w~lt", PLAYER::GetMoney(i)));
							notification(i, f("~y~%s ~w~uz paslaugas sumokejo paskutinius savo ~y~%i ~w~lt", GetPlayerNameEx(i), suma));
							PLAYER::GiveMoney(i, -PLAYER::GetMoney(i));
							
						} else {

							PLAYER::GiveMoney(pid, suma);
							notification(i, f("~w~vairuotojas islipo. uz paslaugas sumokejai ~y~%i ~w~lt", suma));
							notification(i, f("~y~%s ~w~uz paslaugas sumokejo ~y~%i ~w~lt", GetPlayerNameEx(i), suma));
							PLAYER::GiveMoney(i, -suma);
						}
						player.bool.off(i, bIsInTaxi);
					}
				}
			}
			case VALYTOJAS:
			{
				pauseWash(pid);
			}
		}
	}

	if(player.bool.get(pid, bIsInTaxi))
	{
		new const suma = floatround((car[vehicleid][rida] - tinfo[taxi_diff]) * kaina_TAXI);
		new const taxiDriver = get.TaxiDriver[pid];

		PlayerTextDrawHide(taxiDriver, p_taxi_stats[GetPlayerVehicleSeat(pid)-1][taxiDriver]);

		if(PLAYER::GetMoney(pid) < suma)
		{
			PLAYER::GiveMoney(taxiDriver, PLAYER::GetMoney(pid));
			notification(taxiDriver, F("%s uz kelione sumoketi nebeuztenka pinigu, todel sumokejo likusiais ~y~%i ~w~lt", GetPlayerNameEx(pid), PLAYER::GetMoney(pid)));
			notification(pid, F("~w~Suma uz TAXI paslaugas: ~y~%i ~w~lt, taciau apmoketi gali tik ~y~%i ~w~lt.", suma, PLAYER::GetMoney(pid)));
			del.money[pid];
				
		} else {

			PLAYER::GiveMoney(taxiDriver, suma);
			notification(taxiDriver, F("~y~%s ~w~uz kelione sumokejo ~y~%i ~w~lt", GetPlayerNameEx(pid), suma));
			notification(pid, F("Suma uz TAXI paslaugas: ~y~%i", suma));
			PLAYER::GiveMoney(pid, -suma);
		}
		player.bool.off(pid, bIsInTaxi);
	}

	return 1;
}

//------------------------------------------------

Callback::OnPlayerStateChange(pid, newstate, oldstate)
{
	//if( tickcheck(pid, 100)) return 1;

	if(oldstate == PLAYER_STATE_DRIVER) 
	{
		TextDrawHideForPlayer(pid, g_taxi_stats);
		format(car[get.lastVEH[pid]][last_driver], 24, GetPlayerNameEx(pid));
	}

	switch( newstate )
	{
		case PLAYER_STATE_ONFOOT:
		{
			set.justFromVeh[pid] = 1;
			inline reset() del.justFromVeh[pid];
			setTimer(using inline reset, 3000, 0);
		}
		case PLAYER_STATE_DRIVER:
		{
			if( !IsPlayerOnBicycle(pid))
			{
				UnuseAttachInSlot(pid, SLOT_RIGHTHAND, true);

				if( ! player.flag.get(pid, fFirstCar))
				{
					showTip(pid, TIP_USE_ENGINE);
					player.flag.on(pid, fFirstCar);
				}
				new const vehid = GetPlayerVehicleID(pid);
				new const veh = getVehicleFromSampID(vehid);
				car[veh][driver] = pid;
				set.lastVEH[pid] = veh;
				if( vehicle.bool.get(veh, fSpyna))
				{
					notification(pid, "Kick(pid);");
				/*	Kick(pid);*/
					return 1;
				}

				GameTextForPlayer(pid, GetVehicleName(vehid), 3000, 1);

				if( !vehicle.bool.get(vehid, fVariklis) || vehicle.error.get(vehid, gEngine))
				{
					engineoff(vehid);

				} else {

					engineon(vehid);
				}
				TogglePlayerDynamicArea(pid, area[mech_tune], 1);
				TogglePlayerDynamicArea(pid, area[mech_repair], 1);
				TogglePlayerDynamicArea(pid, area[mech_tech], 1);

				switch(car[veh][car_tipas])
				{
					case TAXI:
					{
						TextDrawShowForPlayer(pid, g_taxi_stats);
						foreach(new i : Player)
						{
							if(GetPlayerVehicleID(i) == vehid && i != pid)
							{
								pTemp[i][taxi_diff] = car[veh][rida];
								set.lastTAXI[i] = veh;
								set.TaxiDriver[pid] = pid;
								player.bool.on(i, bIsInTaxi);
								PlayerTextDrawShow(pid, p_taxi_stats[GetPlayerVehicleSeat(i)-1][pid]);
								PlayerTextDrawSetString(pid, p_taxi_stats[GetPlayerVehicleSeat(i)-1][pid], F("%s ~y~%.1f~w~km ( ~y~%i~w~ lt )", GetPlayerNameEx(i),car[veh][rida] - pTemp[i][taxi_diff], (car[veh][rida] - pTemp[i][taxi_diff])*kaina_TAXI));
							}
						}
					}
					case VALYTOJAS:
					{
						startWash(pid);
					}
				}
			}
		}
		case PLAYER_STATE_PASSENGER:
		{
			UnuseAttachInSlot(pid, SLOT_RIGHTHAND, true);

			new const veh = getVehicleFromSampID(GetPlayerVehicleID(playerid));
			set.lastVEH[pid] = veh;
			switch(car[veh][car_tipas])
			{
				case TAXI:
				{
					new const driverr = GetVehicleDriver(veh);
					
					if(driverr != INVALID_PLAYER_ID)
					{
						tinfo[taxi_diff] = car[veh][rida];
						set.lastTAXI[pid] = veh;
						set.TaxiDriver[pid] = driverr;
						player.bool.on(pid, bIsInTaxi);
						PlayerTextDrawShow(driverr, p_taxi_stats[GetPlayerVehicleSeat(pid)-1][driverr]);
						PlayerTextDrawSetString(driverr, p_taxi_stats[GetPlayerVehicleSeat(pid)-1][driverr], 
							F("%s ~y~%.1f~w~km ( ~y~%i~w~ lt )", GetPlayerNameEx(pid),car[veh][rida] - pTemp[pid][taxi_diff], (car[veh][rida] - pTemp[pid][taxi_diff])*kaina_TAXI));
						notification(driverr, F("~y~%s ~w~isedo i TAXI.", GetPlayerNameEx(pid)));
					}
				}
			}
			if(get.stebi[pid])
			{
				spect(get.stebi[pid], 1, pid);
			}
		}
	}
	if( (oldstate == PLAYER_STATE_DRIVER && newstate == PLAYER_STATE_PASSENGER) || (oldstate == PLAYER_STATE_PASSENGER && newstate == PLAYER_STATE_DRIVER))
	{
		notification(pid, "WTF??");
		return 1;
	}
	return 1;
}



func startWash(pid)
{
	if(!get.wash[pid])
	{
		new Float:x, Float:y, Float:z;
		new const sl = random(22);
		tinfo[wash_start] = sl;
		tinfo[wash_start_node] = NearestNodeFromPoint(washTarget[sl][0], washTarget[sl][1], washTarget[sl][2]);
		if( ! tinfo[wash_start_node])
		{
			stopWash(pid);
			startWash(pid);
			return;
		}

		//CalculatePath(tinfo[wash_start_node],tinfo[wash_dest_node],pid+100);
		GetNodePos(tinfo[wash_start_node], x,y,z);

		DisablePlayerCheckpoint(pid);
		SetPlayerCheckpoint(pid, x,y,z,3);

		set.wash[pid] = 1;

	} else {

		CalculatePath(tinfo[wash_last_node],tinfo[wash_dest_node],pid+100);
		new coords<1>;
		GetNodePos(tinfo[wash_dest_node], coords<1>);

		DisablePlayerCheckpoint(pid);
		SetPlayerCheckpoint(pid,coords<1>,3);
	}
}

func pauseWash(pid)
{
	DestroyRoutes(pid);
	DisablePlayerCheckpoint(pid);
}

func stopWash(pid)
{
	del.wash[pid];
	tinfo[wash_dest] = -10;
	tinfo[wash_start] = -10;
	tinfo[wash_dest_node] = -10;
	tinfo[wash_start_node] = -10;
	tinfo[wash_last_node] = -10;
	DestroyRoutes(pid);
	DisablePlayerCheckpoint(pid);
}

//--------------------------------------------------

Callback::OnPlayerEnterCheckpoint(pid)
{
	DisablePlayerCheckpoint(pid);
	if( player.bool.get(pid, bGPS))
	{
		GPS::atvyko(pid);
		return notification(pid, "Tiksla pasiekei sekmingai!");
	}
	return 1;
}

func GPS::atvyko(pid)
{
	tinfo[gps_dest_node] = -1;
	player.bool.off(pid, bGPS);
	DestroyPlayerObject(pid, get.GPS_Arrow[pid]);
	del.createdArrow[pid];
	DestroyRoutes(pid);
}
//--------------------------------------------------

Callback::OnPlayerLeaveCheckpoint(pid)
{
	return 1;
}

//--------------------------------------------------

Callback::OnPlayerEnterRaceCheckpoint(pid)
{
	return 1;
}

//--------------------------------------------------

Callback::OnPlayerLeaveRaceCheckpoint(pid)
{
	return 1;
}

//--------------------------------------------------

Callback::OnRconCommand(cmd[])
{
	return 1;
}

//--------------------------------------------------

Callback::OnPlayerRequestSpawn(pid)
{
	if( IsPlayerNPC(pid)) return 1;
	if( !player.bool.get(pid,bPrisijunges) ) return 0;
	return 1;
}

//--------------------------------------------------

Callback::OnPlayerObjectMoved(pid, objectid)
{
	return 1;
}

//--------------------------------------------------

Callback::OnPlayerPickUpDynamicPickup(pid, pickupid)
{
	return 1;
}

//--------------------------------------------------

Callback::OnPlayerClickPlayerTextDraw(pid, PlayerText:playertextid)
{
	if (player.bool.get(pid, bTip))
	{
		if(playertextid == p_tip_show[pid])
		{
			if(pinfo[current_quest] == 1)
			{
				notification2(pid, " + ~y~1~w~ patirties ( ~y~PT~w~ )");
				PLAYER::GiveExp(pid, 1);
				++pinfo[current_quest]; // 2
				showQuest(pid);
			}


			new const id = ptemp[tip_id];
			hideTip(pid);

			TextDrawShowForPlayer(pid, g_tip[0]);
			TextDrawShowForPlayer(pid, g_tip[1]);
			PlayerTextDrawShow(pid, p_tip[0][pid]);
			PlayerTextDrawShow(pid, p_tip[1][pid]);

			if(id == -1)
			{
				PlayerTextDrawSetString(pid, p_tip[1][pid], ptemp[tip_head]);
				PlayerTextDrawSetString(pid, p_tip[0][pid], ptemp[tip_body]);

			} else {

				PlayerTextDrawSetString(pid, p_tip[1][pid], tip_list[id][tip_name]);
				PlayerTextDrawSetString(pid, p_tip[0][pid], tip_list[id][tip_data]);
			}
			return 1;
		}
	}
	// Jeigu ájungtas dialogas, neprocessinam jokiø click'ø
	if(Dialog_Get(pid) != -1)
		return 1;

	if (player.bool.get(pid, bTrunkOpen) || player.bool.get(pid, bShopOpen))
	{
		for(new i = 1; i < 12*3; i+=3)
			{ // praeinam visus textdrawus
				if( playertextid == pTrunk[pid][1][i]) // BAG pusë
				{ // jeigu radom.

					// TODO: hideItemInfoTrunk(pid);

					/* double click start */
					if(get.bagclick[pid] > GetTickCount()-300)
						return (player.bool.get(pid, bShopOpen))?BagToShop(pid):BagToTrunk(pid);
					set.bagclick[pid] = GetTickCount();
					/* double click end */

					if( baguse[last_clicked_textdraw_row] != PlayerText:-1)
					{ // Jeigu prieð ðità paspaudimà jau buvo paspaustas kitas textdrawas
						PlayerTextDrawBoxColor( pid, baguse[last_clicked_textdraw_row], COLOR_BAG_DEFAULT);
						PlayerTextDrawShow(pid, baguse[last_clicked_textdraw_row]);

						slcslot = -1;
						if( baguse[last_clicked_textdraw_row] == playertextid && baguse[selecteditem] == playertextid)
						{
							baguse[selecteditem] = PlayerText:-1;
							baguse[last_clicked_textdraw_row] = PlayerText:-1;
							return 1;
						}
					}
					baguse[last_clicked_textdraw_row] = PlayerText:playertextid;
					slcslot = baguse[bagedit:( (i-1) / 3 )];
					baguse[isintrunk] = false;
					baguse[isinshop] = false;

					// TODO: showItemInfoBag(pid, slcslot);
					notification(pid, ItemInfo[ bag[slcslot][item] ][item_name]);
					PlayerTextDrawBoxColor( pid, playertextid, COLOR_SELECT);
					PlayerTextDrawShow(pid, playertextid);
					baguse[selecteditem] = PlayerText:playertextid;
					return 1;
				}
			}
			for(new i = 1; i < 12*3; i+=3) // TRUNK pusë
			{ // praeinam visus textdrawus
				if( playertextid == pTrunk[pid][0][i])
				{ // jeigu radom.

					// TODO: hideItemInfoBag(pid);
					/* double click start */
					if(get.bagclick[pid] > GetTickCount()-300)
						return (player.bool.get(pid, bShopOpen))?ShopToBag(pid):TrunkToBag(pid);
					set.bagclick[pid] = GetTickCount();
					/* double click end */

					if( baguse[last_clicked_textdraw_row] != PlayerText:-1)
					{ // Jeigu prieð ðità paspaudimà jau buvo paspaustas kitas textdrawas
						PlayerTextDrawBoxColor( pid, baguse[last_clicked_textdraw_row], COLOR_BAG_DEFAULT);
						PlayerTextDrawShow(pid, baguse[last_clicked_textdraw_row]);

						slcslot = -1;
						if( baguse[last_clicked_textdraw_row] == playertextid && baguse[selecteditem] == playertextid)
						{
							baguse[selecteditem] = PlayerText:-1;
							baguse[last_clicked_textdraw_row] = PlayerText:-1;
							return 1;
						}
					}
					baguse[last_clicked_textdraw_row] = PlayerText:playertextid;
					slcslot = baguse[bagedit:( (i-1)/3 +13 )];
					
					if(player.bool.get(pid, bShopOpen))
						baguse[isinshop] = true;
					else
						baguse[isintrunk] = true;

					// TODO: showItemInfoBag(pid, slcslot);
					if(player.bool.get(pid, bShopOpen))
						notification(pid, ItemInfo[ shop[baguse[shop_id]][slcslot][item] ][item_name]);
					else
						notification(pid, ItemInfo[ trunk[baguse[trunk_id]][slcslot][item] ][item_name]);
					PlayerTextDrawBoxColor( pid, playertextid, COLOR_SELECT);
					PlayerTextDrawShow(pid, playertextid);
					baguse[selecteditem] = PlayerText:playertextid;
					return 1;
				}
			}
	}
	if (player.bool.get(pid, bBagOpen))
	{
		if(BAG::ProcessClick(pid, playertextid) != -1)
			return true;
	}
	if (player.bool.get(pid, bCraftOpen))
	{
		if(CRAFT::ProcessClick(pid, playertextid, 1))
			return true;
	}

	if (player.bool.get(pid, bGpsOpen))
	{
			// GPS MENIU
			if( playertextid == pmenu[11][pid])
			{
				hide_menu(pid);
				
				CancelSelectTextDraw(pid);
				return 1;
			}
			if( get.selected_menu[pid] ) // ? -> ?
			{
				if( playertextid == pmenu[10][pid] )
				{
					show_menu(pid);
					menu_gps(pid);
					return 1;
				}
				if( get.selected_menu[pid] == 1) // Darbai -> ?
				{
					if( playertextid == pmenu[1][pid]) // Darbai -> Mechanikai (ROW_1 | FIELD_1)
					{
						GPS::mechanikai(pid);
						
						hide_menu(pid);
						CancelSelectTextDraw(pid);
						return 1;
					}
					if( playertextid == pmenu[3][pid]) // Darbai -> Gaisrine (ROW_3 | FIELD_1)
					{
						GPS::gaisrine(pid);
						
						hide_menu(pid);
						CancelSelectTextDraw(pid);
						return 1;
					}
					if( playertextid == pmenu[4][pid]) // Darbai -> Policija (ROW_1 | FIELD_2)
					{
						GPS::policija(pid);
						
						hide_menu(pid);
						CancelSelectTextDraw(pid);
						return 1;
					}
					if( playertextid == pmenu[7][pid]) // Darbai -> Medikai (ROW_1 | FIELD_3)
					{
						GPS::medikai(pid);
						
						hide_menu(pid);
						CancelSelectTextDraw(pid);
						return 1;
					}
					return 1;
				}
				if( get.selected_menu[pid] == 4) // Parduotuves -> ?
				{
					if( playertextid == pmenu[1][pid]) // Parduotuves -> Senu masinu turgus (ROW_1 | FIELD1)
					{
						GPS::carturgus(pid);
						
						hide_menu(pid);
						CancelSelectTextDraw(pid);
						return 1;
					}
					if( playertextid == pmenu[2][pid]) // Parduotuves -> Akropolis (ROW_2 | FIELD_1)
					{
						GPS::parduotuve(pid);
						
						hide_menu(pid);
						CancelSelectTextDraw(pid);
						return 1;
					}
					return 1;
				}
				if( get.selected_menu[pid] == 10) // Nustatymai -> ?
				{
					if( playertextid == pmenu[1][pid]) // Nustatymai -> GPS nustatymai (ROW_1 | FIELD_1)
					{
						set.selected_menu[pid] = 101;
						PlayerTextDrawSetString(pid, pmenu[0][pid], "GPS nustatymai");
						PlayerTextDrawSetString(pid, pmenu[1][pid], "Kelio spalva");
						PlayerTextDrawSetString(pid, pmenu[2][pid], " ");
						PlayerTextDrawSetString(pid, pmenu[3][pid], " ");
						PlayerTextDrawSetString(pid, pmenu[4][pid], " ");
						PlayerTextDrawSetString(pid, pmenu[5][pid], " ");
						PlayerTextDrawSetString(pid, pmenu[6][pid], " ");
						PlayerTextDrawSetString(pid, pmenu[7][pid], " ");
						PlayerTextDrawSetString(pid, pmenu[8][pid], " ");
						PlayerTextDrawSetString(pid, pmenu[9][pid], " ");
						PlayerTextDrawSetString(pid, pmenu[10][pid], "Atgal");
						return 1;
					}
					return 1;
				}

				if( get.selected_menu[pid] == 101) // Nustatymai -> GPS nustatymai -> ?
				{
					if( playertextid == pmenu[1][pid]) // Nustatymai -> GPS nustatymai -> Kelio spalva (ROW_1 | FIELD_1)
					{
						set.selected_menu[pid] = 1011;

						PlayerTextDrawSetString(pid, pmenu[1][pid], "Raudona");
						PlayerTextDrawSetString(pid, pmenu[2][pid], "Geltona");
						PlayerTextDrawSetString(pid, pmenu[3][pid], "Zydra");
							PlayerTextDrawSetString(pid, pmenu[4][pid], "Melyna");
							PlayerTextDrawSetString(pid, pmenu[5][pid], "Purpurine");
							PlayerTextDrawSetString(pid, pmenu[6][pid], "Violetine");
								PlayerTextDrawSetString(pid, pmenu[7][pid], "Zalia");
								PlayerTextDrawSetString(pid, pmenu[8][pid], "Morkine");
								PlayerTextDrawSetString(pid, pmenu[9][pid], "Ivesti RGB");

						PlayerTextDrawSetString(pid, pmenu[10][pid], "Atgal");
						return 1;
					}
					return 1;
				}
				if( get.selected_menu[pid] == 1011) // Nustatymai -> GPS nustatymai -> Kelio spalva -> ?
				{
					hide_menu(pid);
					CancelSelectTextDraw(pid);

					if( playertextid == pmenu[1][pid])		pinfo[gps_color] = RGBAToHex(255, 0, 0, 255);		// Raudona
					if( playertextid == pmenu[2][pid])		pinfo[gps_color] = RGBAToHex(255, 255, 0, 255);		// Geltona
					if( playertextid == pmenu[3][pid])		pinfo[gps_color] = RGBAToHex(42, 167, 255, 255);	// Zydra
							if( playertextid == pmenu[4][pid])		pinfo[gps_color] = RGBAToHex(0, 0, 255, 255);		// Melyna
							if( playertextid == pmenu[5][pid])		pinfo[gps_color] = RGBAToHex(255, 178, 234, 255);	// Purpurine
							if( playertextid == pmenu[6][pid])		pinfo[gps_color] = RGBAToHex(196, 0, 196, 255);		// Violetine
									if( playertextid == pmenu[7][pid])		pinfo[gps_color] = RGBAToHex(0, 255, 0, 255);		// Zalia
									if( playertextid == pmenu[8][pid])		pinfo[gps_color] = RGBAToHex(255, 100, 0, 255);		// Morkine
									if( playertextid == pmenu[9][pid])		ShowDialog(pid, Show:<gps_rgb_red>,DIALOG_STYLE_INPUT, 	/* RGB */
						"GPS Spalvos kodas", "{FFFFFF}RGB spalvø kodus gali rasti internete.\nJá sudaro 9 skaièiai. Po tris kiekvienai spalvai.\nÁvesk pirmus 3 skaièius (RRR XXXXXX) {FF0000}raudonai{FFFFFF} spalvai. (0-255)", "Ávesti", "Atgal");

					return 1;
				}
			}
			if( ! get.selected_menu[pid] ) // ? -/>
			{
				if( playertextid == pmenu[1][pid]) // ? -> DARBAI (ROW_1 | FIELD_1)
				{
					set.selected_menu[pid] = 1;
					PlayerTextDrawSetString(pid, pmenu[1][pid], "Mechanikai");
					PlayerTextDrawSetString(pid, pmenu[2][pid], "Taxi");
					PlayerTextDrawSetString(pid, pmenu[3][pid], "Gaisrine");
						PlayerTextDrawSetString(pid, pmenu[4][pid], "Policija");
						PlayerTextDrawSetString(pid, pmenu[5][pid], "UAB Valytojai");
						PlayerTextDrawSetString(pid, pmenu[6][pid], " ");
							PlayerTextDrawSetString(pid, pmenu[7][pid], "Medikai");
							PlayerTextDrawSetString(pid, pmenu[8][pid], "UAB Statybos");
							PlayerTextDrawSetString(pid, pmenu[9][pid], " ");

					PlayerTextDrawSetString(pid, pmenu[10][pid], "Atgal");
					return 1;
				}
				if( playertextid == pmenu[4][pid]) // ? -> PARDUOTUVES (ROW_1 | FIELD_2)
				{
					set.selected_menu[pid] = 4;
					PlayerTextDrawSetString(pid, pmenu[1][pid], "Senu masinu turgus");
					PlayerTextDrawSetString(pid, pmenu[2][pid], "Prekybos centras");
					PlayerTextDrawSetString(pid, pmenu[3][pid], "Nekilnojamasis turtas");
						PlayerTextDrawSetString(pid, pmenu[4][pid], "Masinu turgus");
						PlayerTextDrawSetString(pid, pmenu[5][pid], "Garazai");
						PlayerTextDrawSetString(pid, pmenu[6][pid], " ");
							PlayerTextDrawSetString(pid, pmenu[7][pid], "vip masinu salonas");
							PlayerTextDrawSetString(pid, pmenu[8][pid], "Dviraciu parduotuve");
							PlayerTextDrawSetString(pid, pmenu[9][pid], " ");

					PlayerTextDrawSetString(pid, pmenu[10][pid], "Atgal");
					return 1;
				}
				if( playertextid == pmenu[7][pid]) // Degaline (ROW_1 | FIELD_3)
				{
					GPS::degaline(pid);
					
					hide_menu(pid);
					CancelSelectTextDraw(pid);
					return 1;
				}
				if( playertextid == pmenu[2][pid]) // Ligonine (ROW_2 || FIELD_1)
				{
					GPS::ligonine(pid);
					
					hide_menu(pid);
					CancelSelectTextDraw(pid);
					return 1;
				}
				if( playertextid == pmenu[10][pid]) // Nustatymai ( pmenu[10] )
				{
					set.selected_menu[pid] = 10;
					PlayerTextDrawSetString(pid, pmenu[1][pid], "GPS nustatymai");
					PlayerTextDrawSetString(pid, pmenu[2][pid], " ");
					PlayerTextDrawSetString(pid, pmenu[3][pid], " ");
						PlayerTextDrawSetString(pid, pmenu[4][pid], " ");
						PlayerTextDrawSetString(pid, pmenu[5][pid], " ");
						PlayerTextDrawSetString(pid, pmenu[6][pid], " ");
							PlayerTextDrawSetString(pid, pmenu[7][pid], " ");
							PlayerTextDrawSetString(pid, pmenu[8][pid], " ");
							PlayerTextDrawSetString(pid, pmenu[9][pid], " ");
					PlayerTextDrawSetString(pid, pmenu[10][pid], "Atgal");
					return 1;
				}
				return 1;
			}
	}
	if
		(player.bool.get(pid, bPMenuOpen))
	{
			if( playertextid == pmenu[11][pid])
			{
				hide_menu(pid);
				CancelSelectTextDraw(pid);
				return 1;
			}
			if( playertextid == pmenu[1][pid])
			{
				if( IsPlayerDriver(pid) && ! player.bool.get(pid,bPilaDegalus) )
				{
					for(new i; i < sizeof degalines; ++i)
					{
						if(IsPlayerInRangeOfPoint(pid, 6, degalines[i][0], degalines[i][1], degalines[i][2]))
						{
							hide_menu(pid);
							CancelSelectTextDraw(pid);
							pcd[pid] = getPlayerVehicleID(pid);
							PLAYER::Freeze(pid, true, DEGALAI);
							player.bool.on(pid,bPilaDegalus);
							return 1;
						}
					}
				}
				return 1;
			}
			else if(playertextid == pmenu[2][pid])
			{
				if(applyChecks(pid, cBag)) return 1;
				load_bag(pid);
				return 1;
			}
	}
	return 1;
}

//--------------------------------------------------

Callback::OnPlayerClickTextDraw(pid, Text:clickedid)
{
	if( tickcheck(pid, 100)) return 1;
	if(Dialog_Get(pid) != -1) return 1;
	if( clickedid == Text:INVALID_TEXT_DRAW)
	{
		if(player.bool.get(pid, bQuestListOpen))
		{
			QUEST::HideMenu(pid);
			CancelSelectTextDraw(pid);
		}
		if(player.bool.get(pid, bShopOpen))
		{
			hide_shop(pid);
			PlayerTextDrawBoxColor( pid, baguse[last_clicked_textdraw_row], COLOR_BAG_DEFAULT);
			baguse[selecteditem] = PlayerText:-1;
			baguse[last_clicked_textdraw_row] = PlayerText:-1;
			slcslot = -1;
			CancelSelectTextDraw(pid);
		}
		if(player.bool.get(pid, bTrunkOpen))
		{
			hide_trunk(baguse[trunk_id], pid);
			PlayerTextDrawBoxColor( pid, baguse[last_clicked_textdraw_row], COLOR_BAG_DEFAULT);
			baguse[selecteditem] = PlayerText:-1;
			baguse[last_clicked_textdraw_row] = PlayerText:-1;
			slcslot = -1;
			CancelSelectTextDraw(pid);
		}
		if(player.bool.get(pid, bBagOpen))
		{
			hideItemInfoBag(pid);
			hide_bag(pid);
			PlayerTextDrawBoxColor( pid, baguse[last_clicked_textdraw_row], COLOR_BAG_DEFAULT);
			baguse[selecteditem] = PlayerText:-1;
			baguse[last_clicked_textdraw_row] = PlayerText:-1;
			slcslot = -1;
		}
		return 1;
	}
	if(clickedid == g_tip[1])
	{
		if(pinfo[current_quest] == 2)
		{
			notification2(pid, " + ~y~2~w~ patirties ( ~y~PT~w~ )");
			PLAYER::GiveExp(pid, 2);
			++pinfo[current_quest];
			showQuest(pid);
		}
		hideTip(pid);

		if(!player.bool.get(pid, bBagOpen) && !player.bool.get(pid, bTrunkOpen))
			CancelSelectTextDraw(pid);
		return 1;
	}
	if(player.bool.get(pid, bQuestListOpen))
	{
		if(clickedid == g_questList[2])
		{
			QUEST::HideMenu(pid);
			CancelSelectTextDraw(pid);
			return 1;
		}
		if(clickedid == g_questList[3])
		{
			PLAYER::QUEST::Prev(pid);
			return 1;
		}
		if(clickedid == g_questList[4])
		{
			PLAYER::QUEST::Next(pid);
			return 1;
		}
	}
	if(player.bool.get(pid, bIsInLogin))
	{
		
	}
	if(player.bool.get(pid, bCraftOpen))
	{
		if(CRAFT::ProcessClick(pid, clickedid, 0))
			return true;
	}
	if(player.bool.get(pid, bShopOpen))
	{
		if(clickedid == iShop[15])
		{
			if( baguse[tbagpageid] + 1 == GetMaxPagesShopBag(pid) )
				return 1;
			load_shop(baguse[shop_id], pid, 3, 1);
			return 1;
		}
		if(clickedid == iShop[14])
		{
			if( baguse[tbagpageid] <= 0)
				return 1;
			load_shop(baguse[shop_id], pid, 3, 2);
			return 1;
		}
		if( clickedid == iShop[8])
		{
			// TODO: hideItemInfoBag(pid);
			if( baguse[tshoppageid] + 1 == GetMaxPagesShopShop(baguse[shop_id]) )
				return 1;
			load_shop(baguse[shop_id], pid, 1, 3);
			return 1;
		}
		if( clickedid == iShop[9])
		{
			// TODO: hideItemInfoBag(pid);
			if( baguse[tshoppageid] <= 0) return 1;
			load_shop(baguse[shop_id], pid, 2, 3);
			return 1;
		}
		if( clickedid == iShop[3])
		{
			hide_shop(pid);
			PlayerTextDrawBoxColor( pid, baguse[last_clicked_textdraw_row], COLOR_BAG_DEFAULT);
			baguse[selecteditem] = PlayerText:-1;
			baguse[last_clicked_textdraw_row] = PlayerText:-1;
			slcslot = -1;
			CancelSelectTextDraw(pid);
			return 1;
		}
		if( clickedid == iShop[4] ) // pirkti
		{
			if(slcslot != -1)
			{
				if(baguse[isinshop])	return ShopToBag(pid);
				else					return 1;

			} else {

				notification(pid, "nieko nepasirinkai");
			}
			return 1;
		}
		if( clickedid == iShop[2] ) // parduoti
		{
			if(slcslot != -1)
			{
				if(baguse[isinshop])	return 1;
				else					return BagToShop(pid);

			} else {

				notification(pid, "nieko nepasirinkai");
			}
			return 1;
		}
	}
	if(player.bool.get(pid, bTrunkOpen))
	{
		// Globalus TD'as
		if( clickedid == iTrunk[3])
		{
			//hideItemInfoBag(pid);
			hide_trunk(baguse[trunk_id], pid);
			PlayerTextDrawBoxColor( pid, baguse[last_clicked_textdraw_row], COLOR_BAG_DEFAULT);
			baguse[selecteditem] = PlayerText:-1;
			baguse[last_clicked_textdraw_row] = PlayerText:-1;
			slcslot = -1;
			CancelSelectTextDraw(pid);
			return 1;
		}
		// Globalus TD'as
		if( clickedid == iTrunk[4])
		{
			// TODO: hideItemInfoBag(pid);
			if(slcslot != -1)
			{
				if(baguse[isintrunk]) 	return TrunkToBag(pid);
				else 					return BagToTrunk(pid);

			} else {

				notification(pid, "nieko nepasirinkai");
			}
			return 1;
		}
		// Global TD'as
		if( clickedid == iTrunk[2])
		{
			if( slcslot != -1)
			{
				if(baguse[isintrunk])
				{
					// TODO: hideItemInfoBag(pid);
					if( trunk[baguse[trunk_id]][slcslot][kiekis] > 1)
					{
						inline drop_item(__id, did, response, listitem, string:txt[])
						{
							#pragma unused __id, did, listitem
							if(response)
							{
								new amount = strval(txt);
								if(isnull(txt) || amount < 0) return showDialog(pid, using inline drop_item, DIALOG_STYLE_INPUT, "{ffffff}Bagaþinë", "Kiek iðmesti?", "Iðmesti", "Atðaukti");
								if( amount >= trunk[baguse[trunk_id]][slcslot][kiekis])
								{
									amount = -1;
								}
								RemoveItemFromTrunkSlot(baguse[trunk_id], slcslot, amount);
								PlayerTextDrawColor( pid, baguse[selecteditem], -1);
								PlayerTextDrawBoxColor( pid, baguse[last_clicked_textdraw_row], COLOR_BAG_DEFAULT);
								baguse[selecteditem] = PlayerText:-1;
								slcslot = -1;
								baguse[last_clicked_textdraw_row] = PlayerText:-1;
								load_trunk(baguse[trunk_id], pid, 3, 3);
							}
							return 1;
						}
						showDialog(pid, using inline drop_item, DIALOG_STYLE_INPUT, "{ffffff}Bagaþinë", "Kiek iðmesti?", "Iðmesti", "Atðaukti");
						return 1;
					}
					RemoveItemFromTrunkSlot(baguse[trunk_id], slcslot, -1);
					PlayerTextDrawColor( pid, baguse[selecteditem], -1);
					PlayerTextDrawBoxColor( pid, baguse[last_clicked_textdraw_row], COLOR_BAG_DEFAULT);
					baguse[selecteditem] = PlayerText:-1;
					baguse[last_clicked_textdraw_row] = PlayerText:-1;
					slcslot = -1;
					load_trunk(baguse[trunk_id], pid, 3, 3);

				} else {

					if( bag[slcslot][kiekis] > 1)
					{
						inline drop_item(__id, did, response, listitem, string:txt[])
						{
							#pragma unused __id, did, listitem
							if(response)
							{
								new amount = strval(txt);
				
								if( amount < 0 || amount >= bag[slcslot][kiekis])
								{
									amount = -1;
								}
								RemoveItemFromSlot(pid,slcslot,amount);
								PlayerTextDrawColor( pid, baguse[selecteditem], -1);
								PlayerTextDrawBoxColor( pid, baguse[last_clicked_textdraw_row], COLOR_BAG_DEFAULT);
								baguse[selecteditem] = PlayerText:-1;
								slcslot = -1;
								baguse[last_clicked_textdraw_row] = PlayerText:-1;
								load_trunk(baguse[trunk_id], pid, 3, 3);

								// hideItemInfoBag(pid);
							}
						}
						showDialog(pid, using inline drop_item, DIALOG_STYLE_INPUT, "{ffffff}Kuprinë", "Kiek iðmesti?", "Iðmesti", "Atðaukti");
						return 1;
					}
					RemoveItemFromSlot(pid,slcslot, -1);
					PlayerTextDrawColor( pid, baguse[selecteditem], -1);
					PlayerTextDrawBoxColor( pid, baguse[last_clicked_textdraw_row], COLOR_BAG_DEFAULT);
					baguse[selecteditem] = PlayerText:-1;
					baguse[last_clicked_textdraw_row] = PlayerText:-1;
					slcslot = -1;
					load_trunk(baguse[trunk_id], pid, 3, 3);
				}
				return 1;
			}
			else return notification(pid, "nieko nepasirinkai");
		}
		// Global TD'as
		if( clickedid == iTrunk[15])
		{
			// TODO: hideItemInfoBag(pid);
			if( baguse[tbagpageid] + 1 == GetMaxPagesTrunkBag(pid) )
				return 1;
			load_trunk(baguse[trunk_id], pid, 3, 1);
			return 1;
		}
		// Global TD'as
		if( clickedid == iTrunk[14])
		{
			// TODO: hideItemInfoBag(pid);
			if( baguse[tbagpageid] <= 0) return 1;
			load_trunk(baguse[trunk_id], pid, 3, 2);
			return 1;
		}

		if( clickedid == iTrunk[8])
		{
			// TODO: hideItemInfoBag(pid);
			if( baguse[ttrunkpageid] + 1 == GetMaxPagesTrunkTrunk(pid) )
				return 1;
			load_trunk(baguse[trunk_id], pid, 1, 3);
			return 1;
		}
		if( clickedid == iTrunk[9])
		{
			// TODO: hideItemInfoBag(pid);
			if( baguse[ttrunkpageid] <= 0) return 1;
			load_trunk(baguse[trunk_id], pid, 2, 3);
			return 1;
		}
	}
	
	return 1;
}

//--------------------------------------------------

Callback::OnPlayerSelectedMenuRow(pid, row)
{
	return 1;
}

//--------------------------------------------------

Callback::OnPlayerExitedMenu(pid)
{
	return 1;
}

//--------------------------------------------------

Callback::OnPlayerInteriorChange(pid, newinteriorid, oldinteriorid)
{
	return 1;
}

Callback::OnPlayerEnterDynamicArea(pid, areaid)
{
	if(!IsPlayerNPC(pid))
		printf("OnPlayerEnterDynamicArea(%i, %i)", pid, areaid);

	if(NOTICE_BOARD::ProcessArea(pid, areaid))
		return 1;

	if(vector_find(vDroppedWeapons+w_area, areaid) != -1)
	{
		show_area(pid, "Noredamas paimti ginkla, spausk ~y~ALT~w~.");
		ptemp[gunzone] = vector_find(vDroppedWeapons+w_area, areaid);
		return 1;
	}

	if(areaid == get.POINT_AREA[pid] && get.POINT[pid])
	{
		new coords<>;
		GetPlayerPos(pid, coords<>);
		DisablePlayerPoint(pid);
		new const smoke = CreateDynamicObject(18723, coords<>, 0.0, 0.0, 0.0, .playerid = pid);
		
		//SetDynamicObjectMaterialText(smoke, 0, " ", .backcolor = 0xff9600ff);
		inline killsmoke()
		{
			DestroyDynamicObject(smoke);
		}
		setTimer(using inline killsmoke, 2000, 0);
		return 1;
	}
	if(areaid == area[spawn_shop_area])
	{
		if(pinfo[current_quest] == 0)
		{
			notification2(pid, " + ~y~2~w~ patirties ( ~y~PT~w~ )");
			PLAYER::GiveExp(pid, 2);
			showTip(pid, TIP_NPC_TALK);
			++pinfo[current_quest]; // 1
			showQuest(pid);
			TogglePlayerDynamicArea(pid, area[spawn_shop_area], 0);
		}
		return 1;
	}

	if( ! player.flag.get(pid, fFirstFish) && player.bool.get(pid, bPrisijunges))
		for(new i; i != sizeof fishingspot; ++i)
			if(areaid == area[fishing_area][i])
			{
				showTip(pid, TIP_ZVEJYBA);
				player.flag.on(pid, fFirstFish);
				return 1;
			}

	for(new i; i != 13; ++i)
	{
		if(areaid == objects[gTag(i)][obj_other_ids][obj_area_id])
		{
			player.location.on(pid, lGangZone);
			infoMsg(pid, "player.location.get(pid, lGangZone) = %i", player.location.get(pid, lGangZone));

			set.GangZone[pid] = i;

			new const Result:r = sql_query(sqlHandle, F("SELECT gauja_name FROM zaidejai WHERE id = %i", objects[gTag(i)][obj_other_ids][obj_gang_id]), QUERY_CACHED);
			new txt[64];
			sql_get_field(r, 0, txt);
			PlayerTextDrawSetString(pid, p_gangzone[pid], F("Sia teritorija valdo '~y~%s~w~'.~n~Ju itaka siai teritorijai: ~y~%i", txt, objects[gTag(i)][obj_other_info][obj_gang_influence]));
			PlayerTextDrawShow(pid, p_gangzone[pid]);
			
			return 1;
		}
	}
	for(new i; i < sizeof medziai; ++i)
	{
		if(areaid == objects[gTree(i)][obj_other_ids][obj_area_id])
		{
			player.location.on(pid, lForest);
			show_area(pid, "medis");
			return 1;
		}
	}

	for(new i; i < MAX_FIRES; ++i)
	{
		if(fire[i][2] == areaid)
		{
			if(IsPlayerInAnyVehicle(pid))
			{
				new const veh = getPlayerVehicleID(pid);

				if( ! vehicle.bool.get(veh, fIsOnFire))
				{
					startFire(0,0,0,1,veh);
				}
			}
			if(get.timer_onfire[pid])
			{
				killTimer(get.timer_onfire[pid]);
				del.timer_onfire[pid];
			}
			inline onfiredmg()
			{
				DamagePlayer(pid, 0.58454, 37, PLAYER::GetHealth(pid), INVALID_PLAYER_ID);
			}
			set.timer_onfire[pid] = setTimer(using inline onfiredmg, 100, 1);
			return 1;
		}
	}

	if(vector_find(vArea_SlowDown, areaid) != -1 && IsPlayerInAnyVehicle(pid) && GetVehicleModel(GetPlayerVehicleID(pid)) != CAR_PD) 
	{
		if(get.area_pd[pid])
		{
			killTimer(get.area_pd[pid]);
			del.area_pd[pid];
		}
		new const vehid = vector_get(vArea_Vehicle, vector_find(vArea_SlowDown, areaid));
		new const pvehid = GetPlayerVehicleID(pid);
		inline AreaPD()
		{
			if(IsPlayerInAnyVehicle(pid) && IsValidVehicle(vehid))
			{
				if(GetVehicleDriver(vehid) != INVALID_PLAYER_ID)
				{
					new Float:xx,Float:yy,Float:zz;
					GetVehicleVelocity(pvehid, xx,yy,zz);
					//SetVehicleVelocity(pvehid, xx*0.8,yy*0.8,zz*0.8);
				}

			} else {

				killTimer(get.area_pd[pid]);
				del.area_pd[pid];
			}
		}
		set.area_pd[pid] = setTimer(using inline AreaPD, 400, 1);
		return 1;
	}

	if( areaid == area[mech_repair]) show_area(pid, AreaName[0]);
	else if( areaid == area[mech_tune]) show_area(pid, AreaName[1]);
	else if( areaid == area[arGarage]) show_area(pid, AreaName[2]);
	else if( areaid == area[mech_tech]) show_area(pid, AreaName[3]);

	else if( areaType[areaid] == IEJIMAS)
			show_area(pid, "Noredamas ieiti spausk ENTER.");

	else if( areaType[areaid] == ISEJIMAS)
			show_area(pid, "Noredamas iseiti spausk ENTER.");

	return 1;
}

func GetVehicleDriver(vehid)
{
	if(isPlayerInVehicle(car[vehid][driver], vehid) && GetPlayerState(car[vehid][driver]) == PLAYER_STATE_DRIVER)
	{
		return car[vehid][driver];
	}
	return INVALID_PLAYER_ID;
}

Callback::OnPlayerLeaveDynamicArea(pid, areaid)
{
	if(vector_find(vDroppedWeapons+w_area, areaid) != -1)
	{
		ptemp[gunzone] = -1;
		goto end;
	}

	if(vector_find(vArea_SlowDown, areaid) != -1) 
	{
		if(get.area_pd[pid])
			killTimer(get.area_pd[pid]);
		del.area_pd[pid];
		goto end;
	}

	for(new i; i != MAX_FIRES; ++i)
	{
		if(areaid == fire[i][2])
		{
			if(get.timer_onfire[pid])
			{
				killTimer(get.timer_onfire[pid]);
				del.timer_onfire[pid];
			}
			return 1;
		}
	}

	for(new i; i != 13; ++i)
	{
		if(areaid == objects[gTag(i)][obj_other_ids][obj_area_id])
		{
			player.location.off(pid, lGangZone);
			PlayerTextDrawHide(pid, p_gangzone[pid]);
			del.GangZone[pid];
			goto end;
		}
	}
	for(new i; i < sizeof medziai; ++i)
	{
		if(areaid == objects[gTree(i)][obj_other_ids][obj_area_id])
		{
			player.location.off(pid, lForest);
			if(PLAYER::IsFreezed(pid, KERTA_MEDI))
			{
				PLAYER::Freeze(pid, false, KERTA_MEDI);
			}

			goto end;
		}
	}

	end:
	hide_area(pid);
	return 1;
}

func show_area(pid, areaname[])
{
	PlayerTextDrawSetString(pid, pArea[pid], areaname);
	PlayerTextDrawShow(pid, pArea[pid]);
}

func hide_area(pid)
{
	PlayerTextDrawHide(pid, pArea[pid]);
}

//--------------------------------------------------
stock GetVehicleInfo(vehicleid, infotype, &Float:x, &Float:y, &Float:z, moreinfo = 0)
{
	if(!IsValidVehicle(vehicleid)) return 0;

	new	Float:x2, Float:y2, Float:z2, Float:a;

	GetVehicleModelInfo(GetVehicleModel(vehicleid), infotype, x2, y2 ,z2);

	switch(moreinfo)
	{
		case VEHICLE_MODEL_INFO_REAR:
		{
			y2 *= -1/2;
		}
		case VEHICLE_MODEL_INFO_FRONT:
		{
			y2 *= 1/2;
		}
	}

	GetVehiclePos(vehicleid, x, y, z);	
	GetVehicleZAngle(vehicleid,a);

	z += z2;

	x += (y2 * floatsin(-a, degrees));
	y += (y2 * floatcos(-a, degrees));

	a += 270.0;
	x += (x2 * floatsin(-a, degrees));
	y += (x2 * floatcos(-a, degrees));
	a -= 270.0;

	return 1;
}

Callback::OnPlayerKeyStateChange(pid, newkeys, oldkeys)
{
	/*
	new coords<5>;
	GetPlayerCameraPos(pid, coords<5>);
	if(!IsPlayerInRangeOfPoint(pid, 15, coords<5>) && !get.justFromVeh[pid] && !IsPlayerInAnyVehicle(pid) && !PLAYER::IsFreezed(pid) && player.bool.get(pid, bPrisijunges))
		Kick(playerid);
*/
	if(player.bool.get(pid, bIsInGarage))
	{
		if(PRESSED(KEY_JUMP))
		{
			hideGarage(pid);
			return 1;
		}
	}
	if(player.bool.get(pid, bIsInCarShop))
	{
		if(RELEASED(KEY_SECONDARY_ATTACK))
		{
			// pirkti car
			if(PLAYER::GetMoney(pid) < VehicleInfo[get.vehShopModel[pid]][vPrice])
			{
				notification(pid, F("Tau truksta dar ~y~%i ~w~lt.", VehicleInfo[get.vehShopModel[pid]][vPrice] - PLAYER::GetMoney(pid)));
			
			} else {

				PLAYER::GiveMoney(pid, -VehicleInfo[get.vehShopModel[pid]][vPrice]);
				new const id = get.vehShopID[pid];
				new const m = get.vehShopModel[pid];
				sql_query(sqlHandle, F("INSERT INTO kroviniai (tipas, data) VALUES ("#KROVINYS_MASINA",'%i %i %i %i')", pinfo[DBID], m+400, car[id][car_color1], car[id][car_color2]), QUERY_THREADED);
				inline success(iid, did, response, listitem, string:txt[])
				{
					#pragma unused iid, did, listitem, txt
					if(!response)
					{
						sql_query(sqlHandle, F("DELETE FROM kroviniai WHERE data = '%i %i %i %i'", pinfo[DBID], m+400, car[id][car_color1], car[id][car_color2]), QUERY_THREADED);
						PLAYER::GiveMoney(pid, VehicleInfo[get.vehShopModel[pid]][vPrice]);
					
					} else {

						hide_vehicleShop(pid);
					}
				}
				showDialog(pid, using inline success, DIALOG_STYLE_MSGBOX, " ", F(C_W" \n    Tavo iðsirinkta maðina ("C_SOC"%s"C_W") sëkmingai uþsakyta. Artimiausiu\n    metu fûristai jà pristatys á garaþà.\n\n    Jeigu nori atðaukti pirkimà, gali tai padaryti "C_SOC"tik"C_W" dabar.", GetVehicleNameByModel(m+400)), "Viskas gerai", "Atðaukti");
			}
			return 1;
		}
		if(PRESSED(KEY_FIRE))
		{
			// pirkti car uþ rubinus
			if(pinfo[rubinai] < VehicleInfo[get.vehShopModel[pid]][vPriceLT] * RUBINAI_UZ_LT)
			{
				notification(pid, F("Tau truksta dar ~y~%i ~w~rubinu.", VehicleInfo[get.vehShopModel[pid]][vPriceLT] * RUBINAI_UZ_LT - pinfo[rubinai]));
			
			} else {

				PLAYER::GiveRuby(pid, -VehicleInfo[get.vehShopModel[pid]][vPriceLT] * RUBINAI_UZ_LT);
				new const id = get.vehShopID[pid];
				new const m = get.vehShopModel[pid];
				sql_query(sqlHandle, F("INSERT INTO kroviniai (tipas, data) VALUES ("#KROVINYS_MASINA",'%i %i %i %i')", pinfo[DBID], m+400, car[id][car_color1], car[id][car_color2]), QUERY_THREADED);
				inline success(iid, did, response, listitem, string:txt[])
				{
					#pragma unused iid, did, listitem, txt
					if(!response)
					{
						sql_query(sqlHandle, F("DELETE FROM kroviniai WHERE data = '%i %i %i %i'", pinfo[DBID], m+400, car[id][car_color1], car[id][car_color2]), QUERY_THREADED);
						PLAYER::GiveMoney(pid, VehicleInfo[get.vehShopModel[pid]][vPrice]);
					
					} else {

						hide_vehicleShop(pid);
					}
				}
				showDialog(pid, using inline success, DIALOG_STYLE_MSGBOX, " ", F(C_W" \n    Tavo iðsirinkta maðina ("C_SOC"%s"C_W") sëkmingai uþsakyta. Artimiausiu\n    metu fûristai jà pristatys á garaþà.\n\n    Jeigu nori atðaukti pirkimà, gali tai padaryti "C_SOC"tik"C_W" dabar.", GetVehicleNameByModel(m+400)), "Viskas gerai", "Atðaukti pirkimà");
			}
			return 1;
		}
		if(PRESSED(KEY_ACTION))
		{
			hide_vehicleShop(pid);
		}
		if(PRESSED(KEY_SPRINT))
		{
			//try_vehicleShop(pid);
		}
		return 1;
	}
	if(player.location.get(pid, lForest) && PRESSED(KEY_FIRE))
	{
		if(tickcheck(pid, 500)) return 1;
		new const s = findItemInBag(pid, ITEM::pjuklas);
		if(s == -1) return 1;
		new coords<1>, /*coords<2>,*/ coords<3>;
		//GetXYInFrontOfPlayer(pid, coords<2>, 0.5);
		GetPlayerPos(pid, coords<3>);
		for(new i; i < sizeof medziai; ++i)
		{
			if( ! object.flag.get(gTree(i), fIsInUse))
			{
				GetDynamicObjectPos(objects[gTree(i)][obj_id], coords<1>);
				if(/*GDBP(coords<1>, coords<2>) < 0.5 &&*/ IsPlayerInDynamicArea(pid, objects[gTree(i)][obj_other_ids][obj_area_id]))
				{
					if(object.flag.get(gTree(i), fIsActive))
					{
						object.flag.on(gTree(i), fIsInUse);
						switch(objects[gTree(i)][obj_other_info][obj_state])
						{
							case OBJ_STATE_NORMAL:
							{
								if( ! flag_get(bag[s][item_info], IS_INUSE))
								{
									UnuseAttachInSlot(pid, SLOT_RIGHTHAND, true);
									SetPlayerAttachedObject(pid, SLOT_RIGHTHAND, 341, 6, 0,0,0,0);
									flag_on(bag[s][item_info], IS_INUSE);
								}
								PLAYER::Freeze(pid, true, KERTA_MEDI);
								ptemp[kertamas_medis] = i;
								socf(pid, WOOD_BAR_START, "%i", objects[gTree(i)][obj_other_info][obj_counting]);
								return 1;
							}
							case OBJ_STATE_ONGROUND:
							{
								if( ! flag_get(bag[s][item_info], IS_INUSE))
								{
									UnuseAttachInSlot(pid, SLOT_RIGHTHAND, true);
									SetPlayerAttachedObject(pid, SLOT_RIGHTHAND, 341, 6, 0,0,0,0);
									flag_on(bag[s][item_info], IS_INUSE);
								}
								PLAYER::Freeze(pid, true, KERTA_MEDI);
								ptemp[kertamas_medis] = i;
								socf(pid, WOOD_BAR_START, "%i", objects[gTree(i)][obj_other_info][obj_counting]);
								return 1;
							}
						}
					}
				}
			}
		}
	}
	if(PRESSED(KEY_AIM))
	{
		switch(GetPlayerSpecialAction(pid))
		{
			case 20..23: SetPlayerSpecialAction(pid, SPECIAL_ACTION_NONE);
		}
	}
	if(PRESSED(KEY_JUMP) && GetPlayerState(pid) == PLAYER_STATE_ONFOOT)
	{
		new coords<1>;
		inline slowdown()
		{
			GetAnimationName(GetPlayerAnimationIndex(pid), animlib, 32, animname, 32);
			if(!strcmp(animname, "JUMP_LAUNCH"))
			{
				GetPlayerVelocity(pid, coords<1>);
				SetPlayerVelocity(pid, _x1*0.4, _y1*0.4, _z1);
			}
		}
		setTimer(using inline slowdown, 300, 0);
	}
	if(PRESSED(KEY_WALK))
	{
		if(NOTICE_BOARD::IsNearBoard(pid))
		{
			NOTICE_BOARD::Show(pid);
		}
		if(ptemp[gunzone] != -1)
		{
			if(vector_index_exists(vDroppedWeapons+w_weapon_id, ptemp[gunzone]))
			{
				ApplyAnimation(playerid, "BSKTBALL", "BBALL_PICKUP", 4.0, 0, 0, 0, 0, 1000);
				new const id = vector_get(vDroppedWeapons+w_weapon_id, ptemp[gunzone]);
				new efc[eBonus];
				vector_get_arr(vDroppedWeapons+w_weapon_flags, ptemp[gunzone], efc);
				new const areaid = vector_get(vDroppedWeapons+w_area, ptemp[gunzone]);
				AddItem(pid, id, 1, efc);
				DestroyObject(vector_get(vDroppedWeapons+w_object, ptemp[gunzone]));
				Delete3DTextLabel(Text3D:vector_get(vDroppedWeapons+w_text, ptemp[gunzone]));
				vector_remove(vDroppedWeapons+w_object, ptemp[gunzone]);
				vector_remove(vDroppedWeapons+w_area, ptemp[gunzone]);
				vector_remove(vDroppedWeapons+w_text, ptemp[gunzone]);
				vector_remove(vDroppedWeapons+w_weapon_id, ptemp[gunzone]);
				vector_remove(vDroppedWeapons+w_weapon_flags, ptemp[gunzone]);
				destroyDynamicArea(areaid);
			}
		}
		new const id = GetPlayerTargetPlayer(pid);

		if(IsPlayerNPC(id))
		{
			ClickOnNPC(pid, id);

		} else if(id != INVALID_PLAYER_ID)
		{
			OnPlayerClickPlayer_Mouse1(pid, id);
			
			return 1;
		}
		return 1;
	}
	if(RELEASED(KEY_SPRINT))
	{
		if( get.zvejoja[pid])
		{
			PLAYER::Freeze(pid, false, ZVEJOJA);
			notification(pid, "Istraukei vala");
			return 1;
		}
		return 1;
	}
	if(tickcheck(pid, 100)) return 1;

	if( RELEASED(KEY_NO))
	{
		SelectTextDraw(pid, COLOR_SELECT);
		return 1;
	}
	if( PRESSED(KEY_ACTION))
	{
		//if( tickcheck(pid, 1000);) return 1;
		new const veh = GetPlayerVehicleID(pid);
		if( IsPlayerInAnyDynamicArea(pid))
		{
			if( IsPlayerInDynamicArea(pid, area[mech_repair]) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
			{
				new const pVeh = getPlayerVehicleID(pid);
				new const vTrl = GetVehicleTrailer(pVeh);
				if(car[pVeh][car_status] == cNeedsRepair || car[pVeh][car_status] == cCrashed)
				{
					if(vTrl != INVALID_VEHICLE_ID)
					{
						detachTrailerFromVehicle(pVeh);
					}
					vehToRemont(pVeh);

				} else if(vTrl != INVALID_VEHICLE_ID) {

					if(car[vTrl][car_status] == cNeedsRepair || car[vTrl][car_status] == cCrashed)
					{
						detachTrailerFromVehicle(pVeh);
						vehToRemont(vTrl);
					}
				}
				return 1;
			}
			if( IsPlayerInDynamicArea(pid, area[mech_tech]))
			{
				if(GetPlayerState(pid) == PLAYER_STATE_DRIVER)
				{
					new const xin = getPlayerVehicleID(pid);
					if(xin == pinfo[carid] || car[xin][car_savininkas] == pinfo[DBID])
					{
						if(!car[xin][gedimai] && car[xin][car_status] == cOkay)
						{
							notification2(pid, "Tavo masina techniskai tvarkinga.");
							car[xin][technikine] = gettime() + 604800; // savaitë ( 60*60*24*7 )
						
						} else {

							head(gt, "Tavo maðina yra techniðkai netvarkinga.");
							if(vehicle.error.get(xin, gEngine))
								newrow(gt, "Neveikia variklis.");
							if(vehicle.error.get(xin, gBrakes))
								newrow(gt, "Neveikia stabdþiai.");
							if(vehicle.error.get(xin, gTires))
								newrow(gt, "Sprogusios padangos.");
							if(vehicle.error.get(xin, gFuel))
								newrow(gt, "Prakiuræs degalø bakas.");
							if(vehicle.error.get(xin, gSankaba))
								newrow(gt, "Sugedusi sankaba.");
							if(car[xin][car_status] != cOkay)
								newrow(gt, "Maðinai reikalingas remontas mechanikø garaþe.");

							car[xin][technikine] = gettime(); // baigësi dabar

							ShowPlayerDialog(pid, 0, DIALOG_STYLE_MSGBOX, " ", gt, "Uþdaryti", "");
						}
					
					} else {

						notification2(pid, "Technikine apziura galima tik asmeninems masinoms.");
					}
				}
				return 1;
			}
			if( IsPlayerInDynamicArea(pid, area[mech_tune]))
			{
				return 1;
			}
			if( IsPlayerInDynamicArea(pid, area[arGarage]))
			{
				if(GetPlayerState(pid) == PLAYER_STATE_DRIVER)
				{
					if(player.bool.get(pid, bIsInGarage))
					{
						hideGarage(pid);

					} else {

						if(getPlayerVehicleID(pid) == pinfo[carid])
						{
							showGarage(pid);

						} else {

							notification2(pid, "I garaza gali atvaziuoti tik su savo masina.");
						}
					}
				}
			}
		}
		if( GetVehicleModel(veh) == CAR_MECHANIKU)
		{
			if( IsTrailerAttachedToVehicle(veh))
				return DetachTrailerFromVehicle(veh), 1;

			new coords<1>,	coords<2>,/* coords<3>,*/ Float:va, Float:va1;

			GetXYInRearOfVehicle(veh, coords<1>);
			new const closestveh = GetClosestVehicleFromPoint(coords<1>, veh);

			GetXYInFrontOfVehicle(closestveh, coords<2>);
			//GetXYInRearOfVehicle(closestveh, coords<3>);

			GetVehicleZAngle(veh, va);
			GetVehicleZAngle(closestveh, va1);

			if( GDBP(coords<1>, coords<2>) < 3/* || GDBP(coords<1>, coords<3>) < 3*/)
			{
				AttachTrailerToVehicle(closestveh, veh);
			
			} else {

				if( GDBP(coords<1>, coords<2>) < 8/* && GDBP(coords<1>, coords<3>) < 8*/)
				{
					notification2(pid, "Masina siek tiek per toli.");
				}
			}
			return 1;
		}
		return 1;
	}
	if( PRESSED(KEY_FIRE) || PRESSED(KEY_SECONDARY_ATTACK))
	{
		if( PRESSED(KEY_FIRE) && IsPlayerInDynamicArea(pid, area[arGarage]) && GetPlayerState(pid) == PLAYER_STATE_ONFOOT)
		{
			if(player.bool.get(pid, bIsInGarage))
			{
				hideGarage(pid);
			
			} else {

				if(pinfo[carid] != INVALID_VEHICLE_ID)
				{
					notification2(pid, "I garaza turi atvaziuoti su savo masina");

				} else {

					showGarage(pid);
				}
			}
			return 1;
		
		} else if(PRESSED(KEY_SECONDARY_ATTACK)) {

			if(player.bool.get(pid, bIsInGarage))
			{
				if(pinfo[carid] != INVALID_VEHICLE_ID)
				{
					car[ pinfo[carid] ][car_status] = cGarage;
					SaveVehicle(pinfo[carid], QUERY_NONE);
				}
				new const sqlId = vector_get(getGarageIndex(pid, gSqlId), get.gCurrent[pid]);
				pinfo[carid] = LoadVehicle(sqlId);
				if(pinfo[carid] != INVALID_VEHICLE_ID)
				{
					setVehiclePos(pinfo[carid], pos_garazas);
					inline fixz() setVehicleZAngle(pinfo[carid], 180);
					setTimer(using inline fixz, 200, false);
					putPlayerInVehicle(pid, pinfo[carid], 0);
					car[ pinfo[carid] ][car_status] = cOkay;
					SaveVehicle(pinfo[carid],QUERY_NONE, true);
				}
				hideGarage(pid);
			}
		}
		switch(GetPlayerWeapon(pid))
		{
			case 41:
			{
				for(new i; i < gTag_count; ++i)
				{

					if( ! object.flag.get(gTag(i), fIsActive)) 
					{
						new coords<1>; // GAUNAM POZICIJÀ !@#$#@!
						GetDynamicObjectPos(objects[gTag(i)][obj_id], coords<1>);

						if(IsPlayerInRangeOfPoint(pid, 2, coords<1>)) 
						{
												// RADOM TAGA #@#!%#!$@!@@#$!

												// dbar teritorija jo gaujos !!
												objects[gTag(i)][obj_other_ids][obj_gang_id] = pinfo[gauja];

												objects[gTag(i)][obj_other_info][obj_gang_influence] = 200;

												// gauja active !!
												object.flag.on(gTag(i), fIsActive);

												// dynamic area
												objects[gTag(i)][obj_other_ids][obj_area_id] = CreateDynamicCircle(_x1,_y1,50);

												Update3DTextLabelText(objects[gTag(i)][obj_other_ids][obj_text_id], COLOR_SOC, F("Teritorijà valdo '%s'", PLAYER::GANG::GetName(pid)));
												

												// COLLECT ALL THE 1000 POINT !! or less

												inline repeat() // REPEAT !!!!
												{
													new keys, lr, ud;
													GetPlayerKeys(pid, keys, lr, ud);

													if(IsPlayerInRangeOfPoint(pid, 2, coords<1>) && keys & KEY_FIRE && objects[gTag(i)][obj_other_info][obj_gang_influence] < 1000)
													{
														++objects[gTag(i)][obj_other_info][obj_gang_influence];
														PlayerTextDrawSetString(pid, p_gangzone[pid], F("Sia teritorija valdo '~y~%s~w~'.~n~Ju itaka siai teritorijai: ~y~%i", PLAYER::GANG::GetName(pid), objects[gTag(i)][obj_other_info][obj_gang_influence]));
														PlayerTextDrawShow(pid, p_gangzone[pid]);
													
													} else {

														killTimer(get.spray_time[pid]);
														del.spray_time[pid];
														RemoveItem(pid, ITEM::spraycan, 1);
														removePlayerWeapon(pid, GetPlayerWeapon(pid));
													}
												}
												if(get.spray_time[pid]) // IMPOSSIBLE, kad taip atsitiktø, bet a vdruk.
												{
													killTimer(get.spray_time[pid]);
													del.spray_time[pid];
												}
												set.spray_time[pid] = setTimer(using inline repeat, 50, true);


						}
					}
				}
			}
			case 42:
			{

			}
		}
		if(GetVehicleModel(GetPlayerVehicleID(pid)) == CAR_GAISRINE)
		{
			inline _fire()
			{
				new keys, lr, ud, veh = getPlayerVehicleID(pid);
				GetPlayerKeys(pid, keys, lr, ud);
				if(veh != INVALID_VEHICLE_ID)
				{
					if(car[veh][car_model] == CAR_GAISRINE && keys & KEY_FIRE)
					{
						if(fire_count)
						{
							new Float:x,Float:y,Float:z;
							for(new i; i < MAX_FIRES; ++i)
							{
								switch(fire[i][4])
								{
									case -1: 	GetObjectPos(fire[i][0], x,y,z);
									case 0:		GetPlayerPos(fire[i][3], x,y,z), z -= 1.3;
									case 1:		GetVehiclePos(fire[i][3], x,y,z);
								}	

								if(IsPlayerLookingAtPoint(pid, x,y,z))
								{
									fire[i][1]--;
									notification2(pid, f("%i", fire[i][1]));
									set.firecount[pid] = get.firecount[pid] + 1;
									if(get.firecount[pid] == 50)
									{
										PLAYER::GiveExp(pid, 1, true);
										del.firecount[pid];
									}
									if(fire[i][1] <= 0)
									{
										killFire(i);
										PLAYER::GiveExp(pid, 1, true);
										if(timer_fire[pid])
										{
											killTimer(timer_fire[pid]);
											timer_fire[pid] = 0;
										}
									}
									break;
								}
							}
						}

					} else {

						if(timer_fire[pid])
						{
							killTimer(timer_fire[pid]);
							timer_fire[pid] = 0;
						}
					}

				} else {

					if(timer_fire[pid])
					{
						killTimer(timer_fire[pid]);
						timer_fire[pid] = 0;
					}
				}
			}
			if(timer_fire[pid])
				killTimer(timer_fire[pid]);
			timer_fire[pid] = setTimer(using inline _fire, 100, 1);
		}
	}	
	if( RELEASED(KEY_FIRE))
	{
		if( (IsPlayerInCircle(pid, 632.9222, -581.4429, 10) || IsPlayerInCircle(pid, 632.9222, -581.4429, 10)) && GetPlayerVirtualWorld(pid) == 0 && (GetPlayerWeapon(pid) == 0 || 1))
		{
			if( !IsItemInBag(pid, ITEM::raktai_pd_vartai))
			{
				notification(pid, "Neturi raktu nuo siu vartu");

			} else if( !object.bool.get(fPD_vartai)) {

				MoveDynamicObject(pd_vartai, 632.9222, -586.9113, 17.1822, 2);
				object.bool.on(fPD_vartai);
				notification(pid,  "Vartai atidaromi");
			
			} else {

				MoveDynamicObject(pd_vartai, 632.9222, -581.4429, 17.1822, 2);
				object.bool.off(fPD_vartai);
				notification(pid,  "Vartai uzdaromi");
			}
			return 1;
		}

		if(timer_fire[pid] != 0)
		{
			killTimer(timer_fire[pid]);
			timer_fire[pid] = 0;
		}
		if(get.spray_time[pid])
		{
			killTimer(get.spray_time[pid]);
			del.spray_time[pid];
			RemoveItem(pid, ITEM::spraycan, 1);
			removePlayerWeapon(pid, GetPlayerWeapon(pid));
		}

		if( player.bool.get(pid,bPilaDegalus)  )
		{
			PLAYER::Freeze(pid, false, DEGALAI);
			return 1;
		}
		return 1;
	}
	if( RELEASED(KEY_SECONDARY_ATTACK))
	{
		//if(IsPlayerInRangeOfPoint(pid, 3, ))
		if( IsPlayerInAnyDynamicArea(pid))
		{
			return Enter(pid);
		}
		if( player.bool.get(pid,bPilaDegalus)  )
		{
			PLAYER::Freeze(pid, false, DEGALAI);
			return 1;
		}
		if(timer_fire[pid] != 0)
		{
			killTimer(timer_fire[pid]);
			timer_fire[pid] = 0;
		}
		return 1;
	}
	return 1;
}

//--------------------------------------------------

Callback::OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

func updateGangZones()
{

}

//--------------------------------------------------

Callback::OnPlayerUpdate(pid)
{
	//GetAnimationName(GetPlayerAnimationIndex(pid), animlib, 32, animname, 32);
	//infoMsg(pid, "animlib: %s   animname: %s", animlib, animname);
	if(player.bool.get(pid, bIsInGarage))
	{
		if(GetTickCount() - 400 > tinfo[garage_diff] || tinfo[garage_pause])
		{
			tinfo[garage_diff] = GetTickCount();
			static keys, ud, lr;
			GetPlayerKeys(pid, keys, ud, lr);

			new id = get.gCurrent[pid];
			new frame = get.currentFrame[pid];

			if(lr > 0) // right 
			{
				++id;
				++frame;

				if(id < get.gCount[pid])
				{
					set.gCurrent[pid] = id;
					if(frame < 4)
					{
						set.currentFrame[pid] = frame;
						TextDrawHideForPlayer(pid, g_garage[13 + 10 * (frame-1)]);
						TextDrawShowForPlayer(pid, g_garage[13 + 10 * frame]);
					}
					showGarageByID(pid, frame, -1, id);
				}

				tinfo[garage_pause] = 0;

			} else if(lr) { // left

				--id;
				--frame;
				if(id > -1)
				{
					set.gCurrent[pid] = id;

					if(frame > -1)
					{
						set.currentFrame[pid] = frame;
						TextDrawHideForPlayer(pid, g_garage[13 + 10 * (frame+1)]);
						TextDrawShowForPlayer(pid, g_garage[13 + 10 * frame]);
						//showGarageByID(pid, frame, 1, id);

					}

						showGarageByID(pid, frame, 1, id);
					
				}

				tinfo[garage_pause] = 0;

			} else {

				tinfo[garage_pause] = 1;
			}
		}
	}
	if(GetPlayerState(pid) == PLAYER_STATE_DRIVER)
	{
		updateVehicleHealth(getPlayerVehicleID(pid));
		new const i = pid;
		new const veh = getPlayerVehicleID(i);
		static coords<1>, keys, lr, ud;
		getVehicleVelocity(veh, coords<1>);

		GetPlayerKeys(i, keys, ud, lr);

		getVehicleZAngle(veh, rotation_now[pid]);

		if( ! velocity_now[pid][0] && ! velocity_now[pid][1] && ! velocity_now[pid][2])
		{
			velocity_now[pid][0] = _x1;
			velocity_now[pid][1] = _y1;
			velocity_now[pid][2] = _z1;
		
		} else {

			velocity_last[pid][0] = velocity_now[pid][0];
			velocity_last[pid][1] = velocity_now[pid][1];
			velocity_last[pid][2] = velocity_now[pid][2];
		}

		speed_last[i] = speed_now[i];
		speed_now[i] = getSpeed(_x1, _y1);
		time_last[pid] = time_now[pid];
		time_now[pid] = GetTickCount();
		speed_acceleration[i] = ( speed_now[i] - speed_last[i] ) / ((time_now[pid] - time_last[pid])/1000);

		if(speed_now[i])
		{
			if(keys & KEY_JUMP && speed_acceleration[i] < 0)
			{
				++car[veh][gBrakes_status];
			}
			if(keys & KEY_HANDBRAKE && speed_now[i] > 30) // Vaþiuoji paprastai ir stabdai su space
			{
				++car[veh][gTires_status];
				++car[veh][gBrakes_status];
			
			}
			if(0 < speed_now[i] < 10)
			{

				if(lr && floatabs(rotation_now[pid] - rotation_last[pid]) > 40)
				{
					car[veh][gTires_status] += 20+random(10);
					rotation_last[pid] = rotation_now[pid];
				}

			}
			if(speed_now[i] > 60)
			{
				//new Float:angle = floatabs(getangle(velocity_now[pid], velocity_last[pid]) - rotation_now[pid]);
				//infoMsg(pid, "%f", angle);
				//if(angle > 40 ) // jeigu driftina > 40 laipsniø kampu ir tam uþtruko maþiau negu 4sec
				if(lr)
				{
					if(time_last_check[pid] + 1 < gettime())
					{
				//		time_last_check[pid] = gettime();
				//		velocity_now[pid][0] = _x1;
				//		velocity_now[pid][1] = _y1;
				//		velocity_now[pid][2] = _z1;
						++car[veh][gTires_status];

				//	} else {

				//		time_last_check[pid] = gettime();
					}

				} else {

					time_last_check[pid] = gettime();
				}
			}

			notification(i, F("%stires = %i~w~, %sbrakes = %i", (vehicle.error.get(veh, gTires))?("~r~"):("~w~"), car[veh][gTires_status], (vehicle.error.get(veh, gBrakes))?("~r~"):("~w~"), car[veh][gBrakes_status]));

			if(car[veh][gTires_status] >= 500)
			{
				car[veh][gTires_status] = 0;
				static Panels, Doors, Lights, Tires;
				getVehicleDamageStatus(veh, Panels, Doors, Lights, Tires);
				new j = 1;
				while(j <= 8)
				{
					if(!flag_get(Tires, j))
					{
						flag_on(Tires, j);
						break;
					}
					j <<= 1;
				}
				if(Tires == 0b1111)
				{
					vehicle.error.on(veh, gTires);
				}
				updateVehicleDamageStatus(veh, Panels, Doors, Lights, Tires);
				notification2(i, "Sprogo padanga");
			}
			if(car[veh][gBrakes_status] >= 500)
			{
				vehicle.error.on(veh, gBrakes);
				car[veh][gBrakes_status] = 0;
			}
			if(vehicle.error.get(veh, gBrakes))
			{
				//notification2(pid, F("speed_now = %.2f ,  max_speed / 3 = %.2f", speed_now[i], VehicleInfo[getVehicleModel(veh)-400][vMaxSpeed] / 3));
				if(speed_now[i] > VehicleInfo[getVehicleModel(veh)-400][vMaxSpeed] / 3)
				{
					new const Float:proc = (VehicleInfo[getVehicleModel(veh)-400][vMaxSpeed] / 3) / speed_now[i];
					setVehicleVelocity(veh, _x1*proc, _y1*proc, _z1*proc);
				}
			}

			if(vehicle.error.get(veh, gEngine))
			{
				engineoff(veh);
			}
			if(vehicle.error.get(veh, gPlug))
			{
				if(!random(20))
				{
					//setVehicleVelocity(veh, _x1/3, _y1/3, _z1/3);
				}
			}
		}

		car[veh][rida] += speed_now[i] / ((time_now[pid] - time_last[pid]) * 1000);

		infoMsg(pid, "%f += %f", car[veh][rida], speed_now[i] / ((time_now[pid] - time_last[pid]) * 1000));

		if(get.spd[i] + 2000 < GetTickCount())
		{
			socf(i,SPD, "%i %f", car[veh][degalai], car[veh][rida]);
			set.spd[i] = GetTickCount();
		}
	}	
	if(pinfo[death_state] == DEATH_STATE_HOSPITAL)
	{
		if(ptemp[hospital_diff] + 15 + random(5) < gettime())
		{
			ptemp[hospital_diff] = gettime();

			new add = random(2) + 1;
			if(pinfo[vip]) add *= 2;
			PLAYER::SetHealth(pid, PLAYER::GetHealth(pid) + add);
			SetPlayerDrunkLevel(pid, GetPlayerDrunkLevel(pid) - 500);

			if(PLAYER::GetHealth(pid) >= 30)
			{
				notification2(pid, "Tavo sveikata jau stabili, jeigu nori iseiti, spausk ~y~ENTER~w~.");
			}
		
		} else {

			new keys, ud, lr;
			GetPlayerKeys(pid, keys, ud, lr);

			if(keys & KEY_SECONDARY_ATTACK)
			{
				if(PLAYER::GetHealth(pid) < 40)
				{
					notification2(pid, "Tavo sveikatos bukle - kritine, palauk kol atsigausi bent minimaliai.");
				
				} else {

					notification2(pid, "Esi paleidziamas is ligonines.");
					PLAYER::Freeze(pid, false, GULI_LIGONINEI);
				}
			}
		}
	}
	if(PLAYER::IsFreezed(pid, TVARKO) || PLAYER::IsFreezed(pid, TVARKO_GARAZE))
	{
		GetAnimationName(GetPlayerAnimationIndex(pid), animlib, 32, animname, 32);
		if(strcmp(animname, "BOM_PLANT_LOOP"))
		{
			ApplyAnimation(playerid, "BOMBER", "BOM_PLANT_LOOP", 4.0, 1, 0, 0, 0, 0);
		}
	}
	if(player.bool.get(pid, bBasketBall))
	{
		new keys, ud, lr;

		GetAnimationName(GetPlayerAnimationIndex(pid), animlib, 32, animname, 32);
		GetPlayerKeys(pid, keys, ud, lr);

		if(player.bball.get(pid, bBall))
		{
			if(	!player.bball.get(pid, bSoka) &&
					!player.bball.get(pid, bMeta) &&
					!player.bball.get(pid, bLeidzias)
			  )
			{
				new Float:x,Float:y,Float:z;
				GetPlayerCameraFrontVector(pid, x,y,z);
				new Float:angle = atan2(y, x);
				if(angle < 0) angle += 2 * 180 + 90;
				if(angle < 0) angle += 360;
				if(angle > 360) angle -= 360;
				//infoMsg(pid, "angle %.3f", angle);

				if(player.bball.get(pid, bBlokuoja))
				{
					if(lr < 0) // left
					{
						player.bball.off(pid, bDesine);
						player.bball.on(pid, bKaire);
						if(strcmp(animname, "BBALL_DEF_STEPL"))
						{
							ApplyAnimation(playerid, "BSKTBALL", "BBALL_DEF_STEPL", 4.0, 1, 1, 1, 0, 1000);
						}

					} else if(lr > 0) { // right

						SetPlayerFacingAngle(pid, angle);
						player.bball.off(pid, bKaire);
						player.bball.on(pid, bDesine);
						if(strcmp(animname, "BBALL_DEF_STEPR"))
						{
							ApplyAnimation(playerid, "BSKTBALL", "BBALL_DEF_STEPR", 4.0, 1, 1, 1, 0, 1000);
						}

					} else {

						player.bball.off(pid, bKaire);
						player.bball.off(pid, bDesine);
						if(strcmp(animname, "BBALL_DEF_LOOP"))
						{
							ApplyAnimation(playerid, "BSKTBALL", "BBALL_DEF_LOOP", 4.0, 1, 0, 0, 0, 1000);
						}
					}
					SetPlayerFacingAngle(pid, angle);
					
				} else if(player.bball.get(pid, bRun))
				{
					if(!lr && !ud)
					{
						if(strcmp(animname, "BBALL_IDLELOOP"))
						{
							ApplyAnimation(playerid, "BSKTBALL", "BBALL_IDLELOOP", 4.0, 1, 0, 0, 0, 0);
						}

					} else {

						new Float:fangle;
			//			GetPlayerFacingAngle(pid, fangle);
				//		new Float:angle_diff = floatabs(fangle - angle);


						if(lr < 0) // left
						{
							fangle = angle - 90;
						}
						if(lr > 0) // right
						{
							fangle = angle + 90;
						}
						if(ud > 0) // up
						{
							fangle = angle;
						}
						if(ud < 0) // down
						{
							fangle = angle + 180;
						}
						if(fangle < 0) fangle += 360;
						if(fangle > 360) fangle -= 360;
						SetPlayerFacingAngle(pid, fangle);


						if(strcmp(animname, "BBALL_WALK"))
						{
							ApplyAnimation(playerid, "BSKTBALL", "BBALL_WALK", 4.0, 1, 1, 1, 0, 0);
						}
					}

				} else if(player.bball.get(pid, bWalk))
				{
					if(lr < 0) // left
					{
						player.bball.on(pid, bKaire);

					} else { // right


					}
				}
				
			}

		} else {


		}
	}
	if(player.bool.get(pid, bBloodScreen))
	{
		if(ptemp[blood_diff] + 100 < GetTickCount())
		{
			ptemp[blood_diff] = GetTickCount();
			//infoMsg(pid, "blood_count %i  blood %i", ptemp[blood_count], ptemp[blood]);
			TextDrawColor(g_blood[ptemp[blood]], RGBAToHex(255,255,255, ptemp[blood_count]));
			TextDrawHideForPlayer(pid, g_blood[0]);
			TextDrawHideForPlayer(pid, g_blood[1]);
			TextDrawHideForPlayer(pid, g_blood[2]);
			TextDrawShowForPlayer(pid, g_blood[ptemp[blood]]);
			ptemp[blood_count] -= 10 - 3*ptemp[blood];
			if(ptemp[blood_count] <= 0)
			{
				player.bool.off(pid, bBloodScreen);
				ptemp[blood_count] = 0;
				TextDrawHideForPlayer(pid, g_blood[0]);
				TextDrawHideForPlayer(pid, g_blood[1]);
				TextDrawHideForPlayer(pid, g_blood[2]);
			} 
		}
	}
	if(player.bool.get(pid, bIsInCarShop))
	{
		if(GetTickCount() - 400 > tinfo[vehshop_diff] || get.vehShopPause[pid])
		{
			tinfo[vehshop_diff] = GetTickCount();
			new keys, ud, lr;
			GetPlayerKeys(pid, keys, ud, lr);

			new const veh = get.vehShopID[pid];

			if(lr > 0)
			{
				// RIGHT

				killVehicle(veh);
				new m = getShopVehicle(get.vehShopModel[pid], 1);
				set.vehShopID[pid] = createVehicle(m+400, 258.1422,-249.3557,1.3748, 264.3596);
				set.vehShopModel[pid] = m;
				putPlayerInVehicle(pid, get.vehShopID[pid], 1);
				PlayerTextDrawSetString(pid, p_carShop[2][pid], GetVehicleNameByModel(getShopVehicle(m, -1) + 400));
				PlayerTextDrawSetString(pid, p_carShop[1][pid], GetVehicleNameByModel(getShopVehicle(m, 1) + 400));
				PlayerTextDrawSetString(pid, p_carShop[0][pid], GetVehicleNameByModel(m + 400));
				PlayerTextDrawSetString(pid, p_carShop[3][pid], F("greitis: ~y~%i ~w~km/h", VehicleInfo[m][vMaxSpeed]));
				PlayerTextDrawSetString(pid, p_carShop[4][pid], F("svoris: ~y~%i ~w~kg", VehicleInfo[m][vWeight]));
				PlayerTextDrawSetString(pid, p_carShop[5][pid], F("vietos: ~y~%i", MaxSeats[m]));
				PlayerTextDrawSetString(pid, p_carShop[6][pid], F("bagazines talpa: ~y~%i ~w~kg", VehicleInfo[m][vTrunkSize]));
				PlayerTextDrawSetString(pid, p_carShop[7][pid], F("kaina: ~w~~g~%i ~w~lt", VehicleInfo[m][vPrice]));
				PlayerTextDrawSetString(pid, p_carShop[8][pid], F("rubinai: ~w~~r~%i     ~y~ALT", VehicleInfo[m][vPriceLT]*RUBINAI_UZ_LT));


				SetPlayerCameraPos(playerid, 264.939819,-252.252807,2.552004);
				SetPlayerCameraLookAt(playerid, 255.932861,-248.655487,0.116029);

				del.vehShopPause[pid];

			} else if(lr < 0) {

				// LEFT

				killVehicle(veh);
				new const m = getShopVehicle(get.vehShopModel[pid], -1);
				set.vehShopID[pid] = createVehicle(m+400, 258.1422,-249.3557,1.3748, 264.3596);
				set.vehShopModel[pid] = m;
				putPlayerInVehicle(pid, get.vehShopID[pid], 1);
				PlayerTextDrawSetString(pid, p_carShop[2][pid], GetVehicleNameByModel(getShopVehicle(m, -1) + 400));
				PlayerTextDrawSetString(pid, p_carShop[1][pid], GetVehicleNameByModel(getShopVehicle(m, 1) + 400));
				PlayerTextDrawSetString(pid, p_carShop[0][pid], GetVehicleNameByModel(m + 400));
				PlayerTextDrawSetString(pid, p_carShop[3][pid], F("greitis: ~y~%i ~w~km/h", VehicleInfo[m][vMaxSpeed]));
				PlayerTextDrawSetString(pid, p_carShop[4][pid], F("svoris: ~y~%i ~w~kg", VehicleInfo[m][vWeight]));
				PlayerTextDrawSetString(pid, p_carShop[5][pid], F("vietos: ~y~%i", MaxSeats[m]));
				PlayerTextDrawSetString(pid, p_carShop[6][pid], F("bagazines talpa: ~y~%i ~w~kg", VehicleInfo[m][vTrunkSize]));
				PlayerTextDrawSetString(pid, p_carShop[7][pid], F("kaina: ~w~~g~%i ~w~lt", VehicleInfo[m][vPrice]));
				PlayerTextDrawSetString(pid, p_carShop[8][pid], F("rubinai: ~w~~r~%i     ~y~ALT", VehicleInfo[m][vPriceLT]*RUBINAI_UZ_LT));

				SetPlayerCameraPos(playerid, 264.939819,-252.252807,2.552004);
				SetPlayerCameraLookAt(playerid, 255.932861,-248.655487,0.116029);

				del.vehShopPause[pid];

			}/* else if(ud > 0) {

				// UP
				changeVehicleColor(veh, car[veh][color1] + 1, car[veh][car_color2])

			} else if(ud <= 0) {

				// DOWN

			}*/ else set.vehShopPause[pid] = 1;
		}
	}
	if(player.bool.get(pid, bDmg))
	{
		if(tinfo[dmg_diff] + 3 < gettime())
		{
			PlayerTextDrawHide(pid, dmg[0][pid]);
			PlayerTextDrawHide(pid, dmg[1][pid]);
			player.bool.off(pid, bDmg);
		}
	}
	if(player.bool.get(pid, bNotification))
	{
		if(tinfo[notification_diff] + 3 < gettime())
			hide_notification(pid);
	}
	if(player.bool.get(pid, bNotification2))
	{
		if(tinfo[notification2_diff] + 3 < gettime())
			hide_notification2(pid);
	}
	//infoMsg(pid, "player.location.get(pid, lGangZone) = %i", player.location.get(pid, lGangZone));
	if(player.location.get(pid, lGangZone))
	{
		if(tinfo[gangzone_diff] + 12 < gettime())
		{
			//infoMsg(pid, "tinfo[gangzone_diff] + 12 < gettime()");
			tinfo[gangzone_diff] = gettime();

			new const gang = get.GangZone[pid];
			if(	objects[gTag(gang)][obj_other_ids][obj_gang_id] == pinfo[gauja]	)
			{
				objects[gTag(gang)][obj_other_info][obj_gang_influence] += 1;
				PlayerTextDrawSetString(pid, p_gangzone[pid], F("Sia teritorija valdo '~y~%s~w~'.~n~Ju itaka siai teritorijai: ~y~%i", PLAYER::GANG::GetName(pid), objects[gTag(gang)][obj_other_info][obj_gang_influence]));
				PlayerTextDrawShow(pid, p_gangzone[pid]);
			
			} else {

				objects[gTag(gang)][obj_other_info][obj_gang_influence] -= 3;
				if(objects[gTag(gang)][obj_other_info][obj_gang_influence] <= 0)
				{
					player.location.off(pid, lGangZone);
					del.GangZone[pid];

					destroyDynamicArea(objects[gTag(gang)][obj_other_ids][obj_area_id]);
					Update3DTextLabelText(objects[gTag(gang)][obj_other_ids][obj_text_id], COLOR_SOC, "Teritorija neuþimta.");

					objects[gTag(gang)][obj_other_ids][obj_area_id] = 0;
					objects[gTag(gang)][obj_other_ids][obj_gang_id] = 0;
					objects[gTag(gang)][obj_other_info][obj_gang_influence] = 0;
				}
			}
			infoMsg(pid, "obj_gang_influence = %i", objects[gTag(gang)][obj_other_info][obj_gang_influence]);
		}
	}
	if(player.flag.get(pid, fSurakintas))
	{
		if(GetPlayerAnimationIndex(playerid) != 1189 && !IsPlayerInAnyVehicle(pid))
		{
			ClearAnimations(pid,1);
			applyAnimation(playerid, "PED", "IDLE_STANCE", 4.0, 1, 1, 1, 1, 0);
			SetPlayerSpecialAction(pid, SPECIAL_ACTION_CUFFED);
		}
	}
	if(GetPlayerState(pid) == PLAYER_STATE_DRIVER)
	{
		new const veh = getPlayerVehicleID(pid);
		if(car[veh][car_tipas] == TAXI && tinfo[taxi_update_diff] + 1 < gettime())
		{
			tinfo[taxi_update_diff] = gettime();
			foreach(new i : Player)
			{
				if(isPlayerInVehicle(i, veh) && i != pid)
				{
					PlayerTextDrawShow(pid, p_taxi_stats[GetPlayerVehicleSeat(i)-1][pid]);
					PlayerTextDrawSetString(pid, p_taxi_stats[GetPlayerVehicleSeat(i)-1][pid], 
						F("%s ~y~%.1f~w~km ( ~y~%i~w~ lt )", GetPlayerNameEx(i),car[veh][rida] - pTemp[i][taxi_diff], floatround((car[veh][rida] - pTemp[i][taxi_diff])*kaina_TAXI)));
				}
			}
		}
	}
	if(player.bool.get(pid, bIsInTaxi))
	{
		new const Float:dist = car[get.lastVEH[pid]][rida] - tinfo[taxi_diff];
		notification2(pid, F("Nuvaziuota %.2f km. Kaina  %i LT", dist, floatround(dist * kaina_TAXI)));
	}
	if(player.flag.get(pid, fIsInJail))
	{
		pinfo[jail_time] -= (gettime() - tinfo[jail_time_diff]);
		tinfo[jail_time_diff] = gettime();

		if(pinfo[jail_time] <= 0)
		{
			player.flag.off(pid, fIsInJail);
			fade_setPlayerPos(pid, pos_pd_out, .vworld = VW_DEFAULT);
		
		} else {

			new hours,mins, secs, txt[64];

			secToTime(pinfo[jail_time],hours,mins,secs);

			format(txt, sizeof txt, "Liko sedeti: ");
			if(hours) strcat(txt, f("%i h  ", hours));
			if(mins) strcat(txt, f("%i min  ", mins));
			if(secs) strcat(txt, f("%i sec", (secs)?secs:0));

			notification2(pid, txt);
		}
	}
	if(player.bool.get(pid, bRenkasiSkina))
	{
		new keys, ud, lr, Float:a;
		GetPlayerKeys(pid, keys, ud, lr);

		GetPlayerFacingAngle(pid, a);
		if( a != 7.3087)
			SetPlayerFacingAngle(pid, 7.3087);

		if(GetPlayerAnimationIndex(playerid) != 1189)
		{
			ClearAnimations(pid,1);
			applyAnimation(playerid, "PED", "IDLE_STANCE", 4.0, 1, 1, 1, 1, 0);
		}

		if(lr > 0)
		{
			// RIGHT
			if(GetTickCount() - 500 > get.sskin[pid] || get.sskinpause[pid])
			{
				switch(pinfo[lytis])
				{
					case 0:
					{
						new const SKIN = get.selectedSkin[pid];
						switch(SKIN)
						{
							case sizeof (skins_v) - 1:  set.selectedSkin[pid] = 0;
							default: set.selectedSkin[pid] = SKIN + 1;
						}
						PLAYER::SetSkin(pid, .use_skin = skins_v[ get.selectedSkin[pid] ]);
						pinfo[skin] = get.selectedSkin[pid];
						set.sskin[pid] = GetTickCount();
					}
					case 1:
					{
						new const SKIN = get.selectedSkin[pid];
						switch(SKIN)
						{
							case sizeof (skins_m) - 1:  set.selectedSkin[pid] = 0;
							default: set.selectedSkin[pid] = SKIN + 1;
						}
						PLAYER::SetSkin(pid, .use_skin = skins_m[ get.selectedSkin[pid] ]);
						pinfo[skin] = get.selectedSkin[pid];
						set.sskin[pid] = GetTickCount();
					}
				}
				
			}
			del.sskinpause[pid];

		} else if(lr < 0) {

			// LEFT
			if(GetTickCount() - 600 > get.sskin[pid] || get.sskinpause[pid])
			{
				switch(pinfo[lytis])
				{
					case 0:
					{
						new const SKIN = get.selectedSkin[pid];
						switch(SKIN)
						{
							case 0:  set.selectedSkin[pid] = sizeof (skins_v) - 1;
							default: set.selectedSkin[pid] = SKIN - 1;
						}

						PLAYER::SetSkin(pid, .use_skin = skins_v[ get.selectedSkin[pid] ]);
						pinfo[skin] = skins_v[ get.selectedSkin[pid] ];
						set.sskin[pid] = GetTickCount();
					}
					case 1:
					{
						new const SKIN = get.selectedSkin[pid];
						switch(SKIN)
						{
							case 0:  set.selectedSkin[pid] = sizeof (skins_m) - 1;
							default: set.selectedSkin[pid] = SKIN - 1;
						}
						PLAYER::SetSkin(pid, .use_skin = skins_m[ get.selectedSkin[pid] ]);
						pinfo[skin] = skins_m[ get.selectedSkin[pid] ];
						set.sskin[pid] = GetTickCount();
					}
				}
			}
			del.sskinpause[pid];

		} else set.sskinpause[pid] = 1;
		if(keys & KEY_SECONDARY_ATTACK)
		{
			// ENTER
			del.sskin[pid];
			del.selectedSkin[pid];
			for(new i; i < 4; ++i)
				TextDrawHideForPlayer(pid, iSkin[i]);
			soc(pid, RESTORECAM);
			ClearAnimations(pid,1);
			player.bool.off(pid, bRenkasiSkina);
			SetPlayerVirtualWorld(pid, VW_DEFAULT);
			spawn_from_reg(pid);
		}
	}

	new const t_id = GetPlayerTargetPlayer(pid);
	if(IsPlayerNPC(t_id))
	{
		if( ! player.bool.get(t_id, bHandsUp) && ! player.bool.get(pid, bTaikosiINPC) && 2 <= GetWeaponSlot(GetPlayerWeapon(pid)) <= 7)
		{
			ApplyAnimation(t_id, "PED", "COWER", 4.0, 1, 0, 0, 0, 0);
			//ApplyAnimation(t_id, "PED", "HANDSUP", 4.0, 0, 0, 0, 1, 0); 
			player.bool.on(t_id, bHandsUp);
			player.bool.on(pid, bTaikosiINPC);
		}

	} else {

		if(player.bool.get(pid, bTaikosiINPC))
		{
			player.bool.off(tinfo[targetedNPC], bHandsUp);
			ClearAnimations(tinfo[targetedNPC], 1);
			player.bool.off(pid, bTaikosiINPC);
		}
	}
	tinfo[targetedNPC] = t_id;
/*	new keys, ud, lr;
	GetPlayerKeys(pid, keys, ud, lr);
	SendClientMessage(pid, -1, f("%i",keys));*/
	del.afkc[pid];
	return FixGlases(playerid);
}

stock FixGlases(playerid)
{
    static 
            weapon;
    weapon = GetPlayerWeapon(playerid);
    if(weapon == 44 || weapon == 45)
    {
        static
                HoldingFire[MAX_PLAYERS],
                IsHoldingFire[MAX_PLAYERS char],
                CanHoldAgain[MAX_PLAYERS char],
                keys,lr,tick;
        GetPlayerKeys(playerid,keys,lr,lr);
        tick = GetTickCount();
        if(keys & KEY_FIRE)
        {
            if(!IsHoldingFire{playerid} && CanHoldAgain{playerid})
            {
                IsHoldingFire{playerid} = 1;
                HoldingFire[playerid]=tick;
                CanHoldAgain{playerid} = 0;
            }
        }
        else if(!CanHoldAgain{playerid}) CanHoldAgain{playerid}=1;
        if(IsHoldingFire{playerid})
        {
            if(tick-1500 <= HoldingFire[playerid])
            {
                return 0;
            }
            else
            {
                IsHoldingFire{playerid} = 0;
                return 1;
            }
        }
    }
    return 1;
}

//--------------------------------------------------

Callback::OnPlayerStreamIn(pid, forplayerid)
{
	if(IsPlayerNPC(pid)) return 1;
	switch(getWar(forplayerid, pinfo[gauja]))
	{
		case -1:
		{
			SetPlayerMarkerForPlayer( forplayerid, pid, 0xFF0000FF );
			SetPlayerMarkerForPlayer( pid, forplayerid, 0xFF0000FF );
		}
		case 0:
		{
			SetPlayerMarkerForPlayer( forplayerid, pid, COLOR_SELECT );
			SetPlayerMarkerForPlayer( forplayerid, pid, COLOR_SELECT );
		}
		case 1:
		{
			SetPlayerMarkerForPlayer( pid, forplayerid, 0xFF0000FF );
			SetPlayerMarkerForPlayer( forplayerid, pid, COLOR_SELECT );
		}
		case 2:
		{
			SetPlayerMarkerForPlayer( forplayerid, pid, COLOR_SELECT );
			SetPlayerMarkerForPlayer( pid, forplayerid, 0xFF0000FF );
		}
	}
	return 1;
}

//--------------------------------------------------

Callback::OnPlayerStreamOut(pid, forplayerid)
{
	return 1;
}

//--------------------------------------------------

func createGZ(pid, Float:x,Float:y,Float:x2,Float:y2, color)
{
	//new id = findFreeGZ(pid);
	//if(id != -1)
	//{
		socf(pid, GANGZONE_CREATE, "%f %f %f %f %i", x,y,x2,y2,color);
		//gz[pid][id] = true;
	//}
	//return id;
}

func deleteGZ(pid)
{
	soc(pid, GANGZONE_DESTROY);
	//gz[pid][id] = false;
}

new counter[MAX_PLAYERS] = {0,...};

Callback::GPS_WhenRouteIsCalculated(routeid,node_id_array[],amount_of_nodes,Float:distance,Float:Polygon[],Polygon_Size)
{
	if( routeid >= 100 && routeid < 100 + MAX_PLAYERS && amount_of_nodes > 1)
	{
		new const pid = routeid - 100;
		memcpy(pnodes[pid],node_id_array,0,50*4);
		counter[pid]--;
		DestroyRoutes(pid);
		new Float:lastX,Float:lastY,Float:lastZ;

		//GetPlayerPos(pid,lastX,lastY,lastZ);
		GetNodePos(node_id_array[0], lastX, lastY, lastZ);

		new _max;

		if( amount_of_nodes < 50) _max = amount_of_nodes;
		else _max = 50;

		format(gt, sizeof gt, "%i ", GANGZONE_CREATE);
		for(new i=0; i < _max; ++i)
		{
			static Float:gX,Float:gY,Float:gZ;
			GetNodePos(node_id_array[i],gX,gY,gZ);
			CreateMapRoute(pid,lastX,lastY,gX,gY,pInfo[routeid-100][gps_color]);
			lastX=gX;
			lastY=gY;
		}
		socket_sendto_remote_client(socket_server,pTemp[routeid-100][socket], gt);
	}
	return 1;
}

func IsNodeInRoute(pid, nodeid)
{
	switch(nodeid)
	{
		case 19150,19161,14487: return 1;
		default:
		{
			for(new i; i < 50; ++i)
			{
				if(pnodes[pid][i] == nodeid)
					return 1;
			}
		}
	}
	return 0;
}

Callback::OnPlayerClosestNodeIDChange(pid,old_NodeID,new_NodeID)
{
	if(new_NodeID == -1) return 1;

	if(IsPlayerAdmin(pid))	notification(pid, IntToStr(new_NodeID));

	if(get.wash[pid] && !get.wash_pause[pid])
	{
		if(new_NodeID == tinfo[wash_start_node] && !get.wash_ok[pid])
		{ // Jeigu pradedam valyti, tai pradedam.

			new dnode = random(21);
			while(dnode == tinfo[wash_start_node])
				dnode = random(21);

			set.wash_ok[pid] = 1;
			tinfo[wash_last_node] = new_NodeID;
			tinfo[wash_start_node] = -10;

			tinfo[wash_dest] = dnode;
			tinfo[wash_dest_node] = NearestNodeFromPoint(washTarget[dnode][0],washTarget[dnode][1],washTarget[dnode][2]);

			CalculatePath(new_NodeID,tinfo[wash_dest_node],pid+100);
			DisablePlayerCheckpoint(pid);

			new coords<1>;
			GetNodePos(tinfo[wash_dest_node], coords<1>);
			SetPlayerCheckpoint(pid, coords<1>,3);
			inmind(pid, " ***..aha, kelià kurá reikia nuvalyti gavau, vaþiuoju.");
			return 1;

		} else if(new_NodeID == tinfo[wash_dest_node] && get.wash_ok[pid]) {
		  // Jeigu baigëm valyti, rodom kità kelià.
			del.wash_ok[pid];
			del.wash[pid];
			stopWash(pid);
			inmind(pid, " ***..baigiau, koks kitas marðrutas?");
			return 1;
		}
		if(IsNodeInRoute(pid, new_NodeID) && get.wash_ok[pid])
		{ // Jeigu viskas ok, nustatom last node ir skaièiuojam likusá kelià.
			tinfo[wash_last_node] = new_NodeID;
			CalculatePath(new_NodeID, tinfo[wash_dest_node],pid+100);
			return 1;

		} else {
		  // Jeigu ne, patikriname ar þaidëjas buvo blogame kelyje, ir gryþo á gerà.
			if(tinfo[wash_last_node] == new_NodeID && !get.wash_ok[pid])
			{ // Jei taip, rodom kelià toliau.
				DisablePlayerCheckpoint(pid);
				new coords<1>;
				GetNodePos(tinfo[wash_dest_node], coords<1>);
				SetPlayerCheckpoint(pid, coords<1>,3);
				set.wash_ok[pid] = 1;
				CalculatePath(new_NodeID, tinfo[wash_dest_node],pid+100);
				return 1;

			} else if(old_NodeID == tinfo[wash_last_node] && !IsNodeInRoute(pid, new_NodeID)) {
			  // Jeigu iðklydo ið kelio, nustatom kelià á blogà ir rodom tikrà kelià.
				DisablePlayerCheckpoint(pid);
				deleteGZ(pid);
				new coords<1>;
				GetNodePos(old_NodeID, coords<1>);
				SetPlayerCheckpoint(pid,coords<1>,3);

				notification(pid, f("%i",new_NodeID));

				del.wash_ok[pid];
				return 1;
			
			}/* else {
			  // Jeigu þaidëjas vaþiuoju blogu keliu, vis rodom jam tikrà kelià.
				CalculatePath(tinfo[wash_last_node], tinfo[wash_dest_node],pid+100);
			}*/
		}
		return 1;
	}
	if( ! player.bool.get(pid, bGPS) ) return 1;

	if( new_NodeID == tinfo[gps_dest_node])
	{
		notification(pid, "Tiksla pasiekei sekmingai!");
		GPS::atvyko(pid);
		return 1;
	}
	else if( old_NodeID > 0 )
	{
		CalculatePath(new_NodeID,tinfo[gps_dest_node],pid+100);
		return 1;
	}
	return 1;
}

//--------------------------------------------------------------------------------------------------------------------//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//--------------------------------------------------------------------------------------------------------------------//

public::OnPlayerCommandReceived(pid, cmdtext[])
{
	return 1;
}

public::OnPlayerCommandPerformed(pid, cmdtext[], success)
{
	if( !success)
		notification(pid, "visur ieskojom, bet tokios komandos neradom..");
	return 1;
}

func JOB::Join(pid, id)
{
	leaveJob(pid, .update = 0);
	PLAYER::JOB::Set(pid, id);
	PLAYER::JOB::SetJoinTime(pid);	
	updatePlayer(pid);
}

stock UnuseAttachInSlot(pid, slot, bool:reset_weps = false)
{
	if(reset_weps)
	{
		ResetPlayerWeapons(pid);
		UnuseWeaponInSlot(pid, 0);
	}
	RemovePlayerAttachedObject(pid,slot);

	//#define unuse(%0) itemslot=findItemInBag(pid,%0);if(itemslot!=-1)flag_off(bag[itemslot][item_info],IS_INUSE)

	switch(slot)
	{
		case SLOT_FACE:
		{
			for(new i; i < MAX_ITEM; ++i)
			{
				switch(bag[i][item])
				{
					case ITEM::akiniai1..ITEM::akiniai33:
					{
						flag_off(bag[i][item_info],IS_INUSE);
					}
				}
			}
		}
		case SLOT_RIGHTHAND:
		{
			for(new i; i < MAX_ITEM; ++i)
			{
				switch(bag[i][item])
				{
					case ITEM::meskere,ITEM::antrankiai,ITEM::pjuklas:
					{
						flag_off(bag[i][item_info],IS_INUSE);
					}
				}
			}
		}
		case SLOT_BODY:
		{
			for(new i; i < MAX_ITEM; ++i)
			{
				switch(bag[i][item])
				{
					case ITEM::armour:
					{
						flag_off(bag[i][item_info],IS_INUSE);
					}
				}
			}
		}
		case SLOT_HEAD:
		{
			for(new i; i < MAX_ITEM; ++i)
			{
				switch(bag[i][item])
				{
					case ITEM::b1..ITEM::b15,ITEM::cap1..ITEM::cap9,ITEM::beret1..ITEM::beret4:
					{
						flag_off(bag[i][item_info],IS_INUSE);
					}
				}
			}
		}
	}
}

func isAttachSlotFree(pid, slot)
{
	if(IsPlayerAttachedObjectSlotUsed(pid, slot))
		return 1;
	return 0;
}

func getFreeAttachSlot(pid)
{
	for(new i= MAX_PLAYER_ATTACHED_OBJECTS-2; i > 0; i--)
	{
		if(!IsPlayerAttachedObjectSlotUsed(pid, i)) // Free slot
		{
			return i;
		}
	}
	return 0;
}

public::OnLogin(Result:r, pid, pw_org[])
{
	new tmp[129];
	new pw[129];

	WP_Hash(pw, 129, pw_org);

	sql_get_field_assoc(r, "slaptazodis", tmp);

	if(strcmp(tmp, pw))
	{
		if( trylog[pid] > 2) 
		{
			infoMsg(pid, "Dël naujo slaptaþodþio kreipkis á administracijà. Norëdamas(-a) iðeiti, raðyk "C_Y"/q"); 
			Kick(pid); 

		} else {

			++trylog[pid];
			notification(pid, "Slaptazodis neteisingas..");

			inline prisijungimas(id, did, response, listitem, string:inputtext[])
			{
				#pragma unused id, did, listitem
				if( response )
				{
					sql_query(sqlHandle, F("SELECT slaptazodis FROM zaidejai WHERE vardas = '%s'",GetPlayerNameEx( pid )), QUERY_THREADED | QUERY_CACHED, "OnLogin", "ris", pid, inputtext);
				
				} else {

					Kick( pid );
				}
			}

			inline prisijungimas_reg(id, did, response, listitem, string:inputtext[])
			{
				#pragma unused id, did, listitem
				if( response )
				{
					sql_query(sqlHandle, F("SELECT slaptazodis FROM zaidejai WHERE vardas = '%s'",GetPlayerNameEx( pid )), QUERY_THREADED | QUERY_CACHED, "OnLogin", "ris", pid, inputtext);
				
				} else {

					if( !strlen( inputtext ))
					{
						infoMsg( pid,"Nëra saugu þaisti be slaptaþodþio." );
						ShowDialog(pid, Show:<registracija>,DIALOG_STYLE_INPUT,"Story of Cities","Sveikas atvykæs! Uþsiregistruok.\nSlaptaþodis: ","Registruotis","Atðaukti" );
						return;

					} else
					if(  strlen( inputtext ) > 40 )
					{
						notification(pid, "Slaptazodis negali buti ilgesnis nei 40simboliu." );
						ShowDialog(pid, Show:<registracija>,DIALOG_STYLE_INPUT,"Story of Cities","Sveikas atvykæs! Uþsiregistruok.\nSlaptaþodis: ","Registruotis","Atðaukti" );
						return;
					}

					new
						PW[129]
					;
					WP_Hash(PW, sizeof(PW),inputtext);
					sql_query(sqlHandle, f("UPDATE zaidejai SET slaptazodis ='%s' WHERE vardas = '%s'",PW, GetPlayerNameEx( pid )), QUERY_CACHED);
					player.bool.on(pid,bUzsiregistravo);
					notification(pid, "Sekmingai uzsiregistravai! Prisijunk :)");
					if( pinfo[lytis] == 0) showDialog(pid, using inline prisijungimas,DIALOG_STYLE_PASSWORD, "Story of Cities","Ar esi pasiruoðæs nuotykiams? >:}\nSlaptaþodis: ","Jungtis","" );
					else showDialog(pid, using inline prisijungimas,DIALOG_STYLE_PASSWORD, "Story of Cities","Pasiruoðusi nuotykiams? :}\nSlaptaþodis: ","Jungtis","" );
				}
			}

			if( ! player.bool.get(pid,bUzsiregistravo) )
			{
				showDialog(pid, using inline prisijungimas,DIALOG_STYLE_PASSWORD, "Story of Cities", "Malonu, kad gryþai :) Prisijunk!\nSlaptaþodis: ","Jungtis","" );

			} else {

				showDialog(pid, using inline prisijungimas_reg,DIALOG_STYLE_PASSWORD, "Story of Cities", "Registruodamasis ávedei kitoká slaptaþodá. Jeigu manai, kad já vesdamas suklydai, spausk 'Registruotis' ávedæs norimà slaptaþodá. \nSlaptaþodis: ","Jungtis","Registruotis" );
			}
		}

	} else {

		player.bool.on(pid,bPrisijunges);

		soc(pid, FADEIN);
		inline load() MYSQL_LOAD(pid);
		setTimer(using inline load, 2000, 0);

		checkKeys(._player = pid);
		//timer_load[pid] = SetTimerEx("SOC_Load", 64, 1, "i", pid);
	}
}
public::checkForAccount(Result:r, pid)
{
	if( ! sql_num_rows(r))
	{
		//showRegistration(pid);
		ShowDialog(pid, Show:<lytis>,DIALOG_STYLE_MSGBOX,"Story of Cities","Kas esi? :)", "Vaikinas", "Mergina");
	}
	else
	{
		//showLogin(pid);

		inline prisijungimas(id, did, response, listitem, string:inputtext[])
		{
			#pragma unused id, did, listitem
			if( response )
			{
				sql_query(sqlHandle, F("SELECT slaptazodis FROM zaidejai WHERE vardas = '%s'",GetPlayerNameEx( pid )), QUERY_THREADED | QUERY_CACHED, "OnLogin", "ris", pid, inputtext);
			
			} else {

				Kick( pid );
			}
		}
		showDialog(pid, using inline prisijungimas,DIALOG_STYLE_PASSWORD,"Story of Cities","Malonu, kad gryþai :) Prisijunk!\nSlaptaþodis: ","Jungtis","" );
	}
}

//--------------------------------------------------------------------------------------------------------------------//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//--------------------------------------------------------------------------------------------------------------------//
Dialog:registracija(pid, response, listitem, inputtext[])
{
	if(  response )
	{
		if( 2 > strlen( inputtext ))
		{
			//infoMsg( pid,"Nëra saugu þaisti be slaptaþodþio." );
			ShowDialog(pid, Show:<registracija>,DIALOG_STYLE_INPUT,"Story of Cities","Sveikas atvykæs! Uþsiregistruok.\nSlaptaþodis: ","Registruotis","Atðaukti" );
			return 1;
		}
		if(  strlen( inputtext ) > 40 )
		{
			notification(pid, "Slaptazodis negali buti ilgesnis nei 40simboliu." );
			ShowDialog(pid, Show:<registracija>,DIALOG_STYLE_INPUT,"Story of Cities","Sveikas atvykæs! Uþsiregistruok.\nSlaptaþodis: ","Registruotis","Atðaukti" );
			return 1;
		}

		inline prisijungimas(id, did, response1, listitem1, string:txt[])
		{
			#pragma unused id, did, listitem1
			if( response1 )
			{
				sql_query(sqlHandle, F("SELECT slaptazodis FROM zaidejai WHERE vardas = '%s'",GetPlayerNameEx( pid )), QUERY_THREADED | QUERY_CACHED, "OnLogin", "ris", pid, txt);
				return 1;
				
			} else {

				Kick( pid );
			}
		}

		new
			pw[129]
		;
		WP_Hash(pw, sizeof(pw),inputtext);
		sql_query(sqlHandle, f("INSERT INTO zaidejai (vardas,slaptazodis,lytis) VALUES ('%s','%s',%i)",GetPlayerNameEx( pid ),pw,pinfo[lytis] ));
		player.bool.on(pid,bUzsiregistravo);
		notification(pid, "Sekmingai uzsiregistravai! Prisijunk :)");
		if( pinfo[lytis] == 0) showDialog(pid, using inline prisijungimas,DIALOG_STYLE_PASSWORD,"Story of Cities",C_SOC"\nSlaptaþodis: ","Jungtis","" );
		else showDialog(pid, using inline prisijungimas,DIALOG_STYLE_PASSWORD,"Story of Cities",C_SOC"\nSlaptaþodis: ","Jungtis","" );
	
	} else {

		Kick( pid );
	}
	return 1;
}

stock SaveVehicle(id, query_type, just_update = false, isJobVehicle = false)
{
	new Float:cx,Float:cy,Float:cz,Float:cr,Float:hp;
	new Panels, Doors, Lights, Tires;
	
	getVehicleDamageStatus(id, Panels, Doors, Lights, Tires);

	getVehiclePos(id, cx,cy,cz);
	getVehicleZAngle(id, cr);

	getVehicleHealth(id, hp);

	gt{0} = EOS;
	for(new i = 0; i < 14; ++i)
	{
		strcat(gt, f("%i ", getVehicleComponentInSlot(id, i)));
	}
	sql_query( sqlHandle, f("UPDATE masinos SET m_tune = '%s' WHERE id = %i", gt, car[id][car_DBID]), query_type);

	sql_query( sqlHandle, (format(gt, sizeof gt, 
		"UPDATE masinos SET savininkas=%i, m_data = '%i %f %f %f %f %i %f %f %i %i %i %i %i %i %i %i %i %i %i %i' WHERE id = %i",
		car[id][car_savininkas], car[id][car_model],
		(isJobVehicle) ? car[id][car_x] : cx,
		(isJobVehicle) ? car[id][car_y] : cy,
		(isJobVehicle) ? car[id][car_z] : cz,
		(isJobVehicle) ? car[id][car_r] : cr,
		car[id][degalai],car[id][rida],hp,
		car[id][car_color1],car[id][car_color2], 
		car[id][car_flags], 
		Panels, Doors, Lights, Tires, 
		car[id][car_status], 
		car[id][burning_started], 
		car[id][repair_status], 
		car[id][repair_times], 
		car[id][technikine],
		car[id][car_DBID]), gt), query_type);

	if(!just_update)
	{
		gt{0} = EOS;
		static buffer[300];
		for(new i; i != MAX_ITEM && trunk[id][i][item]; ++i)
		{
			buffer[0] = EOS;
			strcat(buffer, f("%i/%i/", trunk[id][i][item], trunk[id][i][kiekis]));
			for(new j; j != eBonus; ++j)
			{
				strcat(buffer, f("%i/", trunk[id][i][effect][j]));
			}
			strcat(gt, buffer);
			strcat(gt, "|");
		}
		sql_query( sqlHandle, f("UPDATE masinos SET bagazine = '%s' WHERE id = %i", gt, car[id][car_DBID]), query_type);
	}
	if(!just_update)
		killVehicle(id);
}

public::MYSQL_LOAD(pid)
{
	sql_query(sqlHandle, 
		f("SELECT * FROM zaidejai WHERE vardas = '%s'", GetPlayerNameEx(pid)), 
		QUERY_THREADED | QUERY_CACHED,
		""#PLAYER::"Load", 
		"ri", 
		pid
	);
	//sql_function_query(1, F("SELECT id,gauja,"))
	TextDrawHideForPlayer(pid, Init0);
	TextDrawHideForPlayer(pid, Init1);
	logo_disappear(pid);
	//PlayerTextDrawShow(pid, show_dmg[pid]);
	//SetPlayerWorldBounds(pid, 2907.335907, -360.351351, 629.343629, -683.397683);
	SetPlayerWeather(pid, 0);
	//TogglePlayerSpectating(pid, false);
	return 1;
}

Dialog:lytis(pid, response, listitem, inputtext[])
{
	if( response)
	{
		pinfo[lytis] = 0;
		ShowDialog(pid, Show:<registracija>,DIALOG_STYLE_INPUT,"Story of Cities",C_SOC"Sveikas atvykæs! Uþsiregistruok.\nSlaptaþodis: ","Registruotis","Atðaukti" );
		return 1;

	} else {

		pinfo[lytis] = 1;
		ShowDialog(pid, Show:<registracija>,DIALOG_STYLE_INPUT,"Story of Cities",C_SOC"Sveika atvykusi! Uþsiregistruok.\nSlaptaþodis: ","Registruotis","Atðaukti" );
		return 1;
	}
}

//new gps_rgb[MAX_PLAYERS][3];
Dialog:gps_rgb_red(pid, response, listitem, inputtext[])
{
	if( response)
	{
		if( strval(inputtext) < 256 && strval(inputtext) >= 0)
		{
			set.gps_red[pid] = strval(inputtext);
			//gps_rgb[pid][0] = strval(inputtext);
			ShowDialog(pid, Show:<gps_rgb_green>,DIALOG_STYLE_INPUT,"GPS Spalvos kodas", "{FFFFFF}RGB spalvø kodus gali rasti internete.\nJá sudaro 9 skaièiai. Po tris kiekvienai spalvai.\nÁvesk pirmus 3 skaièius (XXX GGG XXX) {00FF00}þaliai{FFFFFF} spalvai. (0-255)", "Ávesti", "Atgal");
			return 1;

		} else {

			ShowDialog(pid, Show:<gps_rgb_red>,DIALOG_STYLE_INPUT,"GPS Spalvos kodas", "{FFFFFF}RGB spalvø kodus gali rasti internete.\n{FF0000}Spalvos{FFFFFF} kodà sudaro skaièiai nuo 0 iki 255.", "Ávesti", "Atgal");
			return 1;
		}
	}
	return 1;
}
Dialog:gps_rgb_green(pid, response, listitem, inputtext[])
{
	if( response)
	{
		if( strval(inputtext) < 256 && strval(inputtext) >= 0)
		{
			set.gps_green[pid] = strval(inputtext);
			//gps_rgb[pid][1] = strval(inputtext);
			ShowDialog(pid, Show:<gps_rgb_blue>,DIALOG_STYLE_INPUT,"GPS Spalvos kodas", "{FFFFFF}RGB spalvø kodus gali rasti internete.\nJá sudaro 9 skaièiai. Po tris kiekvienai spalvai.\nÁvesk sekanèius 3 skaièius (XXXXXX BBB) {0000FF}mëlynai{FFFFFF} spalvai. (0-255)", "Ávesti", "Atgal");
			return 1;

		} else {

			ShowDialog(pid, Show:<gps_rgb_green>,DIALOG_STYLE_INPUT,"GPS Spalvos kodas", "{FFFFFF}RGB spalvø kodus gali rasti internete.\n{00FF00}Spalvos{FFFFFF} kodà sudaro skaièiai nuo 0 iki 255.", "Ávesti", "Atgal");
			return 1;
		}
	}
	return 1;
}

Dialog:gps_rgb_blue(pid, response, listitem, inputtext[])
{
	if( response)
	{
		if( strval(inputtext) < 256 && strval(inputtext) >= 0)
		{
			set.gps_blue[pid] = strval(inputtext);
			//gps_rgb[pid][2] = strval(inputtext);
			pinfo[gps_color] = RGBAToHex(get.gps_red[pid], get.gps_green[pid], get.gps_blue[pid]/*gps_rgb[pid][0], gps_rgb[pid][1], gps_rgb[pid][2]*/, 255);

		} else {

			ShowDialog(pid, Show:<gps_rgb_blue>,DIALOG_STYLE_INPUT,"GPS Spalvos kodas", "{FFFFFF}RGB spalvø kodus gali rasti internete.\n{0000FF}Spalvos{FFFFFF} kodà sudaro skaièiai nuo 0 iki 255.", "Ávesti", "Atgal");
		}
	}
	return 1;
}

Dialog:drop_item(pid, response, listitem, inputtext[])
{
	if(response)
	{
		new amount = strval(inputtext);
		
		if( amount < 0 || amount >= bag[slcslot][kiekis])
		{
			amount = -1;
		}
		RemoveItemFromSlot(pid,slcslot,amount);
		PlayerTextDrawColor( pid, baguse[selecteditem], -1);
		PlayerTextDrawBoxColor( pid, baguse[last_clicked_textdraw_row], COLOR_BAG_DEFAULT);
		baguse[selecteditem] = PlayerText:-1;
		slcslot = -1;
		baguse[last_clicked_textdraw_row] = PlayerText:-1;
		load_bag(pid,3);
	}
	return 1;
}

Dialog:kuprine(pid, response, listitem, inputtext[])
	return 1;


//--------------------------------------------------------------------------------------------------------------------//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//--------------------------------------------------------------------------------------------------------------------//

Callback::OnPlayerSelectDynamicObject(playerid, objectid, modelid, Float:x, Float:y, Float:z)
{
	for(new i; i < sizeof medziai; ++i)
	{
		if(objects[gTree(i)][obj_id] == objectid && IsPlayerInDynamicArea(pid, objects[gTree(i)][obj_other_ids][obj_area_id]))
		{
			if(objects[gTree(i)][obj_other_info][obj_state] == OBJ_STATE_FINAL)
			{
				AddItem(pid, ITEM::malka, random(5)+2);
				objects[gTree(i)][obj_other_info][obj_state] = OBJ_STATE_NONE;
				destroyDynamicArea(objects[gTree(i)][obj_other_ids][obj_area_id]);
				inline respawn()
				{
					DestroyDynamicObject(objects[gTree(i)][obj_id]);
					objects[gTree(i)][obj_id] = CreateDynamicObject(MEDIS, medziai[i][mX], medziai[i][mY], medziai[i][mZ]-1, 0, 0, medziai[i][mRX]);
					objects[gTree(i)][obj_other_ids][obj_area_id] = CreateDynamicSphere(medziai[i][mX], medziai[i][mY], medziai[i][mZ], 4);
					object.flag.on(gTree(i), fIsActive);
					objects[gTree(i)][obj_other_info][obj_state] = OBJ_STATE_NORMAL;
					objects[gTree(i)][obj_other_info][obj_counting] = 300;
					Streamer_Update(pid);
				}
				setTimer(using inline respawn, 30*1000, 0);
			}
			return 1;
		}
	}
	return 1;
}


Callback::OnPlayerClickPlayer(pid, clickedplayerid, source)
{
	if( tickcheck(pid, 100)) return 1;
	return 1;
}

//--------------------------------------------------

//forward OnQueryError(errorid, error[], resultid, extraid, callback[], query[], connectionHandle);
public OnSQLError(SQL:handle, errorid, error[], query[], callback[])
{
	printf("\nMYSQL ERROR\nERROR: %s\n \nCALLBACK: %s\n \errorid: %i\n ", error, callback, errorid);
	return 1;
}

//--------------------------------------------------



stock checkKeys(vehicleid = INVALID_VEHICLE_ID, _player = INVALID_PLAYER_ID)
{
	if(vehicleid == INVALID_VEHICLE_ID && _player != INVALID_PLAYER_ID)
	{
		for(new i; i < MAX_VEHICLES; ++i)
		{
			switch(car[i][car_tipas])
			{
				case FURISTAS:
				{
					if(getVehicleModel(i) == CAR_FURA)
					{
						if( vehicle.bool.get(i, fSpyna) && !IsItemInBag(_player, ITEM::raktai_fura))
							setVehicleParamsForPlayer(i, _player, 0, 1);
						else 
							setVehicleParamsForPlayer(i, _player, 0, 0);

					} else {

						if( vehicle.bool.get(i, fSpyna) && !IsItemInBag(_player, ITEM::raktai_krov))
							setVehicleParamsForPlayer(i, _player, 0, 1);
						else 
							setVehicleParamsForPlayer(i, _player, 0, 0);
					}
				}

				case MECHANIKAS:
				{
					if( vehicle.bool.get(i, fSpyna) && !IsItemInBag(_player, ITEM::raktai_mech_car))
						setVehicleParamsForPlayer(i, _player, 0, 1);
					else
						setVehicleParamsForPlayer(i, _player, 0, 0);
				}

				case PD:
				{
					if( vehicle.bool.get(i, fSpyna) && !IsItemInBag(_player, ITEM::raktai_pd_car))
						setVehicleParamsForPlayer(i, _player, 0, 1);
					else
						setVehicleParamsForPlayer(i, _player, 0, 0);
				}

				case MEDIKAS:
				{
					if( vehicle.bool.get(i, fSpyna) && !IsItemInBag(_player, ITEM::raktai_med_car))
						setVehicleParamsForPlayer(i, _player, 0, 1);
					else
						setVehicleParamsForPlayer(i, _player, 0, 0);
				}

				case TAXI:
				{
					if( vehicle.bool.get(i, fSpyna) && !IsItemInBag(_player, ITEM::raktai_taxi_car))
						setVehicleParamsForPlayer(i, _player, 0, 1);
					else
						setVehicleParamsForPlayer(i, _player, 0, 0);
				}

				case GAISRININKAS:
				{
					if( vehicle.bool.get(i, fSpyna) && !IsItemInBag(_player, ITEM::raktai_fire_car))
						setVehicleParamsForPlayer(i, _player, 0, 1);
					else
						setVehicleParamsForPlayer(i, _player, 0, 0);
				}
				case VALYTOJAS:
				{
					if( vehicle.bool.get(i, fSpyna) && !IsItemInBag(_player, ITEM::raktai_wash_car))
						setVehicleParamsForPlayer(i, _player, 0, 1);
					else
						setVehicleParamsForPlayer(i, _player, 0, 0);
				}
			}
		}
	}
	else
	if(_player != INVALID_PLAYER_ID)
	{
		switch(car[vehicleid][car_tipas])
		{
			case 0:
			{
				if(car[vehicleid][car_savininkas] == pInfo[_player][DBID] || pInfo[_player][carid] == vehicleid)
				{
					return 0;

				} else {

					return 1;
				}
			}
			case FURISTAS:
			{
				if(getVehicleModel(vehicleid) == CAR_FURA)
				{
					if( vehicle.bool.get(vehicleid, fSpyna) && !IsItemInBag(_player, ITEM::raktai_fura))
					{
						setVehicleParamsForPlayer(vehicleid, _player, 0, 1); return 1;

					} else {

						setVehicleParamsForPlayer(vehicleid, _player, 0, 0); return 0;
					}

				} else {

					if( vehicle.bool.get(vehicleid, fSpyna) && !IsItemInBag(_player, ITEM::raktai_krov))
					{
						setVehicleParamsForPlayer(vehicleid, _player, 0, 1); return 1;

					} else {

						setVehicleParamsForPlayer(vehicleid, _player, 0, 0); return 0;
					}
				}
			}

			case MECHANIKAS:
			{
				if( vehicle.bool.get(vehicleid, fSpyna) && !IsItemInBag(_player, ITEM::raktai_mech_car))
				{
					setVehicleParamsForPlayer(vehicleid, _player, 0, 1); return 1;

				} else {

					setVehicleParamsForPlayer(vehicleid, _player, 0, 0); return 0;
				}
			}

			case PD:
			{
				if( vehicle.bool.get(vehicleid, fSpyna) && !IsItemInBag(_player, ITEM::raktai_pd_car))
				{
					setVehicleParamsForPlayer(vehicleid, _player, 0, 1); return 1;

				} else {

					setVehicleParamsForPlayer(vehicleid, _player, 0, 0); return 0;
				}
			}

			case MEDIKAS:
			{
				if( vehicle.bool.get(vehicleid, fSpyna) && !IsItemInBag(_player, ITEM::raktai_med_car))
				{
					setVehicleParamsForPlayer(vehicleid, _player, 0, 1); return 1;

				} else {

					setVehicleParamsForPlayer(vehicleid, _player, 0, 0); return 0;
				}
			}

			case TAXI:
			{
				if( vehicle.bool.get(vehicleid, fSpyna) && !IsItemInBag(_player, ITEM::raktai_taxi_car))
				{
					setVehicleParamsForPlayer(vehicleid, _player, 0, 1); return 1;

				} else {

					setVehicleParamsForPlayer(vehicleid, _player, 0, 0); return 0;
				}
			}

			case GAISRININKAS:
			{
				if( vehicle.bool.get(vehicleid, fSpyna) && !IsItemInBag(_player, ITEM::raktai_fire_car))
				{
					setVehicleParamsForPlayer(vehicleid, _player, 0, 1); return 1;

				} else {

					setVehicleParamsForPlayer(vehicleid, _player, 0, 0); return 0;
				}
			}
			case VALYTOJAS:
			{
				if( vehicle.bool.get(vehicleid, fSpyna) && !IsItemInBag(_player, ITEM::raktai_wash_car))
				{
					setVehicleParamsForPlayer(vehicleid, _player, 0, 1); return 1;

				} else {

					setVehicleParamsForPlayer(vehicleid, _player, 0, 0); return 0;
				}
			}
		}

	} else {

		switch(car[vehicleid][car_tipas])
		{
			case 0:
			{
				if(vehicle.bool.get(vehicleid, fIsOnFire))
				{
					foreach(new i : Player)
					{
						setVehicleParamsForPlayer(vehicleid, i, 0, 1);
					}
				
				} else {

					foreach(new i : Player)
					{
						setVehicleParamsForPlayer(vehicleid, i, 0, 0);
					}
				}
			}
			case FURISTAS:
			{
				if(getVehicleModel(vehicleid) == CAR_FURA)
				{
					if( vehicle.bool.get(vehicleid, fSpyna))
					{
						foreach(new forplayerid : Player)
						{
							if( !IsItemInBag(forplayerid, ITEM::raktai_fura))
								setVehicleParamsForPlayer(vehicleid, forplayerid, 0, 1);
							else
								setVehicleParamsForPlayer(vehicleid, forplayerid, 0, 0);
						}
					
					} else {

						foreach(new forplayerid : Player)
						{
							setVehicleParamsForPlayer(vehicleid, forplayerid, 0, 0);
						}
					}

				} else {

					if( vehicle.bool.get(vehicleid, fSpyna))
					{
						foreach(new forplayerid : Player)
						{
							if( !IsItemInBag(forplayerid, ITEM::raktai_krov))
								setVehicleParamsForPlayer(vehicleid, forplayerid, 0, 1);
							else
								setVehicleParamsForPlayer(vehicleid, forplayerid, 0, 0);
						}
					
					} else {

						foreach(new forplayerid : Player)
						{
							setVehicleParamsForPlayer(vehicleid, forplayerid, 0, 0);
						}
					}
				}
			}
			case MECHANIKAS:
			{
				if( vehicle.bool.get(vehicleid, fSpyna))
				{
					foreach(new forplayerid : Player)
					{
						if( !IsItemInBag(forplayerid, ITEM::raktai_mech_car))
							setVehicleParamsForPlayer(vehicleid, forplayerid, 0, 1);
						else
							setVehicleParamsForPlayer(vehicleid, forplayerid, 0, 0);
					}
				
				} else {

					foreach(new forplayerid : Player)
					{
						setVehicleParamsForPlayer(vehicleid, forplayerid, 0, 0);
					}
				}
			}
			case PD:
			{
				if( vehicle.bool.get(vehicleid, fSpyna))
				{
					foreach(new forplayerid : Player)
					{
						if( !IsItemInBag(forplayerid, ITEM::raktai_pd_car))
							setVehicleParamsForPlayer(vehicleid, forplayerid, 0, 1);
						else
							setVehicleParamsForPlayer(vehicleid, forplayerid, 0, 0);
					}

				} else {

					foreach(new forplayerid : Player)
					{
						setVehicleParamsForPlayer(vehicleid, forplayerid, 0, 0);
					}
				}
			}
			case MEDIKAS:
			{
				if( vehicle.bool.get(vehicleid, fSpyna))
				{
					foreach(new forplayerid : Player)
					{
						if( !IsItemInBag(forplayerid, ITEM::raktai_med_car))
							setVehicleParamsForPlayer(vehicleid, forplayerid, 0, 1);
						else
							setVehicleParamsForPlayer(vehicleid, forplayerid, 0, 0);
					}

				} else {

					foreach(new forplayerid : Player)
					{
						setVehicleParamsForPlayer(vehicleid, forplayerid, 0, 0);
					}
				}
			}
			case TAXI:
			{
				if( vehicle.bool.get(vehicleid, fSpyna))
				{
					foreach(new forplayerid : Player)
					{
						if( !IsItemInBag(forplayerid, ITEM::raktai_taxi_car))
							setVehicleParamsForPlayer(vehicleid, forplayerid, 0, 1);
						else
							setVehicleParamsForPlayer(vehicleid, forplayerid, 0, 0);
					}

				} else {

					foreach(new forplayerid : Player)
					{
						setVehicleParamsForPlayer(vehicleid, forplayerid, 0, 0);
					}
				}
			}
			case GAISRININKAS:
			{
				if( vehicle.bool.get(vehicleid, fSpyna))
				{
					foreach(new forplayerid : Player)
					{
						if( !IsItemInBag(forplayerid, ITEM::raktai_fire_car))
							setVehicleParamsForPlayer(vehicleid, forplayerid, 0, 1);
						else
							setVehicleParamsForPlayer(vehicleid, forplayerid, 0, 0);
					}

				} else {

					foreach(new forplayerid : Player)
					{
						setVehicleParamsForPlayer(vehicleid, forplayerid, 0, 0);
					}
				}
			}
			case VALYTOJAS:
			{
				if( vehicle.bool.get(vehicleid, fSpyna))
				{
					foreach(new forplayerid : Player)
					{
						if( !IsItemInBag(forplayerid, ITEM::raktai_wash_car))
							setVehicleParamsForPlayer(vehicleid, forplayerid, 0, 1);
						else
							setVehicleParamsForPlayer(vehicleid, forplayerid, 0, 0);
					}

				} else {

					foreach(new forplayerid : Player)
					{
						setVehicleParamsForPlayer(vehicleid, forplayerid, 0, 0);
					}
				}
			}
		}
	}
	return 0;
}





func GetPosFromView(pid, Float:distance, &Float:x, &Float:y, &Float:z)
{
	new Float:cx,Float:cy,Float:cz,Float:fx,Float:fy,Float:fz;
	GetPlayerCameraPos(pid, cx, cy, cz);
	GetPlayerCameraFrontVector(pid, fx, fy, fz);
	x = fx * distance + cx;
	y = fy * distance + cy;
	z = fz * distance + cz;
}

CreateMapRoute(pid, Float:gX1,Float:gY1,Float:gX2,Float:gY2,color)
{
	#pragma unused playerid
	new const Float:Dis = 12.0; // Distance, in which distances "dots" should be created.

	new const Float:TotalDis = GDBP(gX1,gY1,0.0,gX2,gY2,0.0); // The total distance between the two Points.

	new const Points=floatround(TotalDis/Dis); // The number of dots whcih should be created, relying on the total difference / Dots distance. Very easy

	for(new i=0; i <= Points; ++i)
	{
		new Float:x,Float:y;
		if( i != 0) // The first dot can'x be calculated, because dividing through zero is not valid (see "/ Points*i" below). Secondly, directly setting x and y is faster :P
		{
			x = gX1 + (((gX2 - gX1) / Points)*i);  // Setting off X's position by percentage.
			y = gY1 + (((gY2 - gY1) / Points)*i);  // Setting off Y's position by percentage.

		} else {

			x = gX1;
			y = gY1;
		}

		strcat(gt, f("%.2f %.2f %.2f %.2f %i,", x-(Dis/1.5),y-(Dis/1.5),x+(Dis/1.5),y+(Dis/1.5), color));
	}

	//printf("LINECR... Distance: %f | Points: %d" , TotalDis, Points);
	return 1;
}

DestroyRoutes(pid)
{
	deleteGZ(pid);
	for(new x; x < MAX_DOTS; x++)
	{
		if( Routes[pid][x] != -1)
		{
			//deleteGZ(pid, Routes[pid][x]);
			Routes[pid][x] = -1;
		}
	}
}

func GPS::start(pid,Float:xx,Float:yy,Float:zz)
{
	if(player.bool.get(pid, bGPS))
	{
		GPS::atvyko(pid);
	}
	player.bool.on(pid, bGPS);
	new Float:x, Float:y, Float:z;
	GetPlayerPos(pid, x,y,z);
	tinfo[gps_dest_node] = NearestNodeFromPoint(xx,yy,zz);
	CalculatePath(NearestNodeFromPoint(x,y,z),tinfo[gps_dest_node],pid+100);
	GetNodePos(tinfo[gps_dest_node], x,y,z);

	set.GPS_Arrow[pid] = CreatePlayerObject(pid, 1318, 0,0,0,0,0,0);

	DisablePlayerCheckpoint(pid);
	SetPlayerCheckpoint(pid,x,y,z,3);
}

func GPS::mechanikai(pid)
{
	GPS::start(pid, 126.4247,-152.1327,1.5781);
}

func GPS::policija(pid)
{
	GPS::start(pid, 635.6248,-582.8887,16.3359);
}

func GPS::gaisrine(pid)
{
	GPS::start(pid, 810.4073,-601.9279,15.8742);
}

func GPS::medikai(pid)
{
	GPS::start(pid, 1227.2498,300.0351,19.3607);
}

func GPS::degaline(pid)
{
	new Float:closest_dist = 9999.9, Float:dist;
	new closest_point, coords<1>;
	GetPlayerPos(pid, coords<1>);
	for(new i; i < sizeof degalines; ++i)
	{
		dist = GDBP(degalines[i][0],degalines[i][1],degalines[i][2], coords<1>);
		if(dist < closest_dist)
		{
			closest_dist = dist;
			closest_point = i;
		}
	}
	GPS::start(pid, degalines[closest_point][0], degalines[closest_point][1], degalines[closest_point][2]);
}

func GPS::degaline1(pid)
{
	GPS::start(pid, 64.1340,-229.7443,1.3215);
}

func GPS::degaline2(pid)
{
	GPS::start(pid, 2237.4,27.7,26.57);
}

func GPS::degaline3(pid)
{
	GPS::start(pid, 656.0121,-564.694,26.57);
}

func GPS::ligonine(pid)
{
	GPS::start(pid, 1245.4861,339.4846,19.2804);
}

func GPS::carturgus(pid)
{
	GPS::start(pid, 207.5, -220, 0.7);
}

func GPS::parduotuve(pid)
{
	GPS::start(pid, 2278,50.3,26.5);
}

//--------------------------------------------------

func GetXYInFrontOfPlayer(pid, &Float:x, &Float:y, &Float:z, Float:distance)
{
	GetPlayerPos(pid, x, y ,z);

	new Float:a;

	GetPlayerFacingAngle(pid,a);

	x += (distance * floatsin(-a, degrees));
	y += (distance * floatcos(-a, degrees));
	return 0;
}

func GetXYInFrontOfVehicle(pid, &Float:x, &Float:y, &Float:z)
{
	GetVehicleInfo(pid, VEHICLE_MODEL_INFO_SIZE, x, y, z, VEHICLE_MODEL_INFO_FRONT);

	//GetVehicleZAngle(pid,a);

	//x += (distance * floatsin(-a, degrees));
	//y += (distance * floatcos(-a, degrees));
	//return 0;
}

func GetXYInRearOfVehicle(pid, &Float:x, &Float:y, &Float:z)
{
	GetVehicleInfo(pid, VEHICLE_MODEL_INFO_SIZE, x, y, z, VEHICLE_MODEL_INFO_REAR);

	//GetVehiclePos(pid, x, y ,z);

	//GetVehicleZAngle(pid,a);
	//a += 180;
	//x += (distance * floatsin(-a, degrees));
	//y += (distance * floatcos(-a, degrees));
	//return 0;
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////BAGAÞINË///////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

func RemoveItemFromTrunkSlot(id, slot, amount)
{
	if( 0 <= slot <= MAX_ITEM - 1 )
	{
		if( amount < 0 || trunk[id][slot][kiekis] <= amount)
		{
			clearSlot(trunk[id][slot]);
			for(new i = slot; i < MAX_ITEM-1; ++i)
			{
				slotcpy(trunk[id][i], trunk[id][i + 1]);
			}

		} else {

			trunk[id][slot][kiekis] -= amount;
		}
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

func IsPlayerSpawned(pid){
	new const statex = GetPlayerState(pid);
	if( statex != PLAYER_STATE_NONE && statex != PLAYER_STATE_WASTED && statex != PLAYER_STATE_SPAWNED) return true;
	return false;
}

func UpdateWanted(pid)
{
	if(PLAYER::GetWanted(pid) >= 150) for(new i = 0; i <  10; ++i) TextDrawShowForPlayer(pid, twanted[i]);
	else switch(PLAYER::GetWanted(pid))
	{
		case 2..6: 		{
							ClearWanted(pid);
							TextDrawShowForPlayer(pid, twanted[0]);}
		case 7..14: 	{
							ClearWanted(pid);
							for(new i = 0; i <  2; ++i) TextDrawShowForPlayer(pid, twanted[i]);}
		case 15..25:	{
							ClearWanted(pid);
							for(new i = 0; i <  3; ++i) TextDrawShowForPlayer(pid, twanted[i]);}
		case 26..39:	{
							ClearWanted(pid);
							for(new i = 0; i <  4; ++i) TextDrawShowForPlayer(pid, twanted[i]);}
		case 40..56:	{
							ClearWanted(pid);
							for(new i = 0; i <  5; ++i) TextDrawShowForPlayer(pid, twanted[i]);}
		case 57..76:    {
							ClearWanted(pid);
							for(new i = 0; i <  6; ++i) TextDrawShowForPlayer(pid, twanted[i]);}
		case 77..99:    {
							ClearWanted(pid);
							for(new i = 0; i <  7; ++i) TextDrawShowForPlayer(pid, twanted[i]);}
		case 100..125:  {
							ClearWanted(pid);
							for(new i = 0; i <  8; ++i) TextDrawShowForPlayer(pid, twanted[i]);}
		case 126..149:  {
							ClearWanted(pid);
							for(new i = 0; i <  9; ++i) TextDrawShowForPlayer(pid, twanted[i]);}	
		default:        ClearWanted(pid);
	}
}

stock ClearWanted(pid, null_wanted = 0)
{
	if(null_wanted)
	{
		PLAYER::SetWanted(pid, 0);
		pinfo[wanted_time] = gettime();
	}
	for(new i = 9; i >= 0; i--)
		TextDrawHideForPlayer(pid, twanted[i]);
}

//--------------------------------------------------

 // :: funcai

stock toTheJail(pid, bool:savo_noru = false)
{
	new jtime;
	if(savo_noru)
		jtime = floatround(Float:(PLAYER::GetWanted(pid) * 6 * 2 * 0.7));
	else
		jtime = PLAYER::GetWanted(pid) * 6 * 2;

	ClearWanted(pid, 1);
	//inline jail_Timer;
	if(player.flag.get(pid, fIsInJail))
	{
		// þaidëjas jailintas
		new const k = random(sizeof jailas);
		fade_setPlayerPos(pid, jailas[k][0], jailas[k][1], jailas[k][2], .vworld = VW_Jailas);

	} else {

		player.flag.on(pid, fIsInJail);

		pinfo[jail_time] = jtime;
		tinfo[jail_time_diff] = gettime();

		new const k = random(sizeof jailas);
		fade_setPlayerPos(pid, jailas[k][0], jailas[k][1], jailas[k][2], .vworld = VW_Jailas);
	}

	return jtime;
}

func GetVModelSpeed(modelid)
{
	return VehicleInfo[modelid-400][vMaxSpeed];
}

func engineon(vehid)
{
	new bool: e[7];
	getVehicleParamsEx(vehid, e[6], e[0], e[1], e[2], e[3], e[4], e[5]);
	setVehicleParamsEx(vehid, true, e[0], e[1], e[2], e[3], e[4], e[5]);
	vehicle.bool.on(vehid, fVariklis);
	timer_car_fuel[vehid] = SetTimerEx("car_degalai", 123456/2, 1, "i", vehid);
}

func engineoff(vehid)
{
	new bool: e[7];
	getVehicleParamsEx(vehid, e[6], e[0], e[1], e[2], e[3], e[4], e[5]);
	setVehicleParamsEx(vehid, false, e[0], e[1], e[2], e[3], e[4], e[5]);
	vehicle.bool.off(vehid, fVariklis);
	KillTimer(timer_car_fuel[vehid]);
}

func setVehicleOnFire(veh, object_)
{
	vehicle.bool.on(veh, fIsOnFire);
	new Float:vhp;
	getVehicleHealth(veh, vhp);
	if( ! car[veh][car_timer_damage] && vhp > 300 )
	{
		inline damage()
		{
			setVehicleHealth(veh, vhp - 20);
			if(vhp-20 < 300)
			{
				killTimer(car[veh][car_timer_damage]);
				car[veh][car_timer_damage] = 0;
				setVehicleOnFire(veh, object_);
			}
		}
		car[veh][car_timer_damage] = setTimer(using inline damage, 300, 1);
	
	} else {

		if(car[veh][car_timer_damage])
		{
			killTimer(car[veh][car_timer_damage]);
			car[veh][car_timer_damage] = 0;
		}

		new Q,W,E,R,T,Y_,U;
		getVehicleParamsEx(veh, Q,W,E,R,T,Y_,U);
		setVehicleParamsEx(veh, false,W,E,false,T,Y_,U);

		engineoff(veh);
		checkKeys(veh);

		attachObjectToVehicle(object_, veh, 0, 1, -1.3, 0.0, 0, 0);

		vehicle.error.on(veh, gEngine);
	}
}

func setPlayerOnFire(pid, object_)
{
	AttachObjectToPlayer(object_, pid, 0, 0, -1.3, 0.0, 0, 0);
	inline onfiredmg()
	{
		DamagePlayer(pid, (22.8454+random(30))/5, 37, PLAYER::GetHealth(pid), INVALID_PLAYER_ID);
	}
	if(get.timer_onfire[pid])
	{
		killTimer(get.timer_onfire[pid]);
	}
	set.timer_onfire[pid] = setTimer(using inline onfiredmg, 100, 1);
	player.flag.on(pid, fOnFire);
}

stock startFire(Float:x, Float:y, Float:z, who = -1, id = -1)
{
	if(fire_count == MAX_FIRES) return 1;

	for(new i; i < MAX_FIRES; ++i)
	{
		if(fire[i][0] == -1)
		{
			fire[i][0] = CreateObject(18691, x,y,z-0.7,0,0,0);
			fire[i][1] = (id == -1)?(100+random(100)):(20+random(30));
			fire[i][2] = CreateDynamicSphere(x,y,z, (id == -1)?(3):(1) );
			fire[i][3] = id;
			fire[i][4] = who;
			if(!who) setPlayerOnFire(id, fire[i][0]);
			else if(who == 1) setVehicleOnFire(id, fire[i][0]);
			if(who)
			{
				foreach(new j : Player)
				{
					if(PLAYER::JOB::Get(j) == GAISRININKAS)
					{
						CreateDynamicMapIcon(x,y,z, 19, 0, 0xFFFFFFFF, .playerid = j, .streamdistance = 500.0);
					}
				}
			}
			fire_count++;
			return 1;
		}
	}
	

	fire[fire_count][0] = CreateObject(18691, x,y,z-0.7,0,0,0);
	fire[fire_count][1] = (id == -1)?(200+random(100)):(20+random(30));
	fire[fire_count][2] = CreateDynamicSphere(x,y,z, (id == -1)?(3):(1) );
	fire[fire_count][3] = id;
	//SendClientMessage(0, -1, f("%i %i %i %i", fire[fire_count][0],fire[fire_count][1],fire[fire_count][2],fire[fire_count][3]));
	if(!who) setPlayerOnFire(id, fire[fire_count][0]);
	else if(who == 1) setVehicleOnFire(id, fire[fire_count][0]);
	fire_count++;
	return 1;
}

func killFire(fireid)
{
	if( fire[fireid][0] == -1 )		return;

	DestroyObject(fire[fireid][0]);
	destroyDynamicArea(fire[fireid][2]);
	
	switch(fire[fireid][4])
	{
		case 0:
		{
			if(get.timer_onfire[fire[fireid][3]])
			{
				killTimer(get.timer_onfire[fire[fireid][3]]);
				del.timer_onfire[fire[fireid][3]];
			}
		}
		case 1:
		{
			vehicle.bool.off(fire[fireid][3], fIsOnFire);
			car[ fire[fireid][3] ][car_status] = cNeedsRepair;
		}
	}

	fire[fireid] = {-1, -1, -1, -1, -1};

	updateMap(GAISRININKAS);
}

stock inmind(pid, txt[], id2 = -1)
{
	SendClientMessage(pid, GetPlayerColor(pid), f("%s: "C_Y"~"C_SOC" %s", GetPlayerNameEx(pid), txt));
	if(IsPlayerConnected(id2))
	{
		SendClientMessage(id2, GetPlayerColor(pid), f("%s: "C_Y"~"C_SOC" %s", GetPlayerNameEx(pid), txt));
	}
	return 1;
}

func GetWeaponSlot(gunid)
{
	switch(gunid)
	{
		case 1: 			return 0;
		case 2..9:			return 1;
		case 10..15:		return 10;
		case 16..18:		return 8;
		case 22..24:		return 2;
		case 25..27:		return 3;
		case 28, 29:		return 4;
		case 30, 31:		return 5;
		case 32:			return 4;
		case 33, 34:		return 6;
		case 35..38:		return 7;
		case 39:			return 8;
		case 40:			return 12;
		case 41..43:		return 9;
		case 44..46:		return 11;
	}
	return -1;
}

func Float:getHealthByFood(ITEM::id)
{
	switch(ITEM::id)
	{
		case ITEM::maistas_eserys: return 60.0;
		case ITEM::maistas_karpis: return 60.0;
		case ITEM::maistas_lydeka: return 60.0;
		case ITEM::maistas_karosas: return 60.0;
		case ITEM::maistas_tunas: return 60.0;
		case ITEM::maistas_lasisa: return 60.0;
		case ITEM::maistas_pleksne: return 60.0;
		case ITEM::maistas_menke: return 60.0;
		case ITEM::maistas_raude: return 60.0;
		case ITEM::maistas_skumbre: return 60.0;
		case ITEM::maistas_starkis: return 60.0;
		case ITEM::maistas_samas: return 60.0;
		case ITEM::maistas_ungurys: return 60.0;
		case ITEM::maistas_upetakis: return 60.0;
		case ITEM::maistas_ikrai: return 20.0;
		case ITEM::maistas_duona: return 15.0;
		case ITEM::maistas_obuolys: return 10.0;
	}
	return 0.0;
}

func lock(pid, l)
{
	if(l)
		soc(pid, LOCKON);
	else
		soc(pid, LOCKOFF);
}

func Enter(pid)
{
	if(pinfo[death_state] == DEATH_STATE_HOSPITAL)
	{
		notification2(pid, "Is ligonines iseiti negali, esi per silpnos bukles.");
		return 1;
	}
		// Fûrø áëjimas
	if(IsPlayerInRangeOfPoint(pid, 2, pos_furos_in))
	{
		DurysOpen(pid);
		fade_setPlayerPos(pid, pos_furos_out);
	}
	else // Taxi áëjimas
	if(IsPlayerInRangeOfPoint(pid, 2, pos_taxi_in))
	{
		DurysOpen(pid);
		fade_setPlayerPos(pid, pos_taxi_out);
	}
	else // Taxi iðëjimas
	if(IsPlayerInRangeOfPoint(pid, 2, pos_taxi_out))
	{
		DurysOpen(pid);
		fade_setPlayerPos(pid, pos_taxi_in);
	}
	else // Mentai áëjimas
	if(IsPlayerInRangeOfPoint(pid, 2, pos_pd_in))
	{
		DurysOpen(pid);
		fade_setPlayerPos(pid, pos_pd_out);
	}
	else // Mentai iðëjimas
	if(IsPlayerInRangeOfPoint(pid, 2, pos_pd_out))
	{
		DurysOpen(pid);
		fade_setPlayerPos(pid, pos_pd_in);
	}
	else // Mechanikai áëjimas
	if(IsPlayerInRangeOfPoint(pid, 2, pos_mech_in))
	{
		DurysOpen(pid);
		fade_setPlayerPos(pid, pos_mech_out);
	}
	else // Mechanikai iðëjimas
	if(IsPlayerInRangeOfPoint(pid, 2, pos_mech_out))
	{
		DurysOpen(pid);
		fade_setPlayerPos(pid, pos_mech_in);
	}
	else // Akra áëjimas
	if(IsPlayerInRangeOfPoint(pid, 2, pos_akra_in))
	{
		DurysOpen(pid);
		fade_setPlayerPos(pid, pos_akra_out);
	}
	else // Akra iðëjimas
	if(IsPlayerInRangeOfPoint(pid, 2, pos_akra_out))
	{
		DurysOpen(pid);
		fade_setPlayerPos(pid, pos_akra_in);
	}
	else // OldWood áëjimas
	if(IsPlayerInRangeOfPoint(pid, 2, pos_oldwood_in))
	{
		DurysOpen(pid);
		fade_setPlayerPos(pid, pos_oldwood_out);
	}
	else // OldWood iðëjimas
	if(IsPlayerInRangeOfPoint(pid, 2, pos_oldwood_out))
	{
		DurysOpen(pid);
		fade_setPlayerPos(pid, pos_oldwood_in);
	}
	else  // MEDIKAI ÁËJIMAS
	if(IsPlayerInRangeOfPoint(pid, 2, pos_medikai_in))
	{
		DurysOpen(pid);
		fade_setPlayerPos(pid, pos_medikai_out);
		return 1;
	}
	else // MEDIKAI ÁÐËJIMAS
	if(IsPlayerInRangeOfPoint(pid, 2, pos_medikai_out))
	{
		DurysOpen(pid);
		fade_setPlayerPos(pid, pos_medikai_in);
		return 1;
	}
	else // MEDIKAI PERSIRENGIMAS
	if(IsPlayerInRangeOfPoint(pid, 4, pos_medikai_persirengimas))
	{
		switch(PLAYER::JOB::Get(pid))
		{
			case MEDIKAS:
			{
				switch(PLAYER::GetSkin(pid))
				{
					case SKIN_DARBO: PLAYER::SetSkin(pid, SKIN_PLAYER);
					default: PLAYER::SetSkin(pid, SKIN_DARBO);
				}
				return notification(pid, "Persirengei");
			}
			default: return 1;
		}
	}
	else // MEDIKAI DAIKTØ ATSIËMIMAS
	if(IsPlayerInRangeOfPoint(pid, 4,  pos_medikai_daiktai))
	{
		switch(PLAYER::JOB::Get(pid))
		{
			case MEDIKAS:
			{
				if(get.pasieme_daiktus[pid] + 120000 < GetTickCount())
				{
					AddItem(pid, ITEM::tvarstis, random(2)+1);
					AddItem(pid, ITEM::nuskausminamieji, 1);

					if( ! IsItemInBag(pid, ITEM::elektro_sokas))
						AddItem(pid, ITEM::elektro_sokas, 1);

					set.pasieme_daiktus[pid] = GetTickCount();
					ApplyAnimation(playerid, "BAR", "BARCUSTOM_GET", 4.0, 0, 0, 0, 0, 0);
					return notification(pid, "Pasiemei mediku daiktus");

				} else {

					return notification(pid, "Daiktu spinteleje nera");
				}
			}
			default: return 1;
		}
	}
	else // MEDIKAI ÁSIDARBINIMAS
	if(IsPlayerInRangeOfPoint(pid, 4,  pos_medikai_persirengimas))
	{
		switch(PLAYER::JOB::Get(pid))
		{
			case 0:
			{
				JOB::Join(pid, MEDIKAS);
				return notification(pid, "Tu priimtas i darba!");
			}
			case MEDIKAS:
			{
				leaveJob(pid);
				return notification(pid, "Tu isejai is darbo..");
			}
			default:
				return notification(pid, "Esi isidarbines kitur");
		}
	}
	else // MECHANIKAI ÁSIDARBINIMAS
	if(IsPlayerInRangeOfPoint(pid, 4,  pos_mech_isidarbinimas))
	{
		switch(PLAYER::JOB::Get(pid))
		{
			case 0:
			{
				JOB::Join(pid, MECHANIKAS);
				return notification(pid, "Tu priimtas i darbà!");
			}
			case MECHANIKAS:
			{
				leaveJob(pid);
				return notification(pid, "Tu isejai is darbo..");
			}
			default:
				return notification(pid, "Esi isidarbines kitur");
		}
	}
	else // MECHANIKAI PERSIRENGIMAS
	if(IsPlayerInRangeOfPoint(pid, 4,  pos_mech_persirengimas))
	{
		switch(PLAYER::JOB::Get(pid))
		{
			case MECHANIKAS:
			{
				switch(PLAYER::GetSkin(pid))
				{
					case SKIN_DARBO: PLAYER::SetSkin(pid, SKIN_PLAYER);
					default: PLAYER::SetSkin(pid, SKIN_DARBO);
				}
				return notification(pid, "Persirengei");
			}
			default: return 1;
		}
	}
	else // MECHANIKAI DAIKTØ ATSIËMIMAS
	if(IsPlayerInRangeOfPoint(pid, 4,  pos_mech_daiktai))
	{
		switch(PLAYER::JOB::Get(pid))
		{
			case MECHANIKAS:
			{
				if(get.pasieme_daiktus[pid] + 1000*60*20 < GetTickCount())
				{
					AddItem(pid, ITEM::irankiu_deze, 1);
					set.pasieme_daiktus[pid] = GetTickCount();
					ApplyAnimation(playerid, "BAR", "BARCUSTOM_GET", 4.0, 0, 0, 0, 0, 0);
					return notification(pid, "Pasiemei irankius");
					
				} else {

					return notification(pid, "Daiktu nera");
				}
			}
			default: return 1;
		}
	}
	return 1;
}

func removePlayerWeapon(pid, weaponid)
{
	RemovePlayerWeapon(pid, weaponid);
	new const id = getItemIDFromWeapon(weaponid);

	if( item.flag.get(id, IS_ONEHANDED) )
	{
		memsub(ptemp[peffect], ptemp[current_handgun][effect]);
		memset(ptemp[current_handgun]);
	
	} else {

		memsub(ptemp[peffect], ptemp[current_wep][effect]);
		memset(ptemp[current_wep]);
	}
}

func givePlayerWeapon(pid, weaponid, ammo)
{
//	removePlayerWeapon(pid, weaponid);
	GivePlayerWeapon(pid, weaponid, ammo);
	SetPlayerAmmo(pid, weaponid, ammo);
	new const id = getItemIDFromWeapon(weaponid);

	if( item.flag.get(id, IS_ONEHANDED) )
	{
		memadd(ptemp[peffect], ptemp[current_handgun][effect]);
	
	} else {

		memadd(ptemp[peffect], ptemp[current_wep][effect]);
	}
}

func getItemIDFromWeapon(wepid)
{
	switch(wepid)
	{
		case 1: return 16;
		case 5: return 17;
		case 3: return 18;
		case 7: return 19;
		case 2: return 20;
		case 6: return 21;
		case 4: return 22;
		case 8: return 23;
		case 9: return 24;
		case 22: return 25;
		case 23: return 26;
		case 24: return 27;
		case 25: return 28;
		case 26: return 29;
		case 27: return 30;
		case 28: return 31;
		case 29: return 32;
		case 30: return 33;
		case 31: return 34;
		case 32: return 35;
		case 33: return 36;
		case 34: return 37;
		case 18: return 38;
		case 16: return 39;
		case 17: return 40;
		case 39: return 41;
		case 37: return 42;
		case 38: return 43;
		case 35: return 44;
		case 36: return 45;//
		case 41: return 46;
		case 43: return 47;
		case 42: return 48;
		case 46: return 49;
		case 45: return 50;
		case 44: return 51;
		case 40: return 53;
		case 15: return 54;
		case 14: return 55;
		case 10: return 56;
		case 13: return 57;
		case 11: return 58;
		case 12: return 59;
		default: return 0;
	}
	return 0;
}

func UnuseWeaponInSlot(pid, slot)
{
	switch(slot)
	{
		case 0:
		{
			for(new i; i < MAX_ITEM; ++i)
			{
				if(flag_get(ItemInfo[bag[i][item]][item_params], IS_WEAPON))
				{
					flag_off(bag[i][item_info], IS_INUSE);
				}
			}
		}
		case 1: 
		{
			for(new i; i < MAX_ITEM; ++i)
			{
				switch( bag[i][item] )
				{
					case ITEM::kastetas..ITEM::pjuklas: flag_off(bag[i][item_info], IS_INUSE);
				}
			}
		}

		case 2:
		{
			for(new i; i < MAX_ITEM; ++i)
			{
				switch( bag[i][item] )
				{
					case ITEM::ninemm..ITEM::deagle: flag_off(bag[i][item_info], IS_INUSE);
				}
			}
		}

		case 3: 
		{
			for(new i; i < MAX_ITEM; ++i)
			{
				switch( bag[i][item] )
				{
					case ITEM::shotgun..ITEM::combat: flag_off(bag[i][item_info], IS_INUSE);
				}
			}
		}

		case 4: 
		{
			for(new i; i < MAX_ITEM; ++i)
			{
				switch( bag[i][item] )
				{
					case ITEM::uzi,ITEM::mp5,ITEM::tec: flag_off(bag[i][item_info], IS_INUSE);
				}
			}
		}

		case 5: 
		{
			for(new i; i < MAX_ITEM; ++i)
			{
				switch( bag[i][item] )
				{
					case ITEM::ak,ITEM::m4: flag_off(bag[i][item_info], IS_INUSE);
				}
			}
		}

		case 6:
		{
			for(new i; i < MAX_ITEM; ++i)
			{
				switch( bag[i][item] )
				{
					case ITEM::rifle,ITEM::awp: flag_off(bag[i][item_info], IS_INUSE);
				}
			}
		}

		case 7: 
		{
			for(new i; i < MAX_ITEM; ++i)
			{
				switch( bag[i][item] )
				{
					case ITEM::flamegun..ITEM::trocket: flag_off(bag[i][item_info], IS_INUSE);
				}
			}
		}

		case 8: 
		{
			for(new i; i < MAX_ITEM; ++i)
			{
				switch( bag[i][item] )
				{
					case ITEM::molotov..ITEM::remotebomb: flag_off(bag[i][item_info], IS_INUSE);
				}
			}
		}

		case 9: 
		{
			for(new i; i < MAX_ITEM; ++i)
			{
				switch( bag[i][item] )
				{
					case ITEM::spraycan..ITEM::gesintuvas: flag_off(bag[i][item_info], IS_INUSE);
				}
			}
		}

		case 10:
		{
			for(new i; i < MAX_ITEM; ++i)
			{
				switch( bag[i][item] )
				{
					case ITEM::lazda..ITEM::vibro2: flag_off(bag[i][item_info], IS_INUSE);
				}
			}
		}

		case 11:
		{
			for(new i; i < MAX_ITEM; ++i)
			{
				switch( bag[i][item] )
				{
					case ITEM::parasiutas..ITEM::nvakiniai: flag_off(bag[i][item_info], IS_INUSE);
				}
			}
		}

		case 12:
		{
			for(new i; i < MAX_ITEM; ++i)
			{
				switch( bag[i][item] )
				{
					case ITEM::detonatorius: flag_off(bag[i][item_info], IS_INUSE);
				}
			}
		}
	}
}

func GetWeaponFromItem(itemid)
{
	switch(itemid)
	{
		case 16: return 1;
		case 17: return 5;
		case 18: return 3;
		case 19: return 7;
		case 20: return 2;
		case 21: return 6;
		case 22: return 4;
		case 23: return 8;
		case 24: return 9;
		case 25: return 22;
		case 26: return 23;
		case 27: return 24;
		case 28: return 25;
		case 29: return 26;
		case 30: return 27;
		case 31: return 28;
		case 32: return 29;
		case 33: return 30;
		case 34: return 31;
		case 35: return 32;
		case 36: return 33;
		case 37: return 34;
		case 38: return 18;
		case 39: return 16;
		case 40: return 17;
		case 41: return 39;
		case 42: return 37;
		case 43: return 38;
		case 44: return 35;
		case 45: return 36;
		case 46: return 41;
		case 47: return 43;
		case 48: return 42;
		case 49: return 46;
		case 50: return 45;
		case 51: return 44;
		case 52: return -1;
		case 53: return 40;
		case 54: return 15;
		case 55: return 14;
		case 56: return 10;
		case 57: return 13;
		case 58: return 11;
		case 59: return 12;
		default: return 0;
	}
	return 0;
}

stock fade_setPlayerPos(pid, Float:x,Float:y,Float:z,vworld = -1,Float:a = -1.0)
{
	if(get.fading[pid]) return 1;
	set.fadeing[pid] = 1;

	soc(pid,FADEIN);
	inline fadetp()
	{
		inline frz()
		{
			PLAYER::Freeze(pid, false, TELEPORT);
			soc(pid,FADEOUT);
			del.fadeing[pid];
		}
		setTimer(using inline frz, 3000, 0);
		SetPlayerPos(pid, x,y,z);
		Streamer_UpdateEx(pid, x,y,z);
		if(vworld != -1)
			SetPlayerVirtualWorld(pid, vworld);
		if(a != -1)
			SetPlayerFacingAngle(pid, a);
		PLAYER::Freeze(pid, true, TELEPORT);
	}
	setTimer(using inline fadetp, 1500, 0);
	return 1;
}

stock setPlayerPos(pid, Float:x,Float:y,Float:z,vworld = -1,freeze_time = 2000)
{
	Streamer_UpdateEx(pid, x,y,z);
	inline frz()
	{
		PLAYER::Freeze(pid, false, TELEPORT);
	}
	setTimer(using inline frz, freeze_time, 0);
	SetPlayerPos(pid, x,y,z);
	if(vworld != -1)
		SetPlayerVirtualWorld(pid, vworld);
	PLAYER::Freeze(pid, true, TELEPORT);
	return 1;
}

func setPlayerPosZ(pid, Float:x, Float:y, Float:z)
{
	Streamer_UpdateEx(pid, x,y,z);
	SetPlayerPosFindZ(pid, x,y,z);
	return 1;
}

stock cameraPos(pid, mode = 0)
{
	new Float:vX, Float:vY, Float:vZ;
	if(!mode)
	{
		GetXYInFrontOfPlayer(pid, vX, vY, vZ, 6);
		vX = vX + random(3) + 2;
		vY = vY + random(3) + 2;
		SetPlayerCameraPos(pid, vX, vY, vZ + 4);
		GetPlayerPos(pid, vX,vY,vZ);
		SetPlayerCameraLookAt(pid,vX,vY,vZ,CAMERA_MOVE);

	} else {

		switch(mode)
		{
			case 1 /* vehicleShop */:
			{

			}
		}
	}
}

//--------------------------------------------------

func OnPlayerClickPlayer_Mouse1(pid, _id)
{
	if(applyChecks(pid, cClickOnPlayer)) return 1;
	if(pid == _id) return 1;
	if(IsPlayerNPC(_id))
	{
		ClickOnNPC(pid, _id);
	}
	show_again_:
	inline dialog(police_pid, dialogid, response, listitem, string:inputtext[])
	{
		#pragma unused police_pid, dialogid, listitem
		if(response)
		{
			if(strfind(inputtext, "Surakinti") != -1)
			{
				if( ! IsItemInBag(pid, ITEM::antrankiai))
				{
					goto show_again_;
					return notification2(pid, "Neturi antrankiu.");
				}
				switch(JOB::POLICIJA::Surakinti(pid, _id))
				{
					case 1:
					{
						inmind(pid, "Dabar jis nebepajudës .");
						inmind(_id, "Nebegaliu pajudët ...");
					}
					case 2:
					{
						inmind(pid, "Atrakinau .", _id);
					}
					default:
					{
						inmind(pid, "Nepasiekiu ..");
					}
				}
			}
			else if(strfind(inputtext, "Bausti") != -1)
			{
				show_again_bausti:
				inline bausti(bausti_i, bausti_dialogid, bausti_response, bausti_listitem, string:bausti_inputtext[])
				{
					#pragma unused bausti_i, bausti_dialogid, bausti_listitem
					if(bausti_response)
					{
						if(isnull(bausti_inputtext))
						{
							goto show_again_;

						} else {

							show_again_bausti_stars:
							inline bausti_stars(iiii, bausti_stars_dialogid, bausti_stars_response, bausti_stars_listitem, string:bausti_stars_inputtext[])
							{
								#pragma unused iiii, bausti_stars_dialogid, bausti_stars_listitem
								if(bausti_stars_response)
								{
									if(isnull(bausti_stars_inputtext) || strval(bausti_stars_inputtext) < 1)
									{
										goto show_again_bausti_stars;

									} else {

										if(JOB::POLICIJA::GiveWantedEx(pid, _id, strval(bausti_stars_inputtext)))
										{
											PLAYER::GiveExp(pid, 1, true);
											inmind(_id, f("Gavau baudà, kurios prieþastis yra %s", bausti_inputtext));
											inmind(pid, f("Nubaudþiau %s. Prieþastis : %s", GetPlayerNameEx(_id), bausti_inputtext));
											++pinfo[darbas][data2_today];
											++pinfo[darbas][data2_week];

										} else {

											sendMsg(pid, "info", TEXT"Nepasiekiu ...");
											//inmind(pid, "Nepasiekiu ..");
										}
									}

								} else {

									goto show_again_bausti;
								}
							}
							showDialog(pid, using inline bausti_stars, DIALOG_STYLE_INPUT, GetPlayerNameEx(_id), "Baudos dydis (0-150).", "Bausti", "Atgal");
						}

					} else {

						goto show_again_;
					}
				}
				showDialog(pid, using inline bausti, DIALOG_STYLE_INPUT, GetPlayerNameEx(_id), "Baudos prieþastis (DM, KET paþeidimas .. ).", "Kitas", "Atðaukti");
			}
			else if(strfind(inputtext, "Siûlyti susimokëti baudà") != -1)
			{
				if(PLAYER::GetWanted(_id))
				{
					// TODO: Pinigines baudos didejimas stars atzvilgiu.
					if(PLAYER::GetMoney(_id) > PLAYER::GetWanted(_id) * 10)
					{
						inline sumoketi(sumoketi_i, sumoketi_dialogid, sumoketi_response, sumoketi_listitem, string:sumoketi_inputtext[])
						{
							#pragma unused sumoketi_i, sumoketi_dialogid, sumoketi_listitem, sumoketi_inputtext
									
							if(sumoketi_response)
							{
								PLAYER::GiveMoney(_id, PLAYER::GetWanted(_id) * -10);
								PLAYER::GiveMoney(pid,  PLAYER::GetWanted(_id) * 10);
								PLAYER::GiveExp(pid, 2, true);
								ClearWanted(_id, 1);
								++pinfo[darbas][data1_today];
								++pinfo[darbas][data1_week];
								inmind(_id, "Ðtai, praðom .");
								inmind(pid, "Baudà sumokëjai, laisvas, gali keliaut", _id);
							}
						}
						showDialog(_id, using inline sumoketi, DIALOG_STYLE_MSGBOX, "Baudos apmokëjimas", F("\nÐerifas %s reikalauja susimokëti baudà, kurios \nsuma yra %i LT, uþ padarytus paþeidimus\n", GetPlayerNameEx(pid), pInfo[_id][wanted] * 10), "Sumokëti", "");						

					} else {

						inmind(_id, "Neturiu tiek pinigø ...", pid);
					}
				}
			}
			else if(strfind(inputtext, "Ásodinti á maðinà") != -1)
			{
				if(PLAYER::GetWanted(_id))
				{
					new const seat = findEmptySeatInVehicle(get.lastVEH[pid]);
					if(seat)
					{
						new coords<1>;
						getVehiclePos(get.lastVEH[pid], coords<1>);
						if(IsPlayerInRangeOfPoint(pid, 10, coords<1>))
						{
							putPlayerInVehicle(_id, get.lastVEH[pid], seat);
							notification(_id, F("%s isodino tave i masina.", GetPlayerNameEx(pid)));
							notification(pid, f("Isodinai %s i masina.", GetPlayerNameEx(_id)));

						} else {

							notification(pid, "Masina yra per toli");
						}
					}
				}
			}
			else if(strfind(inputtext, "Sutvarstyti") != -1)
			{
				new const slotas = findItemInBag(pid, ITEM::tvarstis);
				if( slotas == -1 )
				{
					inmind(pid, "Nebeturiu nei vieno tvarsèio..", _id);

				} else {

					PLAYER::GiveExp(pid, 1, true);
					RemoveItemFromSlot(pid, slotas, 1);
					bag[slotas][kiekis] --;
					PLAYER::SetHealth(_id, PLAYER::GetHealth(_id) + 80);
				}
			}
			else if(strfind(inputtext, "Gaivinti") != -1)
			{
				if(IsItemInBag(pid, ITEM::elektro_sokas))
				{
					PlayerFacePlayer(pid, _id);
					applyAnimation(pid, "MEDIC", "CPR", 4.0, 0, 0, 0, 0, 0, 1);
						
					inline pagijo()
					{
						PLAYER::Freeze(_id, false, MIRSTA);
						PLAYER::GiveExp(pid, 3, true);
						inmind(pid, "Na va, kelkis", _id);
						PLAYER::SetHealth(_id, 50);
						PLAYER::SetPain(_id, 0);
					}
					setTimer(using inline pagijo, 5000, 0);

				} else {

					inmind(pid, "Neturiu elektro soko, db mirsi .. ( /add_item 106 1 )", _id);
				}
			}
			else if(strfind(inputtext, "Nuimti skausmà") != -1)
			{
				new const slotas = findItemInBag(pid, ITEM::nuskausminamieji);
				if( slotas == -1)
				{
					inmind(pid, "Neturiu nuskausminamøjø ..", _id);

				} else {

					//PLAYER::GiveExp(pid, 1, true);
					RemoveItemFromSlot(pid, slotas, 1);
					PLAYER::SetPain(_id, PLAYER::GetPain(_id) - 6000);
				}
			}
			else {

				goto show_again_;
			}
		}
	}

	format(gt, sizeof gt, C_SOC"%s\n ", GetPlayerNameEx(_id));
	switch(PLAYER::JOB::Get(pid))
	{
		case PD:
		{
			strcat(gt, "\n\t"C_DOT C_SOC"Surakinti.");
			strcat(gt, "\n\t"C_DOT C_SOC"Bausti.");
			if(PLAYER::GetWanted(_id))
				strcat(gt, "\n\t"C_DOT C_SOC"Siûlyti susimokëti baudà.");
			strcat(gt, "\n\t"C_DOT C_SOC"Ásodinti á maðinà.");
		}
		case MEDIKAS:
		{
			if(PLAYER::IsFreezed(_id, MIRSTA))
				strcat(gt, "\n\t"C_DOT C_SOC"Gaivinti.");
			strcat(gt, "\n\t"C_DOT C_SOC"Sutvarstyti.");
			strcat(gt, "\n\t"C_DOT C_SOC"Nuimti skausmà.");
		}
	}
	showDialog(pid, using inline dialog, DIALOG_STYLE_LIST, GetPlayerNameEx(_id), gt, "Rinktis", "Uþdaryti");
			
	return 1;
}

func findEmptySeatInVehicle(vehid)
{
	new const seats = MaxSeats[getVehicleModel(vehid)-400] - 1;
	if( seats <= 0 ) return 0;

	new freeseat = 1;

	foreach(new i : Player)
	{
		if(getPlayerVehicleID(i) == vehid || GetPlayerState(i) == PLAYER_STATE_PASSENGER)
		{
			if(GetPlayerVehicleSeat(i) == freeseat)
				freeseat++;
		}
	}
	if(freeseat <= seats)
		return freeseat;

	return 0;
}

//--------------------------------------------------

public::car_degalai(pid)
	{
		if( IsPlayerDriver(pid))
		{
			new bool: e[7], vehid = getPlayerVehicleID(pid);
			getVehicleParamsEx(vehid, e[6], e[0], e[1], e[2], e[3], e[4], e[5]);

			if( car[vehid][degalai] > 0)
			{
				if( ! e[6] ) setVehicleParamsEx(vehid, true, e[0], e[1], e[2], e[3], e[4], e[5]);
				car[vehid][degalai]--;

				if(vehicle.error.get(vehid, gFuel))
				{
					car[vehid][degalai] -= random(3) + 3;
				}
			}
			if( car[vehid][degalai] < 1)
			{
				setVehicleParamsEx(vehid, false, e[0], e[1], e[2], e[3], e[4], e[5]);
				notification(pid, "Nebera degalu");
			}
		}
	}
	
func spawn_from_reg(pid)
{
	pinfo[current_quest] = 0;
	showQuest(pid);
	TogglePlayerDynamicArea(pid, area[spawn_shop_area], 1);
}

//--------------------------------------------------

public::CheckPaused()
{
	foreach(new i : Player)
	{
		if(IsPlayerSpawned(i))
		{
			if(get.afkc[i] == 2 && ! player.bool.get(i, bAfk))
			{
				player.bool.on(i, bAfk);
				CallLocalFunction("OnPlayerPause","i",i);
			}
			else if( get.afkc[i] == 1 && ! player.bool.get(i, bAfk))
			{
				if(GetPlayerState(i) == PLAYER_STATE_DRIVER)
				{
					new coords<1>;
					new const vid=GetPlayerVehicleID(i);
					GetVehicleVelocity(vid,coords<1>);
					SetVehicleVelocity(vid,coords<1>+0.05);
					set.afkc[i] = 2;
				
				} else {

					player.bool.on(i, bAfk);
					CallLocalFunction("OnPlayerPause","i",i);
				}
			}
			else if( !get.afkc[i] && player.bool.get(i, bAfk) )
			{
				player.bool.off(i, bAfk);
				CallLocalFunction("OnPlayerUnpause","i",i);
			}
			else if(player.bool.get(i, bPrisijunges))
			{
				set.afkc[i] = 1;
			}
		}
	}
	return 1;
}

//--------------------------------------------------

stock leaveJob(pid = -1, dbid = 0, update = 1)
{
	if(dbid)
	{
		sql_query(sqlHandle, F("UPDATE zaidejai SET darbas = 0, v_week = 0, v2_week = 0, v_today = 0, v_week = 0 WHERE id = %i", dbid), QUERY_THREADED);

	} else {

		if(PLAYER::JOB::Get(pid))
		{
			static name[MAX_PLAYER_NAME];
			GetPlayerName(pid, name, sizeof name);
			foreach(new i : Player)
			{
				if((PLAYER::JOB::Get(pid) == PD || PLAYER::JOB::GetDirector(pid) == PD) && i != pid)
				{
					notification2(i, F("~y~%s~w~ paliko darba.", name));
				}
			}
		}
		PLAYER::JOB::Set(pid, 0);
		PLAYER::JOB::SetRank(pid, 0);

		pinfo[darbas][data1_today] = 0;
		pinfo[darbas][data2_today] = 0;
		pinfo[darbas][data1_week] = 0;
		pinfo[darbas][data2_week] = 0;

		PLAYER::SetSkin(pid, SKIN_PLAYER);

		if(player.bool.get(pid, bQuestListOpen))
		{
			QUEST::HideMenu(pid);
		}

		if(update)
			updatePlayer(pid);

	}
}

/*
Gaujos Pavadinimas
____________________________________
+ Nariai online 6/25
+ Gaujos patirtis -2545
- Gaujos ryðiai
- Tvarkyti narius.
*/

/*
Gaujos Pavadinimas
____________________________________
+ Gaujos vadas
+ Nariai online 6/25
+ Gaujos patirtis -2545
- Gaujos ryðiai
+ Palikti gaujà.
*/
/*
YCMD:logmein(pid, params[], help)
{
		//Objects(id_);
		SetPlayerTeam(pid, 1);

		TextDrawHideForPlayer(pid, Init2);
		TextDrawHideForPlayer(pid, Init3);
		TextDrawHideForPlayer(pid, Init4);
		logo_appear(pid);
		sql_query(sqlHandle, F("SELECT id FROM zaidejai WHERE vardas = '%s'", GetPlayerNameEx( pid )), QUERY_CACHED | QUERY_THREADED, "checkForAccount", "r");
		return 1;
}*/

func getPIDFromDBID(id)
{
	foreach(new i : Player)
	{
		if(pInfo[i][DBID] == id)
			return i;
	}
	return INVALID_PLAYER_ID;
}

func add_shop_item(shopid, itemid)
{

}

func del_shop_item(shopid, itemid)
{

}

func IsItemInShop(shopid, itemid)
{

}

/*
func load_storage(shops:shopid,pid,side1 = 0, side2 = 0, reloadall = 1)
{
	if(pinfo[current_quest] == 3)
	{
		notification2(pid, " + ~y~1~w~ patirties ( ~y~PT~w~ )");
		PLAYER::GiveExp(pid, 1);
		++pinfo[current_quest];
		showQuest(pid);
	}
	baguse[shop_id] = shopid;
	hide_shop(pid);
	player.bool.on(pid, bShopOpen);

	new fitem1, fitem2, sum;
	
	if(reloadall)
		UpdateAmmo(pid);

	switch(side1)// shop pusë
	{
		case 0: fitem1 = 0;
		case 1: fitem1 = LoadShopNext(pid);
		case 2: fitem1 = LoadShopPrev(pid);
		case 3: fitem1 = GetCurrentShopPage(pid);
	}
	switch(side2)//bag pusë
	{
		case 0: fitem2 = 0;
		case 1: fitem2 = LoadShopBagNext(pid);
		case 2: fitem2 = LoadShopBagPrev(pid);
		case 3: fitem2 = GetCurrentShopBagPage(pid);
	}
	if(reloadall)// perkrauti viskà?
	{
		PlayerTextDrawSetString(pid, pShop[pid][1][0],f("%i", baguse[tbagpageid]+1));
		PlayerTextDrawShow(pid, pShop[pid][1][0]);
		PlayerTextDrawSetString(pid, pShop[pid][0][0],f("%i", baguse[tshoppageid]+1));
		PlayerTextDrawShow(pid, pShop[pid][0][0]);
			
		player.bool.on(pid, bShopOpen);
		baguse[last_clicked_textdraw_row] = PlayerText:-1;
		baguse[selecteditem] = PlayerText:-1;
		slcslot = -1;
		for(new i; i < 13; ++i)
			baguse[bagedit:i] = -1;
	}

	//Parodom fonà ir pagrindinius mygtukus.
	for(new i; i < 16; ++i)
	{
		TextDrawShowForPlayer(pid, iShop[i]);
	}
	

	// Jeigu pirmas puslapis, neberodom mygtuko 'Atgal'
	if( baguse[tbagpageid] <= 0)
		TextDrawHideForPlayer(pid, iShop[14]);
	else
		TextDrawShowForPlayer(pid, iShop[14]);

	// Jeigu paskutinis, nerodom mygtuko 'pirmyn'
	if( baguse[tbagpageid]+1 >= GetMaxPagesShopBag(pid))
		TextDrawHideForPlayer(pid, iShop[15]);
	else
		TextDrawShowForPlayer(pid, iShop[15]);

	// Rodom daiktø eilutes.
	for(new idx = fitem2, i, j, n = 1; idx < MAX_ITEM && j < 12; idx++)
	{
		tryagain:
		i = bag[idx][item];
		if( i == 0) continue;
		if(!bag[idx][kiekis])
		{
			RemoveItemFromSlot(pid, idx, -1);
			goto tryagain;
		}

		baguse[bagedit:j] = idx;
		j++;

		if( flag_get(bag[idx][item_info], IS_INUSE) )
			PlayerTextDrawColor( pid, pShop[pid][1][n], COLOR_OK);
		else
			PlayerTextDrawColor( pid, pShop[pid][1][n], -1);

		PlayerTextDrawBoxColor( pid, pShop[pid][1][n], COLOR_BAG_DEFAULT);

		PlayerTextDrawSetString(pid,pShop[pid][1][n], ItemInfo[i][item_name]);
		PlayerTextDrawShow(pid, pShop[pid][1][n]);
			n++;
		PlayerTextDrawSetString(pid,pShop[pid][1][n], f("%i",bag[idx][kiekis]));
		PlayerTextDrawShow(pid, pShop[pid][1][n]);
			n++;

		sum = ItemInfo[i][item_kaina];
		sum -= int(sum * SHOP_PRICE_DIFF);

		PlayerTextDrawSetString(pid,pShop[pid][1][n], f("%i", sum));
		PlayerTextDrawShow(pid, pShop[pid][1][n]);
			n++;
	}

	if( baguse[tshoppageid] <= 0)
		TextDrawHideForPlayer(pid, iShop[9]);
	else
		TextDrawShowForPlayer(pid, iShop[9]);

	// Jeigu paskutinis, nerodom mygtuko 'pirmyn'
	new const maxpg = GetMaxPagesShopShop(shopid);
	if( baguse[tshoppageid]+1 >= maxpg)
		TextDrawHideForPlayer(pid, iShop[8]);
	else
		TextDrawShowForPlayer(pid, iShop[8]);

	// Rodom daiktø eilutes.
	for(new idx = fitem1, i, j, n = 1; idx < MAX_ITEM && j < 12; idx++)
	{
		tryagain:
		i = shop[shopid][idx][item];
		if( i == 0) continue;
		if(!shop[shopid][idx][kiekis])
		{
			RemoveItemFromShopSlot(shopid, idx, -1);
			goto tryagain;
		}

		baguse[bagedit:(j+13)] = idx;
		j++;

		if( flag_get(shop[shopid][idx][item_info], IS_INUSE) )
			PlayerTextDrawColor( pid, pShop[pid][0][n], COLOR_OK);
		else
			PlayerTextDrawColor( pid, pShop[pid][0][n], -1);

		PlayerTextDrawBoxColor( pid, pShop[pid][0][n], COLOR_BAG_DEFAULT);

		PlayerTextDrawSetString(pid,pShop[pid][0][n], ItemInfo[i][item_name]);
		PlayerTextDrawShow(pid, pShop[pid][0][n]);
			n++;
		PlayerTextDrawSetString(pid,pShop[pid][0][n], f("%i",shop[shopid][idx][kiekis]));
		PlayerTextDrawShow(pid, pShop[pid][0][n]);
			n++;

		sum = ItemInfo[i][item_kaina];
		sum += int(sum * SHOP_PRICE_DIFF);

		PlayerTextDrawSetString(pid,pShop[pid][0][n], f("%i", sum));
		PlayerTextDrawShow(pid, pShop[pid][0][n]);
			n++;
	}
}
*/
func SaveShops()
{
	static buffer[500];
	for(new shops:i; i != shops; ++i)
	{
		format(gt, sizeof gt, "UPDATE parduotuves SET prekes = '");
		for(new j = 0; shop[i][j][item] != 0 ; ++j)
		{
			format(buffer, sizeof buffer, "%i/%i/",shop[i][j][item], shop[i][j][kiekis]);
			for(new k; k != eBonus; ++k)
			{
				strcat(buffer, f("%i/", shop[i][j][effect][k]));
			}
			strcat(gt, buffer);
		}
		strcat(gt, f("' WHERE id = '%i'", i));
		sql_query(sqlHandle, gt);
	}
}

func LoadShops()
{
	new const Result:r = sql_query(sqlHandle, "SELECT * FROM parduotuves WHERE 1", QUERY_CACHED);
	new const rows = sql_num_rows(r);

	for(new i; i != rows; ++i, sql_next_row(r))
	{
		sql_get_field_assoc(r, "prekes", gt);

		static buffer[MAX_ITEM][200];
		static snf[16];
		new const shops:id = shops:sql_get_field_assoc_int(r, "id");
		format(snf, sizeof snf, "p</>a<i>[%i]", eBonus+2);
		sscanf(gt, "p<|>a<s[200]>["#MAX_ITEM"]", buffer);
		for(new j; j != MAX_ITEM; ++j)
		{
			sscanf(buffer[j], snf, shop[id][j]);
		}
	}
}

func ReloadShops()
{

}

func LoadShopNext(pid)
{
	baguse[tshoppageid]++;
	return baguse[tshoppageid] * 12;
}

func LoadShopPrev(pid)
{
	baguse[tshoppageid]--;
	return baguse[tshoppageid] * 12;
}

func GetCurrentShopPage(pid)
{
	return baguse[tshoppageid] * 12;
}

func GetCurrentShopBagPage(pid)
{
	return baguse[tbagpageid] * 12;
}

func LoadShopBagNext(pid)
{
	baguse[tbagpageid]++;
	return baguse[tbagpageid] * 12;
}

func LoadShopBagPrev(pid)
{
	baguse[tbagpageid]--;
	return baguse[tbagpageid] * 12;
}

func GetMaxPagesShopShop(shops:shopid)
{
	new j = 0;
	for(new i = 0; i < MAX_ITEM; ++i)
		if( ! shop[shopid][i][item] || !shop[shopid][i][kiekis] ) continue;
		else j++;
	if(j % 12)
		return j / 12 + 1;
	else
		return j / 12;
}

func GetMaxPagesShopBag(pid)
{
	new j = 0;
	for(new i = 0; i < MAX_ITEM; ++i)
		if( ! bag[i][item] || !bag[i][kiekis] ) continue;
		else j++;
	if(j % 12)
		return j / 12 + 1;
	else
		return j / 12;
}

func RemoveItemFromShopSlot(shops:id, slot, amount)
{
	if( 0 <= slot <= MAX_ITEM - 1 )
	{
		if(id == shop_spawn && shop[id][slot][item] == ITEM::zemelapis)
		{
			return;
		}
		if( amount < 0 || shop[id][slot][kiekis] <= amount)
		{
			clearSlot(shop[id][slot]);
			for(new i = slot; i < MAX_ITEM-1; ++i)
			{
				slotcpy(shop[id][i], shop[id][(i + 1)]);
			}

		} else {

			shop[id][slot][kiekis] -= amount;
		}
	}
}

stock AddItemToShop(shops:id, itemid, amount, iEffect[eBonus] = {0,...})
{
	if(!itemid || !amount) return 0;

// TODO : Pabaigti keisti item_flag to effect. Liko tik shopai ir ginklai

	new newitem[e_bag];
	newitem[item] = itemid;
	newitem[kiekis] = amount;

	for(new i; i != eBonus; ++i)
	newitem[effect][i] = iEffect[i];

	newitem[item_info] = flag_item:0;

	for(new i; i < MAX_ITEM; ++i)
	{
		if(shop[id][i][item] == itemid)
		{
			if(!memcmp(trunk[id][i][effect], iEffect))
			{
				shop[id][i][kiekis] += amount;
				return 1;
			}
		}
	}

	insertToShopSlot(id, 0, newitem);

	return 1;
}

func insertToShopSlot(shops:id, slot, info[e_bag])
{
	for(new i = MAX_ITEM-1; i > slot; i--)
		slotcpy(shop[id][i], shop[id][i-1]);

	slotcpy(shop[id][slot], info);
}

func BagToShop(pid)
{
	if(slcslot == -1) return notification(pid, "nieko nepasirinkai");

	switch(baguse[shop_id])
	{
		case shop_spawn:
		{
			switch(bag[slcslot][item])
			{
				case 
					shop_spawn_prekes:
				{
					sellItem(pid);
				}
				default:
				{
					notification(pid, "Sio daikto sioje parduotuve parduoti negali.");
				}
			}
		}
		case shop_baras:
		{
			switch(bag[slcslot][item])
			{
				case 
					shop_baras_prekes:
				{
					sellItem(pid);
				}
				default:
				{
					notification(pid, "Sio daikto sioje parduotuve parduoti negali.");
				}
			}
		}
		case shop_gunshop:
		{
			switch(bag[slcslot][item])
			{
				case 
					shop_gunshop_prekes:
				{
					sellItem(pid);
				}
				default:
				{
					notification(pid, "Sio daikto sioje parduotuve parduoti negali.");
				}
			}
		}
		case shop_foodstore:
		{
			switch(bag[slcslot][item])
			{
				case 
					shop_foodstore_prekes:
				{
					sellItem(pid);
				}
				default:
				{
					notification(pid, "Sio daikto sioje parduotuve parduoti negali.");
				}
			}
		}
		case shop_clothes:
		{
			switch(bag[slcslot][item])
			{
				case 
					shop_clothes_prekes:
				{
					sellItem(pid);
				}
				default:
				{
					notification(pid, "Sio daikto sioje parduotuve parduoti negali.");
				}
			}
		}
	}
	return 1;
}

func sellItem(pid)
{
	new sum = ItemInfo[bag[slcslot][item]][item_kaina];

	if(bag[slcslot][kiekis] > 1)
	{
		inline dialog(id, did, response, listitem, string:txt[])
		{
			#pragma unused id, did, listitem
			if(response)
			{
				new amount = strval(txt);
				if(isnull(txt) || amount <= 0) return showDialog(pid, using inline dialog, DIALOG_STYLE_INPUT, "Parduoti", C_SOC"Kiek vnt. nori parduoti?", "Rinktis", "Atðaukti");
				if(amount > bag[slcslot][kiekis])
					amount = bag[slcslot][kiekis];

				sum = ItemInfo[bag[slcslot][item]][item_kaina];
				sum *= amount;
				sum -= int(sum * SHOP_PRICE_DIFF);

				inline dialog2(id1, did1, response1, listitem1, string:txt1[])
				{
					#pragma unused id1, did1, listitem1, txt1
					if(response1)
					{
						new efc[eBonus];
						memadd(efc, bag[slcslot][effect]);
						AddItemToShop(baguse[shop_id], bag[slcslot][item], amount, efc);
						RemoveItemFromSlot(pid, slcslot, amount);

						PLAYER::GiveMoney( pid, sum );

						load_shop(baguse[shop_id], pid, 3, 3);

					} else {

						showDialog(pid, using inline dialog, DIALOG_STYLE_INPUT, "Parduoti", C_SOC"Kiek vnt. nori parduoti?", "Rinktis", "Atðaukti");
					}
				}
				showDialog(pid, using inline dialog2, DIALOG_STYLE_MSGBOX, "Parduoti", F(C_SOC"Uþ %s ("C_Y"%i"C_SOC"vnt) gausi "C_Y"%i"C_SOC" lt. Ar tiktai nori parduoti?", ItemInfo[bag[slcslot][item]][item_name], amount, sum), "Taip", "Atgal");
			}
			return 1;
		}
		showDialog(pid, using inline dialog, DIALOG_STYLE_INPUT, "Parduoti", C_SOC"Kiek vnt. nori parduoti?", "Rinktis", "Atðaukti");
	
	} else {

		new efc[eBonus];
		memadd(efc, bag[slcslot][effect]);

		AddItemToShop(baguse[shop_id], bag[slcslot][item], 1, efc);
		RemoveItemFromSlot(pid, slcslot, 1);

		sum -= int(sum * SHOP_PRICE_DIFF);
		PLAYER::GiveMoney( pid, sum );

		load_shop(baguse[shop_id], pid, 3, 3);
	}
	return 1;
}

func buyItem(pid)
{
	new sum = ItemInfo[shop[baguse[shop_id]][slcslot][item]][item_kaina];

	if(shop[baguse[shop_id]][slcslot][kiekis] > 1)
	{
		inline dialog(id, did, response, listitem, string:txt[])
		{
			#pragma unused id, did, listitem
			if(response)
			{
				new amount = strval(txt);
				if(isnull(txt) || amount <= 0) return showDialog(pid, using inline dialog, DIALOG_STYLE_INPUT, "Pirkti", C_SOC"Kiek vnt. nori pirkti?", "Rinktis", "Atðaukti");
				if(amount > shop[baguse[shop_id]][slcslot][kiekis])
					amount = shop[baguse[shop_id]][slcslot][kiekis];
					
				sum = ItemInfo[shop[baguse[shop_id]][slcslot][item]][item_kaina];
				sum *= amount;
				sum += int(sum * SHOP_PRICE_DIFF);
				if(PLAYER::GetMoney(pid) < sum)
				{
					notification2(pid, F("Tau truksta ~y~%i~w~ lt.", sum - PLAYER::GetMoney(pid)));
					return showDialog(pid, using inline dialog, DIALOG_STYLE_INPUT, "Pirkti", C_SOC"Kiek vnt. nori pirkti?", "Rinktis", "Atðaukti");
				}
				inline dialog2(id1, did1, response1, listitem1, string:txt1[])
				{
					#pragma unused id1, did1, listitem1, txt1
					if(response1)
					{
						if(pinfo[current_quest] == 4 && shop[baguse[shop_id]][slcslot][item] == ITEM::zemelapis)
						{
							notification2(pid, " + ~y~3~w~ patirties ( ~y~PT~w~ )");
							PLAYER::GiveExp(pid, 3);
							++pinfo[current_quest];
							showQuest(pid);
						}
						PLAYER::GiveMoney( pid, -sum );
						new efc[eBonus];
						memadd(efc, shop[baguse[shop_id]][slcslot][effect]);
						AddItem(pid, shop[baguse[shop_id]][slcslot][item], amount, efc);
						RemoveItemFromShopSlot(baguse[shop_id], slcslot, amount);

						load_shop(baguse[shop_id], pid, 3, 3);

					} else {

						showDialog(pid, using inline dialog, DIALOG_STYLE_INPUT, "Pirkti", C_SOC"Kiek vnt. nori pirkti?", "Rinktis", "Atðaukti");
					}
				}
				showDialog(pid, using inline dialog2, DIALOG_STYLE_MSGBOX, "Pirkti", F(C_SOC"Uþ %s ("C_Y"%i"C_SOC"vnt) sumokësi "C_Y"%i"C_SOC" lt. Ar tiktai nori pirkti?", ItemInfo[shop[baguse[shop_id]][slcslot][item]][item_name], amount, sum), "Taip", "Atgal");
			}
			return 1;
		}
		showDialog(pid, using inline dialog, DIALOG_STYLE_INPUT, "Pirkti", C_SOC"Kiek vnt. nori pirkti?", "Rinktis", "Atðaukti");
	
	} else {

		sum += int(sum * SHOP_PRICE_DIFF);
		if(PLAYER::GetMoney(pid) < sum)
		{
			notification2(pid, F("Tau truksta ~y~%i~w~ lt.", sum - PLAYER::GetMoney(pid)));
			return 1;

		} else {

			if(pinfo[current_quest] == 4 && shop[baguse[shop_id]][slcslot][item] == ITEM::zemelapis)
			{
				notification2(pid, " + ~y~3~w~ patirties ( ~y~PT~w~ )");
				PLAYER::GiveExp(pid, 3);
				++pinfo[current_quest];
				showQuest(pid);
			}
			PLAYER::GiveMoney( pid, -sum );

			new efc[eBonus];
			memadd(efc, shop[baguse[shop_id]][slcslot][effect]);

			AddItem(pid, shop[baguse[shop_id]][slcslot][item], 1, efc);
			RemoveItemFromShopSlot(baguse[shop_id], slcslot, 1);
		}	

		load_shop(baguse[shop_id], pid, 3, 3);
	}
	return 1;
}

func ShopToBag(pid)
{
	if(slcslot == -1) return notification(pid, "nieko nepasirinkai");
	
	buyItem(pid);

	return 1;
}

func hide_shop(pid)
{
	player.bool.off(pid, bShopOpen);
	for(new i; i < 37; ++i)
		PlayerTextDrawHide(pid, pShop[pid][0][i]),
		PlayerTextDrawHide(pid, pShop[pid][1][i]);
	for(new i; i < 16; ++i)
		TextDrawHideForPlayer(pid, iShop[i]);
}

stock load_shop(shops:shopid,pid,side1 = 0, side2 = 0, reloadall = 1)
{
	if(pinfo[current_quest] == 3)
	{
		notification2(pid, " + ~y~1~w~ patirties ( ~y~PT~w~ )");
		PLAYER::GiveExp(pid, 1);
		++pinfo[current_quest];
		showQuest(pid);
	}
	baguse[shop_id] = shopid;
	hide_shop(pid);
	player.bool.on(pid, bShopOpen);
	new fitem1, fitem2, sum;
	
	if(reloadall)
		UpdateAmmo(pid);

	switch(side1)// shop pusë
	{
		case 0: fitem1 = 0;
		case 1: fitem1 = LoadShopNext(pid);
		case 2: fitem1 = LoadShopPrev(pid);
		case 3: fitem1 = GetCurrentShopPage(pid);
	}
	switch(side2)//bag pusë
	{
		case 0: fitem2 = 0;
		case 1: fitem2 = LoadShopBagNext(pid);
		case 2: fitem2 = LoadShopBagPrev(pid);
		case 3: fitem2 = GetCurrentShopBagPage(pid);
	}
	if(reloadall)// perkrauti viskà?
	{
		PlayerTextDrawSetString(pid, pShop[pid][1][0],f("%i", baguse[tbagpageid]+1));
		PlayerTextDrawShow(pid, pShop[pid][1][0]);
		PlayerTextDrawSetString(pid, pShop[pid][0][0],f("%i", baguse[tshoppageid]+1));
		PlayerTextDrawShow(pid, pShop[pid][0][0]);
			
		player.bool.on(pid, bShopOpen);
		baguse[last_clicked_textdraw_row] = PlayerText:-1;
		baguse[selecteditem] = PlayerText:-1;
		slcslot = -1;
		for(new i; i < 13; ++i)
			baguse[bagedit:i] = -1;
	}

	//Parodom fonà ir pagrindinius mygtukus.
	for(new i; i < 16; ++i)
	{
		TextDrawShowForPlayer(pid, iShop[i]);
	}
	
// bag pusë

	// Jeigu pirmas puslapis, neberodom mygtuko 'Atgal'
	if( baguse[tbagpageid] <= 0)
		TextDrawHideForPlayer(pid, iShop[14]);
	else
		TextDrawShowForPlayer(pid, iShop[14]);

	// Jeigu paskutinis, nerodom mygtuko 'pirmyn'
	if( baguse[tbagpageid]+1 >= GetMaxPagesShopBag(pid))
		TextDrawHideForPlayer(pid, iShop[15]);
	else
		TextDrawShowForPlayer(pid, iShop[15]);

	// Rodom daiktø eilutes.
	for(new idx = fitem2, i, j, n = 1; idx < MAX_ITEM && j < 12; idx++)
	{
		tryagain:
		i = bag[idx][item];
		if( i == 0) continue;
		if(!bag[idx][kiekis])
		{
			RemoveItemFromSlot(pid, idx, -1);
			goto tryagain;
		}

		baguse[bagedit:j] = idx;
		j++;

		if( flag_get(bag[idx][item_info], IS_INUSE) )
			PlayerTextDrawColor( pid, pShop[pid][1][n], COLOR_OK);
		else
			PlayerTextDrawColor( pid, pShop[pid][1][n], -1);

		PlayerTextDrawBoxColor( pid, pShop[pid][1][n], COLOR_BAG_DEFAULT);

		PlayerTextDrawSetString(pid,pShop[pid][1][n], ItemInfo[i][item_name]);
		PlayerTextDrawShow(pid, pShop[pid][1][n]);
			n++;
		PlayerTextDrawSetString(pid,pShop[pid][1][n], f("%i",bag[idx][kiekis]));
		PlayerTextDrawShow(pid, pShop[pid][1][n]);
			n++;

		sum = ItemInfo[i][item_kaina];
		sum -= int(sum * SHOP_PRICE_DIFF);

		PlayerTextDrawSetString(pid,pShop[pid][1][n], f("%i", sum));
		PlayerTextDrawShow(pid, pShop[pid][1][n]);
			n++;
	}

// shop pusë
	if( baguse[tshoppageid] <= 0)
		TextDrawHideForPlayer(pid, iShop[9]);
	else
		TextDrawShowForPlayer(pid, iShop[9]);

	// Jeigu paskutinis, nerodom mygtuko 'pirmyn'
	new const maxpg = GetMaxPagesShopShop(shopid);
	if( baguse[tshoppageid]+1 >= maxpg)
		TextDrawHideForPlayer(pid, iShop[8]);
	else
		TextDrawShowForPlayer(pid, iShop[8]);

	// Rodom daiktø eilutes.
	for(new idx = fitem1, i, j, n = 1; idx < MAX_ITEM && j < 12; idx++)
	{
		tryagain:
		i = shop[shopid][idx][item];
		if( i == 0) continue;
		if(!shop[shopid][idx][kiekis])
		{
			RemoveItemFromShopSlot(shopid, idx, -1);
			goto tryagain;
		}

		baguse[bagedit:(j+13)] = idx;
		j++;

		if( flag_get(shop[shopid][idx][item_info], IS_INUSE) )
			PlayerTextDrawColor( pid, pShop[pid][0][n], COLOR_OK);
		else
			PlayerTextDrawColor( pid, pShop[pid][0][n], -1);

		PlayerTextDrawBoxColor( pid, pShop[pid][0][n], COLOR_BAG_DEFAULT);

		PlayerTextDrawSetString(pid,pShop[pid][0][n], ItemInfo[i][item_name]);
		PlayerTextDrawShow(pid, pShop[pid][0][n]);
			n++;
		PlayerTextDrawSetString(pid,pShop[pid][0][n], f("%i",shop[shopid][idx][kiekis]));
		PlayerTextDrawShow(pid, pShop[pid][0][n]);
			n++;

		sum = ItemInfo[i][item_kaina];
		sum += int(sum * SHOP_PRICE_DIFF);

		PlayerTextDrawSetString(pid,pShop[pid][0][n], f("%i", sum));
		PlayerTextDrawShow(pid, pShop[pid][0][n]);
			n++;
	}
}

func UpdateAmmo(pid)
{
	new wepid,ammo;
	for(new s = 1; s < 13; ++s)
	{
		GetPlayerWeaponData(pid, s, wepid, ammo);

		for(new i; i < MAX_ITEM; ++i)
		{
			if(bag[i][item] - 60 == s)
			{
				for(new j; j < MAX_ITEM; ++j)
				{
					if(GetWeaponSlot(GetWeaponFromItem(bag[j][item])) == s && flag_get(bag[j][item_info], IS_INUSE))
					{
						if(ammo < bag[i][kiekis])
						{
							bag[i][kiekis] = ammo;
						}
						break;
					}
				}
			}
		}
		if( ! ammo || ! wepid)
		{
			UnuseWeaponInSlot(pid, s);
		}
	}
	return 1;
}
/*
func infolist(pid, text[])
{
	if(!isnull(text))
	{
		strins(infotextas[pid], f("\n%s", text))
		inline timeris()
		{

		}
		setTimer(using inline timeris, 1000, 0);
	}
}
*/

func showQuest(pid)
{
	new const questid = pinfo[current_quest];
	if(questid == sizeof tut_quest_list)
	{
		hideQuest(pid);
		return;
	}
	TextDrawShowForPlayer(pid, g_task);
	PlayerTextDrawShow(pid, p_task[0][pid]);
	PlayerTextDrawShow(pid, p_task[1][pid]);
	PlayerTextDrawSetString(pid, p_task[0][pid], tut_quest_list[questid][quest_head]);
	PlayerTextDrawSetString(pid, p_task[1][pid], tut_quest_list[questid][quest_body]);
}

func hideQuest(pid)
{
	TextDrawHideForPlayer(pid, g_task);
	PlayerTextDrawHide(pid, p_task[0][pid]);
	PlayerTextDrawHide(pid, p_task[1][pid]);
}

stock showTip(pid, id = -1, head[] = "", body[] = "")
{
	infoMsg(pid, "showTip");
	TextDrawShowForPlayer(pid, g_tip_show);
	PlayerTextDrawShow(pid, p_tip_show[pid]);

	ptemp[tip_id] = id;

	if(id == -1)
	{
		PlayerTextDrawSetString(pid, p_tip_show[pid], head);
		format(ptemp[tip_head], 32, head);
		format(ptemp[tip_body], 256, body);
	
	} else {

		PlayerTextDrawSetString(pid, p_tip_show[pid], tip_list[id][tip_name]);
	}

	player.bool.on(pid, bTip);
	return 1;
}

func hideTip(pid)
{
	ptemp[tip_id] = -1;
	TextDrawHideForPlayer(pid, g_tip_show);
	TextDrawHideForPlayer(pid, g_tip[0]);
	TextDrawHideForPlayer(pid, g_tip[1]);
	PlayerTextDrawHide(pid, p_tip_show[pid]);
	PlayerTextDrawHide(pid, p_tip[0][pid]);
	PlayerTextDrawHide(pid, p_tip[1][pid]);
	player.bool.off(pid, bTip);
}

func notification2(pid, text[])
{
	PlayerTextDrawShow(pid, Notification2[pid]);
	PlayerTextDrawSetString(pid, Notification2[pid], text);
	tinfo[notification2_diff] = gettime();
	player.bool.on(pid, bNotification2);
	return 1;
}

func hide_notification2(pid)
{
	PlayerTextDrawHide(pid, Notification2[pid]);
	player.bool.off(pid, bNotification2);
}

func notification(pid, text[])
{
	PlayerTextDrawShow(pid, Notification0[pid]);
	PlayerTextDrawShow(pid, Notification1[pid]);
	PlayerTextDrawSetString(pid,Notification1[pid], text);
	tinfo[notification_diff] = gettime();
	player.bool.on(pid, bNotification);
	return 1;
}

public::hide_notification(pid)
{
	PlayerTextDrawHide(pid, Notification0[pid]);
	PlayerTextDrawHide(pid, Notification1[pid]);
	player.bool.off(pid, bNotification);
}

func show_menu(pid)
{
	del.selected_menu[pid];
	TextDrawShowForPlayer(pid, menu[0]);
	TextDrawShowForPlayer(pid, menu[1]);

	for(new i; i < 12; ++i)
		PlayerTextDrawShow(pid, pmenu[i][pid]);
/*	PlayerTextDrawShow(pid, menu1[pid]);
	PlayerTextDrawShow(pid, menu2[pid]);
	PlayerTextDrawShow(pid, menu3[pid]);
	PlayerTextDrawShow(pid, menu4[pid]);
	PlayerTextDrawShow(pid, menu5[pid]);
	PlayerTextDrawShow(pid, menu6[pid]);
	PlayerTextDrawShow(pid, menu7[pid]);
	PlayerTextDrawShow(pid, menu8[pid]);
	PlayerTextDrawShow(pid, menu9[pid]);
	PlayerTextDrawShow(pid, menu10[pid]);
	PlayerTextDrawShow(pid, menu11[pid]);
	PlayerTextDrawShow(pid, menu12[pid]);
	PlayerTextDrawShow(pid, menu14[pid]);*/
}
func hide_menu(pid)
{
	player.bool.off(pid, bGpsOpen);
	player.bool.off(pid, bPMenuOpen);
	del.selected_menu[pid];
	TextDrawHideForPlayer(pid, menu[0]);
	TextDrawHideForPlayer(pid, menu[1]);
	for(new i; i < 12; ++i)
		PlayerTextDrawHide(pid, pmenu[i][pid]);
/*	PlayerTextDrawHide(pid, menu2[pid]);
	PlayerTextDrawHide(pid, menu3[pid]);
	PlayerTextDrawHide(pid, menu4[pid]);
	PlayerTextDrawHide(pid, menu5[pid]);
	PlayerTextDrawHide(pid, menu6[pid]);
	PlayerTextDrawHide(pid, menu7[pid]);
	PlayerTextDrawHide(pid, menu8[pid]);
	PlayerTextDrawHide(pid, menu9[pid]);
	PlayerTextDrawHide(pid, menu10[pid]);
	PlayerTextDrawHide(pid, menu11[pid]);
	PlayerTextDrawHide(pid, menu12[pid]);
	PlayerTextDrawHide(pid, menu14[pid]);*/
}

func menu_gps(pid)
{
	player.bool.on(pid, bGpsOpen);
	PlayerTextDrawSetString(pid, pmenu[0][pid], "GPS");

	PlayerTextDrawSetString(pid, pmenu[1][pid], "Darbai");
	PlayerTextDrawSetString(pid, pmenu[2][pid], "Ligonine");
	PlayerTextDrawSetString(pid, pmenu[3][pid], "Kita");
		PlayerTextDrawSetString(pid, pmenu[4][pid], "Parduotuves");
		PlayerTextDrawSetString(pid, pmenu[5][pid], "Savivaldybes");
		PlayerTextDrawSetString(pid, pmenu[6][pid], " ");
			PlayerTextDrawSetString(pid, pmenu[7][pid], "Degaline");
			PlayerTextDrawSetString(pid, pmenu[8][pid], "Busto nuoma");
			PlayerTextDrawSetString(pid, pmenu[9][pid], " ");

	PlayerTextDrawSetString(pid, pmenu[10][pid], "Nustatymai");
}

func menu_pmenu(pid)
{
	player.bool.on(pid, bPMenuOpen);
	PlayerTextDrawSetString(pid, pmenu[0][pid], "Tavo meniu");
	
	for(new i; i < sizeof degalines; ++i)
	{
		if(IsPlayerInRangeOfPoint(pid, 6, degalines[i][0], degalines[i][1], degalines[i][2]))
		{
			PlayerTextDrawSetString(pid, pmenu[1][pid], "Pilti degalus");
			break;
		
		} else PlayerTextDrawSetString(pid, pmenu[1][pid], " ");
	}

	PlayerTextDrawSetString(pid, pmenu[2][pid], "Kuprine");
	PlayerTextDrawSetString(pid, pmenu[3][pid], "Transportas");
		PlayerTextDrawSetString(pid, pmenu[4][pid], " ");
		PlayerTextDrawSetString(pid, pmenu[5][pid], "Draugai");
		PlayerTextDrawSetString(pid, pmenu[6][pid], "Taskai");
			PlayerTextDrawSetString(pid, pmenu[7][pid], " ");
			PlayerTextDrawSetString(pid, pmenu[8][pid], "Namas");
			PlayerTextDrawSetString(pid, pmenu[9][pid], "vip meniu");
}
/*
func soc(pid, text[])
{
	SendClientMessage(botaspid, 0, f("soc_%s", text));
}
*/

//--------------------------------------------------

stock GetPlayerNameEx(pid)
{
	new
		Name[ MAX_PLAYER_NAME ]
	;
	GetPlayerName( pid,Name,MAX_PLAYER_NAME );
	return Name;
}
//--------------------------------------------------
	
func tickcheck(pid, ticks)
{
	if( tickcount() < pticks[pid] + ticks)
	{
		return 1;
	}
	else
	{
		pticks[pid] = tickcount();
		return 0;
	}
}
//--------------------------------------------------
stock GetPlayerID(const playername[], partofname=0) //By Jan "DracoBlue" Schtze (edited by Gabriel "Larcius" Cordes)
{
	new playername1[24];
	foreach(new i : Player)
	{
		GetPlayerName(i,playername1,sizeof(playername1));
		if (strcmp(playername1,playername,true)==0)
		{
			return i;
		}
	}
	new correctsigns_userid=-1;
	new tmpuname[24];
	new hasmultiple=-1;
	if( partofname)
	{
		foreach(new i : Player)
		{
			GetPlayerName(i,tmpuname,sizeof(tmpuname));
			if (!strfind(tmpuname,playername,true))
			{
				hasmultiple++;
				correctsigns_userid=i;
			}
			if (hasmultiple>0)
			{
				return -2;
			}
		}
	}
	return correctsigns_userid;
}
#pragma unused ppAddWanted
#pragma unused ppjGetExp
#pragma unused ppjGiveExp
#pragma unused ppjSetExp