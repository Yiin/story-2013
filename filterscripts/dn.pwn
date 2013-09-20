//------------------------------------------------------------------------------
//
//   TowCars Filter Script v1.0
//   Designed for SA-MP v0.2.2
//
//   Created by zeruel_angel
//
//------------------------------------------------------------------------------
#include <a_samp>
#include <zcmd>

#define F(%1) (format(g_szSprintfBuffer, sizeof(g_szSprintfBuffer), %1), g_szSprintfBuffer)
new g_szSprintfBuffer[100];


CMD:jail(playerid, params[])
{
    SetPlayerPos(playerid, 628.03100585938, -562.19897460938, 4007.7858886719);
    return 1;
}

CMD:wang(playerid, params[])
{
	return SetPlayerPos(playerid, 259.874755, -260.012145, 1.624143);
}

CMD:jailas(playerid, params[])
{
 SetPlayerPos(playerid, 579.92797851563, -581.55102539063, 4005.50390625);
 return 1;
}

CMD:naktis(playerid, params[])
{
	SetWorldTime(1);
	return 1;
}

CMD:vm(pid, params[], help)
{
	SetPlayerInterior(pid, 3);
	SetPlayerPos(pid, 1245.8076171875, 253.6513671875, 20135.7890625 + 1);
	return 1;
}

CMD:int(pid)
{
    SetPlayerInterior(pid, 0);
	return 1;
}

CMD:keys(playerid, params[])
{
	SetPVarInt(playerid, "keys", strval(params));
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(GetPVarInt(playerid, "keys"))
        SendClientMessage(playerid, -1, F("newkeys : %i\toldkeys : %i", newkeys, oldkeys));
	return 1;
}

CMD:ribos(playerid) return SetPlayerWorldBounds(playerid, 5000, -5000, 5000, -5000), 1;

CMD:akras(playerid)
{
 SetPlayerPos(playerid, 2258.6879882813, 58.721000671387, 6714.6030273438);
 return 1;
}

CMD:diena(playerid, params[])
{
 	SetWorldTime(11);
	return 1;
}

CMD:masina(playerid, params[])
{
    AddStaticVehicle(411,104.2621,-149.9144,2367.4868,89.9580,123,1); // car vieta 1
    return 1;
}

CMD:s0(playerid)
{
	SetPlayerColor(playerid, 0);
	return 1;
}

CMD:s1(playerid)
{
	SetPlayerColor(playerid, 1);
	return 1;
}

CMD:s2(playerid)
{
	SetPlayerColor(playerid, 2);
	return 1;
}

CMD:s3(playerid)
{
	SetPlayerColor(playerid, 3);
	return 1;
}

CMD:color(playerid)
{
	SetPlayerColor(playerid, -6710887);
	return 1;
}

CMD:r(playerid)
{
    // Medikai
	RemoveBuildingForPlayer(playerid, 13221, 1242.1016, 315.1484, 18.5547, 0.25);
	RemoveBuildingForPlayer(playerid, 13222, 1279.0703, 292.2734, 23.0547, 0.25);
	RemoveBuildingForPlayer(playerid, 13223, 1279.0703, 292.2734, 23.0547, 0.25);
	RemoveBuildingForPlayer(playerid, 13485, 1304.3047, 330.1563, 23.7031, 0.25);
	RemoveBuildingForPlayer(playerid, 13441, 1338.0625, 198.7344, 30.0234, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, 1209.9766, 294.0547, 23.0078, 0.25);
	RemoveBuildingForPlayer(playerid, 700, 1231.9531, 287.9375, 19.2266, 0.25);
	RemoveBuildingForPlayer(playerid, 1687, 1237.3047, 306.9375, 24.5625, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 1229.3750, 286.6094, 18.8203, 0.25);
	RemoveBuildingForPlayer(playerid, 700, 1250.6094, 279.4063, 19.2266, 0.25);
	RemoveBuildingForPlayer(playerid, 1689, 1247.9453, 303.4688, 28.9063, 0.25);
	RemoveBuildingForPlayer(playerid, 1687, 1247.4141, 294.2031, 28.5391, 0.25);
	RemoveBuildingForPlayer(playerid, 1687, 1248.1094, 295.7969, 28.5391, 0.25);
	RemoveBuildingForPlayer(playerid, 12985, 1276.9766, 306.8516, 22.3125, 0.25);
	RemoveBuildingForPlayer(playerid, 12986, 1272.2500, 295.2500, 20.0781, 0.25);
	RemoveBuildingForPlayer(playerid, 1687, 1269.8438, 272.5938, 23.3203, 0.25);
	RemoveBuildingForPlayer(playerid, 1438, 1274.8750, 307.0469, 18.5313, 0.25);
	RemoveBuildingForPlayer(playerid, 1438, 1276.4766, 285.8516, 18.5313, 0.25);
	RemoveBuildingForPlayer(playerid, 12983, 1242.1016, 315.1484, 18.5547, 0.25);
	RemoveBuildingForPlayer(playerid, 1688, 1222.2969, 311.9609, 24.7578, 0.25);
	RemoveBuildingForPlayer(playerid, 1368, 1262.3281, 320.3438, 19.4375, 0.25);
	RemoveBuildingForPlayer(playerid, 1368, 1257.9375, 322.2734, 19.4375, 0.25);
	RemoveBuildingForPlayer(playerid, 1690, 1254.8516, 316.2031, 24.3984, 0.25);
	RemoveBuildingForPlayer(playerid, 1688, 1274.9609, 317.5234, 26.0234, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 1272.3359, 322.4297, 18.8203, 0.25);
	RemoveBuildingForPlayer(playerid, 781, 1267.8750, 322.4453, 18.4688, 0.25);
	RemoveBuildingForPlayer(playerid, 781, 1261.0469, 325.2734, 18.4688, 0.25);
	RemoveBuildingForPlayer(playerid, 1368, 1232.1641, 333.7188, 19.4375, 0.25);
	RemoveBuildingForPlayer(playerid, 1368, 1236.5547, 331.7891, 19.4375, 0.25);
	RemoveBuildingForPlayer(playerid, 781, 1231.7031, 338.1953, 18.4688, 0.25);
	RemoveBuildingForPlayer(playerid, 12846, 1283.8906, 265.9609, 22.8359, 0.25);
	RemoveBuildingForPlayer(playerid, 1688, 1282.8984, 271.1875, 23.7422, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 1284.4844, 262.1172, 18.8203, 0.25);
	RemoveBuildingForPlayer(playerid, 1495, 1288.0078, 270.6719, 18.5469, 0.25);
	RemoveBuildingForPlayer(playerid, 12984, 1279.0703, 292.2734, 23.0547, 0.25);
	RemoveBuildingForPlayer(playerid, 12987, 1284.3750, 293.9297, 22.3125, 0.25);
	RemoveBuildingForPlayer(playerid, 13022, 1279.0703, 292.2734, 23.0547, 0.25);
	RemoveBuildingForPlayer(playerid, 1691, 1278.7344, 274.0859, 23.1484, 0.25);
	RemoveBuildingForPlayer(playerid, 1687, 1288.5391, 289.9297, 25.5625, 0.25);
	RemoveBuildingForPlayer(playerid, 1690, 1289.9063, 300.3203, 28.1953, 0.25);
	RemoveBuildingForPlayer(playerid, 1688, 1292.3203, 305.2813, 27.5469, 0.25);
	RemoveBuildingForPlayer(playerid, 1691, 1297.5234, 308.0703, 26.9453, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, 1306.1641, 308.9063, 23.0078, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, 1230.8516, 341.9219, 23.0078, 0.25);
	RemoveBuildingForPlayer(playerid, 13440, 1282.2422, 369.1406, 28.7578, 0.25);

	// Namukai taxi
	RemoveBuildingForPlayer(playerid, 3326, 2321.3594, -127.0469, 28.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 3327, 2296.3594, -127.0469, 28.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 3329, 2275.4688, -127.4844, 26.4688, 0.25);
	RemoveBuildingForPlayer(playerid, 13461, 2373.2344, 29.1719, 30.3438, 0.25);
	RemoveBuildingForPlayer(playerid, 3328, 2242.3750, -127.4844, 26.4688, 0.25);
	RemoveBuildingForPlayer(playerid, 13374, 2241.4063, 21.4609, 33.1719, 0.25);
	RemoveBuildingForPlayer(playerid, 779, 2236.6953, -118.9609, 25.9531, 0.25);
	RemoveBuildingForPlayer(playerid, 779, 2236.9609, -112.5547, 25.6563, 0.25);
	RemoveBuildingForPlayer(playerid, 1419, 2236.2500, -108.3594, 25.9766, 0.25);
	RemoveBuildingForPlayer(playerid, 3315, 2242.3750, -127.4844, 26.4688, 0.25);
	RemoveBuildingForPlayer(playerid, 1419, 2242.0313, -108.3594, 25.9766, 0.25);
	RemoveBuildingForPlayer(playerid, 1419, 2244.1172, -110.4531, 26.1875, 0.25);
	RemoveBuildingForPlayer(playerid, 1419, 2244.1172, -114.5469, 26.5938, 0.25);
	RemoveBuildingForPlayer(playerid, 3407, 2244.6328, -108.7188, 25.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 3314, 2275.4688, -127.4844, 26.4688, 0.25);
	RemoveBuildingForPlayer(playerid, 764, 2272.9297, -141.8906, 26.0313, 0.25);
	RemoveBuildingForPlayer(playerid, 782, 2267.9141, -110.4922, 25.5547, 0.25);
	RemoveBuildingForPlayer(playerid, 3408, 2267.1016, -108.5078, 25.4844, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 2283.9531, -108.0938, 25.6797, 0.25);
	RemoveBuildingForPlayer(playerid, 1446, 2283.8750, -143.4453, 28.1797, 0.25);
	RemoveBuildingForPlayer(playerid, 1446, 2283.8750, -138.7109, 28.1797, 0.25);
	RemoveBuildingForPlayer(playerid, 1446, 2283.8750, -133.9766, 28.1797, 0.25);
	RemoveBuildingForPlayer(playerid, 1446, 2283.8750, -129.2500, 28.1797, 0.25);
	RemoveBuildingForPlayer(playerid, 1446, 2283.8750, -124.5078, 28.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 1446, 2283.8750, -119.7813, 27.7578, 0.25);
	RemoveBuildingForPlayer(playerid, 1446, 2283.8750, -115.0781, 27.5234, 0.25);
	RemoveBuildingForPlayer(playerid, 1446, 2283.8750, -110.8125, 27.3125, 0.25);
	RemoveBuildingForPlayer(playerid, 3316, 2296.3594, -127.0469, 28.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 780, 2288.2578, -116.6875, 25.7891, 0.25);
	RemoveBuildingForPlayer(playerid, 3408, 2295.0391, -108.6094, 25.4844, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, 2309.0000, -106.7031, 29.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 769, 2313.6484, -141.6328, 26.4688, 0.25);
	RemoveBuildingForPlayer(playerid, 765, 2311.9922, -111.7656, 25.5313, 0.25);
	RemoveBuildingForPlayer(playerid, 1407, 2311.6875, -108.4219, 26.2109, 0.25);
	RemoveBuildingForPlayer(playerid, 1407, 2306.2344, -108.4219, 26.2109, 0.25);
	RemoveBuildingForPlayer(playerid, 3317, 2321.3594, -127.0469, 28.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1407, 2316.4297, -108.4219, 26.2109, 0.25);
	RemoveBuildingForPlayer(playerid, 3407, 2323.2969, -108.7188, 25.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 2333.7891, -108.1172, 25.6797, 0.25);

	// Gaujos baze
	RemoveBuildingForPlayer(playerid, 12937, 873.9922, -22.7578, 65.1016, 0.25);
	RemoveBuildingForPlayer(playerid, 12957, 861.5234, -25.3828, 62.8516, 0.25);
	RemoveBuildingForPlayer(playerid, 3276, 884.3281, -20.7344, 63.0938, 0.25);
	RemoveBuildingForPlayer(playerid, 3276, 894.4531, -25.7734, 63.1484, 0.25);
	RemoveBuildingForPlayer(playerid, 3276, 877.2109, -23.4844, 63.0547, 0.25);
	RemoveBuildingForPlayer(playerid, 3276, 891.4531, -18.3906, 63.0547, 0.25);
	RemoveBuildingForPlayer(playerid, 3276, 854.2578, -20.0078, 63.0156, 0.25);
	RemoveBuildingForPlayer(playerid, 13360, 870.5391, -24.6016, 64.1172, 0.25);
	RemoveBuildingForPlayer(playerid, 3275, 866.2266, -8.4688, 62.8984, 0.25);
	RemoveBuildingForPlayer(playerid, 3275, 879.2578, -14.2109, 63.0234, 0.25);
	RemoveBuildingForPlayer(playerid, 3276, 857.5313, -11.9688, 63.3281, 0.25);
	return 1;
}
