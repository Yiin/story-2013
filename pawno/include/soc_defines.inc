#define MAX_DOTS 512

#define MySQL_HOST "127.0.0.1"
#define MySQL_USER "root"
#define MySQL_DATA "story"
#define MySQL_PASS ""

#pragma tabsize 0
//#pragma dynamic 24000

native IsValidVehicle(vehicleid);

#define COLOR_SERVER 0xA9C4E4FF
#define COLOR_SOC 0xC6AA89FF
#define C_SOC "{F2E6CE}" // C6AA89
#define C_W "{ffffff}"
#define C_DOT "{70635F}•" // E3AE69
#define C_R "{C77D7D}"
#define C_G "{D1D6B6}"
#define C_Y "{C6AA89}" // F6BC10
#define C_GREY "{777777}"
#define COLOR_RED 0xC77D7DFF
#define COLOR_OK 0x97FC3CFF
#define COLOR_NO 0x70635FFF //0xFF1111FF
#define COLOR_SELECT 0xF2E6CEFF //0xd6bd91ff
#define COLOR_GREEN 0xD1D6B6FF //0x44FF44FF
#define COLOR_BAG_DEFAULT 102
#define LIGHT "{ecdcab}"
#define DARK  "{70635F}" // "{d9caa8}"
#define TEXT C_SOC //"{ecdcab}"

#define MEDIS 685
#define MEDIS_KRITES 684

#define VW_SkinSelect 1000
#define VW_Jailas 456
#define VW_vehicleShop 457
#define VW_DEFAULT 0

#define memcopy(%0,%1) memcpy(%0,%1,0,sizeof(%0)*4)

#define cam_pos_garazas					1548.447021,-32.110980,21.603610
#define cam_view_garazas				1554.772460,-24.763641,19.152906

#define pos_medikai_in 				   1257.8151,289.2157,19.3120
#define pos_medikai_in1 			   1264.5814,299.4047,19.9259
#define pos_medikai_out 			   1235.0875,302.3865,9105.4209
#define pos_oldwood_in 				   200.9524,-260.6495,1.4931
#define pos_oldwood_out 			   201.0426,-230.4691,13723.3955
#define pos_akra_in 				      2270.3794,66.1105,25.8281
#define pos_akra_out 				   2258.9187,59.0838,6714.2510
#define pos_mech_in 				      94.3851,-160.0283,1.9045
#define pos_mech_out 				   113.9555,-130.5970,2367.2310
#define pos_mech_persirengimas 		101.8773,-144.6338,2367.2280
#define pos_mech_daiktai 			   108.3508,-168.8206,2367.2280
#define pos_mech_isidarbinimas 		106.3799,-138.7415,2367.2280
#define pos_mech_tuneshop 			   103.4311,-130.6232,2367.2290
#define pos_mech_technikine			114.0402,-173.8799,1.2310
#define pos_mech_tune					113.8269,-168.9420,1.2294
#define pos_mech_taisykla			   113.6695,-191.0918,1.2360
#define pos_mech_in_taisykla			107.1578,-166.8302,2366.8870
#define pos_medikai_persirengimas 	1235.5708,288.30172,9105.4209
#define pos_medikai_isidarbinimas 	1238.8384,269.3131,9105.4209
#define pos_medikai_daiktai 		   1241.7856,287.2877,9105.4209
#define pos_pd_in 					   621.9134,-598.3571,16.5545
#define pos_pd_out 					   625.294, -586.808, 3000.122
#define pos_taxi_in					   2269.7158,-74.4122,26.7724
#define pos_taxi_out 				   2273.822, -62.627, 11268.2305
#define pos_furos_in						171.7979,2.0171,2.5569
#define pos_furos_out					0,0,0
#define pos_garazas						1551.1316,-27.5234,21.0035

#define gt g_szSprintfBuffer

#define getVehicleFromSampID(%0) sampVehicles[%0]

stock SetPlayerPoint(pid, Float:x, Float:y, Float:z )
{
	if(GetPVarInt(pid,"POINT"))
		DestroyPlayerObject(pid,GetPVarInt(pid,"POINT")),
		DestroyDynamicArea(GetPVarInt(pid,"POINT_AREA")),
		DeletePVar(pid,"POINT");
	SetPVarInt(pid,"POINT",CreatePlayerObject(pid,18728,Float:x, Float:y, Float:z-2.8,0,0,-90)),
	SetPVarInt(pid,"POINT_AREA",CreateDynamicSphere(Float:x, Float:y, Float:z,10,.playerid = pid)),
	SetPlayerCheckpoint(pid,Float:x, Float:y, Float:z,5);
}

#define DisablePlayerPoint(%0) \
if(GetPVarInt(%0,"POINT")) \
	DestroyPlayerObject(%0,GetPVarInt(%0,"POINT")), \
	DestroyDynamicArea(GetPVarInt(%0,"POINT_AREA")), \
	DeletePVar(%0,"POINT"), \
	DisablePlayerCheckpoint(%0)

#define MAX_ITEM 512
#define MAX_BAG_WEIGHT 40000
#define MAX_FIRES 100

#define VAIKINAS 0
#define MERGINA 1

#define IEJIMAS 1
#define ISEJIMAS 2


enum _:DARBAI
{
	NONE,
	MECHANIKAS,
	PD,
	MEDIKAS,
	TAXI,
	GAISRININKAS,
	VALYTOJAS,
	FURISTAS,
	CRAFTER,
	DARBU_COUNT
};

enum _:e_rangai
{
	r_name[24],
	r_skin_m,
	r_skin_v
};

enum _:e_darbai
{
	dFondas,
	dPatirtis,
	dAktyvumas
};

new rangai[DARBAI][30][e_rangai];
new darbai[DARBAI][e_darbai];

enum _:e_dropped_weapons
{
	w_area,
	w_object,
	w_text,
	w_timer,
	w_weapon_id,
	w_weapon_flags
};

enum _:e_garage
{
	gModelis,
	gBukle,
	gBagazine,
	gSpalva1,
	gSpalva2,
	gDegalai,
	gSqlId
};

enum _:e_Board
{
	nbSkelbejoID,
	nbSkelbejas,
	nbPranesimas,
	nbLaikas
};

enum
{
	vPlayerFlags[MAX_PLAYERS],
	vDroppedWeapons[e_dropped_weapons],
	vArea_SlowDown,
	vArea_Vehicle,
	vMapIcon[MAX_PLAYERS],
	vGangWar[MAX_PLAYERS],
	vGangPeace[MAX_PLAYERS],
	vRepairList,
	vNoticeBoard[e_Board],
	vGarage[e_garage*MAX_PLAYERS] 	// pid*e_garage+element
};

#define getGarageIndex(%0,%1)  ((%0)*e_garage+(%1))

/*
			0		rangas

		enum		0	4	8	12
					1	5	9	13
					2	6	10	14
					3	7	11	15

			1		rangas

		enum		16	20	24 28
					17	21	25	29
					18	22	26	30
					19	23	27	31

	0*4*4+0*4+0 = 0	0*4*4+1*4+0 = 4
	0*4*4+0*4+1 = 1	0*4*4+1*4+1 = 5
	0*4*4+0*4+2 = 2	0*4*4+1*4+2 = 6
	0*4*4+0*4+3 = 3	0*4*4+1*4+3 = 7

	1*4*4+0*4+0 = 16	1*4*4+1*4+0 = 20
	1*4*4+0*4+1 = 17	1*4*4+1*4+1 = 21
	1*4*4+0*4+2 = 18	1*4*4+1*4+2 = 22
	1*4*4+0*4+3 = 19	1*4*4+1*4+3 = 23

*/

#define pInfo pDB

#define npc.%0(%1) FCNPC_%0(%1)		

#define flag_get(%0,%1)            ((%0) & (%1))   // Returns zero (false) if the flag isn't set.
#define flag_on(%0,%1)             ((%0) |= (%1))  // Turn on a flag.
#define flag_off(%0,%1)            ((%0) &= ~(%1)) // Turn off a flag.
#define flag_toggle(%0,%1)         ((%0) ^= (%1))

#define sendMsg(%0,%1,%2) SendClientMessage(%0,-1,#LIGHT"( "#DARK%1#LIGHT" ) "%2)
#define sendMsgToAll(%0) SendClientMessageToAll(-1,%0)
#define getPlayerArmour(%0) fget.Armour[%0]
#define soc(%0,%1) socket_sendto_remote_client(socket_server,pTemp[%0][socket],F("%i|",%1))
#define socf(%0,%1,%2,%3) socket_sendto_remote_client(socket_server,pTemp[%0][socket],F("%i "#%2"|",%1,%3))
#define createObject(%0,%1) socket_sendto_remote_client(socket_server,pTemp[%0][socket],F("%i %i %.2f %.2f %.2f %.2f  %.2f  %.2f|", OBJECT, %1))

#define getAllMembers(%0,%1) send_query(1, F("SELECT * FROM zaidejai WHERE gauja = %i", %0), false, using inline %1, "")

#define unfreezeAfter(%0,%1) SetTimerEx("tpct", %1, 0, "i", %0)
	/*
#define set.%0.%1=%2; SetPVarInt(%0,#%1,%2);
#define fset.%0.%1=%2; SetPVarFloat(%0,#%1,%2);
#define get(%0.%1) GetPVarInt(%0,#%1)
#define fget(%0.%1) GetPVarFloat(%0,#%1)
#define del.%0.%1; DeletePVar(%0,#%1);
#define sset.%0.%1=%2; SetPVarString(%0,#%1,%2);
#define sget(%0.%1) GetPVarString(%0,#%1, string_return[], sizeof);
*/
#define set.%0[%1]=%2; SetPVarInt(%1,#%0,%2);
#define fset.%0[%1]=%2; SetPVarFloat(%1,#%0,%2);
#define get.%0[%1] GetPVarInt(%1,#%0)
#define fget.%0[%1] GetPVarFloat(%1,#%0)
#define del.%0[%1] DeletePVar(%1,#%0)

#define vset.%0[%1]=%2; map_insert(%1,#%0,%2);
#define vget.%0[%1] map_get(%1,#%0)
#define vdel(%0) map_clear(%0)

#define gang[%0] pInfo[%0][gauja]

#define shop_spawn_prekes ITEM::alus, ITEM::geles, ITEM::maistas_duona, ITEM::cola, ITEM::pepsi, ITEM::sprite, ITEM::maistas_obuolys, ITEM::cap1..ITEM::cap3,ITEM::akiniai1..ITEM::akiniai2,ITEM::zemelapis
#define shop_baras_prekes ITEM::cola, ITEM::pepsi, ITEM::sprite, ITEM::viskis, ITEM::alus, ITEM::degtine
#define shop_gunshop_prekes ITEM::armour, ITEM::kastetas, ITEM::peilis, ITEM::ninemm, ITEM::shotgun, ITEM::gas, ITEM::kulkosp, ITEM::kulkoss, ITEM::kulkossm
#define shop_foodstore_prekes ITEM::maistas_eserys, ITEM::maistas_karpis, ITEM::maistas_lydeka, ITEM::maistas_karosas, ITEM::maistas_tunas, ITEM::maistas_lasisa, ITEM::maistas_pleksne, ITEM::maistas_menke, ITEM::maistas_obuolys, ITEM::maistas_duona, ITEM::maistas_ikrai
#define shop_clothes_prekes ITEM::b1..ITEM::b10, ITEM::cap1..ITEM::cap6, ITEM::akiniai1..ITEM::akiniai20, ITEM::beret1, ITEM::beret2

#define showDialog Dialog_ShowCallback

#define MENU_GPS    1
#define MENU_PMENU  2
#define MENU_BAG	3
#define MENU_CARSHOP_OLD 4
#define MENU_TRUNK 5

#define HEAD 1
#define BODY 0
#define ARM 3
#define LEG 2

#define FADE_IN 1
#define FADE_OUT 2
#define fade(%0,%1) soc(%0,F("%i",%1))
//#define lock(%0,%1) soc(%0,f("freeze %i",%1)),set.%0.locked=%1
//#define islocked(%0) get(%0.locked)

//justas007

#define kaina	0
#define svoris	1

#define kaina_TAXI 25

#define CAR_MECHANIKU 525
#define CAR_PD 598
#define CAR_MEDIKU 416
#define CAR_TAXI 438
#define CAR_GAISRINE 407
#define CAR_VALYTOJAI 574
#define CAR_FURA 514
#define CAR_KROVINIAMS 440

#define pinfo pDB[playerid]

#define getSpeed(%0,%1) floatround(floatsqroot(%0*%0+%1*%1)*100*1.7)

// functions
#define Callback::%0(%1) public %0(%1)
#define function::%0(%1) forward %0(%1); \
						public %0(%1)//stock %0(%1)				
#define func%0(%1) forward %0(%1); \
						public %0(%1)//stock %0(%1)
#define public::%0(%1) 	forward %0(%1); \
						public %0(%1)

#define KEY_R 262144
#define KEY_AIM (128)

#define RELEASED(%0) \
	(((newkeys & (%0)) != (%0)) && ((oldkeys & (%0)) == (%0)))
#define HOLDING(%0) \
	((newkeys & (%0)) == (%0))
#define PRESSED(%0) \
	(((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))

#define IsPlayerInWater(%0) ((GetPlayerAnimationIndex(%0) >= 1538 && GetPlayerAnimationIndex(%0) <= 1544) ? true : false)
#define SetPlayerHoldingObject(%1,%2,%3,%4,%5,%6,%7,%8,%9) SetPlayerAttachedObject(%1,SLOT_RIGHTHAND,%2,%3,%4,%5,%6,%7,%8,%9)
#define StopPlayerHoldingObject(%1) RemovePlayerAttachedObject(%1,SLOT_RIGHTHAND)
#define IsPlayerHoldingObject(%1) IsPlayerAttachedObjectSlotUsed(%1,SLOT_RIGHTHAND)
#define DurysOpen(%0) ApplyAnimation(%0,"PED","WALK_DOORPARTIAL",4.0,0,0,0,0,0)
	
#define SHOP_ROW 15.435
#define BAG_ROW	15.084
#define TRUNK_ROW 16.25

#define SLOT_HEAD 1
#define SLOT_RIGHTHAND 2
#define SLOT_LEFTHAND 3
#define SLOT_BODY 4
#define SLOT_BACK 5
#define SLOT_FACE 6

#define KROVINYS_MASINA 1
#define KROVINYS_PREKES 2

#define SKIN_NEWBIE 222
#define SKIN_PLAYER 0
#define SKIN_DARBO 1

#define RUBINAI_UZ_LT 25

#define applyAnimation ApplyAnimation

#define PreloadAnimLib(%1,%2)	ApplyAnimation(%1,%2,"null",0.0,0,0,0,0,0)

#define fuel(%0) TankFuel[(%0)-400]

#define getVehicle(%0) car[%0][car_id]

#define gaujosVadas(%0) (pInfo[%0][gauja] == pInfo[%0][DBID])

#define SetItemParam(%0,%1,%2) Bag[%0][talpa:%1][item_info1]=%2
#define GetItemParam(%0,%1) Bag[%0][talpa:%1][item_info1]
#define SetItemParam2(%0,%1,%2) Bag[%0][talpa:%1][item_info2]=%2
#define GetItemParam2(%0,%1) Bag[%0][talpa:%1][item_info2]

#define ToggleControll(%0,%1) socf(%0,TOGGLE_CONTROLL,"%i %i",%1)

#define pid playerid
#define p [playerid]
#define zinfo pBools[pid]
#define tinfo pTemp[pid]
#define MP MAX_PLAYERS
#define F(%0) (format(g_szSprintfBuffer, sizeof(g_szSprintfBuffer),%0), g_szSprintfBuffer)
#define f Sprintf
#define f2 sprintf2
#define ti strval(tmp)
#define tf floatstr(tmp)
#define used Used[pid]
#define baguse BagUse[pid]
#define trunkuse TrunkUse[pid]
#define bag Bag[pid]
#define ibag iBag[pid]
#define item.flag.%0(%1,%2) flag_%0(ItemInfo[%1][item_params],%2)

#define MAP_IP 0
#define MAP_MEDIKAI 1

#define SHOP_PRICE_DIFF 0.2

#define int floatround

#define save(%0,%1) strcat(gt,f(#%0",",%1))
#define updatePlayer(%0) PLAYER::Save(%0,1)

#define DEATH_STATE_NONE 0
#define DEATH_STATE_INACTIVE 1
#define DEATH_STATE_ACTIVE 2
#define DEATH_STATE_HOSPITAL 3

#define player_cam(%0,%1,%2) soc(%1,f())
#define player_bool(%0,%1,%2) flag_%0(pBools[%1],%2)
#define player_flag(%0,%1,%2) flag_%0(pFlags[%1],%2)
#define player_location(%0,%1,%2) flag_%0(pLocation[%1],%2)
#define player_bball(%0,%1,%2) flag_%0(bball[%1],%2)

#define vehicle_bool(%0,%1,%2) flag_%0(car[%1][car_flags],%2)
#define vehicle_error(%0,%1,%2) flag_%0(car[%1][gedimai], %2)

#define object_bool(%0,%1) flag_%0(obj_bool,%1)
#define object_flag(%0,%1,%2) flag_%0(objects[%1][obj_flags],%2)
#define gTag(%0) (%0)
#define gTree(%0) ((%0)+13)

#define object.%0.%1(%2) object_%0(%1,%2)

#if defined player
	#undef player
#define player.%0.%1(%2) player_%0(%1,%2)
#define vehicle.%0.%1(%2) vehicle_%0(%1,%2)
#define pflag pFlags[pid]
#define ptemp tinfo
#define pbool pBools[playerid]
#define slcslot baguse[selected_slot]
#define bagflags(%0) bag[%0][item_info]
#define trunkflags(%0,%1) trunk[%0][%1][item_info]
#define setInt SetPVarInt
#define getInt GetPVarInt
#define setFloat SetPVarFloat
#define getFloat GetPVarFloat
#define coords<%0> Float:_x%0, Float:_y%0, Float:_z%0

#define CON_VARFLAG_DEBUG		1
#define CON_VARFLAG_READONLY	2
#define CON_VARFLAG_RULE		4
