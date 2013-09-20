#include <a_samp>
#include <streamer>
#include <soc_defines>


stock Float:GDBP(Float:gX, Float:gY, Float:gZ, Float: PointX, Float: PointY, Float: PointZ) return floatsqroot(floatadd(floatadd(floatpower(floatsub(gX, PointX), 2.0), floatpower(floatsub(gY, PointY), 2.0)), floatpower(floatsub(gZ, PointZ), 2.0)));

stock updateMarkersForPlayer(pid)
{
	if(!vector_size(vGangWar+pid))
	{
		foreach(new i : Player)
		{
			SetPlayerMarkerForPlayer(pid, i, COLOR_SELECT);
		}

	} else {

		foreach(new i : Player)
		{
			if(i == pid) continue;
			switch(getWar(pid, i))
			{
				case -1:
				{
					SetPlayerMarkerForPlayer(pid, i, 0xFF0000FF);
					SetPlayerMarkerForPlayer(i, pid, 0xFF0000FF);
				}
				case 0:
				{
					SetPlayerMarkerForPlayer(pid, i, COLOR_SELECT);
					SetPlayerMarkerForPlayer(i, pid, COLOR_SELECT);
				}
				case 1:
				{
					SetPlayerMarkerForPlayer(i, pid, 0xFF0000FF);
					SetPlayerMarkerForPlayer(pid, i, COLOR_SELECT);
				}
				case 2:
				{
					SetPlayerMarkerForPlayer(i, pid, COLOR_SELECT);
					SetPlayerMarkerForPlayer(pid, i, 0xFF0000FF);
				}
			}
			switch(getPeace(pid, i))
			{
				case -1:
				{
					SetPlayerMarkerForPlayer(pid, i, 0x40BBFFFF);
					SetPlayerMarkerForPlayer(i, pid, 0x40BBFFFF);
				}
				case 0:
				{
					SetPlayerMarkerForPlayer(pid, i, COLOR_SELECT);
					SetPlayerMarkerForPlayer(i, pid, COLOR_SELECT);
				}
				case 1:
				{
					SetPlayerMarkerForPlayer(i, pid, 0x40BBFFFF);
					SetPlayerMarkerForPlayer(pid, i, COLOR_SELECT);
				}
				case 2:
				{
					SetPlayerMarkerForPlayer(i, pid, COLOR_SELECT);
					SetPlayerMarkerForPlayer(pid, i, 0x40BBFFFF);
				}
			}
			
		}
	}
}

stock getWar(id, id2)
{
	new get1 = vector_find(vGangWar+id, pInfo[id2][gauja]);
	new get2 = vector_find(vGangWar+id2, pInfo[id][gauja]);

	if(get1 != -1 && get2 == -1)
	{
		return 1; // id1 kovoja

	} else if (get1 == -1 && get2 != -1) {

		return 2; // id2 kovoja

	} else if (get1 == -1 && get2 == -1) {

		return 0; // nei viena nekovoja

	} else {

		return -1; // abi kovoja
	}
}

stock getPeace(id, id2)
{
	new get1 = vector_find(vGangPeace+id, pInfo[id2][gauja]);
	new get2 = vector_find(vGangPeace+id2, pInfo[id][gauja]);

	if(get1 != -1 && get2 == -1)
	{
		return 1; // id1 taikoje

	} else if (get1 == -1 && get2 != -1) {

		return 2; // id2 taikoje

	} else if (get1 == -1 && get2 == -1) {

		return 0; // nei viena nëra taikoje

	} else {

		return -1; // abi taikoje
	}
}

stock showGarageByID(pid, frame, a, id)
{
	//SendClientMessage(pid, -1, F("frame %i a %i id %i", frame, a, id));
	if(id > 3 && frame > 3 && a < 0)
	{
		PlayerTextDrawSetString	(pid, p_garage[ status_pavadinimas	][pid], GetVehicleNameByModel(vector_get(getGarageIndex(pid, gModelis), id)));
		PlayerTextDrawSetString	(pid, p_garage[ status_page			][pid], f("%i i %i", id+1, get.gCount[pid]));
		PlayerTextDrawShow(pid, p_garage[ status_pavadinimas				][pid]);
		PlayerTextDrawShow(pid, p_garage[ status_page 						][pid]);

		for(new i, k = id-3, j = get.gCount[pid]; k != j && i != 4; ++i, ++k)
		{
			new model = vector_get(getGarageIndex(pid, gModelis), k);
			PlayerTextDrawSetPreviewModel	(pid, p_garage[ status_image		+  5 * i ][pid], model);
			PlayerTextDrawSetPreviewVehCol(pid, p_garage[ status_image		+  5 * i ][pid], vector_get(getGarageIndex(pid, gSpalva1), k), vector_get(getGarageIndex(pid, gSpalva1), k));
			PlayerTextDrawTextSize			(pid, p_garage[ status_bukle		+  5 * i ][pid], vector_get_float(getGarageIndex(pid, gBukle), k) / 1000 * 80, 4);
			PlayerTextDrawTextSize			(pid, p_garage[ status_greitis	+  5 * i ][pid], float(VehicleInfo[model-400][vMaxSpeed]) / 250.0 * 80.0, 4);
			PlayerTextDrawTextSize			(pid, p_garage[ status_svoris		+  5 * i ][pid], float(vector_get(getGarageIndex(pid, gDegalai), k)) / float(fuel(model)) * 80.0, 4);
			PlayerTextDrawTextSize			(pid, p_garage[ status_bagazine	+  5 * i ][pid], float(vector_get(getGarageIndex(pid, gBagazine), k)) / float(VehicleInfo[model-400][vTrunkSize]) * 80.0, 4);
			
			PlayerTextDrawShow(pid, p_garage[ status_image 		 +  5 * i	][pid]);
			PlayerTextDrawShow(pid, p_garage[ status_bukle 		 +  5 * i	][pid]);
			PlayerTextDrawShow(pid, p_garage[ status_greitis 	 +  5 * i	][pid]);
			PlayerTextDrawShow(pid, p_garage[ status_svoris 	 +  5 * i	][pid]);
			PlayerTextDrawShow(pid, p_garage[ status_bagazine 	 +  5 * i	][pid]);
		}
	
	} else if(frame < 0 && a > 0) {

		PlayerTextDrawSetString	(pid, p_garage[ status_pavadinimas	][pid], GetVehicleNameByModel(vector_get(getGarageIndex(pid, gModelis), id)));
		PlayerTextDrawSetString	(pid, p_garage[ status_page			][pid], f("%i i %i", id+1, get.gCount[pid]));
		PlayerTextDrawShow(pid, p_garage[ status_pavadinimas				][pid]);
		PlayerTextDrawShow(pid, p_garage[ status_page						][pid]);

		for(new i, k = id, j = get.gCount[pid]; k != j && i != 4; ++i, ++k)
		{

			new model = vector_get(getGarageIndex(pid, gModelis), k);
			PlayerTextDrawSetPreviewModel	(pid, p_garage[ status_image		+  5 * i ][pid], model);
			PlayerTextDrawSetPreviewVehCol(pid, p_garage[ status_image		+  5 * i ][pid], vector_get(getGarageIndex(pid, gSpalva1), k), vector_get(getGarageIndex(pid, gSpalva1), k));
			PlayerTextDrawTextSize			(pid, p_garage[ status_bukle		+  5 * i ][pid], vector_get_float(getGarageIndex(pid, gBukle), k) / 1000 * 80, 4);
			PlayerTextDrawTextSize			(pid, p_garage[ status_greitis	+  5 * i ][pid], float(VehicleInfo[model-400][vMaxSpeed]) / 250.0 * 80.0, 4);
			PlayerTextDrawTextSize			(pid, p_garage[ status_svoris		+  5 * i ][pid], float(vector_get(getGarageIndex(pid, gDegalai), k)) / float(fuel(model)) * 80.0, 4);
			PlayerTextDrawTextSize			(pid, p_garage[ status_bagazine	+  5 * i ][pid], float(vector_get(getGarageIndex(pid, gBagazine), k)) / float(VehicleInfo[model-400][vTrunkSize]) * 80.0, 4);
			
			PlayerTextDrawShow(pid, p_garage[ status_image 		 +  5 * i	][pid]);
			PlayerTextDrawShow(pid, p_garage[ status_bukle 		 +  5 * i	][pid]);
			PlayerTextDrawShow(pid, p_garage[ status_greitis 	 +  5 * i	][pid]);
			PlayerTextDrawShow(pid, p_garage[ status_svoris 	 +  5 * i	][pid]);
			PlayerTextDrawShow(pid, p_garage[ status_bagazine 	 +  5 * i	][pid]);
		}

	} else {

		PlayerTextDrawSetString	(pid, p_garage[ status_pavadinimas	][pid], GetVehicleNameByModel(vector_get(getGarageIndex(pid, gModelis), id)));
		PlayerTextDrawSetString	(pid, p_garage[ status_page			][pid], f("%i i %i", id+1, get.gCount[pid]));

		TextDrawColor(g_garage[4 + 10 * (frame + a)], 0x444444FF);
		TextDrawColor(g_garage[5 + 10 * (frame + a)], 0xFFFFFF44);
		TextDrawColor(g_garage[6 + 10 * (frame + a)], 0xFFFFFF44);
		TextDrawColor(g_garage[7 + 10 * (frame + a)], 0xFFFFFF44);
		TextDrawColor(g_garage[8 + 10 * (frame + a)], 0xFFFFFF44);
		TextDrawColor(g_garage[9 + 10 * (frame + a)], 0x333333FF);
		TextDrawColor(g_garage[10 + 10 * (frame + a)], 0x333333FF);
		TextDrawColor(g_garage[11 + 10 * (frame + a)], 0x333333FF);
		TextDrawColor(g_garage[12 + 10 * (frame + a)], 0x333333FF);
		//PlayerTextDrawColor(playerid, p_garage[ status_image 	+  5 * (frame + a) ][pid], 0x555555FF);
		PlayerTextDrawColor(playerid, p_garage[ status_bukle 	+  5 * (frame + a) ][pid], 0x555555FF);
		PlayerTextDrawColor(playerid, p_garage[ status_greitis 	+  5 * (frame + a) ][pid], 0x555555FF);
		PlayerTextDrawColor(playerid, p_garage[ status_svoris 	+  5 * (frame + a) ][pid], 0x555555FF);
		PlayerTextDrawColor(playerid, p_garage[ status_bagazine +  5 * (frame + a) ][pid], 0x555555FF);

		TextDrawShowForPlayer(pid, g_garage[4 + 10 * (frame + a)]);
		TextDrawShowForPlayer(pid, g_garage[5 + 10 * (frame + a)]);
		TextDrawShowForPlayer(pid, g_garage[6 + 10 * (frame + a)]);
		TextDrawShowForPlayer(pid, g_garage[7 + 10 * (frame + a)]);
		TextDrawShowForPlayer(pid, g_garage[8 + 10 * (frame + a)]);
		TextDrawShowForPlayer(pid, g_garage[9 + 10 * (frame + a)]);
		TextDrawShowForPlayer(pid, g_garage[10 + 10 * (frame + a)]);
		TextDrawShowForPlayer(pid, g_garage[11 + 10 * (frame + a)]);
		TextDrawShowForPlayer(pid, g_garage[12 + 10 * (frame + a)]);

		PlayerTextDrawShow(pid, p_garage[ status_pavadinimas +  5 * (frame + a)	][pid]);
		PlayerTextDrawShow(pid, p_garage[ status_title 		 +  5 * (frame + a)	][pid]);
		PlayerTextDrawShow(pid, p_garage[ status_page 		 +  5 * (frame + a)	][pid]);
		//PlayerTextDrawShow(pid, p_garage[ status_image 		 +  5 * (frame + a)	][pid]);
		PlayerTextDrawShow(pid, p_garage[ status_bukle 		 +  5 * (frame + a)	][pid]);
		PlayerTextDrawShow(pid, p_garage[ status_greitis 	 +  5 * (frame + a)	][pid]);
		PlayerTextDrawShow(pid, p_garage[ status_svoris 	 +  5 * (frame + a)	][pid]);
		PlayerTextDrawShow(pid, p_garage[ status_bagazine 	 +  5 * (frame + a)	][pid]);

		/* _____________________________________________________________________________________ */

		TextDrawColor(g_garage[4 + 10 * frame], 0xFFFFFFFF);
		TextDrawColor(g_garage[5 + 10 * frame], -1);
		TextDrawColor(g_garage[6 + 10 * frame], -1);
		TextDrawColor(g_garage[7 + 10 * frame], -1);
		TextDrawColor(g_garage[8 + 10 * frame], -1);
		TextDrawColor(g_garage[9 + 10 * frame], 1145324799);
		TextDrawColor(g_garage[10 + 10 * frame], 1145324799);
		TextDrawColor(g_garage[11 + 10 * frame], 1145324799);
		TextDrawColor(g_garage[12 + 10 * frame], 1145324799);
		//PlayerTextDrawColor(playerid, p_garage[ status_image 	+  5 * frame ][pid], 0xFFFFFFFF);
		PlayerTextDrawColor(playerid, p_garage[ status_bukle 	+  5 * frame ][pid], -1061109505);
		PlayerTextDrawColor(playerid, p_garage[ status_greitis 	+  5 * frame ][pid], -1061109505);
		PlayerTextDrawColor(playerid, p_garage[ status_svoris 	+  5 * frame ][pid], -1061109505);
		PlayerTextDrawColor(playerid, p_garage[ status_bagazine +  5 * frame ][pid], -1061109505);

		TextDrawShowForPlayer(pid, g_garage[4 + 10 * frame]);
		TextDrawShowForPlayer(pid, g_garage[5 + 10 * frame]);
		TextDrawShowForPlayer(pid, g_garage[6 + 10 * frame]);
		TextDrawShowForPlayer(pid, g_garage[7 + 10 * frame]);
		TextDrawShowForPlayer(pid, g_garage[8 + 10 * frame]);
		TextDrawShowForPlayer(pid, g_garage[9 + 10 * frame]);
		TextDrawShowForPlayer(pid, g_garage[10 + 10 * frame]);
		TextDrawShowForPlayer(pid, g_garage[11 + 10 * frame]);
		TextDrawShowForPlayer(pid, g_garage[12 + 10 * frame]);

		PlayerTextDrawShow(pid, p_garage[ status_pavadinimas +  5 * frame ][pid]);
		PlayerTextDrawShow(pid, p_garage[ status_title 		 +  5 * frame ][pid]);
		PlayerTextDrawShow(pid, p_garage[ status_page 		 +  5 * frame ][pid]);
		//PlayerTextDrawShow(pid, p_garage[ status_image 		 +  5 * frame ][pid]);
		PlayerTextDrawShow(pid, p_garage[ status_bukle 		 +  5 * frame ][pid]);
		PlayerTextDrawShow(pid, p_garage[ status_greitis 	 +  5 * frame ][pid]);
		PlayerTextDrawShow(pid, p_garage[ status_svoris 	 +  5 * frame ][pid]);
		PlayerTextDrawShow(pid, p_garage[ status_bagazine 	 +  5 * frame ][pid]);
	}
}

stock hideGarage(pid)
{
	player.bool.off(pid, bIsInGarage);
	PLAYER::Freeze(pid, false, GARAZAS);
	for(new i; i != sizeof g_garage; ++i)
	{
		TextDrawHideForPlayer(pid, g_garage[i]);
	}
	for(new i; i != sizeof p_garage; ++i)
	{
		PlayerTextDrawHide(pid, p_garage[i][pid]);
	}
	del.gCount[pid];
	del.gCurrent[pid];
	del.currentFrame[pid];

	vector_clear(getGarageIndex(pid, gModelis));
	vector_clear(getGarageIndex(pid, gBukle));
	vector_clear(getGarageIndex(pid, gBagazine));
	vector_clear(getGarageIndex(pid, gSpalva1));
	vector_clear(getGarageIndex(pid, gSpalva2));
	vector_clear(getGarageIndex(pid, gDegalai));
	vector_clear(getGarageIndex(pid, gSqlId));
}

stock showGarage(pid)
{
	player.bool.on(pid, bIsInGarage);
	PLAYER::Freeze(pid, true, GARAZAS);

	new Result:r = sql_query(sqlHandle, F("SELECT * FROM masinos WHERE savininkas = %i", pinfo[DBID]), QUERY_CACHED);
	new const count = sql_num_rows(r);

	del.gCount[pid];
	del.gCurrent[pid];

	if( ! count )
	{
		TextDrawShowForPlayer(pid, g_garage[0]); // bg
		TextDrawShowForPlayer(pid, g_garage[1]); // mini bg
		TextDrawShowForPlayer(pid, g_garage[3]); // iseiti

		PlayerTextDrawShow(pid, p_garage[status_title][pid]);
		PlayerTextDrawShow(pid, p_garage[status_page][pid]);

		PlayerTextDrawSetString(pid, p_garage[status_title][pid], "Neturi jokio automobilio");
	
	} else {

		TextDrawShowForPlayer(pid, g_garage[0]); // bg
		TextDrawShowForPlayer(pid, g_garage[1]); // mini bg
		TextDrawShowForPlayer(pid, g_garage[2]); // rinktis
		TextDrawShowForPlayer(pid, g_garage[3]); // iseiti
		TextDrawShowForPlayer(pid, g_garage[status_line]); // iseiti

		vector_clear(getGarageIndex(pid, gModelis));
		vector_clear(getGarageIndex(pid, gBukle));
		vector_clear(getGarageIndex(pid, gBagazine));
		vector_clear(getGarageIndex(pid, gSpalva1));
		vector_clear(getGarageIndex(pid, gSpalva2));
		vector_clear(getGarageIndex(pid, gDegalai));
		vector_clear(getGarageIndex(pid, gSqlId));

		new model,Float:x,Float:y,Float:z,Float:rotate,fuel_,Float:crida,Float:hp,c1,c2,cflags,Panels,Doors,Lights,Tires,Status, Burning, Repair;

		new temp_trunk[MAX_ITEM][e_bag];
		new j;
		do
		{
			sql_get_field_assoc(r, "m_data", gt);
			sscanf(gt, "iffffigfiiiiiiiiii", model,x,y,z,rotate,fuel_,crida,hp,c1,c2,cflags,Panels, Doors, Lights, Tires,Status, Burning, Repair);

			SendClientMessage(pid, -1, f("status %i . cOkay %i", Status, cOkay));
			//SendClientMessage(pid, -1, F("%i %f %f %f %f %i %f %f %i %i %i %i %i %i %i ", model,x,y,z,rotate,fuel_,crida,hp,c1,c2,cflags,Panels, Doors, Lights, Tires));
			if(Status == cGarage)
			{
				set.gCount[pid] = get.gCount[pid] + 1;

				sql_get_field_assoc(r, "bagazine", gt);
				sscanf(gt, f("a<i>[%i]", MAX_ITEM * _:e_bag), temp_trunk[0]);

				new bagazine;
				for(new i; temp_trunk[i][item] && i != MAX_ITEM; ++i)
				{
					if(temp_trunk[i][item] && temp_trunk[i][kiekis])
					{
						bagazine += ItemInfo[ temp_trunk[i][item] ][item_svoris] * temp_trunk[i][kiekis];
					}
				}

				vector_push_back 			(getGarageIndex(pid, gModelis)	, model);
				vector_push_back_float	(getGarageIndex(pid, gBukle)		, hp);
				vector_push_back 			(getGarageIndex(pid, gBagazine)	, bagazine);
				vector_push_back			(getGarageIndex(pid, gDegalai)	, fuel_);
				vector_push_back 			(getGarageIndex(pid, gSpalva1)	, c1);
				vector_push_back 			(getGarageIndex(pid, gSpalva1)	, c2);
				vector_push_back			(getGarageIndex(pid, gSqlId)		, sql_get_field_assoc_int(r, "id"));
				printf("vehicle %i", sql_get_field_assoc_int(r, "id"));
				if(j < 4)
				{
					if j *then
					{
						TextDrawColor(g_garage[4 + 10 * j], 0x444444FF);

						TextDrawColor(g_garage[5 + 10 * j], 0xFFFFFF44);
						TextDrawColor(g_garage[6 + 10 * j], 0xFFFFFF44);
						TextDrawColor(g_garage[7 + 10 * j], 0xFFFFFF44);
						TextDrawColor(g_garage[8 + 10 * j], 0xFFFFFF44);

						TextDrawColor(g_garage[9 + 10 * j], 0x333333FF);
						TextDrawColor(g_garage[10 + 10 * j], 0x333333FF);
						TextDrawColor(g_garage[11 + 10 * j], 0x333333FF);
						TextDrawColor(g_garage[12 + 10 * j], 0x333333FF);
						//PlayerTextDrawColor(playerid, p_garage[ status_image 	+  5 * j ][pid], 0x555555FF);
						PlayerTextDrawColor(playerid, p_garage[ status_bukle 	+  5 * j ][pid], 0x555555FF);
						PlayerTextDrawColor(playerid, p_garage[ status_greitis 	+  5 * j ][pid], 0x555555FF);
						PlayerTextDrawColor(playerid, p_garage[ status_svoris 	+  5 * j ][pid], 0x555555FF);
						PlayerTextDrawColor(playerid, p_garage[ status_bagazine +  5 * j ][pid], 0x555555FF);
					
					} else {

						PlayerTextDrawSetString	(pid, p_garage[ status_pavadinimas	][pid], GetVehicleNameByModel(model));
						PlayerTextDrawSetString	(pid, p_garage[ status_title		][pid], "Pasirink savo masina");
						PlayerTextDrawSetString	(pid, p_garage[ status_page			][pid], f("1 i %i", count));
					
					}

					TextDrawShowForPlayer(pid, g_garage[4 + 10 * j]);
					TextDrawShowForPlayer(pid, g_garage[5 + 10 * j]);
					TextDrawShowForPlayer(pid, g_garage[6 + 10 * j]);
					TextDrawShowForPlayer(pid, g_garage[7 + 10 * j]);
					TextDrawShowForPlayer(pid, g_garage[8 + 10 * j]);
					TextDrawShowForPlayer(pid, g_garage[9 + 10 * j]);
					TextDrawShowForPlayer(pid, g_garage[10 + 10 * j]);
					TextDrawShowForPlayer(pid, g_garage[11 + 10 * j]);
					TextDrawShowForPlayer(pid, g_garage[12 + 10 * j]);
					//TextDrawShowForPlayer(pid, g_garage[13 + 10 * j]);
		//			|	|	|	|	|	|	|	|	|	|	|	|	|	|	|	|	|	|	|	|	|	|	|	|	|	|	|	|	|	|	|
					PlayerTextDrawSetPreviewVehCol(pid, p_garage[ status_image	+  5 * j ][pid], c1, c2);
					PlayerTextDrawSetPreviewModel	(pid, p_garage[ status_image	+  5 * j ][pid], model);
					PlayerTextDrawTextSize			(pid, p_garage[ status_bukle	+  5 * j ][pid], hp / 1000 * 80, 4);
					PlayerTextDrawTextSize			(pid, p_garage[ status_greitis	+  5 * j ][pid], float(VehicleInfo[model-400][vMaxSpeed]) / 250.0 * 80.0, 4);
					PlayerTextDrawTextSize			(pid, p_garage[ status_svoris	+  5 * j ][pid], float(fuel_) / float(fuel(model)) * 80.0, 4);
					PlayerTextDrawTextSize			(pid, p_garage[ status_bagazine	+  5 * j ][pid], float(bagazine) / float(VehicleInfo[model-400][vTrunkSize]) * 80.0, 4);

					PlayerTextDrawShow(pid, p_garage[ status_pavadinimas +  5 * j	][pid]);
					PlayerTextDrawShow(pid, p_garage[ status_title 		 +  5 * j	][pid]);
					PlayerTextDrawShow(pid, p_garage[ status_page 		 +  5 * j	][pid]);
					PlayerTextDrawShow(pid, p_garage[ status_image 		 +  5 * j	][pid]);
					PlayerTextDrawShow(pid, p_garage[ status_bukle 		 +  5 * j	][pid]);
					PlayerTextDrawShow(pid, p_garage[ status_greitis 	 +  5 * j	][pid]);
					PlayerTextDrawShow(pid, p_garage[ status_svoris 	 +  5 * j	][pid]);
					PlayerTextDrawShow(pid, p_garage[ status_bagazine 	 +  5 * j	][pid]);
				}
				++j;
			}
		}
		while(sql_next_row(r));
	}
}

stock isVehicleUpsideDown(veh)
{
    new
        Float:ZUP,
        Float:ZDOWN,
        Float:Unused,
        vehicleid = getVehicle(veh);

    PositionFromVehicleOffset(vehicleid,0.0,0.0,1.0,Unused,Unused,ZUP);
    PositionFromVehicleOffset(vehicleid,0.0,0.0,-1.0,Unused,Unused,ZDOWN);
    return ZUP < ZDOWN;
}

stock getShopVehicle(m, inc)
{
	new i = m + inc;

	if( i >= sizeof VehicleInfo )
		i = 0;
	else if(i <= -1)
		i = sizeof VehicleInfo - 1;
	
	tryagain:
	for(; i < sizeof VehicleInfo && i > -1; i += inc)
	{
		if(VehicleInfo[i][vPrice])
		{
			return i;
		}
	}
	i = 0;
	goto tryagain;
	return -1;
}

stock show_vehicleShop(pid)
{
	for(new i; i != sizeof g_carShop; ++i)
		TextDrawShowForPlayer(pid, g_carShop[i]);

	for(new i; i != sizeof p_carShop; ++i)
		PlayerTextDrawShow(pid, p_carShop[i][pid]);

	player.bool.on(pid, bIsInCarShop);

	SetPlayerVirtualWorld(pid, VW_vehicleShop + pid);

	//TogglePlayerControllable(pid, 0);

	killVehicle(get.vehShopID[pid]);
	new m = getShopVehicle(-1, 1);
	set.vehShopID[pid] = createVehicle(m + 400, 258.1422,-249.3557,1.3748, 264.3596);
	set.vehShopModel[pid] = m;
	putPlayerInVehicle(pid, get.vehShopID[pid], 1);
	PlayerTextDrawSetString(pid, p_carShop[2][pid], GetVehicleNameByModel(getShopVehicle(get.vehShopModel[pid], -1) + 400));
	PlayerTextDrawSetString(pid, p_carShop[1][pid], GetVehicleNameByModel(getShopVehicle(get.vehShopModel[pid], 1) + 400));
	PlayerTextDrawSetString(pid, p_carShop[0][pid], GetVehicleNameByModel(m + 400));
	PlayerTextDrawSetString(pid, p_carShop[3][pid], F("greitis: ~y~%i ~w~km/h", VehicleInfo[m][vMaxSpeed]));
	PlayerTextDrawSetString(pid, p_carShop[4][pid], F("svoris: ~y~%i ~w~kg", VehicleInfo[m][vWeight]));
	PlayerTextDrawSetString(pid, p_carShop[5][pid], F("vietos: ~y~%i", MaxSeats[m]));
	PlayerTextDrawSetString(pid, p_carShop[6][pid], F("bagazines talpa: ~y~%i ~w~kg", VehicleInfo[m][vTrunkSize]));
	PlayerTextDrawSetString(pid, p_carShop[7][pid], F("kaina: ~w~~g~%i ~w~lt", VehicleInfo[m][vPrice]));
	PlayerTextDrawSetString(pid, p_carShop[8][pid], F("rubinai: ~w~~r~%i     ~y~ALT", VehicleInfo[m][vPriceLT]*RUBINAI_UZ_LT));

	SetPlayerCameraPos(playerid, 264.939819,-252.252807,2.552004);
	SetPlayerCameraLookAt(playerid, 255.932861,-248.655487,0.116029);

	soc(pid, HIDE_RADAR);
	soc(pid, IS_IN_CARSHOP);
}

stock hide_vehicleShop(pid)
{
	for(new i; i != sizeof g_carShop; ++i)
		TextDrawHideForPlayer(pid, g_carShop[i]);

	for(new i; i != sizeof p_carShop; ++i)
		PlayerTextDrawHide(pid, p_carShop[i][pid]);

	killVehicle(get.vehShopID[pid]);

	SetPlayerVirtualWorld(pid, 0);

	del.vehShopModel[pid];
	del.vehShopID[pid];
	del.vehShopPause[pid];

	player.bool.off(pid, bIsInCarShop);

	SetPlayerDrunkLevel(pid, 0);

	//TogglePlayerControllable(pid, 1);

	soc(pid, IS_NOT_IN_CARSHOP);
	soc(pid, RESTORECAM);
	soc(pid, SHOW_RADAR);
}

stock updateMap(darboid)
{
	switch(darboid)
	{
		case MEDIKAS:
		{
			new coords<1>;
			foreach(new i : Player)
			{
				if(pInfo[i][darbas] == MEDIKAS)
				{
					new x = vector_size(vMapIcon+i);
					if(x)
					{
						for(new ii; ii < x; ++ii)
						{
							DestroyDynamicMapIcon(vector_get(vMapIcon+i, ii));
						}
						vector_clear(vMapIcon+i);
					}
					foreach(new j : Player)
					{
						if(pInfo[j][death_state] == DEATH_STATE_ACTIVE)
						{
							GetPlayerPos(j, coords<1>);
							
							x = CreateDynamicMapIcon(coords<1>, 19, 0, 0xFFFFFFFF, .playerid = i, .streamdistance = 1000.0);
							vector_push_back(vMapIcon+i, x);
						
						} else if(pInfo[j][death_state] == DEATH_STATE_INACTIVE) {

							GetPlayerPos(j, coords<1>);
							
							x = CreateDynamicMapIcon(coords<1>, 19, 0, 0xFFFFFFFF, .playerid = i, .streamdistance = 50.0);
							vector_push_back(vMapIcon+i, x);
						}
					}
				}
			}
		}
		case GAISRININKAS:
		{
			foreach(new j : Player)
			{
				if(pInfo[j][darbas] == GAISRININKAS)
				{
					new x = vector_size(vMapIcon+j);
					if(x)
					{
						for(new ii; ii < x; ++ii)
						{
							DestroyDynamicMapIcon(vector_get(vMapIcon+j, ii));
						}
						vector_clear(vMapIcon+j);
					}
					for(new i; i < MAX_FIRES; ++i)
					{
						if(fire[i][0] != -1)
						{
							new coords<1>;
							switch(fire[i][4])
							{
								case 0: GetPlayerPos(fire[i][3], coords<1>);
								case 1: getVehiclePos(fire[i][3], coords<1>);
								default: GetObjectPos(fire[i][0], coords<1>);
							}
							x = CreateDynamicMapIcon(coords<1>, 19, 0, 0xFFFFFFFF, .playerid = j, .streamdistance = 1000.0);
							vector_push_back(vMapIcon+j, x);
						}
					}
				}
			}
		}
	}
}

JOB::GetSkin(job, sex, index)
{
	switch(job)
	{
		case MECHANIKAS:
		{
			if(!sex)
			{
				new const array[] = {50};
				if(index >= sizeof array)
				{
					return 0;
				
				} else {

					return array[index];
				}

			} else {

				new const array[] = {69};
				if(index >= sizeof array)
				{
					return 0;
				
				} else {

					return array[index];
				}
			}
		}
		case PD:
		{
			if(!sex)
			{
				new const array[] = {265,266,267,280,281,282,283,284,285,286,287,288};
				if(index >= sizeof array)
				{
					return 0;
				
				} else {

					return array[index];
				}

			} else {

				new const array[] = {150,93,246};
				if(index >= sizeof array)
				{
					return 0;
				
				} else {

					return array[index];
				}
			}
		}
		case MEDIKAS:
		{
			if(!sex)
			{
				new const array[] = {274,275,276};
				if(index >= sizeof array)
				{
					return 0;
				
				} else {

					return array[index];
				}

			} else {

				new const array[] = {91,148,216};
				if(index >= sizeof array)
				{
					return 0;
				
				} else {

					return array[index];
				}
			}
		}
		case TAXI:
		{
			if(!sex)
			{
				new const array[] = {258};
				if(index >= sizeof array)
				{
					return 0;
				
				} else {

					return array[index];
				}

			} else {

				new const array[] = {93};
				if(index >= sizeof array)
				{
					return 0;
				
				} else {

					return array[index];
				}
			}
		}
		case GAISRININKAS:
		{
			if(!sex)
			{
				new const array[] = {277,278,279};
				if(index >= sizeof array)
				{
					return 0;
				
				} else {

					return array[index];
				}

			} else {

				new const array[] = {277,278,279};
				if(index >= sizeof array)
				{
					return 0;
				
				} else {

					return array[index];
				}
			}
		}
		case VALYTOJAS:
		{
			if(!sex)
			{
				new const array[] = {42};
				if(index >= sizeof array)
				{
					return 0;
				
				} else {

					return array[index];
				}

			} else {

				new const array[] = {298};
				if(index >= sizeof array)
				{
					return 0;
				
				} else {

					return array[index];
				}
			}
		}
		case FURISTAS:
		{
			if(!sex)
			{
				new const array[] = {44, 112};
				if(index >= sizeof array)
				{
					return 0;
				
				} else {

					return array[index];
				}

			} else {

				new const array[] = {131};
				if(index >= sizeof array)
				{
					return 0;
				
				} else {

					return array[index];
				}
			}
		}
	}
	return 0;
}

stock Float:getangle(Float:v1[3], Float:v2[3])
{
	return 180.0 * acos( (v1[0] * v2[0] + v1[1] * v2[1]) / (floatsqroot(v1[0]*v1[0]+v1[1]*v1[1]) * floatsqroot(v2[0]*v2[0]+v2[1]*v2[1])) ) / 3.1415;
}


stock applyChecks(pid, type)
{
	switch(type)
	{
		case cClickOnPlayer:
		{
			if(PLAYER::IsFreezed(pid, GULI_LIGONINEI)) 	return 1;
			if(PLAYER::IsFreezed(pid, MIRSTA)) 			return 1;
			if(PLAYER::IsFreezed(pid, SURAKINTAS)) 		return 1;
			if(PLAYER::IsFreezed(pid, KERTA_MEDI)) 	PLAYER::Freeze(pid, false, KERTA_MEDI);
			if(PLAYER::IsFreezed(pid, TVARKO)) 		PLAYER::Freeze(pid, false, TVARKO);
			if(PLAYER::IsFreezed(pid, ZVEJOJA)) 		PLAYER::Freeze(pid, false, ZVEJOJA);
			if(PLAYER::IsFreezed(pid, TVARKO_GARAZE))PLAYER::Freeze(pid, false, TVARKO_GARAZE);
		}
		case cBag:
		{
			if(PLAYER::IsFreezed(pid, MIRSTA))
				return inmind(pid, "Kaip man viskà skauda, negaliu nei kuprinës atsidaryti..");

			if(PLAYER::IsFreezed(pid, GULI_LIGONINEI))
				return inmind(pid, "Jauèiuosi toks nusilpæs, negaliu net kuprinës pakelti..");

			if(PLAYER::IsFreezed(pid, SURAKINTAS))
				return inmind(pid, "Surakintom rankom neina pasiekti kuprinës..");

			if(player.bool.get(pid, bTrunkOpen)) hide_trunk(baguse[trunk_id], pid);
			if(player.bool.get(pid, bShopOpen)) hide_shop(pid);
		}
		case cTrunk:
		{
			if(PLAYER::IsFreezed(pid, MIRSTA))
			{
				return inmind(pid, "Kaip man viskà skauda, negaliu nei bagaþinës atsidaryti..");
			}
			if(PLAYER::IsFreezed(pid, GULI_LIGONINEI))
			{
				return inmind(pid, "Jauèiuosi toks nusilpæs, negaliu net bagaþinës atidaryti..");
			}
			if(PLAYER::IsFreezed(pid, SURAKINTAS))
			{
				return inmind(pid, "Surakintom rankom neina atidaryti bagaþinës..");
			}
			if(player.bool.get(pid, bBagOpen)) hide_bag(pid);
			if(player.bool.get(pid, bShopOpen)) hide_shop(pid);
		}
		case cShop:
		{
			if(PLAYER::IsFreezed(pid, MIRSTA))
			{
				return inmind(pid, "Jauèiuosi per silpnas kalbëti..");
			}
			if(PLAYER::IsFreezed(pid, GULI_LIGONINEI))
			{
				return inmind(pid, "Jauèiuosi per silpnas kalbëti..");
			}
			if(player.bool.get(pid, bBagOpen)) hide_bag(pid);
			if(player.bool.get(pid, bTrunkOpen)) hide_trunk(baguse[trunk_id], pid);
		}
		case cUseItem:
		{
			if(PLAYER::IsFreezed(pid, GULI_LIGONINEI)) 	return 1;
			if(PLAYER::IsFreezed(pid, MIRSTA)) 			return 1;
			if(PLAYER::IsFreezed(pid, SURAKINTAS)) 		return 1;
			if(PLAYER::IsFreezed(pid, KERTA_MEDI)) 	PLAYER::Freeze(pid, false, KERTA_MEDI);
			if(PLAYER::IsFreezed(pid, TVARKO)) 		PLAYER::Freeze(pid, false, TVARKO);
			if(PLAYER::IsFreezed(pid, ZVEJOJA)) 		PLAYER::Freeze(pid, false, ZVEJOJA);
			if(PLAYER::IsFreezed(pid, TVARKO_GARAZE))PLAYER::Freeze(pid, false, TVARKO_GARAZE);
		}
		case cWoodcutting:
		{
			if(PLAYER::IsFreezed(pid, MIRSTA))
				return inmind(pid, "Kaip man viskà skauda, apie medþius tik pasvajoti..");

			if(PLAYER::IsFreezed(pid, GULI_LIGONINEI))
				return inmind(pid, "Jauèiuosi toks nusilpæs, nesugebëèiau net pjûklo pakelti..");

			if(PLAYER::IsFreezed(pid, SURAKINTAS))
				return inmind(pid, "Surakintom rankom medþio nenukirsiu..");

			if(PLAYER::IsFreezed(pid, DEGALAI)) 		PLAYER::Freeze(pid, false, DEGALAI);
			if(PLAYER::IsFreezed(pid, TVARKO)) 		PLAYER::Freeze(pid, false, TVARKO);
			if(PLAYER::IsFreezed(pid, ZVEJOJA)) 		PLAYER::Freeze(pid, false, ZVEJOJA);
			if(PLAYER::IsFreezed(pid, TVARKO_GARAZE))PLAYER::Freeze(pid, false, TVARKO_GARAZE);
		}
		case cTvarko:
		{
			if(PLAYER::IsFreezed(pid, MIRSTA))
				return inmind(pid, "Kaip man viskà skauda, maðinos sutvarkyti nepavyks..");

			if(PLAYER::IsFreezed(pid, GULI_LIGONINEI))
				return inmind(pid, "Jauèiuosi toks nusilpæs, nesugebëèiau net árankiø pakelti..");

			if(PLAYER::IsFreezed(pid, SURAKINTAS))
				return inmind(pid, "Surakintom rankom maðinos nesutvarkysiu..");

			if(PLAYER::IsFreezed(pid, DEGALAI)) 		PLAYER::Freeze(pid, false, DEGALAI);
			if(PLAYER::IsFreezed(pid, KERTA_MEDI)) 	PLAYER::Freeze(pid, false, KERTA_MEDI);
			if(PLAYER::IsFreezed(pid, ZVEJOJA)) 		PLAYER::Freeze(pid, false, ZVEJOJA);
			if(PLAYER::IsFreezed(pid, TVARKO_GARAZE))PLAYER::Freeze(pid, false, TVARKO_GARAZE);
		}
		case cFishing:
		{
			if(PLAYER::IsFreezed(pid, MIRSTA))
				return inmind(pid, "Kaip man viskà skauda, paþvejoti nepavyks..");

			if(PLAYER::IsFreezed(pid, GULI_LIGONINEI))
				return inmind(pid, "Jauèiuosi toks nusilpæs, nesugebëèiau net meðkerës pakelti..");

			if(PLAYER::IsFreezed(pid, SURAKINTAS))
				return inmind(pid, "Surakintom rankom meðkerës neiðlaikysiu..");

			if(PLAYER::IsFreezed(pid, DEGALAI)) 		PLAYER::Freeze(pid, false, DEGALAI);
			if(PLAYER::IsFreezed(pid, KERTA_MEDI)) 	PLAYER::Freeze(pid, false, KERTA_MEDI);
			if(PLAYER::IsFreezed(pid, TVARKO)) 		PLAYER::Freeze(pid, false, TVARKO);
			if(PLAYER::IsFreezed(pid, TVARKO_GARAZE))PLAYER::Freeze(pid, false, TVARKO_GARAZE);
		}
		case cFuel:
		{
			if(PLAYER::IsFreezed(pid, MIRSTA))
				return inmind(pid, "Kaip man viskà skauda, degalø ásipilti nepavyks..");

			if(PLAYER::IsFreezed(pid, GULI_LIGONINEI))
				return inmind(pid, "Jauèiuosi toks nusilpæs, nesugebëèiau net ðlangos iðlaikyti..");

			if(PLAYER::IsFreezed(pid, SURAKINTAS))
				return inmind(pid, "Surakintom rankom degalø neásipilsiu..");

			if(PLAYER::IsFreezed(pid, ZVEJOJA)) 		PLAYER::Freeze(pid, false, ZVEJOJA);
			if(PLAYER::IsFreezed(pid, KERTA_MEDI)) 	PLAYER::Freeze(pid, false, KERTA_MEDI);
			if(PLAYER::IsFreezed(pid, TVARKO)) 		PLAYER::Freeze(pid, false, TVARKO);
			if(PLAYER::IsFreezed(pid, TVARKO_GARAZE))PLAYER::Freeze(pid, false, TVARKO_GARAZE);
		}
		case cCritical:
		{
			if(PLAYER::IsFreezed(pid, TVARKO))			PLAYER::Freeze(pid, false, TVARKO);
			if(PLAYER::IsFreezed(pid, KERTA_MEDI))	PLAYER::Freeze(pid, false, KERTA_MEDI);
			if(PLAYER::IsFreezed(pid, ZVEJOJA))		PLAYER::Freeze(pid, false, ZVEJOJA);
			if(PLAYER::IsFreezed(pid, DEGALAI))		PLAYER::Freeze(pid, false, DEGALAI);
			if(PLAYER::IsFreezed(pid, TVARKO_GARAZE))PLAYER::Freeze(pid, false, TVARKO_GARAZE);
		}
		case cTvarkoGaraze:
		{
			if(PLAYER::IsFreezed(pid, MIRSTA))
				return inmind(pid, "Kaip man viskà skauda, maðinos sutvarkyti nepavyks..");

			if(PLAYER::IsFreezed(pid, GULI_LIGONINEI))
				return inmind(pid, "Jauèiuosi toks nusilpæs, nesugebëèiau net árankiø pakelti..");

			if(PLAYER::IsFreezed(pid, SURAKINTAS))
				return inmind(pid, "Surakintom rankom maðinos nesutvarkysiu..");

			if(PLAYER::IsFreezed(pid, DEGALAI)) 		PLAYER::Freeze(pid, false, DEGALAI);
			if(PLAYER::IsFreezed(pid, KERTA_MEDI)) 	PLAYER::Freeze(pid, false, KERTA_MEDI);
			if(PLAYER::IsFreezed(pid, ZVEJOJA)) 		PLAYER::Freeze(pid, false, ZVEJOJA);
			if(PLAYER::IsFreezed(pid, TVARKO))			PLAYER::Freeze(pid, false, TVARKO);
		}
	}
	return 0;
}

stock updateVehicleHealth(id)
{
	new Float:hp;
	getVehicleHealth(id, hp);
	if(vehicle.bool.get(id, fIsOnFire) && (car[id][car_status] != cCrashed || !car[id][burning_started]) )
	{
		new coords<1>;
		getVehiclePos(id, coords<1>);
		startFire(coords<1>, 1, id);
		car[id][burning_started] = gettime();
		car[id][car_status] = cCrashed;
		updateMap(GAISRININKAS);
		return 1;
	}
	if(hp <= 250)
	{
		if(isVehicleUpsideDown(id))
			setVehicleHealth(id, 400);
		else
			setVehicleHealth(id, 300);
		if( ! vehicle.bool.get(id, fIsOnFire) || !car[id][car_timer_damage])
		{
			new coords<1>;
			getVehiclePos(id, coords<1>);
			startFire(coords<1>, 1, id);
			car[id][burning_started] = gettime();
			car[id][car_status] = cCrashed;
			updateMap(GAISRININKAS);
		}
		return 1;
	}
	return 0;
}

stock GetWeaponModel(weaponid)
{
    new model;

    switch(weaponid)
    {
        case 1: model=331; case 2: model=333; case 3: model=334;
        case 4: model=335; case 5: model=336; case 6: model=337;
        case 7: model=338; case 8: model=339; case 9: model=341;
        case 10: model=321; case 11: model=322; case 12: model=323;
        case 13: model=324; case 14: model=325; case 15: model=326;
        case 16: model=342; case 17: model=343; case 18: model=344;
        case 22: model=346; case 23: model=347; case 24: model=348;
        case 25: model=349; case 26: model=350; case 27: model=351;
        case 28: model=352; case 29: model=353; case 30: model=355;
        case 31: model=356; case 32: model=372; case 33: model=357;
        case 34: model=358; case 35: model=359; case 36: model=360;
        case 37: model=361; case 38: model=362; case 39: model=363;
        case 41: model=365; case 42: model=366; case 46: model=371;
    }
    
    return model;
}

#define vehicleOffset 100
#define head(%0,%1) format(%0,sizeof %0,C_SOC%1), strcat(%0,"\n ")
#define newrow(%0,%1) strcat(%0, f("\n\t"C_DOT" "C_SOC" "%1))
#define newline(%0) strcat(%0, "\n ")
#define checkrow(%0) (strfind(%0) != -1)

stock getRangName(pid)
{
	//vector_get_arr(vRank+pinfo[darbas]+pinfo[darbas][rangas], 0, rname, 24);
	/*
	switch(pinfo[darbas])
	{
		case PD:
		{
			switch(pinfo[darbas][rangas])
			{
				case 0: format(rname, 24, "Jaunesnysis policininkas");
				case 1: format(rname, 24, "Policininkas");
				case 2: format(rname, 24, "Vyresnysis policininkas");
				case 3: format(rname, 24, "Virðila");
				case 4: format(rname, 24, "Inspektorius");
				case 5: format(rname, 24, "Vyresnysis inspektorius");
				case 6: format(rname, 24, "Komisaro inspektorius");
				case 7: format(rname, 24, "Komisaras");
				case 8: format(rname, 24, "Vyresnysis komisaras");
				case 9: format(rname, 24, "Vyriausiasis komisaras");
				case 10: format(rname, 24, "Generalinis komisaras");
				case 11: format(rname, 24, "Aras");
				default: format(rname, 24, "Neþinomas");
			}
		}
		case MEDIKAS:
		{
			switch(pinfo[darbas][rangas])
			{
				case 0: format(rname, 24, "");
				default: format(rname, 24, "Neþinomas");
			}
		}
		default: format(rname, 24, "Neþinomas");
	}*/
	return rangai[pinfo[darbas]][pinfo[darbas][rangas]][r_name];
}

stock cuff_RemovePlayerAttachedObject(playerid, index)
{
	if(GetPVarInt(playerid, "cuffs_object_index") == index+1) return 0;
	return RemovePlayerAttachedObject(playerid, index);
}
#if defined _ALS_RemovePlayerAttachedObject
	#undef RemovePlayerAttachedObject
#else
	#define _ALS_RemovePlayerAttachedObject
#endif
#define RemovePlayerAttachedObject cuff_RemovePlayerAttachedObject


stock encode_tires(tire1, tire2, tire3, tire4) return tire1 | (tire2 << 1) | (tire3 << 2) | (tire4 << 3);
stock encode_panels(flp, frp, rlp, rrp, windshield, front_bumper, rear_bumper)
{
    return flp | (frp << 4) | (rlp << 8) | (rrp << 12) | (windshield << 16) | (front_bumper << 20) | (rear_bumper << 24);
}
stock encode_doors(bonnet, boot, driver_door, passenger_door, behind_driver_door, behind_passenger_door)
{
    #pragma unused behind_driver_door
    #pragma unused behind_passenger_door
    return bonnet | (boot << 8) | (driver_door << 16) | (passenger_door << 24);
}
stock encode_lights(light1, light2, light3, light4)
{
    return light1 | (light2 << 1) | (light3 << 2) | (light4 << 3);
}

stock char_replace(search, replace, source[])
{
	for(new i, j = strlen(source); i != j; ++i)
	{
		if(source[i] == search)
		{
			source[i] = replace;
		}
	}
}

func createEntry(Float:x, Float:y, Float:z, Float:size, type)
{
	areaType[CreateDynamicSphere(x,y,z,	size)] = type;
	Create3DTextLabel("ENTER", COLOR_SOC, x,y,z, 20, 0, 0);
}

stock IsPlayerOnTheGround(playerid)
{
    new Float:vl[3];
    GetPlayerVelocity(playerid, vl[0], vl[1], vl[2]);
    return floatabs(vl[2]) > 0.0 ? (false) : (true);
}

stock checkName(name[])
{
	if(isnull(name)) return 0;
    if(name[0] == '_' || name[0] == ' ') strdel(name, 0, 0);

    new lenght = strlen(name);
    for(new i; i != lenght; ++i)
    {
    	if( 'a' <= name[i] <= 'z' || 'A' <= name[i] <= 'Z' || name[i] == '_' || name[i] == ' '){}
    	else strdel(name, i, i);
    }


    new underline;
    for(new i = 0; i < lenght ; i++)
    {
		if(underline) strdel(name, i, i);
		if(name[i] == '_' || name[i] == ' ') underline ++;
    }
    if( ! underline) return 0;
    if(underline != 1) return 0;


    char_replace(' ', '_', name);


    name[0] = toupper(name[0]);
    for(new x = 1; x < lenght; x++)
    {
        if(name[x] == '_') name[x+1] = toupper(name[x+1]);
        else if(name[x-1] != '_') name[x] = tolower(name[x]);
    }
    return 1;
}


stock bool:isVehicleInWater(id)
{
	new vehicleid = getVehicle(id);
	new Float:x,Float:y,Float:pz;
	GetVehiclePos(vehicleid, x, y, pz);
	if(IsVehicleInArea(vehicleid, 381.7009, 782.9656, 710.9611, 965.2859)) return false;
	if(
		(IsVehicleInArea(vehicleid, 2032.1371, 1841.2656, 1703.1653, 1467.1099) && pz <= 9.0484)
		|| (IsVehicleInArea(vehicleid, 2109.0725, 2065.8232, 1962.5355, 10.8547) && pz <= 10.0792)
		|| (IsVehicleInArea(vehicleid, -492.5810, -1424.7122, 2836.8284, 2001.8235) && pz <= 41.06)
		|| (IsVehicleInArea(vehicleid, -2675.1492, -2762.1792, -413.3973, -514.3894) && pz <= 4.24)
		|| (IsVehicleInArea(vehicleid, -453.9256, -825.7167, -1869.9600, -2072.8215) && pz <= 5.72)
		|| (IsVehicleInArea(vehicleid, 1281.0251, 1202.2368, -2346.7451, -2414.4492) && pz <= 9.3145)
		|| (IsVehicleInArea(vehicleid, 2012.6154, 1928.9028, -1178.6207, -1221.4043) && pz <= 18.45)
		|| (IsVehicleInArea(vehicleid, 2326.4858, 2295.7471, -1400.2797, -1431.1266) && pz <= 22.615)
		|| (IsVehicleInArea(vehicleid, 2550.0454, 2513.7588, 1583.3751, 1553.0753) && pz <= 9.4171)
		|| (IsVehicleInArea(vehicleid, 1102.3634, 1087.3705, -663.1653, -682.5446) && pz <= 112.45)
		|| (IsVehicleInArea(vehicleid, 1287.7906, 1270.4369, -801.3882, -810.0527) && pz <= 87.123)
		|| (pz < 0.8)
		)
	{
		return true;
	}
	return false;
}

stock IsVehicleInArea(vehicleid, Float:minx, Float:maxx, Float:miny, Float:maxy)
{
	new Float:x, Float:y, Float:z;
	GetVehiclePos(vehicleid, x, y, z);
	if(x > minx && x < maxx && y > miny && y < maxy) return 1;
	return 0;
}

stock PreloadAnims(pid)
{
	PreloadAnimLib(pid, "AIRPORT");
	PreloadAnimLib(pid, "ATTRACTORS");
	PreloadAnimLib(pid, "BAR");
	PreloadAnimLib(pid, "BASEBALL");
	PreloadAnimLib(pid, "BD_FIRE");
	PreloadAnimLib(pid, "BEACH");
	PreloadAnimLib(pid, "BENCHPRESS");
	PreloadAnimLib(pid, "BF_INJECTION");
	PreloadAnimLib(pid, "BIKED");
	PreloadAnimLib(pid, "BIKEH");
	PreloadAnimLib(pid, "BIKELEAP");
	PreloadAnimLib(pid, "BIKES");
	PreloadAnimLib(pid, "BIKEV");
	PreloadAnimLib(pid, "BIKE_DBZ");
	PreloadAnimLib(pid, "BMX");
	PreloadAnimLib(pid, "BOMBER");
	PreloadAnimLib(pid, "BOX");
	PreloadAnimLib(pid, "BSKTBALL");
	PreloadAnimLib(pid, "BUDDY");
	PreloadAnimLib(pid, "BUS");
	PreloadAnimLib(pid, "CAMERA");
	PreloadAnimLib(pid, "CAR");
	PreloadAnimLib(pid, "CARRY");
	PreloadAnimLib(pid, "CAR_CHAT");
	PreloadAnimLib(pid, "CASINO");
	PreloadAnimLib(pid, "CHAINSAW");
	PreloadAnimLib(pid, "CHOPPA");
	PreloadAnimLib(pid, "CLOTHES");
	PreloadAnimLib(pid, "COACH");
	PreloadAnimLib(pid, "COLT45");
	PreloadAnimLib(pid, "COP_AMBIENT");
	PreloadAnimLib(pid, "COP_DVBYZ");
	PreloadAnimLib(pid, "CRACK");
	PreloadAnimLib(pid, "CRIB");
	PreloadAnimLib(pid, "DAM_JUMP");
	PreloadAnimLib(pid, "DANCING");
	PreloadAnimLib(pid, "DEALER");
	PreloadAnimLib(pid, "DILDO");
	PreloadAnimLib(pid, "DODGE");
	PreloadAnimLib(pid, "DOZER");
	PreloadAnimLib(pid, "DRIVEBYS");
	PreloadAnimLib(pid, "FAT");
	PreloadAnimLib(pid, "FIGHT_B");
	PreloadAnimLib(pid, "FIGHT_C");
	PreloadAnimLib(pid, "FIGHT_D");
	PreloadAnimLib(pid, "FIGHT_E");
	PreloadAnimLib(pid, "FINALE");
	PreloadAnimLib(pid, "FINALE2");
	PreloadAnimLib(pid, "FLAME");
	PreloadAnimLib(pid, "FLOWERS");
	PreloadAnimLib(pid, "FOOD");
	PreloadAnimLib(pid, "FREEWEIGHTS");
	PreloadAnimLib(pid, "GANGS");
	PreloadAnimLib(pid, "GHANDS");
	PreloadAnimLib(pid, "GHETTO_DB");
	PreloadAnimLib(pid, "GOGGLES");
	PreloadAnimLib(pid, "GRAFFITI");
	PreloadAnimLib(pid, "GRAVEYARD");
	PreloadAnimLib(pid, "GRENADE");
	PreloadAnimLib(pid, "GYMNASIUM");
	PreloadAnimLib(pid, "HAIRCUTS");
	PreloadAnimLib(pid, "HEIST9");
	PreloadAnimLib(pid, "INT_HOUSE");
	PreloadAnimLib(pid, "INT_OFFICE");
	PreloadAnimLib(pid, "INT_SHOP");
	PreloadAnimLib(pid, "JST_BUISNESS");
	PreloadAnimLib(pid, "KART");
	PreloadAnimLib(pid, "KISSING");
	PreloadAnimLib(pid, "KNIFE");
	PreloadAnimLib(pid, "LAPDAN1");
	PreloadAnimLib(pid, "LAPDAN2");
	PreloadAnimLib(pid, "LAPDAN3");
	PreloadAnimLib(pid, "LOWRIDER");
	PreloadAnimLib(pid, "MD_CHASE");
	PreloadAnimLib(pid, "MD_END");
	PreloadAnimLib(pid, "MEDIC");
	PreloadAnimLib(pid, "MISC");
	PreloadAnimLib(pid, "MTB");
	PreloadAnimLib(pid, "MUSCULAR");
	PreloadAnimLib(pid, "NEVADA");
	PreloadAnimLib(pid, "ON_LOOKERS");
	PreloadAnimLib(pid, "OTB");
	PreloadAnimLib(pid, "PARACHUTE");
	PreloadAnimLib(pid, "PARK");
	PreloadAnimLib(pid, "PAULNMAC");
	PreloadAnimLib(pid, "PED");
	PreloadAnimLib(pid, "PLAYER_DVBYS");
	PreloadAnimLib(pid, "PLAYIDLES");
	PreloadAnimLib(pid, "POLICE");
	PreloadAnimLib(pid, "POOL");
	PreloadAnimLib(pid, "POOR");
	PreloadAnimLib(pid, "PYTHON");
	PreloadAnimLib(pid, "QUAD");
	PreloadAnimLib(pid, "QUAD_DBZ");
	PreloadAnimLib(pid, "RAPPING");
	PreloadAnimLib(pid, "RIFLE");
	PreloadAnimLib(pid, "RIOT");
	PreloadAnimLib(pid, "ROB_BANK");
	PreloadAnimLib(pid, "ROCKET");
	PreloadAnimLib(pid, "RUSTLER");
	PreloadAnimLib(pid, "RYDER");
	PreloadAnimLib(pid, "SCRATCHING");
	PreloadAnimLib(pid, "SHAMAL");
	PreloadAnimLib(pid, "SHOP");
	PreloadAnimLib(pid, "SHOTGUN");
	PreloadAnimLib(pid, "SILENCED");
	PreloadAnimLib(pid, "SKATE");
	PreloadAnimLib(pid, "SMOKING");
	PreloadAnimLib(pid, "SNIPER");
	PreloadAnimLib(pid, "SPRAYCAN");
	PreloadAnimLib(pid, "STRIP");
	PreloadAnimLib(pid, "SUNBATHE");
	PreloadAnimLib(pid, "SWAT");
	PreloadAnimLib(pid, "SWEET");
	PreloadAnimLib(pid, "SWIM");
	PreloadAnimLib(pid, "SWORD");
	PreloadAnimLib(pid, "TANK");
	PreloadAnimLib(pid, "TATTOOS");
	PreloadAnimLib(pid, "TEC");
	PreloadAnimLib(pid, "TRAIN");
	PreloadAnimLib(pid, "TRUCK");
	PreloadAnimLib(pid, "UZI");
	PreloadAnimLib(pid, "VAN");
	PreloadAnimLib(pid, "VENDING");
	PreloadAnimLib(pid, "VORTEX");
	PreloadAnimLib(pid, "WAYFARER");
	PreloadAnimLib(pid, "WEAPONS");
	PreloadAnimLib(pid, "WUZI");
	PreloadAnimLib(pid, "WOP");
	PreloadAnimLib(pid, "GFUNK");
	PreloadAnimLib(pid, "RUNNINGMAN");
}

stock spect(pid, l = 2, id = -1)
{
	if( !l )
	{
		TogglePlayerSpectating(playerid, false);
	}
	if(l == 1)
	{
		if(!get.spec[pid])
		{
			/* ------ */
			set.spec[pid] = 1;
			new _wep, _ammo;
			for(new i; i < 13; ++i)
			{
				GetPlayerWeaponData(pid, i, _wep, _ammo);
				if(_wep)
				{
					SetPVarInt(pid, F("gun%i",i), _wep);
				}
			}

			/* ------ */
			new Float:x,Float:y,Float:z;
			GetPlayerPos(pid, x,y,z);
			fset.spect_x[pid] = x;
			fset.spect_y[pid] = y;
			fset.spect_z[pid] = z;

			/* ------- */
			set.spec_skin[pid] = GetPlayerSkin(pid);

			/* ------- */
			TogglePlayerSpectating(pid, true);

			if(id != -1)
				switch(IsPlayerInAnyVehicle(id))
				{
					case 0:
					{
						PlayerSpectatePlayer(pid, id);
						set.stebiu[pid] = id;
						set.stebi[id] = pid;
					}
					case 1: 
					{
						PlayerSpectateVehicle(pid, GetPlayerVehicleID(id));
						set.stebiu[pid] = id;
						set.stebi[id] = pid;
					}
				}
		}

	} else if(l == 2){

		if(get.spec[pid])
		{
			/* ------ */
			del.spec[pid];
			for(new i; i < 13; ++i)
			{
				if( GetPVarInt(pid,f("gun%i",i)) )
				{
					new ammo = findItemInBag(pid, GetWeaponSlot(GetPVarInt(pid,F("gun%i",i)))+60);
					if(ammo != -1)
					{
						givePlayerWeapon(pid, GetPVarInt(pid,F("gun%i",i)), bag[ammo][kiekis] );
					}
				}
			}

			set.stebi[get.stebiu[pid]] = 0;
			del.stebiu[pid];

			/* ------ */
			SetPlayerSkin(pid, get.spec_skin[pid]);
			/* ------ */
			fade_setPlayerPos(pid, fget.spect_x[pid], fget.spect_y[pid], fget.spect_z[pid]);
		}
	}
	return 1;
}

function::PlayerFacePlayer(pid, giveplayerid) {
	new
		Float: pX,
		Float: pY,
		Float: pZ,
		Float: gX,
		Float: gY,
		Float: gZ
	;
	if(GetPlayerPos(pid, pX, pY, pZ) && GetPlayerPos(giveplayerid, gX, gY, gZ)) {
		SetPlayerFacingAngle(pid, (pX = -atan2((gX - pX), (gY - pY))));
		return 1;
	}
	return false;
}

stock IsPlayerLookingAtPoint(pid, Float:x,Float:y,Float:z, Float:acc = 2.0)
{
	new Float:xx,Float:yy,Float:zz, Float:dist;
	new Float:xxx,Float:yyy,Float:zzz;
	GetPlayerCameraPos(pid, xxx,yyy,zzz);
	dist = GDBP(x,y,z,xxx,yyy,zzz);
	GetPlayerCameraLookAt(pid, dist, xx,yy,zz);

	if(GDBP(xx,yy,zz,x,y,z) < acc)
	{
		return 1;

	} else {

		return 0;
	}
}

function::GetPlayerCameraLookAt(pid, Float:fScale, &Float:x, &Float:y, &Float:z)
{
	new
		Float:fPX, Float:fPY, Float:fPZ,
		Float:fVX, Float:fVY, Float:fVZ;

	GetPlayerCameraPos(pid, fPX, fPY, fPZ);
	GetPlayerCameraFrontVector(pid, fVX, fVY, fVZ);

	x = fPX + floatmul(fVX, fScale);
	y = fPY + floatmul(fVY, fScale);
	z = fPZ + floatmul(fVZ, fScale);
	return 0;
}

stock Float:PointAngle(playerid, Float:xa, Float:ya, Float:xb, Float:yb)
{
	new Float:carangle;
	new Float:xc, Float:yc;
	new Float:angle;
	xc = floatabs(floatsub(xa,xb));
	yc = floatabs(floatsub(ya,yb));
	if (yc == 0.0 || xc == 0.0)
	{
		if(yc == 0 && xc > 0) angle = 0.0;
		else if(yc == 0 && xc < 0) angle = 180.0;
		else if(yc > 0 && xc == 0) angle = 90.0;
		else if(yc < 0 && xc == 0) angle = 270.0;
		else if(yc == 0 && xc == 0) angle = 0.0;
	}
	else
	{
		angle = atan(xc/yc);
		if(xb > xa && yb <= ya) angle += 90.0;
		else if(xb <= xa && yb < ya) angle = floatsub(90.0, angle);
		else if(xb < xa && yb >= ya) angle -= 90.0;
		else if(xb >= xa && yb > ya) angle = floatsub(270.0, angle);
	}
	GetVehicleZAngle(GetPlayerVehicleID(playerid), carangle);
	return floatadd(angle, -carangle);
}



stock secToTime(secs,&hours,&minutes,&seconds)
{
	if (secs<0)
		return;
	minutes = secs / 60; 
	seconds = secs % 60;
	hours = minutes / 60; 
	minutes = minutes % 60;
}

stock memcmp(arr1[], arr2[], size1 = sizeof arr1, size2 = sizeof arr2)
{
    if(size1 != size2) return -1;
    for(new i; i != size1; ++i)
    {
        if(arr1[i] != arr2[i])
        {
            return i;
        }
    }
    return false;
}

stock slotcpy(arr1[e_bag], arr2[e_bag])
{
	arr1[item] = arr2[item];
	arr1[kiekis] = arr2[kiekis];
	arr1[item_info] = arr2[item_info];
	for(new i; i != eBonus; ++i)
		arr1[effect][i] = arr2[effect][i];
}

stock memadd(arr1[], arr2[], size1 = sizeof arr1, size2 = sizeof arr2)
{
	if(size1 != size2) return -1;
    for(new i; i != size1; ++i)
    {
        arr1[i] += arr2[i];
    }
    return false;
}

stock memsub(arr1[], arr2[], size1 = sizeof arr1, size2 = sizeof arr2)
{
	if(size1 != size2) return -1;
    for(new i; i != size1; ++i)
    {
        arr1[i] -= arr2[i];
    }
    return false;
}

func showRepairBar(pid, proc)
{
	PlayerTextDrawTextSize(pid, p_pRepairBar[0][pid], proc * 246.000000 / 100, 25.000000);
	PlayerTextDrawTextSize(pid, p_pRepairBar[1][pid], proc * 246.000000 / 100, 25.000000);

	TextDrawShowForPlayer(pid, g_pRepairBar[0]);
	TextDrawShowForPlayer(pid, g_pRepairBar[1]);
	TextDrawShowForPlayer(pid, g_pRepairBar[2]);

	PlayerTextDrawShow(pid, p_pRepairBar[0][pid]);
	PlayerTextDrawShow(pid, p_pRepairBar[1][pid]);
}

func hideRepairBar(pid)
{
	TextDrawHideForPlayer(pid, g_pRepairBar[0]);
	TextDrawHideForPlayer(pid, g_pRepairBar[1]);
	TextDrawHideForPlayer(pid, g_pRepairBar[2]);

	PlayerTextDrawHide(pid, p_pRepairBar[0][pid]);
	PlayerTextDrawHide(pid, p_pRepairBar[1][pid]);
}


stock AttachBandanaToPlayer(pid, bid)
{
	switch(GetPlayerSkin(pid))
	{
		case 0:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.089999, 0.010000, 0.1 + -0.000999, -85.499992, 8.599997, -92.800048, 1.010000, 1.000000, 1.015000);
		}
	    case 1:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.090000, 0.019980, 0.1 + 0.001990, -86.900001, 15.999990, -94.800003, 1.011989, 1.000000, 0.885990);
		}
		case 2:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.090000, 0.019980, 0.1 + 0.001990, -86.900001, 15.999990, -94.800003, 1.011989, 1.000000, 0.885990);
		}
		case 3:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.079999, 0.036980, 0.1 + 0.001990, -86.900001, 15.999990, -94.800003, 1.011989, 1.000000, 0.885990);
		}
		case 4:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.119000, 0.027980, 0.1 + -0.003010, -86.900001, 15.999990, -94.800003, 1.011989, 1.000000, 0.885990);
		}
		case 5:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.098999, 0.039980, 0.1 + 0.001990, -86.900001, 15.999990, -94.800003, 1.011989, 1.000000, 0.885990);
		}
		case 6:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.097999, 0.025000, 0.1 + 0.001999, -90.600028, 0.800003, -97.299919, 1.000000, 1.000000, 1.000000);
		}
		case 7:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.070999, 0.031000, 0.1 + 0.000999, -90.600028, 11.200003, -97.299919, 1.000000, 1.000000, 1.000000);
		}
		case 8:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.070999, 0.031000, 0.1 + 0.000999, -90.600028, 11.200003, -97.299919, 1.000000, 1.000000, 1.000000);
		}
		case 9:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.043999, 0.015000, 0.1 + 0.000999, -90.600028, 11.200003, -97.299919, 1.000000, 1.000000, 1.000000);
		}
		case 10:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.059999, 0.022000, 0.1 + 0.000999, -90.600028, 11.200003, -97.299919, 1.000000, 1.000000, 1.000000);
		}
		case 11:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.059999, 0.022000, 0.1 + 0.000999, -90.600028, 11.200003, -97.299919, 1.000000, 1.000000, 1.000000);
		}
		case 12:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.059999, 0.014000, 0.1 + 0.007000, -90.600028, 11.200003, -97.299919, 1.000000, 1.000000, 1.000000);
		}
		case 13:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.059999, 0.014000, 0.1 + 0.007000, -90.600028, 11.200003, -97.299919, 1.000000, 1.000000, 1.000000);
		}
		case 14:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.082999, 0.036000, 0.1 + 0.007000, -90.600028, 11.200003, -97.299919, 1.000000, 1.000000, 1.000000);
		}
		case 15:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.067999, 0.004000, 0.1 + 0.002999, -90.600028, 11.200003, -97.299919, 1.000000, 1.000000, 1.000000);
		}
		case 16:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.081999, 0.031000, 0.1 + 0.002999, -90.600028, 11.200003, -97.299919, 1.000000, 1.000000, 1.000000);
		}
		case 17:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.081999, 0.031000, 0.1 + 0.002999, -90.600028, 11.200003, -97.299919, 1.000000, 1.000000, 1.000000);
		}
		case 18:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.047999, 0.019000, 0.1 + 0.002999, -90.600028, 11.200003, -97.299919, 1.000000, 1.000000, 1.000000);
		}
		case 19:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.058999, 0.019000, 0.1 + 0.002999, -90.600028, 11.200003, -97.299919, 1.000000, 1.000000, 1.000000);
		}
		case 20:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.076999, 0.017000, 0.1 + -0.001000, -90.600028, 11.200003, -97.299919, 1.000000, 1.000000, 1.000000);
		}
		case 21:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.076999, 0.017000, 0.1 + -0.001000, -90.600028, 11.200003, -97.299919, 1.000000, 1.000000, 1.000000);
		}
		case 22:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.076999, 0.033000, 0.1 + 0.001999, -90.600028, 11.200003, -97.299919, 1.000000, 1.000000, 1.000000);
		}
		case 23:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.076999, 0.033000, 0.1 + 0.001999, -90.600028, 11.200003, -97.299919, 1.000000, 1.000000, 1.000000);
		}
		case 24:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.076999, 0.014000, 0.1 + -0.005000, -90.600028, 11.200003, -97.299919, 1.000000, 1.000000, 1.000000);
		}
		case 25:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.076999, 0.014000, 0.1 + 0.007000, -90.600028, 11.200003, -97.299919, 1.000000, 1.000000, 1.000000);
		}
		case 26:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.069999, 0.014000, 0.1 + 0.004999, -90.600028, 11.200003, -97.299919, 1.000000, 1.000000, 1.000000);
		}
		case 27:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.069999, 0.014000, 0.1 + 0.004999, -90.600028, 11.200003, -97.299919, 1.000000, 1.000000, 1.000000);
		}
		case 28:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.075999, 0.033000, 0.1 + -0.001000, -90.600028, 11.200003, -97.299919, 1.000000, 1.000000, 1.000000);
		}
		case 29:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.070000, 0.032999, 0.1 + 0.002999, -82.199974, 17.899999, -99.000000, 1.000000, 1.265999, 1.000000);
		}
		case 30:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.070000, 0.032999, 0.1 + 0.002999, -82.199974, 17.899999, -99.000000, 1.000000, 1.265999, 1.000000);
		}
		case 31:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.070000, 0.029999, 0.1 + -0.004000, -82.199974, 17.899999, -99.000000, 1.000000, 1.265999, 1.000000);
		}
		case 32:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.065000, -0.011000,0.1 +  -0.000000, -82.199974, 19.500000, -99.000000, 1.000000, 1.265999, 1.000000);
		}
		case 33:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.023000, 0.001999, 0.1 + -0.000000, -82.199974, 19.500000, -99.000000, 1.000000, 1.265999, 1.000000);
		}
		case 34:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.070000, 0.027999, 0.1 + -0.000000, -82.199974, 19.500000, -99.000000, 1.000000, 1.265999, 1.000000);
		}
		case 35:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.070000, 0.016999, 0.1 + -0.000000, -82.199974, 19.500000, -99.000000, 1.000000, 1.265999, 1.000000);
		}
		case 36:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.070000, 0.016999, 0.1 + -0.000000, -82.199974, 19.500000, -99.000000, 1.000000, 1.265999, 1.000000);
		}
		case 37:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.070000, 0.016999, 0.1 + -0.000000, -82.199974, 19.500000, -99.000000, 1.000000, 1.265999, 1.000000);
		}
		case 38:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.070000, 0.030999, 0.1 + -0.000000, -82.199974, 19.500000, -99.000000, 1.000000, 1.265999, 1.000000);
		}
		case 39:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.058000, 0.028000, 0.1 + -0.000000, -82.199974, 14.199999, -99.000000, 1.000000, 1.265999, 1.000000);
		}
		case 40:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.058000, 0.017000, 0.1 + 0.002999, -82.199974, 14.199999, -99.000000, 0.941000, 1.265999, 1.000000);
		}
		case 41:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.058000, 0.025000, 0.1 + 0.002999, -82.199974, 14.199999, -99.000000, 0.941000, 1.265999, 1.000000);
		}
		case 42:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.058000, 0.025000, 0.1 + 0.002999, -82.199974, 14.199999, -99.000000, 0.941000, 1.265999, 1.000000);
		}
		case 43:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.026000, 0.010999, 0.1 + 0.002999, -82.199974, 14.199999, -99.000000, 0.941000, 1.265999, 1.000000);
		}
		case 44:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.079000, 0.019000, 0.1 + 0.002999, -82.199974, 14.199999, -99.000000, 0.941000, 1.265999, 1.000000);
		}
		case 45:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.045000, 0.019000, 0.1 + 0.002999, -82.199974, 14.199999, -99.000000, 0.941000, 1.265999, 1.000000);
		}
		case 46:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.094000, 0.042999, 0.1 + 0.002999, -82.199974, 2.099999, -99.000000, 1.011000, 1.265999, 1.000000);
		}
		case 47:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.075999, 0.035000, 0.1 + -0.004999, -85.499992, 5.299999, -92.800048, 1.000000, 1.000000, 1.000000);
		}
		case 48:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.091999, 0.036000, 0.1 + -0.004999, -85.499992, 3.299999, -92.800048, 1.000000, 1.000000, 1.000000);
		}
		case 49:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.078999, 0.025000, 0.1 + -0.002999, -85.499992, 3.299999, -92.800048, 1.000000, 1.000000, 1.000000);
		}
		case 50:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.116998,-0.017999,-0.1 + 0.006000,-85.499992,8.599996,-92.800048,1.146000,1.145000,1.03400);
		}
		case 51:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.099999, 0.005000, 0.1 + -0.004999, -85.499992, 3.299999, -92.800048, 1.072000, 1.000000, 1.140000);
		}
		case 52:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.099999, 0.005000, 0.1 + -0.004999, -85.499992, 3.299999, -92.800048, 1.072000, 1.000000, 1.140000);
		}
		case 53:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.084999, 0.032000, 0.1 + -0.003999, -85.499992, 3.299999, -92.800048, 0.942000, 1.000000, 0.886000);
		}
		case 55:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.066999, 0.026000, 0.1 + 0.002000, -85.499992, 3.299999, -92.800048, 0.998000, 1.000000, 0.914000);
		}
		case 56:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.066999, 0.026000, 0.1 + 0.002000, -85.499992, 3.299999, -92.800048, 0.998000, 1.000000, 0.914000);
		}
		case 57:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.109999, 0.041000, 0.1 + -0.000999, -85.499992, 3.299999, -92.800048, 0.998000, 1.000000, 0.914000);
		}
		case 58:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.079999, 0.019000, 0.1 + -0.000999, -85.499992, 8.599997, -92.800048, 0.998000, 1.000000, 0.914000);
		}
		case 59:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.079999, 0.019000, 0.1 + -0.000999, -85.499992, 8.599997, -92.800048, 0.998000, 1.000000, 0.914000);
		}
		case 60:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.088999, 0.034000, 0.1 + -0.002999, -85.499992, 8.599997, -92.800048, 0.998000, 1.000000, 0.914000);
		}
		case 61:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.079999, 0.026000, 0.1 + -0.002999, -85.499992, 8.599997, -92.800048, 0.998000, 1.000000, 0.914000);
		}
		case 62:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.089999, 0.035000, 0.1 + 0.009000, -85.499992, 8.599997, -92.800048, 0.998000, 1.000000, 0.914000);
		}
		case 63:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.064999, 0.006000, 0.1 + -0.002999, -85.499992, 8.599997, -92.800048, 1.096000, 1.000000, 1.191000);
		}
		case 64:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.064999, 0.006000, 0.1 + -0.002999, -85.499992, 8.599997, -92.800048, 1.096000, 1.000000, 1.191000);
		}
		case 65:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.064999, 0.006000, 0.1 + -0.002999, -85.499992, 8.599997, -92.800048, 1.096000, 1.000000, 1.191000);
		}
		case 66:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.084999, 0.025000, 0.1 + -0.006999, -85.499992, 8.599997, -92.800048, 1.096000, 1.000000, 1.191000);
		}
		case 67:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.084999, 0.014000, 0.1 + -0.006999, -85.499992, 8.599997, -92.800048, 1.096000, 1.000000, 0.943000);
		}
		case 68:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.075999, 0.028000, 0.1 + -0.002999, -85.499992, 8.599997, -92.800048, 0.954000, 1.000000, 0.943000);
		}
		case 69:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.062999, 0.022000, 0.1 + 0.000000, -85.499992, 8.599997, -92.800048, 1.010000, 1.000000, 1.015000);
		}
		case 70:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.134998, 0.023000, 0.1 + 0.008999, -85.499992, 8.599996, -92.800048, 1.009999, 1.000000, 1.014999);
		}
		case 71:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.073999, -0.000999,0.1 +  0.000000, -85.499992, 8.599997, -92.800048, 1.010000, 1.000000, 1.015000);
		}
		case 72:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.077999, 0.016000, 0.1 + -0.000999, -85.499992, 8.599997, -92.800048, 1.010000, 1.000000, 1.015000);
		}
		case 73:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.077999, 0.016000, 0.1 + -0.000999, -85.499992, 8.599997, -92.800048, 1.010000, 1.000000, 1.015000);
		}
		case 74:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.089999, 0.010000, 0.1 + -0.000999, -85.499992, 8.599997, -92.800048, 1.010000, 1.000000, 1.015000);
		}
		case 75:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.068999, 0.022000, 0.1 + -0.000999, -85.499992, 8.599997, -92.800048, 1.010000, 1.000000, 1.015000);
		}
		case 76:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.068999, 0.022000, 0.1 + -0.000999, -85.499992, 8.599997, -92.800048, 1.010000, 1.000000, 1.015000);
		}
		case 77:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.059999, 0.025000, 0.1 + -0.004999, -85.499992, 8.599997, -92.800048, 1.010000, 1.000000, 1.015000);
		}
		case 78:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.090999, 0.007000, 0.1 + 0.006000, -85.499992, 18.799999, -92.800048, 1.010000, 1.000000, 1.015000);
		}
		case 79:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.090999, 0.011000, 0.1 + 0.006000, -85.499992, 4.800003, -92.800048, 1.010000, 1.000000, 1.015000);
		}
		case 80:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.081999, 0.007000, 0.1 + 0.003000, -85.499992, 10.000003, -92.800048, 1.010000, 1.000000, 1.015000);
		}
		case 81:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.081999, 0.007000, 0.1 + 0.003000, -85.499992, 10.000003, -92.800048, 1.010000, 1.000000, 1.015000);
		}
		case 82:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.085999, 0.025000, 0.1 + -0.002999, -85.499992, 10.000003, -92.800048, 1.010000, 1.000000, 1.015000);
		}
		case 83:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.085999, 0.025000, 0.1 + -0.002999, -85.499992, 10.000003, -92.800048, 1.010000, 1.000000, 1.015000);
		}
		case 84:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.085999, 0.025000, 0.1 + -0.002999, -85.499992, 10.000003, -92.800048, 1.010000, 1.000000, 1.015000);
		}
		case 85:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.077999, 0.037000, 0.1 + -0.002999, -85.499992, 4.600003, -92.800048, 1.060000, 1.000000, 1.015000);
		}
		case 86:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.077999, 0.011000, 0.1 + -0.002999, -85.499992, 12.300005, -92.800048, 1.060000, 1.000000, 1.015000);
		}
		case 87:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.065999, 0.040000, 0.1 + -0.002999, -85.499992, 12.300005, -92.800048, 1.060000, 1.000000, 1.015000);
		}
		case 88:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.065999, 0.028000, 0.1 + -0.002999, -85.499992, 12.300005, -92.800048, 1.060000, 1.000000, 1.015000);
		}
		case 89:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.086999, 0.011000, 0.1 + -0.004999, -85.499992, 12.300005, -92.800048, 1.060000, 1.000000, 1.015000);
		}
		case 90:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.052999, 0.022000, 0.1 + -0.002999, -85.499992, 12.300005, -92.800048, 1.060000, 1.000000, 1.015000);
		}
		case 91:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.052999, 0.022000, 0.1 + -0.002999, -85.499992, 12.300005, -92.800048, 1.060000, 1.000000, 1.015000);
		}
		case 92:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.052999, 0.022000, 0.1 + -0.002999, -85.499992, 12.300005, -92.800048, 1.060000, 1.000000, 1.015000);
		}
		case 93:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.052999, 0.022000, 0.1 + -0.002999, -85.499992, 12.300005, -92.800048, 1.060000, 1.000000, 1.015000);
		}
		case 94:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.031999, -0.000999,0.1 +  -0.002999, -85.499992, 12.300005, -92.800048, 0.875001, 1.000000, 1.015000);
		}
		case 95:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.072999, -0.004999,0.1 +  -0.002999, -85.499992, 12.300005, -92.800048, 0.875001, 1.000000, 1.015000);
		}
		case 96:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.090999, 0.016000, 0.1 + -0.002999, -85.499992, 12.300005, -92.800048, 0.926000, 1.000000, 1.015000);
		}
		case 97:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.060999, 0.012000, 0.1 + -0.002999, -85.499992, 12.300005, -92.800048, 0.926000, 1.000000, 1.015000);
		}
		case 98:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.084999, 0.043000, 0.1 + -0.002999, -85.499992, 12.300005, -92.800048, 0.948000, 1.000000, 1.015000);
		}
		case 99:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.069999, 0.021000, 0.1 + -0.002999, -85.499992, 12.300005, -92.800048, 0.948000, 1.000000, 1.015000);
		}
		case 100:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.081999, 0.021000, 0.1 + -0.001999, -85.499992, 12.300005, -92.800048, 0.998000, 1.000000, 1.015000);
		}
		case 101:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.081999, 0.021000, 0.1 + -0.001999, -85.499992, 12.300005, -92.800048, 0.998000, 1.000000, 1.015000);
		}
		case 102:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.081999, 0.021000, 0.1 + -0.001999, -85.499992, 12.300005, -92.800048, 0.998000, 1.000000, 1.015000);
		}
		case 103:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.081999, 0.030000, 0.1 + -0.002999, -85.499992, 12.300005, -92.800048, 1.057000, 1.000000, 1.015000);
		}
		case 104:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.081999, 0.030000, 0.1 + -0.002999, -85.499992, 12.300005, -92.800048, 1.057000, 1.000000, 1.015000);
		}
		case 105:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.081999, 0.030000, 0.1 + -0.002999, -85.499992, 12.300005, -92.800048, 1.057000, 1.000000, 1.015000);
		}
		case 106:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.081999, 0.030000, 0.1 + -0.002999, -85.499992, 12.300005, -92.800048, 1.057000, 1.000000, 1.015000);
		}
		case 107:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.081999, 0.030000, 0.1 + -0.002999, -85.499992, 12.300005, -92.800048, 1.057000, 1.000000, 1.015000);
		}
		case 108:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.081999, 0.019000, 0.1 + -0.002999, -85.499992, 12.300005, -92.800048, 1.057000, 1.000000, 1.015000);
		}
		case 109:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.081999, 0.033000, 0.1 + -0.002999, -85.499992, 12.300005, -92.800048, 0.983000, 1.000000, 1.015000);
		}
		case 110:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.081999, 0.033000, 0.1 + -0.002999, -85.499992, 12.300005, -92.800048, 0.983000, 1.000000, 1.015000);
		}
		case 111:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.090999, 0.014000, 0.1 + -0.002999, -85.499992, 12.300005, -92.800048, 0.983000, 1.000000, 1.015000);
		}
		case 112:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.084999, 0.015000, 0.1 + -0.002999, -85.499992, 2.000007, -92.800048, 0.983000, 1.000000, 0.895000);
		}
		case 113:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.088999, 0.048000, 0.1 + 0.001000, -85.499992, 2.000007, -92.800048, 0.983000, 1.000000, 0.895000);
		}
		case 114:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.088999, 0.051000, 0.1 + -0.000999, -85.499992, 2.000007, -92.800048, 1.040001, 1.000000, 0.895000);
		}
		case 115:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.088999, 0.051000, 0.1 + -0.000999, -85.499992, 2.000007, -92.800048, 1.040001, 1.000000, 0.895000);
		}
		case 116:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.088999, 0.015000, 0.1 + 0.006000, -85.499992, 21.400005, -92.800048, 1.040001, 1.000000, 0.895000);
		}
		case 117:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.058999, 0.031000, 0.1 + -0.000999, -85.499992, 11.700005, -92.800048, 1.040001, 1.000000, 0.895000);
		}
		case 118:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.058999, 0.031000, 0.1 + -0.000999, -85.499992, 11.700005, -92.800048, 1.040001, 1.000000, 0.895000);
		}
		case 119:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.081999, 0.025000, 0.1 + -0.000999, -85.499992, 11.700005, -92.800048, 1.040001, 1.000000, 0.895000);
		}
		case 120:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.081999, 0.025000, 0.1 + -0.000999, -85.499992, 11.700005, -92.800048, 1.040001, 1.000000, 0.895000);
		}
		case 121:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.081999, 0.025000, 0.1 + -0.000999, -85.499992, 11.700005, -92.800048, 1.040001, 1.000000, 0.895000);
		}
		case 122:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.081999, 0.025000, 0.1 + -0.000999, -85.499992, 11.700005, -92.800048, 1.040001, 1.000000, 0.895000);
		}
		case 123:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.073999, 0.044000, 0.1 + -0.000999, -85.499992, 11.700005, -92.800048, 1.040001, 1.000000, 0.895000);
		}
		case 124:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.061999, 0.039000, 0.1 + -0.000999, -85.499992, 11.700005, -92.800048, 1.040001, 1.000000, 0.895000);
		}
		case 125:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.084999, 0.024000, 0.1 + -0.000999, -85.499992, 11.700005, -92.800048, 1.040001, 1.000000, 0.895000);
		}
		case 126:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.084999, 0.024000, 0.1 + -0.000999, -85.499992, 11.700005, -92.800048, 1.040001, 1.000000, 0.895000);
		}
		case 127:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.084999, 0.047000, 0.1 + 0.000000, -85.499992, 11.700005, -92.800048, 1.040001, 1.000000, 0.895000);
		}
		case 128:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.084999, 0.047000, 0.1 + 0.000000, -85.499992, 11.700005, -92.800048, 1.040001, 1.000000, 0.895000);
		}
		case 129:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.072999, 0.025000, 0.1 + 0.000000, -85.499992, 11.700005, -92.800048, 0.801001, 1.000000, 0.895000);
		}
		case 130:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.042999, 0.027000, 0.1 + -0.003999, -85.499992, 18.700014, -92.800048, 0.869001, 1.000000, 1.019000);
		}
		case 131:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.042999, 0.027000, 0.1 + -0.003999, -85.499992, 18.700014, -92.800048, 0.869001, 1.000000, 1.019000);
		}
		case 132:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.009999, 0.000000, 0.1 + -0.003999, -85.499992, 18.700014, -92.800048, 0.869001, 1.000000, 1.019000);
		}
		case 133:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.084999, 0.019000, 0.1 + -0.001999, -85.499992, 18.700014, -92.800048, 0.869001, 1.000000, 1.019000);
		}
		case 134:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.066999, 0.002000, 0.1 + -0.001999, -85.499992, 18.700014, -92.800048, 0.869001, 1.000000, 1.019000);
		}
		case 135:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.048999, 0.018000, 0.1 + -0.001999, -85.499992, 18.700014, -92.800048, 0.869001, 1.000000, 1.019000);
		}
		case 136:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.069999, 0.012000, 0.1 + -0.001999, -85.499992, 18.700014, -92.800048, 0.869001, 1.000000, 1.019000);
		}
		case 137:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.048999, -0.001999,0.1 +  -0.001999, -85.499992, 18.700014, -92.800048, 0.869001, 1.000000, 1.019000);
		}
		case 138:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.048999, 0.029000, 0.1 + -0.001999, -85.499992, 18.700014, -92.800048, 0.869001, 1.000000, 1.019000);
		}
		case 139:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.048999, 0.029000, 0.1 + -0.001999, -85.499992, 18.700014, -92.800048, 0.869001, 1.000000, 1.019000);
		}
		case 140:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.048999, 0.036000, 0.1 + -0.001999, -85.499992, 18.700014, -92.800048, 1.002001, 1.000000, 1.019000);
		}
		case 141:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.048999, 0.016000, 0.1 + -0.001999, -85.499992, 5.500014, -92.800048, 1.002001, 1.000000, 1.019000);
		}
		case 142:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.088999, 0.032000, 0.1 + -0.005999, -85.499992, 5.500014, -92.800048, 1.002001, 1.000000, 1.019000);
		}
		case 143:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.088999, 0.032000, 0.1 + -0.005999, -85.499992, 5.500014, -92.800048, 1.002001, 1.000000, 1.019000);
		}
		case 144:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.088999, 0.032000, 0.1 + -0.005999, -85.499992, 5.500014, -92.800048, 1.002001, 1.000000, 1.019000);
		}
		case 145:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.088999, 0.032000, 0.1 + -0.005999, -85.499992, 5.500014, -92.800048, 1.002001, 1.000000, 1.019000);
		}
		case 146:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.088999, 0.023000, 0.1 + -0.005999, -85.499992, 5.500014, -92.800048, 1.002001, 1.000000, 1.019000);
		}
		case 147:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.075999, 0.011000, 0.1 + 0.005000, -85.499992, 14.000016, -92.800048, 1.002001, 1.000000, 1.019000);
		}
		case 148:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.054999, 0.016000, 0.1 + -0.002999, -85.499992, 5.100017, -92.800048, 1.002001, 1.000000, 1.019000);
		}
		case 149:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.091999, 0.016000, 0.1 + 0.000000, -85.499992, 5.100017, -92.800048, 1.039001, 1.000000, 1.019000);
		}
		case 150:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.070999, 0.016000, 0.1 + 0.000000, -85.499992, 5.100017, -92.800048, 1.039001, 1.000000, 1.019000);
		}
		case 151:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.070999, 0.020000, 0.1 + -0.001999, -85.499992, 5.100017, -92.800048, 1.112001, 1.000000, 1.077001);
		}
		case 152:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.070999, 0.007000, 0.1 + -0.001999, -85.499992, 5.100017, -92.800048, 1.112001, 1.000000, 0.989001);
		}
		case 153:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.070999, 0.017000, 0.1 + 0.004000, -85.499992, 5.100017, -92.800048, 1.112001, 1.000000, 0.989001);
		}
		case 154:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.070999, 0.017000, 0.1 + 0.004000, -85.499992, 5.100017, -92.800048, 1.112001, 1.000000, 0.989001);
		}
		case 155:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.092999, 0.028000, 0.1 + -0.002999, -85.499992, 5.100017, -92.800048, 1.112001, 1.000000, 0.989001);
		}
		case 156:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.092999, 0.028000, 0.1 + -0.002999, -85.499992, 5.100017, -92.800048, 1.112001, 1.000000, 0.989001);
		}
		case 157:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.065999, 0.028000, 0.1 + 0.004000, -85.499992, 5.100017, -92.800048, 1.073001, 1.000000, 0.989001);
		}
		case 158:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.077999, 0.028000, 0.1 + -0.004999, -85.499992, 5.100017, -92.800048, 1.073001, 1.000000, 0.989001);
		}
		case 159:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.077999, 0.028000, 0.1 + -0.004999, -85.499992, 5.100017, -92.800048, 1.073001, 1.000000, 0.989001);
		}
		case 160:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.077999, 0.015000, 0.1 + 0.002000, -85.499992, 13.300017, -92.800048, 0.944001, 1.000000, 0.989001);
		}
		case 161:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.077999, 0.029000, 0.1 + 0.002000, -85.499992, 13.300017, -92.800048, 0.944001, 1.000000, 0.989001);
		}
		case 162:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.077999, 0.029000, 0.1 + 0.002000, -85.499992, 13.300017, -92.800048, 0.944001, 1.000000, 0.989001);
		}
		case 163:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.077999, 0.018000, 0.1 + 0.002000, -85.499992, 13.300017, -92.800048, 0.944001, 1.000000, 0.989001);
		}
		case 164:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.077999, 0.018000, 0.1 + 0.002000, -85.499992, 13.300017, -92.800048, 0.944001, 1.000000, 0.989001);
		}
		case 165:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.077999, 0.018000, 0.1 + 0.002000, -85.499992, 13.300017, -92.800048, 0.944001, 1.000000, 0.989001);
		}
		case 166:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.077999, 0.018000, 0.1 + 0.002000, -85.499992, 13.300017, -92.800048, 0.944001, 1.000000, 0.989001);
		}
		case 167:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.065999, 0.033000, 0.1 + 0.002000, -85.499992, 22.500015, -92.800048, 0.818001, 1.000000, 0.989001);
		}
		case 168:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.065999, 0.033000, 0.1 + -0.008999, -85.499992, 16.900012, -92.800048, 0.843001, 1.000000, 0.989001);
		}
		case 169:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.065999, 0.015000, 0.1 + -0.000999, -85.499992, 16.900012, -92.800048, 0.909000, 1.000000, 0.989001);
		}
		case 170:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.071999, 0.025000, 0.1 + -0.006999, -85.499992, 16.900012, -92.800048, 0.964000, 1.000000, 0.989001);
		}
		case 171:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.071999, 0.025000, 0.1 + -0.006999, -85.499992, 16.900012, -92.800048, 0.964000, 1.000000, 0.989001);
		}
		case 172:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.050999, 0.025000, 0.1 + -0.002999, -85.499992, 16.900012, -92.800048, 0.964000, 1.000000, 0.989001);
		}
		case 173:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.073999, 0.036000, 0.1 + -0.002999, -85.499992, 16.900012, -92.800048, 0.964000, 1.000000, 0.989001);
		}
		case 174:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.073999, 0.036000, 0.1 + -0.004999, -85.499992, 16.900012, -92.800048, 1.011000, 1.000000, 0.989001);
		}
		case 175:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.073999, 0.036000, 0.1 + -0.004999, -85.499992, 16.900012, -92.800048, 1.011000, 1.000000, 0.989001);
		}
		case 176:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.073999, 0.036000, 0.1 + -0.004999, -85.499992, 16.900012, -92.800048, 1.011000, 1.000000, 0.989001);
		}
		case 177:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.073999, 0.028000, 0.1 + -0.004999, -85.499992, 16.900012, -92.800048, 1.011000, 1.000000, 0.989001);
		}
		case 178:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.056999, 0.028000, 0.1 + -0.004999, -85.499992, 16.900012, -92.800048, 1.011000, 1.000000, 0.989001);
		}
		case 179:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.075999, 0.035000, 0.1 + -0.008999, -85.499992, 8.800013, -92.800048, 1.011000, 1.000000, 0.989001);
		}
		case 180:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.075999, 0.035000, 0.1 + -0.008999, -85.499992, 8.800013, -92.800048, 1.011000, 1.000000, 0.989001);
		}
		case 181:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.104999, 0.029000, 0.1 + -0.005999, -85.499992, 8.800013, -92.800048, 1.011000, 1.000000, 0.989001);
		}
		case 182:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.074999, 0.029000, 0.1 + -0.005999, -85.499992, 8.800013, -92.800048, 1.011000, 1.000000, 0.989001);
		}
		case 183:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.074999, 0.029000, 0.1 + -0.005999, -85.499992, 8.800013, -92.800048, 1.011000, 1.000000, 0.989001);
		}
		case 184:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.074999, 0.029000, 0.1 + -0.005999, -85.499992, 8.800013, -92.800048, 1.011000, 1.000000, 0.989001);
		}
		case 185:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.074999, 0.029000, 0.1 + -0.005999, -85.499992, 8.800013, -92.800048, 1.011000, 1.000000, 0.989001);
		}
		case 186:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.074999, 0.029000, 0.1 + -0.005999, -85.499992, 8.800013, -92.800048, 1.011000, 1.000000, 0.989001);
		}
		case 187:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.074999, 0.017000, 0.1 + 0.007000, -85.499992, 14.300015, -92.800048, 1.011000, 1.000000, 0.989001);
		}
		case 188:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.081999, 0.017000, 0.1 + 0.000000, -85.499992, 14.300015, -92.800048, 1.011000, 1.000000, 0.989001);
		}
		case 189:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.081999, 0.017000, 0.1 + 0.000000, -85.499992, 14.300015, -92.800048, 1.011000, 1.000000, 0.989001);
		}
		case 190:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.082999, 0.025000, 0.1 + -0.001999, -85.499992, 6.000015, -92.800048, 1.011000, 1.000000, 0.989001);
		}
		case 191:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.082999, 0.025000, 0.1 + -0.001999, -85.499992, 6.000015, -92.800048, 1.011000, 1.000000, 0.989001);
		}
		case 192:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.082999, 0.025000, 0.1 + -0.001999, -85.499992, 6.000015, -92.800048, 1.011000, 1.000000, 0.989001);
		}
		case 193:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.082999, 0.025000, 0.1 + -0.001999, -85.499992, 6.000015, -92.800048, 1.011000, 1.000000, 0.989001);
		}
		case 194:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.082999, 0.025000, 0.1 + -0.001999, -85.499992, 6.000015, -92.800048, 1.011000, 1.000000, 0.989001);
		}
		case 195:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.082999, 0.025000, 0.1 + -0.001999, -85.499992, 6.000015, -92.800048, 1.011000, 1.000000, 0.989001);
		}
		case 196:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.082999, 0.025000, 0.1 + -0.001999, -85.499992, 6.000015, -92.800048, 1.011000, 1.000000, 0.989001);
		}
		case 197:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.082999, 0.017000, 0.1 + -0.001999, -85.499992, 6.000015, -92.800048, 1.011000, 1.000000, 0.989001);
		}
		case 198:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.064999, 0.017000, 0.1 + -0.001999, -85.499992, 6.000015, -92.800048, 1.011000, 1.000000, 0.989001);
		}
		case 199:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.073999, 0.022000, 0.1 + -0.001999, -85.499992, 10.400016, -92.800048, 1.011000, 1.000000, 0.989001);
		}
		case 200:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.077999, 0.022000, 0.1 + -0.001999, -85.499992, 10.400016, -92.800048, 1.011000, 1.000000, 0.989001);
		}
		case 201:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.060999, 0.022000, 0.1 + -0.001999, -85.499992, 10.400016, -92.800048, 1.011000, 1.000000, 0.989001);
		}
		case 202:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.097999, 0.022000, 0.1 + -0.001999, -85.499992, 10.400016, -92.800048, 1.011000, 1.000000, 0.989001);
		}
		case 203:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.086999, 0.030000, 0.1 + -0.001999, -85.499992, 10.400016, -92.800048, 1.011000, 1.000000, 0.989001);
		}
		case 204:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.086999, 0.025000, 0.1 + -0.001999, -85.499992, 10.400016, -92.800048, 1.011000, 1.000000, 0.989001);
		}
		case 205:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.073999, 0.025000, 0.1 + -0.002999, -85.499992, 14.800015, -92.800048, 1.083000, 1.000000, 0.989001);
		}
		case 206:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.099999, 0.025000, 0.1 + -0.002999, -85.499992, 5.200016, -92.800048, 1.083000, 1.000000, 0.989001);
		}
		case 207:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.061999, 0.025000, 0.1 + -0.002999, -85.499992, 5.200016, -92.800048, 1.083000, 1.000000, 0.989001);
		}
		case 208:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.079999, 0.035000, 0.1 + -0.002999, -85.499992, 5.200016, -92.800048, 1.083000, 1.000000, 0.989001);
		}
		case 209:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.072999, 0.012000, 0.1 + -0.002999, -85.499992, 10.300015, -92.800048, 1.083000, 1.000000, 0.989001);
		}
		case 210:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.072999, 0.012000, 0.1 + -0.002999, -85.499992, 10.300015, -92.800048, 1.083000, 1.000000, 0.989001);
		}
		case 211:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.053999, 0.021000, 0.1 + -0.002999, -85.499992, 10.300015, -92.800048, 1.083000, 1.000000, 0.989001);
		}
		case 212:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.083999, 0.017000, 0.1 + -0.002999, -85.499992, 10.300015, -92.800048, 1.083000, 1.000000, 0.989001);
		}
		case 213:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.083999, 0.024000, 0.1 + -0.002999, -85.499992, 10.300015, -92.800048, 1.083000, 1.000000, 0.989001);
		}
		case 214:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.059999, 0.013000, 0.1 + -0.000999, -85.499992, 10.300015, -92.800048, 1.023000, 1.000000, 0.989001);
		}
		case 215:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.059999, 0.013000, 0.1 + -0.000999, -85.499992, 10.300015, -92.800048, 1.023000, 1.000000, 0.989001);
		}
		case 216:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.059999, 0.013000, 0.1 + -0.000999, -85.499992, 10.300015, -92.800048, 1.023000, 1.000000, 0.989001);
		}
		case 217:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.081999, 0.013000, 0.1 + -0.003999, -85.499992, 10.300015, -92.800048, 1.023000, 1.000000, 0.989001);
		}
		case 218:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.081999, 0.027000, 0.1 + -0.003999, -85.499992, 10.300015, -92.800048, 1.023000, 1.000000, 0.989001);
		}
		case 219:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.059999, 0.021000, 0.1 + -0.001999, -85.499992, 10.300015, -92.800048, 1.023000, 1.000000, 0.989001);
		}
		case 220:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.040999, 0.039000, 0.1 + -0.001999, -85.499992, 10.300015, -92.800048, 1.023000, 1.000000, 0.989001);
		}
		case 221:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.082999, 0.020000, 0.1 + -0.001999, -85.499992, 10.300015, -92.800048, 1.023000, 1.000000, 0.989001);
		}
		case 222:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.157999,-0.024999, 0.1 + 0.008999,-85.499992,8.599996,-92.800048,1.146000,1.145000,1.118000);
		}
		case 223:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.082999, 0.040000, 0.1 + -0.001999, -85.499992, 10.300015, -92.800048, 1.023000, 1.000000, 0.989001);
		}
		case 224:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.061999, 0.019000, 0.1 + 0.001000, -85.499992, 10.300015, -92.800048, 1.023000, 1.000000, 0.989001);
		}
		case 225:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.061999, 0.019000, 0.1 + 0.001000, -85.499992, 10.300015, -92.800048, 1.023000, 1.000000, 0.989001);
		}
		case 226:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.061999, 0.019000, 0.1 + 0.001000, -85.499992, 10.300015, -92.800048, 1.023000, 1.000000, 0.989001);
		}
		case 227:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.095999, 0.042000, 0.1 + -0.002999, -85.499992, 10.300015, -92.800048, 0.973000, 1.000000, 0.989001);
		}
		case 228:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.095999, 0.042000, 0.1 + -0.002999, -85.499992, 10.300015, -92.800048, 0.973000, 1.000000, 0.989001);
		}
		case 229:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.076999, 0.008000, 0.1 + -0.001999, -85.499992, 10.300015, -92.800048, 1.020000, 1.000000, 0.989001);
		}
		case 230:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.049999, 0.018000, 0.1 + -0.001999, -85.499992, 10.300015, -92.800048, 1.020000, 1.000000, 0.989001);
		}
		case 231:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.082999, 0.033000, 0.1 + -0.001999, -85.499992, 10.300015, -92.800048, 1.020000, 1.000000, 0.989001);
		}
		case 232:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.082999, -0.000999,0.1 +  -0.001999, -85.499992, 10.300015, -92.800048, 1.020000, 1.000000, 0.989001);
		}
		case 233:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.052999, 0.025000, 0.1 + -0.001999, -85.499992, 10.300015, -92.800048, 1.020000, 1.000000, 0.989001);
		}
		case 234:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.062999, -0.003999,0.1 +  -0.001999, -85.499992, 10.300015, -92.800048, 1.020000, 1.000000, 0.989001);
		}
		case 235:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.042999, 0.003000, 0.1 + -0.001999, -85.499992, 10.300015, -92.800048, 1.020000, 1.000000, 0.989001);
		}
		case 236:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.070999, 0.021000, 0.1 + -0.001999, -85.499992, 10.300015, -92.800048, 1.020000, 1.000000, 0.989001);
		}
		case 237:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.070999, 0.006000, 0.1 + -0.001999, -85.499992, 10.300015, -92.800048, 1.020000, 1.000000, 0.989001);
		}
		case 238:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.070999, 0.027000, 0.1 + -0.001999, -85.499992, 10.300015, -92.800048, 1.020000, 1.000000, 0.989001);
		}
		case 239:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.097999, 0.015000, 0.1 + 0.004000, -85.499992, 10.300015, -92.800048, 1.020000, 1.000000, 0.989001);
		}
		case 240:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.071999, 0.021000, 0.1 + -0.001999, -85.499992, 10.300015, -92.800048, 1.020000, 1.000000, 0.989001);
		}
		case 241:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.059000, 0.048999, 0.1 + 0.000000, -86.900016, 1.399997, -94.800003, 1.000000, 1.000000, 1.000000);
		}
		case 242:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.059000, 0.025999, 0.1 + 0.001999, -86.900016, 1.399997, -94.800003, 1.000000, 1.000000, 1.000000);
		}
		case 243:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.059000, 0.025999, 0.1 + 0.001999, -86.900016, 1.399997, -94.800003, 1.000000, 1.000000, 1.000000);
		}
		case 244:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.059000, 0.048999, 0.1 + 0.001999, -86.900016, 1.399997, -94.800003, 1.000000, 1.000000, 1.000000);
		}
		case 245:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.063000, 0.026999, 0.1 + -0.001000, -86.900016, 9.399997, -94.800003, 1.095000, 1.000000, 1.000000);
		}
		case 246:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.063000, 0.043999, 0.1 + -0.001000, -86.900016, 9.399997, -94.800003, 0.939000, 1.000000, 1.000000);
		}
		case 247:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.087000, 0.034999, 0.1 + 0.003999, -86.900016, 9.399997, -94.800003, 0.982000, 1.000000, 1.000000);
		}
		case 248:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.087000, 0.034999, 0.1 + -0.001000, -86.900016, 9.399997, -94.800003, 0.982000, 1.000000, 1.000000);
		}
		case 249:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.078000, 0.034999, 0.1 + 0.006999, -86.900016, 9.399997, -94.800003, 1.033000, 1.000000, 1.000000);
		}
		case 250:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.078000, 0.031999, 0.1 + 0.000999, -86.900016, 9.399997, -94.800003, 1.033000, 1.000000, 1.000000);
		}
		case 251:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.063000, 0.031999, 0.1 + 0.000999, -86.900016, 9.399997, -94.800003, 1.033000, 1.000000, 1.000000);
		}
		case 252:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.094000, 0.023999, 0.1 + 0.002999, -86.900016, 9.399997, -94.800003, 1.033000, 1.000000, 1.000000);
		}
		case 253:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.081000, 0.016999, 0.1 + 0.002999, -86.900016, 9.399997, -94.800003, 1.033000, 1.000000, 1.000000);
		}
		case 254:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.093000, 0.021999, 0.1 + 0.002999, -86.900016, 9.399997, -94.800003, 1.058000, 1.000000, 1.000000);
		}
		case 255:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.079000, -0.001000,0.1 +  0.002999, -86.900016, 9.399997, -94.800003, 1.058000, 1.000000, 1.000000);
		}
		case 256:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.056000, 0.024999, 0.1 + 0.002999, -86.900016, 9.399997, -94.800003, 1.058000, 1.000000, 1.000000);
		}
		case 257:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.067000, 0.024999, 0.1 + -0.001000, -86.900016, 9.399997, -94.800003, 1.058000, 1.000000, 1.000000);
		}
		case 258:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.074000, 0.033999, 0.1 + -0.001000, -86.900016, 9.399997, -94.800003, 1.058000, 1.000000, 1.000000);
		}
		case 259:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.074000, 0.033999, 0.1 + -0.001000, -86.900016, 9.399997, -94.800003, 1.058000, 1.000000, 1.000000);
		}
		case 260:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.084000, 0.014999, 0.1 + 0.000999, -86.900016, 9.399997, -94.800003, 1.058000, 1.000000, 1.000000);
		}
		case 261:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.084000, 0.001999, 0.1 + 0.000999, -86.900016, 9.399997, -94.800003, 1.058000, 1.000000, 1.000000);
		}
		case 262:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.068000, 0.022999, 0.1 + 0.000999, -86.900016, 9.399997, -94.800003, 1.058000, 1.000000, 1.000000);
		}
		case 263:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.068000, 0.013999, 0.1 + 0.000999, -86.900016, 9.399997, -94.800003, 1.058000, 1.000000, 1.000000);
		}
		case 264:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.068000, 0.034999, 0.1 + 0.000999, -86.900016, 9.399997, -94.800003, 1.058000, 1.000000, 1.000000);
		}
		case 265:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.083000, 0.002999, 0.1 + 0.000999, -86.900016, 9.399997, -94.800003, 1.058000, 1.000000, 1.000000);
		}
		case 266:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.083000, 0.002999, 0.1 + 0.000999, -86.900016, 9.399997, -94.800003, 1.058000, 1.000000, 1.000000);
		}
		case 267:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.083000, 0.002999, 0.1 + 0.000999, -86.900016, 9.399997, -94.800003, 1.058000, 1.000000, 1.000000);
		}
		case 268:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.083000, 0.006999, 0.1 + 0.000999, -86.900016, 9.399997, -94.800003, 1.058000, 1.000000, 1.000000);
		}
		case 269:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.083000, 0.006999, 0.1 + 0.000999, -86.900016, 9.399997, -94.800003, 1.058000, 1.000000, 1.000000);
		}
		case 270:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.083000, 0.006999, 0.1 + 0.000999, -86.900016, 9.399997, -94.800003, 1.058000, 1.000000, 1.000000);
		}
		case 271:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.085000, 0.012999, 0.1 + 0.000999, -86.900016, 13.599996, -94.800003, 1.058000, 1.000000, 1.000000);
		}
		case 272:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.107000, 0.026999, 0.1 + 0.000999, -86.900016, 4.699994, -94.800003, 1.058000, 1.000000, 1.000000);
		}
		case 273:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.076000, 0.018999, 0.1 + 0.000999, -86.900016, 4.699994, -94.800003, 1.058000, 1.000000, 1.000000);
		}
		case 274:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.076000, 0.002999, 0.1 + 0.000999, -86.900016, 4.699994, -94.800003, 1.058000, 1.000000, 1.000000);
		}
		case 275:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.076000, 0.002999, 0.1 + 0.000999, -86.900016, 4.699994, -94.800003, 1.058000, 1.000000, 1.000000);
		}
		case 276:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.076000, 0.002999, 0.1 + 0.000999, -86.900016, 4.699994, -94.800003, 1.058000, 1.000000, 1.000000);
		}
		case 277:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.076000, 0.040000, 0.1 + 0.000999, -86.900016, 4.699994, -94.800003, 1.058000, 1.000000, 1.000000);
		}
		case 278:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.076000, 0.040000, 0.1 + 0.000999, -86.900016, 4.699994, -94.800003, 1.058000, 1.000000, 1.000000);
		}
		case 279:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.076000, 0.040000, 0.1 + 0.000999, -86.900016, 4.699994, -94.800003, 1.058000, 1.000000, 1.000000);
		}
		case 280:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.076000, 0.015000, 0.1 + -0.002000, -86.900016, 4.699994, -94.800003, 1.058000, 1.000000, 0.885999);
		}
		case 281:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.076000, 0.015000, 0.1 + -0.002000, -86.900016, 4.699994, -94.800003, 1.058000, 1.000000, 0.885999);
		}
		case 282:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.076000, 0.015000, 0.1 + -0.002000, -86.900016, 4.699994, -94.800003, 1.058000, 1.000000, 0.885999);
		}
		case 283:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.076000, 0.015000, 0.1 + -0.002000, -86.900016, 4.699994, -94.800003, 1.058000, 1.000000, 0.885999);
		}
		case 284:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.080000, 0.053999, 0.1 + 0.010999, -86.900016, 4.699994, -94.800003, 1.058000, 1.000000, 0.885999);
		}
		case 285:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.098000, 0.034999, 0.1 + 0.010999, -86.900016, 4.699994, -94.800003, 1.058000, 1.000000, 0.885999);
		}
		case 286:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.079000, 0.010999, 0.1 + 0.000999, -86.900016, 4.699994, -94.800003, 1.012000, 1.000000, 0.885999);
		}
		case 287:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.074000, 0.037999, 0.1 + 0.004999, -86.900016, 4.699994, -94.800003, 1.012000, 1.000000, 0.885999);
		}
		case 288:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.089000, 0.014999, 0.1 + -0.000000, -86.900016, 4.699994, -94.800003, 1.012000, 1.000000, 0.885999);
		}
		case 289:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.071000, 0.014999, 0.1 + -0.000000, -86.900016, 14.299993, -94.800003, 1.012000, 1.000000, 0.885999);
		}
		case 290:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.071000, 0.036999, 0.1 + -0.002000, -86.900016, 6.999991, -94.800003, 1.012000, 1.000000, 0.885999);
		}
		case 291:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.077000, 0.036999, 0.1 + -0.002000, -86.900016, 6.999991, -94.800003, 1.012000, 1.000000, 0.885999);
		}
		case 292:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.077000, 0.018999, 0.1 + -0.002000, -86.900016, 6.999991, -94.800003, 1.012000, 1.000000, 0.885999);
		}
		case 293:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.077000, 0.025999, 0.1 + -0.002000, -86.900016, 6.999991, -94.800003, 1.012000, 1.000000, 0.885999);
		}
		case 294:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.077000, 0.025999, 0.1 + -0.002000, -86.900016, 6.999991, -94.800003, 1.012000, 1.000000, 0.885999);
		}
		case 295:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.077000, 0.025999, 0.1 + -0.002000, -86.900016, 6.999991, -94.800003, 1.012000, 1.000000, 0.885999);
		}
		case 296:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.090000, 0.030999, 0.1 + 0.000999, -86.900016, 15.999993, -94.800003, 1.012000, 1.000000, 0.885999);
		}
		case 298:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.090000, 0.020989, 0.1 + -0.003010, -86.900009, 15.999990, -94.800003, 1.011999, 1.000000, 0.885990);
		}
		case 299:
		{
			SetPlayerAttachedObject(pid, SLOT_HEAD, bid, 2, 0.090000, 0.050989, 0.1 + 0.001990, -86.900009, 15.999990, -94.800003, 1.011999, 1.000000, 0.885990);
		}
	}
}

stock get_mktime(hour=0,minutez=0,second=0,day=0,month=0,year=0) 
{
    new timestamp2;
	new Hour, Minute, Second, Year, Month, Day;

    gettime(Hour, Minute, Second);
    getdate(Year, Month, Day);

    hour += Hour;
    minutez += Minute;
    second += Second;
    year += Year;
    month += Month;
    day += Day;
 
    timestamp2 = second + (minutez * 60) + (hour * 3600);
 
    new days_of_month[12];
 
    if ( ((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0) ) 
    {
        days_of_month = {31,29,31,30,31,30,31,31,30,31,30,31}; // Schaltjahr
    
    } else {

        days_of_month = {31,28,31,30,31,30,31,31,30,31,30,31}; // keins
    }
    
    new days_this_year = 0;
    days_this_year = day;

    if(month > 1) // No January Calculation, because its always the 0 past months
    {
        for(new i=0; i<month-1;i++) 
        {
            days_this_year += days_of_month[i];
        }
    }

    timestamp2 += days_this_year * 86400;
 
    for(new j=1970;j<year;j++) 
    {
        timestamp2 += 31536000;
        if ( ((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0) )
        {
        	timestamp2 += 86400; // Schaltjahr + 1 Tag
        }
    }
 
    return timestamp2;
}

stock destroyDynamicArea(areaid)
{
    foreach(new i : Player)
    {
        if(IsPlayerInDynamicArea(i, areaid))
        {
            OnPlayerLeaveDynamicArea(i, areaid);
        }
    }
    return DestroyDynamicArea(areaid);
}

stock strtok(const string[], &index)
{
	new const length = strlen(string);
	while ((index < length) && (string[index] <= ' '))
	{
		index++;
	}
 
	new const offset = index;
	new result[20];
	while ((index < length) && (string[index] > ' ') && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	return result;
}

func printShopItems()
{
	for(new i; shops:i != shops; ++i)
	{
		gt[0] = EOS;
		switch(i)
		{
			case shop_spawn:
			{
				for(new j; j != MAX_ITEM; ++j)
				{
					switch(j)
					{
						case shop_spawn_prekes:
						{
							strcat(gt, f("%i/%i/0|", j, random(30)));
						}
					}
				}
				printf("shop_spawn:\n%s", gt);
			}
			case shop_baras:
			{
				for(new j; j != MAX_ITEM; ++j)
				{
					switch(j)
					{
						case shop_baras_prekes:
						{
							strcat(gt, f("%i/%i/0|", j, random(20)));
						}
					}
				}
				printf("shop_baras:\n%s", gt);
			}
			case shop_gunshop:
			{
				for(new j; j != MAX_ITEM; ++j)
				{
					switch(j)
					{
						case shop_gunshop_prekes:
						{
							strcat(gt, f("%i/%i/0|", j, item.flag.get(j, IS_WEAPON)?random(4):random(60)));
						}
					}
				}
				printf("shop_gunshop:\n%s", gt);
			}
			case shop_foodstore:
			{
				for(new j; j != MAX_ITEM; ++j)
				{
					switch(j)
					{
						case shop_foodstore_prekes:
						{
							strcat(gt, f("%i/%i/0|", j, random(20)));
						}
					}
				}
				printf("shop_foodstore:\n%s", gt);
			}
			case shop_clothes:
			{
				for(new j; j != MAX_ITEM; ++j)
				{
					switch(j)
					{
						case shop_clothes_prekes:
						{
							strcat(gt, f("%i/%i/0|", j, random(10)));
						}
					}
				}
				printf("shop_clothes:\n%s", gt);
			}
		}
	}
}