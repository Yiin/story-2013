#include <a_samp>
#include <core>
#include <float>

new glob0 = -1;

new glob4;

new glob8[3184];

new glob31C8;

new glob31CC;

new glob31D0[21] = { 40, 39, 38, 37, 36, 35, 34, 33, 32, 31, 30, 29, 28, 27, 26, 25, 24, 23, 22, 21, 20 };

new glob3224;

new glob3228[21] = { 40, 39, 38, 37, 36, 35, 34, 33, 32, 31, 30, 29, 28, 27, 26, 25, 24, 23, 22, 21, 20 };

new glob327C;

new glob3280[21] = { 40, 39, 38, 37, 36, 35, 34, 33, 32, 31, 30, 29, 28, 27, 26, 25, 24, 23, 22, 21, 20 };

new glob3514;

new glob3518;

new glob351C;

new glob3520;

new glob3524;

new glob3528;

new glob352C;

new glob3530;

new glob3534[889];

new glob4318[213] = { 852, 1868, 2884, 3900, 4916, 5932, 6948, 7964, 8980, 9996, 11012, 12028, 13044, 14060, 15076, 16092, 17108, 18124, 19140, 20156, 21172,
22188, 23204, 24220, 25236, 26252, 27268, 28284, 29300, 30316, 31332, 32348, 33364, 34380, 35396, 36412, 37428, 38444, 39460, 40476, 41492, 42508, 43524, 44540,
45556, 46572, 47588, 48604, 49620, 50636, 51652, 52668, 53684, 54700, 55716, 56732, 57748, 58764, 59780, 60796, 61812, 62828, 63844, 64860, 65876, 66892, 67908,
68924, 69940, 70956, 71972, 72988, 74004, 75020, 76036, 77052, 78068, 79084, 80100, 81116, 82132, 83148, 84164, 85180, 86196, 87212, 88228, 89244, 90260, 91276,
92292, 93308, 94324, 95340, 96356, 97372, 98388, 99404, 100420, 101436, 102452, 103468, 104484, 105500, 106516, 107532, 108548, 109564, 110580, 111596, 112612,
113628, 114644, 115660, 116676, 117692, 118708, 119724, 120740, 121756, 122772, 123788, 124804, 125820, 126836, 127852, 128868, 129884, 130900, 131916, 132932,
133948, 134964, 135980, 136996, 138012, 139028, 140044, 141060, 142076, 143092, 144108, 145124, 146140, 147156, 148172, 149188, 150204, 151220, 152236, 153252,
154268, 155284, 156300, 157316, 158332, 159348, 160364, 161380, 162396, 163412, 164428, 165444, 166460, 167476, 168492, 169508, 170524, 171540, 172556, 173572,
174588, 175604, 176620, 177636, 178652, 179668, 180684, 181700, 182716, 183732, 184748, 185764, 186780, 187796, 188812, 189828, 190844, 191860, 192876, 193892,
194908, 195924, 196940, 197956, 198972, 199988, 201004, 202020, 203036, 204052, 205068, 206084, 207100, 208116, 209132, 210148, 211164, 212180, 213196, 214212,
215228, 216244 };

new glob39718[100][20];

new glob3EA04;

new glob3EA08[199];

new glob3ED24[20][4];

new glob3EEB4[20][256];

new glob43F04[102][2] = {
	{ 180, 300 },
	{ 80, 1400 },
	{ 0, 10 },
	{ 0, 10 },
	{ 0, 10 },
	{ 0, 10 },
	{ 5, 5 },
	{ 0, 10 },
	{ 200, 900 },
	{ 1, 2 },
	{ 200, 4000 },
	{ 40, 200 },
	{ 4, 250 },
	{ 30, 200 },
	{ 0, 0 },
	{ 60, 100 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 0, 0 },
	{ 80, 20000 },
	{ 0, 100 },
	{ 0, 100 },
	{ 0, 100 },
	{ 0, 100 },
	{ 0, 100 },
	{ 0, 100 },
	{ 0, 100 },
	{ 0, 100 },
	{ 0, 100 },
	{ 0, 100 },
	{ 0, 100 },
	{ 0, 100 },
	{ 0, 100 },
	{ 0, 100 },
	{ 0, 100 },
	{ 0, 100 },
	{ 0, 100 },
	{ 0, 100 },
	{ 0, 100 },
	{ 0, 100 },
	{ 0, 100 },
	{ 0, 100 },
	{ 0, 100 },
	{ 0, 100 },
	{ 0, 100 },
	{ 0, 100 },
	{ 0, 100 },
	{ 0, 100 },
	{ 0, 100 },
	{ 0, 100 },
	{ 0, 100 },
	{ 0, 10 },
	{ 0, 10 },
	{ 0, 10 },
	{ 0, 10 }
};

new glob443CC[2] = 	"xMechanikai - Masinu taisykla";

new glob44490[102][1] = {
	"GPS",
	"Radija",
	"Darbo raktai",
	"Mechaniku masinos raktai",
	"Masinos raktai",
	"Verslo raktai",
	"Cigaretes",
	"KMA raktai",
	"Meskere",
	"Sliekai",
	"Nepersaunama liemene",
	"Viskis",
	"Alus",
	"Degtine",
	"Pinigai",
	"Kastetas",
	"Beisbolo lazda",
	"Policijos lazda",
	"Bilijardo lazda",
	"Golfo lazda",
	"Kastuvas",
	"Peilis",
	"Katana",
	"Benzininis pjuklas",
	"9mm",
	"Tazeris",
	"Deagle",
	"Shotgun",
	"Sawnoff Shotgun",
	"Combat Shotgun",
	"Uzi",
	"Mp5",
	"Ak47",
	"M4",
	"Tec-9",
	"Rifle",
	"Awp",
	"Molotovo kokteilis",
	"Granata",
	"Dujine granata",
	"Nuotolines bombos",
	"Ugniasvaidis",
	"Vulcan mini gun",
	"Raketsvaidis",
	"Termo-raketsvaidis",
	"Flakonelis",
	"Fotoparatas",
	"Gesintuvas",
	"Parasiutas",
	"Termo-akiniai",
	"Naktinio matymo akiniai",
	"Jetpack",
	"Nuot. bombu detonatorius",
	"Lazda",
	"Geles",
	"Dildo-1",
	"Dildo-2",
	"Vibratorius-1",
	"Vibratorius-2",
	"Telefonas",
	"Kulkos (P)",
	"Kulkos (SMG)",
	"Kulkos (S)",
	"Kulkos (R)",
	"Kulkos (A)",
	"Kulkos (B)",
	"Degalu kanistras",
	"Eserys",
	"Karpis",
	"lydeka",
	"karosas",
	"tunas",
	"lasisa",
	"pleksne",
	"menke",
	"raude",
	"skumbre",
	"starkis",
	"samas",
	"ungurys",
	"upetakis",
	"(maistas) eserys",
	"(maistas) karpis",
	"(maistas) lydeka",
	"(maistas) karosas",
	"(maistas) tunas",
	"(maistas) lasisa",
	"(maistas) pleksne",
	"(maistas) menke",
	"(maistas) raude",
	"(maistas) skumbre",
	"(maistas) starkis",
	"(maistas) samas",
	"(maistas) ungurys",
	"(maistas) upetakis",
	"(maistas) ikrai",
	"(maistas) duona",
	"(maistas) obuolys",
	"Policijos masinos raktai",
	"Mediku masinos raktai",
	"Taksi masinos raktai",
	"Gaisrines masinos raktai"
};

new glob4597C[20][102];

new glob479AC[20];

new glob479FC[20];

new glob47A4C[20][103];

new glob49ACC[20][18];

new glob4A0BC[20][5];

new glob4A33C[20][15];

new glob4A88C = 65535;

new glob4A890[20];

new glob4A8E0[20];

new glob4A930[20][10];

new glob4AD90[20][1];

new glob4AE30[20];

new glob4AE80[20];

new glob4AED0[20][19];

new glob4B510[100][4];

new Float:glob4BCE0[20][4];

new glob4BE70[8][9] = {
	{ 49, 53, 52, 0, 53, 48, 0, 0, 15000 },
	{ 49, 49, 53, 0, 52, 48, 0, 0, 8000 },
	{ 49, 53, 48, 0, 52, 48, 0, 0, 14200 },
	{ 49, 51, 51, 0, 54, 48, 0, 0, 13200 },
	{ 49, 52, 54, 0, 52, 48, 0, 0, 13800 },
	{ 49, 48, 53, 0, 49, 53, 0, 0, 4000 },
	{ 49, 51, 54, 0, 52, 48, 0, 0, 8000 },
	{ 49, 50, 53, 0, 53, 53, 0, 0, 13200 }
};

new glob4BFB0[20][1];

new glob4C050[20];

new glob4C230[5][101];

new glob4CA28[20];

new glob4CA78[100][2];

new glob4CF28[8];

new glob4CF48[8];

new glob4CF68;

new glob4CF6C;

new glob4CF70;

new glob4CF74;

new glob4CF78;

new glob4CF7C;

new glob4CF80;

new glob4CF84;

new glob4CF88;

new glob4CF8C;

new glob4CF90;

new glob4CF94;

new glob4CF98;

new glob4CF9C;

new glob4CFA0;

new glob4CFA4;

new glob4CFA8;

new glob4CFAC[8];

new glob4CFCC[20][4];

new glob4D15C[20][5];

new glob4D33C[20];

new glob4D38C[20];

new glob4D3DC[20];

new glob4D42C[2050];

new glob4F434;

new glob4F438;

new glob4F43C[18][2] = {
	{ 469, -258 },
	{ 895, -109 },
	{ 921, -113 },
	{ 950, -117 },
	{ 973, -121 },
	{ 997, -112 },
	{ 1011, -99 },
	{ 1038, -94 },
	{ 1074, -91 },
	{ 1108, -81 },
	{ 850, -138 },
	{ 892, -130 },
	{ 933, -127 },
	{ 1005, -128 },
	{ 1053, -132 },
	{ 1085, -124 },
	{ 1127, -121 },
	{ 1187, -122 }
};

new glob4F514[20];

new glob4F564[100];

new glob4F6F4[20];

new glob4F744[100];

new glob4F8D4[20];

new glob4F924[20];

new glob4F974[20][2];

new glob4FA64[2];

new glob4FA6C[20];

new Text:glob4FABC;

new glob4FAC0[20];

new glob4FB10[20];

new Text:glob4FB60[10];

new glob4FB88[20][65];

new Text:glob51028[22];

new glob51080[20];

new Text:glob510D0;

new glob510D4;

new Text:glob510D8;

new Text:glob510DC;

new Text:glob510E0;

new glob510E4[20];

new glob51134[20];

new glob51184[20];

new glob511D4[20];

new glob51224[20];

new glob51274[20];

new glob512C4[20];

new glob51314[20];

new glob51364[20];

new glob513B4[20];

new glob51404[20];

new glob51454[20];

new glob514A4[20];

new glob514F4[20];

new glob51544[20];

new glob51594[20];

new glob515E4[20];

new glob51634[20];

new glob51684[20];

new glob516D4[20];

new glob51724[20];

new glob51774[20];

new glob517C4[20];

new glob51814[20];

new glob51864[20];

new glob518B4[20];

new glob51904[20];

new glob51954[20];

new glob519A4[20];

new glob519F4[20];

new glob51A44[20];

new glob51A94[20];

new glob51AE4[20];

new Text:glob51B34;

new Text:glob51B38;

new Text:glob51B3C;

new Text:glob51B40;

new Text:glob51B44;

new Text:glob51B48;

new Text:glob51B4C;

new Text:glob51B50;

new Text:glob51B54;

new Text:glob51B58;

new Text:glob51B5C;

new glob51B60 = 65535;

new Text:glob51B64 = 65535;

new Text:glob51B68 = 65535;

new Text:glob51B6C = 65535;

new Text:glob51B70 = 65535;

new Text:glob51B74 = 65535;

new glob51B78[20] = { 65535, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };

new glob51BC8[20] = { 65535, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };

new glob51C18[20] = { 65535, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };

new glob51C68[20];

new glob51CB8[20];

new Text:glob51D08;

new Text:glob51D0C;

new Text:glob51D10;

new Text:glob51D14;

new Text:glob51D18;

new Text:glob51D1C;

new Text:glob51D20;

new Text:glob51D24;

new Text:glob51D28;

new Text:glob51D2C;

new Text:glob51D30;

new Text:glob51D34;

new Text:glob51D38;

new Text:glob51D3C;

new Text:glob51D40;

new Text:glob51D44;

new Text:glob51D48;

new Text:glob51D4C;

new Text:glob51D50;

new Text:glob51D54;

new Text:glob51D58;

new glob51D5C;

new Text:glob51D60;

new Text:glob51D64;

new Text:glob51D68;

new Text:glob51D6C;

new glob51D70;

new glob51D74;

new Text:glob51D78;

new glob51D7C[20];

new glob51DCC[20];

new glob51E1C[20];

new Float:glob53FE8[20][85][8];

new glob62F48[85][3];

new glob634C4[20] = { 80, 108, 136, 164, 192, 220, 248, 276, 304, 332, 360, 388, 416, 444, 472, 500, 528, 556, 584, 612 };

new glob637C4[10];

new glob637EC[20] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 };

new glob6383C[20];

new glob63D6C[20];

new glob64244[20];

new glob64294[20];

new glob642E4[20];

new glob6FB08[20];

new glob6FB58[2251];

new glob71E84[20][3];

new glob74564[20];

new glob760F8[20];

new glob76148[20][2];

new glob76238[100][2];


function168(arg0, Float:arg1)
{
	return arg0 - arg1;
}

function1B8(Float:arg0, Float:arg1)
{
	return floatcmp(arg0, arg1) == 0;
}

function33C(arg0, Float:arg1)
{
	return floatcmp(arg0, arg1) < 0;
}

public OnFilterScriptInit()
{
	SSCANF_Init(GetMaxPlayers(), 65535, 24);
	glob0 = funcidx(12) != -1;
	glob4 = funcidx(100) != -1;
	glob8 = funcidx(192) != -1;
	return CallLocalFunction(296, 400);
}

public OnGameModeInit()
{
	if(glob0 == -1)
	{
		SSCANF_Init(GetMaxPlayers(), 65535, 24);
		glob0 = funcidx(404) != -1;
		glob4 = funcidx(492) != -1;
		glob8 = funcidx(584) != -1;
	}
	if(glob0)
	{
		return CallLocalFunction(688, 776);
	}
	return 1;
}

public OnPlayerConnect(playerid)
{
	new var0[24];
	GetPlayerName(playerid, var0, 24);
	SSCANF_Join(playerid, var0, IsPlayerNPC(playerid));
	if(glob4)
	{
		return CallLocalFunction(780, 872, playerid);
	}
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	new var0 = 1;
	if(glob8)
	{
		var0 = CallLocalFunction(880, 984, playerid, reason);
	}
	SSCANF_Leave(playerid);
	return var0;
}

public sscanf_weapon(arg0)
{
	if((57 >= arg0) & (48 <= arg0))
	{
		new var0 = strval(arg0);
		if((var0 <= 18) & (0 <= var0) || (var0 <= 46) & (22 <= var0))
		{
			return var0;
		}
	}
	else
	{
		if(!strcmp(arg0, "Unarmed"))
		{
			return 0;
		}
		if(!strcmp(arg0, "Brass Knuckles"))
		{
			return 1;
		}
		if(!strcmp(arg0, "Golf Club"))
		{
			return 2;
		}
		if(!strcmp(arg0, "Night Stick"))
		{
			return 3;
		}
		if(!strcmp(arg0, "Knife"))
		{
			return 4;
		}
		if(!strcmp(arg0, "Baseball Bat"))
		{
			return 5;
		}
		if(!strcmp(arg0, "Shovel"))
		{
			return 6;
		}
		if(!strcmp(arg0, "Pool cue"))
		{
			return 7;
		}
		if(!strcmp(arg0, "Katana"))
		{
			return 8;
		}
		if(!strcmp(arg0, "Chainsaw"))
		{
			return 9;
		}
		if(!strcmp(arg0, "Purple Dildo"))
		{
			return 10;
		}
		if(!strcmp(arg0, "White Dildo"))
		{
			return 11;
		}
		if(!strcmp(arg0, "Long White Dildo"))
		{
			return 12;
		}
		if(!strcmp(arg0, "White Dildo 2"))
		{
			return 13;
		}
		if(!strcmp(arg0, "Flowers"))
		{
			return 14;
		}
		if(!strcmp(arg0, "Cane"))
		{
			return 15;
		}
		if(!strcmp(arg0, "Grenades"))
		{
			return 16;
		}
		if(!strcmp(arg0, "Tear Gas"))
		{
			return 17;
		}
		if(!strcmp(arg0, "Molotovs"))
		{
			return 18;
		}
		if(!strcmp(arg0, "Pistol"))
		{
			return 22;
		}
		if(!strcmp(arg0, "Silenced Pistol"))
		{
			return 23;
		}
		if(!strcmp(arg0, "Desert Eagle"))
		{
			return 24;
		}
		if(!strcmp(arg0, "Shotgun"))
		{
			return 25;
		}
		if(!strcmp(arg0, "Sawn Off Shotgun"))
		{
			return 26;
		}
		if(!strcmp(arg0, "Combat Shotgun"))
		{
			return 27;
		}
		if(!strcmp(arg0, "Micro Uzi"))
		{
			return 28;
		}
		if(!strcmp(arg0, "Mac 10"))
		{
			return 28;
		}
		if(!strcmp(arg0, "MP5"))
		{
			return 29;
		}
		if(!strcmp(arg0, "AK47"))
		{
			return 30;
		}
		if(!strcmp(arg0, "M4"))
		{
			return 31;
		}
		if(!strcmp(arg0, "Tec9"))
		{
			return 32;
		}
		if(!strcmp(arg0, "Rifle"))
		{
			return 33;
		}
		if(!strcmp(arg0, "Sniper Rifle"))
		{
			return 34;
		}
		if(!strcmp(arg0, "RPG"))
		{
			return 35;
		}
		if(!strcmp(arg0, "Missile Launcher"))
		{
			return 36;
		}
		if(!strcmp(arg0, "Flame Thrower"))
		{
			return 37;
		}
		if(!strcmp(arg0, "Minigun"))
		{
			return 38;
		}
		if(!strcmp(arg0, "Sachel Charges"))
		{
			return 39;
		}
		if(!strcmp(arg0, "Detonator"))
		{
			return 40;
		}
		if(!strcmp(arg0, "Spray Paint"))
		{
			return 41;
		}
		if(!strcmp(arg0, "Fire Extinguisher"))
		{
			return 42;
		}
		if(!strcmp(arg0, "Camera"))
		{
			return 43;
		}
		if(!strcmp(arg0, "Nightvision Goggles"))
		{
			return 44;
		}
		if(!strcmp(arg0, "Thermal Goggles"))
		{
			return 45;
		}
		if(!strcmp(arg0, "Parachute"))
		{
			return 46;
		}
	}
	return -1;
}

public sscanf_vehicle(arg0)
{
	if((57 >= arg0) & (48 <= arg0))
	{
		new var0 = strval(arg0);
		if((611 >= var0) & (400 <= var0))
		{
			return var0;
		}
	}
	else
	{
		if(!strcmp(arg0, "Landstalker"))
		{
			return 400;
		}
		if(!strcmp(arg0, "Bravura"))
		{
			return 401;
		}
		if(!strcmp(arg0, "Buffalo"))
		{
			return 402;
		}
		if(!strcmp(arg0, "Linerunner"))
		{
			return 403;
		}
		if(!strcmp(arg0, "Perenniel"))
		{
			return 404;
		}
		if(!strcmp(arg0, "Sentinel"))
		{
			return 405;
		}
		if(!strcmp(arg0, "Dumper"))
		{
			return 406;
		}
		if(!strcmp(arg0, "Firetruck"))
		{
			return 407;
		}
		if(!strcmp(arg0, "Trashmaster"))
		{
			return 408;
		}
		if(!strcmp(arg0, "Stretch"))
		{
			return 409;
		}
		if(!strcmp(arg0, "Manana"))
		{
			return 410;
		}
		if(!strcmp(arg0, "Infernus"))
		{
			return 411;
		}
		if(!strcmp(arg0, "Voodoo"))
		{
			return 412;
		}
		if(!strcmp(arg0, "Pony"))
		{
			return 413;
		}
		if(!strcmp(arg0, "Mule"))
		{
			return 414;
		}
		if(!strcmp(arg0, "Cheetah"))
		{
			return 415;
		}
		if(!strcmp(arg0, "Ambulance"))
		{
			return 416;
		}
		if(!strcmp(arg0, "Leviathan"))
		{
			return 417;
		}
		if(!strcmp(arg0, "Moonbeam"))
		{
			return 418;
		}
		if(!strcmp(arg0, "Esperanto"))
		{
			return 419;
		}
		if(!strcmp(arg0, "Taxi"))
		{
			return 420;
		}
		if(!strcmp(arg0, "Washington"))
		{
			return 421;
		}
		if(!strcmp(arg0, "Bobcat"))
		{
			return 422;
		}
		if(!strcmp(arg0, "Mr Whoopee"))
		{
			return 423;
		}
		if(!strcmp(arg0, "BF Injection"))
		{
			return 424;
		}
		if(!strcmp(arg0, "Hunter"))
		{
			return 425;
		}
		if(!strcmp(arg0, "Premier"))
		{
			return 426;
		}
		if(!strcmp(arg0, "Enforcer"))
		{
			return 427;
		}
		if(!strcmp(arg0, "Securicar"))
		{
			return 428;
		}
		if(!strcmp(arg0, "Banshee"))
		{
			return 429;
		}
		if(!strcmp(arg0, "Predator"))
		{
			return 430;
		}
		if(!strcmp(arg0, "Bus"))
		{
			return 431;
		}
		if(!strcmp(arg0, "Rhino"))
		{
			return 432;
		}
		if(!strcmp(arg0, "Barracks"))
		{
			return 433;
		}
		if(!strcmp(arg0, "Hotknife"))
		{
			return 434;
		}
		if(!strcmp(arg0, "Article Trailer"))
		{
			return 435;
		}
		if(!strcmp(arg0, "Previon"))
		{
			return 436;
		}
		if(!strcmp(arg0, "Coach"))
		{
			return 437;
		}
		if(!strcmp(arg0, "Cabbie"))
		{
			return 438;
		}
		if(!strcmp(arg0, "Stallion"))
		{
			return 439;
		}
		if(!strcmp(arg0, "Rumpo"))
		{
			return 440;
		}
		if(!strcmp(arg0, "RC Bandit"))
		{
			return 441;
		}
		if(!strcmp(arg0, "Romero"))
		{
			return 442;
		}
		if(!strcmp(arg0, "Packer"))
		{
			return 443;
		}
		if(!strcmp(arg0, "Monster"))
		{
			return 444;
		}
		if(!strcmp(arg0, "Admiral"))
		{
			return 445;
		}
		if(!strcmp(arg0, "Squallo"))
		{
			return 446;
		}
		if(!strcmp(arg0, "Seasparrow"))
		{
			return 447;
		}
		if(!strcmp(arg0, "Pizzaboy"))
		{
			return 448;
		}
		if(!strcmp(arg0, "Tram"))
		{
			return 449;
		}
		if(!strcmp(arg0, "Article Trailer 2"))
		{
			return 450;
		}
		if(!strcmp(arg0, "Turismo"))
		{
			return 451;
		}
		if(!strcmp(arg0, "Speeder"))
		{
			return 452;
		}
		if(!strcmp(arg0, "Reefer"))
		{
			return 453;
		}
		if(!strcmp(arg0, "Tropic"))
		{
			return 454;
		}
		if(!strcmp(arg0, "Flatbed"))
		{
			return 455;
		}
		if(!strcmp(arg0, "Yankee"))
		{
			return 456;
		}
		if(!strcmp(arg0, "Caddy"))
		{
			return 457;
		}
		if(!strcmp(arg0, "Solair"))
		{
			return 458;
		}
		if(!strcmp(arg0, "Berkley's RC Van"))
		{
			return 459;
		}
		if(!strcmp(arg0, "Skimmer"))
		{
			return 460;
		}
		if(!strcmp(arg0, "PCJ-600"))
		{
			return 461;
		}
		if(!strcmp(arg0, "Faggio"))
		{
			return 462;
		}
		if(!strcmp(arg0, "Freeway"))
		{
			return 463;
		}
		if(!strcmp(arg0, "RC Baron"))
		{
			return 464;
		}
		if(!strcmp(arg0, "RC Raider"))
		{
			return 465;
		}
		if(!strcmp(arg0, "Glendale"))
		{
			return 466;
		}
		if(!strcmp(arg0, "Oceanic"))
		{
			return 467;
		}
		if(!strcmp(arg0, "Sanchez"))
		{
			return 468;
		}
		if(!strcmp(arg0, "Sparrow"))
		{
			return 469;
		}
		if(!strcmp(arg0, "Patriot"))
		{
			return 470;
		}
		if(!strcmp(arg0, "Quad"))
		{
			return 471;
		}
		if(!strcmp(arg0, "Coastguard"))
		{
			return 472;
		}
		if(!strcmp(arg0, "Dinghy"))
		{
			return 473;
		}
		if(!strcmp(arg0, "Hermes"))
		{
			return 474;
		}
		if(!strcmp(arg0, "Sabre"))
		{
			return 475;
		}
		if(!strcmp(arg0, "Rustler"))
		{
			return 476;
		}
		if(!strcmp(arg0, "ZR-350"))
		{
			return 477;
		}
		if(!strcmp(arg0, "Walton"))
		{
			return 478;
		}
		if(!strcmp(arg0, "Regina"))
		{
			return 479;
		}
		if(!strcmp(arg0, "Comet"))
		{
			return 480;
		}
		if(!strcmp(arg0, "BMX"))
		{
			return 481;
		}
		if(!strcmp(arg0, "Burrito"))
		{
			return 482;
		}
		if(!strcmp(arg0, "Camper"))
		{
			return 483;
		}
		if(!strcmp(arg0, "Marquis"))
		{
			return 484;
		}
		if(!strcmp(arg0, "Baggage"))
		{
			return 485;
		}
		if(!strcmp(arg0, "Dozer"))
		{
			return 486;
		}
		if(!strcmp(arg0, "Maverick"))
		{
			return 487;
		}
		if(!strcmp(arg0, "SAN News Maverick"))
		{
			return 488;
		}
		if(!strcmp(arg0, "Rancher"))
		{
			return 489;
		}
		if(!strcmp(arg0, "FBI Rancher"))
		{
			return 490;
		}
		if(!strcmp(arg0, "Virgo"))
		{
			return 491;
		}
		if(!strcmp(arg0, "Greenwood"))
		{
			return 492;
		}
		if(!strcmp(arg0, "Jetmax"))
		{
			return 493;
		}
		if(!strcmp(arg0, "Hotring Racer"))
		{
			return 494;
		}
		if(!strcmp(arg0, "Sandking"))
		{
			return 495;
		}
		if(!strcmp(arg0, "Blista Compact"))
		{
			return 496;
		}
		if(!strcmp(arg0, "Police Maverick"))
		{
			return 497;
		}
		if(!strcmp(arg0, "Boxville"))
		{
			return 498;
		}
		if(!strcmp(arg0, "Benson"))
		{
			return 499;
		}
		if(!strcmp(arg0, "Mesa"))
		{
			return 500;
		}
		if(!strcmp(arg0, "RC Goblin"))
		{
			return 501;
		}
		if(!strcmp(arg0, "Hotring Racer"))
		{
			return 502;
		}
		if(!strcmp(arg0, "Hotring Racer"))
		{
			return 503;
		}
		if(!strcmp(arg0, "Bloodring Banger"))
		{
			return 504;
		}
		if(!strcmp(arg0, "Rancher"))
		{
			return 505;
		}
		if(!strcmp(arg0, "Super GT"))
		{
			return 506;
		}
		if(!strcmp(arg0, "Elegant"))
		{
			return 507;
		}
		if(!strcmp(arg0, "Journey"))
		{
			return 508;
		}
		if(!strcmp(arg0, "Bike"))
		{
			return 509;
		}
		if(!strcmp(arg0, "Mountain Bike"))
		{
			return 510;
		}
		if(!strcmp(arg0, "Beagle"))
		{
			return 511;
		}
		if(!strcmp(arg0, "Cropduster"))
		{
			return 512;
		}
		if(!strcmp(arg0, "Stuntplane"))
		{
			return 513;
		}
		if(!strcmp(arg0, "Tanker"))
		{
			return 514;
		}
		if(!strcmp(arg0, "Roadtrain"))
		{
			return 515;
		}
		if(!strcmp(arg0, "Nebula"))
		{
			return 516;
		}
		if(!strcmp(arg0, "Majestic"))
		{
			return 517;
		}
		if(!strcmp(arg0, "Buccaneer"))
		{
			return 518;
		}
		if(!strcmp(arg0, "Shamal"))
		{
			return 519;
		}
		if(!strcmp(arg0, "Hydra"))
		{
			return 520;
		}
		if(!strcmp(arg0, "FCR-900"))
		{
			return 521;
		}
		if(!strcmp(arg0, "NRG-500"))
		{
			return 522;
		}
		if(!strcmp(arg0, "HPV1000"))
		{
			return 523;
		}
		if(!strcmp(arg0, "Cement Truck"))
		{
			return 524;
		}
		if(!strcmp(arg0, "Towtruck"))
		{
			return 525;
		}
		if(!strcmp(arg0, "Fortune"))
		{
			return 526;
		}
		if(!strcmp(arg0, "Cadrona"))
		{
			return 527;
		}
		if(!strcmp(arg0, "FBI Truck"))
		{
			return 528;
		}
		if(!strcmp(arg0, "Willard"))
		{
			return 529;
		}
		if(!strcmp(arg0, "Forklift"))
		{
			return 530;
		}
		if(!strcmp(arg0, "Tractor"))
		{
			return 531;
		}
		if(!strcmp(arg0, "Combine Harvester"))
		{
			return 532;
		}
		if(!strcmp(arg0, "Feltzer"))
		{
			return 533;
		}
		if(!strcmp(arg0, "Remington"))
		{
			return 534;
		}
		if(!strcmp(arg0, "Slamvan"))
		{
			return 535;
		}
		if(!strcmp(arg0, "Blade"))
		{
			return 536;
		}
		if(!strcmp(arg0, "Freight (Train)"))
		{
			return 537;
		}
		if(!strcmp(arg0, "Brownstreak (Train)"))
		{
			return 538;
		}
		if(!strcmp(arg0, "Vortex"))
		{
			return 539;
		}
		if(!strcmp(arg0, "Vincent"))
		{
			return 540;
		}
		if(!strcmp(arg0, "Bullet"))
		{
			return 541;
		}
		if(!strcmp(arg0, "Clover"))
		{
			return 542;
		}
		if(!strcmp(arg0, "Sadler"))
		{
			return 543;
		}
		if(!strcmp(arg0, "Firetruck LA"))
		{
			return 544;
		}
		if(!strcmp(arg0, "Hustler"))
		{
			return 545;
		}
		if(!strcmp(arg0, "Intruder"))
		{
			return 546;
		}
		if(!strcmp(arg0, "Primo"))
		{
			return 547;
		}
		if(!strcmp(arg0, "Cargobob"))
		{
			return 548;
		}
		if(!strcmp(arg0, "Tampa"))
		{
			return 549;
		}
		if(!strcmp(arg0, "Sunrise"))
		{
			return 550;
		}
		if(!strcmp(arg0, "Merit"))
		{
			return 551;
		}
		if(!strcmp(arg0, "Utility Van"))
		{
			return 552;
		}
		if(!strcmp(arg0, "Nevada"))
		{
			return 553;
		}
		if(!strcmp(arg0, "Yosemite"))
		{
			return 554;
		}
		if(!strcmp(arg0, "Windsor"))
		{
			return 555;
		}
		if(!strcmp(arg0, "Monster \"A\""))
		{
			return 556;
		}
		if(!strcmp(arg0, "Monster \"B\""))
		{
			return 557;
		}
		if(!strcmp(arg0, "Uranus"))
		{
			return 558;
		}
		if(!strcmp(arg0, "Jester"))
		{
			return 559;
		}
		if(!strcmp(arg0, "Sultan"))
		{
			return 560;
		}
		if(!strcmp(arg0, "Stratum"))
		{
			return 561;
		}
		if(!strcmp(arg0, "Elegy"))
		{
			return 562;
		}
		if(!strcmp(arg0, "Raindance"))
		{
			return 563;
		}
		if(!strcmp(arg0, "RC Tiger"))
		{
			return 564;
		}
		if(!strcmp(arg0, "Flash"))
		{
			return 565;
		}
		if(!strcmp(arg0, "Tahoma"))
		{
			return 566;
		}
		if(!strcmp(arg0, "Savanna"))
		{
			return 567;
		}
		if(!strcmp(arg0, "Bandito"))
		{
			return 568;
		}
		if(!strcmp(arg0, "Freight Flat Trailer (Train)"))
		{
			return 569;
		}
		if(!strcmp(arg0, "Streak Trailer (Train)"))
		{
			return 570;
		}
		if(!strcmp(arg0, "Kart"))
		{
			return 571;
		}
		if(!strcmp(arg0, "Mower"))
		{
			return 572;
		}
		if(!strcmp(arg0, "Dune"))
		{
			return 573;
		}
		if(!strcmp(arg0, "Sweeper"))
		{
			return 574;
		}
		if(!strcmp(arg0, "Broadway"))
		{
			return 575;
		}
		if(!strcmp(arg0, "Tornado"))
		{
			return 576;
		}
		if(!strcmp(arg0, "AT400"))
		{
			return 577;
		}
		if(!strcmp(arg0, "DFT-30"))
		{
			return 578;
		}
		if(!strcmp(arg0, "Huntley"))
		{
			return 579;
		}
		if(!strcmp(arg0, "Stafford"))
		{
			return 580;
		}
		if(!strcmp(arg0, "BF-400"))
		{
			return 581;
		}
		if(!strcmp(arg0, "Newsvan"))
		{
			return 582;
		}
		if(!strcmp(arg0, "Tug"))
		{
			return 583;
		}
		if(!strcmp(arg0, "Petrol Trailer"))
		{
			return 584;
		}
		if(!strcmp(arg0, "Emperor"))
		{
			return 585;
		}
		if(!strcmp(arg0, "Wayfarer"))
		{
			return 586;
		}
		if(!strcmp(arg0, "Euros"))
		{
			return 587;
		}
		if(!strcmp(arg0, "Hotdog"))
		{
			return 588;
		}
		if(!strcmp(arg0, "Club"))
		{
			return 589;
		}
		if(!strcmp(arg0, "Freight Box Trailer (Train)"))
		{
			return 590;
		}
		if(!strcmp(arg0, "Article Trailer 3"))
		{
			return 591;
		}
		if(!strcmp(arg0, "Andromada"))
		{
			return 592;
		}
		if(!strcmp(arg0, "Dodo"))
		{
			return 593;
		}
		if(!strcmp(arg0, "RC Cam"))
		{
			return 594;
		}
		if(!strcmp(arg0, "Launch"))
		{
			return 595;
		}
		if(!strcmp(arg0, "Police Car (LSPD)"))
		{
			return 596;
		}
		if(!strcmp(arg0, "Police Car (SFPD)"))
		{
			return 597;
		}
		if(!strcmp(arg0, "Police Car (LVPD)"))
		{
			return 598;
		}
		if(!strcmp(arg0, "Police Ranger"))
		{
			return 599;
		}
		if(!strcmp(arg0, "Picador"))
		{
			return 600;
		}
		if(!strcmp(arg0, "S.W.A.T."))
		{
			return 601;
		}
		if(!strcmp(arg0, "Alpha"))
		{
			return 602;
		}
		if(!strcmp(arg0, "Phoenix"))
		{
			return 603;
		}
		if(!strcmp(arg0, "Glendale Shit"))
		{
			return 604;
		}
		if(!strcmp(arg0, "Sadler Shit"))
		{
			return 605;
		}
		if(!strcmp(arg0, "Baggage Trailer \"A\""))
		{
			return 606;
		}
		if(!strcmp(arg0, "Baggage Trailer \"B\""))
		{
			return 607;
		}
		if(!strcmp(arg0, "Tug Stairs Trailer"))
		{
			return 608;
		}
		if(!strcmp(arg0, "Boxville"))
		{
			return 609;
		}
		if(!strcmp(arg0, "Farm Trailer"))
		{
			return 610;
		}
		if(!strcmp(arg0, "Utility Trailer"))
		{
			return 611;
		}
	}
	return -1;
}

public OnDialogResponse(arg0, arg1, arg2, arg3, arg4)
{
	new var0 = strlen(arg4);
	for(new var1 = 0; var1 < var0; var1++)
	{
		if(arg4[var1] == 37)
		{
			arg4[var1] = 35;
		}
	}
	if(!var0)
	{
		return CallLocalFunction(10784, 10868, arg0, arg1, arg2, arg3, 10892);
	}
	return CallLocalFunction(10900, 10984, arg0, arg1, arg2, arg3, arg4);
}

function64B0(arg0, arg1, arg2)
{
	return CallRemoteFunction(11008, 11096, arg0, arg1, arg2);
}

function64FC(arg0, arg1, arg2, arg3)
{
	return CallRemoteFunction(11112, 11176, arg0, arg1, arg2, arg3);
}

function6550(arg0, arg1, arg2, arg3)
{
	return CallRemoteFunction(11196, 11280, arg0, arg1, arg2, arg3);
}

function65A4(arg0, arg1, arg2, arg3)
{
	return CallRemoteFunction(11300, 11368, arg0, arg1, arg2, arg3);
}

function65F8(arg0, arg1, arg2)
{
	return CallRemoteFunction(11388, 11468, arg0, arg1, arg2);
}

function6644(arg0)
{
	return CallRemoteFunction(11484, 11572, arg0);
}

function6680(arg0, arg1)
{
	return CallRemoteFunction(11580, 11656, arg0, arg1);
}

function66C4(arg0, arg1)
{
	return CallRemoteFunction(11668, 11744, arg0, arg1);
}

function6708(arg0, arg1)
{
	return CallRemoteFunction(11756, 11836, arg0, arg1);
}

function674C(arg0, arg1)
{
	return CallRemoteFunction(11848, 11960, arg0, arg1);
}

function6790(arg0, arg1)
{
	return CallRemoteFunction(11972, 12076, arg0, arg1);
}

function67D4(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10)
{
	return CallRemoteFunction(12088, 12160, arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10);
}

function6860(arg0)
{
	return CallRemoteFunction(12208, 12276, arg0);
}

function689C(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
{
	return CallRemoteFunction(12284, 12352, arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7);
}

function6910(arg0, arg1)
{
	return CallRemoteFunction(12388, 12480, arg0, arg1);
}

function6954()
{
	CallRemoteFunction(12492, 12572);
	return UsePlayerPedAnims();
}

function69A4(arg0, arg1)
{
	return CallRemoteFunction(12576, 12648, arg0, arg1);
}

function69E8(arg0, arg1)
{
	return CallRemoteFunction(12660, 12732, arg0, arg1);
}

public SSCANF_OnPlayerConnect(arg0)
{
	if(!IsPlayerNPC(arg0))
	{
		function717C(12748, 12752, arg0, 20);
	}
	else
	{
		function717C(12836, 12840, arg0, 20);
	}
	function717C(12924, 12928, arg0, 20);
	if(glob31C8 & 2)
	{
		CallLocalFunction(13012, 13100, arg0);
	}
	return 1;
}

public SSCANF_OnGameModeInit()
{
	if(-1 != funcidx(13108))
	{
		glob31C8 = glob31C8 | 1;
	}
	if(-1 != funcidx(13208))
	{
		glob31C8 = glob31C8 | 2;
	}
	if(!glob31CC)
	{
		CallLocalFunction(13296, 13380, 12836, 12924, 12748);
		return 1;
	}
	glob3224 = 0;
	glob3228[20] = 20;
	glob3280[20] = 20;
	glob327C = 0;
	new var0 = 20, var1 = 20;
	glob31CC = 0;
	glob31D0[20] = 20;
	new var2 = 20;
	for(new var3 = 0; 20 != var3; var3++)
	{
		if(IsPlayerConnected(var3))
		{
			if(!IsPlayerNPC(var3))
			{
				glob31D0[var2] = var3;
				glob31CC++;
				var2 = var3;
			}
			else
			{
				glob3228[var0] = var3;
				glob3224++;
				var0 = var3;
			}
			glob3280[var1] = var3;
			glob327C++;
			var1 = var3;
		}
		else
		{
			glob3228[var3] = 21;
			glob3280[var3] = 21;
			glob31D0[var3] = 21;
		}
	}
	glob3228[var2] = 20;
	glob3280[var2] = 20;
	glob31D0[var2] = 20;
	CallLocalFunction(13384, 13468);
	return 1;
}

public SSCANF_OnPlayerDisconnect(arg0, arg1)
{
	if(glob31C8 & 1)
	{
		CallLocalFunction(13472, 13572, arg0, arg1);
	}
	if(!IsPlayerNPC(arg0))
	{
		function733C(12748, 12752, arg0, 20);
	}
	else
	{
		function733C(12836, 12840, arg0, 20);
	}
	function733C(12924, 12928, arg0, 20);
	return 1;
}

function717C(&arg0, arg1, arg2, arg3)
{
	if((arg3 > arg2) & (0 <= arg2) && arg1[arg2] > arg3)
	{
		new var0 = arg3, var1 = arg1[var0];
		while(var1 < arg2)
		{
			var0 = var1;
			var1 = arg1[var0];
		}
		arg1[var0] = arg2;
		arg1[arg2] = var1;
		arg0++;
		return 1;
	}
	return 0;
}

function733C(arg0, arg1, arg2, arg3)
{
	new var0 = 0;
	return function7394(arg0, arg1, arg2, var0, arg3);
}

function7394(&arg0, arg1, arg2, &arg3, arg4)
{
	if((arg4 > arg2) & (0 <= arg2) && arg1[arg2] <= arg4)
	{
		arg3 = arg4;
		new var0 = arg1[arg3];
		while(var0 != arg2)
		{
			arg3 = var0;
			var0 = arg1[arg3];
		}
		arg1[arg3] = arg1[arg2];
		arg1[arg2] = arg4 + 1;
		arg0--;
		return 1;
	}
	return 0;
}

function7588(arg0, arg1, arg2)
{
	for(new var0 = 0, new var1, var1 = arg2 + 1; var0 < arg1; var0++)
	{
		for(new var2 = 0; var2 < arg2; var2++)
		{
			arg0[var0][var2] = var1;
		}
		arg0[var0][arg2] = arg2;
	}
	return 0;
}

public SSCANF_OnFilterScriptInit()
{
	glob3514 = funcidx(13624) != -1;
	glob3518 = funcidx(13724) != -1;
	glob351C = funcidx(13836) != -1;
	glob3520 = funcidx(13948) != -1;
	glob3524 = funcidx(14068) != -1;
	glob3528 = funcidx(14188) != -1;
	glob352C = funcidx(14288) != -1;
	glob3530 = funcidx(14388) != -1;
	glob3534 = funcidx(14504) != -1;
	if(-1 != funcidx(14620))
	{
		return CallLocalFunction(14732, 14844);
	}
	return 1;
}

public Itter_OnGameModeInit()
{
	glob3514 = funcidx(14848) != -1;
	glob3518 = funcidx(14948) != -1;
	glob351C = funcidx(15060) != -1;
	glob3520 = funcidx(15172) != -1;
	glob3524 = funcidx(15292) != -1;
	glob3528 = funcidx(15412) != -1;
	glob352C = funcidx(15512) != -1;
	glob3530 = funcidx(15612) != -1;
	glob3534 = funcidx(15728) != -1;
	if(-1 != funcidx(15844))
	{
		return CallLocalFunction(15940, 16036);
	}
	return 1;
}

public Itter_OnPlayerConnect(arg0)
{
	Streamer_CallbackHook(0, arg0);
	if(glob3514)
	{
		return CallLocalFunction(16040, 16140, arg0);
	}
	return 1;
}

public Itter_OnPlayerDisconnect(arg0, arg1)
{
	Streamer_CallbackHook(1, arg0, arg1);
	if(glob3518)
	{
		return CallLocalFunction(16148, 16260, arg0, arg1);
	}
	return 1;
}

public OnPlayerEditObject(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)
{
	if(arg1)
	{
		Streamer_CallbackHook(2, arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
	}
	if(glob351C)
	{
		return CallLocalFunction(16272, 16384, arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
	}
	return 1;
}

public OnPlayerSelectObject(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
{
	if(arg1 == 2)
	{
		Streamer_CallbackHook(3, arg0, arg1, arg2, arg3, arg4, arg5, arg6);
	}
	if(glob3520)
	{
		return CallLocalFunction(16428, 16548, arg0, arg1, arg2, arg3, arg4, arg5, arg6);
	}
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	Streamer_CallbackHook(4, playerid, pickupid);
	if(glob3524)
	{
		return CallLocalFunction(16580, 16700, playerid, pickupid);
	}
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	Streamer_CallbackHook(5, playerid);
	if(glob3528)
	{
		return CallLocalFunction(16712, 16812, playerid);
	}
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	Streamer_CallbackHook(6, playerid);
	if(glob352C)
	{
		return CallLocalFunction(16820, 16920, playerid);
	}
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	Streamer_CallbackHook(7, playerid);
	if(glob3530)
	{
		return CallLocalFunction(16928, 17044, playerid);
	}
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	Streamer_CallbackHook(8, playerid);
	if(glob3534)
	{
		return CallLocalFunction(17052, 17168, playerid);
	}
	return 1;
}

function81D8(arg0)
{
	new Float:var0 = 0.0, Float:var1 = 0.0, Float:var2 = 0.0;
	GetVehiclePos(arg0, var0, var1, var2);
	if(function1B8(0.0, var0) && function1B8(0.0, var1) && function1B8(0.0, var2))
	{
		return 0;
	}
	return 1;
}

public TextDrawDestroyTimer2(arg0)
{
	TextDrawDestroy(arg0);
	return 0;
}

function8334(playerid, arg1)
{
	new var0[12];
	new var1[12];
	for(new var2 = 0; 12 != var2; var2++)
	{
		new var3 = 0, var4 = 0;
		GetPlayerWeaponData(playerid, var2, var3, var4);
		if(var3 != arg1)
		{
			GetPlayerWeaponData(playerid, var2, var0, var1);
		}
	}
	function6644(playerid);
	for(new var2 = 0; 12 != var2; var2++)
	{
		function65F8(playerid, var0[var2], var1[var2]);
	}
	return 0;
}

function8570(playerid)
{
	new var0 = 0, var1 = 0;
	for(new var2 = 0; var2 < 11; var2++)
	{
		GetPlayerWeaponData(playerid, var2, var0, var1);
		if(var0 && 1 != var0)
		{
			return 1;
		}
	}
	return 0;
}

function8680(playerid)
{
	if(IsPlayerConnected(playerid) && GetPlayerState(playerid) == 2)
	{
		return 1;
	}
	return 0;
}

function8718(Float:arg0, Float:arg1, Float:arg2, Float:arg3, Float:arg4, Float:arg5)
{
	return floatsqroot(floatpower(arg0 - arg3, 2.0)) + floatsqroot(floatpower(arg1 - arg4, 2.0)) + floatsqroot(floatpower(arg2 - arg5, 2.0));
}

function88F0(playerid, Float:arg1, Float:arg2, Float:arg3)
{
	if(IsPlayerConnected(playerid))
	{
		new Float:var0 = 0.0, Float:var1 = 0.0, Float:var2 = 0.0;
		GetPlayerPos(playerid, var0, var1, var2);
		return function8718(arg1, arg2, arg3, var0, var1, var2);
	}
	return 2139095040;
}

function89D8(playerid, arg1)
{
	if(IsPlayerConnected(playerid) && function81D8(arg1))
	{
		new Float:var0 = 0.0, Float:var1 = 0.0, Float:var2 = 0.0;
		GetVehiclePos(arg1, var0, var1, var2);
		return function88F0(playerid, var0, var1, var2);
	}
	return 2139095040;
}

function8AEC(playerid, arg1)
{
	if(function81D8(1))
	{
		new var0 = 1;
		new Float:var1 = function89D8(playerid, 0);
		for(new var2 = 1; var2 < 100; var2++)
		{
			if(var2 == arg1 || !IsVehicleStreamedIn(var2, playerid))
			{
			}
			else
			{
			}
		}
		new Float:var3 = function89D8(playerid, var2);
		if(var3 < var1)
		{
			var1 = var3;
			var0 = var2;
		}
		return var0;
	}
	return -1;
}

function8CDC(playerid)
{
	if(IsPlayerConnected(playerid))
	{
		new var0 = 0;
		while(++var0 < 10)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "\n");
		}
		return 1;
	}
	return 0;
}

function8DA4(playerid)
{
	if(IsPlayerConnected(playerid))
	{
		new Float:var0 = 0.0, Float:var1 = 0.0, Float:var2 = 0.0;
		GetPlayerPos(playerid, var0, var1, var2);
		return var2;
	}
	return -995680256;
}

function8E54(playerid, arg1)
{
	if(IsPlayerConnected(playerid))
	{
		new Float:var0 = 0.0, Float:var1 = 0.0, Float:var2 = 0.0;
		GetPlayerPos(playerid, var0, var1, var2);
		function6550(playerid, var0, var1, arg1);
	}
	return 0;
}

function8F3C(playerid)
{
	if(IsPlayerConnected(playerid) && IsPlayerInAnyVehicle(playerid))
	{
		if(function9F68(GetPlayerVehicleID(playerid)) == 6)
		{
			return 1;
		}
	}
	return 0;
}

function9014(arg0)
{
	new var0 = 612;
	if(function81D8(arg0))
	{
		var0 = GetVehicleModel(arg0);
	}
	return glob4318[var0 - 400];
}

function90CC(Float:arg0, Float:arg1, Float:arg2, Float:arg3)
{
	return function8718(arg0, arg1, 0.0, arg2, arg3, 0.0);
}

function9118(Float:arg0, Float:arg1, Float:arg2, Float:arg3, Float:arg4)
{
	if(function90CC(arg0, arg1, arg2, arg3) <= arg4)
	{
		return 1;
	}
	return 0;
}

function91A0(playerid, Float:arg1, Float:arg2, Float:arg3)
{
	if(IsPlayerConnected(playerid))
	{
		new Float:var0 = 0.0, Float:var1 = 0.0, Float:var2 = 0.0;
		GetPlayerPos(playerid, var0, var1, var2);
		return function9118(var0, var1, arg1, arg2, arg3);
	}
	return 0;
}

function927C(playerid, Float:arg1, Float:arg2, Float:arg3, Float:arg4)
{
	if(IsPlayerConnected(playerid))
	{
		new Float:var0 = 0.0, Float:var1 = 0.0, Float:var2 = 0.0;
		GetPlayerPos(playerid, var0, var1, var2);
		return function9368(var0, var1, var2, arg1, arg2, arg3, arg4);
	}
	return 0;
}

function9368(Float:arg0, Float:arg1, Float:arg2, Float:arg3, Float:arg4, Float:arg5, Float:arg6)
{
	if(function8718(arg0, arg1, arg2, arg3, arg4, arg5) <= arg6)
	{
		return 1;
	}
	return 0;
}

function9400(arg0, playerid, arg2, arg3, arg4)
{
	if(IsPlayerConnected(playerid) && function81D8(arg0))
	{
		SetVehicleParamsForPlayer(arg0, playerid, arg2, arg3);
		glob39718[arg0][playerid] = arg2;
		glob39718[arg0][playerid] = arg3;
		if(arg4 && IsTrailerAttachedToVehicle(arg0))
		{
			function9400(GetVehicleTrailer(arg0), playerid, arg2, arg3, arg0);
		}
		return 1;
	}
	return 0;
}

function9634(arg0, arg1, arg2, arg3)
{
	new var0 = 0;
	for(new var1 = 0; var1 < 20; var1++)
	{
		if(function9400(arg0, var1, arg1, arg2, arg3))
		{
			var0++;
		}
	}
	return var0;
}

function96F4(arg0)
{
	if(function81D8(arg0))
	{
		function9634(arg0, false, false, 0);
		DestroyVehicle(arg0);
		glob39718[arg0][0] = 0;
		glob39718[arg0][1] = 0;
		glob39718[arg0][2] = 0;
		glob39718[arg0][3] = 0;
		glob39718[arg0][4] = 0;
		glob39718[arg0][5] = 0;
		glob39718[arg0][9] = 0;
		glob39718[arg0][10] = 0;
		glob39718[arg0][11] = 0;
		glob39718[arg0][32] = 0;
		return 1;
	}
	return 0;
}

function9A08(arg0, playerid, &arg2, &arg3)
{
	arg3 = -1;
	if(IsPlayerConnected(playerid) && function81D8(arg0))
	{
		arg2 = glob39718[arg0][playerid];
		arg3 = glob39718[arg0][playerid];
	}
	return arg3;
}

function9B68(arg0, playerid)
{
	if(IsPlayerConnected(playerid) && function81D8(arg0))
	{
		new var0 = 0, var1 = 0;
		function9A08(arg0, playerid, var0, var1);
		if(var1 == 1)
		{
			return 1;
		}
	}
	return 0;
}

function9C64(arg0)
{
	if(function81D8(arg0))
	{
		new var0 = 0;
		while(++var0 < 20)
		{
			if(IsPlayerConnected(var0) && function9B68(arg0, var0))
			{
				return 1;
			}
		}
	}
	return 0;
}

function9D68(arg0, playerid)
{
	if(IsPlayerConnected(playerid) && function81D8(arg0))
	{
		new var0 = 0, var1 = 0;
		function9A08(arg0, playerid, var0, var1);
		if(var0 == 1)
		{
			return 1;
		}
	}
	return 0;
}

function9E64(arg0)
{
	if(function81D8(arg0))
	{
		new var0 = 0;
		while(++var0 < 20)
		{
			if(IsPlayerConnected(var0) && function9D68(arg0, var0))
			{
				return 1;
			}
		}
	}
	return 0;
}

function9F68(arg0)
{
	new var0 = 0;
	if(function81D8(arg0))
	{
		switch(GetVehicleModel(arg0)) {
			case 400:
				GetVehicleModel(arg0);
			case 528:
			case 529:
			case 530:
			case 533:
			case 527:
			case 524:
			case 526:
			case 518:
			case 517:
			case 534:
			case 536:
			case 544:
			case 545:
			case 546:
			case 535:
			case 543:
			case 541:
			case 542:
			case 540:
			case 547:
			case 516:
			case 514:
			case 492:
			case 494:
			case 495:
			case 496:
			case 491:
			case 489:
			case 490:
			case 486:
			case 515:
			case 498:
			case 500:
			case 507:
			case 508:
			case 499:
			case 506:
			case 503:
			case 504:
			case 502:
			case 485:
			case 549:
			case 551:
			case 589:
			case 594:
			case 596:
			case 597:
			case 587:
			case 583:
			case 585:
			case 582:
			case 580:
			case 598:
			case 600:
			case 605:
			case 609:
			case 599:
			case 604:
			case 602:
			case 603:
			case 601:
			case 550:
			case 579:
			case 576:
			case 559:
			case 560:
			case 561:
			case 562:
			case 558:
			case 554:
			case 555:
			case 552:
			case 578:
			case 564:
			case 566:
			case 574:
			case 575:
			case 565:
			case 572:
			case 568:
			case 571:
			case 567:
			case 483:
			case 505:
			case 482:
			case 418:
			case 455:
			case 419:
			case 420:
			case 451:
			case 421:
			case 456:
			case 458:
			case 416:
			case 457:
			case 431:
			case 459:
			case 415:
			case 422:
			case 424:
			case 438:
			case 439:
			case 428:
			case 436:
			case 429:
			case 423:
			case 440:
			case 442:
			case 445:
			case 441:
			case 426:
			case 427:
			case 413:
			case 434:
			case 407:
			case 466:
			case 411:
			case 405:
			case 467:
			case 404:
			case 410:
			case 409:
			case 475:
			case 474:
			case 477:
			case 403:
			case 402:
			case 401:
			case 412:
			case 479:
			case 480:
			case 478:
				var0 = 1;
			case 586:
			case 448:
			case 463:
			case 522:
			case 461:
			case 462:
			case 521:
			case 468:
			case 523:
			case 581:
				var0 = 4;
			case 509:
			case 510:
			case 481:
				var0 = 6;
			case 471:
				var0 = 5;
			case 595:
			case 430:
			case 484:
			case 493:
			case 473:
			case 472:
			case 452:
			case 454:
			case 446:
			case 453:
				var0 = 9;
			case 425:
			case 417:
			case 563:
			case 548:
			case 469:
			case 465:
			case 501:
			case 447:
			case 497:
			case 488:
			case 487:
				var0 = 7;
			case 577:
			case 464:
			case 513:
			case 593:
			case 592:
			case 519:
			case 520:
			case 512:
			case 511:
			case 460:
			case 553:
			case 476:
			case 539:
				var0 = 8;
			case 414:
			case 470:
			case 588:
			case 408:
			case 433:
			case 432:
			case 525:
			case 437:
			case 532:
			case 443:
			case 531:
				var0 = 2;
			case 573:
			case 556:
			case 557:
			case 444:
			case 406:
				var0 = 3;
			case 607:
			case 435:
			case 608:
			case 606:
			case 611:
			case 450:
			case 584:
			case 610:
			case 591:
				var0 = 10;
			case 590:
			case 570:
			case 537:
			case 449:
			case 538:
			case 569:
				var0 = 11;
		}
	}
	return var0;
}

functionA7C0()
{
	new var0 = 0;
	for(new var1 = 0; var1 < 20; var1++)
	{
		if(IsPlayerConnected(var1))
		{
			var0++;
		}
	}
	return var0;
}

functionA868(playerid, Float:arg1, Float:arg2, Float:arg3, Float:arg4, Float:arg5)
{
	new var0 = 1, Float:var1 = 0.0, Float:var2 = 0.0, Float:var3 = 0.0, Float:var4 = 0.0, Float:var5 = 0.0;
	GetPlayerPos(playerid, var1, var2, var3);
	var4 = floatsqroot(floatpower(var1 - arg3, 2.0) + floatpower(var2 - arg4, 2.0));
	var5 = floatsqroot(floatpower(var4, 2.0) + floatpower(var3 - arg5, 2.0));
	if(var5 > arg2 && var4 < var5)
	{
		var0 = 0;
	}
	if(var4 <= arg1 && var0)
	{
		return 1;
	}
	return 0;
}

functionABA8(arg0, arg1, arg2, arg3)
{
	return arg3 | ((arg2 << 8) | ((arg1 << 16) | (arg0 << 24)));
}

functionAC18(arg0)
{
	new var0[255];
	format(var0, 255, "%.0f", arg0);
	return var0;
}

functionACA0(arg0, Float:arg1)
{
	for(new var0 = 0; var0 <= 20; )
	{
		if(functionAF84(var0, arg0, arg1))
		{
			return 1;
		}
	}
	return 0;
}

public ClearOutOfRangeVehicles()
{
	new Float:var0 = 250.0;
	if(var0 <= 0)
	{
		var0 = 2139095040;
	}
	new var1 = 0;
	for(new var2 = 0; var2 < 100; var2++)
	{
		if(function81D8(var2) && glob39718[var2][6] == -1 && !functionACA0(var2, var0) && (!function9C64(var2) || (functionA7C0() == 1 && function9E64(var2))))
		{
			function96F4(var2);
			var1++;
		}
	}
	return var1;
}

functionAF84(playerid, arg1, Float:arg2)
{
	if(function81D8(arg1))
	{
		new Float:var0 = 0.0, Float:var1 = 0.0, Float:var2 = 0.0;
		GetVehiclePos(arg1, var0, var1, var2);
		return function927C(playerid, var0, var1, var2, arg2);
	}
	return 0;
}

functionB058(arg0)
{
	new var0[255];
	valstr(var0, arg0, false);
	return var0;
}

public OnVehicleSpawn(vehicleid)
{
	if(glob39718[vehicleid][9] >= 2139095040 && glob39718[vehicleid][6] == -1)
	{
		function96F4(vehicleid);
	}
	else
	{
		function9634(vehicleid, false, false, 0);
	}
	return 1;
}

public Streamer_OnGameModeInit()
{
	glob3EA04 = funcidx(256524) != -1;
	glob3EA08 = funcidx(256620) != -1;
	if(-1 != funcidx(256720))
	{
		return CallLocalFunction(256800, 256880);
	}
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext)
{
	if(glob3EA04 && !CallLocalFunction(256884, 256980, playerid, cmdtext))
	{
		return 1;
	}
	new var0 = 0, var1[32];
	while(cmdtext[++var0] > 32)
	{
		var1[var0 - 1] = tolower(cmdtext[var0]);
	}
	format(var1, 32, "cmd_%s", var1);
	while(cmdtext[var0] == 32)
	{
		var0++;
	}
	if(!cmdtext[var0])
	{
		if(glob3EA08)
		{
			return CallLocalFunction(257020, 257120, playerid, cmdtext);
		}
		return CallLocalFunction(var1, 257156, playerid, 257168);
	}
	if(glob3EA08)
	{
		return CallLocalFunction(257176, 257276, playerid, cmdtext);
	}
	return CallLocalFunction(var1, 257304, playerid, cmdtext);
}

Float:functionB6EC(Float:arg0, Float:arg1, Float:arg2, Float:arg3, Float:arg4, Float:arg5)
{
	return floatsqroot(floatpower(arg0 - arg3, 2.0) + floatpower(arg1 - arg4, 2.0) + floatpower(arg2 - arg5, 2.0));
}

functionB838(playerid)
{
	TextDrawSetSelectable(glob51B38, 1);
	TextDrawSetSelectable(glob51B3C, 1);
	TextDrawSetSelectable(glob51B40, 1);
	TextDrawSetSelectable(glob51B44, 1);
	TextDrawSetSelectable(glob51B48, 1);
	TextDrawSetSelectable(glob51B4C, 1);
	TextDrawSetSelectable(glob51B50, 1);
	TextDrawSetSelectable(glob51B54, 1);
	TextDrawSetSelectable(glob51B58, 1);
	TextDrawSetSelectable(glob51B5C, 1);
	TextDrawShowForPlayer(playerid, glob51B34);
	TextDrawShowForPlayer(playerid, glob51B38);
	TextDrawShowForPlayer(playerid, glob51B3C);
	TextDrawShowForPlayer(playerid, glob51B40);
	TextDrawShowForPlayer(playerid, glob51B44);
	TextDrawShowForPlayer(playerid, glob51B48);
	TextDrawShowForPlayer(playerid, glob51B4C);
	TextDrawShowForPlayer(playerid, glob51B50);
	TextDrawShowForPlayer(playerid, glob51B54);
	TextDrawShowForPlayer(playerid, glob51B58);
	TextDrawShowForPlayer(playerid, glob51B5C);
	return 0;
}

functionBBE0(playerid)
{
	TextDrawHideForPlayer(playerid, glob51B34);
	TextDrawHideForPlayer(playerid, glob51B38);
	TextDrawHideForPlayer(playerid, glob51B3C);
	TextDrawHideForPlayer(playerid, glob51B40);
	TextDrawHideForPlayer(playerid, glob51B44);
	TextDrawHideForPlayer(playerid, glob51B48);
	TextDrawHideForPlayer(playerid, glob51B4C);
	TextDrawHideForPlayer(playerid, glob51B50);
	TextDrawHideForPlayer(playerid, glob51B54);
	TextDrawHideForPlayer(playerid, glob51B58);
	TextDrawHideForPlayer(playerid, glob51B5C);
	return 0;
}

functionBDD0(arg0)
{
	glob51454[arg0] = CreatePlayerTextDraw(arg0, 1134559232, 1121714176, 335468);
	PlayerTextDrawAlignment(arg0, glob51454[arg0], 2);
	PlayerTextDrawBackgroundColor(arg0, glob51454[arg0], 255);
	PlayerTextDrawFont(arg0, glob51454[arg0], 2);
	PlayerTextDrawLetterSize(arg0, glob51454[arg0], 1051931410, 1070386364);
	PlayerTextDrawColor(arg0, glob51454[arg0], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob51454[arg0], 0);
	PlayerTextDrawSetProportional(arg0, glob51454[arg0], 1);
	PlayerTextDrawSetShadow(arg0, glob51454[arg0], 1);
	PlayerTextDrawUseBox(arg0, glob51454[arg0], 1);
	PlayerTextDrawBoxColor(arg0, glob51454[arg0], 85);
	PlayerTextDrawTextSize(arg0, glob51454[arg0], 1092616192, 1137508352);
	glob514A4[arg0] = CreatePlayerTextDraw(arg0, 1127677952, 1125449728, 335664);
	PlayerTextDrawAlignment(arg0, glob514A4[arg0], 2);
	PlayerTextDrawBackgroundColor(arg0, glob514A4[arg0], 255);
	PlayerTextDrawFont(arg0, glob514A4[arg0], 1);
	PlayerTextDrawLetterSize(arg0, glob514A4[arg0], 1052266988, 1070386364);
	PlayerTextDrawColor(arg0, glob514A4[arg0], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob514A4[arg0], 0);
	PlayerTextDrawSetProportional(arg0, glob514A4[arg0], 1);
	PlayerTextDrawSetShadow(arg0, glob514A4[arg0], 1);
	PlayerTextDrawUseBox(arg0, glob514A4[arg0], 1);
	PlayerTextDrawBoxColor(arg0, glob514A4[arg0], 0);
	PlayerTextDrawTextSize(arg0, glob514A4[arg0], 1101004800, 1120403456);
	glob514F4[arg0] = CreatePlayerTextDraw(arg0, 1134559232, 1125515264, 335692);
	PlayerTextDrawAlignment(arg0, glob514F4[arg0], 2);
	PlayerTextDrawBackgroundColor(arg0, glob514F4[arg0], 255);
	PlayerTextDrawFont(arg0, glob514F4[arg0], 1);
	PlayerTextDrawLetterSize(arg0, glob514F4[arg0], 1052266988, 1071225225);
	PlayerTextDrawColor(arg0, glob514F4[arg0], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob514F4[arg0], 0);
	PlayerTextDrawSetProportional(arg0, glob514F4[arg0], 1);
	PlayerTextDrawSetShadow(arg0, glob514F4[arg0], 1);
	PlayerTextDrawUseBox(arg0, glob514F4[arg0], 1);
	PlayerTextDrawBoxColor(arg0, glob514F4[arg0], 0);
	PlayerTextDrawTextSize(arg0, glob514F4[arg0], 1101004800, 1120403456);
	glob51544[arg0] = CreatePlayerTextDraw(arg0, 1139146752, 1125515264, 335740);
	PlayerTextDrawAlignment(arg0, glob51544[arg0], 2);
	PlayerTextDrawBackgroundColor(arg0, glob51544[arg0], 255);
	PlayerTextDrawFont(arg0, glob51544[arg0], 1);
	PlayerTextDrawLetterSize(arg0, glob51544[arg0], 1052266988, 1071225225);
	PlayerTextDrawColor(arg0, glob51544[arg0], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob51544[arg0], 0);
	PlayerTextDrawSetProportional(arg0, glob51544[arg0], 1);
	PlayerTextDrawSetShadow(arg0, glob51544[arg0], 1);
	PlayerTextDrawUseBox(arg0, glob51544[arg0], 1);
	PlayerTextDrawBoxColor(arg0, glob51544[arg0], 0);
	PlayerTextDrawTextSize(arg0, glob51544[arg0], 1101004800, 1120403456);
	glob51594[arg0] = CreatePlayerTextDraw(arg0, 1127743488, 1128792064, 335776);
	PlayerTextDrawAlignment(arg0, glob51594[arg0], 2);
	PlayerTextDrawBackgroundColor(arg0, glob51594[arg0], 255);
	PlayerTextDrawFont(arg0, glob51594[arg0], 1);
	PlayerTextDrawLetterSize(arg0, glob51594[arg0], 1052266988, 1071225225);
	PlayerTextDrawColor(arg0, glob51594[arg0], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob51594[arg0], 0);
	PlayerTextDrawSetProportional(arg0, glob51594[arg0], 1);
	PlayerTextDrawSetShadow(arg0, glob51594[arg0], 1);
	PlayerTextDrawUseBox(arg0, glob51594[arg0], 1);
	PlayerTextDrawBoxColor(arg0, glob51594[arg0], 0);
	PlayerTextDrawTextSize(arg0, glob51594[arg0], 1101004800, 1120403456);
	glob515E4[arg0] = CreatePlayerTextDraw(arg0, 1134559232, 1128792064, 335812);
	PlayerTextDrawAlignment(arg0, glob515E4[arg0], 2);
	PlayerTextDrawBackgroundColor(arg0, glob515E4[arg0], 255);
	PlayerTextDrawFont(arg0, glob515E4[arg0], 1);
	PlayerTextDrawLetterSize(arg0, glob515E4[arg0], 1052266988, 1071225225);
	PlayerTextDrawColor(arg0, glob515E4[arg0], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob515E4[arg0], 0);
	PlayerTextDrawSetProportional(arg0, glob515E4[arg0], 1);
	PlayerTextDrawSetShadow(arg0, glob515E4[arg0], 1);
	PlayerTextDrawUseBox(arg0, glob515E4[arg0], 1);
	PlayerTextDrawBoxColor(arg0, glob515E4[arg0], 0);
	PlayerTextDrawTextSize(arg0, glob515E4[arg0], 1101004800, 1120403456);
	glob51634[arg0] = CreatePlayerTextDraw(arg0, 1139146752, 1128792064, 335864);
	PlayerTextDrawAlignment(arg0, glob51634[arg0], 2);
	PlayerTextDrawBackgroundColor(arg0, glob51634[arg0], 255);
	PlayerTextDrawFont(arg0, glob51634[arg0], 1);
	PlayerTextDrawLetterSize(arg0, glob51634[arg0], 1052266988, 1071225225);
	PlayerTextDrawColor(arg0, glob51634[arg0], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob51634[arg0], 0);
	PlayerTextDrawSetProportional(arg0, glob51634[arg0], 1);
	PlayerTextDrawSetShadow(arg0, glob51634[arg0], 1);
	PlayerTextDrawUseBox(arg0, glob51634[arg0], 1);
	PlayerTextDrawBoxColor(arg0, glob51634[arg0], 0);
	PlayerTextDrawTextSize(arg0, glob51634[arg0], 1101004800, 1120403456);
	glob51684[arg0] = CreatePlayerTextDraw(arg0, 1127546880, 1134231552, 335912);
	PlayerTextDrawAlignment(arg0, glob51684[arg0], 2);
	PlayerTextDrawBackgroundColor(arg0, glob51684[arg0], 255);
	PlayerTextDrawFont(arg0, glob51684[arg0], 2);
	PlayerTextDrawLetterSize(arg0, glob51684[arg0], 1050253722, 1069547503);
	PlayerTextDrawColor(arg0, glob51684[arg0], 4285998591);
	PlayerTextDrawSetOutline(arg0, glob51684[arg0], 0);
	PlayerTextDrawSetProportional(arg0, glob51684[arg0], 1);
	PlayerTextDrawSetShadow(arg0, glob51684[arg0], 1);
	PlayerTextDrawUseBox(arg0, glob51684[arg0], 1);
	PlayerTextDrawBoxColor(arg0, glob51684[arg0], 0);
	PlayerTextDrawTextSize(arg0, glob51684[arg0], 1101004800, 1120403456);
	glob516D4[arg0] = CreatePlayerTextDraw(arg0, 1134624768, 1132068864, 335956);
	PlayerTextDrawAlignment(arg0, glob516D4[arg0], 2);
	PlayerTextDrawBackgroundColor(arg0, glob516D4[arg0], 255);
	PlayerTextDrawFont(arg0, glob516D4[arg0], 1);
	PlayerTextDrawLetterSize(arg0, glob516D4[arg0], 1052266988, 1071225225);
	PlayerTextDrawColor(arg0, glob516D4[arg0], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob516D4[arg0], 0);
	PlayerTextDrawSetProportional(arg0, glob516D4[arg0], 1);
	PlayerTextDrawSetShadow(arg0, glob516D4[arg0], 1);
	PlayerTextDrawUseBox(arg0, glob516D4[arg0], 1);
	PlayerTextDrawBoxColor(arg0, glob516D4[arg0], 0);
	PlayerTextDrawTextSize(arg0, glob516D4[arg0], 1101004800, 1120403456);
	glob51724[arg0] = CreatePlayerTextDraw(arg0, 1139212288, 1132068864, 335964);
	PlayerTextDrawAlignment(arg0, glob51724[arg0], 2);
	PlayerTextDrawBackgroundColor(arg0, glob51724[arg0], 255);
	PlayerTextDrawFont(arg0, glob51724[arg0], 1);
	PlayerTextDrawLetterSize(arg0, glob51724[arg0], 1052266988, 1071225225);
	PlayerTextDrawColor(arg0, glob51724[arg0], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob51724[arg0], 0);
	PlayerTextDrawSetProportional(arg0, glob51724[arg0], 1);
	PlayerTextDrawSetShadow(arg0, glob51724[arg0], 1);
	PlayerTextDrawUseBox(arg0, glob51724[arg0], 1);
	PlayerTextDrawBoxColor(arg0, glob51724[arg0], 0);
	PlayerTextDrawTextSize(arg0, glob51724[arg0], 1101004800, 1120403456);
	glob51774[arg0] = CreatePlayerTextDraw(arg0, 1140490240, 1134264320, 335972);
	PlayerTextDrawAlignment(arg0, glob51774[arg0], 2);
	PlayerTextDrawBackgroundColor(arg0, glob51774[arg0], 255);
	PlayerTextDrawFont(arg0, glob51774[arg0], 2);
	PlayerTextDrawLetterSize(arg0, glob51774[arg0], 1051260355, 1071225242);
	PlayerTextDrawColor(arg0, glob51774[arg0], 4285998591);
	PlayerTextDrawSetOutline(arg0, glob51774[arg0], 0);
	PlayerTextDrawSetProportional(arg0, glob51774[arg0], 1);
	PlayerTextDrawSetShadow(arg0, glob51774[arg0], 1);
	PlayerTextDrawUseBox(arg0, glob51774[arg0], 1);
	PlayerTextDrawBoxColor(arg0, glob51774[arg0], 0);
	PlayerTextDrawTextSize(arg0, glob51774[arg0], 1101004800, 1120403456);
	glob51814[arg0] = CreatePlayerTextDraw(arg0, 1127743488, 1132068864, 335996);
	PlayerTextDrawAlignment(arg0, glob51814[arg0], 2);
	PlayerTextDrawBackgroundColor(arg0, glob51814[arg0], 255);
	PlayerTextDrawFont(arg0, glob51814[arg0], 1);
	PlayerTextDrawLetterSize(arg0, glob51814[arg0], 1052266988, 1071225225);
	PlayerTextDrawColor(arg0, glob51814[arg0], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob51814[arg0], 0);
	PlayerTextDrawSetProportional(arg0, glob51814[arg0], 1);
	PlayerTextDrawSetShadow(arg0, glob51814[arg0], 1);
	PlayerTextDrawUseBox(arg0, glob51814[arg0], 1);
	PlayerTextDrawBoxColor(arg0, glob51814[arg0], 0);
	PlayerTextDrawTextSize(arg0, glob51814[arg0], 1101004800, 1120403456);
	return 0;
}

functionEA7C()
{
	glob4FABC = TextDrawCreate(223.953, 33.249, "lol");
	TextDrawFont(glob4FABC, 4);
	glob51028[0] = TextDrawCreate(201.2784, 448.0581, "soc:menu");
	TextDrawLetterSize(glob51028[0], 0.0, 0.0);
	TextDrawTextSize(glob51028[0], 285.7981, -32.6667);
	TextDrawAlignment(glob51028[0], 3);
	TextDrawColor(glob51028[0], 0xFFFFFFFF);
	TextDrawSetShadow(glob51028[0], 0);
	TextDrawSetOutline(glob51028[0], 0);
	TextDrawFont(glob51028[0], 4);
	glob51028[1] = TextDrawCreate(208.0234, 419.4166, "soc:icon_spalva");
	TextDrawLetterSize(glob51028[1], 0.0, 0.0);
	TextDrawTextSize(glob51028[1], 26.2371, 26.25);
	TextDrawAlignment(glob51028[1], 1);
	TextDrawColor(glob51028[1], 0xFFFFFFFF);
	TextDrawSetShadow(glob51028[1], 0);
	TextDrawSetOutline(glob51028[1], 0);
	TextDrawFont(glob51028[1], 4);
	TextDrawSetSelectable(glob51028[1], 1);
	glob51028[2] = TextDrawCreate(238.5402, 419.25, "soc:icon_ratai");
	TextDrawLetterSize(glob51028[2], 0.0, 0.0);
	TextDrawTextSize(glob51028[2], 26.2371, 26.25);
	TextDrawAlignment(glob51028[2], 1);
	TextDrawColor(glob51028[2], 0xFFFFFFFF);
	TextDrawSetShadow(glob51028[2], 0);
	TextDrawSetOutline(glob51028[2], 0);
	TextDrawFont(glob51028[2], 4);
	TextDrawSetSelectable(glob51028[2], 1);
	glob51028[3] = TextDrawCreate(268.5887, 419.6666, "LD_SPAC:white");
	TextDrawLetterSize(glob51028[3], 0.0, 0.0);
	TextDrawTextSize(glob51028[3], 26.2371, 26.25);
	TextDrawAlignment(glob51028[3], 1);
	TextDrawColor(glob51028[3], 0xFFFFFFFF);
	TextDrawSetShadow(glob51028[3], 0);
	TextDrawSetOutline(glob51028[3], 0);
	TextDrawFont(glob51028[3], 4);
	TextDrawSetSelectable(glob51028[3], 1);
	glob51028[4] = TextDrawCreate(298.1688, 419.4999, "LD_SPAC:white");
	TextDrawLetterSize(glob51028[4], 0.0, 0.0);
	TextDrawTextSize(glob51028[4], 26.2371, 26.25);
	TextDrawAlignment(glob51028[4], 1);
	TextDrawColor(glob51028[4], 0xFFFFFFFF);
	TextDrawSetShadow(glob51028[4], 0);
	TextDrawSetOutline(glob51028[4], 0);
	TextDrawFont(glob51028[4], 4);
	TextDrawSetSelectable(glob51028[4], 1);
	glob51028[5] = TextDrawCreate(327.7489, 419.3332, "LD_SPAC:white");
	TextDrawLetterSize(glob51028[5], 0.0, 0.0);
	TextDrawTextSize(glob51028[5], 26.2371, 26.25);
	TextDrawAlignment(glob51028[5], 1);
	TextDrawColor(glob51028[5], 0xFFFFFFFF);
	TextDrawSetShadow(glob51028[5], 0);
	TextDrawSetOutline(glob51028[5], 0);
	TextDrawFont(glob51028[5], 4);
	TextDrawSetSelectable(glob51028[5], 1);
	glob51028[6] = TextDrawCreate(357.3289, 419.1665, "LD_SPAC:white");
	TextDrawLetterSize(glob51028[6], 0.0, 0.0);
	TextDrawTextSize(glob51028[6], 26.2371, 26.25);
	TextDrawAlignment(glob51028[6], 1);
	TextDrawColor(glob51028[6], 0xFFFFFFFF);
	TextDrawSetShadow(glob51028[6], 0);
	TextDrawSetOutline(glob51028[6], 0);
	TextDrawFont(glob51028[6], 4);
	TextDrawSetSelectable(glob51028[6], 1);
	glob51028[7] = TextDrawCreate(416.0471, 435.75, "ATGAL");
	TextDrawLetterSize(glob51028[7], 0.1941, 1.0691);
	TextDrawAlignment(glob51028[7], 1);
	TextDrawColor(glob51028[7], 0xFFFFFFFF);
	TextDrawSetShadow(glob51028[7], 0);
	TextDrawSetOutline(glob51028[7], 1);
	TextDrawBackgroundColor(glob51028[7], 0x00000033);
	TextDrawFont(glob51028[7], 2);
	TextDrawSetProportional(glob51028[7], true);
	TextDrawSetSelectable(glob51028[7], 1);
	glob51028[8] = TextDrawCreate(465.7736, 436.1667, "pirkti");
	TextDrawLetterSize(glob51028[8], 0.1941, 1.0691);
	TextDrawTextSize(glob51028[8], 9.3704, 26.2499);
	TextDrawAlignment(glob51028[8], 2);
	TextDrawColor(glob51028[8], 0xFFFFFFFF);
	TextDrawSetShadow(glob51028[8], 0);
	TextDrawSetOutline(glob51028[8], 1);
	TextDrawBackgroundColor(glob51028[8], 0x00000033);
	TextDrawFont(glob51028[8], 2);
	TextDrawSetProportional(glob51028[8], true);
	TextDrawSetSelectable(glob51028[8], 1);
	glob51028[9] = TextDrawCreate(417.5786, 435.4167, "Iseiti");
	TextDrawLetterSize(glob51028[9], 0.1941, 1.0691);
	TextDrawAlignment(glob51028[9], 1);
	TextDrawColor(glob51028[9], 0xFFFFFFFF);
	TextDrawSetShadow(glob51028[9], 0);
	TextDrawSetOutline(glob51028[9], 1);
	TextDrawBackgroundColor(glob51028[9], 0x00000033);
	TextDrawFont(glob51028[9], 2);
	TextDrawSetProportional(glob51028[9], true);
	TextDrawSetSelectable(glob51028[9], 1);
	glob51028[10] = TextDrawCreate(386.9088, 419.5831, "LD_SPAC:white");
	TextDrawLetterSize(glob51028[10], 0.0, 0.0);
	TextDrawTextSize(glob51028[10], 26.2371, 26.25);
	TextDrawAlignment(glob51028[10], 1);
	TextDrawColor(glob51028[10], 0xFFFFFFFF);
	TextDrawSetShadow(glob51028[10], 0);
	TextDrawSetOutline(glob51028[10], 0);
	TextDrawFont(glob51028[10], 4);
	TextDrawSetSelectable(glob51028[10], 1);
	glob51028[11] = TextDrawCreate(217.019, 389.8418, "soc:menu");
	TextDrawLetterSize(glob51028[11], 0.0, 0.0);
	TextDrawTextSize(glob51028[11], 250.6588, 25.0833);
	TextDrawAlignment(glob51028[11], 1);
	TextDrawColor(glob51028[11], 0xFFFFFFFF);
	TextDrawSetShadow(glob51028[11], 0);
	TextDrawSetOutline(glob51028[11], 0);
	TextDrawFont(glob51028[11], 4);
	glob51028[12] = TextDrawCreate(223.4846, 392.5833, "LD_SPAC:white");
	TextDrawLetterSize(glob51028[12], 0.0, 0.0);
	TextDrawTextSize(glob51028[12], 20.6149, 19.8333);
	TextDrawAlignment(glob51028[12], 1);
	TextDrawColor(glob51028[12], 0xFFFFFFFF);
	TextDrawSetShadow(glob51028[12], 0);
	TextDrawSetOutline(glob51028[12], 0);
	TextDrawFont(glob51028[12], 4);
	TextDrawSetSelectable(glob51028[12], 1);
	glob51028[13] = TextDrawCreate(247.4421, 392.9999, "LD_SPAC:white");
	TextDrawLetterSize(glob51028[13], 0.0, 0.0);
	TextDrawTextSize(glob51028[13], 20.6149, 19.8333);
	TextDrawAlignment(glob51028[13], 1);
	TextDrawColor(glob51028[13], 0xFFFFFFFF);
	TextDrawSetShadow(glob51028[13], 0);
	TextDrawSetOutline(glob51028[13], 0);
	TextDrawFont(glob51028[13], 4);
	TextDrawSetSelectable(glob51028[13], 1);
	glob51028[14] = TextDrawCreate(271.3997, 393.4166, "LD_SPAC:white");
	TextDrawLetterSize(glob51028[14], 0.0, 0.0);
	TextDrawTextSize(glob51028[14], 20.6149, 19.8333);
	TextDrawAlignment(glob51028[14], 1);
	TextDrawColor(glob51028[14], 0xFFFFFFFF);
	TextDrawSetShadow(glob51028[14], 0);
	TextDrawSetOutline(glob51028[14], 0);
	TextDrawFont(glob51028[14], 4);
	TextDrawSetSelectable(glob51028[14], 1);
	glob51028[15] = TextDrawCreate(295.3573, 393.2498, "LD_SPAC:white");
	TextDrawLetterSize(glob51028[15], 0.0, 0.0);
	TextDrawTextSize(glob51028[15], 20.6149, 19.8333);
	TextDrawAlignment(glob51028[15], 1);
	TextDrawColor(glob51028[15], 0xFFFFFFFF);
	TextDrawSetShadow(glob51028[15], 0);
	TextDrawSetOutline(glob51028[15], 0);
	TextDrawFont(glob51028[15], 4);
	TextDrawSetSelectable(glob51028[15], 1);
	glob51028[16] = TextDrawCreate(318.8464, 393.0832, "LD_SPAC:white");
	TextDrawLetterSize(glob51028[16], 0.0, 0.0);
	TextDrawTextSize(glob51028[16], 20.6149, 19.8333);
	TextDrawAlignment(glob51028[16], 1);
	TextDrawColor(glob51028[16], 0xFFFFFFFF);
	TextDrawSetShadow(glob51028[16], 0);
	TextDrawSetOutline(glob51028[16], 0);
	TextDrawFont(glob51028[16], 4);
	TextDrawSetSelectable(glob51028[16], 1);
	glob51028[17] = TextDrawCreate(342.8039, 392.9165, "LD_SPAC:white");
	TextDrawLetterSize(glob51028[17], 0.0, 0.0);
	TextDrawTextSize(glob51028[17], 20.6149, 19.8333);
	TextDrawAlignment(glob51028[17], 1);
	TextDrawColor(glob51028[17], 0xFFFFFFFF);
	TextDrawSetShadow(glob51028[17], 0);
	TextDrawSetOutline(glob51028[17], 0);
	TextDrawFont(glob51028[17], 4);
	TextDrawSetSelectable(glob51028[17], 1);
	glob51028[18] = TextDrawCreate(366.7616, 393.3331, "LD_SPAC:white");
	TextDrawLetterSize(glob51028[18], 0.0, 0.0);
	TextDrawTextSize(glob51028[18], 20.6149, 19.8333);
	TextDrawAlignment(glob51028[18], 1);
	TextDrawColor(glob51028[18], 0xFFFFFFFF);
	TextDrawSetShadow(glob51028[18], 0);
	TextDrawSetOutline(glob51028[18], 0);
	TextDrawFont(glob51028[18], 4);
	TextDrawSetSelectable(glob51028[18], 1);
	glob51028[19] = TextDrawCreate(390.7192, 393.1665, "LD_SPAC:white");
	TextDrawLetterSize(glob51028[19], 0.0, 0.0);
	TextDrawTextSize(glob51028[19], 20.6149, 19.8333);
	TextDrawAlignment(glob51028[19], 1);
	TextDrawColor(glob51028[19], 0xFFFFFFFF);
	TextDrawSetShadow(glob51028[19], 0);
	TextDrawSetOutline(glob51028[19], 0);
	TextDrawFont(glob51028[19], 4);
	TextDrawSetSelectable(glob51028[19], 1);
	glob51028[20] = TextDrawCreate(414.8172, 392.9999, "LD_SPAC:white");
	TextDrawLetterSize(glob51028[20], 0.0, 0.0);
	TextDrawTextSize(glob51028[20], 20.6149, 19.8333);
	TextDrawAlignment(glob51028[20], 1);
	TextDrawColor(glob51028[20], 0xFFFFFFFF);
	TextDrawSetShadow(glob51028[20], 0);
	TextDrawSetOutline(glob51028[20], 0);
	TextDrawFont(glob51028[20], 4);
	TextDrawSetSelectable(glob51028[20], 1);
	glob51028[21] = TextDrawCreate(438.4468, 393.1248, "LD_SPAC:white");
	TextDrawLetterSize(glob51028[21], 0.0, 0.0);
	TextDrawTextSize(glob51028[21], 20.6149, 19.8333);
	TextDrawAlignment(glob51028[21], 1);
	TextDrawColor(glob51028[21], 0xFFFFFFFF);
	TextDrawSetShadow(glob51028[21], 0);
	TextDrawSetOutline(glob51028[21], 0);
	TextDrawFont(glob51028[21], 4);
	TextDrawSetSelectable(glob51028[21], 1);
	glob51B60 = TextDrawCreate(101.1259, 312.665, "soc:oldwood");
	TextDrawTextSize(glob51B60, 421.669, 125.416);
	TextDrawAlignment(glob51B60, 1);
	TextDrawColor(glob51B60, 0xFFFFFFFF);
	TextDrawFont(glob51B60, 4);
	glob51B64 = TextDrawCreate(149.925 - 30, 321.9979, "soc:empty");
	TextDrawLetterSize(glob51B64, 0.312, 3.845);
	TextDrawTextSize(glob51B64, 60.4519, 60.666);
	TextDrawAlignment(glob51B64, 2);
	TextDrawColor(glob51B64, 0xFFFFFF00);
	TextDrawUseBox(glob51B64, true);
	TextDrawBoxColor(glob51B64, 0x00000000);
	TextDrawSetOutline(glob51B64, 1);
	TextDrawFont(glob51B64, 4);
	TextDrawSetProportional(glob51B64, true);
	TextDrawSetSelectable(glob51B64, 1);
	glob51B68 = TextDrawCreate(473.2359 - 30, 322.4979, "soc:empty");
	TextDrawLetterSize(glob51B68, 0.312, 3.845);
	TextDrawTextSize(glob51B68, 60.4519, 60.666);
	TextDrawAlignment(glob51B68, 2);
	TextDrawColor(glob51B68, 0xFFFFFF00);
	TextDrawUseBox(glob51B68, true);
	TextDrawBoxColor(glob51B68, 0x00000000);
	TextDrawSetOutline(glob51B68, 1);
	TextDrawFont(glob51B68, 4);
	TextDrawSetProportional(glob51B68, true);
	TextDrawSetSelectable(glob51B68, 1);
	glob51B6C = TextDrawCreate(157.485 - 30, 398.2479, "soc:empty");
	TextDrawLetterSize(glob51B6C, 0.312, 3.845);
	TextDrawTextSize(glob51B6C, 61.858, 70.583);
	TextDrawAlignment(glob51B6C, 2);
	TextDrawColor(glob51B6C, 0xFFFFFF00);
	TextDrawUseBox(glob51B6C, true);
	TextDrawBoxColor(glob51B6C, 0x00000000);
	TextDrawSetOutline(glob51B6C, 1);
	TextDrawFont(glob51B6C, 4);
	TextDrawSetProportional(glob51B6C, true);
	TextDrawSetSelectable(glob51B6C, 1);
	glob51B70 = TextDrawCreate(465.803 - 30, 399.333, "soc:empty");
	TextDrawLetterSize(glob51B70, 0.312, 3.845);
	TextDrawTextSize(glob51B70, 62.796, 82.833);
	TextDrawAlignment(glob51B70, 2);
	TextDrawColor(glob51B70, 0xFFFFFF00);
	TextDrawUseBox(glob51B70, true);
	TextDrawBoxColor(glob51B70, 0x00000000);
	TextDrawSetOutline(glob51B70, 1);
	TextDrawFont(glob51B70, 4);
	TextDrawSetProportional(glob51B70, true);
	TextDrawSetSelectable(glob51B70, 1);
	glob51B74 = TextDrawCreate(309.8169 - 30, 413.2479, "soc:empty");
	TextDrawLetterSize(glob51B74, 0.321, 1.855);
	TextDrawTextSize(glob51B74, 50.6139, 79.916);
	TextDrawAlignment(glob51B74, 2);
	TextDrawColor(glob51B74, 0xFFFFFF00);
	TextDrawUseBox(glob51B74, true);
	TextDrawBoxColor(glob51B74, 0x00000000);
	TextDrawSetOutline(glob51B74, 1);
	TextDrawFont(glob51B74, 4);
	TextDrawSetProportional(glob51B74, true);
	TextDrawSetSelectable(glob51B74, 1);
	glob51D08 = TextDrawCreate(393.5, 85.125, "box");
	TextDrawLetterSize(glob51D08, 0.0, 32.0369);
	TextDrawTextSize(glob51D08, 242.5, 0.0);
	TextDrawAlignment(glob51D08, 1);
	TextDrawColor(glob51D08, 0x00000000);
	TextDrawUseBox(glob51D08, true);
	TextDrawBoxColor(glob51D08, 0x00000066);
	TextDrawFont(glob51D08, 0);
	glob51D0C = TextDrawCreate(389.5, 112.0049, "box");
	TextDrawLetterSize(glob51D0C, 0.0, 25.649);
	TextDrawTextSize(glob51D0C, 246.5, 0.0);
	TextDrawAlignment(glob51D0C, 1);
	TextDrawColor(glob51D0C, 0x00000000);
	TextDrawUseBox(glob51D0C, true);
	TextDrawBoxColor(glob51D0C, 0x00000066);
	TextDrawFont(glob51D0C, 0);
	glob51D10 = TextDrawCreate(318.0, 89.5989, "Parduotuve 24/7");
	TextDrawLetterSize(glob51D10, 0.2639, 1.286);
	TextDrawAlignment(glob51D10, 2);
	TextDrawColor(glob51D10, 0xFFFFFFFF);
	TextDrawSetOutline(glob51D10, 1);
	TextDrawBackgroundColor(glob51D10, 0x00000033);
	TextDrawFont(glob51D10, 2);
	TextDrawSetProportional(glob51D10, true);
	glob51D14 = TextDrawCreate(361.5, 109.7649, "svoris");
	TextDrawLetterSize(glob51D14, 0.155, 1.0089);
	TextDrawAlignment(glob51D14, 1);
	TextDrawColor(glob51D14, 0xFFFFFFFF);
	TextDrawSetOutline(glob51D14, 1);
	TextDrawBackgroundColor(glob51D14, 0x00000033);
	TextDrawFont(glob51D14, 2);
	TextDrawSetProportional(glob51D14, true);
	glob51D18 = TextDrawCreate(312.0, 109.5179, "kiekis");
	TextDrawLetterSize(glob51D18, 0.155, 1.0089);
	TextDrawAlignment(glob51D18, 1);
	TextDrawColor(glob51D18, 0xFFFFFFFF);
	TextDrawSetOutline(glob51D18, 1);
	TextDrawBackgroundColor(glob51D18, 0x00000033);
	TextDrawFont(glob51D18, 2);
	TextDrawSetProportional(glob51D18, true);
	glob51D1C = TextDrawCreate(338.0, 110.013, "kaina");
	TextDrawLetterSize(glob51D1C, 0.155, 1.0089);
	TextDrawAlignment(glob51D1C, 1);
	TextDrawColor(glob51D1C, 0xFFFFFFFF);
	TextDrawSetOutline(glob51D1C, 1);
	TextDrawBackgroundColor(glob51D1C, 0x00000033);
	TextDrawFont(glob51D1C, 2);
	TextDrawSetProportional(glob51D1C, true);
	glob51D20 = TextDrawCreate(253.5, 109.273, "pavadinimas");
	TextDrawLetterSize(glob51D20, 0.155, 1.0089);
	TextDrawAlignment(glob51D20, 1);
	TextDrawColor(glob51D20, 0xFFFFFFFF);
	TextDrawSetOutline(glob51D20, 1);
	TextDrawBackgroundColor(glob51D20, 0x00000033);
	TextDrawFont(glob51D20, 2);
	TextDrawSetProportional(glob51D20, true);
	glob51D24 = TextDrawCreate(242.5, 113.259, "-");
	TextDrawLetterSize(glob51D28, 12.057, 1.271);
	TextDrawAlignment(glob51D28, 1);
	TextDrawColor(glob51D28, 0xFFFFFFFF);
	TextDrawSetOutline(glob51D28, 1);
	TextDrawBackgroundColor(glob51D28, 0x00000033);
	TextDrawFont(glob51D28, 2);
	TextDrawSetProportional(glob51D28, true);
	glob51D28 = TextDrawCreate(254.5, 123.958, "test");
	TextDrawLetterSize(glob51D24, 0.155, 1.0089);
	TextDrawTextSize(glob51D24, 382.5, 179.199);
	TextDrawAlignment(glob51D24, 1);
	TextDrawColor(glob51D24, 0xFFFFFFFF);
	TextDrawUseBox(glob51D24, true);
	TextDrawBoxColor(glob51D24, 0x00000066);
	TextDrawSetOutline(glob51D24, 1);
	TextDrawBackgroundColor(glob51D24, 0x00000033);
	TextDrawFont(glob51D24, 2);
	TextDrawSetProportional(glob51D24, true);
	TextDrawSetSelectable(glob51D24, 1);
	glob51D2C = TextDrawCreate(312.0, 123.958, "0k");
	TextDrawLetterSize(glob51D2C, 0.155, 1.0089);
	TextDrawAlignment(glob51D2C, 1);
	TextDrawColor(glob51D2C, 0xFFFFFFFF);
	TextDrawSetOutline(glob51D2C, 1);
	TextDrawBackgroundColor(glob51D2C, 0x00000033);
	TextDrawFont(glob51D2C, 2);
	TextDrawSetProportional(glob51D2C, true);
	glob51D30 = TextDrawCreate(339.0, 123.958, "0kn");
	TextDrawLetterSize(glob51D30, 0.155, 1.0089);
	TextDrawAlignment(glob51D30, 1);
	TextDrawColor(glob51D30, 0xFFFFFFFF);
	TextDrawSetOutline(glob51D30, 1);
	TextDrawBackgroundColor(glob51D30, 0x00000033);
	TextDrawFont(glob51D30, 2);
	TextDrawSetProportional(glob51D30, true);
	glob51D34 = TextDrawCreate(363.5, 123.958, "0s");
	TextDrawLetterSize(glob51D34, 0.155, 1.0089);
	TextDrawAlignment(glob51D34, 1);
	TextDrawColor(glob51D34, 0xFFFFFFFF);
	TextDrawSetOutline(glob51D34, 1);
	TextDrawBackgroundColor(glob51D34, 0x00000033);
	TextDrawFont(glob51D34, 2);
	TextDrawSetProportional(glob51D34, true);
	glob51D38 = TextDrawCreate(317.5, 354.665, "UZDARYTI");
	TextDrawLetterSize(glob51D38, 0.266, 1.473);
	TextDrawTextSize(glob51D38, -15.5, 70.1849);
	TextDrawAlignment(glob51D38, 2);
	TextDrawColor(glob51D38, 0xFFFFFFFF);
	TextDrawUseBox(glob51D38, true);
	TextDrawBoxColor(glob51D38, 0x00000066);
	TextDrawSetOutline(glob51D38, 1);
	TextDrawBackgroundColor(glob51D38, 0x00000033);
	TextDrawFont(glob51D38, 2);
	TextDrawSetProportional(glob51D38, true);
	TextDrawSetSelectable(glob51D38, 1);
	glob51D3C = TextDrawCreate(254.5, 139.393, "test2");
	TextDrawLetterSize(glob51D3C, 0.155, 1.0089);
	TextDrawTextSize(glob51D3C, 382.5, 132.906);
	TextDrawAlignment(glob51D3C, 1);
	TextDrawColor(glob51D3C, 0xFFFFFFFF);
	TextDrawUseBox(glob51D3C, true);
	TextDrawBoxColor(glob51D3C, 0x00000066);
	TextDrawSetOutline(glob51D3C, 1);
	TextDrawBackgroundColor(glob51D3C, 0x00000033);
	TextDrawFont(glob51D3C, 2);
	TextDrawSetProportional(glob51D3C, true);
	TextDrawSetSelectable(glob51D3C, 1);
	glob51D40 = TextDrawCreate(243.0, 338.506, "-");
	TextDrawLetterSize(glob51D40, 12.057, 1.271);
	TextDrawAlignment(glob51D40, 1);
	TextDrawColor(glob51D40, 0xFFFFFFFF);
	TextDrawSetOutline(glob51D40, 1);
	TextDrawBackgroundColor(glob51D40, 0x00000033);
	TextDrawFont(glob51D40, 2);
	TextDrawSetProportional(glob51D40, true);
	glob510D0 = TextDrawCreate(642.0, 0.0, "box");
	TextDrawLetterSize(glob510D0, 0.0, 7.73);
	TextDrawTextSize(glob510D0, -2.0, 0.0);
	TextDrawAlignment(glob510D0, 1);
	TextDrawColor(glob510D0, 0x00000000);
	TextDrawUseBox(glob510D0, true);
	TextDrawBoxColor(glob510D0, 0x00000066);
	TextDrawFont(glob510D0, 0);
	glob510D4 = TextDrawCreate(642.0, 375.3309, "box");
	TextDrawLetterSize(glob510D4, 0.0, 7.73);
	TextDrawTextSize(glob510D4, -2.0, 0.0);
	TextDrawAlignment(glob510D4, 1);
	TextDrawColor(glob510D4, 0x00000000);
	TextDrawUseBox(glob510D4, true);
	TextDrawBoxColor(glob510D4, 0x00000066);
	TextDrawFont(glob510D4, 0);
	glob510D8 = TextDrawCreate(321.0, 161.279, "Prisijungimas~n~Sveikas atvykes i ~b~Story of Cities~w~ !");
	TextDrawLetterSize(glob510D8, 0.372, 2.0769);
	TextDrawTextSize(glob510D8, 496.5, 335.252);
	TextDrawAlignment(glob510D8, 2);
	TextDrawColor(glob510D8, 0xFFFFFFFF);
	TextDrawSetOutline(glob510D8, 1);
	TextDrawBackgroundColor(glob510D8, 0x00000033);
	TextDrawFont(glob510D8, 2);
	TextDrawSetProportional(glob510D8, true);
	glob510DC = TextDrawCreate(320.5, 214.792, "Zaidimui siame serveryje, reikalingas patch'as, kuri parsisiusti gali ~b~www.soc.lt~w~~n~Be sio patch'o prisijungti nepavyks.");
	TextDrawLetterSize(glob510DC, 0.2199, 1.248);
	TextDrawTextSize(glob510DC, 496.5, 335.252);
	TextDrawAlignment(glob510DC, 2);
	TextDrawColor(glob510DC, 0xFFFFFFFF);
	TextDrawSetOutline(glob510DC, 1);
	TextDrawBackgroundColor(glob510DC, 0x00000033);
	TextDrawFont(glob510DC, 2);
	TextDrawSetProportional(glob510DC, true);
	glob510E0 = TextDrawCreate(38.0, 194.1329, "-");
	TextDrawLetterSize(glob510E0, 46.823, 2.8169);
	TextDrawAlignment(glob510E0, 1);
	TextDrawColor(glob510E0, 0xFFFFFFFF);
	TextDrawSetOutline(glob510E0, 1);
	TextDrawBackgroundColor(glob510E0, 0x00000033);
	TextDrawFont(glob510E0, 2);
	TextDrawSetProportional(glob510E0, true);
	glob4FB60[0] = TextDrawCreate(602.0, 100.0, "]");
	TextDrawLetterSize(glob4FB60[0], 0.449, 1.6);
	TextDrawTextSize(glob4FB60[0], 221.0, 0.0);
	TextDrawAlignment(glob4FB60[0], 2);
	TextDrawColor(glob4FB60[0], 0xFFBF00FF);
	TextDrawSetOutline(glob4FB60[0], 1);
	TextDrawBackgroundColor(glob4FB60[0], 0x000000FF);
	TextDrawFont(glob4FB60[0], 0);
	TextDrawSetProportional(glob4FB60[0], true);
	glob4FB60[1] = TextDrawCreate(592.0, 100.0, "]");
	TextDrawLetterSize(glob4FB60[1], 0.449, 1.6);
	TextDrawTextSize(glob4FB60[1], 221.0, 0.0);
	TextDrawAlignment(glob4FB60[1], 2);
	TextDrawColor(glob4FB60[1], 0xFFBF00FF);
	TextDrawSetOutline(glob4FB60[1], 1);
	TextDrawBackgroundColor(glob4FB60[1], 0x000000FF);
	TextDrawFont(glob4FB60[1], 0);
	TextDrawSetProportional(glob4FB60[1], true);
	glob4FB60[2] = TextDrawCreate(582.0, 100.0, "]");
	TextDrawLetterSize(glob4FB60[2], 0.449, 1.6);
	TextDrawTextSize(glob4FB60[2], 221.0, 0.0);
	TextDrawAlignment(glob4FB60[2], 2);
	TextDrawColor(glob4FB60[2], 0xFFBF00FF);
	TextDrawSetOutline(glob4FB60[2], 1);
	TextDrawBackgroundColor(glob4FB60[2], 0x000000FF);
	TextDrawFont(glob4FB60[2], 0);
	TextDrawSetProportional(glob4FB60[2], true);
	glob4FB60[3] = TextDrawCreate(572.0, 100.0, "]");
	TextDrawLetterSize(glob4FB60[3], 0.449, 1.6);
	TextDrawTextSize(glob4FB60[3], 221.0, 0.0);
	TextDrawAlignment(glob4FB60[3], 2);
	TextDrawColor(glob4FB60[3], 0xFFBF00FF);
	TextDrawSetOutline(glob4FB60[3], 1);
	TextDrawBackgroundColor(glob4FB60[3], 0x000000FF);
	TextDrawFont(glob4FB60[3], 0);
	TextDrawSetProportional(glob4FB60[3], true);
	glob4FB60[4] = TextDrawCreate(562.0, 100.0, "]");
	TextDrawLetterSize(glob4FB60[4], 0.449, 1.6);
	TextDrawTextSize(glob4FB60[4], 221.0, 0.0);
	TextDrawAlignment(glob4FB60[4], 2);
	TextDrawColor(glob4FB60[4], 0xFFBF00FF);
	TextDrawSetOutline(glob4FB60[4], 1);
	TextDrawBackgroundColor(glob4FB60[4], 0x000000FF);
	TextDrawFont(glob4FB60[4], 0);
	TextDrawSetProportional(glob4FB60[4], true);
	glob4FB60[5] = TextDrawCreate(552.0, 100.0, "]");
	TextDrawLetterSize(glob4FB60[5], 0.449, 1.6);
	TextDrawTextSize(glob4FB60[5], 221.0, 0.0);
	TextDrawAlignment(glob4FB60[5], 2);
	TextDrawColor(glob4FB60[5], 0xFFBF00FF);
	TextDrawSetOutline(glob4FB60[5], 1);
	TextDrawBackgroundColor(glob4FB60[5], 0x000000FF);
	TextDrawFont(glob4FB60[5], 0);
	TextDrawSetProportional(glob4FB60[5], true);
	glob4FB60[6] = TextDrawCreate(542.0, 100.0, "]");
	TextDrawLetterSize(glob4FB60[6], 0.449, 1.6);
	TextDrawTextSize(glob4FB60[6], 221.0, 0.0);
	TextDrawAlignment(glob4FB60[6], 2);
	TextDrawColor(glob4FB60[6], 0xFFBF00FF);
	TextDrawSetOutline(glob4FB60[6], 1);
	TextDrawBackgroundColor(glob4FB60[6], 0x000000FF);
	TextDrawFont(glob4FB60[6], 0);
	TextDrawSetProportional(glob4FB60[6], true);
	glob4FB60[7] = TextDrawCreate(532.0, 100.0, "]");
	TextDrawLetterSize(glob4FB60[7], 0.449, 1.6);
	TextDrawTextSize(glob4FB60[7], 221.0, 0.0);
	TextDrawAlignment(glob4FB60[7], 2);
	TextDrawColor(glob4FB60[7], 0xFFBF00FF);
	TextDrawSetOutline(glob4FB60[7], 1);
	TextDrawBackgroundColor(glob4FB60[7], 0x000000FF);
	TextDrawFont(glob4FB60[7], 0);
	TextDrawSetProportional(glob4FB60[7], true);
	glob4FB60[8] = TextDrawCreate(522.0, 100.0, "]");
	TextDrawLetterSize(glob4FB60[8], 0.449, 1.6);
	TextDrawTextSize(glob4FB60[8], 221.0, 0.0);
	TextDrawAlignment(glob4FB60[8], 2);
	TextDrawColor(glob4FB60[8], 0xFFBF00FF);
	TextDrawSetOutline(glob4FB60[8], 1);
	TextDrawBackgroundColor(glob4FB60[8], 0x000000FF);
	TextDrawFont(glob4FB60[8], 0);
	TextDrawSetProportional(glob4FB60[8], true);
	glob4FB60[9] = TextDrawCreate(512.0, 100.0, "]");
	TextDrawLetterSize(glob4FB60[9], 0.449, 1.6);
	TextDrawTextSize(glob4FB60[9], 221.0, 0.0);
	TextDrawAlignment(glob4FB60[9], 2);
	TextDrawColor(glob4FB60[9], 0xFFBF00FF);
	TextDrawSetOutline(glob4FB60[9], 1);
	TextDrawBackgroundColor(glob4FB60[9], 0x000000FF);
	TextDrawFont(glob4FB60[9], 0);
	TextDrawSetProportional(glob4FB60[9], true);
	glob51D44 = TextDrawCreate(641.5, 338.246, "box");
	TextDrawLetterSize(glob51D44, 0.0, 11.961);
	TextDrawTextSize(glob51D44, -2.0, 0.0);
	TextDrawAlignment(glob51D44, 1);
	TextDrawColor(glob51D44, 0x0000007C);
	TextDrawUseBox(glob51D44, true);
	TextDrawBoxColor(glob51D44, 0x000000FF);
	TextDrawSetShadow(glob51D44, 79);
	TextDrawBackgroundColor(glob51D44, 0x00000066);
	TextDrawFont(glob51D44, 0);
	glob51D48 = TextDrawCreate(128.5, 1.5, "box");
	TextDrawLetterSize(glob51D48, 0.0, 49.3769);
	TextDrawTextSize(glob51D48, -2.0, 0.0);
	TextDrawAlignment(glob51D48, 1);
	TextDrawColor(glob51D48, 0x000000F0);
	TextDrawUseBox(glob51D48, true);
	TextDrawBoxColor(glob51D48, 0x0000007C);
	TextDrawFont(glob51D48, 0);
	glob51D4C = TextDrawCreate(644.5, 2.0, "box");
	TextDrawLetterSize(glob51D4C, 0.0, 49.3769);
	TextDrawTextSize(glob51D4C, 513.5, 0.0);
	TextDrawAlignment(glob51D4C, 1);
	TextDrawColor(glob51D4C, 0x000000F0);
	TextDrawUseBox(glob51D4C, true);
	TextDrawBoxColor(glob51D4C, 0x000000FF);
	TextDrawFont(glob51D4C, 0);
	glob51D50 = TextDrawCreate(642.0, 1.253, "box");
	TextDrawLetterSize(glob51D50, 0.0, 11.961);
	TextDrawTextSize(glob51D50, -2.0, 0.0);
	TextDrawAlignment(glob51D50, 1);
	TextDrawColor(glob51D50, 0x0000007C);
	TextDrawUseBox(glob51D50, true);
	TextDrawBoxColor(glob51D50, 0x000000FF);
	TextDrawFont(glob51D50, 0);
	glob51D54 = TextDrawCreate(493.5, 365.8649, "LD_SPAC:white");
	TextDrawTextSize(glob51D54, -350.0, -0.7451);
	TextDrawAlignment(glob51D54, 1);
	TextDrawColor(glob51D54, 0xFFFFFFFF);
	TextDrawFont(glob51D54, 4);
	glob51D58 = TextDrawCreate(488.0, 312.105, "LD_BEAT:right");
	TextDrawTextSize(glob51D58, 26.0, 23.145);
	TextDrawAlignment(glob51D58, 2);
	TextDrawColor(glob51D58, 0xFFFFFFFF);
	TextDrawFont(glob51D58, 4);
	TextDrawSetProportional(glob51D58, true);
	TextDrawSetSelectable(glob51D58, 1);
	glob51D5C = TextDrawCreate(130.0, 311.859, "LD_BEAT:left");
	TextDrawTextSize(glob51D5C, 26.0, 23.145);
	TextDrawAlignment(glob51D5C, 2);
	TextDrawColor(glob51D5C, 0xFFFFFFFF);
	TextDrawFont(glob51D5C, 4);
	TextDrawSetProportional(glob51D5C, true);
	TextDrawSetSelectable(glob51D5C, 1);
	glob51D60 = TextDrawCreate(322.0, 85.8649, "Story of Cities");
	TextDrawLetterSize(glob51D60, 0.503, 2.272);
	TextDrawAlignment(glob51D60, 2);
	TextDrawColor(glob51D60, 0xFF7600FF);
	TextDrawSetOutline(glob51D60, 1);
	TextDrawBackgroundColor(glob51D60, 0x00000033);
	TextDrawFont(glob51D60, 0);
	TextDrawSetProportional(glob51D60, true);
	glob51D64 = TextDrawCreate(4.5, 436.799, "Jeigu neina nieko pasirinkti, rasyk /fix");
	TextDrawLetterSize(glob51D64, 0.18, 0.949);
	TextDrawTextSize(glob51D54, 0.0, 300.0);
	TextDrawAlignment(glob51D64, 1);
	TextDrawColor(glob51D64, 0xFFFFFFFF);
	TextDrawSetOutline(glob51D64, 1);
	TextDrawBackgroundColor(glob51D64, 0x00000033);
	TextDrawUseBox(glob51D64, true);
	TextDrawBoxColor(glob51D64, 0x000000FF);
	TextDrawFont(glob51D64, 2);
	TextDrawSetProportional(glob51D64, true);
	glob51D68 = TextDrawCreate(153.5, 403.7, "Ji paspaudus praleisi labai daug svarbiu ir graziu dalyku,~n~kuriuos pamatysi paspaudus 'Pradeti' desineje.");
	TextDrawLetterSize(glob51D68, 0.25, 1.36);
	TextDrawAlignment(glob51D68, 1);
	TextDrawColor(glob51D68, 0xFFFFFFFF);
	TextDrawSetOutline(glob51D68, 1);
	TextDrawBackgroundColor(glob51D68, 0x00000033);
	TextDrawFont(glob51D68, 1);
	TextDrawSetProportional(glob51D68, true);
	glob51D6C = TextDrawCreate(153.5, 372.092, "Isvaizda rinkis atsakingai, jos keisti artimiausiu metu nebegalesi.~n~Jei skubi, kaireje puseje yra mygtukas 'skip'.");
	TextDrawLetterSize(glob51D6C, 0.25, 1.36);
	TextDrawAlignment(glob51D6C, 1);
	TextDrawColor(glob51D6C, 0xFFFFFFFF);
	TextDrawSetOutline(glob51D6C, 1);
	TextDrawBackgroundColor(glob51D6C, 0x00000033);
	TextDrawFont(glob51D6C, 1);
	TextDrawSetProportional(glob51D6C, true);
	glob51D70 = TextDrawCreate(322.5, 86.3649, "Story of Cities");
	TextDrawLetterSize(glob51D70, 0.503, 2.272);
	TextDrawAlignment(glob51D70, 2);
	TextDrawColor(glob51D70, 0xFF7600FF);
	TextDrawSetOutline(glob51D70, 1);
	TextDrawBackgroundColor(glob51D70, 0x00000033);
	TextDrawFont(glob51D70, 0);
	TextDrawSetProportional(glob51D70, true);
	glob51D74 = TextDrawCreate(323.0, 86.8649, "Story of Cities");
	TextDrawLetterSize(glob51D74, 0.503, 2.272);
	TextDrawAlignment(glob51D74, 2);
	TextDrawColor(glob51D74, 0xFF7600FF);
	TextDrawSetOutline(glob51D74, 1);
	TextDrawBackgroundColor(glob51D74, 0x00000033);
	TextDrawFont(glob51D74, 0);
	TextDrawSetProportional(glob51D74, true);
	glob51D78 = TextDrawCreate(323.5, 87.3649, "Story of Cities");
	TextDrawLetterSize(glob51D78, 0.503, 2.272);
	TextDrawAlignment(glob51D78, 2);
	TextDrawColor(glob51D78, 0xFC9400FF);
	TextDrawSetOutline(glob51D78, 1);
	TextDrawBackgroundColor(glob51D78, 0x00000033);
	TextDrawFont(glob51D78, 0);
	TextDrawSetProportional(glob51D78, true);
	glob51B34 = TextDrawCreate(320.0, 110.0, "informacija~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~");
	TextDrawAlignment(glob51B34, 2);
	TextDrawBackgroundColor(glob51B34, 0x000000FF);
	TextDrawFont(glob51B34, 2);
	TextDrawLetterSize(glob51B34, 0.3499, 1.5999);
	TextDrawColor(glob51B34, 0xFFFFFFFF);
	TextDrawSetOutline(glob51B34, 0);
	TextDrawSetProportional(glob51B34, true);
	TextDrawSetShadow(glob51B34, 1);
	TextDrawUseBox(glob51B34, true);
	TextDrawBoxColor(glob51B34, 0x00000055);
	TextDrawTextSize(glob51B34, 10.0, 410.0);
	glob51B38 = TextDrawCreate(183.0, 149.0, "Serveris");
	TextDrawAlignment(glob51B38, 2);
	TextDrawBackgroundColor(glob51B38, 0x000000FF);
	TextDrawFont(glob51B38, 1);
	TextDrawLetterSize(glob51B38, 0.37, 1.7999);
	TextDrawColor(glob51B38, 0xFFFFFFFF);
	TextDrawSetOutline(glob51B38, 0);
	TextDrawSetProportional(glob51B38, true);
	TextDrawSetShadow(glob51B38, 1);
	TextDrawUseBox(glob51B38, true);
	TextDrawBoxColor(glob51B38, 0x00000000);
	TextDrawTextSize(glob51B38, 15.0, 52.0);
	glob51B3C = TextDrawCreate(320.0, 150.0, "D.U.K");
	TextDrawAlignment(glob51B3C, 2);
	TextDrawBackgroundColor(glob51B3C, 0x000000FF);
	TextDrawFont(glob51B3C, 1);
	TextDrawLetterSize(glob51B3C, 0.37, 1.7999);
	TextDrawColor(glob51B3C, 0xFFFFFFFF);
	TextDrawSetOutline(glob51B3C, 0);
	TextDrawSetProportional(glob51B3C, true);
	TextDrawSetShadow(glob51B3C, 1);
	TextDrawUseBox(glob51B3C, true);
	TextDrawBoxColor(glob51B3C, 0x00000000);
	TextDrawTextSize(glob51B3C, 15.0, 52.0);
	glob51B40 = TextDrawCreate(460.0, 150.0, "Komandos");
	TextDrawAlignment(glob51B40, 2);
	TextDrawBackgroundColor(glob51B40, 0x000000FF);
	TextDrawFont(glob51B40, 1);
	TextDrawLetterSize(glob51B40, 0.37, 1.7999);
	TextDrawColor(glob51B40, 0xFFFFFFFF);
	TextDrawSetOutline(glob51B40, 0);
	TextDrawSetProportional(glob51B40, true);
	TextDrawSetShadow(glob51B40, 1);
	TextDrawUseBox(glob51B40, true);
	TextDrawBoxColor(glob51B40, 0x00000000);
	TextDrawTextSize(glob51B40, 15.0, 52.0);
	glob51B44 = TextDrawCreate(190.0, 200.0, "Pasiekimai");
	TextDrawAlignment(glob51B44, 2);
	TextDrawBackgroundColor(glob51B44, 0x000000FF);
	TextDrawFont(glob51B44, 1);
	TextDrawLetterSize(glob51B44, 0.37, 1.7999);
	TextDrawColor(glob51B44, 0xFFFFFFFF);
	TextDrawSetOutline(glob51B44, 0);
	TextDrawSetProportional(glob51B44, true);
	TextDrawSetShadow(glob51B44, 1);
	TextDrawUseBox(glob51B44, true);
	TextDrawBoxColor(glob51B44, 0x00000000);
	TextDrawTextSize(glob51B44, 15.0, 52.0);
	glob51B48 = TextDrawCreate(320.0, 200.0, "V.I.P.");
	TextDrawAlignment(glob51B48, 2);
	TextDrawBackgroundColor(glob51B48, 0x000000FF);
	TextDrawFont(glob51B48, 1);
	TextDrawLetterSize(glob51B48, 0.37, 1.7999);
	TextDrawColor(glob51B48, 0xFFFFFFFF);
	TextDrawSetOutline(glob51B48, 0);
	TextDrawSetProportional(glob51B48, true);
	TextDrawSetShadow(glob51B48, 1);
	TextDrawUseBox(glob51B48, true);
	TextDrawBoxColor(glob51B48, 0x00000000);
	TextDrawTextSize(glob51B48, 15.0, 52.0);
	glob51B4C = TextDrawCreate(460.0, 200.0, "Mygtukai");
	TextDrawAlignment(glob51B4C, 2);
	TextDrawBackgroundColor(glob51B4C, 0x000000FF);
	TextDrawFont(glob51B4C, 1);
	TextDrawLetterSize(glob51B4C, 0.37, 1.7999);
	TextDrawColor(glob51B4C, 0xFFFFFFFF);
	TextDrawSetOutline(glob51B4C, 0);
	TextDrawSetProportional(glob51B4C, true);
	TextDrawSetShadow(glob51B4C, 1);
	TextDrawUseBox(glob51B4C, true);
	TextDrawBoxColor(glob51B4C, 0x00000000);
	TextDrawTextSize(glob51B4C, 15.0, 52.0);
	glob51B50 = TextDrawCreate(187.0, 250.0, "Naujienos");
	TextDrawAlignment(glob51B50, 2);
	TextDrawBackgroundColor(glob51B50, 0x000000FF);
	TextDrawFont(glob51B50, 1);
	TextDrawLetterSize(glob51B50, 0.37, 1.7999);
	TextDrawColor(glob51B50, 0xFFFFFFFF);
	TextDrawSetOutline(glob51B50, 0);
	TextDrawSetProportional(glob51B50, true);
	TextDrawSetShadow(glob51B50, 1);
	TextDrawUseBox(glob51B50, true);
	TextDrawBoxColor(glob51B50, 0x00000000);
	TextDrawTextSize(glob51B50, 15.0, 93.0);
	glob51B54 = TextDrawCreate(322.0, 250.0, "T.O.P.");
	TextDrawAlignment(glob51B54, 2);
	TextDrawBackgroundColor(glob51B54, 0x000000FF);
	TextDrawFont(glob51B54, 1);
	TextDrawLetterSize(glob51B54, 0.37, 1.7999);
	TextDrawColor(glob51B54, 0xFFFFFFFF);
	TextDrawSetOutline(glob51B54, 0);
	TextDrawSetProportional(glob51B54, true);
	TextDrawSetShadow(glob51B54, 1);
	TextDrawUseBox(glob51B54, true);
	TextDrawBoxColor(glob51B54, 0x00000000);
	TextDrawTextSize(glob51B54, 15.0, 93.0);
	glob51B58 = TextDrawCreate(462.0, 250.0, "Teksto spalvos");
	TextDrawAlignment(glob51B58, 2);
	TextDrawBackgroundColor(glob51B58, 0x000000FF);
	TextDrawFont(glob51B58, 1);
	TextDrawLetterSize(glob51B58, 0.37, 1.7999);
	TextDrawColor(glob51B58, 0xFFFFFFFF);
	TextDrawSetOutline(glob51B58, 0);
	TextDrawSetProportional(glob51B58, true);
	TextDrawSetShadow(glob51B58, 1);
	TextDrawUseBox(glob51B58, true);
	TextDrawBoxColor(glob51B58, 0x00000000);
	TextDrawTextSize(glob51B58, 15.0, 93.0);
	glob51B5C = TextDrawCreate(501.0, 311.0, "Close");
	TextDrawAlignment(glob51B5C, 2);
	TextDrawBackgroundColor(glob51B5C, 0x000000FF);
	TextDrawFont(glob51B5C, 2);
	TextDrawLetterSize(glob51B5C, 0.33, 1.7);
	TextDrawColor(glob51B5C, 0xFF7725FF);
	TextDrawSetOutline(glob51B5C, 0);
	TextDrawSetProportional(glob51B5C, true);
	TextDrawSetShadow(glob51B5C, 1);
	TextDrawUseBox(glob51B5C, true);
	TextDrawBoxColor(glob51B5C, 0x00000000);
	TextDrawTextSize(glob51B5C, 15.0, 93.0);
	print(" ---:: TextDraw'ai");
	return 0;
}

function18CB0(playerid)
{
	TextDrawHideForPlayer(playerid, glob51D44);
	glob51D44 = 65535;
	TextDrawHideForPlayer(playerid, glob51D48);
	glob51D48 = 65535;
	TextDrawHideForPlayer(playerid, glob51D4C);
	glob51D4C = 65535;
	TextDrawHideForPlayer(playerid, glob51D50);
	glob51D50 = 65535;
	TextDrawHideForPlayer(playerid, glob51D54);
	glob51D54 = 65535;
	TextDrawHideForPlayer(playerid, glob51D58);
	glob51D58 = 65535;
	TextDrawHideForPlayer(playerid, glob51D5C);
	glob51D5C = 65535;
	TextDrawHideForPlayer(playerid, glob51D60);
	glob51D60 = 65535;
	TextDrawHideForPlayer(playerid, glob51D64);
	glob51D64 = 65535;
	TextDrawHideForPlayer(playerid, glob51D68);
	glob51D68 = 65535;
	TextDrawHideForPlayer(playerid, glob51D6C);
	glob51D6C = 65535;
	TextDrawHideForPlayer(playerid, glob51D70);
	glob51D70 = 65535;
	TextDrawHideForPlayer(playerid, glob51D74);
	glob51D74 = 65535;
	TextDrawHideForPlayer(playerid, glob51D78);
	glob51D78 = 65535;
	PlayerTextDrawHide(playerid, glob51D7C[playerid]);
	glob51D7C[playerid] = 65535;
	PlayerTextDrawHide(playerid, glob51DCC[playerid]);
	glob51DCC[playerid] = 65535;
	PlayerTextDrawHide(playerid, glob51E1C[playerid]);
	glob51E1C[playerid] = 65535;
	return 0;
}

function19198(arg0)
{
	glob4FA6C[arg0] = CreatePlayerTextDraw(arg0, 0, 0, 340820);
	PlayerTextDrawFont(arg0, glob4FA6C[arg0], 4);
	glob51080[arg0] = CreatePlayerTextDraw(arg0, 1137737207, 1137778687, 340828);
	PlayerTextDrawLetterSize(arg0, glob51080[arg0], 1041623253, 1065493021);
	PlayerTextDrawAlignment(arg0, glob51080[arg0], 1);
	PlayerTextDrawColor(arg0, glob51080[arg0], 4294967295);
	PlayerTextDrawSetShadow(arg0, glob51080[arg0], 0);
	PlayerTextDrawSetOutline(arg0, glob51080[arg0], 1);
	PlayerTextDrawBackgroundColor(arg0, glob51080[arg0], 51);
	PlayerTextDrawFont(arg0, glob51080[arg0], 2);
	PlayerTextDrawSetProportional(arg0, glob51080[arg0], 1);
	glob4FB10[arg0] = CreatePlayerTextDraw(arg0, 1130361848, 1107623674, 340904);
	PlayerTextDrawTextSize(arg0, glob4FB10[arg0], 1128642249, 1130020864);
	PlayerTextDrawAlignment(arg0, glob4FB10[arg0], 1);
	PlayerTextDrawColor(arg0, glob4FB10[arg0], 4294967295);
	PlayerTextDrawFont(arg0, glob4FB10[arg0], 4);
	glob4FAC0[arg0] = CreatePlayerTextDraw(arg0, 1141988311, 1135733412, 340940);
	PlayerTextDrawLetterSize(arg0, glob4FAC0[arg0], 1047282879, 1066227024);
	PlayerTextDrawAlignment(arg0, glob4FAC0[arg0], 3);
	PlayerTextDrawColor(arg0, glob4FAC0[arg0], 4286714879);
	PlayerTextDrawSetShadow(arg0, glob4FAC0[arg0], 0);
	PlayerTextDrawSetOutline(arg0, glob4FAC0[arg0], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FAC0[arg0], 188);
	PlayerTextDrawFont(arg0, glob4FAC0[arg0], 1);
	PlayerTextDrawSetProportional(arg0, glob4FAC0[arg0], 1);
	glob4FB88[arg0][0] = CreatePlayerTextDraw(arg0, 1127874626, 1120905855, 341036);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][0], 1133116064, 1133821952);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][0], 1);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][0], 4294967295);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][0], 4);
	glob4FB88[arg0][64] = CreatePlayerTextDraw(arg0, 1136708551, 1115422458, 341072);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][64], 1112663130, 1115575550);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][64], 1);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][64], 4294967295);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][64], 4);
	glob4FB88[arg0][1] = CreatePlayerTextDraw(arg0, 1128897053, 1122119844, 341108);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][1], 1051428127, 1068566053);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][1], 1);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][1], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][1], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][1], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][1], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][1], 1);
	glob4FB88[arg0][2] = CreatePlayerTextDraw(arg0, 1133522289, 1136315040, 341140);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][2], 1045623210, 1067995628);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][2], 1106247680, 1110847259);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][2], 2);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][2], 4294967295);
	PlayerTextDrawUseBox(arg0, glob4FB88[arg0][2], 1);
	PlayerTextDrawBoxColor(arg0, glob4FB88[arg0][2], 102);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][2], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][2], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][2], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][2], 1);
	PlayerTextDrawSetSelectable(arg0, glob4FB88[arg0][2], 1);
	glob4FB88[arg0][3] = CreatePlayerTextDraw(arg0, 1135334883, 1136312254, 341172);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][3], 1045623210, 1067995628);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][3], 1106247680, 1110847259);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][3], 2);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][3], 4294967295);
	PlayerTextDrawUseBox(arg0, glob4FB88[arg0][3], 1);
	PlayerTextDrawBoxColor(arg0, glob4FB88[arg0][3], 102);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][3], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][3], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][3], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][3], 1);
	PlayerTextDrawSetSelectable(arg0, glob4FB88[arg0][3], 1);
	glob4FB88[arg0][4] = CreatePlayerTextDraw(arg0, 1137838391, 1136309535, 341208);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][4], 1045623210, 1067995628);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][4], 1106247680, 1110847259);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][4], 2);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][4], 4294967295);
	PlayerTextDrawUseBox(arg0, glob4FB88[arg0][4], 1);
	PlayerTextDrawBoxColor(arg0, glob4FB88[arg0][4], 102);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][4], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][4], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][4], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][4], 1);
	PlayerTextDrawSetSelectable(arg0, glob4FB88[arg0][4], 1);
	glob4FB88[arg0][5] = CreatePlayerTextDraw(arg0, 1130926572, 1136317727, 341244);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][5], 1045623210, 1067995628);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][5], 1106247680, 1110847259);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][5], 2);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][5], 4294967295);
	PlayerTextDrawUseBox(arg0, glob4FB88[arg0][5], 1);
	PlayerTextDrawBoxColor(arg0, glob4FB88[arg0][5], 102);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][5], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][5], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][5], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][5], 1);
	PlayerTextDrawSetSelectable(arg0, glob4FB88[arg0][5], 1);
	glob4FB88[arg0][6] = CreatePlayerTextDraw(arg0, 1138938774, 1124270080, 341276);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][6], 0, 1102925267);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][6], 1128357757, 0);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][6], 1);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][6], 0);
	PlayerTextDrawUseBox(arg0, glob4FB88[arg0][6], 1);
	PlayerTextDrawBoxColor(arg0, glob4FB88[arg0][6], 102);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][6], 0);
	glob4FB88[arg0][7] = CreatePlayerTextDraw(arg0, 1129195045, 1124248191, 341292);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][7], 1043744162, 1066410181);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][7], 1);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][7], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][7], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][7], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][7], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][7], 1);
	glob4FB88[arg0][8] = CreatePlayerTextDraw(arg0, 1127905362, 1124592255, 341604);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][8], 1102242644, 1068423447);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][8], 1);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][8], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][8], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][8], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][8], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][8], 1);
	glob4FB88[arg0][9] = CreatePlayerTextDraw(arg0, 1136017703, 1135482143, 341612);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][9], 1048576000, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][9], 1092938105, 1108847100);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][9], 2);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][9], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][9], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][9], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][9], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][9], 1);
	PlayerTextDrawSetSelectable(arg0, glob4FB88[arg0][9], 1);
	glob4FB88[arg0][10] = CreatePlayerTextDraw(arg0, 1133378077, 1135482143, 341628);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][10], 1048576000, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][10], 1092938105, 1108847100);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][10], 2);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][10], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][10], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][10], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][10], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][10], 1);
	PlayerTextDrawSetSelectable(arg0, glob4FB88[arg0][10], 1);
	glob4FB88[arg0][11] = CreatePlayerTextDraw(arg0, 1134699414, 1135482143, 341644);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][11], 1048576000, 1066896720);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][11], 2);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][11], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][11], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][11], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][11], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][11], 1);
	new Float:var0 = 148.582;
	glob4FB88[arg0][12] = CreatePlayerTextDraw(arg0, 1129106899, var0, 341652);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][12], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][12], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][12], 1);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][12], 4294967295);
	PlayerTextDrawUseBox(arg0, glob4FB88[arg0][12], 1);
	PlayerTextDrawBoxColor(arg0, glob4FB88[arg0][12], 102);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][12], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][12], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][12], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][12], 1);
	PlayerTextDrawSetSelectable(arg0, glob4FB88[arg0][12], 1);
	glob4FB88[arg0][13] = CreatePlayerTextDraw(arg0, 1136189637, var0, 341736);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][13], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][13], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][13], 3);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][13], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][13], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][13], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][13], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][13], 1);
	glob4FB88[arg0][14] = CreatePlayerTextDraw(arg0, 1137296015, var0, 341752);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][14], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][14], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][14], 3);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][14], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][14], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][14], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][14], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][14], 1);
	glob4FB88[arg0][15] = CreatePlayerTextDraw(arg0, 1138555978, var0, 341776);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][15], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][15], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][15], 3);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][15], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][15], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][15], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][15], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][15], 1);
	var0 = 15.0839 + var0;
	glob4FB88[arg0][16] = CreatePlayerTextDraw(arg0, 1129106899, var0, 341796);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][16], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][16], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][16], 1);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][16], 4294967295);
	PlayerTextDrawUseBox(arg0, glob4FB88[arg0][16], 1);
	PlayerTextDrawBoxColor(arg0, glob4FB88[arg0][16], 102);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][16], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][16], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][16], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][16], 1);
	PlayerTextDrawSetSelectable(arg0, glob4FB88[arg0][16], 1);
	glob4FB88[arg0][17] = CreatePlayerTextDraw(arg0, 1136189637, var0, 341880);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][17], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][17], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][17], 3);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][17], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][17], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][17], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][17], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][17], 1);
	glob4FB88[arg0][18] = CreatePlayerTextDraw(arg0, 1137296015, var0, 341896);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][18], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][18], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][18], 3);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][18], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][18], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][18], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][18], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][18], 1);
	glob4FB88[arg0][19] = CreatePlayerTextDraw(arg0, 1138555978, var0, 341920);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][19], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][19], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][19], 3);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][19], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][19], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][19], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][19], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][19], 1);
	var0 = 15.0839 + var0;
	glob4FB88[arg0][20] = CreatePlayerTextDraw(arg0, 1129106899, var0, 341940);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][20], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][20], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][20], 1);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][20], 4294967295);
	PlayerTextDrawUseBox(arg0, glob4FB88[arg0][20], 1);
	PlayerTextDrawBoxColor(arg0, glob4FB88[arg0][20], 102);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][20], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][20], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][20], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][20], 1);
	PlayerTextDrawSetSelectable(arg0, glob4FB88[arg0][20], 1);
	glob4FB88[arg0][21] = CreatePlayerTextDraw(arg0, 1136189637, var0, 342032);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][21], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][21], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][21], 3);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][21], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][21], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][21], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][21], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][21], 1);
	glob4FB88[arg0][22] = CreatePlayerTextDraw(arg0, 1137296015, var0, 342048);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][22], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][22], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][22], 3);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][22], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][22], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][22], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][22], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][22], 1);
	glob4FB88[arg0][23] = CreatePlayerTextDraw(arg0, 1138555978, var0, 342072);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][23], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][23], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][23], 3);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][23], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][23], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][23], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][23], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][23], 1);
	var0 = 15.0839 + var0;
	glob4FB88[arg0][24] = CreatePlayerTextDraw(arg0, 1129106899, var0, 342092);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][24], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][24], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][24], 1);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][24], 4294967295);
	PlayerTextDrawUseBox(arg0, glob4FB88[arg0][24], 1);
	PlayerTextDrawBoxColor(arg0, glob4FB88[arg0][24], 102);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][24], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][24], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][24], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][24], 1);
	PlayerTextDrawSetSelectable(arg0, glob4FB88[arg0][24], 1);
	glob4FB88[arg0][25] = CreatePlayerTextDraw(arg0, 1136189637, var0, 342164);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][25], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][25], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][25], 3);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][25], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][25], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][25], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][25], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][25], 1);
	glob4FB88[arg0][26] = CreatePlayerTextDraw(arg0, 1137296015, var0, 342180);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][26], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][26], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][26], 3);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][26], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][26], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][26], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][26], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][26], 1);
	glob4FB88[arg0][27] = CreatePlayerTextDraw(arg0, 1138555978, var0, 342204);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][27], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][27], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][27], 3);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][27], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][27], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][27], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][27], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][27], 1);
	var0 = 15.0839 + var0;
	glob4FB88[arg0][28] = CreatePlayerTextDraw(arg0, 1129106899, var0, 342224);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][28], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][28], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][28], 1);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][28], 4294967295);
	PlayerTextDrawUseBox(arg0, glob4FB88[arg0][28], 1);
	PlayerTextDrawBoxColor(arg0, glob4FB88[arg0][28], 102);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][28], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][28], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][28], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][28], 1);
	PlayerTextDrawSetSelectable(arg0, glob4FB88[arg0][28], 1);
	glob4FB88[arg0][29] = CreatePlayerTextDraw(arg0, 1136189637, var0, 342280);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][29], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][29], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][29], 3);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][29], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][29], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][29], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][29], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][29], 1);
	glob4FB88[arg0][30] = CreatePlayerTextDraw(arg0, 1137296015, var0, 342296);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][30], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][30], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][30], 3);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][30], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][30], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][30], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][30], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][30], 1);
	glob4FB88[arg0][31] = CreatePlayerTextDraw(arg0, 1138555978, var0, 342320);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][31], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][31], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][31], 3);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][31], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][31], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][31], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][31], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][31], 1);
	var0 = 15.0839 + var0;
	glob4FB88[arg0][32] = CreatePlayerTextDraw(arg0, 1129106899, var0, 342340);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][32], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][32], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][32], 1);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][32], 4294967295);
	PlayerTextDrawUseBox(arg0, glob4FB88[arg0][32], 1);
	PlayerTextDrawBoxColor(arg0, glob4FB88[arg0][32], 102);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][32], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][32], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][32], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][32], 1);
	PlayerTextDrawSetSelectable(arg0, glob4FB88[arg0][32], 1);
	glob4FB88[arg0][33] = CreatePlayerTextDraw(arg0, 1136189637, var0, 342404);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][33], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][33], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][33], 3);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][33], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][33], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][33], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][33], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][33], 1);
	glob4FB88[arg0][34] = CreatePlayerTextDraw(arg0, 1137296015, var0, 342420);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][34], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][34], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][34], 3);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][34], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][34], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][34], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][34], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][34], 1);
	glob4FB88[arg0][35] = CreatePlayerTextDraw(arg0, 1138555978, var0, 342444);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][35], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][35], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][35], 3);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][35], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][35], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][35], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][35], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][35], 1);
	var0 = 15.0839 + var0;
	glob4FB88[arg0][36] = CreatePlayerTextDraw(arg0, 1129106899, var0, 342464);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][36], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][36], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][36], 1);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][36], 4294967295);
	PlayerTextDrawUseBox(arg0, glob4FB88[arg0][36], 1);
	PlayerTextDrawBoxColor(arg0, glob4FB88[arg0][36], 102);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][36], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][36], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][36], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][36], 1);
	PlayerTextDrawSetSelectable(arg0, glob4FB88[arg0][36], 1);
	glob4FB88[arg0][37] = CreatePlayerTextDraw(arg0, 1136189637, var0, 342524);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][37], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][37], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][37], 3);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][37], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][37], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][37], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][37], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][37], 1);
	glob4FB88[arg0][38] = CreatePlayerTextDraw(arg0, 1137296015, var0, 342540);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][38], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][38], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][38], 3);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][38], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][38], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][38], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][38], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][38], 1);
	glob4FB88[arg0][39] = CreatePlayerTextDraw(arg0, 1138555978, var0, 342564);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][39], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][39], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][39], 3);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][39], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][39], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][39], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][39], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][39], 1);
	var0 = 15.0839 + var0;
	glob4FB88[arg0][40] = CreatePlayerTextDraw(arg0, 1129106899, var0, 342584);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][40], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][40], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][40], 1);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][40], 4294967295);
	PlayerTextDrawUseBox(arg0, glob4FB88[arg0][40], 1);
	PlayerTextDrawBoxColor(arg0, glob4FB88[arg0][40], 102);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][40], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][40], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][40], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][40], 1);
	PlayerTextDrawSetSelectable(arg0, glob4FB88[arg0][40], 1);
	glob4FB88[arg0][41] = CreatePlayerTextDraw(arg0, 1136189637, var0, 342656);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][41], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][41], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][41], 3);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][41], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][41], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][41], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][41], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][41], 1);
	glob4FB88[arg0][42] = CreatePlayerTextDraw(arg0, 1137296015, var0, 342672);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][42], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][42], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][42], 3);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][42], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][42], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][42], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][42], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][42], 1);
	glob4FB88[arg0][43] = CreatePlayerTextDraw(arg0, 1138555978, var0, 342696);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][43], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][43], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][43], 3);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][43], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][43], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][43], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][43], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][43], 1);
	var0 = 15.0839 + var0;
	glob4FB88[arg0][44] = CreatePlayerTextDraw(arg0, 1129106899, var0, 342716);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][44], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][44], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][44], 1);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][44], 4294967295);
	PlayerTextDrawUseBox(arg0, glob4FB88[arg0][44], 1);
	PlayerTextDrawBoxColor(arg0, glob4FB88[arg0][44], 102);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][44], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][44], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][44], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][44], 1);
	PlayerTextDrawSetSelectable(arg0, glob4FB88[arg0][44], 1);
	glob4FB88[arg0][45] = CreatePlayerTextDraw(arg0, 1136189637, var0, 342816);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][45], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][45], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][45], 3);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][45], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][45], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][45], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][45], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][45], 1);
	glob4FB88[arg0][46] = CreatePlayerTextDraw(arg0, 1137296015, var0, 342832);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][46], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][46], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][46], 3);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][46], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][46], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][46], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][46], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][46], 1);
	glob4FB88[arg0][47] = CreatePlayerTextDraw(arg0, 1138555978, var0, 342856);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][47], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][47], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][47], 3);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][47], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][47], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][47], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][47], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][47], 1);
	var0 = 15.0839 + var0;
	glob4FB88[arg0][48] = CreatePlayerTextDraw(arg0, 1129106899, var0, 342876);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][48], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][48], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][48], 1);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][48], 4294967295);
	PlayerTextDrawUseBox(arg0, glob4FB88[arg0][48], 1);
	PlayerTextDrawBoxColor(arg0, glob4FB88[arg0][48], 102);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][48], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][48], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][48], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][48], 1);
	PlayerTextDrawSetSelectable(arg0, glob4FB88[arg0][48], 1);
	glob4FB88[arg0][49] = CreatePlayerTextDraw(arg0, 1136189637, var0, 342976);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][49], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][49], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][49], 3);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][49], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][49], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][49], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][49], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][49], 1);
	glob4FB88[arg0][50] = CreatePlayerTextDraw(arg0, 1137296015, var0, 342992);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][50], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][50], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][50], 3);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][50], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][50], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][50], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][50], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][50], 1);
	glob4FB88[arg0][51] = CreatePlayerTextDraw(arg0, 1138555978, var0, 343016);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][51], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][51], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][51], 3);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][51], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][51], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][51], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][51], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][51], 1);
	var0 = 15.0839 + var0;
	glob4FB88[arg0][52] = CreatePlayerTextDraw(arg0, 1129106899, var0, 343036);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][52], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][52], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][52], 1);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][52], 4294967295);
	PlayerTextDrawUseBox(arg0, glob4FB88[arg0][52], 1);
	PlayerTextDrawBoxColor(arg0, glob4FB88[arg0][52], 102);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][52], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][52], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][52], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][52], 1);
	PlayerTextDrawSetSelectable(arg0, glob4FB88[arg0][52], 1);
	glob4FB88[arg0][53] = CreatePlayerTextDraw(arg0, 1136189637, var0, 343112);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][53], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][53], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][53], 3);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][53], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][53], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][53], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][53], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][53], 1);
	glob4FB88[arg0][54] = CreatePlayerTextDraw(arg0, 1137296015, var0, 343128);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][54], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][54], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][54], 3);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][54], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][54], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][54], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][54], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][54], 1);
	glob4FB88[arg0][55] = CreatePlayerTextDraw(arg0, 1138555978, var0, 343152);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][55], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][55], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][55], 3);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][55], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][55], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][55], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][55], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][55], 1);
	var0 = 15.0839 + var0;
	glob4FB88[arg0][56] = CreatePlayerTextDraw(arg0, 1129106899, var0, 343172);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][56], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][56], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][56], 1);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][56], 4294967295);
	PlayerTextDrawUseBox(arg0, glob4FB88[arg0][56], 1);
	PlayerTextDrawBoxColor(arg0, glob4FB88[arg0][56], 102);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][56], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][56], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][56], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][56], 1);
	PlayerTextDrawSetSelectable(arg0, glob4FB88[arg0][56], 1);
	glob4FB88[arg0][57] = CreatePlayerTextDraw(arg0, 1136189637, var0, 343248);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][57], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][57], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][57], 3);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][57], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][57], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][57], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][57], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][57], 1);
	glob4FB88[arg0][58] = CreatePlayerTextDraw(arg0, 1137296015, var0, 343264);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][58], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][58], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][58], 3);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][58], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][58], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][58], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][58], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][58], 1);
	glob4FB88[arg0][59] = CreatePlayerTextDraw(arg0, 1138555978, var0, 343288);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][59], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][59], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][59], 3);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][59], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][59], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][59], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][59], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][59], 1);
	var0 = 15.0839 + var0;
	glob4FB88[arg0][60] = CreatePlayerTextDraw(arg0, 1129106899, var0, 343308);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][60], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][60], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][60], 1);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][60], 4294967295);
	PlayerTextDrawUseBox(arg0, glob4FB88[arg0][60], 1);
	PlayerTextDrawBoxColor(arg0, glob4FB88[arg0][60], 102);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][60], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][60], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][60], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][60], 1);
	PlayerTextDrawSetSelectable(arg0, glob4FB88[arg0][60], 1);
	glob4FB88[arg0][61] = CreatePlayerTextDraw(arg0, 1136189637, var0, 343400);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][61], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][61], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][61], 3);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][61], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][61], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][61], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][61], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][61], 1);
	glob4FB88[arg0][62] = CreatePlayerTextDraw(arg0, 1137296015, var0, 343416);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][62], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][62], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][62], 3);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][62], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][62], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][62], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][62], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][62], 1);
	glob4FB88[arg0][63] = CreatePlayerTextDraw(arg0, 1138555978, var0, 343440);
	PlayerTextDrawLetterSize(arg0, glob4FB88[arg0][63], 1045891645, 1066896720);
	PlayerTextDrawTextSize(arg0, glob4FB88[arg0][63], 1138581570, 1092528112);
	PlayerTextDrawAlignment(arg0, glob4FB88[arg0][63], 3);
	PlayerTextDrawColor(arg0, glob4FB88[arg0][63], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob4FB88[arg0][63], 1);
	PlayerTextDrawBackgroundColor(arg0, glob4FB88[arg0][63], 51);
	PlayerTextDrawFont(arg0, glob4FB88[arg0][63], 2);
	PlayerTextDrawSetProportional(arg0, glob4FB88[arg0][63], 1);
	glob51C68[arg0] = CreatePlayerTextDraw(arg0, 1138425856, 1098577347, 343460);
	PlayerTextDrawLetterSize(arg0, glob51C68[arg0], 0, 1060370383);
	PlayerTextDrawTextSize(arg0, glob51C68[arg0], 1128497152, 0);
	PlayerTextDrawAlignment(arg0, glob51C68[arg0], 1);
	PlayerTextDrawColor(arg0, glob51C68[arg0], 0);
	PlayerTextDrawUseBox(arg0, glob51C68[arg0], 1);
	PlayerTextDrawBoxColor(arg0, glob51C68[arg0], 23);
	PlayerTextDrawFont(arg0, glob51C68[arg0], 0);
	glob51CB8[arg0] = CreatePlayerTextDraw(arg0, 1134542848, 1096222245, 343476);
	PlayerTextDrawLetterSize(arg0, glob51CB8[arg0], 1045220557, 1065999139);
	PlayerTextDrawAlignment(arg0, glob51CB8[arg0], 2);
	PlayerTextDrawColor(arg0, glob51CB8[arg0], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob51CB8[arg0], 4294967295);
	PlayerTextDrawBackgroundColor(arg0, glob51CB8[arg0], 51);
	PlayerTextDrawFont(arg0, glob51CB8[arg0], 2);
	PlayerTextDrawSetProportional(arg0, glob51CB8[arg0], 1);
	glob51D7C[arg0] = CreatePlayerTextDraw(arg0, 1134542848, 1135319745, 343520);
	PlayerTextDrawLetterSize(arg0, glob51D7C[arg0], 1055253332, 1070386381);
	PlayerTextDrawAlignment(arg0, glob51D7C[arg0], 2);
	PlayerTextDrawColor(arg0, glob51D7C[arg0], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob51D7C[arg0], 1);
	PlayerTextDrawBackgroundColor(arg0, glob51D7C[arg0], 51);
	PlayerTextDrawFont(arg0, glob51D7C[arg0], 2);
	PlayerTextDrawSetProportional(arg0, glob51D7C[arg0], 1);
	PlayerTextDrawSetSelectable(arg0, glob51D7C[arg0], 1);
	glob51DCC[arg0] = CreatePlayerTextDraw(arg0, 1110441984, 1134569718, 343528);
	PlayerTextDrawLetterSize(arg0, glob51DCC[arg0], 1049012208, 1067626529);
	PlayerTextDrawTextSize(arg0, glob51DCC[arg0], 1106247680, 1111434199);
	PlayerTextDrawAlignment(arg0, glob51DCC[arg0], 2);
	PlayerTextDrawColor(arg0, glob51DCC[arg0], 4076863487);
	PlayerTextDrawSetOutline(arg0, glob51DCC[arg0], 1);
	PlayerTextDrawBackgroundColor(arg0, glob51DCC[arg0], 51);
	PlayerTextDrawFont(arg0, glob51DCC[arg0], 2);
	PlayerTextDrawSetProportional(arg0, glob51DCC[arg0], 1);
	PlayerTextDrawSetSelectable(arg0, glob51DCC[arg0], 1);
	glob51E1C[arg0] = CreatePlayerTextDraw(arg0, 1141989376, 1134561591, 343548);
	PlayerTextDrawLetterSize(arg0, glob51E1C[arg0], 1049012208, 1067626529);
	PlayerTextDrawTextSize(arg0, glob51E1C[arg0], 1106247680, 1116006384);
	PlayerTextDrawAlignment(arg0, glob51E1C[arg0], 2);
	PlayerTextDrawColor(arg0, glob51E1C[arg0], 4076863487);
	PlayerTextDrawSetOutline(arg0, glob51E1C[arg0], 1);
	PlayerTextDrawBackgroundColor(arg0, glob51E1C[arg0], 51);
	PlayerTextDrawFont(arg0, glob51E1C[arg0], 2);
	PlayerTextDrawSetProportional(arg0, glob51E1C[arg0], 1);
	PlayerTextDrawSetSelectable(arg0, glob51E1C[arg0], 1);
	glob51134[arg0] = CreatePlayerTextDraw(arg0, 1140457472, 1136164864, 343580);
	PlayerTextDrawAlignment(arg0, glob51134[arg0], 2);
	PlayerTextDrawBackgroundColor(arg0, glob51134[arg0], 255);
	PlayerTextDrawFont(arg0, glob51134[arg0], 2);
	PlayerTextDrawLetterSize(arg0, glob51134[arg0], 1049247089, 1067030938);
	PlayerTextDrawColor(arg0, glob51134[arg0], 4287111935);
	PlayerTextDrawSetOutline(arg0, glob51134[arg0], 1);
	PlayerTextDrawSetProportional(arg0, glob51134[arg0], 1);
	PlayerTextDrawUseBox(arg0, glob51134[arg0], 1);
	PlayerTextDrawBoxColor(arg0, glob51134[arg0], 4294967057);
	PlayerTextDrawTextSize(arg0, glob51134[arg0], 0, 1126367232);
	glob51184[arg0] = CreatePlayerTextDraw(arg0, 1138655232, 1136295936, 343632);
	PlayerTextDrawAlignment(arg0, glob51184[arg0], 2);
	PlayerTextDrawBackgroundColor(arg0, glob51184[arg0], 255);
	PlayerTextDrawFont(arg0, glob51184[arg0], 2);
	PlayerTextDrawLetterSize(arg0, glob51184[arg0], 1059145613, 1082549856);
	PlayerTextDrawColor(arg0, glob51184[arg0], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob51184[arg0], 1);
	PlayerTextDrawSetProportional(arg0, glob51184[arg0], 1);
	glob511D4[arg0] = CreatePlayerTextDraw(arg0, 1140195328, 1136623616, 343640);
	PlayerTextDrawBackgroundColor(arg0, glob511D4[arg0], 255);
	PlayerTextDrawFont(arg0, glob511D4[arg0], 2);
	PlayerTextDrawLetterSize(arg0, glob511D4[arg0], 1047233823, 1067869790);
	PlayerTextDrawColor(arg0, glob511D4[arg0], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob511D4[arg0], 0);
	PlayerTextDrawSetProportional(arg0, glob511D4[arg0], 1);
	PlayerTextDrawSetShadow(arg0, glob511D4[arg0], 1);
	glob51224[arg0] = CreatePlayerTextDraw(arg0, 1140195328, 1137016832, 343668);
	PlayerTextDrawBackgroundColor(arg0, glob51224[arg0], 255);
	PlayerTextDrawFont(arg0, glob51224[arg0], 2);
	PlayerTextDrawLetterSize(arg0, glob51224[arg0], 1047233823, 1067869790);
	PlayerTextDrawColor(arg0, glob51224[arg0], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob51224[arg0], 0);
	PlayerTextDrawSetProportional(arg0, glob51224[arg0], 1);
	PlayerTextDrawSetShadow(arg0, glob51224[arg0], 1);
	glob51274[arg0] = CreatePlayerTextDraw(arg0, 1139441664, 1136623616, 343692);
	PlayerTextDrawBackgroundColor(arg0, glob51274[arg0], 255);
	PlayerTextDrawFont(arg0, glob51274[arg0], 1);
	PlayerTextDrawLetterSize(arg0, glob51274[arg0], 1047233823, 1067869790);
	PlayerTextDrawColor(arg0, glob51274[arg0], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob51274[arg0], 0);
	PlayerTextDrawSetProportional(arg0, glob51274[arg0], 1);
	PlayerTextDrawSetShadow(arg0, glob51274[arg0], 1);
	glob512C4[arg0] = CreatePlayerTextDraw(arg0, 1141620736, 1136656384, 343724);
	PlayerTextDrawBackgroundColor(arg0, glob512C4[arg0], 255);
	PlayerTextDrawFont(arg0, glob512C4[arg0], 1);
	PlayerTextDrawLetterSize(arg0, glob512C4[arg0], 1047233823, 1067869790);
	PlayerTextDrawColor(arg0, glob512C4[arg0], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob512C4[arg0], 0);
	PlayerTextDrawSetProportional(arg0, glob512C4[arg0], 1);
	PlayerTextDrawSetShadow(arg0, glob512C4[arg0], 1);
	glob51314[arg0] = CreatePlayerTextDraw(arg0, 1141620736, 1137049600, 343736);
	PlayerTextDrawBackgroundColor(arg0, glob51314[arg0], 255);
	PlayerTextDrawFont(arg0, glob51314[arg0], 1);
	PlayerTextDrawLetterSize(arg0, glob51314[arg0], 1047233823, 1067869790);
	PlayerTextDrawColor(arg0, glob51314[arg0], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob51314[arg0], 0);
	PlayerTextDrawSetProportional(arg0, glob51314[arg0], 1);
	PlayerTextDrawSetShadow(arg0, glob51314[arg0], 1);
	glob51364[arg0] = CreatePlayerTextDraw(arg0, 1141571584, 1136656384, 343748);
	PlayerTextDrawAlignment(arg0, glob51364[arg0], 3);
	PlayerTextDrawBackgroundColor(arg0, glob51364[arg0], 255);
	PlayerTextDrawFont(arg0, glob51364[arg0], 2);
	PlayerTextDrawLetterSize(arg0, glob51364[arg0], 1047233823, 1067869790);
	PlayerTextDrawColor(arg0, glob51364[arg0], 4287111935);
	PlayerTextDrawSetOutline(arg0, glob51364[arg0], 1);
	PlayerTextDrawSetProportional(arg0, glob51364[arg0], 1);
	glob513B4[arg0] = CreatePlayerTextDraw(arg0, 1141571584, 1137049600, 343756);
	PlayerTextDrawAlignment(arg0, glob513B4[arg0], 3);
	PlayerTextDrawBackgroundColor(arg0, glob513B4[arg0], 255);
	PlayerTextDrawFont(arg0, glob513B4[arg0], 2);
	PlayerTextDrawLetterSize(arg0, glob513B4[arg0], 1047233823, 1067869790);
	PlayerTextDrawColor(arg0, glob513B4[arg0], 4287111935);
	PlayerTextDrawSetOutline(arg0, glob513B4[arg0], 1);
	PlayerTextDrawSetProportional(arg0, glob513B4[arg0], 1);
	glob51404[arg0] = CreatePlayerTextDraw(arg0, 1140457472, 1136164864, 343764);
	PlayerTextDrawAlignment(arg0, glob51404[arg0], 2);
	PlayerTextDrawBackgroundColor(arg0, glob51404[arg0], 255);
	PlayerTextDrawFont(arg0, glob51404[arg0], 2);
	PlayerTextDrawLetterSize(arg0, glob51404[arg0], 1049247089, 1067030938);
	PlayerTextDrawColor(arg0, glob51404[arg0], 4287111935);
	PlayerTextDrawSetOutline(arg0, glob51404[arg0], 1);
	PlayerTextDrawSetProportional(arg0, glob51404[arg0], 1);
	glob51B78[arg0] = CreatePlayerTextDraw(arg0, 1134835532, 1134758560, 343772);
	PlayerTextDrawLetterSize(arg0, glob51B78[arg0], 1058508112, 1077004993);
	PlayerTextDrawAlignment(arg0, glob51B78[arg0], 1);
	PlayerTextDrawColor(arg0, glob51B78[arg0], 336199935);
	PlayerTextDrawSetOutline(arg0, glob51B78[arg0], 1);
	PlayerTextDrawBackgroundColor(arg0, glob51B78[arg0], 4294967099);
	PlayerTextDrawFont(arg0, glob51B78[arg0], 3);
	PlayerTextDrawSetProportional(arg0, glob51B78[arg0], 1);
	glob51BC8[arg0] = CreatePlayerTextDraw(arg0, 1135542764, 1135730622, 343788);
	PlayerTextDrawLetterSize(arg0, glob51BC8[arg0], 1058508112, 1077004993);
	PlayerTextDrawAlignment(arg0, glob51BC8[arg0], 1);
	PlayerTextDrawColor(arg0, glob51BC8[arg0], 336199935);
	PlayerTextDrawSetOutline(arg0, glob51BC8[arg0], 1);
	PlayerTextDrawBackgroundColor(arg0, glob51BC8[arg0], 4294967091);
	PlayerTextDrawFont(arg0, glob51BC8[arg0], 3);
	PlayerTextDrawSetProportional(arg0, glob51BC8[arg0], 1);
	glob51C18[arg0] = CreatePlayerTextDraw(arg0, 1134714683, 1136721822, 343800);
	PlayerTextDrawLetterSize(arg0, glob51C18[arg0], 1058508112, 1077004993);
	PlayerTextDrawAlignment(arg0, glob51C18[arg0], 1);
	PlayerTextDrawColor(arg0, glob51C18[arg0], 336199935);
	PlayerTextDrawSetOutline(arg0, glob51C18[arg0], 1);
	PlayerTextDrawBackgroundColor(arg0, glob51C18[arg0], 4294967091);
	PlayerTextDrawFont(arg0, glob51C18[arg0], 3);
	PlayerTextDrawSetProportional(arg0, glob51C18[arg0], 1);
	glob51864[arg0] = CreatePlayerTextDraw(arg0, 1134559232, 1135214592, 343824);
	PlayerTextDrawAlignment(arg0, glob51864[arg0], 2);
	PlayerTextDrawBackgroundColor(arg0, glob51864[arg0], 255);
	PlayerTextDrawFont(arg0, glob51864[arg0], 2);
	PlayerTextDrawLetterSize(arg0, glob51864[arg0], 1051931410, 1069547520);
	PlayerTextDrawColor(arg0, glob51864[arg0], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob51864[arg0], 0);
	PlayerTextDrawSetProportional(arg0, glob51864[arg0], 1);
	PlayerTextDrawSetShadow(arg0, glob51864[arg0], 1);
	PlayerTextDrawUseBox(arg0, glob51864[arg0], 1);
	PlayerTextDrawBoxColor(arg0, glob51864[arg0], 572662408);
	PlayerTextDrawTextSize(arg0, glob51864[arg0], 0, 1128333312);
	glob518B4[arg0] = CreatePlayerTextDraw(arg0, 1137278976, 1135902720, 343968);
	PlayerTextDrawAlignment(arg0, glob518B4[arg0], 2);
	PlayerTextDrawBackgroundColor(arg0, glob518B4[arg0], 4294967295);
	PlayerTextDrawFont(arg0, glob518B4[arg0], 1);
	PlayerTextDrawLetterSize(arg0, glob518B4[arg0], 1056964608, 1075838976);
	PlayerTextDrawColor(arg0, glob518B4[arg0], 255);
	PlayerTextDrawSetOutline(arg0, glob518B4[arg0], 1);
	PlayerTextDrawSetProportional(arg0, glob518B4[arg0], 1);
	PlayerTextDrawUseBox(arg0, glob518B4[arg0], 1);
	PlayerTextDrawBoxColor(arg0, glob518B4[arg0], 153);
	PlayerTextDrawTextSize(arg0, glob518B4[arg0], 0, 1093664768);
	glob51904[arg0] = CreatePlayerTextDraw(arg0, 1132265472, 1135902720, 343976);
	PlayerTextDrawAlignment(arg0, glob51904[arg0], 2);
	PlayerTextDrawBackgroundColor(arg0, glob51904[arg0], 4294967295);
	PlayerTextDrawFont(arg0, glob51904[arg0], 1);
	PlayerTextDrawLetterSize(arg0, glob51904[arg0], 1056964608, 1075838976);
	PlayerTextDrawColor(arg0, glob51904[arg0], 255);
	PlayerTextDrawSetOutline(arg0, glob51904[arg0], 1);
	PlayerTextDrawSetProportional(arg0, glob51904[arg0], 1);
	PlayerTextDrawUseBox(arg0, glob51904[arg0], 1);
	PlayerTextDrawBoxColor(arg0, glob51904[arg0], 153);
	PlayerTextDrawTextSize(arg0, glob51904[arg0], 0, 1093664768);
	glob51954[arg0] = CreatePlayerTextDraw(arg0, 1132920832, 1135902720, 343984);
	PlayerTextDrawAlignment(arg0, glob51954[arg0], 2);
	PlayerTextDrawBackgroundColor(arg0, glob51954[arg0], 4294967295);
	PlayerTextDrawFont(arg0, glob51954[arg0], 1);
	PlayerTextDrawLetterSize(arg0, glob51954[arg0], 1056964608, 1075838976);
	PlayerTextDrawColor(arg0, glob51954[arg0], 255);
	PlayerTextDrawSetOutline(arg0, glob51954[arg0], 1);
	PlayerTextDrawSetProportional(arg0, glob51954[arg0], 1);
	PlayerTextDrawUseBox(arg0, glob51954[arg0], 1);
	PlayerTextDrawBoxColor(arg0, glob51954[arg0], 153);
	PlayerTextDrawTextSize(arg0, glob51954[arg0], 0, 1093664768);
	glob519A4[arg0] = CreatePlayerTextDraw(arg0, 1133477888, 1135902720, 343992);
	PlayerTextDrawAlignment(arg0, glob519A4[arg0], 2);
	PlayerTextDrawBackgroundColor(arg0, glob519A4[arg0], 4294967295);
	PlayerTextDrawFont(arg0, glob519A4[arg0], 1);
	PlayerTextDrawLetterSize(arg0, glob519A4[arg0], 1056964608, 1075838976);
	PlayerTextDrawColor(arg0, glob519A4[arg0], 255);
	PlayerTextDrawSetOutline(arg0, glob519A4[arg0], 1);
	PlayerTextDrawSetProportional(arg0, glob519A4[arg0], 1);
	PlayerTextDrawUseBox(arg0, glob519A4[arg0], 1);
	PlayerTextDrawBoxColor(arg0, glob519A4[arg0], 153);
	PlayerTextDrawTextSize(arg0, glob519A4[arg0], 0, 1093664768);
	glob519F4[arg0] = CreatePlayerTextDraw(arg0, 1136132096, 1135902720, 344000);
	PlayerTextDrawAlignment(arg0, glob519F4[arg0], 2);
	PlayerTextDrawBackgroundColor(arg0, glob519F4[arg0], 4294967295);
	PlayerTextDrawFont(arg0, glob519F4[arg0], 1);
	PlayerTextDrawLetterSize(arg0, glob519F4[arg0], 1056964608, 1075838976);
	PlayerTextDrawColor(arg0, glob519F4[arg0], 255);
	PlayerTextDrawSetOutline(arg0, glob519F4[arg0], 1);
	PlayerTextDrawSetProportional(arg0, glob519F4[arg0], 1);
	PlayerTextDrawUseBox(arg0, glob519F4[arg0], 1);
	PlayerTextDrawBoxColor(arg0, glob519F4[arg0], 153);
	PlayerTextDrawTextSize(arg0, glob519F4[arg0], 0, 1093664768);
	glob51A44[arg0] = CreatePlayerTextDraw(arg0, 1136721920, 1135902720, 344008);
	PlayerTextDrawAlignment(arg0, glob51A44[arg0], 2);
	PlayerTextDrawBackgroundColor(arg0, glob51A44[arg0], 4294967295);
	PlayerTextDrawFont(arg0, glob51A44[arg0], 1);
	PlayerTextDrawLetterSize(arg0, glob51A44[arg0], 1056964608, 1075838976);
	PlayerTextDrawColor(arg0, glob51A44[arg0], 255);
	PlayerTextDrawSetOutline(arg0, glob51A44[arg0], 1);
	PlayerTextDrawSetProportional(arg0, glob51A44[arg0], 1);
	PlayerTextDrawUseBox(arg0, glob51A44[arg0], 1);
	PlayerTextDrawBoxColor(arg0, glob51A44[arg0], 153);
	PlayerTextDrawTextSize(arg0, glob51A44[arg0], 0, 1093664768);
	glob51A94[arg0] = CreatePlayerTextDraw(arg0, 1135575040, 1135902720, 344016);
	PlayerTextDrawAlignment(arg0, glob51A94[arg0], 2);
	PlayerTextDrawBackgroundColor(arg0, glob51A94[arg0], 4294967295);
	PlayerTextDrawFont(arg0, glob51A94[arg0], 1);
	PlayerTextDrawLetterSize(arg0, glob51A94[arg0], 1056964608, 1075838976);
	PlayerTextDrawColor(arg0, glob51A94[arg0], 255);
	PlayerTextDrawSetOutline(arg0, glob51A94[arg0], 1);
	PlayerTextDrawSetProportional(arg0, glob51A94[arg0], 1);
	PlayerTextDrawUseBox(arg0, glob51A94[arg0], 1);
	PlayerTextDrawBoxColor(arg0, glob51A94[arg0], 153);
	PlayerTextDrawTextSize(arg0, glob51A94[arg0], 0, 1093664768);
	glob51AE4[arg0] = CreatePlayerTextDraw(arg0, 1135017984, 1135902720, 344024);
	PlayerTextDrawAlignment(arg0, glob51AE4[arg0], 2);
	PlayerTextDrawBackgroundColor(arg0, glob51AE4[arg0], 4294967295);
	PlayerTextDrawFont(arg0, glob51AE4[arg0], 1);
	PlayerTextDrawLetterSize(arg0, glob51AE4[arg0], 1056964608, 1075838976);
	PlayerTextDrawColor(arg0, glob51AE4[arg0], 255);
	PlayerTextDrawSetOutline(arg0, glob51AE4[arg0], 1);
	PlayerTextDrawSetProportional(arg0, glob51AE4[arg0], 1);
	PlayerTextDrawUseBox(arg0, glob51AE4[arg0], 1);
	PlayerTextDrawBoxColor(arg0, glob51AE4[arg0], 153);
	PlayerTextDrawTextSize(arg0, glob51AE4[arg0], 0, 1093664768);
	glob510E4[arg0] = CreatePlayerTextDraw(arg0, 1137147904, 1128005632, 344032);
	PlayerTextDrawFont(arg0, glob510E4[arg0], 1);
	PlayerTextDrawLetterSize(arg0, glob510E4[arg0], 1053609165, 1073741824);
	PlayerTextDrawColor(arg0, glob510E4[arg0], 4294967295);
	PlayerTextDrawSetOutline(arg0, glob510E4[arg0], 1);
	PlayerTextDrawSetProportional(arg0, glob510E4[arg0], 1);
	return 0;
}

function2EA68(arg0)
{
	for(new var0 = 0; var0 < 65; var0++)
	{
		PlayerTextDrawDestroy(arg0, glob4FB88[arg0][var0]);
		glob4FB88[arg0][var0] = 65535;
	}
	PlayerTextDrawDestroy(arg0, glob51080[arg0]);
	PlayerTextDrawDestroy(arg0, glob4FAC0[arg0]);
	function303C8(arg0, glob479AC[arg0]);
	function303C8(arg0, glob479FC[arg0]);
	PlayerTextDrawDestroy(arg0, glob4FB10[arg0]);
	PlayerTextDrawDestroy(arg0, glob51B78[arg0]);
	PlayerTextDrawDestroy(arg0, glob51BC8[arg0]);
	PlayerTextDrawDestroy(arg0, glob51C18[arg0]);
	PlayerTextDrawDestroy(arg0, glob4FA6C[arg0]);
	PlayerTextDrawDestroy(arg0, glob51C68[arg0]);
	glob51C68[arg0] = 65535;
	PlayerTextDrawDestroy(arg0, glob51CB8[arg0]);
	glob51CB8[arg0] = 65535;
	PlayerTextDrawDestroy(arg0, glob51454[arg0]);
	PlayerTextDrawDestroy(arg0, glob514A4[arg0]);
	PlayerTextDrawDestroy(arg0, glob514F4[arg0]);
	PlayerTextDrawDestroy(arg0, glob51544[arg0]);
	PlayerTextDrawDestroy(arg0, glob51594[arg0]);
	PlayerTextDrawDestroy(arg0, glob515E4[arg0]);
	PlayerTextDrawDestroy(arg0, glob51634[arg0]);
	PlayerTextDrawDestroy(arg0, glob51684[arg0]);
	PlayerTextDrawDestroy(arg0, glob516D4[arg0]);
	PlayerTextDrawDestroy(arg0, glob51724[arg0]);
	PlayerTextDrawDestroy(arg0, glob51774[arg0]);
	PlayerTextDrawDestroy(arg0, glob517C4[arg0]);
	PlayerTextDrawDestroy(arg0, glob51814[arg0]);
	PlayerTextDrawDestroy(arg0, glob510E4[arg0]);
	PlayerTextDrawDestroy(arg0, glob51134[arg0]);
	PlayerTextDrawDestroy(arg0, glob51184[arg0]);
	PlayerTextDrawDestroy(arg0, glob511D4[arg0]);
	PlayerTextDrawDestroy(arg0, glob51224[arg0]);
	PlayerTextDrawDestroy(arg0, glob51274[arg0]);
	PlayerTextDrawDestroy(arg0, glob512C4[arg0]);
	PlayerTextDrawDestroy(arg0, glob51314[arg0]);
	PlayerTextDrawDestroy(arg0, glob51364[arg0]);
	PlayerTextDrawDestroy(arg0, glob513B4[arg0]);
	PlayerTextDrawDestroy(arg0, glob51404[arg0]);
	PlayerTextDrawDestroy(arg0, glob51864[arg0]);
	PlayerTextDrawDestroy(arg0, glob518B4[arg0]);
	PlayerTextDrawDestroy(arg0, glob51904[arg0]);
	PlayerTextDrawDestroy(arg0, glob51954[arg0]);
	PlayerTextDrawDestroy(arg0, glob519A4[arg0]);
	PlayerTextDrawDestroy(arg0, glob519F4[arg0]);
	PlayerTextDrawDestroy(arg0, glob51A44[arg0]);
	PlayerTextDrawDestroy(arg0, glob51A94[arg0]);
	PlayerTextDrawDestroy(arg0, glob51AE4[arg0]);
	return 0;
}

public cmd_tdh(arg0, arg1)
{
	PlayerTextDrawLetterSize(arg0, glob62F48[0][2], 1065353216, (1.5 / 10) + floatstr(arg1));
	return 1;
}

Float:function2F854(arg0, Float:arg1, Float:arg2, Float:arg3, Float:arg4, arg5, Float:arg6)
{
	new var0 = 0;
	for(var0 = 0; var0 < 85; var0++)
	{
		if(!glob53FE8[arg0][var0][7])
		{
		}
		else
		{
		}
	}
	if(glob53FE8[arg0][var0][7] || var0 == 85)
	{
		return -6.8056469327706e+038.0;
	}
	new var1 = glob62F48[var0][0] = CreatePlayerTextDraw(arg0, arg1, arg2, 406680);
	PlayerTextDrawUseBox(arg0, var1, 1);
	PlayerTextDrawTextSize(arg0, var1, arg1 + arg3, 0);
	PlayerTextDrawLetterSize(arg0, var1, 1065353216, arg4 / 10);
	PlayerTextDrawBoxColor(arg0, var1, (arg5 & 255) | 0);
	var1 = glob62F48[var0][1] = CreatePlayerTextDraw(arg0, 1.2 + arg1, 1.2 + arg2, 406688);
	PlayerTextDrawUseBox(arg0, var1, 1);
	PlayerTextDrawTextSize(arg0, var1, arg1 + arg3, 0);
	PlayerTextDrawLetterSize(arg0, var1, 1065353216, arg4 / 10);
	PlayerTextDrawBoxColor(arg0, var1, (((arg5 & 255) / 2) & 102) | (arg5 & -256));
	var1 = glob62F48[var0][2] = CreatePlayerTextDraw(arg0, 1.2 + arg1, 1.2 + arg2, 406696);
	PlayerTextDrawTextSize(arg0, var1, (arg1 - 6.0) + (1.0 * (((6.0 + arg1 + arg3) - arg1) / arg6)), 0);
	PlayerTextDrawLetterSize(arg0, var1, 1065353216, 0.15 + -0.13);
	PlayerTextDrawBoxColor(arg0, var1, arg5);
	glob53FE8[arg0][var0][0] = arg1;
	glob53FE8[arg0][var0][1] = arg2;
	glob53FE8[arg0][var0][2] = arg3;
	glob53FE8[arg0][var0][3] = arg4;
	glob53FE8[arg0][var0][4] = arg6;
	glob53FE8[arg0][var0][6] = arg5;
	glob53FE8[arg0][var0][7] = 1;
	return var0;
}

function303C8(arg0, arg1)
{
	if(-1 != arg1 && (85 > arg1) & (-1 < arg1))
	{
		if(!glob53FE8[arg0][arg1][7])
		{
			return 0;
		}
		PlayerTextDrawDestroy(arg0, glob62F48[arg1][0]);
		PlayerTextDrawDestroy(arg0, glob62F48[arg1][1]);
		PlayerTextDrawDestroy(arg0, glob62F48[arg1][2]);
		glob62F48[arg1][0] = 0;
		glob62F48[arg1][1] = 0;
		glob62F48[arg1][2] = 0;
		glob53FE8[arg0][arg1][0] = 0;
		glob53FE8[arg0][arg1][1] = 0;
		glob53FE8[arg0][arg1][2] = 0;
		glob53FE8[arg0][arg1][3] = 0;
		glob53FE8[arg0][arg1][4] = 0;
		glob53FE8[arg0][arg1][5] = 0;
		glob53FE8[arg0][arg1][6] = 0;
		glob53FE8[arg0][arg1][7] = 0;
		return 1;
	}
	return 0;
}

function309C8(playerid, arg1)
{
	if(IsPlayerConnected(playerid) && -1 != arg1 && (85 > arg1) & (-1 < arg1))
	{
		if(!glob53FE8[playerid][arg1][7])
		{
			return 0;
		}
		PlayerTextDrawShow(playerid, glob62F48[arg1][0]);
		PlayerTextDrawShow(playerid, glob62F48[arg1][1]);
		PlayerTextDrawShow(playerid, glob62F48[arg1][2]);
		return 1;
	}
	return 0;
}

function30C00(playerid, arg1)
{
	if(IsPlayerConnected(playerid) && -1 != arg1 && (85 > arg1) & (-1 < arg1))
	{
		if(!glob53FE8[playerid][arg1][7])
		{
			return 0;
		}
		PlayerTextDrawHide(playerid, glob62F48[arg1][0]);
		PlayerTextDrawHide(playerid, glob62F48[arg1][1]);
		PlayerTextDrawHide(playerid, glob62F48[arg1][2]);
		return 1;
	}
	return 0;
}

Float:function30E38(arg0, arg1, Float:arg2)
{
	if(arg1 == -1 || (arg1 < -1) & (85 < arg1))
	{
		return 0.0;
	}
	if(glob53FE8[arg0][arg1][7])
	{
		arg2 = (arg2 < 0.0 ? FUU : FUU);
		PlayerTextDrawUseBox(arg0, glob62F48[arg1][2], arg2 > 0.0);
		glob53FE8[arg0][arg1][5] = arg2;
		PlayerTextDrawTextSize(arg0, glob62F48[arg1][2], (glob53FE8[arg0][arg1][0] - 6.0) + ((((6.0 + glob53FE8[arg0][arg1][0] + glob53FE8[arg0][arg1][2]) - glob53FE8[arg0][arg1][0]) / glob53FE8[arg0][arg1][4]) * arg2), 0);
		return 0.0;
	}
	return 0.0;
}

function314C8(arg0, arg1, arg2)
{
	if(arg1 == -1 || (arg1 < -1) & (85 < arg1))
	{
		return 0;
	}
	if(glob53FE8[arg0][arg1][7])
	{
		glob53FE8[arg0][arg1][6] = arg2;
		PlayerTextDrawBoxColor(arg0, glob62F48[arg1][0], (arg2 & 255) | 0);
		PlayerTextDrawBoxColor(arg0, glob62F48[arg1][2], arg2);
		return 1;
	}
	return 0;
}

function31714(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
{
	if(-1 != funcidx(arg1))
	{
		random(255);
		strpack(glob634C4[arg0], arg1, 8);
		ShowPlayerDialog(arg0, 406704 + arg0, arg2, arg3, arg4, arg5, arg6);
		return 1;
	}
	return 0;
}

public JBC_OnDialogResponse(arg0, arg1, arg2, arg3, arg4)
{
	if(-1 != 406704 + arg0 && arg1 == 406704 + arg0)
	{
		new var0[32];
		strunpack(var0, glob634C4[arg0], 32);
		if(-1 != funcidx(var0))
		{
			if(!arg4 || (arg4 == 1 && !(arg4 + 4)))
			{
				CallLocalFunction(var0, 407444, arg0, arg2, arg3, 407464);
				return 1;
			}
			CallLocalFunction(var0, 407472, arg0, arg2, arg3, arg4);
			return 1;
		}
	}
	return 0;
}

main()
{
	print("\n\n\n\n\n\n\n\n\n\n\n\n\t\t---:: Story of Cities: Prad�ia | by Yiin\n\n\n\n\n\n\n\n\n\n\n\n");
	return 0;
}

public zcmd_OnGameModeInit()
{
	SetGameModeText("story");
	mysql_debug(1);
	mysql_connect(407984, 408024, 408044, 408068);
	if(mysql_ping(1) >= 1)
	{
		print(" ---:: MySQL");
	}
	else
	{
		SendRconCommand("exit");
	}
	function67D4(17, 0, 0, 0, 1077936128, 0, 0, 0, 0, 0, 0);
	DisableInteriorEnterExits();
	function6954();
	EnableStuntBonusForAll(false);
	ShowPlayerMarkers(false);
	ShowNameTags(true);
	EnableTirePopping(true);
	functionEA7C();
	for(new var0 = 0; var0 < 20; var0++)
	{
		for(new var1 = 0; var1 < 256; var1++)
		{
			glob3EEB4[var0][var1] = -1;
		}
		glob3ED24[var0][1] = -1;
	}
	print(" ---:: GPS");
	CreateDynamicPickup(19132, 23, 1129480192, 3277586432, 1060320051, 4294967295, 4294967295, 4294967295, 1120403456);
	CreateDynamicPickup(1275, 23, 1119667500, 3273656127, 1072940712, 4294967295, 4294967295, 4294967295, 1120403456);
	print(" ---:: Pickup'ai");
	SetTimer("dmg_txtdraw", 5000, true);
	SetTimer("CheckPaused", 2500, true);
	SetTimer("check_cars", 5000, true);
	SetTimer("spd", 300, true);
	print(" ---:: Taimeriai");
	glob4FA64[1] = CreateDynamicRectangle(96.3 - 4, -174.8001 - 4, 96.3 + 4, -174.8001 + 4, 0, 4294967295, 4294967295);
	glob4FA64[0] = CreateDynamicRectangle(96.3 - 4, -191.5 - 4, 96.3 + 4, -191.5 + 4, 0, 4294967295, 4294967295);
	print(" ---:: Vietos (Areas)");
	function7588(311856, 5, 100);
	glob4CF68 = random(6) + 32;
	glob4CF6C = random(6) + 32;
	glob4CF70 = random(6) + 32;
	glob4CF74 = random(6) + 32;
	glob4CF78 = random(6) + 32;
	glob4CF7C = random(6) + 32;
	glob4CF80 = random(6) + 32;
	glob4CF84 = random(6) + 32;
	glob4CF88 = random(6) + 32;
	glob4CF8C = random(6) + 32;
	glob4CF90 = random(6) + 32;
	glob4CF94 = random(6) + 32;
	glob4CF98 = random(6) + 32;
	glob4CF9C = random(6) + 32;
	glob4CFA0 = random(6) + 32;
	glob4CFA4 = random(6) + 32;
	glob4CF28[0] = function689C(475, 1128564222, 3279272896, 1068809322, 1132920832, glob4CF68, glob4CF6C, 1000);
	glob4CA78[glob4CF28[0]][0] = glob4CF68;
	glob4CA78[glob4CF28[0]][1] = glob4CF6C;
	glob4CF28[1] = function689C(410, 1128564222, 3278945216, 1068809322, 1132920832, glob4CF70, glob4CF74, 1000);
	glob4CA78[glob4CF28[1]][0] = glob4CF70;
	glob4CA78[glob4CF28[1]][1] = glob4CF74;
	glob4CF28[2] = function689C(412, 1128564222, 3278617536, 1068809322, 1132920832, glob4CF78, glob4CF7C, 1000);
	glob4CA78[glob4CF28[2]][0] = glob4CF78;
	glob4CA78[glob4CF28[2]][1] = glob4CF7C;
	glob4CF28[3] = function689C(419, 1128564222, 3278289856, 1068809322, 1132920832, glob4CF80, glob4CF84, 1000);
	glob4CA78[glob4CF28[3]][0] = glob4CF80;
	glob4CA78[glob4CF28[3]][1] = glob4CF84;
	glob4CF28[7] = function689C(542, 1129935399, 3278273610, 1068809322, 1119092736, glob4CFA0, glob4CFA4, 1000);
	glob4CA78[glob4CF28[7]][0] = glob4CFA0;
	glob4CA78[glob4CF28[7]][1] = glob4CFA4;
	glob4CF28[6] = function689C(462, 1129935399, 3278601290, 1068809322, 1119092736, glob4CF98, glob4CF9C, 1000);
	glob4CA78[glob4CF28[6]][0] = glob4CF98;
	glob4CA78[glob4CF28[6]][1] = glob4CF9C;
	glob4CF28[5] = function689C(549, 1129935399, 3278928970, 1068809322, 1119092736, glob4CF90, glob4CF94, 1000);
	glob4CA78[glob4CF28[5]][0] = glob4CF90;
	glob4CA78[glob4CF28[5]][1] = glob4CF94;
	glob4CF28[4] = function689C(492, 1129935399, 3279256650, 1068809322, 1119092736, glob4CF88, glob4CF8C, 1000);
	glob4CA78[glob4CF28[4]][0] = glob4CF88;
	glob4CA78[glob4CF28[4]][1] = glob4CF8C;
	for(new var0 = 0; var0 < 8; var0++)
	{
		new Float:var1 = 0.0, Float:var2 = 0.0, Float:var3 = 0.0, Float:var4 = 0.0;
		function54584(glob4CF28[var0], var1, var2, var3, var4, 1.0);
		glob4CF48[var0] = CreateDynamicObject(2661, var1, var2, var3, 0, 0, var4, 4294967295, 4294967295, 4294967295, 1133903872);
		SetDynamicObjectMaterialText(glob4CF48[var0], 0, 90, 408568, 72, 1, 4294967295, 0, 1);
		AttachDynamicObjectToVehicle(glob4CF48[var0], glob4CF28[var0], 0, 1069547520, 1059481190, 0, 0, 1127481344);
		glob4B510[var0][1] = 1;
	}
	function717C(311456, glob4C230[0], function689C(525, 1122607628, 3274742137, 1067531737, 3266576384, 4294967295, 4294967295, 1000), 100);
	function717C(311456, glob4C230[0], function689C(525, 1122607628, 3275791165, 1067531737, 3266576384, 4294967295, 4294967295, 1000), 100);
	function717C(311456, glob4C230[0], function689C(525, 1122607628, 3275531898, 1067531737, 3266576384, 4294967295, 4294967295, 1000), 100);
	function717C(311456, glob4C230[0], function689C(525, 1122607628, 3275273064, 1067531737, 3266576384, 4294967295, 4294967295, 1000), 100);
	function717C(311456, glob4C230[0], function689C(525, 1122607628, 3275007735, 1067531737, 3266576384, 4294967295, 4294967295, 1000), 100);
	function717C(311456, glob4C230[0], function689C(525, 1122607628, 3274481028, 1067531737, 3266576384, 4294967295, 4294967295, 1000), 100);
	function717C(311456, glob4C230[0], function689C(525, 1122607628, 3273957907, 1067531737, 3266576384, 4294967295, 4294967295, 1000), 100);
	function717C(311456, glob4C230[0], function689C(525, 1122607628, 3274221768, 1067531737, 3266576384, 4294967295, 4294967295, 1000), 100);
	function717C(311456, glob4C230[1], function689C(422, 1142749764, 3288945562, 1099032743, 1119092736, 4294967295, 4294967295, 1000), 100);
	function717C(311456, glob4C230[1], function689C(422, 1142749764, 3288881208, 1099032743, 1119092736, 4294967295, 4294967295, 1000), 100);
	function717C(311456, glob4C230[1], function689C(422, 1142749764, 3289141636, 1099032743, 1119092736, 4294967295, 4294967295, 1000), 100);
	function717C(311456, glob4C230[1], function689C(422, 1142749764, 3289010664, 1099032743, 1119092736, 4294967295, 4294967295, 1000), 100);
	function717C(311456, glob4C230[1], function689C(422, 1142749764, 3289078256, 1099032743, 1119092736, 4294967295, 4294967295, 1000), 100);
	function717C(311456, glob4C230[2], function689C(416, 1150935456, 1133923756, 1100827329, 1115947008, 4294967295, 4294967295, 1000), 100);
	function717C(311456, glob4C230[2], function689C(416, 1150899126, 1133593828, 1100827329, 1115947008, 4294967295, 4294967295, 1000), 100);
	function717C(311456, glob4C230[2], function689C(416, 1150909940, 1133697506, 1100827329, 1115947008, 4294967295, 4294967295, 1000), 100);
	function717C(311456, glob4C230[2], function689C(416, 1150922959, 1133812213, 1100827329, 1115947008, 4294967295, 4294967295, 1000), 100);
	function717C(311456, glob4C230[3], function689C(438, 1158447763, 3262076630, 1104244113, 0, 4294967295, 4294967295, 1000), 100);
	function717C(311456, glob4C230[3], function689C(438, 1158497607, 3258868721, 1104244113, 1119092736, 4294967295, 4294967295, 1000), 100);
	function717C(311456, glob4C230[3], function689C(438, 1158463154, 3262076630, 1104244113, 0, 4294967295, 4294967295, 1000), 100);
	function717C(311456, glob4C230[3], function689C(438, 1158480815, 3262076630, 1104244113, 0, 4294967295, 4294967295, 1000), 100);
	function717C(311456, glob4C230[3], function689C(438, 1158497607, 3260956987, 1104244113, 1119092736, 4294967295, 4294967295, 1000), 100);
	function717C(311456, glob4C230[3], function689C(438, 1158497607, 3259908175, 1104244113, 1119092736, 4294967295, 4294967295, 1000), 100);
	function717C(311456, glob4C230[3], function689C(438, 1158404090, 3262013532, 1104244113, 3266576384, 4294967295, 4294967295, 1000), 100);
	function717C(311456, glob4C230[3], function689C(438, 1158484113, 3257748239, 1104244113, 1127481344, 4294967295, 4294967295, 1000), 100);
	function717C(311456, glob4C230[3], function689C(438, 1158468940, 3257748239, 1104244113, 1127481344, 4294967295, 4294967295, 1000), 100);
	function717C(311456, glob4C230[3], function689C(438, 1158452737, 3257748239, 1104244113, 1127481344, 4294967295, 4294967295, 1000), 100);
	function717C(311456, glob4C230[3], function689C(438, 1158436030, 3257748239, 1104244113, 1127481344, 4294967295, 4294967295, 1000), 100);
	function717C(311456, glob4C230[3], function689C(438, 1158419187, 3257748239, 1104244113, 1127481344, 4294967295, 4294967295, 1000), 100);
	function717C(311456, glob4C230[3], function689C(438, 1158404090, 3258866729, 1104244113, 3266576384, 4294967295, 4294967295, 1000), 100);
	function717C(311456, glob4C230[3], function689C(438, 1158404090, 3259925188, 1104244113, 3266576384, 4294967295, 4294967295, 1000), 100);
	function717C(311456, glob4C230[3], function689C(438, 1158404090, 3260991275, 1104244113, 3266576384, 4294967295, 4294967295, 1000), 100);
	function717C(311456, glob4C230[4], function689C(544, 1145407848, 3289929284, 1099230400, 1127481344, 4294967295, 4294967295, 1000), 100);
	function717C(311456, glob4C230[4], function689C(544, 1146060879, 3289929284, 1099230400, 1127481344, 4294967295, 4294967295, 1000), 100);
	function717C(311456, glob4C230[4], function689C(544, 1145979073, 3289929284, 1099230400, 1127481344, 4294967295, 4294967295, 1000), 100);
	function717C(311456, glob4C230[4], function689C(544, 1145898507, 3289929284, 1099230400, 1127481344, 4294967295, 4294967295, 1000), 100);
	function717C(311456, glob4C230[4], function689C(544, 1145529252, 3289929284, 1099230400, 1127481344, 4294967295, 4294967295, 1000), 100);
	for(new var0 = 0; var0 < 5; var0++)
	{
		for(new var1 = 100; 100 != var1 = glob4C230[var0][var1]; )
		{
			glob4B510[var1][1] = 1;
			glob4B510[var1][2] = random(10) + 20;
			glob4B510[var1][3] = 0;
		}
	}
	print(" ---:: Ma�inos");
	glob4F434 = CreateDynamicObject(971, 1126182420, 3274872586, 1073238508, 0, 1127481344, 0, 4294967295, 4294967295, 4294967295, 1133903872);
	printf(" ---:: Dinaminiai objektai(%i)", CountDynamicObjects());
	for(new var0 = 0; var0 < 5; var0++)
	{
		printf("masinos[%i] = %i", var0, 311456);
	}
	print(" ---:: story pakrautas");
	return 1;
}

public OnGameModeExit()
{
	for(new var0 = 20; 20 != var0 = glob31D0[var0]; )
	{
		function4D178(var0);
	}
	mysql_close(1);
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	if(IsPlayerNPC(playerid))
	{
		return 1;
	}
	if(glob4A930[playerid][0] == 1)
	{
		function98144(playerid, 409020);
		Kick(playerid);
		return 1;
	}
	if(glob63D6C[playerid])
	{
		return 1;
	}
	function19198(playerid);
	glob479AC[playerid] = function2F854(playerid, 205.0, 362.0, 237.5, 1.5, 2004318207, 30000.0);
	glob479FC[playerid] = function2F854(playerid, 264.0, 414.0, 100.5, 1.5, 3315821055, 100.0);
	functionBDD0(playerid);
	function8CDC(playerid);
	SendClientMessage(playerid, 0xA9C4E4FF, "{FFFFFF}Prisijungei prie {ff3600}Story of Cities{FFFFFF}. Smagiai praleisk laika!");
	new var0[3][6] = {
		{ 448.5773, -498.8352, 69.949, 569.1663, -422.6969, 28.0137 },
		{ 956.8905, -104.0216, 29.2096, 804.0623, -173.3507, 22.7567 },
		{ 2061.372, 10.9882, 46.3746, 2144.3798, 148.572, -6.5045 }
	};
	new var1 = random(3);
	SetPlayerWeather(playerid, 30);
	SetPlayerCameraPos(playerid, var0[var1][0], var0[var1][1], var0[var1][2]);
	function64FC(playerid, var0[var1][0], var0[var1][1], var0[var1][2] - 2);
	SetPlayerCameraLookAt(playerid, var0[var1][3], var0[var1][4], var0[var1][5], 2);
	Streamer_Update(playerid);
	TextDrawShowForPlayer(playerid, glob510D0);
	TextDrawShowForPlayer(playerid, glob510D4);
	TextDrawShowForPlayer(playerid, glob510D8);
	TextDrawShowForPlayer(playerid, glob510DC);
	TextDrawShowForPlayer(playerid, glob510E0);
	glob63D6C[playerid] = 1;
	SendClientMessage(playerid, 0x00000000, "soc_init");
	return 1;
}

public Streamer_OnPlayerConnect(playerid)
{
	if(IsPlayerNPC(playerid))
	{
		return 1;
	}
	function8CDC(playerid);
	SendClientMessage(playerid, 0xFFFFFFFF, "{ffffff}Prisijungei prie {ff3600}Story of Cities{ffffff}. Smagiai praleisk laika!");
	glob4A930[playerid][0] = 0;
	glob4A930[playerid][2] = 0;
	glob4A930[playerid][1] = 0;
	glob4A930[playerid][3] = 0;
	glob4A930[playerid][4] = 0;
	glob63D6C[playerid] = 0;
	glob49ACC[playerid][13] = 0;
	for(new var0 = 0; var0 < 13; var0++)
	{
		glob49ACC[playerid][var0] = -1;
	}
	glob4A8E0[playerid] = 0;
	glob4AE30[playerid] = 0;
	TogglePlayerClock(playerid, false);
	DisablePlayerOPIDC(playerid);
	for(new var0 = 0; var0 < 256; var0++)
	{
		glob3EEB4[playerid][var0] = -1;
	}
	glob3ED24[playerid][1] = -1;
	glob3ED24[playerid][3] = -1;
	function515F8(playerid);
	glob4AE80[playerid] = 0;
	SetPlayerVirtualWorld(playerid, random(500) + 65536);
	return 1;
}

public Streamer_OnPlayerDisconnect(playerid, arg1)
{
	if(IsPlayerNPC(playerid))
	{
		return 1;
	}
	if(glob4A930[playerid][0] == 1)
	{
		if(arg1 == 2)
		{
			glob4A33C[playerid][10]++;
		}
		glob3ED24[playerid][1] = -1;
		glob3ED24[playerid][3] = -1;
		function515F8(playerid);
		function4D178(playerid);
		glob4AE80[playerid] = 0;
	}
	function2EA68(playerid);
	glob4A930[playerid][3] = 0;
	glob4A930[playerid][0] = 0;
	glob63D6C[playerid] = 0;
	return 1;
}

public OnPlayerSpawn(playerid)
{
	if(IsPlayerNPC(playerid))
	{
		glob4A88C = playerid;
		SetPlayerSkin(playerid, 44);
		new Float:var0 = 0.0, Float:var1 = 0.0, Float:var2 = 0.0;
		GetPlayerPos(0, var0, var1, var2);
		function64FC(playerid, var0 + random(5), var1 + random(5), var2);
		glob637C4[playerid] = 100;
		print("npc spawninosi");
		return 1;
	}
	if(!glob4A930[playerid][0])
	{
		Kick(playerid);
	}
	glob4D38C[playerid] = 1;
	if(glob4A930[playerid][1] || glob4A930[playerid][2])
	{
		if(glob4A930[playerid][1])
		{
			function4E6D8(playerid);
			glob4A930[playerid][1] = 0;
		}
		else
		{
			glob4A33C[playerid][0] = 0;
			SetPlayerSkin(playerid, glob4A33C[playerid][0]);
			function64FC(playerid, 1143653994, 3287264818, 1099083756);
			Streamer_Update(playerid);
			SetPlayerVirtualWorld(playerid, 0);
			glob4A930[playerid][2] = 0;
			function93738(playerid);
		}
		if(glob4A33C[playerid][9] == 3)
		{
			SendClientMessage(playerid, 0x97FC3CFF, "SVEIKAS PRISIJUNGES, AUKSINIS VIP'e!!!");
		}
		TextDrawHideForPlayer(playerid, glob510D0);
		TextDrawHideForPlayer(playerid, glob510D4);
		function36B14(playerid);
		PlayerTextDrawShow(playerid, glob510E4[playerid]);
		SetPlayerWorldBounds(playerid, 2907.3359, -360.3514, 629.3436, -683.3978);
		SetPlayerWeather(playerid, 6);
		function6790(playerid, 0);
		glob4D3DC[playerid] = 0;
		glob4F6F4[playerid] = SetTimerEx("update_xp", 120000, true, "i", playerid);
		return 1;
	}
	SetPlayerSkin(playerid, glob4A33C[playerid][13]);
	function64FC(playerid, 1143653994, 3287264818, 1099083756);
	function66C4(playerid, 1120403456);
	Streamer_Update(playerid);
	SetPlayerWeather(playerid, 6);
	glob4D3DC[playerid] = 0;
	return 1;
}

public logo_fade(arg0)
{
	glob64244[arg0] = glob64244[arg0] - 5;
	PlayerTextDrawColor(arg0, glob4FB10[arg0], glob64244[arg0]);
	PlayerTextDrawShow(arg0, glob4FB10[arg0]);
	if(glob64244[arg0] <= -256)
	{
		KillTimer(glob642E4[arg0]);
		PlayerTextDrawHide(arg0, glob4FB10[arg0]);
	}
	return 0;
}

public logo_unfade(arg0)
{
	glob64244[arg0] = glob64244[arg0] + 5;
	PlayerTextDrawColor(arg0, glob4FB10[arg0], glob64244[arg0]);
	PlayerTextDrawShow(arg0, glob4FB10[arg0]);
	if(glob64244[arg0] >= -1)
	{
		KillTimer(glob64294[arg0]);
	}
	return 0;
}

function36A6C(arg0)
{
	glob64244[arg0] = -256;
	glob64294[arg0] = SetTimerEx("logo_unfade", 40, true, "i", arg0);
	return 0;
}

function36B14(arg0)
{
	glob64244[arg0] = -1;
	glob642E4[arg0] = SetTimerEx("logo_fade", 40, true, "i", arg0);
	return 0;
}

public OnPlayerGiveDamage()
{
	return 1;
}

public OnPlayerClickMap(playerid, arg1, arg2, arg3)
{
	if(function9DADC(playerid))
	{
		return 1;
	}
	if(!function54A1C(playerid, 0))
	{
		return 1;
	}
	new Float:var0 = 0.0, Float:var1 = 0.0, Float:var2 = 0.0;
	GetPlayerPos(playerid, var0, var1, var2);
	EnablePlayerOPIDC(playerid);
	glob3ED24[playerid][0] = NearestNodeFromPoint(var0, var1, var2, 1176256502, 4294967295, 0);
	glob3ED24[playerid][1] = NearestNodeFromPoint(arg1, arg2, arg3, 1176256502, 4294967295, 0);
	GetNodePos(glob3ED24[playerid][1], var0, var1, var2);
	CalculatePath(glob3ED24[playerid][0], glob3ED24[playerid][1], playerid + 100);
	SetPlayerCheckpoint(playerid, var0, var1, var2, 3.0);
	return 1;
}

public OnPlayerPause(playerid)
{
	glob4BFB0[playerid][0] = Create3DTextLabel(410524, 1466861311, 0, 0, 0, 1106247680, 0, 0);
	Attach3DTextLabelToPlayer(glob4BFB0[playerid][0], playerid, 0, 0, 3212836864);
	if(!IsPlayerInAnyVehicle(playerid))
	{
		ApplyAnimation(playerid, "CRACK", "crckidle2", 10.0, 1, 0, 0, 1, 60000, 1);
	}
	else
	{
		function9302C(playerid);
	}
	return 1;
}

public cmd_gauja(arg0)
{
	function64FC(arg0, 1146767933, 3256541512, 1115524956);
	return 1;
}

public cmd_pause(playerid)
{
	ApplyAnimation(playerid, "CRACK", "crckidle2", 10.0, 1, 0, 0, 1, 60000, 1);
	return 1;
}

public cmd_pause2(playerid)
{
	ApplyAnimation(playerid, "CRACK", "crckidle2", 1.0, 0, 0, 0, 1, 0, 1);
	return 1;
}

public cmd_unpause(playerid)
{
	ClearAnimations(playerid, 0);
	return 1;
}

public OnPlayerUnpause(playerid)
{
	Delete3DTextLabel(glob4BFB0[playerid][0]);
	if(!IsPlayerInAnyVehicle(playerid))
	{
		ClearAnimations(playerid, 1);
	}
	else
	{
		function932D8(playerid);
	}
	return function98144(playerid, 410740);
}

public OnPlayerDeath(playerid, killerid, reason)
{
	glob4A33C[playerid][13] = GetPlayerSkin(playerid);
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	glob4B510[vehicleid][1] = 1;
	return 1;
}

public OnPlayerText(playerid, text)
{
	if(function9D9F0(playerid))
	{
		return 0;
	}
	return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	if(function9D9F0(playerid))
	{
		return 0;
	}
	printf("vehicleid = %i", vehicleid);
	if(glob4A33C[playerid][6] == vehicleid)
	{
		if(glob4A930[playerid][7])
		{
			new var0 = 0;
			for(var0 = 0; var0 < 8; var0++)
			{
				if(vehicleid == glob4CF28[var0])
				{
					glob4CF28[var0] = -1;
				}
				else
				{
				}
			}
			printf("i = %i", var0);
			glob4F514[playerid] = SetTimerEx("car_buy_timer", 1000, true, "i", playerid);
			glob4B510[vehicleid][2] = 20;
			glob4B510[vehicleid][1] = 0;
			function98144(playerid, 410924);
			glob4A930[playerid][7] = 0;
			glob4AED0[playerid][3] = glob4CA78[vehicleid][0];
			glob4AED0[playerid][4] = glob4CA78[vehicleid][1];
			SetDynamicObjectMaterialText(glob4CF48[var0], 0, 410992, 90, 411008, 48, 1, 0, 0, 1);
		}
		else if(glob4B510[vehicleid][1])
		{
			glob4B510[vehicleid][1] = 0;
			function98144(playerid, 411036);
		}
		return 1;
	}
	for(new var0 = 0; var0 < 5; var0++)
	{
		for(new var1 = 100; 100 != var1 = glob4C230[var0][var1]; )
		{
			if(vehicleid == var1)
			{
				if(glob4B510[var1][1])
				{
					glob4B510[var1][1] = 0;
					return function98144(playerid, 411104);
				}
				return 1;
			}
		}
	}
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	if(function9D9F0(playerid))
	{
		return 0;
	}
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	if(function9D9F0(playerid))
	{
		return 1;
	}
	if(newstate == 2)
	{
		if(!function8F3C(playerid))
		{
			new var0[16], var1 = GetPlayerVehicleID(playerid);
			if(glob4B510[var1][1])
			{
				function98144(playerid, 411172);
				Kick(playerid);
				return 1;
			}
			PlayerTextDrawShow(playerid, glob51134[playerid]);
			PlayerTextDrawShow(playerid, glob51184[playerid]);
			PlayerTextDrawShow(playerid, glob511D4[playerid]);
			PlayerTextDrawShow(playerid, glob51224[playerid]);
			PlayerTextDrawShow(playerid, glob51274[playerid]);
			PlayerTextDrawShow(playerid, glob512C4[playerid]);
			PlayerTextDrawShow(playerid, glob51314[playerid]);
			PlayerTextDrawShow(playerid, glob51364[playerid]);
			PlayerTextDrawShow(playerid, glob513B4[playerid]);
			PlayerTextDrawShow(playerid, glob51404[playerid]);
			format(var0, 16, "%s", function9014(var1));
			PlayerTextDrawSetString(playerid, glob51404[playerid], var0);
			if(!glob4B510[var1][0])
			{
				new var2[7];
				GetVehicleParamsEx(var1, var2, var2, var2, var2, var2, var2, var2);
				SetVehicleParamsEx(var1, 0, var2[0], var2[1], var2[2], var2[3], var2[4], var2[5]);
			}
			TogglePlayerDynamicArea(playerid, glob4FA64[1], 1);
			TogglePlayerDynamicArea(playerid, glob4FA64[0], 1);
			return 1;
		}
	}
	if(newstate == 3)
	{
		return 1;
	}
	if(oldstate == 2)
	{
		PlayerTextDrawHide(playerid, glob51134[playerid]);
		PlayerTextDrawHide(playerid, glob51184[playerid]);
		PlayerTextDrawHide(playerid, glob511D4[playerid]);
		PlayerTextDrawHide(playerid, glob51224[playerid]);
		PlayerTextDrawHide(playerid, glob51274[playerid]);
		PlayerTextDrawHide(playerid, glob512C4[playerid]);
		PlayerTextDrawHide(playerid, glob51314[playerid]);
		PlayerTextDrawHide(playerid, glob51364[playerid]);
		PlayerTextDrawHide(playerid, glob513B4[playerid]);
		PlayerTextDrawHide(playerid, glob51404[playerid]);
		TogglePlayerDynamicArea(playerid, glob4FA64[1], 0);
		TogglePlayerDynamicArea(playerid, glob4FA64[0], 0);
		return 1;
	}
	if(oldstate == 3 && newstate == 1)
	{
		return 1;
	}
	if((oldstate == 2 && newstate == 3) || (oldstate == 3 && newstate == 2))
	{
		function98144(playerid, 411300);
		Kick(playerid);
		return 1;
	}
	return 1;
}

public Streamer_OnPlayerEnterCP(playerid)
{
	if(0 < glob3ED24[playerid][1])
	{
		function389A4(playerid);
		return function98144(playerid, 411324);
	}
	DisablePlayerCheckpoint(playerid);
	return 1;
}

function389A4(playerid)
{
	glob3ED24[playerid][1] = -1;
	function515F8(playerid);
	DisablePlayerCheckpoint(playerid);
	DisablePlayerOPIDC(playerid);
	return 0;
}

public Streamer_OnPlayerLeaveCP()
{
	return 1;
}

public Streamer_OnPlayerEnterRaceCP()
{
	return 1;
}

public Streamer_OnPlayerLeaveRaceCP()
{
	return 1;
}

public OnRconCommand(cmd)
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	if(IsPlayerNPC(playerid))
	{
		return 1;
	}
	if(!glob4A930[playerid][3])
	{
		return 0;
	}
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpDynamicPickup(playerid, arg1)
{
	switch(arg1) {
		case 1:
			glob4C050[playerid] = 4;
			glob4A930[playerid][5] = 1;
			function64FC(playerid, 1129283584, 3277586432, 1060320051);
			function9302C(playerid);
			SetPlayerCameraPos(playerid, 203.5216, -243.0611, 1.9602);
			SetPlayerCameraLookAt(playerid, 196.5234, -245.7334, 0.492, 1);
			glob4D38C[playerid] = 1;
			PlayerTextDrawShow(playerid, glob51B78[playerid]);
			PlayerTextDrawShow(playerid, glob51BC8[playerid]);
			PlayerTextDrawShow(playerid, glob51C18[playerid]);
			TextDrawShowForPlayer(playerid, glob51B60);
			TextDrawShowForPlayer(playerid, glob51B64);
			TextDrawShowForPlayer(playerid, glob51B68);
			TextDrawShowForPlayer(playerid, glob51B6C);
			TextDrawShowForPlayer(playerid, glob51B70);
			TextDrawShowForPlayer(playerid, glob51B74);
			PlayerTextDrawSetString(playerid, glob51B78[playerid], glob4BE70[0]);
			PlayerTextDrawSetString(playerid, glob51BC8[playerid], glob4BE70[0]);
			PlayerTextDrawSetString(playerid, glob51C18[playerid]);
			SelectTextDraw(playerid, 3355443455);
			return 1;
		case 2:
			if(!glob4A33C[playerid][7])
			{
				glob4A33C[playerid][7] = 1;
				glob4A33C[playerid][12] = 50;
				SetPlayerSkin(playerid, 50);
				return function98144(playerid, 411432);
			}
			if(glob4A33C[playerid][7] == 1)
			{
				glob4A33C[playerid][7] = 0;
				SetPlayerSkin(playerid, glob4A33C[playerid][0]);
				return function98144(playerid, 411516);
			}
			return function98144(playerid, 411600);
	}
	return 1;
}

public OnPlayerClickPlayerTextDraw(playerid, arg1)
{
	if(function9D9F0(playerid))
	{
		return 1;
	}
	if(glob4C050[playerid] == 3)
	{
		new var0 = 12;
		while(var0 < 61)
		{
			if(arg1 == glob4FB88[playerid][var0])
			{
				if(-1 != glob49ACC[playerid][17])
				{
					if(glob47A4C[playerid][glob49ACC[playerid][15]] == 1)
					{
						PlayerTextDrawColor(playerid, glob49ACC[playerid][17], 2549890303);
					}
					else
					{
						PlayerTextDrawColor(playerid, glob49ACC[playerid][17], 4294967295);
					}
					PlayerTextDrawShow(playerid, glob49ACC[playerid][17]);
					glob49ACC[playerid][15] = -1;
					if(glob49ACC[playerid][17] == glob4FB88[playerid][var0] && glob49ACC[playerid][16] == glob4FB88[playerid][var0])
					{
						glob49ACC[playerid][16] = -1;
						glob49ACC[playerid][17] = -1;
						return 1;
					}
				}
				glob49ACC[playerid][17] = glob4FB88[playerid][var0];
				glob49ACC[playerid][15] = glob49ACC[playerid][(var0 - 12) / 4];
				if(glob47A4C[playerid][glob49ACC[playerid][15]])
				{
					PlayerTextDrawSetString(playerid, glob4FB88[playerid][5], 411688);
				}
				else
				{
					PlayerTextDrawSetString(playerid, glob4FB88[playerid][5], 411716);
				}
				PlayerTextDrawShow(playerid, glob4FB88[playerid][5]);
				function98144(playerid, glob44490[glob49ACC[playerid][15]]);
				PlayerTextDrawColor(playerid, glob4FB88[playerid][var0], 3355443455);
				PlayerTextDrawShow(playerid, glob4FB88[playerid][var0]);
				glob49ACC[playerid][16] = glob4FB88[playerid][var0];
				return 1;
			}
		}
		if(arg1 == glob4FB88[playerid][4])
		{
			function96930(playerid);
			PlayerTextDrawColor(playerid, glob49ACC[playerid][17], 4294967295);
			glob49ACC[playerid][16] = -1;
			glob49ACC[playerid][17] = -1;
			glob49ACC[playerid][15] = -1;
			CancelSelectTextDraw(playerid);
			return 1;
		}
		if(arg1 == glob4FB88[playerid][5])
		{
			if(glob49ACC[playerid][15] == -1)
			{
				return 1;
			}
			if(!glob47A4C[playerid][glob49ACC[playerid][15]])
			{
				switch(glob49ACC[playerid][15]) {
					case 8:
						if(function8570(playerid))
						{
							return function98144(playerid, 411748);
						}
						SetPlayerAttachedObject(playerid, 9, 18632, 6, 0, 0, 0, 1127481344, 0, 0, 1065353216, 1065353216, 1065353216, 0, 0);
						glob47A4C[playerid][8] = 1;
					case 3:
						for(new var0 = 100; 100 != var0 = glob4C230[0][var0]; )
						{
							if(functionAF84(playerid, var0, 6.0))
							{
								if(!glob4B510[var0][1])
								{
									glob4B510[var0][1] = 1;
									function98144(playerid, 411932);
									for(new var1 = 20; 20 != var1 = glob31D0[var1]; )
									{
										if(!glob4597C[var1][3])
										{
											SetVehicleParamsForPlayer(var0, var1, false, true);
										}
										else
										{
											SetVehicleParamsForPlayer(var0, var1, false, false);
										}
									}
								}
							}
						}
					case 98:
						for(new var0 = 100; 100 != var0 = glob4C230[1][var0]; )
						{
							if(functionAF84(playerid, var0, 6.0))
							{
								if(!glob4B510[var0][1])
								{
									glob4B510[var0][1] = 1;
									function98144(playerid, 412000);
									for(new var1 = 20; 20 != var1 = glob31D0[var1]; )
									{
										if(!glob4597C[var1][98])
										{
											SetVehicleParamsForPlayer(var0, var1, false, true);
										}
										else
										{
											SetVehicleParamsForPlayer(var0, var1, false, false);
										}
									}
								}
							}
						}
					case 99:
						for(new var0 = 100; 100 != var0 = glob4C230[2][var0]; )
						{
							if(functionAF84(playerid, var0, 6.0))
							{
								if(!glob4B510[var0][1])
								{
									glob4B510[var0][1] = 1;
									function98144(playerid, 412068);
									for(new var1 = 20; 20 != var1 = glob31D0[var1]; )
									{
										if(!glob4597C[var1][99])
										{
											SetVehicleParamsForPlayer(var0, var1, false, true);
										}
										else
										{
											SetVehicleParamsForPlayer(var0, var1, false, false);
										}
									}
								}
							}
						}
					case 100:
						for(new var0 = 100; 100 != var0 = glob4C230[3][var0]; )
						{
							if(functionAF84(playerid, var0, 6.0))
							{
								if(!glob4B510[var0][1])
								{
									glob4B510[var0][1] = 1;
									function98144(playerid, 412136);
									for(new var1 = 20; 20 != var1 = glob31D0[var1]; )
									{
										if(!glob4597C[var1][100])
										{
											SetVehicleParamsForPlayer(var0, var1, false, true);
										}
										else
										{
											SetVehicleParamsForPlayer(var0, var1, false, false);
										}
									}
								}
							}
						}
					case 101:
						for(new var0 = 100; 100 != var0 = glob4C230[4][var0]; )
						{
							if(functionAF84(playerid, var0, 6.0))
							{
								if(!glob4B510[var0][1])
								{
									glob4B510[var0][1] = 1;
									function98144(playerid, 412204);
									for(new var1 = 20; 20 != var1 = glob31D0[var1]; )
									{
										if(!glob4597C[var1][101])
										{
											SetVehicleParamsForPlayer(var0, var1, false, true);
										}
										else
										{
											SetVehicleParamsForPlayer(var0, var1, false, false);
										}
									}
								}
							}
						}
					case 0:
						function96930(playerid);
						function983F0(playerid);
						function99040(playerid);
						return 1;
					case 24:
						if(glob4597C[playerid][60])
						{
							if(glob47A4C[playerid][8])
							{
								RemovePlayerAttachedObject(playerid, 9);
								glob47A4C[playerid][8] = 0;
							}
							function65F8(playerid, 22, glob4597C[playerid][60]);
							glob47A4C[playerid][glob49ACC[playerid][15]] = 1;
							glob47A4C[playerid][25] = 0;
							glob47A4C[playerid][26] = 0;
						}
						else
						{
							function98144(playerid, 412272);
						}
					case 25:
						if(glob4597C[playerid][60])
						{
							if(glob47A4C[playerid][8])
							{
								RemovePlayerAttachedObject(playerid, 9);
								glob47A4C[playerid][8] = 0;
							}
							glob47A4C[playerid][glob49ACC[playerid][15]] = 1;
							glob47A4C[playerid][24] = 0;
							glob47A4C[playerid][26] = 0;
						}
						else
						{
							function98144(playerid, 412324);
						}
					case 26:
						if(glob4597C[playerid][60])
						{
							if(glob47A4C[playerid][8])
							{
								RemovePlayerAttachedObject(playerid, 9);
								glob47A4C[playerid][8] = 0;
							}
							function65F8(playerid, 24, glob4597C[playerid][60]);
							glob47A4C[playerid][glob49ACC[playerid][15]] = 1;
							glob47A4C[playerid][25] = 0;
							glob47A4C[playerid][24] = 0;
						}
						else
						{
							function98144(playerid, 412376);
						}
					case 27:
						if(glob4597C[playerid][61])
						{
							if(glob47A4C[playerid][8])
							{
								RemovePlayerAttachedObject(playerid, 9);
								glob47A4C[playerid][8] = 0;
							}
							glob47A4C[playerid][glob49ACC[playerid][15]] = 1;
							glob47A4C[playerid][28] = 0;
							glob47A4C[playerid][29] = 0;
						}
						else
						{
							function98144(playerid, 412428);
						}
					case 28:
						if(glob4597C[playerid][61])
						{
							if(glob47A4C[playerid][8])
							{
								RemovePlayerAttachedObject(playerid, 9);
								glob47A4C[playerid][8] = 0;
							}
							glob47A4C[playerid][glob49ACC[playerid][15]] = 1;
							glob47A4C[playerid][27] = 0;
							glob47A4C[playerid][29] = 0;
						}
						else
						{
							function98144(playerid, 412480);
						}
					case 29:
						if(glob4597C[playerid][61])
						{
							if(glob47A4C[playerid][8])
							{
								RemovePlayerAttachedObject(playerid, 9);
								glob47A4C[playerid][8] = 0;
							}
							glob47A4C[playerid][glob49ACC[playerid][15]] = 1;
							glob47A4C[playerid][27] = 0;
							glob47A4C[playerid][28] = 0;
						}
						else
						{
							function98144(playerid, 412532);
						}
					case 34:
						if(glob4597C[playerid][62])
						{
							if(glob47A4C[playerid][8])
							{
								RemovePlayerAttachedObject(playerid, 9);
								glob47A4C[playerid][8] = 0;
							}
							glob47A4C[playerid][glob49ACC[playerid][15]] = 1;
							glob47A4C[playerid][30] = 0;
							glob47A4C[playerid][31] = 0;
						}
						else
						{
							function98144(playerid, 412584);
						}
					case 30:
						if(glob4597C[playerid][62])
						{
							if(glob47A4C[playerid][8])
							{
								RemovePlayerAttachedObject(playerid, 9);
								glob47A4C[playerid][8] = 0;
							}
							glob47A4C[playerid][glob49ACC[playerid][15]] = 1;
							glob47A4C[playerid][34] = 0;
							glob47A4C[playerid][31] = 0;
						}
						else
						{
							function98144(playerid, 412636);
						}
					case 31:
						if(glob4597C[playerid][62])
						{
							if(glob47A4C[playerid][8])
							{
								RemovePlayerAttachedObject(playerid, 9);
								glob47A4C[playerid][8] = 0;
							}
							glob47A4C[playerid][glob49ACC[playerid][15]] = 1;
							glob47A4C[playerid][34] = 0;
							glob47A4C[playerid][30] = 0;
						}
						else
						{
							function98144(playerid, 412688);
						}
					case 33:
						if(glob4597C[playerid][63])
						{
							if(glob47A4C[playerid][8])
							{
								RemovePlayerAttachedObject(playerid, 9);
								glob47A4C[playerid][8] = 0;
							}
							glob47A4C[playerid][glob49ACC[playerid][15]] = 1;
							glob47A4C[playerid][32] = 0;
						}
						else
						{
							function98144(playerid, 412740);
						}
					case 32:
						if(glob4597C[playerid][63])
						{
							if(glob47A4C[playerid][8])
							{
								RemovePlayerAttachedObject(playerid, 9);
								glob47A4C[playerid][8] = 0;
							}
							glob47A4C[playerid][glob49ACC[playerid][15]] = 1;
							glob47A4C[playerid][33] = 0;
						}
						else
						{
							function98144(playerid, 412792);
						}
					case 35:
						if(glob4597C[playerid][64])
						{
							if(glob47A4C[playerid][8])
							{
								RemovePlayerAttachedObject(playerid, 9);
								glob47A4C[playerid][8] = 0;
							}
							glob47A4C[playerid][glob49ACC[playerid][15]] = 1;
							glob47A4C[playerid][36] = 0;
						}
						else
						{
							function98144(playerid, 412844);
						}
					case 36:
						if(glob4597C[playerid][64])
						{
							if(glob47A4C[playerid][8])
							{
								RemovePlayerAttachedObject(playerid, 9);
								glob47A4C[playerid][8] = 0;
							}
							glob47A4C[playerid][glob49ACC[playerid][15]] = 1;
							glob47A4C[playerid][35] = 0;
						}
						else
						{
							function98144(playerid, 412896);
						}
					case 41:
						if(glob4597C[playerid][65])
						{
							if(glob47A4C[playerid][8])
							{
								RemovePlayerAttachedObject(playerid, 9);
								glob47A4C[playerid][8] = 0;
							}
							glob47A4C[playerid][glob49ACC[playerid][15]] = 1;
							glob47A4C[playerid][42] = 0;
							glob47A4C[playerid][43] = 0;
							glob47A4C[playerid][44] = 0;
						}
						else
						{
							function98144(playerid, 412948);
						}
					case 42:
						if(glob4597C[playerid][65])
						{
							if(glob47A4C[playerid][8])
							{
								RemovePlayerAttachedObject(playerid, 9);
								glob47A4C[playerid][8] = 0;
							}
							glob47A4C[playerid][glob49ACC[playerid][15]] = 1;
							glob47A4C[playerid][41] = 0;
							glob47A4C[playerid][43] = 0;
							glob47A4C[playerid][44] = 0;
						}
						else
						{
							function98144(playerid, 413000);
						}
					case 43:
						if(glob4597C[playerid][65])
						{
							if(glob47A4C[playerid][8])
							{
								RemovePlayerAttachedObject(playerid, 9);
								glob47A4C[playerid][8] = 0;
							}
							glob47A4C[playerid][glob49ACC[playerid][15]] = 1;
							glob47A4C[playerid][41] = 0;
							glob47A4C[playerid][42] = 0;
							glob47A4C[playerid][44] = 0;
						}
						else
						{
							function98144(playerid, 413052);
						}
					case 44:
						if(glob4597C[playerid][65])
						{
							if(glob47A4C[playerid][8])
							{
								RemovePlayerAttachedObject(playerid, 9);
								glob47A4C[playerid][8] = 0;
							}
							glob47A4C[playerid][glob49ACC[playerid][15]] = 1;
							glob47A4C[playerid][41] = 0;
							glob47A4C[playerid][42] = 0;
							glob47A4C[playerid][43] = 0;
						}
						else
						{
							function98144(playerid, 413104);
						}
				}
			}
			else
			{
				switch(glob49ACC[playerid][15]) {
					case 8:
						glob47A4C[playerid][8] = 0;
					case 0:
						function389A4(playerid);
					case 24:
						glob47A4C[playerid][glob49ACC[playerid][15]] = 0;
					case 25:
						glob47A4C[playerid][glob49ACC[playerid][15]] = 0;
					case 26:
						glob47A4C[playerid][glob49ACC[playerid][15]] = 0;
					case 34:
						glob47A4C[playerid][glob49ACC[playerid][15]] = 0;
					case 30:
						glob47A4C[playerid][glob49ACC[playerid][15]] = 0;
					case 31:
						glob47A4C[playerid][glob49ACC[playerid][15]] = 0;
					case 27:
						glob47A4C[playerid][glob49ACC[playerid][15]] = 0;
					case 28:
						glob47A4C[playerid][glob49ACC[playerid][15]] = 0;
					case 29:
						glob47A4C[playerid][glob49ACC[playerid][15]] = 0;
					case 33:
						glob47A4C[playerid][glob49ACC[playerid][15]] = 0;
					case 32:
						glob47A4C[playerid][glob49ACC[playerid][15]] = 0;
					case 35:
						glob47A4C[playerid][glob49ACC[playerid][15]] = 0;
					case 36:
						glob47A4C[playerid][glob49ACC[playerid][15]] = 0;
					case 41:
						glob47A4C[playerid][glob49ACC[playerid][15]] = 0;
					case 42:
						glob47A4C[playerid][glob49ACC[playerid][15]] = 0;
					case 43:
						glob47A4C[playerid][glob49ACC[playerid][15]] = 0;
					case 44:
						glob47A4C[playerid][glob49ACC[playerid][15]] = 0;
				}
			}
			function96A30(playerid, 3);
			return 1;
		}
		if(arg1 == glob4FB88[playerid][2])
		{
			if(-1 != glob49ACC[playerid][15])
			{
				if(function54A90(playerid, glob49ACC[playerid][15]) > 1)
				{
					function31714(playerid, "dialog_drop_item", 1, 413224, 413288, 413344, 413376);
					return 1;
				}
				function8F2DC(playerid, glob49ACC[playerid][15], 4294967295);
				if(glob49ACC[playerid][15] > 23 && glob49ACC[playerid][15] < 48)
				{
					function8334(playerid, glob49ACC[playerid][15] - 2);
				}
				switch(glob49ACC[playerid][15]) {
					case 3:
						for(new var0 = 100; 100 != var0 = glob4C230[0][var0]; )
						{
							if(glob4B510[var0][1])
							{
								SetVehicleParamsForPlayer(var0, playerid, false, true);
							}
							else
							{
								SetVehicleParamsForPlayer(var0, playerid, false, false);
							}
						}
					case 98:
						for(new var0 = 100; 100 != var0 = glob4C230[1][var0]; )
						{
							if(glob4B510[var0][1])
							{
								SetVehicleParamsForPlayer(var0, playerid, false, true);
							}
							else
							{
								SetVehicleParamsForPlayer(var0, playerid, false, false);
							}
						}
					case 99:
						for(new var0 = 100; 100 != var0 = glob4C230[2][var0]; )
						{
							if(glob4B510[var0][1])
							{
								SetVehicleParamsForPlayer(var0, playerid, false, true);
							}
							else
							{
								SetVehicleParamsForPlayer(var0, playerid, false, false);
							}
						}
					case 100:
						for(new var0 = 100; 100 != var0 = glob4C230[3][var0]; )
						{
							if(glob4B510[var0][1])
							{
								SetVehicleParamsForPlayer(var0, playerid, false, true);
							}
							else
							{
								SetVehicleParamsForPlayer(var0, playerid, false, false);
							}
						}
					case 101:
						for(new var0 = 100; 100 != var0 = glob4C230[4][var0]; )
						{
							if(glob4B510[var0][1])
							{
								SetVehicleParamsForPlayer(var0, playerid, false, true);
							}
							else
							{
								SetVehicleParamsForPlayer(var0, playerid, false, false);
							}
						}
					case 14:
						function69A4(playerid, glob4597C[playerid][14]);
					case 60:
						if(!glob4597C[playerid][60])
						{
							function8334(playerid, function8F1B4(playerid, 2));
						}
						else
						{
							SetPlayerAmmo(playerid, 2, glob4597C[playerid][60]);
						}
					case 61:
						if(!glob4597C[playerid][61])
						{
							function8334(playerid, function8F1B4(playerid, 3));
						}
						else
						{
							SetPlayerAmmo(playerid, 3, glob4597C[playerid][61]);
						}
					case 62:
						if(!glob4597C[playerid][62])
						{
							function8334(playerid, function8F1B4(playerid, 4));
						}
						else
						{
							SetPlayerAmmo(playerid, 4, glob4597C[playerid][62]);
						}
					case 63:
						if(!glob4597C[playerid][63])
						{
							function8334(playerid, function8F1B4(playerid, 5));
						}
						else
						{
							SetPlayerAmmo(playerid, 5, glob4597C[playerid][63]);
						}
					case 64:
						if(!glob4597C[playerid][64])
						{
							function8334(playerid, function8F1B4(playerid, 6));
						}
						else
						{
							SetPlayerAmmo(playerid, 6, glob4597C[playerid][64]);
						}
					case 65:
						if(!glob4597C[playerid][65])
						{
							function8334(playerid, function8F1B4(playerid, 7));
						}
						else
						{
							SetPlayerAmmo(playerid, 7, glob4597C[playerid][65]);
						}
				}
				PlayerTextDrawColor(playerid, glob49ACC[playerid][16], 4294967295);
				PlayerTextDrawColor(playerid, glob49ACC[playerid][17], 4294967295);
				glob49ACC[playerid][16] = -1;
				glob49ACC[playerid][17] = -1;
				function96A30(playerid, 3);
			}
			else
			{
				function98144(playerid, 413412);
			}
			return 1;
		}
		if(arg1 == glob4FB88[playerid][9])
		{
			if(glob49ACC[playerid][10] == -1)
			{
				return 1;
			}
			function96A30(playerid, 1);
			return 1;
		}
		if(arg1 == glob4FB88[playerid][10])
		{
			if(!glob49ACC[playerid][13])
			{
				return 1;
			}
			function96A30(playerid, 2);
			return 1;
		}
		return 1;
	}
	if(glob4C050[playerid] == 1)
	{
		if(arg1 == glob51774[playerid])
		{
			function98AB4(playerid);
			CancelSelectTextDraw(playerid);
			return 1;
		}
		if(-1 != glob3ED24[playerid][3])
		{
			if(arg1 == glob51684[playerid])
			{
				if(glob3ED24[playerid][3] == 82)
				{
					glob3ED24[playerid][3] = 8;
					PlayerTextDrawSetString(playerid, glob514A4[playerid], 413488);
					PlayerTextDrawSetString(playerid, glob514F4[playerid], 413532);
					PlayerTextDrawSetString(playerid, glob51544[playerid], 413540);
					PlayerTextDrawSetString(playerid, glob51594[playerid], 413548);
					PlayerTextDrawSetString(playerid, glob515E4[playerid], 413556);
					PlayerTextDrawSetString(playerid, glob51634[playerid], 413564);
					PlayerTextDrawSetString(playerid, glob51684[playerid], 413572);
					PlayerTextDrawSetString(playerid, glob516D4[playerid], 413596);
					PlayerTextDrawSetString(playerid, glob51724[playerid], 413604);
					PlayerTextDrawSetString(playerid, glob51814[playerid], 413612);
					return 1;
				}
				glob3ED24[playerid][3] = -1;
				function98AB4(playerid);
				function983F0(playerid);
				function99040(playerid);
				return 1;
			}
		}
		if(glob3ED24[playerid][3] == -1)
		{
			if(arg1 == glob514A4[playerid])
			{
				glob3ED24[playerid][3] = 2;
				PlayerTextDrawSetString(playerid, glob514A4[playerid], 413620);
				PlayerTextDrawSetString(playerid, glob514F4[playerid], 413664);
				PlayerTextDrawSetString(playerid, glob51544[playerid], 413700);
				PlayerTextDrawSetString(playerid, glob51594[playerid], 413732);
				PlayerTextDrawSetString(playerid, glob515E4[playerid], 413752);
				PlayerTextDrawSetString(playerid, glob51634[playerid], 413808);
				PlayerTextDrawSetString(playerid, glob51684[playerid], 413860);
				PlayerTextDrawSetString(playerid, glob516D4[playerid], 413884);
				PlayerTextDrawSetString(playerid, glob51724[playerid], 413920);
				PlayerTextDrawSetString(playerid, glob51814[playerid], 413928);
				return 1;
			}
			if(arg1 == glob514F4[playerid])
			{
				glob3ED24[playerid][3] = 3;
				PlayerTextDrawSetString(playerid, glob514A4[playerid], 413948);
				PlayerTextDrawSetString(playerid, glob514F4[playerid], 414024);
				PlayerTextDrawSetString(playerid, glob51544[playerid], 414080);
				PlayerTextDrawSetString(playerid, glob51594[playerid], 414156);
				PlayerTextDrawSetString(playerid, glob515E4[playerid], 414224);
				PlayerTextDrawSetString(playerid, glob51634[playerid], 414296);
				PlayerTextDrawSetString(playerid, glob51684[playerid], 414376);
				PlayerTextDrawSetString(playerid, glob516D4[playerid], 414400);
				PlayerTextDrawSetString(playerid, glob51724[playerid], 414488);
				PlayerTextDrawSetString(playerid, glob51814[playerid], 414520);
				return 1;
			}
			if(arg1 == glob51544[playerid])
			{
				glob3ED24[playerid][3] = 4;
				function523E8(playerid);
				function98AB4(playerid);
				CancelSelectTextDraw(playerid);
				return 1;
			}
			if(arg1 == glob51594[playerid])
			{
				function53008(playerid);
				function98AB4(playerid);
				CancelSelectTextDraw(playerid);
				return 1;
			}
			if(arg1 == glob51684[playerid])
			{
				glob3ED24[playerid][3] = 8;
				PlayerTextDrawSetString(playerid, glob514A4[playerid], 414540);
				PlayerTextDrawSetString(playerid, glob514F4[playerid], 414584);
				PlayerTextDrawSetString(playerid, glob51544[playerid], 414592);
				PlayerTextDrawSetString(playerid, glob51594[playerid], 414600);
				PlayerTextDrawSetString(playerid, glob515E4[playerid], 414608);
				PlayerTextDrawSetString(playerid, glob51634[playerid], 414616);
				PlayerTextDrawSetString(playerid, glob51684[playerid], 414624);
				PlayerTextDrawSetString(playerid, glob516D4[playerid], 414648);
				PlayerTextDrawSetString(playerid, glob51724[playerid], 414656);
				PlayerTextDrawSetString(playerid, glob51814[playerid], 414664);
				return 1;
			}
			return 1;
		}
		if(glob3ED24[playerid][3] == 2)
		{
			if(arg1 == glob514A4[playerid])
			{
				function51768(playerid);
				function98AB4(playerid);
				CancelSelectTextDraw(playerid);
				return 1;
			}
			if(arg1 == glob514F4[playerid])
			{
				function51A88(playerid);
				function98AB4(playerid);
				CancelSelectTextDraw(playerid);
				return 1;
			}
			if(arg1 == glob51544[playerid])
			{
				function520C8(playerid);
				function98AB4(playerid);
				CancelSelectTextDraw(playerid);
				return 1;
			}
			if(arg1 == glob516D4[playerid])
			{
				function51DA8(playerid);
				function98AB4(playerid);
				CancelSelectTextDraw(playerid);
				return 1;
			}
		}
		if(glob3ED24[playerid][3] == 3)
		{
			if(arg1 == glob514A4[playerid])
			{
				function53328(playerid);
				function98AB4(playerid);
				CancelSelectTextDraw(playerid);
				return 1;
			}
			if(arg1 == glob51594[playerid])
			{
				function53664(playerid);
				function98AB4(playerid);
				CancelSelectTextDraw(playerid);
				return 1;
			}
			return 1;
		}
		if(glob3ED24[playerid][3] == 8)
		{
			if(arg1 == glob514A4[playerid])
			{
				glob3ED24[playerid][3] = 82;
				PlayerTextDrawSetString(playerid, glob514A4[playerid], 414672);
				PlayerTextDrawSetString(playerid, glob514F4[playerid], 414704);
				PlayerTextDrawSetString(playerid, glob51544[playerid], 414732);
				PlayerTextDrawSetString(playerid, glob51594[playerid], 414756);
				PlayerTextDrawSetString(playerid, glob515E4[playerid], 414788);
				PlayerTextDrawSetString(playerid, glob51634[playerid], 414828);
				PlayerTextDrawSetString(playerid, glob51684[playerid], 414860);
				PlayerTextDrawSetString(playerid, glob516D4[playerid], 414884);
				PlayerTextDrawSetString(playerid, glob51724[playerid], 414908);
				PlayerTextDrawSetString(playerid, glob51814[playerid], 414952);
				return 1;
			}
			return 1;
		}
		if(glob3ED24[playerid][3] == 82)
		{
			if(arg1 == glob514A4[playerid])
			{
				glob3ED24[playerid][2] = functionABA8(255, 0, 0, 255);
			}
			if(arg1 == glob514F4[playerid])
			{
				glob3ED24[playerid][2] = functionABA8(0, 0, 255, 255);
			}
			if(arg1 == glob51544[playerid])
			{
				glob3ED24[playerid][2] = functionABA8(0, 255, 0, 255);
			}
			if(arg1 == glob51594[playerid])
			{
				glob3ED24[playerid][2] = functionABA8(255, 255, 0, 255);
			}
			if(arg1 == glob515E4[playerid])
			{
				glob3ED24[playerid][2] = functionABA8(255, 178, 234, 255);
			}
			if(arg1 == glob51634[playerid])
			{
				glob3ED24[playerid][2] = functionABA8(255, 100, 0, 255);
			}
			if(arg1 == glob516D4[playerid])
			{
				glob3ED24[playerid][2] = functionABA8(42, 167, 255, 255);
			}
			if(arg1 == glob51724[playerid])
			{
				function31714(playerid, "dialog_gps_rgb_red", 1, 415068, 415140, 415844, 415872);
				return 1;
			}
			if(arg1 == glob51814[playerid])
			{
				glob3ED24[playerid][2] = functionABA8(196, 0, 196, 255);
			}
			glob3ED24[playerid][3] = 8;
			PlayerTextDrawSetString(playerid, glob514A4[playerid], 415896);
			PlayerTextDrawSetString(playerid, glob514F4[playerid], 415940);
			PlayerTextDrawSetString(playerid, glob51544[playerid], 415948);
			PlayerTextDrawSetString(playerid, glob51594[playerid], 415956);
			PlayerTextDrawSetString(playerid, glob515E4[playerid], 415964);
			PlayerTextDrawSetString(playerid, glob51634[playerid], 415972);
			PlayerTextDrawSetString(playerid, glob51684[playerid], 415980);
			PlayerTextDrawSetString(playerid, glob516D4[playerid], 416004);
			PlayerTextDrawSetString(playerid, glob51724[playerid], 416012);
			PlayerTextDrawSetString(playerid, glob51814[playerid], 416020);
			return 1;
		}
	}
	if(glob4C050[playerid] == 2)
	{
		if(arg1 == glob51774[playerid])
		{
			function98AB4(playerid);
			CancelSelectTextDraw(playerid);
			return 1;
		}
		if(arg1 == glob514A4[playerid])
		{
			if((function91A0(playerid, 64.134, -229.7443, 10.0) || function91A0(playerid, 2237.4167, 27.6812, 10.0) || function91A0(playerid, 656.012, -564.694, 10.0)) && function8680(playerid) && !glob4A930[playerid][6])
			{
				function98AB4(playerid);
				CancelSelectTextDraw(playerid);
				glob4D33C[playerid] = GetPlayerVehicleID(playerid);
				function91F74(playerid);
				glob4F744[glob4D33C[playerid]] = SetTimerEx("degaline_use", 1200, true, "i", playerid);
				glob4A930[playerid][6] = 1;
				return 1;
			}
		}
		if(arg1 == glob51594[playerid])
		{
			function98AB4(playerid);
			CancelSelectTextDraw(playerid);
			new var0[124];
			strdel(glob4D42C, 0, 2050);
			strcat(glob4D42C, "{FFFF00}Pavadinimas\t\t\tKiekis\tSvoris\tKaina\n__________________________________________\n", 2050);
			if(function54958(playerid))
			{
				format(var0, 124, "{00FF00}Tu��ia\t\t\t\t{FFFFFF}-\t-\t-\n");
				strcat(glob4D42C, var0, 2050);
			}
			else
			{
				for(new var1 = 0; 102 != var1; var1++)
				{
					if(!function54A90(playerid, var1))
					{
					}
					else
					{
					}
				}
				format(var0, 124, "{00FF00}%s\t{FFFFFF}%i\t%i\t%i\n", glob44490[var1][0], function54A90(playerid, var1), function54A90(playerid, var1), function54B70(playerid, var1));
				strcat(glob4D42C, var0, 2050);
			}
			function31714(playerid, "dialog_kuprine", 0, 416740, 316460, 416772, 416808);
			return 1;
		}
		return 1;
	}
	if(arg1 == glob51DCC[playerid])
	{
		CancelSelectTextDraw(playerid);
		function18CB0(playerid);
		function932D8(playerid);
		function93738(playerid);
		return 1;
	}
	if(arg1 == glob51E1C[playerid])
	{
		CancelSelectTextDraw(playerid);
		function18CB0(playerid);
		function932D8(playerid);
		function5407C(playerid);
		return 1;
	}
	return 1;
}

public OnPlayerClickTextDraw(playerid, arg1)
{
	if(function9D9F0(playerid))
	{
		return 1;
	}
	if(glob4C050[playerid] == 4)
	{
		function98144(playerid);
		if(arg1 == glob51B68)
		{
			function998D4(playerid);
		}
		if(arg1 == glob51B64)
		{
			function9B804(playerid);
		}
		if(arg1 == glob51B6C)
		{
			function9D848(playerid);
		}
		if(arg1 == glob51B70)
		{
			function9CFA4(playerid);
		}
		return 1;
	}
	if(arg1 == glob51B38)
	{
		functionBBE0(playerid);
		CancelSelectTextDraw(playerid);
		strdel(glob4D42C, 0, 2050);
		strcat(glob4D42C, "{FFAE00}_____________________________________Serveris_____________________________________\n{96FF00}", 2050);
		strcat(glob4D42C, "{89B0FF}�� server� kuriame tok�, kokiame ir patys nor�tum�me �aisti. Visa informacija,\nvisas �aidimo stilius yra perteikti kaip galima kokybi�kiau ir papras�iau.\n", 2050);
		strcat(glob4D42C, "�aidimo esm� paprasta. J�s patys kuriate miest� istorij�, kaupiate kult�ros\nta�kus, u� kuriuos miesto vald�ia stato naujus pastatus, tobulina esamus. \n", 2050);
		strcat(glob4D42C, "Pajam� �altinis yra ne vienas, ta�iau efektyviausias, �inoma, yra darbas.\nDarb� galima suvokti labai skirtingai. I� esm�s pelningiausia yra kurti savo �mon�,\n", 2050);
		strcat(glob4D42C, "�darbinti darbuotojus, ir pardavin�ti savo paslaugas. Ta�iau � savo versl�\ntenka labai daug investuoti, ir laiko ir pinig�, tod�l prie� imantis ka�ko didelio, teks\n", 2050);
		strcat(glob4D42C, "ir pa�iam to pasiekti. Galite dirbti, galite u�siimin�ti nelegalia\nveikla, galite save kelti � kandidatus miesto vald�ioje, galite bendradarbiauti su kitais\n", 2050);
		strcat(glob4D42C, "miestais kurdami bendrus projektus, kuriems prireiks bendr� pastang� tam pasiekti.\nGalite b�ti pamaldus tikintysis arba kelet� miest� valdan�ios mafijos krik�tat�vis\n", 2050);
		strcat(glob4D42C, "viskas tik j�s� rankose. Jeigu turite �domi� �d�j�, mielai kvie�iame jomis pasidalinti.\n�aidim� siekiame padaryti kuo malonesn�, tad istorij� kurkite su atsakomybe :)", 2050);
		function31714(playerid, "dialog_apie", 0, 421816, 316460, 421912, 421940);
		return 1;
	}
	if(arg1 == glob51B3C)
	{
		functionBBE0(playerid);
		CancelSelectTextDraw(playerid);
		strdel(glob4D42C, 0, 2050);
		strcat(glob4D42C, "{FFAE00}_____________________________________D.U.K_____________________________________\n{96FF00}", 2050);
		strcat(glob4D42C, "{89B0FF}Prie daugiausiai u�duodam� klausim� ir ra�ysime daugiausiai u�duodamus \nklausimus, o ne klausimus, kurie kaip kitiems atrodo 'Tur�t� b�ti daugiausiai u�duodami'.\n\n", 2050);
		strcat(glob4D42C, "{89B0FF}Klausimas: k� rei�kia tas tl;dr po registracijos i��okusiame lange?\n{80FF2B}Atsakymas: Angli�kas trumpinys sakinio 'Too Long; Didnt Read', kuris rei�kia 'Per ilgas, neskai�iau'.\n\n", 2050);
		strcat(glob4D42C, "{89B0FF}Klausimas: ar galiu prisid�ti prie projekto, labai gra�iai mapinu ir gerai scriptinu.\n{80FF2B}Atsakymas: Kol kas mums per akis u�tenka 3 �moni�, jeigu mums j�s� prireiks, susirasime patys ;)\n\n", 2050);
		strcat(glob4D42C, "{89B0FF}Klausimas: kur man rasti kur kas randasi, nei minimape icon� yra, nei /gps neveikia.\n{80FF2B}Atsakymas: Minimape yra viena icona - spawn'as. Jame yra �em�lapis, paspausk prie jo ENTER.\n\n", 2050);
		strcat(glob4D42C, "{89B0FF}Klausimas: kod�l negaliu i�va�iuoti i� miesteli� teritorijos?\n{80FF2B}Atsakymas: Nes pagal vis� �d�j� tu randiesi vidur� lauk�, kur visk� kuri pats, o 3 didmies�iai �alia, visai nesidernt�.\n", 2050);
		strcat(glob4D42C, "Reikia LV gara��, o gal atsibodo tie patys miesteliai? Kaupkit miestui kult�ros ta�kus, \nmok�kit mokes�ius, o tada pra�ykit vald�ios. Ir j� rinkit atsakingai, nes nuo jos daug kas priklauso.\n\n", 2050);
		strcat(glob4D42C, "{89B0FF}Klausimas: kaip nusipirkti admin�, noriu b�ti adminas, u�baninsiu visus �yterius!\n{80FF2B}Atsakymas: I� esm�s d�l to ir n�ra admino. Pakolkas anti �ytas gan neblogai susitvarko ir vienas.", 2050);
		function31714(playerid, "dialog_apie", 0, 427788, 316460, 427884, 427912);
		return 1;
	}
	if(arg1 == glob51B40)
	{
		functionBBE0(playerid);
		CancelSelectTextDraw(playerid);
		strdel(glob4D42C, 0, 2050);
		strcat(glob4D42C, "{FFAE00}_____________________________________Komandos_____________________________________\n{96FF00}", 2050);
		strcat(glob4D42C, "{89B0FF}/fix - sutvarko �inomus bugus.\n", 2050);
		strcat(glob4D42C, "/apie - Visa �aidimo pagrindin� informacija (kaip jau turb�t pasteb�jai)\n/mech - Mechanik� vidus\n/pause\n/unpause\n/spawn - nekelia � spawn�\n/zvejoti", 2050);
		strcat(glob4D42C, "/carturgus - nukelia � sen� ma�in� turg�.\n/carturgusv - Nuteleportuoja � ma�in� turgaus interjer� (a little bug will appear).\n", 2050);
		strcat(glob4D42C, "/car - spawnina Elegy & Infernus \n/clearcar - Panaikina asmenin� ma�in�.\n/money suma - Pinigai. Pvz.: /money 123456", 2050);
		function31714(playerid, "dialog_apie", 0, 430120, 316460, 430216, 430244);
		return 1;
	}
	if(arg1 == glob51B44)
	{
		functionBBE0(playerid);
		CancelSelectTextDraw(playerid);
		strdel(glob4D42C, 0, 2050);
		strcat(glob4D42C, "{FFAE00}_____________________________________Pasiekimai_____________________________________\n{96FF00}", 2050);
		strcat(glob4D42C, "{89B0FF}�� server� kuriame tok�, kokiame ir patys nor�tum�me �aisti. Visa informacija,\nvisas �aidimo stilius yra perteikti kaip galima kokybi�kiau ir papras�iau.\n", 2050);
		strcat(glob4D42C, "�aidimo esm� paprasta. J�s patys kuriate miest� istorij�, kaupiate kult�ros\nta�kus, u� kuriuos miesto vald�ia stato naujus pastatus, tobulina esamus. \n", 2050);
		strcat(glob4D42C, "Pajam� �altinis yra ne vienas, ta�iau efektyviausias, �inoma, yra darbas.\nDarb� galima suvokti labai skirtingai. I� esm�s pelningiausia yra kurti savo �mon�,\n", 2050);
		strcat(glob4D42C, "�darbinti darbuotojus, ir pardavin�ti savo paslaugas. Ta�iau � savo versl�\ntenka labai daug investuoti, ir laiko ir pinig�, tod�l prie� imantis ka�ko didelio, teks\n", 2050);
		strcat(glob4D42C, "ir pa�iam pasiekti tok� lyg�. Galite dirbti, galite u�siimin�ti nelegalia\nveikla, galite save kelti � kandidatus � miesto vald�i�, galite bendradarbiauti su kitais\n", 2050);
		strcat(glob4D42C, "miestais kurdami bendrus projektus, kuriems prireiks bendr� pastang� tam pasiekti.\nGalite b�ti pamaldus tikintysis arba kelet� miest� valdan�ios mafijos krik�tat�vis\n", 2050);
		strcat(glob4D42C, "viskas tik j�s� rankose. Jeigu turite �domi� �d�j�, mielai kvie�iame jomis pasidalinti.\n�aidim� siekiame padaryti kuo malonesn�, tad istorij� kurkite su atsakomybe :)", 2050);
		function31714(playerid, "dialog_apie", 0, 435288, 316460, 435384, 435412);
		return 1;
	}
	if(arg1 == glob51B48)
	{
		functionBBE0(playerid);
		CancelSelectTextDraw(playerid);
		strdel(glob4D42C, 0, 2050);
		strcat(glob4D42C, "{FFAE00}_____________________________________V.I.P._____________________________________\n{96FF00}", 2050);
		strcat(glob4D42C, "{89B0FF}Mes nesiekiame padaryti �aidimo stiliaus pana�aus � Pay To Win, tod�l\nvip'ams suteikiame tik asmeni�kai �aid�jui naudingas paslaugas, ne�takojant kit�\n", 2050);
		strcat(glob4D42C, "�aid�j� �aidimo. B�damas vip'u priklausomai nuo vip lygio gauni puiki� privalum�!\n\n", 2050);
		strcat(glob4D42C, "vip I:   30% ma�esn�s kainos, 2xp/min, `vip I` ma�inos, draug� s�ra�as prapl�stas \niki 20 draug�, vip nicko spalva.\n\n", 2050);
		strcat(glob4D42C, "vip II:  30% ma�esn�s kainos, 3xp/min, `vip I` ir `vip II` ma�inos, vip namai, \nvip skin'ai, draug� s�ra�as prapl�stas iki 30 draug�, vip nicko spalva.\n\n", 2050);
		strcat(glob4D42C, "vip III: 30% ma�esn�s kainos, 5xp/min, `vip I` ir `vip II` ir `vip III` ma�inos, \nvip namai, vip skin'ai, draug� s�ra�as prapl�stas iki 50 draug�, \nvis� ginkl� �ala 50% didesn�, galimyb� ra�yti � Global chat'�, vip nicko spalva.\n\n", 2050);
		strcat(glob4D42C, "\nKainos:\nvip I:   2lt/savaitei. 6lt/m�n.\nvip II:  4lt/savaitei. 12lt/m�n.\nvip III: 8lt/savaitei. 24lt/m�n.\n", 2050);
		function31714(playerid, "dialog_apie", 0, 439308, 316460, 439404, 439432);
		return 1;
	}
	if(arg1 == glob51B4C)
	{
		functionBBE0(playerid);
		CancelSelectTextDraw(playerid);
		strdel(glob4D42C, 0, 2050);
		strcat(glob4D42C, "{FFAE00}_____________________________________Mygtukai_____________________________________\n{96FF00}", 2050);
		strcat(glob4D42C, "{89B0FF}Pagrindinis mygtukas - SPACE. Su juo pilate kur�, atidarin�jat vartus, \nbendraujat su npc, naudojates objektais ir daug ko kito.\n", 2050);
		strcat(glob4D42C, "E - Ma�inos u�vedimas, u�gesinimas. \nQ - I�pl�stinis ma�inos valdymas.\nN - Nustatymai.\nY - Visa kita.", 2050);
		function31714(playerid, "dialog_apie", 0, 440876, 316460, 440972, 441000);
		return 1;
	}
	if(arg1 == glob51B50)
	{
		functionBBE0(playerid);
		CancelSelectTextDraw(playerid);
		strdel(glob4D42C, 0, 2050);
		strcat(glob4D42C, "{FFAE00}_______________________________Naujienos________________________________\n{96FF00}", 2050);
		strcat(glob4D42C, "{89B0FF}�� server� kuriame tok�, kokiame ir patys nor�tum�me �aisti. Visa informacija,\nvisas �aidimo stilius yra perteikti kaip galima kokybi�kiau ir papras�iau.\n", 2050);
		strcat(glob4D42C, "�aidimo esm� paprasta. J�s patys kuriate miest� istorij�, kaupiate kult�ros\nta�kus, u� kuriuos miesto vald�ia stato naujus pastatus, tobulina esamus. \n", 2050);
		strcat(glob4D42C, "Pajam� �altinis yra ne vienas, ta�iau efektyviausias, �inoma, yra darbas.\nDarb� galima suvokti labai skirtingai. I� esm�s pelningiausia yra kurti savo �mon�,\n", 2050);
		strcat(glob4D42C, "�darbinti darbuotojus, ir pardavin�ti savo paslaugas. Ta�iau � savo versl�\ntenka labai daug investuoti, ir laiko ir pinig�, tod�l prie� imantis ka�ko didelio, teks\n", 2050);
		strcat(glob4D42C, "ir pa�iam pasiekti tok� lyg�. Galite dirbti, galite u�siimin�ti nelegalia\nveikla, galite save kelti � kandidatus � miesto vald�i�, galite bendradarbiauti su kitais\n", 2050);
		strcat(glob4D42C, "miestais kurdami bendrus projektus, kuriems prireiks bendr� pastang� tam pasiekti.\nGalite b�ti pamaldus tikintysis arba kelet� miest� valdan�ios mafijos krik�tat�vis\n", 2050);
		strcat(glob4D42C, "viskas tik j�s� rankose. Jeigu turite �domi� �d�j�, mielai kvie�iame jomis pasidalinti.\n�aidim� siekiame padaryti kuo malonesn�, tad istorij� kurkite su atsakomybe :)", 2050);
		function31714(playerid, "dialog_apie", 0, 445996, 316460, 446092, 446120);
		return 1;
	}
	if(arg1 == glob51B54)
	{
		functionBBE0(playerid);
		CancelSelectTextDraw(playerid);
		strdel(glob4D42C, 0, 2050);
		strcat(glob4D42C, "{FFAE00}_____________________________________TOP_____________________________________\n{96FF00}", 2050);
		strcat(glob4D42C, "{89B0FF}�� server� kuriame tok�, kokiame ir patys nor�tum�me �aisti. Visa informacija,\nvisas �aidimo stilius yra perteikti kaip galima kokybi�kiau ir papras�iau.\n", 2050);
		strcat(glob4D42C, "�aidimo esm� paprasta. J�s patys kuriate miest� istorij�, kaupiate kult�ros\nta�kus, u� kuriuos miesto vald�ia stato naujus pastatus, tobulina esamus. \n", 2050);
		strcat(glob4D42C, "Pajam� �altinis yra ne vienas, ta�iau efektyviausias, �inoma, yra darbas.\nDarb� galima suvokti labai skirtingai. I� esm�s pelningiausia yra kurti savo �mon�,\n", 2050);
		strcat(glob4D42C, "�darbinti darbuotojus, ir pardavin�ti savo paslaugas. Ta�iau � savo versl�\ntenka labai daug investuoti, ir laiko ir pinig�, tod�l prie� imantis ka�ko didelio, teks\n", 2050);
		strcat(glob4D42C, "ir pa�iam pasiekti tok� lyg�. Galite dirbti, galite u�siimin�ti nelegalia\nveikla, galite save kelti � kandidatus � miesto vald�i�, galite bendradarbiauti su kitais\n", 2050);
		strcat(glob4D42C, "miestais kurdami bendrus projektus, kuriems prireiks bendr� pastang� tam pasiekti.\nGalite b�ti pamaldus tikintysis arba kelet� miest� valdan�ios mafijos krik�tat�vis\n", 2050);
		strcat(glob4D42C, "viskas tik j�s� rankose. Jeigu turite �domi� �d�j�, mielai kvie�iame jomis pasidalinti.\n�aidim� siekiame padaryti kuo malonesn�, tad istorij� kurkite su atsakomybe :)", 2050);
		function31714(playerid, "dialog_apie", 0, 451136, 316460, 451232, 451260);
		return 1;
	}
	if(arg1 == glob51B58)
	{
		functionBBE0(playerid);
		CancelSelectTextDraw(playerid);
		strdel(glob4D42C, 0, 2050);
		strcat(glob4D42C, "{FFAE00}_____________________________________Teksto spalvos_____________________________________\n{96FF00}", 2050);
		strcat(glob4D42C, "{89B0FF}�� server� kuriame tok�, kokiame ir patys nor�tum�me �aisti. Visa informacija,\nvisas �aidimo stilius yra perteikti kaip galima kokybi�kiau ir papras�iau.\n", 2050);
		strcat(glob4D42C, "�aidimo esm� paprasta. J�s patys kuriate miest� istorij�, kaupiate kult�ros\nta�kus, u� kuriuos miesto vald�ia stato naujus pastatus, tobulina esamus. \n", 2050);
		strcat(glob4D42C, "Pajam� �altinis yra ne vienas, ta�iau efektyviausias, �inoma, yra darbas.\nDarb� galima suvokti labai skirtingai. I� esm�s pelningiausia yra kurti savo �mon�,\n", 2050);
		strcat(glob4D42C, "�darbinti darbuotojus, ir pardavin�ti savo paslaugas. Ta�iau � savo versl�\ntenka labai daug investuoti, ir laiko ir pinig�, tod�l prie� imantis ka�ko didelio, teks\n", 2050);
		strcat(glob4D42C, "ir pa�iam pasiekti tok� lyg�. Galite dirbti, galite u�siimin�ti nelegalia\nveikla, galite save kelti � kandidatus � miesto vald�i�, galite bendradarbiauti su kitais\n", 2050);
		strcat(glob4D42C, "miestais kurdami bendrus projektus, kuriems prireiks bendr� pastang� tam pasiekti.\nGalite b�ti pamaldus tikintysis arba kelet� miest� valdan�ios mafijos krik�tat�vis\n", 2050);
		strcat(glob4D42C, "viskas tik j�s� rankose. Jeigu turite �domi� �d�j�, mielai kvie�iame jomis pasidalinti.\n�aidim� siekiame padaryti kuo malonesn�, tad istorij� kurkite su atsakomybe :)", 2050);
		function31714(playerid, "dialog_apie", 0, 456320, 316460, 456416, 456444);
		return 1;
	}
	if(arg1 == glob51B5C)
	{
		functionBBE0(playerid);
		CancelSelectTextDraw(playerid);
		return 1;
	}
	return 1;
}

public OnUnoccupiedVehicleUpdate()
{
	return 1;
}

public OnVehicleMod()
{
	return 1;
}

public OnVehiclePaintjob()
{
	return 1;
}

public OnVehicleRespray()
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange()
{
	return 1;
}

public OnPlayerEnterDynamicArea(arg0, arg1)
{
	if(arg1 == glob4FA64[0])
	{
		function44088(arg0, glob443CC[0]);
	}
	else if(arg1 == glob4FA64[1])
	{
		function44088(arg0, glob443CC[1]);
	}
	return 1;
}

public OnPlayerLeaveDynamicArea(arg0)
{
	function44124(arg0);
	return 1;
}

function44088(arg0, arg1)
{
	PlayerTextDrawSetString(arg0, glob4FAC0[arg0], arg1);
	PlayerTextDrawShow(arg0, glob4FAC0[arg0]);
	return 0;
}

function44124(arg0)
{
	PlayerTextDrawHide(arg0, glob4FAC0[arg0]);
	return 0;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(131072 != newkeys & 131072 && oldkeys & 131072 == 131072)
	{
		SelectTextDraw(playerid, 3355443455);
		return 1;
	}
	if(1 != newkeys & 1 && oldkeys & 1 == 1)
	{
		if(function9DADC(playerid))
		{
			return 1;
		}
		if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 525)
		{
			new var0 = GetPlayerVehicleID(playerid), var1 = function8AEC(playerid, var0), Float:var2[2], Float:var3[2], Float:var4[2], Float:var5[2];
			function54754(var0, var2, var3, var4, var5, 4.0);
			SetPlayerCheckpoint(playerid, var2[0], var3[0], var4[0], 1.0);
			function54584(var1, var2, var3, var4, var5, 4.0);
			if(IsTrailerAttachedToVehicle(var0))
			{
				DetachTrailerFromVehicle(var0);
			}
			if(floatabs(function8718(var2[0], var3[0], var4[0], var2[1], var3[1], var4[1])) < 5 && !IsTrailerAttachedToVehicle(var0))
			{
				AttachTrailerToVehicle(var1, var0);
			}
			printf("floatabs = %f || veh = %i || closestveh = %i", floatabs(function8718(var2[0], var3[0], var4[0], var2[1], var3[1], var4[1])), var0, var1);
			return 1;
		}
		if(IsPlayerInAnyDynamicArea(playerid))
		{
			if(IsPlayerInDynamicArea(playerid, glob4FA64[1]))
			{
				new var0 = GetPlayerVehicleID(playerid);
				SetPlayerVirtualWorld(playerid, playerid + 1337);
				SetVehicleVirtualWorld(var0, playerid + 1337);
				function64FC(playerid, 1121252409, 3272655110, 2365.8469 + 1);
				Streamer_Update(playerid);
				SetVehicleZAngle(var0, 89.958);
				function65A4(var0, 1120962098, 3272993302, 1158936522);
				SetPlayerCameraPos(playerid, 99.76, -152.3801, 2368.9899);
				SetPlayerCameraLookAt(playerid, 103.5199, -149.5701, 2367.28, 2);
				return function98144(playerid, 456660);
			}
			return 1;
		}
		return 1;
	}
	if(8 != newkeys & 8 && oldkeys & 8 == 8)
	{
		if(glob4A930[playerid][9])
		{
			if(glob4AD90[playerid][0] >= 100)
			{
				KillTimer(glob4F974[playerid][1]);
				glob4A930[playerid][9] = 0;
				function93308(playerid);
				function30C00(playerid, glob479FC[playerid]);
				new var0 = random(15) + 67;
				function8E508(playerid, var0, 1);
				return 1;
			}
			glob4AD90[playerid][0] = glob4AD90[playerid][0] + 5;
			function30E38(playerid, glob479FC[playerid], glob4AD90[playerid][0]);
			function309C8(playerid, glob479FC[playerid]);
			return 1;
		}
		if(glob4A930[playerid][8])
		{
			KillTimer(glob4F974[playerid][0]);
			glob4A930[playerid][8] = 0;
			function93308(playerid);
			function98144(playerid, 456768);
			return 1;
		}
		return 1;
	}
	if(newkeys & 4 == 4)
	{
		if(0 <= glob637EC[playerid])
		{
			function98144(playerid, 456828);
			glob4F924[playerid] = SetTimerEx("dmgnpc", 255, true, "i", playerid);
			return 1;
		}
	}
	if(4 != newkeys & 4 && oldkeys & 4 == 4)
	{
		if(0 < glob4F924[playerid])
		{
			KillTimer(glob4F924[playerid]);
			glob4F924[playerid] = 0;
			return 1;
		}
		if(glob4A33C[playerid][7] == 1)
		{
			if(function91A0(playerid, 160.1799, -178.59, 10.0) && !GetPlayerVirtualWorld(playerid) && (!GetPlayerWeapon(playerid) || 1))
			{
				if(!function54A1C(playerid, 7))
				{
					function98144(playerid, 456908);
					return 1;
				}
				if(!glob4F438)
				{
					MoveDynamicObject(glob4F434, 1126182420, 3274872586, 3231711232, 1073741824, 3296329728, 3296329728, 3296329728);
					glob4F438 = 1;
					function98144(playerid, 456980);
					return 1;
				}
				if(glob4F438)
				{
					MoveDynamicObject(glob4F434, 1126182420, 3274872586, 1073238508, 1073741824, 3296329728, 3296329728, 3296329728);
					glob4F438 = 0;
					function98144(playerid, 457048);
					return 1;
				}
			}
		}
		if(glob4A930[playerid][6] == 1)
		{
			new var0[64];
			glob4A930[playerid][6] = 0;
			KillTimer(glob4F744[glob4D33C[playerid]]);
			glob4D33C[playerid] = 0;
			function932D8(playerid);
			PlayerTextDrawHide(playerid, glob51864[playerid]);
			PlayerTextDrawHide(playerid, glob518B4[playerid]);
			PlayerTextDrawHide(playerid, glob51904[playerid]);
			PlayerTextDrawHide(playerid, glob51954[playerid]);
			PlayerTextDrawHide(playerid, glob519A4[playerid]);
			PlayerTextDrawHide(playerid, glob519F4[playerid]);
			PlayerTextDrawHide(playerid, glob51A44[playerid]);
			PlayerTextDrawHide(playerid, glob51A94[playerid]);
			PlayerTextDrawHide(playerid, glob51AE4[playerid]);
			format(var0, 64, "Baigei pilti degalus. Kaina : ~g~%i", glob4D15C[playerid][0]);
			function98144(playerid, var0);
			glob4D15C[playerid][0] = 0;
			glob4CFCC[playerid][0] = 0;
			return 1;
		}
		return 1;
	}
	if(16 != newkeys & 16 && oldkeys & 16 == 16)
	{
		if(glob4A930[playerid][6] == 1)
		{
			new var0[64];
			glob4A930[playerid][6] = 0;
			KillTimer(glob4F744[glob4D33C[playerid]]);
			glob4D33C[playerid] = 0;
			function932D8(playerid);
			PlayerTextDrawHide(playerid, glob51864[playerid]);
			PlayerTextDrawHide(playerid, glob518B4[playerid]);
			PlayerTextDrawHide(playerid, glob51904[playerid]);
			PlayerTextDrawHide(playerid, glob51954[playerid]);
			PlayerTextDrawHide(playerid, glob519A4[playerid]);
			PlayerTextDrawHide(playerid, glob519F4[playerid]);
			PlayerTextDrawHide(playerid, glob51A44[playerid]);
			PlayerTextDrawHide(playerid, glob51A94[playerid]);
			PlayerTextDrawHide(playerid, glob51AE4[playerid]);
			format(var0, 64, "Baigei pilti degalus. Kaina : ~g~%i", glob4D15C[playerid][0]);
			function98144(playerid, var0);
			glob4D15C[playerid][0] = 0;
			glob4CFCC[playerid][0] = 0;
			return 1;
		}
		return 1;
	}
	return 1;
}

public dmgnpc(arg0)
{
	new var0 = GetPlayerAnimationIndex(arg0);
	function98144(arg0);
	if(var0 >= 1160 && var0 <= 1167)
	{
		function98144(arg0, 457400);
		glob637C4[glob637EC[arg0]] = glob637C4[glob637EC[arg0]] - 5;
		function98144(arg0);
		if(0 >= glob637C4[glob637EC[arg0]])
		{
			Kick(glob637EC[arg0]);
		}
	}
	return 1;
}

public OnRconLoginAttempt()
{
	return 1;
}

public OnPlayerUpdate(arg0)
{
	glob4A8E0[arg0] = 0;
	return 1;
}

public OnPlayerStreamIn(playerid)
{
	if(glob4A930[playerid][4])
	{
		ApplyAnimation(playerid, "CRACK", "crckidle2", 1.0, 0, 0, 0, 1, 0, 1);
	}
	return 1;
}

public OnPlayerStreamOut()
{
	return 1;
}

public OnVehicleStreamIn(arg0, playerid)
{
	for(new var0 = 100; 100 != var0 = glob4C230[0][var0]; )
	{
		if(arg0 == var0)
		{
			if(glob4B510[arg0][1])
			{
				if(!function54A1C(playerid, 3))
				{
					SetVehicleParamsForPlayer(arg0, playerid, false, true);
				}
				else
				{
					SetVehicleParamsForPlayer(arg0, playerid, false, false);
				}
			}
			else
			{
				SetVehicleParamsForPlayer(arg0, playerid, false, false);
			}
			return 1;
		}
	}
	for(new var0 = 100; 100 != var0 = glob4C230[1][var0]; )
	{
		if(arg0 == var0)
		{
			if(glob4B510[arg0][1])
			{
				if(!function54A1C(playerid, 98))
				{
					SetVehicleParamsForPlayer(arg0, playerid, false, true);
				}
				else
				{
					SetVehicleParamsForPlayer(arg0, playerid, false, false);
				}
			}
			else
			{
				SetVehicleParamsForPlayer(arg0, playerid, false, false);
			}
			return 1;
		}
	}
	for(new var0 = 100; 100 != var0 = glob4C230[2][var0]; )
	{
		if(arg0 == var0)
		{
			if(glob4B510[arg0][1])
			{
				if(!function54A1C(playerid, 99))
				{
					SetVehicleParamsForPlayer(arg0, playerid, false, true);
				}
				else
				{
					SetVehicleParamsForPlayer(arg0, playerid, false, false);
				}
			}
			else
			{
				SetVehicleParamsForPlayer(arg0, playerid, false, false);
			}
			return 1;
		}
	}
	for(new var0 = 100; 100 != var0 = glob4C230[3][var0]; )
	{
		if(arg0 == var0)
		{
			if(glob4B510[arg0][1])
			{
				if(!function54A1C(playerid, 100))
				{
					SetVehicleParamsForPlayer(arg0, playerid, false, true);
				}
				else
				{
					SetVehicleParamsForPlayer(arg0, playerid, false, false);
				}
			}
			else
			{
				SetVehicleParamsForPlayer(arg0, playerid, false, false);
			}
			return 1;
		}
	}
	for(new var0 = 100; 100 != var0 = glob4C230[4][var0]; )
	{
		if(arg0 == var0)
		{
			if(glob4B510[arg0][1])
			{
				if(!function54A1C(playerid, 101))
				{
					SetVehicleParamsForPlayer(arg0, playerid, false, true);
				}
				else
				{
					SetVehicleParamsForPlayer(arg0, playerid, false, false);
				}
			}
			else
			{
				SetVehicleParamsForPlayer(arg0, playerid, false, false);
			}
			return 1;
		}
	}
	if(glob4B510[arg0][1])
	{
		SetVehicleParamsForPlayer(arg0, playerid, false, true);
	}
	return 1;
}

public OnVehicleStreamOut()
{
	return 1;
}

public Float:GPS_WhenRouteIsCalculated(playerid, arg1, arg2)
{
	if(playerid >= 100 && arg2 > 1)
	{
		glob6FB08[playerid - 100]--;
		function515F8(playerid - 100);
		new Float:var0 = 0.0, Float:var1 = 0.0, Float:var2 = 0.0;
		GetPlayerPos(playerid - 100, var0, var1, var2);
		new var3 = 0;
		if(arg2 < 50)
		{
			var3 = arg2;
		}
		else
		{
			var3 = 50;
		}
		for(new var4 = 0; var4 < var3; var4++)
		{
			new Float:var5 = 0.0, Float:var6 = 0.0, var7 = 0;
			GetNodePos(arg1[var4], var5, var6, var7);
			function50FA8(playerid - 100, var0, var1, var5, var6, glob3ED24[playerid - 100][2]);
			var0 = var5;
			var1 = var6;
		}
	}
	return 0.0;
}

public OnPlayerClosestNodeIDChange(playerid, arg1, arg2)
{
	if(glob3ED24[playerid][1] == -1)
	{
		return 1;
	}
	if(arg2 == glob3ED24[playerid][1])
	{
		function98144(playerid, 457564);
		function389A4(playerid);
		return 1;
	}
	if(arg1 > 0 && glob6FB58 == 1)
	{
		CalculatePath(arg2, glob3ED24[playerid][1], playerid + 100);
		glob6FB58 = 0;
		return 1;
	}
	glob6FB58 = 1;
	return 1;
}

public cmd_soc_aim(arg0, arg1)
{
	new var0 = strval(arg1);
	if(-1 != var0)
	{
		if(IsPlayerNPC(var0))
		{
			function98144(arg0, 457672);
			glob637EC[arg0] = var0;
		}
		else
		{
			function98144(arg0, 457736);
			glob637EC[arg0] = -1;
		}
	}
	else
	{
		glob637EC[arg0] = -1;
	}
	return 1;
}

public cmd_add_bots(arg0, arg1)
{
	new var0[18];
	for(new var1 = 0; strval(arg1) > var1; var1++)
	{
		format(var0, 18, "bot-%i", random(1000) + 1000);
		ConnectNPC(var0, 457816);
	}
	return 1;
}

public cmd_cid(playerid)
{
	function98144(playerid);
	return 1;
}

public cmd_stars(playerid, arg1)
{
	new var0[24], var1 = 0, var2 = 0, Float:var3 = 0.0, Float:var4 = 0.0, Float:var5 = 0.0;
	sscanf(arg1, 457848, var0, var1);
	var2 = function9DCB4(var0, 1);
	GetPlayerPos(var2, var3, var4, var5);
	if(functionA868(playerid, 10.0, 10.0, var3, var4, var5))
	{
		if(var1 < 1)
		{
			return 1;
		}
		if(var1 + glob4A33C[var2][14] > 150)
		{
			glob4A33C[var2][14] = 150;
			function8FFD4(var2);
			return 1;
		}
		glob4A33C[var2][14] = var1 + glob4A33C[var2][14];
		function8FFD4(var2);
		return 1;
	}
	function98144(playerid, 457876);
	return 1;
}

public cmd_surakinti(playerid)
{
	new Float:var0 = 0.0, Float:var1 = 0.0, Float:var2 = 0.0;
	GetPlayerPos(playerid, var0, var1, var2);
	for(new var3 = 20; 20 != var3 = glob31D0[var3]; )
	{
		if(functionA868(var3, 10.0, 10.0, var0, var1, var2))
		{
			function9302C(var3);
			SetTimerEx("tpct", 5000, false, "i", var3);
			return 1;
		}
	}
	return 1;
}

public cmd_zvejoti(playerid)
{
	for(new var0 = 0; var0 < 18; var0++)
	{
		if(function91A0(playerid, glob4F43C[var0][0], glob4F43C[var0][1], 30.0))
		{
			if((GetPlayerAnimationIndex(playerid) >= 1538 && GetPlayerAnimationIndex(playerid) <= 1544))
			{
				return function98144(playerid, 457996);
			}
			if(!glob4597C[playerid][8])
			{
				return function98144(playerid, 458096);
			}
			if(!glob47A4C[playerid][8])
			{
				if(function8570(playerid))
				{
					return function98144(playerid, 458204);
				}
				SetPlayerAttachedObject(playerid, 9, 18632, 6, 0, 0, 0, 1127481344, 0, 0, 1065353216, 1065353216, 1065353216, 0, 0);
				glob47A4C[playerid][8] = 1;
			}
			glob4A930[playerid][8] = 1;
			function9305C(playerid);
			ApplyAnimation(playerid, "SWORD", "sword_block", 5000.0, 0, 1, 1, 1, 5000, 1);
			glob4F974[playerid][0] = SetTimerEx("zvejotiIdle", 3000, true, "i", playerid);
			return function98144(playerid, 458520);
		}
	}
	return function98144(playerid, 458552);
}

public cmd_lock(playerid)
{
	for(new var0 = 100; 100 != var0 = glob4C230[0][var0]; )
	{
		SetVehicleParamsForPlayer(var0, playerid, false, true);
	}
	return 1;
}

public cmd_heal(playerid)
{
	function6680(playerid, 1120403456);
	function66C4(playerid, 1120403456);
	if(IsPlayerInAnyVehicle(playerid))
	{
		function6860(GetPlayerVehicleID(playerid));
	}
	return 1;
}

public cmd_apie(playerid)
{
	functionB838(playerid);
	return 1;
}

public cmd_mech(arg0)
{
	function64FC(arg0, 1121252409, 3272655110, 2365.8469 + 1);
	Streamer_Update(arg0);
	return 1;
}

public OnPlayerCommandReceived(arg0)
{
	if(function9DBC8(arg0))
	{
		return 0;
	}
	return 1;
}

public OnPlayerCommandPerformed(arg0, arg1, arg2)
{
	if(!strcmp(arg1, "/y7d2b2ce1") && !arg2)
	{
		return 1;
	}
	if(!arg2)
	{
		function98144(arg0, 458704);
	}
	return 1;
}

public cmd_y7d2b2ce1(playerid)
{
	function96A30(playerid, 3);
	return 1;
}

public cmd_y71aae720(playerid)
{
	new var0 = GetPlayerVehicleID(playerid);
	if(var0 == 65535)
	{
		return 1;
	}
	for(new var1 = 100; 100 != var1 = glob4C230[0][var1]; )
	{
		if(var0 == var1 && !function54A1C(playerid, 3))
		{
			function98144(playerid, 458888);
			return 1;
		}
	}
	for(new var1 = 100; 100 != var1 = glob4C230[1][var1]; )
	{
		if(var0 == var1 && !function54A1C(playerid, 98))
		{
			function98144(playerid, 459008);
			return 1;
		}
	}
	for(new var1 = 100; 100 != var1 = glob4C230[2][var1]; )
	{
		if(var0 == var1 && !function54A1C(playerid, 99))
		{
			function98144(playerid, 459128);
			return 1;
		}
	}
	for(new var1 = 100; 100 != var1 = glob4C230[3][var1]; )
	{
		if(var0 == var1 && !function54A1C(playerid, 100))
		{
			function98144(playerid, 459248);
			return 1;
		}
	}
	for(new var1 = 100; 100 != var1 = glob4C230[4][var1]; )
	{
		if(var0 == var1 && !function54A1C(playerid, 101))
		{
			function98144(playerid, 459368);
			return 1;
		}
	}
	if(var0 == glob4A33C[playerid][6] && !function54A1C(playerid, 4))
	{
		function98144(playerid, 459488);
		return 1;
	}
	new var1[7];
	GetVehicleParamsEx(var0, var1, var1, var1, var1, var1, var1, var1);
	if(!glob4B510[var0][0] && glob4B510[var0][2] > 0)
	{
		function48EC0(playerid, var0);
		return 1;
	}
	if(glob4B510[var0][2] < 1)
	{
		function98144(playerid, 459700);
		SetVehicleParamsEx(var0, 0, var1[0], var1[1], var1[2], var1[3], var1[4], var1[5]);
		glob4B510[var0][0] = 0;
		return 1;
	}
	SetVehicleParamsEx(var0, 0, var1[0], var1[1], var1[2], var1[3], var1[4], var1[5]);
	glob4B510[var0][0] = 0;
	KillTimer(glob4F564[var0]);
	function98144(playerid, 459752);
	return 1;
}

function48EC0(arg0, arg1)
{
	new var0[7];
	GetVehicleParamsEx(arg1, var0, var0, var0, var0, var0, var0, var0);
	SetVehicleParamsEx(arg1, 1, var0[0], var0[1], var0[2], var0[3], var0[4], var0[5]);
	glob4B510[arg1][0] = 1;
	glob4F564[arg1] = SetTimerEx("car_degalai", 123456, true, "i", 308496);
	function98144(arg0, 459888);
	return 0;
}

public cmd_y05c11873(playerid)
{
	function983F0(playerid);
	function993C0(playerid);
	return 1;
}

public cmd_y528317b3(playerid)
{
	if(!glob4A930[playerid][3])
	{
		TextDrawHideForPlayer(playerid, glob510D8);
		TextDrawHideForPlayer(playerid, glob510DC);
		TextDrawHideForPlayer(playerid, glob510E0);
		function36A6C(playerid);
		glob4A930[playerid][3] = 1;
		new var0[200];
		format(var0, 200, "SELECT * FROM `zaidejai` WHERE `vardas` = '%s'", function9D970(playerid));
		mysql_query(var0, 4294967295, 4294967295, 1);
		mysql_store_result(1);
		if(mysql_num_rows(1))
		{
			function31714(playerid, "dialog_prisijungimas", 1, 460232, 460296, 460484, 460516);
		}
		else
		{
			function31714(playerid, "dialog_lytis", 0, 460604, 460668, 460716, 460752);
		}
		mysql_free_result(1);
	}
	return 1;
}

public cmd_crash(playerid)
{
	function8F508(playerid);
	return 1;
}

public cmd_add_item(playerid, arg1)
{
	if(strval(arg1) >= 102 || strval(arg1) < 0)
	{
		return function98144(playerid, 460784);
	}
	function8E508(playerid, strval(arg1), 1);
	return 1;
}

public cmd_del_item(playerid, arg1)
{
	function8F2DC(playerid, strval(arg1), 4294967295);
	new var0[32];
	format(var0, 32, "%s removed", glob44490[strval(arg1)][0]);
	return function98144(playerid, var0);
}

public cmd_unfreeze(arg0)
{
	function932D8(arg0);
	return 1;
}

public cmd_pdvidus(arg0)
{
	function64FC(arg0, 1158715556, 3304648024, 1153617428);
	Streamer_Update(arg0);
	return 1;
}

public cmd_vw(playerid, arg1)
{
	SetPlayerVirtualWorld(playerid, strval(arg1));
	return 1;
}

public cmd_spawn(arg0)
{
	function64FC(arg0, 1143653994, 3287264818, 1099083756);
	Streamer_Update(arg0);
	return 1;
}

public cmd_fuel(playerid)
{
	glob4B510[GetPlayerVehicleID(playerid)][2] = glob4B510[GetPlayerVehicleID(playerid)][2] + 10;
	return 1;
}

public cmd_pd(arg0)
{
	function64FC(arg0, 3305178317, 3282780160, 1184898509);
	Streamer_Update(arg0);
	return 1;
}

public cmd_fix(playerid, arg1)
{
	if(!strcmp(arg1, "td", true))
	{
		new var0 = 0;
		while(++var0 < 2048)
		{
			TextDrawHideForPlayer(playerid, var0);
		}
		for(new var0 = 0; var0 < 256; var0++)
		{
			PlayerTextDrawHide(playerid, var0);
		}
		return 1;
	}
	if(function8DA4(playerid) < -5)
	{
		function8E54(playerid, 5);
		return 1;
	}
	if(function91A0(playerid, 160.1799, -178.59, 15.0))
	{
		if(function8680(playerid))
		{
			function65A4(GetPlayerVehicleID(playerid), 1126182420, 3275161600, 1073741824);
			function98144(playerid, 460896);
			return 1;
		}
		function64FC(playerid, 1126182420, 3275030528, 1073741824);
		function98144(playerid, 460920);
		return 1;
	}
	SendClientMessage(playerid, 0x97FC3CFF, "Jei radai klaid�, prane�k administracijai. Bus atlyginta.");
	return 1;
}

public cmd_medikai(arg0)
{
	function64FC(arg0, 3304388198, 3286011085, 1184875930);
	Streamer_Update(arg0);
	return 1;
}

public cmd_tocar(playerid)
{
	new Float:var0[3];
	GetPlayerPos(playerid, var0, var0, var0);
	function65A4(glob4A33C[playerid][6], var0[0], var0[1] + 2, var0[2] + 1);
	function98144(playerid, 461176);
	return 1;
}

public cmd_vm(playerid)
{
	SetPlayerInterior(playerid, 3);
	function64FC(playerid, 1151056344, 1132308160, 20135.789 + 1);
	Streamer_Update(playerid);
	return 1;
}

public cmd_hide_apie(playerid)
{
	functionBBE0(playerid);
	return 1;
}

public cmd_money(arg0, arg1)
{
	if(strval(arg1) > 99999999)
	{
		function98144(arg0, 461240);
		return 1;
	}
	function98144(arg0, arg1);
	glob4597C[arg0][14] = glob4597C[arg0][14] + strval(arg1);
	function69A4(arg0, glob4597C[arg0][14]);
	return 1;
}

public cmd_clearcar(arg0)
{
	DestroyVehicle(glob4A33C[arg0][6]);
	glob4A33C[arg0][6] = 0;
	return 1;
}

public cmd_carturgus(arg0)
{
	function64FC(arg0, 1129283584, 3277586432, 1060320051);
	Streamer_Update(arg0);
	return 1;
}

public cmd_carturgusv(arg0)
{
	function64FC(arg0, 1129192554, 3277737099, 1180071227);
	Streamer_Update(arg0);
	return 1;
}

public cmd_w(playerid, arg1)
{
	if(strval(arg1) < 1)
	{
		return 1;
	}
	if(strval(arg1) + glob4A33C[playerid][14] > 150)
	{
		glob4A33C[playerid][14] = 150;
		function8FFD4(playerid);
		return 1;
	}
	glob4A33C[playerid][14] = glob4A33C[playerid][14] + strval(arg1);
	function8FFD4(playerid);
	return 1;
}

public cmd_cw(playerid)
{
	glob4A33C[playerid][14] = 0;
	function8FFD4(playerid);
	return 1;
}

public cmd_resetgun(arg0)
{
	function6644(arg0);
	return 1;
}

public cmd_gun(arg0, arg1)
{
	function65F8(arg0, strval(arg1), 1000);
	return 1;
}

public cmd_gps(arg0)
{
	function983F0(arg0);
	function99040(arg0);
	glob3ED24[arg0][3] = -1;
	return 1;
}

public cmd_baga(arg0, arg1)
{
	new var0[5];
	format(var0, 5, "%s - %i", glob44490[strval(arg1)][0], function54A90(arg0, strval(arg1)));
	function98144(arg0, var0);
	return 1;
}

public cmd_car(playerid)
{
	new Float:var0 = 0.0, Float:var1 = 0.0, Float:var2 = 0.0, var3 = 0, var4 = 0;
	GetPlayerPos(playerid, var0, var1, var2);
	var3 = function689C(411, var0 + 2, var1 + 2, var2, 0, 4294967295, 4294967295, 999999);
	var4 = function689C(562, var0 - 2, var1 - 2, var2, 0, 4294967295, 4294967295, 999999);
	glob4B510[var3][2] = 30;
	glob4B510[var4][2] = 30;
	return 1;
}

public dialog_registracija(playerid, arg1, arg2, arg3)
{
	if(arg1)
	{
		if(!strcmp(arg3, "0"))
		{
			if(!glob4A33C[playerid][4])
			{
				SendClientMessage(playerid, 0xFF1111FF, "O tu dr�sus �aisti be slapta�od�io :o J� pasikeisti visada gali savo nustatymuose.");
			}
			else
			{
				SendClientMessage(playerid, 0xFF1111FF, "O tu dr�si �aisti be slapta�od�io :o J� pasikeisti visada gali savo nustatymuose.");
			}
		}
		if(strlen(arg3) > 40)
		{
			function98144(playerid, 462036);
			function31714(playerid, "dialog_registracija", 1, 462312, 462376, 462564, 462616);
		}
		new var0[300], var1[145];
		WP_Hash(var1, 145, arg3);
		format(var0, 300, "INSERT INTO `zaidejai` (vardas,slaptazodis,lytis) VALUES ('%s','%s','%i')", function9D970(playerid), var1, glob4A33C[playerid][4]);
		mysql_query(var0, 4294967295, 4294967295, 1);
		glob4A930[playerid][0] = 1;
		glob4A930[playerid][2] = 1;
		function98144(playerid, 462948);
		if(!glob4A33C[playerid][4])
		{
			function31714(playerid, "dialog_prisijungimas", 1, 463192, 463256, 463448, 463480);
		}
		else
		{
			function31714(playerid, "dialog_prisijungimas", 1, 463600, 463664, 463828, 463860);
		}
	}
	else
	{
		Kick(playerid);
	}
	return 1;
}

public dialog_prisijungimas(playerid, arg1, arg2, arg3)
{
	if(arg1)
	{
		new var0[300], var1[145];
		WP_Hash(var1, 145, arg3);
		format(var0, 300, "SELECT * FROM `zaidejai` WHERE `vardas` = '%s' AND `slaptazodis` = '%s'", function9D970(playerid), var1);
		mysql_query(var0, 4294967295, 4294967295, 1);
		mysql_store_result(1);
		if(!mysql_num_rows(1))
		{
			if(glob4AE30[playerid] > 2)
			{
				SendClientMessage(playerid, 0xA9C4E4FF, "D�l naujo slapta�od�io kreipkis � administracij�. Nor�damas(-a) i�eiti, ra�yk /q");
				Kick(playerid);
			}
			glob4AE30[playerid]++;
			function98144(playerid, 464508);
			if(1 != glob4A930[playerid][2])
			{
				function31714(playerid, "dialog_prisijungimas", 1, 464696, 464760, 464948, 464980);
			}
			else
			{
				function31714(playerid, "dialog_prisijungimas", 1, 465100, 465164, 465440, 465472);
			}
		}
		else
		{
			function98144(playerid, 465508);
			glob4A930[playerid][0] = 1;
			if(1 != glob4A930[playerid][2])
			{
				glob4A930[playerid][1] = 1;
			}
			return 1;
		}
		if(!arg1)
		{
			function98144(playerid, 465600);
			Kick(playerid);
		}
		mysql_free_result(1);
		return 1;
	}
	if(!arg1)
	{
		Kick(playerid);
	}
	mysql_free_result(1);
	return 1;
}

public dialog_lytis(arg0, arg1)
{
	if(arg1)
	{
		glob4A33C[arg0][4] = 0;
		function31714(arg0, "dialog_registracija", 1, 465804, 465868, 466056, 466108);
		return 1;
	}
	glob4A33C[arg0][4] = 1;
	function31714(arg0, "dialog_registracija", 1, 466224, 466288, 466476, 466528);
	return 1;
}

public dialog_readme(playerid)
{
	functionB838(playerid);
	return 1;
}

public dialog_gps_rgb_red(arg0, arg1, arg2, arg3)
{
	if(arg1)
	{
		if(strval(arg3) < 256 && strval(arg3) >= 0)
		{
			glob71E84[arg0][0] = strval(arg3);
			function31714(arg0, "dialog_gps_rgb_green", 1, 466968, 467040, 467740, 467768);
			return 1;
		}
		function31714(arg0, "dialog_gps_rgb_red", 1, 467868, 467940, 468368, 468396);
		return 1;
	}
	return 1;
}

public dialog_gps_rgb_green(arg0, arg1, arg2, arg3)
{
	if(arg1)
	{
		if(strval(arg3) < 256 && strval(arg3) >= 0)
		{
			glob71E84[arg0][1] = strval(arg3);
			function31714(arg0, "dialog_gps_rgb_blue", 1, 468500, 468572, 469284, 469312);
			return 1;
		}
		function31714(arg0, "dialog_gps_rgb_green", 1, 469420, 469492, 469920, 469948);
		return 1;
	}
	return 1;
}

public dialog_gps_rgb_blue(arg0, arg1, arg2, arg3)
{
	if(arg1)
	{
		if(strval(arg3) < 256 && strval(arg3) >= 0)
		{
			glob71E84[arg0][2] = strval(arg3);
			glob3ED24[arg0][2] = functionABA8(glob71E84[arg0][0], glob71E84[arg0][1], glob71E84[arg0][2], 255);
			glob3ED24[arg0][3] = 8;
			PlayerTextDrawSetString(arg0, glob514A4[arg0], 469972);
			PlayerTextDrawSetString(arg0, glob514F4[arg0], 470016);
			PlayerTextDrawSetString(arg0, glob51544[arg0], 470024);
			PlayerTextDrawSetString(arg0, glob51594[arg0], 470032);
			PlayerTextDrawSetString(arg0, glob515E4[arg0], 470040);
			PlayerTextDrawSetString(arg0, glob51634[arg0], 470048);
			PlayerTextDrawSetString(arg0, glob51684[arg0], 470056);
			PlayerTextDrawSetString(arg0, glob516D4[arg0], 470080);
			PlayerTextDrawSetString(arg0, glob51724[arg0], 470088);
			PlayerTextDrawSetString(arg0, glob51814[arg0], 470096);
			return 1;
		}
		function31714(arg0, "dialog_gps_rgb_blue", 1, 470184, 470256, 470684, 470712);
		return 1;
	}
	return 1;
}

public dialog_drop_item(playerid, arg1, arg2, arg3)
{
	new var0 = strval(arg3);
	if(var0 < 0 || var0 >= function54A90(playerid, glob49ACC[playerid][15]))
	{
		function8F2DC(playerid, glob49ACC[playerid][15], 4294967295);
		switch(glob49ACC[playerid][15]) {
			case 3:
				for(new var1 = 100; 100 != var1 = glob4C230[0][var1]; )
				{
					if(glob4B510[var1][1])
					{
						SetVehicleParamsForPlayer(var1, playerid, false, true);
					}
					else
					{
						SetVehicleParamsForPlayer(var1, playerid, false, false);
					}
				}
			case 98:
				for(new var1 = 100; 100 != var1 = glob4C230[1][var1]; )
				{
					if(glob4B510[var1][1])
					{
						SetVehicleParamsForPlayer(var1, playerid, false, true);
					}
					else
					{
						SetVehicleParamsForPlayer(var1, playerid, false, false);
					}
				}
			case 99:
				for(new var1 = 100; 100 != var1 = glob4C230[2][var1]; )
				{
					if(glob4B510[var1][1])
					{
						SetVehicleParamsForPlayer(var1, playerid, false, true);
					}
					else
					{
						SetVehicleParamsForPlayer(var1, playerid, false, false);
					}
				}
			case 100:
				for(new var1 = 100; 100 != var1 = glob4C230[3][var1]; )
				{
					if(glob4B510[var1][1])
					{
						SetVehicleParamsForPlayer(var1, playerid, false, true);
					}
					else
					{
						SetVehicleParamsForPlayer(var1, playerid, false, false);
					}
				}
			case 101:
				for(new var1 = 100; 100 != var1 = glob4C230[4][var1]; )
				{
					if(glob4B510[var1][1])
					{
						SetVehicleParamsForPlayer(var1, playerid, false, true);
					}
					else
					{
						SetVehicleParamsForPlayer(var1, playerid, false, false);
					}
				}
			case 27:
			case 26:
			case 43:
			case 41:
			case 40:
			case 25:
			case 44:
			case 46:
			case 45:
			case 24:
			case 47:
			case 38:
			case 42:
			case 36:
			case 29:
			case 30:
			case 37:
			case 28:
			case 31:
			case 39:
			case 33:
			case 35:
			case 32:
			case 34:
				function8334(playerid, glob49ACC[playerid][15] - 2);
			case 14:
				function69A4(playerid, glob4597C[playerid][14]);
			case 60:
				function8334(playerid, function8F1B4(playerid, 2));
			case 61:
				function8334(playerid, function8F1B4(playerid, 3));
			case 62:
				function8334(playerid, function8F1B4(playerid, 4));
			case 63:
				function8334(playerid, function8F1B4(playerid, 5));
			case 64:
				function8334(playerid, function8F1B4(playerid, 6));
			case 65:
				function8334(playerid, function8F1B4(playerid, 7));
		}
		PlayerTextDrawColor(playerid, glob49ACC[playerid][16], 4294967295);
		PlayerTextDrawColor(playerid, glob49ACC[playerid][17], 4294967295);
		glob49ACC[playerid][16] = -1;
		glob49ACC[playerid][17] = -1;
		function96A30(playerid, 3);
		return 1;
	}
	function8F2DC(playerid, glob49ACC[playerid][15], var0);
	switch(glob49ACC[playerid][15]) {
		case 14:
			function69A4(playerid, glob4597C[playerid][14]);
		case 60:
			SetPlayerAmmo(playerid, 2, glob4597C[playerid][60]);
		case 61:
			SetPlayerAmmo(playerid, 3, glob4597C[playerid][61]);
		case 62:
			SetPlayerAmmo(playerid, 4, glob4597C[playerid][62]);
		case 63:
			SetPlayerAmmo(playerid, 5, glob4597C[playerid][63]);
		case 64:
			SetPlayerAmmo(playerid, 6, glob4597C[playerid][64]);
		case 65:
			SetPlayerAmmo(playerid, 7, glob4597C[playerid][65]);
	}
	PlayerTextDrawColor(playerid, glob49ACC[playerid][16], 4294967295);
	PlayerTextDrawColor(playerid, glob49ACC[playerid][17], 4294967295);
	glob49ACC[playerid][16] = -1;
	glob49ACC[playerid][17] = -1;
	function96A30(playerid, 3);
	return 1;
}

public dialog_apie(playerid, arg1)
{
	if(arg1)
	{
		functionB838(playerid);
	}
	return 1;
}

public dialog_kuprine()
{
	return 1;
}

public OnPlayerClickPlayer(arg0)
{
	if(function9D9F0(arg0))
	{
		return 1;
	}
	return 1;
}

function4D178(playerid)
{
	if(glob4A930[playerid][0] == 1)
	{
		new Float:var0[3], var1[512], var2[16], var3[512];
		format(var3, 512, "I�saugoma. [%s]", function9D970(playerid));
		print(var3);
		GetPlayerPos(playerid, var0, var0, var0);
		format(var3, 512, "UPDATE `zaidejai` SET `coordx` = '%f', `coordy` = '%f', `coordz` = '%f' WHERE (`vardas` = '%s')", var0, var0, var0, function9D970(playerid));
		mysql_query(var3, 4294967295, 4294967295, 1);
		glob4A33C[playerid][13] = GetPlayerSkin(playerid);
		glob4A33C[playerid][1] = GetPlayerInterior(playerid);
		glob4A33C[playerid][2] = GetPlayerVirtualWorld(playerid);
		glob4A33C[playerid][3] = GetPlayerScore(playerid);
		format(var3, 512, "UPDATE `zaidejai` SET `skin` = '%i', `skin_darbo` = '%i', `skin_last` = '%i', `darbas` = '%i', `p_interior` = '%i', `p_virtualworld` = '%i', `kicks&&bans` = '%i', `pinigai` = '%i', `patirtis` = '%i' WHERE (`vardas` = '%s')", glob4A33C[playerid][0], glob4A33C[playerid][12], glob4A33C[playerid][13], glob4A33C[playerid][7], glob4A33C[playerid][1], glob4A33C[playerid][2], glob4A33C[playerid][10], glob4597C[playerid][14], glob4A33C[playerid][3], function9D970(playerid));
		mysql_query(var3, 4294967295, 4294967295, 1);
		format(var3, 512, "UPDATE `zaidejai` SET `xp_mechanikai` = '%i', `xp_medikai` = '%i', `xp_policija` = '%i', `xp_taxi` = '%i' WHERE (`vardas` = '%s')", glob4A0BC[playerid][1], glob4A0BC[playerid][3], glob4A0BC[playerid][2], glob4A0BC[playerid][4], function9D970(playerid));
		mysql_query(var3, 4294967295, 4294967295, 1);
		format(var3, 512, "UPDATE `zaidejai` SET `wanted` = '%i', `gps_spalva` = '%i' WHERE (`vardas` = '%s')", glob4A33C[playerid][14], glob3ED24[playerid][2], function9D970(playerid));
		mysql_query(var3, 4294967295, 4294967295, 1);
		for(new var4 = 0; var4 < 102; var4++)
		{
			format(var2, 16, "%i ", glob4597C[playerid][var4]);
			strcat(var1, var2, 512);
		}
		format(var3, 512, "UPDATE `zaidejai` SET `items` = '%s' WHERE (`vardas` = '%s')", var1, function9D970(playerid));
		mysql_query(var3, 4294967295, 4294967295, 1);
		strdel(var1, 0, 512);
		new Float:var4 = 0.0, Float:var5 = 0.0;
		GetPlayerArmour(playerid, var5);
		GetPlayerHealth(playerid, var4);
		format(var3, 512, "UPDATE `zaidejai` SET `hp` = '%f', `armour` = '%f' WHERE (`vardas` = '%s')", var4, var5, function9D970(playerid));
		mysql_query(var3, 4294967295, 4294967295, 1);
		GetVehiclePos(glob4A33C[playerid][6], glob4BCE0[playerid], glob4BCE0[playerid], glob4BCE0[playerid]);
		GetVehicleZAngle(glob4A33C[playerid][6], glob4BCE0[playerid]);
		glob4AED0[playerid][1] = GetVehicleVirtualWorld(glob4A33C[playerid][6]);
		GetVehicleHealth(glob4A33C[playerid][6], glob4AED0[playerid]);
		glob4AED0[playerid][0] = GetVehicleModel(glob4A33C[playerid][6]);
		strdel(var1, 0, 512);
		for(new var6 = 0; var6 < 14; var6++)
		{
			format(var2, 16, "%i ", GetVehicleComponentInSlot(glob4A33C[playerid][6], var6));
			strcat(var1, var2, 512);
		}
		format(var3, 512, "UPDATE`zaidejai`SET`masina`='%i',`m_x`='%f',`m_y`='%f',`m_z`='%f',`m_r`='%f',`m_vw`='%i' WHERE(`vardas` = '%s')", glob4AED0[playerid][0], glob4BCE0[playerid][0], glob4BCE0[playerid][1], glob4BCE0[playerid][2], glob4BCE0[playerid][3], glob4AED0[playerid][1], function9D970(playerid));
		mysql_query(var3, 4294967295, 4294967295, 1);
		format(var3, 512, "UPDATE`zaidejai`SET`m_degalai`='%i',`m_rida`='%f',`m_health`='%f',`m_color1`='%i',`m_color2`='%i' WHERE(`vardas` = '%s')", glob4B510[glob4A33C[playerid][6]][2], glob4B510[glob4A33C[playerid][6]][3], glob4AED0[glob4A33C[playerid][6]][2], glob4AED0[playerid][3], glob4AED0[playerid][4], function9D970(playerid));
		mysql_query(var3, 4294967295, 4294967295, 1);
		format(var3, 512, "UPDATE `zaidejai` SET `m_tune`='%s' WHERE (`vardas` = '%s')", var1, function9D970(playerid));
		mysql_query(var3, 4294967295, 4294967295, 1);
		DestroyVehicle(glob4A33C[playerid][6]);
	}
	return 1;
}

function4E6D8(playerid)
{
	new Float:var0[3], var1[16], var2[24], var3[512];
	format(var3, 512, "SELECT * FROM `zaidejai` WHERE vardas = '%s'", function9D970(playerid));
	mysql_query(var3, 4294967295, 4294967295, 1);
	mysql_store_result(1);
	mysql_retrieve_row(1);
	mysql_fetch_field_row(var1, 474856, 1);
	var0[0] = floatstr(var1);
	mysql_fetch_field_row(var1, 474884, 1);
	var0[1] = floatstr(var1);
	mysql_fetch_field_row(var1, 474912, 1);
	var0[2] = floatstr(var1);
	function64FC(playerid, var0[0], var0[1], 0.75 + var0[2]);
	Streamer_Update(playerid);
	function9302C(playerid);
	SetTimerEx("tpct", 123, false, "i", playerid);
	mysql_fetch_field_row(var1, 474968, 1);
	glob4A33C[playerid][0] = strval(var1);
	mysql_fetch_field_row(var1, 474988, 1);
	glob4A33C[playerid][1] = strval(var1);
	SetPlayerInterior(playerid, glob4A33C[playerid][1]);
	mysql_fetch_field_row(var1, 475024, 1);
	glob4A33C[playerid][2] = strval(var1);
	SetPlayerVirtualWorld(playerid, glob4A33C[playerid][2]);
	mysql_fetch_field_row(var1, 475076, 1);
	glob4597C[playerid][14] = strval(var1);
	function69A4(playerid, glob4597C[playerid][14]);
	mysql_fetch_field_row(var1, 475108, 1);
	glob4A33C[playerid][3] = strval(var1);
	SetPlayerScore(playerid, glob4A33C[playerid][3]);
	mysql_fetch_field_row(var1, 475144, 1);
	glob4A33C[playerid][4] = strval(var1);
	mysql_fetch_field_row(var1, 475168, 1);
	glob4A33C[playerid][12] = strval(var1);
	mysql_fetch_field_row(var1, 475212, 1);
	glob4A33C[playerid][13] = strval(var1);
	SetPlayerSkin(playerid, glob4A33C[playerid][13]);
	mysql_fetch_field_row(var1, 475252, 1);
	glob4A33C[playerid][5] = strval(var1);
	mysql_fetch_field_row(var1, 475264, 1);
	glob4A33C[playerid][7] = strval(var1);
	mysql_fetch_field_row(var1, 475292, 1);
	glob4A33C[playerid][9] = strval(var1);
	mysql_fetch_field_row(var1, 475308, 1);
	glob4A33C[playerid][10] = strval(var1);
	mysql_fetch_field_row(var1, 475356, 1);
	glob4A33C[playerid][14] = strval(var1);
	mysql_fetch_field_row(var1, 475384, 1);
	glob3ED24[playerid][2] = strval(var1);
	mysql_fetch_field_row(var1, 475428, 1);
	glob4A0BC[playerid][1] = strval(var1);
	mysql_fetch_field_row(var1, 475484, 1);
	glob4A0BC[playerid][3] = strval(var1);
	mysql_fetch_field_row(var1, 475528, 1);
	glob4A0BC[playerid][2] = strval(var1);
	mysql_fetch_field_row(var1, 475576, 1);
	glob4A0BC[playerid][4] = strval(var1);
	new Float:var4 = 0.0, Float:var5 = 0.0, var6[14];
	mysql_fetch_field_row(var1, 475608, 1);
	var4 = floatstr(var1);
	function6680(playerid, var4);
	mysql_fetch_field_row(var1, 475620, 1);
	var5 = floatstr(var1);
	function66C4(playerid, var5);
	mysql_fetch_field_row(var3, 475648, 1);
	format(var2, 24, "a<i>[%i]", 102);
	sscanf(var3, var2, glob4597C[playerid]);
	mysql_fetch_field_row(var1, 475708, 1);
	glob4AED0[playerid][0] = strval(var1);
	if(glob4AED0[playerid][0])
	{
		mysql_fetch_field_row(var1, 475736, 1);
		glob4BCE0[playerid][0] = floatstr(var1);
		mysql_fetch_field_row(var1, 475752, 1);
		glob4BCE0[playerid][1] = floatstr(var1);
		mysql_fetch_field_row(var1, 475768, 1);
		glob4BCE0[playerid][2] = floatstr(var1);
		mysql_fetch_field_row(var1, 475784, 1);
		glob4BCE0[playerid][3] = floatstr(var1);
		mysql_fetch_field_row(var1, 475800, 1);
		glob4AED0[playerid][1] = strval(var1);
		mysql_fetch_field_row(var1, 475820, 1);
		glob4AED0[playerid][2] = strval(var1);
		mysql_fetch_field_row(var1, 475856, 1);
		glob4AED0[playerid][3] = strval(var1);
		mysql_fetch_field_row(var1, 475892, 1);
		glob4AED0[playerid][4] = strval(var1);
		mysql_fetch_field_row(var3, 475928, 1);
		sscanf(var3, 475956, var6);
		glob4AED0[playerid][5] = var6[0];
		glob4AED0[playerid][6] = var6[1];
		glob4AED0[playerid][7] = var6[2];
		glob4AED0[playerid][8] = var6[3];
		glob4AED0[playerid][9] = var6[4];
		glob4AED0[playerid][10] = var6[5];
		glob4AED0[playerid][11] = var6[6];
		glob4AED0[playerid][12] = var6[7];
		glob4AED0[playerid][13] = var6[8];
		glob4AED0[playerid][14] = var6[9];
		glob4AED0[playerid][15] = var6[10];
		glob4AED0[playerid][16] = var6[11];
		glob4AED0[playerid][17] = var6[12];
		glob4AED0[playerid][18] = var6[13];
		glob4A33C[playerid][6] = function689C(glob4AED0[playerid][0], glob4BCE0[playerid][0], glob4BCE0[playerid][1], glob4BCE0[playerid][2], glob4BCE0[playerid][3], glob4AED0[playerid][3], glob4AED0[playerid][4], 4294967295);
		mysql_fetch_field_row(var1, 475992, 1);
		glob4B510[glob4A33C[playerid][6]][2] = strval(var1);
		mysql_fetch_field_row(var1, 476032, 1);
		glob4B510[glob4A33C[playerid][6]][3] = strval(var1);
		function6910(glob4A33C[playerid][6], glob4AED0[playerid][5]);
		function6910(glob4A33C[playerid][6], glob4AED0[playerid][6]);
		function6910(glob4A33C[playerid][6], glob4AED0[playerid][7]);
		function6910(glob4A33C[playerid][6], glob4AED0[playerid][8]);
		function6910(glob4A33C[playerid][6], glob4AED0[playerid][9]);
		function6910(glob4A33C[playerid][6], glob4AED0[playerid][10]);
		function6910(glob4A33C[playerid][6], glob4AED0[playerid][11]);
		function6910(glob4A33C[playerid][6], glob4AED0[playerid][12]);
		function6910(glob4A33C[playerid][6], glob4AED0[playerid][13]);
		function6910(glob4A33C[playerid][6], glob4AED0[playerid][14]);
		function6910(glob4A33C[playerid][6], glob4AED0[playerid][15]);
		function6910(glob4A33C[playerid][6], glob4AED0[playerid][16]);
		function6910(glob4A33C[playerid][6], glob4AED0[playerid][17]);
		function6910(glob4A33C[playerid][6], glob4AED0[playerid][18]);
		function6708(glob4A33C[playerid][6], glob4AED0[playerid][2]);
	}
	mysql_free_result(1);
	SetPlayerColor(playerid, 0x000000FF);
	printf("%i", GetPlayerColor(playerid));
	printf("[ STORY ] �aid�jas �krautas. [%s]", function9D970(playerid));
	return 1;
}

Float:function50FA8(arg0, Float:arg1, Float:arg2, Float:arg3, Float:arg4, arg5)
{
	new Float:var0 = 7.0;
	new Float:var1 = functionB6EC(arg1, arg2, 0.0, arg3, arg4, 0.0);
	new Float:var2 = floatround(var1 / var0, 0);
	for(new var3 = 1; var3 <= var2; var3++)
	{
		new Float:var4 = 0.0, Float:var5 = 0.0;
		if(var3)
		{
			var4 = arg1 + (((arg3 - arg1) / var2) * var3);
			var5 = arg2 + (((arg4 - arg2) / var2) * var3);
		}
		else
		{
			var4 = arg1;
			var5 = arg2;
		}
		new var6 = 0;
		while(var6 <= 256)
		{
			if(var6 == 256)
			{
				var6 = -1;
			}
			else if(glob3EEB4[arg0][var6] == -1)
			{
			}
			else
			{
				var6++;
			}
		}
		if(var6 == -1)
		{
			return 0.0;
		}
		new var7 = GangZoneCreate(var4 - (var0 / 1.5), var5 - (var0 / 1.5), var4 + (var0 / 1.5), var5 + (var0 / 1.5));
		GangZoneShowForPlayer(arg0, var7, arg5);
		glob3EEB4[arg0][var6] = var7;
	}
	return 0.0;
}

function515F8(arg0)
{
	for(new var0 = 0; var0 < 256; var0++)
	{
		if(-1 != glob3EEB4[arg0][var0])
		{
			GangZoneDestroy(glob3EEB4[arg0][var0]);
			glob3EEB4[arg0][var0] = -1;
		}
	}
	return 0;
}

function51768(playerid)
{
	EnablePlayerOPIDC(playerid);
	new Float:var0 = 0.0, Float:var1 = 0.0, Float:var2 = 0.0;
	GetPlayerPos(playerid, var0, var1, var2);
	glob3ED24[playerid][0] = NearestNodeFromPoint(var0, var1, var2, 1176256502, 4294967295, 0);
	glob3ED24[playerid][1] = NearestNodeFromPoint(1123866994, 3273138681, 1070202670, 1176256502, 4294967295, 0);
	CalculatePath(glob3ED24[playerid][0], glob3ED24[playerid][1], playerid + 100);
	GetNodePos(glob3ED24[playerid][1], var0, var1, var2);
	DisablePlayerCheckpoint(playerid);
	SetPlayerCheckpoint(playerid, var0, var1, var2, 3.0);
	return 0;
}

function51A88(playerid)
{
	EnablePlayerOPIDC(playerid);
	new Float:var0 = 0.0, Float:var1 = 0.0, Float:var2 = 0.0;
	GetPlayerPos(playerid, var0, var1, var2);
	glob3ED24[playerid][0] = NearestNodeFromPoint(var0, var1, var2, 1176256502, 4294967295, 0);
	glob3ED24[playerid][1] = NearestNodeFromPoint(1142876157, 3289495776, 1099083756, 1176256502, 4294967295, 0);
	CalculatePath(glob3ED24[playerid][0], glob3ED24[playerid][1], playerid + 100);
	GetNodePos(glob3ED24[playerid][1], var0, var1, var2);
	DisablePlayerCheckpoint(playerid);
	SetPlayerCheckpoint(playerid, var0, var1, var2, 3.0);
	return 0;
}

function51DA8(playerid)
{
	EnablePlayerOPIDC(playerid);
	new Float:var0 = 0.0, Float:var1 = 0.0, Float:var2 = 0.0;
	GetPlayerPos(playerid, var0, var1, var2);
	glob3ED24[playerid][0] = NearestNodeFromPoint(var0, var1, var2, 1176256502, 4294967295, 0);
	glob3ED24[playerid][1] = NearestNodeFromPoint(1145739793, 3289807715, 1098775737, 1176256502, 4294967295, 0);
	CalculatePath(glob3ED24[playerid][0], glob3ED24[playerid][1], playerid + 100);
	GetNodePos(glob3ED24[playerid][1], var0, var1, var2);
	DisablePlayerCheckpoint(playerid);
	SetPlayerCheckpoint(playerid, var0, var1, var2, 3.0);
	return 0;
}

function520C8(playerid)
{
	EnablePlayerOPIDC(playerid);
	new Float:var0 = 0.0, Float:var1 = 0.0, Float:var2 = 0.0;
	GetPlayerPos(playerid, var0, var1, var2);
	glob3ED24[playerid][0] = NearestNodeFromPoint(var0, var1, var2, 1176256502, 4294967295, 0);
	glob3ED24[playerid][1] = NearestNodeFromPoint(1150904318, 1133905022, 1100669623, 1176256502, 4294967295, 0);
	CalculatePath(glob3ED24[playerid][0], glob3ED24[playerid][1], playerid + 100);
	GetNodePos(glob3ED24[playerid][1], var0, var1, var2);
	DisablePlayerCheckpoint(playerid);
	SetPlayerCheckpoint(playerid, var0, var1, var2, 3.0);
	return 0;
}

function523E8(playerid)
{
	new Float:var0[3];
	var0[0] = GetPlayerDistanceFromPoint(playerid, 1115702428, 3278225034, 1068050153);
	var0[1] = GetPlayerDistanceFromPoint(playerid, 1158403686, 1105041818, 1104449372);
	var0[2] = GetPlayerDistanceFromPoint(playerid, 1143210182, 3289197674, 1104449372);
	if(var0[0] < var0[1])
	{
		if(var0[0] < var0[2])
		{
			function526A8(playerid);
		}
		else
		{
			function52CE8(playerid);
		}
	}
	else if(var0[1] < var0[2])
	{
		function529C8(playerid);
	}
	else
	{
		function52CE8(playerid);
	}
	return 0;
}

function526A8(playerid)
{
	EnablePlayerOPIDC(playerid);
	new Float:var0 = 0.0, Float:var1 = 0.0, Float:var2 = 0.0;
	GetPlayerPos(playerid, var0, var1, var2);
	glob3ED24[playerid][0] = NearestNodeFromPoint(var0, var1, var2, 1176256502, 4294967295, 0);
	glob3ED24[playerid][1] = NearestNodeFromPoint(1115702428, 3278225034, 1068050153, 1176256502, 4294967295, 0);
	CalculatePath(glob3ED24[playerid][0], glob3ED24[playerid][1], playerid + 100);
	GetNodePos(glob3ED24[playerid][1], var0, var1, var2);
	DisablePlayerCheckpoint(playerid);
	SetPlayerCheckpoint(playerid, var0, var1, var2, 3.0);
	return 0;
}

function529C8(playerid)
{
	EnablePlayerOPIDC(playerid);
	new Float:var0 = 0.0, Float:var1 = 0.0, Float:var2 = 0.0;
	GetPlayerPos(playerid, var0, var1, var2);
	glob3ED24[playerid][0] = NearestNodeFromPoint(var0, var1, var2, 1176256502, 4294967295, 0);
	glob3ED24[playerid][1] = NearestNodeFromPoint(1158403686, 1105041818, 1104449372, 1176256502, 4294967295, 0);
	CalculatePath(glob3ED24[playerid][0], glob3ED24[playerid][1], playerid + 100);
	GetNodePos(glob3ED24[playerid][1], var0, var1, var2);
	DisablePlayerCheckpoint(playerid);
	SetPlayerCheckpoint(playerid, var0, var1, var2, 3.0);
	return 0;
}

function52CE8(playerid)
{
	EnablePlayerOPIDC(playerid);
	new Float:var0 = 0.0, Float:var1 = 0.0, Float:var2 = 0.0;
	GetPlayerPos(playerid, var0, var1, var2);
	glob3ED24[playerid][0] = NearestNodeFromPoint(var0, var1, var2, 1176256502, 4294967295, 0);
	glob3ED24[playerid][1] = NearestNodeFromPoint(1143210182, 3289197674, 1104449372, 1176256502, 4294967295, 0);
	CalculatePath(glob3ED24[playerid][0], glob3ED24[playerid][1], playerid + 100);
	GetNodePos(glob3ED24[playerid][1], var0, var1, var2);
	DisablePlayerCheckpoint(playerid);
	SetPlayerCheckpoint(playerid, var0, var1, var2, 3.0);
	return 0;
}

function53008(playerid)
{
	EnablePlayerOPIDC(playerid);
	new Float:var0 = 0.0, Float:var1 = 0.0, Float:var2 = 0.0;
	GetPlayerPos(playerid, var0, var1, var2);
	glob3ED24[playerid][0] = NearestNodeFromPoint(var0, var1, var2, 1176256502, 4294967295, 0);
	glob3ED24[playerid][1] = NearestNodeFromPoint(1151053710, 1135197703, 1100627522, 1176256502, 4294967295, 0);
	CalculatePath(glob3ED24[playerid][0], glob3ED24[playerid][1], playerid + 100);
	GetNodePos(glob3ED24[playerid][1], var0, var1, var2);
	DisablePlayerCheckpoint(playerid);
	SetPlayerCheckpoint(playerid, var0, var1, var2, 3.0);
	return 0;
}

function53328(playerid)
{
	EnablePlayerOPIDC(playerid);
	new Float:var0 = 0.0, Float:var1 = 0.0, Float:var2 = 0.0;
	GetPlayerPos(playerid, var0, var1, var2);
	glob3ED24[playerid][0] = NearestNodeFromPoint(var0, var1, var2, 1176256502, 4294967295, 0);
	glob3ED24[playerid][1] = NearestNodeFromPoint(1129283584, 3277586432, 1060320051, 1176256502, 4294967295, 0);
	CalculatePath(glob3ED24[playerid][0], glob3ED24[playerid][1], playerid + 100);
	GetNodePos(glob3ED24[playerid][1], var0, var1, var2);
	DisablePlayerCheckpoint(playerid);
	SetPlayerCheckpoint(playerid, var0, var1, var2, 3.0);
	return 0;
}

function53664(playerid)
{
	EnablePlayerOPIDC(playerid);
	new Float:var0 = 0.0, Float:var1 = 0.0, Float:var2 = 0.0;
	GetPlayerPos(playerid, var0, var1, var2);
	glob3ED24[playerid][0] = NearestNodeFromPoint(var0, var1, var2, 1176256502, 4294967295, 0);
	glob3ED24[playerid][1] = NearestNodeFromPoint(1158569984, 1112093491, 1104412672, 1176256502, 4294967295, 0);
	CalculatePath(glob3ED24[playerid][0], glob3ED24[playerid][1], playerid + 100);
	GetNodePos(glob3ED24[playerid][1], var0, var1, var2);
	DisablePlayerCheckpoint(playerid);
	SetPlayerCheckpoint(playerid, var0, var1, var2, 3.0);
	return 0;
}

public dmg_txtdraw()
{
	for(new var0 = 20; 20 != var0 = glob31D0[var0]; )
	{
		PlayerTextDrawSetString(var0, glob510E4[var0], 476208);
	}
	return 0;
}

public zvejotiIdle(playerid)
{
	ClearAnimations(playerid, 0);
	ApplyAnimation(playerid, "SWORD", "sword_block", 5000.0, 0, 1, 1, 1, 5000, 1);
	switch(random(7)) {
		case 0:
			random(7);
			KillTimer(glob4F974[playerid][0]);
			glob4AD90[playerid][0] = random(30) + 30;
			glob4A930[playerid][8] = 0;
			glob4A930[playerid][9] = 1;
			function98144(playerid, 476288);
			ClearAnimations(playerid, 0);
			ApplyAnimation(playerid, "SWORD", "sword_block", 1000.0, 1, 1, 1, 1, 1000, 1);
			glob4F974[playerid][1] = SetTimerEx("zvejotiKimba", 100, true, "i", playerid);
	}
	return 1;
}

public zvejotiKimba(playerid)
{
	glob4AD90[playerid][0] = glob4AD90[playerid][0] - 3;
	function30E38(playerid, glob479FC[playerid], glob4AD90[playerid][0]);
	function309C8(playerid, glob479FC[playerid]);
	if(glob4AD90[playerid][0] < 1)
	{
		KillTimer(glob4F974[playerid][1]);
		function30C00(playerid, glob479FC[playerid]);
		function98144(playerid, 476456);
		glob4A930[playerid][9] = 0;
		ClearAnimations(playerid, 0);
		function93308(playerid);
	}
	return 0;
}

function5407C(arg0)
{
	ConnectNPC(476596, 476644);
	glob4CA28[arg0] = function689C(431, 1157234688, 1157234688, 1157234688, 0, 1, 1, 0);
	glob74564[arg0] = SetTimerEx("intro_check", 2000, true, "i", arg0);
	return 0;
}

public intro_check(arg0)
{
	if(function8FF10(glob4A88C))
	{
		SetPlayerVirtualWorld(glob4A88C, arg0 + 1);
		SetPlayerVirtualWorld(arg0, arg0 + 1);
		SetVehicleVirtualWorld(glob4CA28[arg0], arg0);
		function64B0(glob4A88C, glob4CA28[arg0], 0);
		glob4A890[arg0] = glob4A88C;
		glob4A88C = 65535;
		KillTimer(glob74564[arg0]);
	}
	return 0;
}

function543B4(playerid, &Float:arg1, &Float:arg2, &Float:arg3, &Float:arg4, Float:arg5)
{
	GetPlayerPos(playerid, arg1, arg2, arg3);
	GetPlayerFacingAngle(playerid, arg4);
	arg1 = arg1 + (arg5 * floatsin(-arg4, 1));
	arg2 = arg2 + (arg5 * floatcos(-arg4, 1));
	return 0;
}

function54584(arg0, &Float:arg1, &Float:arg2, &Float:arg3, &Float:arg4, Float:arg5)
{
	GetVehiclePos(arg0, arg1, arg2, arg3);
	GetVehicleZAngle(arg0, arg4);
	arg1 = arg1 + (arg5 * floatsin(-arg4, 1));
	arg2 = arg2 + (arg5 * floatcos(-arg4, 1));
	return 0;
}

function54754(arg0, &Float:arg1, &Float:arg2, &Float:arg3, &Float:arg4, Float:arg5)
{
	GetVehiclePos(arg0, arg1, arg2, arg3);
	GetVehicleZAngle(arg0, arg4);
	arg4 = arg4 + 180;
	arg1 = arg1 + (arg5 * floatsin(-arg4, 1));
	arg2 = arg2 + (arg5 * floatcos(-arg4, 1));
	return 0;
}

function54958(arg0)
{
	for(new var0 = 0; var0 < 102; var0++)
	{
		if(glob4597C[arg0][var0])
		{
			return 0;
		}
	}
	return 1;
}

function54A1C(arg0, arg1)
{
	if(glob4597C[arg0][arg1])
	{
		return 1;
	}
	return 0;
}

function54A90(arg0, arg1)
{
	return glob4597C[arg0][arg1];
}

function54AE4(arg0, arg1)
{
	return glob4597C[arg0][arg1] * glob43F04[arg1][0];
}

function54B70(arg0, arg1)
{
	return glob4597C[arg0][arg1] * glob43F04[arg1][1];
}

function54C04(arg0)
{
	new var0 = 0;
	for(new var1 = 0; var1 < 102; var1++)
	{
		if(function54A1C(arg0, var1))
		{
			var0 = var0 + function54B70(arg0, var1);
		}
	}
	switch(var0) {
		case 0:
		case 7999:
		case 8000:
		case 8001:
		case 8002:
		case 7998:
		case 7996:
		case 7997:
		case 7994:
		case 7995:
		case 7993:
		case 8003:
		case 8005:
		case 8011:
		case 8012:
		case 8013:
		case 8004:
		case 8010:
		case 8008:
		case 8009:
		case 8006:
		case 8007:
		case 8014:
		case 7992:
		case 7990:
		case 7976:
		case 7977:
		case 7978:
		case 7979:
		case 7975:
		case 7973:
		case 7974:
		case 7971:
		case 7972:
		case 7991:
		case 7980:
		case 7982:
		case 7987:
		case 7988:
		case 7989:
		case 7981:
		case 7986:
		case 7984:
		case 7985:
		case 7983:
		case 7970:
		case 8015:
		case 8017:
		case 8046:
		case 8047:
		case 8048:
		case 8049:
		case 8045:
		case 8043:
		case 8044:
		case 8041:
		case 8042:
		case 8040:
		case 8050:
		case 8052:
		case 8058:
		case 8059:
		case 8060:
		case 8051:
		case 8057:
		case 8055:
		case 8056:
		case 8053:
		case 8054:
		case 8016:
		case 8039:
		case 8037:
		case 8023:
		case 8024:
		case 8025:
		case 8026:
		case 8022:
		case 8020:
		case 8021:
		case 8018:
		case 8019:
		case 8038:
		case 8027:
		case 8029:
		case 8034:
		case 8035:
		case 8036:
		case 8028:
		case 8033:
		case 8031:
		case 8032:
		case 8030:
		case 8061:
		case 7969:
		case 7967:
		case 7905:
		case 7906:
		case 7907:
		case 7908:
		case 7904:
		case 7902:
		case 7903:
		case 7900:
		case 7901:
		case 7899:
		case 7909:
		case 7911:
		case 7917:
		case 7918:
		case 7919:
		case 7910:
		case 7916:
		case 7914:
		case 7915:
		case 7912:
		case 7913:
		case 7920:
		case 7898:
		case 7896:
		case 7882:
		case 7883:
		case 7884:
		case 7885:
		case 7881:
		case 7879:
		case 7880:
		case 7877:
		case 7878:
		case 7897:
		case 7886:
		case 7888:
		case 7893:
		case 7894:
		case 7895:
		case 7887:
		case 7892:
		case 7890:
		case 7891:
		case 7889:
		case 7968:
		case 7921:
		case 7923:
		case 7952:
		case 7953:
		case 7954:
		case 7955:
		case 7951:
		case 7949:
		case 7950:
		case 7947:
		case 7948:
		case 7946:
		case 7956:
		case 7958:
		case 7964:
		case 7965:
		case 7966:
		case 7957:
		case 7963:
		case 7961:
		case 7962:
		case 7959:
		case 7960:
		case 7922:
		case 7945:
		case 7943:
		case 7929:
		case 7930:
		case 7931:
		case 7932:
		case 7928:
		case 7926:
		case 7927:
		case 7924:
		case 7925:
		case 7944:
		case 7933:
		case 7935:
		case 7940:
		case 7941:
		case 7942:
		case 7934:
		case 7939:
		case 7937:
		case 7938:
		case 7936:
		case 7876:
		case 8062:
		case 8064:
		case 8188:
		case 8189:
		case 8190:
		case 8191:
		case 8187:
		case 8185:
		case 8186:
		case 8183:
		case 8184:
		case 8182:
		case 8192:
		case 8194:
		case 8200:
		case 8201:
		case 8202:
		case 8193:
		case 8199:
		case 8197:
		case 8198:
		case 8195:
		case 8196:
		case 8203:
		case 8181:
		case 8179:
		case 8164:
		case 8165:
		case 8166:
		case 8167:
		case 8163:
		case 8161:
		case 8162:
		case 8159:
		case 8160:
		case 8180:
		case 8168:
		case 8170:
		case 8176:
		case 8177:
		case 8178:
		case 8169:
		case 8174:
		case 8172:
		case 8173:
		case 8171:
		case 8158:
		case 8204:
		case 8206:
		case 8235:
		case 8236:
		case 8237:
		case 8238:
		case 8234:
		case 8232:
		case 8233:
		case 8230:
		case 8231:
		case 8229:
		case 8239:
		case 8241:
		case 8247:
		case 8248:
		case 8249:
		case 8240:
		case 8246:
		case 8244:
		case 8245:
		case 8242:
		case 8243:
		case 8205:
		case 8228:
		case 8226:
		case 8212:
		case 8213:
		case 8214:
		case 8215:
		case 8211:
		case 8209:
		case 8210:
		case 8207:
		case 8208:
		case 8227:
		case 8216:
		case 8218:
		case 8223:
		case 8224:
		case 8225:
		case 8217:
		case 8222:
		case 8220:
		case 8221:
		case 8219:
		case 8063:
		case 8157:
		case 8155:
		case 8093:
		case 8094:
		case 8095:
		case 8096:
		case 8092:
		case 8090:
		case 8091:
		case 8088:
		case 8089:
		case 8087:
		case 8097:
		case 8099:
		case 8105:
		case 8106:
		case 8107:
		case 8098:
		case 8104:
		case 8102:
		case 8103:
		case 8100:
		case 8101:
		case 8108:
		case 8086:
		case 8084:
		case 8070:
		case 8071:
		case 8072:
		case 8073:
		case 8069:
		case 8067:
		case 8068:
		case 8065:
		case 8066:
		case 8085:
		case 8074:
		case 8076:
		case 8081:
		case 8082:
		case 8083:
		case 8075:
		case 8080:
		case 8078:
		case 8079:
		case 8077:
		case 8156:
		case 8109:
		case 8111:
		case 8140:
		case 8141:
		case 8142:
		case 8143:
		case 8139:
		case 8137:
		case 8138:
		case 8135:
		case 8136:
		case 8134:
		case 8144:
		case 8146:
		case 8152:
		case 8153:
		case 8154:
		case 8145:
		case 8151:
		case 8149:
		case 8150:
		case 8147:
		case 8148:
		case 8110:
		case 8133:
		case 8131:
		case 8117:
		case 8118:
		case 8119:
		case 8120:
		case 8116:
		case 8114:
		case 8115:
		case 8112:
		case 8113:
		case 8132:
		case 8121:
		case 8123:
		case 8128:
		case 8129:
		case 8130:
		case 8122:
		case 8127:
		case 8125:
		case 8126:
		case 8124:
		case 8250:
		case 7875:
		case 7873:
		case 7624:
		case 7625:
		case 7626:
		case 7627:
		case 7623:
		case 7621:
		case 7622:
		case 7619:
		case 7620:
		case 7618:
		case 7628:
		case 7630:
		case 7636:
		case 7637:
		case 7638:
		case 7629:
		case 7635:
		case 7633:
		case 7634:
		case 7631:
		case 7632:
		case 7639:
		case 7617:
		case 7615:
		case 7601:
		case 7602:
		case 7603:
		case 7604:
		case 7600:
		case 7598:
		case 7599:
		case 7596:
		case 7597:
		case 7616:
		case 7605:
		case 7607:
		case 7612:
		case 7613:
		case 7614:
		case 7606:
		case 7611:
		case 7609:
		case 7610:
		case 7608:
		case 7595:
		case 7640:
		case 7642:
		case 7671:
		case 7672:
		case 7673:
		case 7674:
		case 7670:
		case 7668:
		case 7669:
		case 7666:
		case 7667:
		case 7665:
		case 7675:
		case 7677:
		case 7683:
		case 7684:
		case 7685:
		case 7676:
		case 7682:
		case 7680:
		case 7681:
		case 7678:
		case 7679:
		case 7641:
		case 7664:
		case 7662:
		case 7648:
		case 7649:
		case 7650:
		case 7651:
		case 7647:
		case 7645:
		case 7646:
		case 7643:
		case 7644:
		case 7663:
		case 7652:
		case 7654:
		case 7659:
		case 7660:
		case 7661:
		case 7653:
		case 7658:
		case 7656:
		case 7657:
		case 7655:
		case 7686:
		case 7594:
		case 7592:
		case 7530:
		case 7531:
		case 7532:
		case 7533:
		case 7529:
		case 7527:
		case 7528:
		case 7525:
		case 7526:
		case 7524:
		case 7534:
		case 7536:
		case 7542:
		case 7543:
		case 7544:
		case 7535:
		case 7541:
		case 7539:
		case 7540:
		case 7537:
		case 7538:
		case 7545:
		case 7523:
		case 7521:
		case 7507:
		case 7508:
		case 7509:
		case 7510:
		case 7506:
		case 7504:
		case 7505:
		case 7502:
		case 7503:
		case 7522:
		case 7511:
		case 7513:
		case 7518:
		case 7519:
		case 7520:
		case 7512:
		case 7517:
		case 7515:
		case 7516:
		case 7514:
		case 7593:
		case 7546:
		case 7548:
		case 7577:
		case 7578:
		case 7579:
		case 7580:
		case 7576:
		case 7574:
		case 7575:
		case 7572:
		case 7573:
		case 7571:
		case 7581:
		case 7583:
		case 7589:
		case 7590:
		case 7591:
		case 7582:
		case 7588:
		case 7586:
		case 7587:
		case 7584:
		case 7585:
		case 7547:
		case 7570:
		case 7568:
		case 7554:
		case 7555:
		case 7556:
		case 7557:
		case 7553:
		case 7551:
		case 7552:
		case 7549:
		case 7550:
		case 7569:
		case 7558:
		case 7560:
		case 7565:
		case 7566:
		case 7567:
		case 7559:
		case 7564:
		case 7562:
		case 7563:
		case 7561:
		case 7874:
		case 7687:
		case 7689:
		case 7811:
		case 7812:
		case 7813:
		case 7814:
		case 7810:
		case 7808:
		case 7809:
		case 7806:
		case 7807:
		case 7805:
		case 7815:
		case 7817:
		case 7823:
		case 7824:
		case 7825:
		case 7816:
		case 7822:
		case 7820:
		case 7821:
		case 7818:
		case 7819:
		case 7826:
		case 7804:
		case 7802:
		case 7788:
		case 7789:
		case 7790:
		case 7791:
		case 7787:
		case 7785:
		case 7786:
		case 7783:
		case 7784:
		case 7803:
		case 7792:
		case 7794:
		case 7799:
		case 7800:
		case 7801:
		case 7793:
		case 7798:
		case 7796:
		case 7797:
		case 7795:
		case 7782:
		case 7827:
		case 7829:
		case 7858:
		case 7859:
		case 7860:
		case 7861:
		case 7857:
		case 7855:
		case 7856:
		case 7853:
		case 7854:
		case 7852:
		case 7862:
		case 7864:
		case 7870:
		case 7871:
		case 7872:
		case 7863:
		case 7869:
		case 7867:
		case 7868:
		case 7865:
		case 7866:
		case 7828:
		case 7851:
		case 7849:
		case 7835:
		case 7836:
		case 7837:
		case 7838:
		case 7834:
		case 7832:
		case 7833:
		case 7830:
		case 7831:
		case 7850:
		case 7839:
		case 7841:
		case 7846:
		case 7847:
		case 7848:
		case 7840:
		case 7845:
		case 7843:
		case 7844:
		case 7842:
		case 7688:
		case 7781:
		case 7779:
		case 7718:
		case 7719:
		case 7720:
		case 7721:
		case 7717:
		case 7715:
		case 7716:
		case 7713:
		case 7714:
		case 7712:
		case 7722:
		case 7724:
		case 7730:
		case 7731:
		case 7732:
		case 7723:
		case 7729:
		case 7727:
		case 7728:
		case 7725:
		case 7726:
		case 7733:
		case 7711:
		case 7709:
		case 7695:
		case 7696:
		case 7697:
		case 7698:
		case 7694:
		case 7692:
		case 7693:
		case 7690:
		case 7691:
		case 7710:
		case 7699:
		case 7701:
		case 7706:
		case 7707:
		case 7708:
		case 7700:
		case 7705:
		case 7703:
		case 7704:
		case 7702:
		case 7780:
		case 7734:
		case 7736:
		case 7765:
		case 7766:
		case 7767:
		case 7768:
		case 7764:
		case 7762:
		case 7763:
		case 7760:
		case 7761:
		case 7759:
		case 7769:
		case 7771:
		case 7776:
		case 7777:
		case 7778:
		case 7770:
		case 7775:
		case 7773:
		case 7774:
		case 7772:
		case 7735:
		case 7758:
		case 7756:
		case 7742:
		case 7743:
		case 7744:
		case 7745:
		case 7741:
		case 7739:
		case 7740:
		case 7737:
		case 7738:
		case 7757:
		case 7746:
		case 7748:
		case 7753:
		case 7754:
		case 7755:
		case 7747:
		case 7752:
		case 7750:
		case 7751:
		case 7749:
		case 7501:
		case 8251:
		case 8253:
		case 8751:
		case 8752:
		case 8753:
		case 8754:
		case 8750:
		case 8748:
		case 8749:
		case 8746:
		case 8747:
		case 8745:
		case 8755:
		case 8757:
		case 8763:
		case 8764:
		case 8765:
		case 8756:
		case 8762:
		case 8760:
		case 8761:
		case 8758:
		case 8759:
		case 8766:
		case 8744:
		case 8742:
		case 8728:
		case 8729:
		case 8730:
		case 8731:
		case 8727:
		case 8725:
		case 8726:
		case 8723:
		case 8724:
		case 8743:
		case 8732:
		case 8734:
		case 8739:
		case 8740:
		case 8741:
		case 8733:
		case 8738:
		case 8736:
		case 8737:
		case 8735:
		case 8722:
		case 8767:
		case 8769:
		case 8798:
		case 8799:
		case 8800:
		case 8801:
		case 8797:
		case 8795:
		case 8796:
		case 8793:
		case 8794:
		case 8792:
		case 8802:
		case 8804:
		case 8810:
		case 8811:
		case 8812:
		case 8803:
		case 8809:
		case 8807:
		case 8808:
		case 8805:
		case 8806:
		case 8768:
		case 8791:
		case 8789:
		case 8775:
		case 8776:
		case 8777:
		case 8778:
		case 8774:
		case 8772:
		case 8773:
		case 8770:
		case 8771:
		case 8790:
		case 8779:
		case 8781:
		case 8786:
		case 8787:
		case 8788:
		case 8780:
		case 8785:
		case 8783:
		case 8784:
		case 8782:
		case 8813:
		case 8721:
		case 8719:
		case 8657:
		case 8658:
		case 8659:
		case 8660:
		case 8656:
		case 8654:
		case 8655:
		case 8652:
		case 8653:
		case 8651:
		case 8661:
		case 8663:
		case 8669:
		case 8670:
		case 8671:
		case 8662:
		case 8668:
		case 8666:
		case 8667:
		case 8664:
		case 8665:
		case 8672:
		case 8650:
		case 8648:
		case 8634:
		case 8635:
		case 8636:
		case 8637:
		case 8633:
		case 8631:
		case 8632:
		case 8629:
		case 8630:
		case 8649:
		case 8638:
		case 8640:
		case 8645:
		case 8646:
		case 8647:
		case 8639:
		case 8644:
		case 8642:
		case 8643:
		case 8641:
		case 8720:
		case 8673:
		case 8675:
		case 8704:
		case 8705:
		case 8706:
		case 8707:
		case 8703:
		case 8701:
		case 8702:
		case 8699:
		case 8700:
		case 8698:
		case 8708:
		case 8710:
		case 8716:
		case 8717:
		case 8718:
		case 8709:
		case 8715:
		case 8713:
		case 8714:
		case 8711:
		case 8712:
		case 8674:
		case 8697:
		case 8695:
		case 8681:
		case 8682:
		case 8683:
		case 8684:
		case 8680:
		case 8678:
		case 8679:
		case 8676:
		case 8677:
		case 8696:
		case 8685:
		case 8687:
		case 8692:
		case 8693:
		case 8694:
		case 8686:
		case 8691:
		case 8689:
		case 8690:
		case 8688:
		case 8628:
		case 8814:
		case 8816:
		case 8938:
		case 8939:
		case 8940:
		case 8941:
		case 8937:
		case 8935:
		case 8936:
		case 8933:
		case 8934:
		case 8932:
		case 8942:
		case 8944:
		case 8950:
		case 8951:
		case 8952:
		case 8943:
		case 8949:
		case 8947:
		case 8948:
		case 8945:
		case 8946:
		case 8953:
		case 8931:
		case 8929:
		case 8915:
		case 8916:
		case 8917:
		case 8918:
		case 8914:
		case 8912:
		case 8913:
		case 8910:
		case 8911:
		case 8930:
		case 8919:
		case 8921:
		case 8926:
		case 8927:
		case 8928:
		case 8920:
		case 8925:
		case 8923:
		case 8924:
		case 8922:
		case 8909:
		case 8954:
		case 8956:
		case 8985:
		case 8986:
		case 8987:
		case 8988:
		case 8984:
		case 8982:
		case 8983:
		case 8980:
		case 8981:
		case 8979:
		case 8989:
		case 8991:
		case 8997:
		case 8998:
		case 8999:
		case 8990:
		case 8996:
		case 8994:
		case 8995:
		case 8992:
		case 8993:
		case 8955:
		case 8978:
		case 8976:
		case 8962:
		case 8963:
		case 8964:
		case 8965:
		case 8961:
		case 8959:
		case 8960:
		case 8957:
		case 8958:
		case 8977:
		case 8966:
		case 8968:
		case 8973:
		case 8974:
		case 8975:
		case 8967:
		case 8972:
		case 8970:
		case 8971:
		case 8969:
		case 8815:
		case 8908:
		case 8906:
		case 8845:
		case 8846:
		case 8847:
		case 8848:
		case 8844:
		case 8842:
		case 8843:
		case 8840:
		case 8841:
		case 8839:
		case 8849:
		case 8851:
		case 8857:
		case 8858:
		case 8859:
		case 8850:
		case 8856:
		case 8854:
		case 8855:
		case 8852:
		case 8853:
		case 8860:
		case 8838:
		case 8836:
		case 8822:
		case 8823:
		case 8824:
		case 8825:
		case 8821:
		case 8819:
		case 8820:
		case 8817:
		case 8818:
		case 8837:
		case 8826:
		case 8828:
		case 8833:
		case 8834:
		case 8835:
		case 8827:
		case 8832:
		case 8830:
		case 8831:
		case 8829:
		case 8907:
		case 8861:
		case 8863:
		case 8892:
		case 8893:
		case 8894:
		case 8895:
		case 8891:
		case 8889:
		case 8890:
		case 8887:
		case 8888:
		case 8886:
		case 8896:
		case 8898:
		case 8903:
		case 8904:
		case 8905:
		case 8897:
		case 8902:
		case 8900:
		case 8901:
		case 8899:
		case 8862:
		case 8885:
		case 8883:
		case 8869:
		case 8870:
		case 8871:
		case 8872:
		case 8868:
		case 8866:
		case 8867:
		case 8864:
		case 8865:
		case 8884:
		case 8873:
		case 8875:
		case 8880:
		case 8881:
		case 8882:
		case 8874:
		case 8879:
		case 8877:
		case 8878:
		case 8876:
		case 8252:
		case 8627:
		case 8625:
		case 8376:
		case 8377:
		case 8378:
		case 8379:
		case 8375:
		case 8373:
		case 8374:
		case 8371:
		case 8372:
		case 8370:
		case 8380:
		case 8382:
		case 8388:
		case 8389:
		case 8390:
		case 8381:
		case 8387:
		case 8385:
		case 8386:
		case 8383:
		case 8384:
		case 8391:
		case 8369:
		case 8367:
		case 8353:
		case 8354:
		case 8355:
		case 8356:
		case 8352:
		case 8350:
		case 8351:
		case 8348:
		case 8349:
		case 8368:
		case 8357:
		case 8359:
		case 8364:
		case 8365:
		case 8366:
		case 8358:
		case 8363:
		case 8361:
		case 8362:
		case 8360:
		case 8347:
		case 8392:
		case 8394:
		case 8423:
		case 8424:
		case 8425:
		case 8426:
		case 8422:
		case 8420:
		case 8421:
		case 8418:
		case 8419:
		case 8417:
		case 8427:
		case 8429:
		case 8435:
		case 8436:
		case 8437:
		case 8428:
		case 8434:
		case 8432:
		case 8433:
		case 8430:
		case 8431:
		case 8393:
		case 8416:
		case 8414:
		case 8400:
		case 8401:
		case 8402:
		case 8403:
		case 8399:
		case 8397:
		case 8398:
		case 8395:
		case 8396:
		case 8415:
		case 8404:
		case 8406:
		case 8411:
		case 8412:
		case 8413:
		case 8405:
		case 8410:
		case 8408:
		case 8409:
		case 8407:
		case 8438:
		case 8346:
		case 8344:
		case 8282:
		case 8283:
		case 8284:
		case 8285:
		case 8281:
		case 8279:
		case 8280:
		case 8277:
		case 8278:
		case 8276:
		case 8286:
		case 8288:
		case 8294:
		case 8295:
		case 8296:
		case 8287:
		case 8293:
		case 8291:
		case 8292:
		case 8289:
		case 8290:
		case 8297:
		case 8275:
		case 8273:
		case 8259:
		case 8260:
		case 8261:
		case 8262:
		case 8258:
		case 8256:
		case 8257:
		case 8254:
		case 8255:
		case 8274:
		case 8263:
		case 8265:
		case 8270:
		case 8271:
		case 8272:
		case 8264:
		case 8269:
		case 8267:
		case 8268:
		case 8266:
		case 8345:
		case 8298:
		case 8300:
		case 8329:
		case 8330:
		case 8331:
		case 8332:
		case 8328:
		case 8326:
		case 8327:
		case 8324:
		case 8325:
		case 8323:
		case 8333:
		case 8335:
		case 8341:
		case 8342:
		case 8343:
		case 8334:
		case 8340:
		case 8338:
		case 8339:
		case 8336:
		case 8337:
		case 8299:
		case 8322:
		case 8320:
		case 8306:
		case 8307:
		case 8308:
		case 8309:
		case 8305:
		case 8303:
		case 8304:
		case 8301:
		case 8302:
		case 8321:
		case 8310:
		case 8312:
		case 8317:
		case 8318:
		case 8319:
		case 8311:
		case 8316:
		case 8314:
		case 8315:
		case 8313:
		case 8626:
		case 8439:
		case 8441:
		case 8563:
		case 8564:
		case 8565:
		case 8566:
		case 8562:
		case 8560:
		case 8561:
		case 8558:
		case 8559:
		case 8557:
		case 8567:
		case 8569:
		case 8575:
		case 8576:
		case 8577:
		case 8568:
		case 8574:
		case 8572:
		case 8573:
		case 8570:
		case 8571:
		case 8578:
		case 8556:
		case 8554:
		case 8540:
		case 8541:
		case 8542:
		case 8543:
		case 8539:
		case 8537:
		case 8538:
		case 8535:
		case 8536:
		case 8555:
		case 8544:
		case 8546:
		case 8551:
		case 8552:
		case 8553:
		case 8545:
		case 8550:
		case 8548:
		case 8549:
		case 8547:
		case 8534:
		case 8579:
		case 8581:
		case 8610:
		case 8611:
		case 8612:
		case 8613:
		case 8609:
		case 8607:
		case 8608:
		case 8605:
		case 8606:
		case 8604:
		case 8614:
		case 8616:
		case 8622:
		case 8623:
		case 8624:
		case 8615:
		case 8621:
		case 8619:
		case 8620:
		case 8617:
		case 8618:
		case 8580:
		case 8603:
		case 8601:
		case 8587:
		case 8588:
		case 8589:
		case 8590:
		case 8586:
		case 8584:
		case 8585:
		case 8582:
		case 8583:
		case 8602:
		case 8591:
		case 8593:
		case 8598:
		case 8599:
		case 8600:
		case 8592:
		case 8597:
		case 8595:
		case 8596:
		case 8594:
		case 8440:
		case 8533:
		case 8531:
		case 8470:
		case 8471:
		case 8472:
		case 8473:
		case 8469:
		case 8467:
		case 8468:
		case 8465:
		case 8466:
		case 8464:
		case 8474:
		case 8476:
		case 8482:
		case 8483:
		case 8484:
		case 8475:
		case 8481:
		case 8479:
		case 8480:
		case 8477:
		case 8478:
		case 8485:
		case 8463:
		case 8461:
		case 8447:
		case 8448:
		case 8449:
		case 8450:
		case 8446:
		case 8444:
		case 8445:
		case 8442:
		case 8443:
		case 8462:
		case 8451:
		case 8453:
		case 8458:
		case 8459:
		case 8460:
		case 8452:
		case 8457:
		case 8455:
		case 8456:
		case 8454:
		case 8532:
		case 8486:
		case 8488:
		case 8517:
		case 8518:
		case 8519:
		case 8520:
		case 8516:
		case 8514:
		case 8515:
		case 8512:
		case 8513:
		case 8511:
		case 8521:
		case 8523:
		case 8528:
		case 8529:
		case 8530:
		case 8522:
		case 8527:
		case 8525:
		case 8526:
		case 8524:
		case 8487:
		case 8510:
		case 8508:
		case 8494:
		case 8495:
		case 8496:
		case 8497:
		case 8493:
		case 8491:
		case 8492:
		case 8489:
		case 8490:
		case 8509:
		case 8498:
		case 8500:
		case 8505:
		case 8506:
		case 8507:
		case 8499:
		case 8504:
		case 8502:
		case 8503:
		case 8501:
		case 9000:
		case 7500:
		case 7498:
		case 6499:
		case 6500:
		case 6501:
		case 6502:
		case 6498:
		case 6496:
		case 6497:
		case 6494:
		case 6495:
		case 6493:
		case 6503:
		case 6505:
		case 6511:
		case 6512:
		case 6513:
		case 6504:
		case 6510:
		case 6508:
		case 6509:
		case 6506:
		case 6507:
		case 6514:
		case 6492:
		case 6490:
		case 6476:
		case 6477:
		case 6478:
		case 6479:
		case 6475:
		case 6473:
		case 6474:
		case 6471:
		case 6472:
		case 6491:
		case 6480:
		case 6482:
		case 6487:
		case 6488:
		case 6489:
		case 6481:
		case 6486:
		case 6484:
		case 6485:
		case 6483:
		case 6470:
		case 6515:
		case 6517:
		case 6546:
		case 6547:
		case 6548:
		case 6549:
		case 6545:
		case 6543:
		case 6544:
		case 6541:
		case 6542:
		case 6540:
		case 6550:
		case 6552:
		case 6558:
		case 6559:
		case 6560:
		case 6551:
		case 6557:
		case 6555:
		case 6556:
		case 6553:
		case 6554:
		case 6516:
		case 6539:
		case 6537:
		case 6523:
		case 6524:
		case 6525:
		case 6526:
		case 6522:
		case 6520:
		case 6521:
		case 6518:
		case 6519:
		case 6538:
		case 6527:
		case 6529:
		case 6534:
		case 6535:
		case 6536:
		case 6528:
		case 6533:
		case 6531:
		case 6532:
		case 6530:
		case 6561:
		case 6469:
		case 6467:
		case 6405:
		case 6406:
		case 6407:
		case 6408:
		case 6404:
		case 6402:
		case 6403:
		case 6400:
		case 6401:
		case 6399:
		case 6409:
		case 6411:
		case 6417:
		case 6418:
		case 6419:
		case 6410:
		case 6416:
		case 6414:
		case 6415:
		case 6412:
		case 6413:
		case 6420:
		case 6398:
		case 6396:
		case 6382:
		case 6383:
		case 6384:
		case 6385:
		case 6381:
		case 6379:
		case 6380:
		case 6377:
		case 6378:
		case 6397:
		case 6386:
		case 6388:
		case 6393:
		case 6394:
		case 6395:
		case 6387:
		case 6392:
		case 6390:
		case 6391:
		case 6389:
		case 6468:
		case 6421:
		case 6423:
		case 6452:
		case 6453:
		case 6454:
		case 6455:
		case 6451:
		case 6449:
		case 6450:
		case 6447:
		case 6448:
		case 6446:
		case 6456:
		case 6458:
		case 6464:
		case 6465:
		case 6466:
		case 6457:
		case 6463:
		case 6461:
		case 6462:
		case 6459:
		case 6460:
		case 6422:
		case 6445:
		case 6443:
		case 6429:
		case 6430:
		case 6431:
		case 6432:
		case 6428:
		case 6426:
		case 6427:
		case 6424:
		case 6425:
		case 6444:
		case 6433:
		case 6435:
		case 6440:
		case 6441:
		case 6442:
		case 6434:
		case 6439:
		case 6437:
		case 6438:
		case 6436:
		case 6376:
		case 6562:
		case 6564:
		case 6686:
		case 6687:
		case 6688:
		case 6689:
		case 6685:
		case 6683:
		case 6684:
		case 6681:
		case 6682:
		case 6680:
		case 6690:
		case 6692:
		case 6698:
		case 6699:
		case 6700:
		case 6691:
		case 6697:
		case 6695:
		case 6696:
		case 6693:
		case 6694:
		case 6701:
		case 6679:
		case 6677:
		case 6663:
		case 6664:
		case 6665:
		case 6666:
		case 6662:
		case 6660:
		case 6661:
		case 6658:
		case 6659:
		case 6678:
		case 6667:
		case 6669:
		case 6674:
		case 6675:
		case 6676:
		case 6668:
		case 6673:
		case 6671:
		case 6672:
		case 6670:
		case 6657:
		case 6702:
		case 6704:
		case 6733:
		case 6734:
		case 6735:
		case 6736:
		case 6732:
		case 6730:
		case 6731:
		case 6728:
		case 6729:
		case 6727:
		case 6737:
		case 6739:
		case 6745:
		case 6746:
		case 6747:
		case 6738:
		case 6744:
		case 6742:
		case 6743:
		case 6740:
		case 6741:
		case 6703:
		case 6726:
		case 6724:
		case 6710:
		case 6711:
		case 6712:
		case 6713:
		case 6709:
		case 6707:
		case 6708:
		case 6705:
		case 6706:
		case 6725:
		case 6714:
		case 6716:
		case 6721:
		case 6722:
		case 6723:
		case 6715:
		case 6720:
		case 6718:
		case 6719:
		case 6717:
		case 6563:
		case 6656:
		case 6654:
		case 6593:
		case 6594:
		case 6595:
		case 6596:
		case 6592:
		case 6590:
		case 6591:
		case 6588:
		case 6589:
		case 6587:
		case 6597:
		case 6599:
		case 6605:
		case 6606:
		case 6607:
		case 6598:
		case 6604:
		case 6602:
		case 6603:
		case 6600:
		case 6601:
		case 6608:
		case 6586:
		case 6584:
		case 6570:
		case 6571:
		case 6572:
		case 6573:
		case 6569:
		case 6567:
		case 6568:
		case 6565:
		case 6566:
		case 6585:
		case 6574:
		case 6576:
		case 6581:
		case 6582:
		case 6583:
		case 6575:
		case 6580:
		case 6578:
		case 6579:
		case 6577:
		case 6655:
		case 6609:
		case 6611:
		case 6640:
		case 6641:
		case 6642:
		case 6643:
		case 6639:
		case 6637:
		case 6638:
		case 6635:
		case 6636:
		case 6634:
		case 6644:
		case 6646:
		case 6651:
		case 6652:
		case 6653:
		case 6645:
		case 6650:
		case 6648:
		case 6649:
		case 6647:
		case 6610:
		case 6633:
		case 6631:
		case 6617:
		case 6618:
		case 6619:
		case 6620:
		case 6616:
		case 6614:
		case 6615:
		case 6612:
		case 6613:
		case 6632:
		case 6621:
		case 6623:
		case 6628:
		case 6629:
		case 6630:
		case 6622:
		case 6627:
		case 6625:
		case 6626:
		case 6624:
		case 6748:
		case 6375:
		case 6373:
		case 6124:
		case 6125:
		case 6126:
		case 6127:
		case 6123:
		case 6121:
		case 6122:
		case 6119:
		case 6120:
		case 6118:
		case 6128:
		case 6130:
		case 6136:
		case 6137:
		case 6138:
		case 6129:
		case 6135:
		case 6133:
		case 6134:
		case 6131:
		case 6132:
		case 6139:
		case 6117:
		case 6115:
		case 6101:
		case 6102:
		case 6103:
		case 6104:
		case 6100:
		case 6098:
		case 6099:
		case 6096:
		case 6097:
		case 6116:
		case 6105:
		case 6107:
		case 6112:
		case 6113:
		case 6114:
		case 6106:
		case 6111:
		case 6109:
		case 6110:
		case 6108:
		case 6095:
		case 6140:
		case 6142:
		case 6171:
		case 6172:
		case 6173:
		case 6174:
		case 6170:
		case 6168:
		case 6169:
		case 6166:
		case 6167:
		case 6165:
		case 6175:
		case 6177:
		case 6183:
		case 6184:
		case 6185:
		case 6176:
		case 6182:
		case 6180:
		case 6181:
		case 6178:
		case 6179:
		case 6141:
		case 6164:
		case 6162:
		case 6148:
		case 6149:
		case 6150:
		case 6151:
		case 6147:
		case 6145:
		case 6146:
		case 6143:
		case 6144:
		case 6163:
		case 6152:
		case 6154:
		case 6159:
		case 6160:
		case 6161:
		case 6153:
		case 6158:
		case 6156:
		case 6157:
		case 6155:
		case 6186:
		case 6094:
		case 6092:
		case 6030:
		case 6031:
		case 6032:
		case 6033:
		case 6029:
		case 6027:
		case 6028:
		case 6025:
		case 6026:
		case 6024:
		case 6034:
		case 6036:
		case 6042:
		case 6043:
		case 6044:
		case 6035:
		case 6041:
		case 6039:
		case 6040:
		case 6037:
		case 6038:
		case 6045:
		case 6023:
		case 6021:
		case 6007:
		case 6008:
		case 6009:
		case 6010:
		case 6006:
		case 6004:
		case 6005:
		case 6002:
		case 6003:
		case 6022:
		case 6011:
		case 6013:
		case 6018:
		case 6019:
		case 6020:
		case 6012:
		case 6017:
		case 6015:
		case 6016:
		case 6014:
		case 6093:
		case 6046:
		case 6048:
		case 6077:
		case 6078:
		case 6079:
		case 6080:
		case 6076:
		case 6074:
		case 6075:
		case 6072:
		case 6073:
		case 6071:
		case 6081:
		case 6083:
		case 6089:
		case 6090:
		case 6091:
		case 6082:
		case 6088:
		case 6086:
		case 6087:
		case 6084:
		case 6085:
		case 6047:
		case 6070:
		case 6068:
		case 6054:
		case 6055:
		case 6056:
		case 6057:
		case 6053:
		case 6051:
		case 6052:
		case 6049:
		case 6050:
		case 6069:
		case 6058:
		case 6060:
		case 6065:
		case 6066:
		case 6067:
		case 6059:
		case 6064:
		case 6062:
		case 6063:
		case 6061:
		case 6374:
		case 6187:
		case 6189:
		case 6311:
		case 6312:
		case 6313:
		case 6314:
		case 6310:
		case 6308:
		case 6309:
		case 6306:
		case 6307:
		case 6305:
		case 6315:
		case 6317:
		case 6323:
		case 6324:
		case 6325:
		case 6316:
		case 6322:
		case 6320:
		case 6321:
		case 6318:
		case 6319:
		case 6326:
		case 6304:
		case 6302:
		case 6288:
		case 6289:
		case 6290:
		case 6291:
		case 6287:
		case 6285:
		case 6286:
		case 6283:
		case 6284:
		case 6303:
		case 6292:
		case 6294:
		case 6299:
		case 6300:
		case 6301:
		case 6293:
		case 6298:
		case 6296:
		case 6297:
		case 6295:
		case 6282:
		case 6327:
		case 6329:
		case 6358:
		case 6359:
		case 6360:
		case 6361:
		case 6357:
		case 6355:
		case 6356:
		case 6353:
		case 6354:
		case 6352:
		case 6362:
		case 6364:
		case 6370:
		case 6371:
		case 6372:
		case 6363:
		case 6369:
		case 6367:
		case 6368:
		case 6365:
		case 6366:
		case 6328:
		case 6351:
		case 6349:
		case 6335:
		case 6336:
		case 6337:
		case 6338:
		case 6334:
		case 6332:
		case 6333:
		case 6330:
		case 6331:
		case 6350:
		case 6339:
		case 6341:
		case 6346:
		case 6347:
		case 6348:
		case 6340:
		case 6345:
		case 6343:
		case 6344:
		case 6342:
		case 6188:
		case 6281:
		case 6279:
		case 6218:
		case 6219:
		case 6220:
		case 6221:
		case 6217:
		case 6215:
		case 6216:
		case 6213:
		case 6214:
		case 6212:
		case 6222:
		case 6224:
		case 6230:
		case 6231:
		case 6232:
		case 6223:
		case 6229:
		case 6227:
		case 6228:
		case 6225:
		case 6226:
		case 6233:
		case 6211:
		case 6209:
		case 6195:
		case 6196:
		case 6197:
		case 6198:
		case 6194:
		case 6192:
		case 6193:
		case 6190:
		case 6191:
		case 6210:
		case 6199:
		case 6201:
		case 6206:
		case 6207:
		case 6208:
		case 6200:
		case 6205:
		case 6203:
		case 6204:
		case 6202:
		case 6280:
		case 6234:
		case 6236:
		case 6265:
		case 6266:
		case 6267:
		case 6268:
		case 6264:
		case 6262:
		case 6263:
		case 6260:
		case 6261:
		case 6259:
		case 6269:
		case 6271:
		case 6276:
		case 6277:
		case 6278:
		case 6270:
		case 6275:
		case 6273:
		case 6274:
		case 6272:
		case 6235:
		case 6258:
		case 6256:
		case 6242:
		case 6243:
		case 6244:
		case 6245:
		case 6241:
		case 6239:
		case 6240:
		case 6237:
		case 6238:
		case 6257:
		case 6246:
		case 6248:
		case 6253:
		case 6254:
		case 6255:
		case 6247:
		case 6252:
		case 6250:
		case 6251:
		case 6249:
		case 7499:
		case 6749:
		case 6751:
		case 7249:
		case 7250:
		case 7251:
		case 7252:
		case 7248:
		case 7246:
		case 7247:
		case 7244:
		case 7245:
		case 7243:
		case 7253:
		case 7255:
		case 7261:
		case 7262:
		case 7263:
		case 7254:
		case 7260:
		case 7258:
		case 7259:
		case 7256:
		case 7257:
		case 7264:
		case 7242:
		case 7240:
		case 7226:
		case 7227:
		case 7228:
		case 7229:
		case 7225:
		case 7223:
		case 7224:
		case 7221:
		case 7222:
		case 7241:
		case 7230:
		case 7232:
		case 7237:
		case 7238:
		case 7239:
		case 7231:
		case 7236:
		case 7234:
		case 7235:
		case 7233:
		case 7220:
		case 7265:
		case 7267:
		case 7296:
		case 7297:
		case 7298:
		case 7299:
		case 7295:
		case 7293:
		case 7294:
		case 7291:
		case 7292:
		case 7290:
		case 7300:
		case 7302:
		case 7308:
		case 7309:
		case 7310:
		case 7301:
		case 7307:
		case 7305:
		case 7306:
		case 7303:
		case 7304:
		case 7266:
		case 7289:
		case 7287:
		case 7273:
		case 7274:
		case 7275:
		case 7276:
		case 7272:
		case 7270:
		case 7271:
		case 7268:
		case 7269:
		case 7288:
		case 7277:
		case 7279:
		case 7284:
		case 7285:
		case 7286:
		case 7278:
		case 7283:
		case 7281:
		case 7282:
		case 7280:
		case 7311:
		case 7219:
		case 7217:
		case 7155:
		case 7156:
		case 7157:
		case 7158:
		case 7154:
		case 7152:
		case 7153:
		case 7150:
		case 7151:
		case 7149:
		case 7159:
		case 7161:
		case 7167:
		case 7168:
		case 7169:
		case 7160:
		case 7166:
		case 7164:
		case 7165:
		case 7162:
		case 7163:
		case 7170:
		case 7148:
		case 7146:
		case 7132:
		case 7133:
		case 7134:
		case 7135:
		case 7131:
		case 7129:
		case 7130:
		case 7127:
		case 7128:
		case 7147:
		case 7136:
		case 7138:
		case 7143:
		case 7144:
		case 7145:
		case 7137:
		case 7142:
		case 7140:
		case 7141:
		case 7139:
		case 7218:
		case 7171:
		case 7173:
		case 7202:
		case 7203:
		case 7204:
		case 7205:
		case 7201:
		case 7199:
		case 7200:
		case 7197:
		case 7198:
		case 7196:
		case 7206:
		case 7208:
		case 7214:
		case 7215:
		case 7216:
		case 7207:
		case 7213:
		case 7211:
		case 7212:
		case 7209:
		case 7210:
		case 7172:
		case 7195:
		case 7193:
		case 7179:
		case 7180:
		case 7181:
		case 7182:
		case 7178:
		case 7176:
		case 7177:
		case 7174:
		case 7175:
		case 7194:
		case 7183:
		case 7185:
		case 7190:
		case 7191:
		case 7192:
		case 7184:
		case 7189:
		case 7187:
		case 7188:
		case 7186:
		case 7126:
		case 7312:
		case 7314:
		case 7436:
		case 7437:
		case 7438:
		case 7439:
		case 7435:
		case 7433:
		case 7434:
		case 7431:
		case 7432:
		case 7430:
		case 7440:
		case 7442:
		case 7448:
		case 7449:
		case 7450:
		case 7441:
		case 7447:
		case 7445:
		case 7446:
		case 7443:
		case 7444:
		case 7451:
		case 7429:
		case 7427:
		case 7413:
		case 7414:
		case 7415:
		case 7416:
		case 7412:
		case 7410:
		case 7411:
		case 7408:
		case 7409:
		case 7428:
		case 7417:
		case 7419:
		case 7424:
		case 7425:
		case 7426:
		case 7418:
		case 7423:
		case 7421:
		case 7422:
		case 7420:
		case 7407:
		case 7452:
		case 7454:
		case 7483:
		case 7484:
		case 7485:
		case 7486:
		case 7482:
		case 7480:
		case 7481:
		case 7478:
		case 7479:
		case 7477:
		case 7487:
		case 7489:
		case 7495:
		case 7496:
		case 7497:
		case 7488:
		case 7494:
		case 7492:
		case 7493:
		case 7490:
		case 7491:
		case 7453:
		case 7476:
		case 7474:
		case 7460:
		case 7461:
		case 7462:
		case 7463:
		case 7459:
		case 7457:
		case 7458:
		case 7455:
		case 7456:
		case 7475:
		case 7464:
		case 7466:
		case 7471:
		case 7472:
		case 7473:
		case 7465:
		case 7470:
		case 7468:
		case 7469:
		case 7467:
		case 7313:
		case 7406:
		case 7404:
		case 7343:
		case 7344:
		case 7345:
		case 7346:
		case 7342:
		case 7340:
		case 7341:
		case 7338:
		case 7339:
		case 7337:
		case 7347:
		case 7349:
		case 7355:
		case 7356:
		case 7357:
		case 7348:
		case 7354:
		case 7352:
		case 7353:
		case 7350:
		case 7351:
		case 7358:
		case 7336:
		case 7334:
		case 7320:
		case 7321:
		case 7322:
		case 7323:
		case 7319:
		case 7317:
		case 7318:
		case 7315:
		case 7316:
		case 7335:
		case 7324:
		case 7326:
		case 7331:
		case 7332:
		case 7333:
		case 7325:
		case 7330:
		case 7328:
		case 7329:
		case 7327:
		case 7405:
		case 7359:
		case 7361:
		case 7390:
		case 7391:
		case 7392:
		case 7393:
		case 7389:
		case 7387:
		case 7388:
		case 7385:
		case 7386:
		case 7384:
		case 7394:
		case 7396:
		case 7401:
		case 7402:
		case 7403:
		case 7395:
		case 7400:
		case 7398:
		case 7399:
		case 7397:
		case 7360:
		case 7383:
		case 7381:
		case 7367:
		case 7368:
		case 7369:
		case 7370:
		case 7366:
		case 7364:
		case 7365:
		case 7362:
		case 7363:
		case 7382:
		case 7371:
		case 7373:
		case 7378:
		case 7379:
		case 7380:
		case 7372:
		case 7377:
		case 7375:
		case 7376:
		case 7374:
		case 6750:
		case 7125:
		case 7123:
		case 6874:
		case 6875:
		case 6876:
		case 6877:
		case 6873:
		case 6871:
		case 6872:
		case 6869:
		case 6870:
		case 6868:
		case 6878:
		case 6880:
		case 6886:
		case 6887:
		case 6888:
		case 6879:
		case 6885:
		case 6883:
		case 6884:
		case 6881:
		case 6882:
		case 6889:
		case 6867:
		case 6865:
		case 6851:
		case 6852:
		case 6853:
		case 6854:
		case 6850:
		case 6848:
		case 6849:
		case 6846:
		case 6847:
		case 6866:
		case 6855:
		case 6857:
		case 6862:
		case 6863:
		case 6864:
		case 6856:
		case 6861:
		case 6859:
		case 6860:
		case 6858:
		case 6845:
		case 6890:
		case 6892:
		case 6921:
		case 6922:
		case 6923:
		case 6924:
		case 6920:
		case 6918:
		case 6919:
		case 6916:
		case 6917:
		case 6915:
		case 6925:
		case 6927:
		case 6933:
		case 6934:
		case 6935:
		case 6926:
		case 6932:
		case 6930:
		case 6931:
		case 6928:
		case 6929:
		case 6891:
		case 6914:
		case 6912:
		case 6898:
		case 6899:
		case 6900:
		case 6901:
		case 6897:
		case 6895:
		case 6896:
		case 6893:
		case 6894:
		case 6913:
		case 6902:
		case 6904:
		case 6909:
		case 6910:
		case 6911:
		case 6903:
		case 6908:
		case 6906:
		case 6907:
		case 6905:
		case 6936:
		case 6844:
		case 6842:
		case 6780:
		case 6781:
		case 6782:
		case 6783:
		case 6779:
		case 6777:
		case 6778:
		case 6775:
		case 6776:
		case 6774:
		case 6784:
		case 6786:
		case 6792:
		case 6793:
		case 6794:
		case 6785:
		case 6791:
		case 6789:
		case 6790:
		case 6787:
		case 6788:
		case 6795:
		case 6773:
		case 6771:
		case 6757:
		case 6758:
		case 6759:
		case 6760:
		case 6756:
		case 6754:
		case 6755:
		case 6752:
		case 6753:
		case 6772:
		case 6761:
		case 6763:
		case 6768:
		case 6769:
		case 6770:
		case 6762:
		case 6767:
		case 6765:
		case 6766:
		case 6764:
		case 6843:
		case 6796:
		case 6798:
		case 6827:
		case 6828:
		case 6829:
		case 6830:
		case 6826:
		case 6824:
		case 6825:
		case 6822:
		case 6823:
		case 6821:
		case 6831:
		case 6833:
		case 6839:
		case 6840:
		case 6841:
		case 6832:
		case 6838:
		case 6836:
		case 6837:
		case 6834:
		case 6835:
		case 6797:
		case 6820:
		case 6818:
		case 6804:
		case 6805:
		case 6806:
		case 6807:
		case 6803:
		case 6801:
		case 6802:
		case 6799:
		case 6800:
		case 6819:
		case 6808:
		case 6810:
		case 6815:
		case 6816:
		case 6817:
		case 6809:
		case 6814:
		case 6812:
		case 6813:
		case 6811:
		case 7124:
		case 6937:
		case 6939:
		case 7061:
		case 7062:
		case 7063:
		case 7064:
		case 7060:
		case 7058:
		case 7059:
		case 7056:
		case 7057:
		case 7055:
		case 7065:
		case 7067:
		case 7073:
		case 7074:
		case 7075:
		case 7066:
		case 7072:
		case 7070:
		case 7071:
		case 7068:
		case 7069:
		case 7076:
		case 7054:
		case 7052:
		case 7038:
		case 7039:
		case 7040:
		case 7041:
		case 7037:
		case 7035:
		case 7036:
		case 7033:
		case 7034:
		case 7053:
		case 7042:
		case 7044:
		case 7049:
		case 7050:
		case 7051:
		case 7043:
		case 7048:
		case 7046:
		case 7047:
		case 7045:
		case 7032:
		case 7077:
		case 7079:
		case 7108:
		case 7109:
		case 7110:
		case 7111:
		case 7107:
		case 7105:
		case 7106:
		case 7103:
		case 7104:
		case 7102:
		case 7112:
		case 7114:
		case 7120:
		case 7121:
		case 7122:
		case 7113:
		case 7119:
		case 7117:
		case 7118:
		case 7115:
		case 7116:
		case 7078:
		case 7101:
		case 7099:
		case 7085:
		case 7086:
		case 7087:
		case 7088:
		case 7084:
		case 7082:
		case 7083:
		case 7080:
		case 7081:
		case 7100:
		case 7089:
		case 7091:
		case 7096:
		case 7097:
		case 7098:
		case 7090:
		case 7095:
		case 7093:
		case 7094:
		case 7092:
		case 6938:
		case 7031:
		case 7029:
		case 6968:
		case 6969:
		case 6970:
		case 6971:
		case 6967:
		case 6965:
		case 6966:
		case 6963:
		case 6964:
		case 6962:
		case 6972:
		case 6974:
		case 6980:
		case 6981:
		case 6982:
		case 6973:
		case 6979:
		case 6977:
		case 6978:
		case 6975:
		case 6976:
		case 6983:
		case 6961:
		case 6959:
		case 6945:
		case 6946:
		case 6947:
		case 6948:
		case 6944:
		case 6942:
		case 6943:
		case 6940:
		case 6941:
		case 6960:
		case 6949:
		case 6951:
		case 6956:
		case 6957:
		case 6958:
		case 6950:
		case 6955:
		case 6953:
		case 6954:
		case 6952:
		case 7030:
		case 6984:
		case 6986:
		case 7015:
		case 7016:
		case 7017:
		case 7018:
		case 7014:
		case 7012:
		case 7013:
		case 7010:
		case 7011:
		case 7009:
		case 7019:
		case 7021:
		case 7026:
		case 7027:
		case 7028:
		case 7020:
		case 7025:
		case 7023:
		case 7024:
		case 7022:
		case 6985:
		case 7008:
		case 7006:
		case 6992:
		case 6993:
		case 6994:
		case 6995:
		case 6991:
		case 6989:
		case 6990:
		case 6987:
		case 6988:
		case 7007:
		case 6996:
		case 6998:
		case 7003:
		case 7004:
		case 7005:
		case 6997:
		case 7002:
		case 7000:
		case 7001:
		case 6999:
		case 6001:
		case 9001:
		case 9003:
		case 11001:
		case 11002:
		case 11003:
		case 11004:
		case 11000:
		case 10998:
		case 10999:
		case 10996:
		case 10997:
		case 10995:
		case 11005:
		case 11007:
		case 11013:
		case 11014:
		case 11015:
		case 11006:
		case 11012:
		case 11010:
		case 11011:
		case 11008:
		case 11009:
		case 11016:
		case 10994:
		case 10992:
		case 10978:
		case 10979:
		case 10980:
		case 10981:
		case 10977:
		case 10975:
		case 10976:
		case 10973:
		case 10974:
		case 10993:
		case 10982:
		case 10984:
		case 10989:
		case 10990:
		case 10991:
		case 10983:
		case 10988:
		case 10986:
		case 10987:
		case 10985:
		case 10972:
		case 11017:
		case 11019:
		case 11048:
		case 11049:
		case 11050:
		case 11051:
		case 11047:
		case 11045:
		case 11046:
		case 11043:
		case 11044:
		case 11042:
		case 11052:
		case 11054:
		case 11060:
		case 11061:
		case 11062:
		case 11053:
		case 11059:
		case 11057:
		case 11058:
		case 11055:
		case 11056:
		case 11018:
		case 11041:
		case 11039:
		case 11025:
		case 11026:
		case 11027:
		case 11028:
		case 11024:
		case 11022:
		case 11023:
		case 11020:
		case 11021:
		case 11040:
		case 11029:
		case 11031:
		case 11036:
		case 11037:
		case 11038:
		case 11030:
		case 11035:
		case 11033:
		case 11034:
		case 11032:
		case 11063:
		case 10971:
		case 10969:
		case 10907:
		case 10908:
		case 10909:
		case 10910:
		case 10906:
		case 10904:
		case 10905:
		case 10902:
		case 10903:
		case 10901:
		case 10911:
		case 10913:
		case 10919:
		case 10920:
		case 10921:
		case 10912:
		case 10918:
		case 10916:
		case 10917:
		case 10914:
		case 10915:
		case 10922:
		case 10900:
		case 10898:
		case 10884:
		case 10885:
		case 10886:
		case 10887:
		case 10883:
		case 10881:
		case 10882:
		case 10879:
		case 10880:
		case 10899:
		case 10888:
		case 10890:
		case 10895:
		case 10896:
		case 10897:
		case 10889:
		case 10894:
		case 10892:
		case 10893:
		case 10891:
		case 10970:
		case 10923:
		case 10925:
		case 10954:
		case 10955:
		case 10956:
		case 10957:
		case 10953:
		case 10951:
		case 10952:
		case 10949:
		case 10950:
		case 10948:
		case 10958:
		case 10960:
		case 10966:
		case 10967:
		case 10968:
		case 10959:
		case 10965:
		case 10963:
		case 10964:
		case 10961:
		case 10962:
		case 10924:
		case 10947:
		case 10945:
		case 10931:
		case 10932:
		case 10933:
		case 10934:
		case 10930:
		case 10928:
		case 10929:
		case 10926:
		case 10927:
		case 10946:
		case 10935:
		case 10937:
		case 10942:
		case 10943:
		case 10944:
		case 10936:
		case 10941:
		case 10939:
		case 10940:
		case 10938:
		case 10878:
		case 11064:
		case 11066:
		case 11189:
		case 11190:
		case 11191:
		case 11192:
		case 11188:
		case 11186:
		case 11187:
		case 11184:
		case 11185:
		case 11183:
		case 11193:
		case 11195:
		case 11201:
		case 11202:
		case 11203:
		case 11194:
		case 11200:
		case 11198:
		case 11199:
		case 11196:
		case 11197:
		case 11204:
		case 11182:
		case 11180:
		case 11166:
		case 11167:
		case 11168:
		case 11169:
		case 11165:
		case 11163:
		case 11164:
		case 11161:
		case 11162:
		case 11181:
		case 11170:
		case 11172:
		case 11177:
		case 11178:
		case 11179:
		case 11171:
		case 11176:
		case 11174:
		case 11175:
		case 11173:
		case 11160:
		case 11205:
		case 11207:
		case 11236:
		case 11237:
		case 11238:
		case 11239:
		case 11235:
		case 11233:
		case 11234:
		case 11231:
		case 11232:
		case 11230:
		case 11240:
		case 11242:
		case 11248:
		case 11249:
		case 11250:
		case 11241:
		case 11247:
		case 11245:
		case 11246:
		case 11243:
		case 11244:
		case 11206:
		case 11229:
		case 11227:
		case 11213:
		case 11214:
		case 11215:
		case 11216:
		case 11212:
		case 11210:
		case 11211:
		case 11208:
		case 11209:
		case 11228:
		case 11217:
		case 11219:
		case 11224:
		case 11225:
		case 11226:
		case 11218:
		case 11223:
		case 11221:
		case 11222:
		case 11220:
		case 11065:
		case 11159:
		case 11157:
		case 11095:
		case 11096:
		case 11097:
		case 11098:
		case 11094:
		case 11092:
		case 11093:
		case 11090:
		case 11091:
		case 11089:
		case 11099:
		case 11101:
		case 11107:
		case 11108:
		case 11109:
		case 11100:
		case 11106:
		case 11104:
		case 11105:
		case 11102:
		case 11103:
		case 11110:
		case 11088:
		case 11086:
		case 11072:
		case 11073:
		case 11074:
		case 11075:
		case 11071:
		case 11069:
		case 11070:
		case 11067:
		case 11068:
		case 11087:
		case 11076:
		case 11078:
		case 11083:
		case 11084:
		case 11085:
		case 11077:
		case 11082:
		case 11080:
		case 11081:
		case 11079:
		case 11158:
		case 11111:
		case 11113:
		case 11142:
		case 11143:
		case 11144:
		case 11145:
		case 11141:
		case 11139:
		case 11140:
		case 11137:
		case 11138:
		case 11136:
		case 11146:
		case 11148:
		case 11154:
		case 11155:
		case 11156:
		case 11147:
		case 11153:
		case 11151:
		case 11152:
		case 11149:
		case 11150:
		case 11112:
		case 11135:
		case 11133:
		case 11119:
		case 11120:
		case 11121:
		case 11122:
		case 11118:
		case 11116:
		case 11117:
		case 11114:
		case 11115:
		case 11134:
		case 11123:
		case 11125:
		case 11130:
		case 11131:
		case 11132:
		case 11124:
		case 11129:
		case 11127:
		case 11128:
		case 11126:
		case 11251:
		case 10877:
		case 10875:
		case 10626:
		case 10627:
		case 10628:
		case 10629:
		case 10625:
		case 10623:
		case 10624:
		case 10621:
		case 10622:
		case 10620:
		case 10630:
		case 10632:
		case 10638:
		case 10639:
		case 10640:
		case 10631:
		case 10637:
		case 10635:
		case 10636:
		case 10633:
		case 10634:
		case 10641:
		case 10619:
		case 10617:
		case 10603:
		case 10604:
		case 10605:
		case 10606:
		case 10602:
		case 10600:
		case 10601:
		case 10598:
		case 10599:
		case 10618:
		case 10607:
		case 10609:
		case 10614:
		case 10615:
		case 10616:
		case 10608:
		case 10613:
		case 10611:
		case 10612:
		case 10610:
		case 10597:
		case 10642:
		case 10644:
		case 10673:
		case 10674:
		case 10675:
		case 10676:
		case 10672:
		case 10670:
		case 10671:
		case 10668:
		case 10669:
		case 10667:
		case 10677:
		case 10679:
		case 10685:
		case 10686:
		case 10687:
		case 10678:
		case 10684:
		case 10682:
		case 10683:
		case 10680:
		case 10681:
		case 10643:
		case 10666:
		case 10664:
		case 10650:
		case 10651:
		case 10652:
		case 10653:
		case 10649:
		case 10647:
		case 10648:
		case 10645:
		case 10646:
		case 10665:
		case 10654:
		case 10656:
		case 10661:
		case 10662:
		case 10663:
		case 10655:
		case 10660:
		case 10658:
		case 10659:
		case 10657:
		case 10688:
		case 10596:
		case 10594:
		case 10532:
		case 10533:
		case 10534:
		case 10535:
		case 10531:
		case 10529:
		case 10530:
		case 10527:
		case 10528:
		case 10526:
		case 10536:
		case 10538:
		case 10544:
		case 10545:
		case 10546:
		case 10537:
		case 10543:
		case 10541:
		case 10542:
		case 10539:
		case 10540:
		case 10547:
		case 10525:
		case 10523:
		case 10509:
		case 10510:
		case 10511:
		case 10512:
		case 10508:
		case 10506:
		case 10507:
		case 10504:
		case 10505:
		case 10524:
		case 10513:
		case 10515:
		case 10520:
		case 10521:
		case 10522:
		case 10514:
		case 10519:
		case 10517:
		case 10518:
		case 10516:
		case 10595:
		case 10548:
		case 10550:
		case 10579:
		case 10580:
		case 10581:
		case 10582:
		case 10578:
		case 10576:
		case 10577:
		case 10574:
		case 10575:
		case 10573:
		case 10583:
		case 10585:
		case 10591:
		case 10592:
		case 10593:
		case 10584:
		case 10590:
		case 10588:
		case 10589:
		case 10586:
		case 10587:
		case 10549:
		case 10572:
		case 10570:
		case 10556:
		case 10557:
		case 10558:
		case 10559:
		case 10555:
		case 10553:
		case 10554:
		case 10551:
		case 10552:
		case 10571:
		case 10560:
		case 10562:
		case 10567:
		case 10568:
		case 10569:
		case 10561:
		case 10566:
		case 10564:
		case 10565:
		case 10563:
		case 10876:
		case 10689:
		case 10691:
		case 10813:
		case 10814:
		case 10815:
		case 10816:
		case 10812:
		case 10810:
		case 10811:
		case 10808:
		case 10809:
		case 10807:
		case 10817:
		case 10819:
		case 10825:
		case 10826:
		case 10827:
		case 10818:
		case 10824:
		case 10822:
		case 10823:
		case 10820:
		case 10821:
		case 10828:
		case 10806:
		case 10804:
		case 10790:
		case 10791:
		case 10792:
		case 10793:
		case 10789:
		case 10787:
		case 10788:
		case 10785:
		case 10786:
		case 10805:
		case 10794:
		case 10796:
		case 10801:
		case 10802:
		case 10803:
		case 10795:
		case 10800:
		case 10798:
		case 10799:
		case 10797:
		case 10784:
		case 10829:
		case 10831:
		case 10860:
		case 10861:
		case 10862:
		case 10863:
		case 10859:
		case 10857:
		case 10858:
		case 10855:
		case 10856:
		case 10854:
		case 10864:
		case 10866:
		case 10872:
		case 10873:
		case 10874:
		case 10865:
		case 10871:
		case 10869:
		case 10870:
		case 10867:
		case 10868:
		case 10830:
		case 10853:
		case 10851:
		case 10837:
		case 10838:
		case 10839:
		case 10840:
		case 10836:
		case 10834:
		case 10835:
		case 10832:
		case 10833:
		case 10852:
		case 10841:
		case 10843:
		case 10848:
		case 10849:
		case 10850:
		case 10842:
		case 10847:
		case 10845:
		case 10846:
		case 10844:
		case 10690:
		case 10783:
		case 10781:
		case 10720:
		case 10721:
		case 10722:
		case 10723:
		case 10719:
		case 10717:
		case 10718:
		case 10715:
		case 10716:
		case 10714:
		case 10724:
		case 10726:
		case 10732:
		case 10733:
		case 10734:
		case 10725:
		case 10731:
		case 10729:
		case 10730:
		case 10727:
		case 10728:
		case 10735:
		case 10713:
		case 10711:
		case 10697:
		case 10698:
		case 10699:
		case 10700:
		case 10696:
		case 10694:
		case 10695:
		case 10692:
		case 10693:
		case 10712:
		case 10701:
		case 10703:
		case 10708:
		case 10709:
		case 10710:
		case 10702:
		case 10707:
		case 10705:
		case 10706:
		case 10704:
		case 10782:
		case 10736:
		case 10738:
		case 10767:
		case 10768:
		case 10769:
		case 10770:
		case 10766:
		case 10764:
		case 10765:
		case 10762:
		case 10763:
		case 10761:
		case 10771:
		case 10773:
		case 10778:
		case 10779:
		case 10780:
		case 10772:
		case 10777:
		case 10775:
		case 10776:
		case 10774:
		case 10737:
		case 10760:
		case 10758:
		case 10744:
		case 10745:
		case 10746:
		case 10747:
		case 10743:
		case 10741:
		case 10742:
		case 10739:
		case 10740:
		case 10759:
		case 10748:
		case 10750:
		case 10755:
		case 10756:
		case 10757:
		case 10749:
		case 10754:
		case 10752:
		case 10753:
		case 10751:
		case 10503:
		case 11252:
		case 11254:
		case 11752:
		case 11753:
		case 11754:
		case 11755:
		case 11751:
		case 11749:
		case 11750:
		case 11747:
		case 11748:
		case 11746:
		case 11756:
		case 11758:
		case 11764:
		case 11765:
		case 11766:
		case 11757:
		case 11763:
		case 11761:
		case 11762:
		case 11759:
		case 11760:
		case 11767:
		case 11745:
		case 11743:
		case 11729:
		case 11730:
		case 11731:
		case 11732:
		case 11728:
		case 11726:
		case 11727:
		case 11724:
		case 11725:
		case 11744:
		case 11733:
		case 11735:
		case 11740:
		case 11741:
		case 11742:
		case 11734:
		case 11739:
		case 11737:
		case 11738:
		case 11736:
		case 11723:
		case 11768:
		case 11770:
		case 11799:
		case 11800:
		case 11801:
		case 11802:
		case 11798:
		case 11796:
		case 11797:
		case 11794:
		case 11795:
		case 11793:
		case 11803:
		case 11805:
		case 11811:
		case 11812:
		case 11813:
		case 11804:
		case 11810:
		case 11808:
		case 11809:
		case 11806:
		case 11807:
		case 11769:
		case 11792:
		case 11790:
		case 11776:
		case 11777:
		case 11778:
		case 11779:
		case 11775:
		case 11773:
		case 11774:
		case 11771:
		case 11772:
		case 11791:
		case 11780:
		case 11782:
		case 11787:
		case 11788:
		case 11789:
		case 11781:
		case 11786:
		case 11784:
		case 11785:
		case 11783:
		case 11814:
		case 11722:
		case 11720:
		case 11658:
		case 11659:
		case 11660:
		case 11661:
		case 11657:
		case 11655:
		case 11656:
		case 11653:
		case 11654:
		case 11652:
		case 11662:
		case 11664:
		case 11670:
		case 11671:
		case 11672:
		case 11663:
		case 11669:
		case 11667:
		case 11668:
		case 11665:
		case 11666:
		case 11673:
		case 11651:
		case 11649:
		case 11635:
		case 11636:
		case 11637:
		case 11638:
		case 11634:
		case 11632:
		case 11633:
		case 11630:
		case 11631:
		case 11650:
		case 11639:
		case 11641:
		case 11646:
		case 11647:
		case 11648:
		case 11640:
		case 11645:
		case 11643:
		case 11644:
		case 11642:
		case 11721:
		case 11674:
		case 11676:
		case 11705:
		case 11706:
		case 11707:
		case 11708:
		case 11704:
		case 11702:
		case 11703:
		case 11700:
		case 11701:
		case 11699:
		case 11709:
		case 11711:
		case 11717:
		case 11718:
		case 11719:
		case 11710:
		case 11716:
		case 11714:
		case 11715:
		case 11712:
		case 11713:
		case 11675:
		case 11698:
		case 11696:
		case 11682:
		case 11683:
		case 11684:
		case 11685:
		case 11681:
		case 11679:
		case 11680:
		case 11677:
		case 11678:
		case 11697:
		case 11686:
		case 11688:
		case 11693:
		case 11694:
		case 11695:
		case 11687:
		case 11692:
		case 11690:
		case 11691:
		case 11689:
		case 11629:
		case 11815:
		case 11817:
		case 11939:
		case 11940:
		case 11941:
		case 11942:
		case 11938:
		case 11936:
		case 11937:
		case 11934:
		case 11935:
		case 11933:
		case 11943:
		case 11945:
		case 11951:
		case 11952:
		case 11953:
		case 11944:
		case 11950:
		case 11948:
		case 11949:
		case 11946:
		case 11947:
		case 11954:
		case 11932:
		case 11930:
		case 11916:
		case 11917:
		case 11918:
		case 11919:
		case 11915:
		case 11913:
		case 11914:
		case 11911:
		case 11912:
		case 11931:
		case 11920:
		case 11922:
		case 11927:
		case 11928:
		case 11929:
		case 11921:
		case 11926:
		case 11924:
		case 11925:
		case 11923:
		case 11910:
		case 11955:
		case 11957:
		case 11986:
		case 11987:
		case 11988:
		case 11989:
		case 11985:
		case 11983:
		case 11984:
		case 11981:
		case 11982:
		case 11980:
		case 11990:
		case 11992:
		case 11998:
		case 11999:
		case 12000:
		case 11991:
		case 11997:
		case 11995:
		case 11996:
		case 11993:
		case 11994:
		case 11956:
		case 11979:
		case 11977:
		case 11963:
		case 11964:
		case 11965:
		case 11966:
		case 11962:
		case 11960:
		case 11961:
		case 11958:
		case 11959:
		case 11978:
		case 11967:
		case 11969:
		case 11974:
		case 11975:
		case 11976:
		case 11968:
		case 11973:
		case 11971:
		case 11972:
		case 11970:
		case 11816:
		case 11909:
		case 11907:
		case 11846:
		case 11847:
		case 11848:
		case 11849:
		case 11845:
		case 11843:
		case 11844:
		case 11841:
		case 11842:
		case 11840:
		case 11850:
		case 11852:
		case 11858:
		case 11859:
		case 11860:
		case 11851:
		case 11857:
		case 11855:
		case 11856:
		case 11853:
		case 11854:
		case 11861:
		case 11839:
		case 11837:
		case 11823:
		case 11824:
		case 11825:
		case 11826:
		case 11822:
		case 11820:
		case 11821:
		case 11818:
		case 11819:
		case 11838:
		case 11827:
		case 11829:
		case 11834:
		case 11835:
		case 11836:
		case 11828:
		case 11833:
		case 11831:
		case 11832:
		case 11830:
		case 11908:
		case 11862:
		case 11864:
		case 11893:
		case 11894:
		case 11895:
		case 11896:
		case 11892:
		case 11890:
		case 11891:
		case 11888:
		case 11889:
		case 11887:
		case 11897:
		case 11899:
		case 11904:
		case 11905:
		case 11906:
		case 11898:
		case 11903:
		case 11901:
		case 11902:
		case 11900:
		case 11863:
		case 11886:
		case 11884:
		case 11870:
		case 11871:
		case 11872:
		case 11873:
		case 11869:
		case 11867:
		case 11868:
		case 11865:
		case 11866:
		case 11885:
		case 11874:
		case 11876:
		case 11881:
		case 11882:
		case 11883:
		case 11875:
		case 11880:
		case 11878:
		case 11879:
		case 11877:
		case 11253:
		case 11628:
		case 11626:
		case 11377:
		case 11378:
		case 11379:
		case 11380:
		case 11376:
		case 11374:
		case 11375:
		case 11372:
		case 11373:
		case 11371:
		case 11381:
		case 11383:
		case 11389:
		case 11390:
		case 11391:
		case 11382:
		case 11388:
		case 11386:
		case 11387:
		case 11384:
		case 11385:
		case 11392:
		case 11370:
		case 11368:
		case 11354:
		case 11355:
		case 11356:
		case 11357:
		case 11353:
		case 11351:
		case 11352:
		case 11349:
		case 11350:
		case 11369:
		case 11358:
		case 11360:
		case 11365:
		case 11366:
		case 11367:
		case 11359:
		case 11364:
		case 11362:
		case 11363:
		case 11361:
		case 11348:
		case 11393:
		case 11395:
		case 11424:
		case 11425:
		case 11426:
		case 11427:
		case 11423:
		case 11421:
		case 11422:
		case 11419:
		case 11420:
		case 11418:
		case 11428:
		case 11430:
		case 11436:
		case 11437:
		case 11438:
		case 11429:
		case 11435:
		case 11433:
		case 11434:
		case 11431:
		case 11432:
		case 11394:
		case 11417:
		case 11415:
		case 11401:
		case 11402:
		case 11403:
		case 11404:
		case 11400:
		case 11398:
		case 11399:
		case 11396:
		case 11397:
		case 11416:
		case 11405:
		case 11407:
		case 11412:
		case 11413:
		case 11414:
		case 11406:
		case 11411:
		case 11409:
		case 11410:
		case 11408:
		case 11439:
		case 11347:
		case 11345:
		case 11283:
		case 11284:
		case 11285:
		case 11286:
		case 11282:
		case 11280:
		case 11281:
		case 11278:
		case 11279:
		case 11277:
		case 11287:
		case 11289:
		case 11295:
		case 11296:
		case 11297:
		case 11288:
		case 11294:
		case 11292:
		case 11293:
		case 11290:
		case 11291:
		case 11298:
		case 11276:
		case 11274:
		case 11260:
		case 11261:
		case 11262:
		case 11263:
		case 11259:
		case 11257:
		case 11258:
		case 11255:
		case 11256:
		case 11275:
		case 11264:
		case 11266:
		case 11271:
		case 11272:
		case 11273:
		case 11265:
		case 11270:
		case 11268:
		case 11269:
		case 11267:
		case 11346:
		case 11299:
		case 11301:
		case 11330:
		case 11331:
		case 11332:
		case 11333:
		case 11329:
		case 11327:
		case 11328:
		case 11325:
		case 11326:
		case 11324:
		case 11334:
		case 11336:
		case 11342:
		case 11343:
		case 11344:
		case 11335:
		case 11341:
		case 11339:
		case 11340:
		case 11337:
		case 11338:
		case 11300:
		case 11323:
		case 11321:
		case 11307:
		case 11308:
		case 11309:
		case 11310:
		case 11306:
		case 11304:
		case 11305:
		case 11302:
		case 11303:
		case 11322:
		case 11311:
		case 11313:
		case 11318:
		case 11319:
		case 11320:
		case 11312:
		case 11317:
		case 11315:
		case 11316:
		case 11314:
		case 11627:
		case 11440:
		case 11442:
		case 11564:
		case 11565:
		case 11566:
		case 11567:
		case 11563:
		case 11561:
		case 11562:
		case 11559:
		case 11560:
		case 11558:
		case 11568:
		case 11570:
		case 11576:
		case 11577:
		case 11578:
		case 11569:
		case 11575:
		case 11573:
		case 11574:
		case 11571:
		case 11572:
		case 11579:
		case 11557:
		case 11555:
		case 11541:
		case 11542:
		case 11543:
		case 11544:
		case 11540:
		case 11538:
		case 11539:
		case 11536:
		case 11537:
		case 11556:
		case 11545:
		case 11547:
		case 11552:
		case 11553:
		case 11554:
		case 11546:
		case 11551:
		case 11549:
		case 11550:
		case 11548:
		case 11535:
		case 11580:
		case 11582:
		case 11611:
		case 11612:
		case 11613:
		case 11614:
		case 11610:
		case 11608:
		case 11609:
		case 11606:
		case 11607:
		case 11605:
		case 11615:
		case 11617:
		case 11623:
		case 11624:
		case 11625:
		case 11616:
		case 11622:
		case 11620:
		case 11621:
		case 11618:
		case 11619:
		case 11581:
		case 11604:
		case 11602:
		case 11588:
		case 11589:
		case 11590:
		case 11591:
		case 11587:
		case 11585:
		case 11586:
		case 11583:
		case 11584:
		case 11603:
		case 11592:
		case 11594:
		case 11599:
		case 11600:
		case 11601:
		case 11593:
		case 11598:
		case 11596:
		case 11597:
		case 11595:
		case 11441:
		case 11534:
		case 11532:
		case 11471:
		case 11472:
		case 11473:
		case 11474:
		case 11470:
		case 11468:
		case 11469:
		case 11466:
		case 11467:
		case 11465:
		case 11475:
		case 11477:
		case 11483:
		case 11484:
		case 11485:
		case 11476:
		case 11482:
		case 11480:
		case 11481:
		case 11478:
		case 11479:
		case 11486:
		case 11464:
		case 11462:
		case 11448:
		case 11449:
		case 11450:
		case 11451:
		case 11447:
		case 11445:
		case 11446:
		case 11443:
		case 11444:
		case 11463:
		case 11452:
		case 11454:
		case 11459:
		case 11460:
		case 11461:
		case 11453:
		case 11458:
		case 11456:
		case 11457:
		case 11455:
		case 11533:
		case 11487:
		case 11489:
		case 11518:
		case 11519:
		case 11520:
		case 11521:
		case 11517:
		case 11515:
		case 11516:
		case 11513:
		case 11514:
		case 11512:
		case 11522:
		case 11524:
		case 11529:
		case 11530:
		case 11531:
		case 11523:
		case 11528:
		case 11526:
		case 11527:
		case 11525:
		case 11488:
		case 11511:
		case 11509:
		case 11495:
		case 11496:
		case 11497:
		case 11498:
		case 11494:
		case 11492:
		case 11493:
		case 11490:
		case 11491:
		case 11510:
		case 11499:
		case 11501:
		case 11506:
		case 11507:
		case 11508:
		case 11500:
		case 11505:
		case 11503:
		case 11504:
		case 11502:
		case 9002:
		case 10502:
		case 10500:
		case 9501:
		case 9502:
		case 9503:
		case 9504:
		case 9500:
		case 9498:
		case 9499:
		case 9496:
		case 9497:
		case 9495:
		case 9505:
		case 9507:
		case 9513:
		case 9514:
		case 9515:
		case 9506:
		case 9512:
		case 9510:
		case 9511:
		case 9508:
		case 9509:
		case 9516:
		case 9494:
		case 9492:
		case 9478:
		case 9479:
		case 9480:
		case 9481:
		case 9477:
		case 9475:
		case 9476:
		case 9473:
		case 9474:
		case 9493:
		case 9482:
		case 9484:
		case 9489:
		case 9490:
		case 9491:
		case 9483:
		case 9488:
		case 9486:
		case 9487:
		case 9485:
		case 9472:
		case 9517:
		case 9519:
		case 9548:
		case 9549:
		case 9550:
		case 9551:
		case 9547:
		case 9545:
		case 9546:
		case 9543:
		case 9544:
		case 9542:
		case 9552:
		case 9554:
		case 9560:
		case 9561:
		case 9562:
		case 9553:
		case 9559:
		case 9557:
		case 9558:
		case 9555:
		case 9556:
		case 9518:
		case 9541:
		case 9539:
		case 9525:
		case 9526:
		case 9527:
		case 9528:
		case 9524:
		case 9522:
		case 9523:
		case 9520:
		case 9521:
		case 9540:
		case 9529:
		case 9531:
		case 9536:
		case 9537:
		case 9538:
		case 9530:
		case 9535:
		case 9533:
		case 9534:
		case 9532:
		case 9563:
		case 9471:
		case 9469:
		case 9407:
		case 9408:
		case 9409:
		case 9410:
		case 9406:
		case 9404:
		case 9405:
		case 9402:
		case 9403:
		case 9401:
		case 9411:
		case 9413:
		case 9419:
		case 9420:
		case 9421:
		case 9412:
		case 9418:
		case 9416:
		case 9417:
		case 9414:
		case 9415:
		case 9422:
		case 9400:
		case 9398:
		case 9384:
		case 9385:
		case 9386:
		case 9387:
		case 9383:
		case 9381:
		case 9382:
		case 9379:
		case 9380:
		case 9399:
		case 9388:
		case 9390:
		case 9395:
		case 9396:
		case 9397:
		case 9389:
		case 9394:
		case 9392:
		case 9393:
		case 9391:
		case 9470:
		case 9423:
		case 9425:
		case 9454:
		case 9455:
		case 9456:
		case 9457:
		case 9453:
		case 9451:
		case 9452:
		case 9449:
		case 9450:
		case 9448:
		case 9458:
		case 9460:
		case 9466:
		case 9467:
		case 9468:
		case 9459:
		case 9465:
		case 9463:
		case 9464:
		case 9461:
		case 9462:
		case 9424:
		case 9447:
		case 9445:
		case 9431:
		case 9432:
		case 9433:
		case 9434:
		case 9430:
		case 9428:
		case 9429:
		case 9426:
		case 9427:
		case 9446:
		case 9435:
		case 9437:
		case 9442:
		case 9443:
		case 9444:
		case 9436:
		case 9441:
		case 9439:
		case 9440:
		case 9438:
		case 9378:
		case 9564:
		case 9566:
		case 9688:
		case 9689:
		case 9690:
		case 9691:
		case 9687:
		case 9685:
		case 9686:
		case 9683:
		case 9684:
		case 9682:
		case 9692:
		case 9694:
		case 9700:
		case 9701:
		case 9702:
		case 9693:
		case 9699:
		case 9697:
		case 9698:
		case 9695:
		case 9696:
		case 9703:
		case 9681:
		case 9679:
		case 9665:
		case 9666:
		case 9667:
		case 9668:
		case 9664:
		case 9662:
		case 9663:
		case 9660:
		case 9661:
		case 9680:
		case 9669:
		case 9671:
		case 9676:
		case 9677:
		case 9678:
		case 9670:
		case 9675:
		case 9673:
		case 9674:
		case 9672:
		case 9659:
		case 9704:
		case 9706:
		case 9735:
		case 9736:
		case 9737:
		case 9738:
		case 9734:
		case 9732:
		case 9733:
		case 9730:
		case 9731:
		case 9729:
		case 9739:
		case 9741:
		case 9747:
		case 9748:
		case 9749:
		case 9740:
		case 9746:
		case 9744:
		case 9745:
		case 9742:
		case 9743:
		case 9705:
		case 9728:
		case 9726:
		case 9712:
		case 9713:
		case 9714:
		case 9715:
		case 9711:
		case 9709:
		case 9710:
		case 9707:
		case 9708:
		case 9727:
		case 9716:
		case 9718:
		case 9723:
		case 9724:
		case 9725:
		case 9717:
		case 9722:
		case 9720:
		case 9721:
		case 9719:
		case 9565:
		case 9658:
		case 9656:
		case 9595:
		case 9596:
		case 9597:
		case 9598:
		case 9594:
		case 9592:
		case 9593:
		case 9590:
		case 9591:
		case 9589:
		case 9599:
		case 9601:
		case 9607:
		case 9608:
		case 9609:
		case 9600:
		case 9606:
		case 9604:
		case 9605:
		case 9602:
		case 9603:
		case 9610:
		case 9588:
		case 9586:
		case 9572:
		case 9573:
		case 9574:
		case 9575:
		case 9571:
		case 9569:
		case 9570:
		case 9567:
		case 9568:
		case 9587:
		case 9576:
		case 9578:
		case 9583:
		case 9584:
		case 9585:
		case 9577:
		case 9582:
		case 9580:
		case 9581:
		case 9579:
		case 9657:
		case 9611:
		case 9613:
		case 9642:
		case 9643:
		case 9644:
		case 9645:
		case 9641:
		case 9639:
		case 9640:
		case 9637:
		case 9638:
		case 9636:
		case 9646:
		case 9648:
		case 9653:
		case 9654:
		case 9655:
		case 9647:
		case 9652:
		case 9650:
		case 9651:
		case 9649:
		case 9612:
		case 9635:
		case 9633:
		case 9619:
		case 9620:
		case 9621:
		case 9622:
		case 9618:
		case 9616:
		case 9617:
		case 9614:
		case 9615:
		case 9634:
		case 9623:
		case 9625:
		case 9630:
		case 9631:
		case 9632:
		case 9624:
		case 9629:
		case 9627:
		case 9628:
		case 9626:
		case 9750:
		case 9377:
		case 9375:
		case 9126:
		case 9127:
		case 9128:
		case 9129:
		case 9125:
		case 9123:
		case 9124:
		case 9121:
		case 9122:
		case 9120:
		case 9130:
		case 9132:
		case 9138:
		case 9139:
		case 9140:
		case 9131:
		case 9137:
		case 9135:
		case 9136:
		case 9133:
		case 9134:
		case 9141:
		case 9119:
		case 9117:
		case 9103:
		case 9104:
		case 9105:
		case 9106:
		case 9102:
		case 9100:
		case 9101:
		case 9098:
		case 9099:
		case 9118:
		case 9107:
		case 9109:
		case 9114:
		case 9115:
		case 9116:
		case 9108:
		case 9113:
		case 9111:
		case 9112:
		case 9110:
		case 9097:
		case 9142:
		case 9144:
		case 9173:
		case 9174:
		case 9175:
		case 9176:
		case 9172:
		case 9170:
		case 9171:
		case 9168:
		case 9169:
		case 9167:
		case 9177:
		case 9179:
		case 9185:
		case 9186:
		case 9187:
		case 9178:
		case 9184:
		case 9182:
		case 9183:
		case 9180:
		case 9181:
		case 9143:
		case 9166:
		case 9164:
		case 9150:
		case 9151:
		case 9152:
		case 9153:
		case 9149:
		case 9147:
		case 9148:
		case 9145:
		case 9146:
		case 9165:
		case 9154:
		case 9156:
		case 9161:
		case 9162:
		case 9163:
		case 9155:
		case 9160:
		case 9158:
		case 9159:
		case 9157:
		case 9188:
		case 9096:
		case 9094:
		case 9032:
		case 9033:
		case 9034:
		case 9035:
		case 9031:
		case 9029:
		case 9030:
		case 9027:
		case 9028:
		case 9026:
		case 9036:
		case 9038:
		case 9044:
		case 9045:
		case 9046:
		case 9037:
		case 9043:
		case 9041:
		case 9042:
		case 9039:
		case 9040:
		case 9047:
		case 9025:
		case 9023:
		case 9009:
		case 9010:
		case 9011:
		case 9012:
		case 9008:
		case 9006:
		case 9007:
		case 9004:
		case 9005:
		case 9024:
		case 9013:
		case 9015:
		case 9020:
		case 9021:
		case 9022:
		case 9014:
		case 9019:
		case 9017:
		case 9018:
		case 9016:
		case 9095:
		case 9048:
		case 9050:
		case 9079:
		case 9080:
		case 9081:
		case 9082:
		case 9078:
		case 9076:
		case 9077:
		case 9074:
		case 9075:
		case 9073:
		case 9083:
		case 9085:
		case 9091:
		case 9092:
		case 9093:
		case 9084:
		case 9090:
		case 9088:
		case 9089:
		case 9086:
		case 9087:
		case 9049:
		case 9072:
		case 9070:
		case 9056:
		case 9057:
		case 9058:
		case 9059:
		case 9055:
		case 9053:
		case 9054:
		case 9051:
		case 9052:
		case 9071:
		case 9060:
		case 9062:
		case 9067:
		case 9068:
		case 9069:
		case 9061:
		case 9066:
		case 9064:
		case 9065:
		case 9063:
		case 9376:
		case 9189:
		case 9191:
		case 9313:
		case 9314:
		case 9315:
		case 9316:
		case 9312:
		case 9310:
		case 9311:
		case 9308:
		case 9309:
		case 9307:
		case 9317:
		case 9319:
		case 9325:
		case 9326:
		case 9327:
		case 9318:
		case 9324:
		case 9322:
		case 9323:
		case 9320:
		case 9321:
		case 9328:
		case 9306:
		case 9304:
		case 9290:
		case 9291:
		case 9292:
		case 9293:
		case 9289:
		case 9287:
		case 9288:
		case 9285:
		case 9286:
		case 9305:
		case 9294:
		case 9296:
		case 9301:
		case 9302:
		case 9303:
		case 9295:
		case 9300:
		case 9298:
		case 9299:
		case 9297:
		case 9284:
		case 9329:
		case 9331:
		case 9360:
		case 9361:
		case 9362:
		case 9363:
		case 9359:
		case 9357:
		case 9358:
		case 9355:
		case 9356:
		case 9354:
		case 9364:
		case 9366:
		case 9372:
		case 9373:
		case 9374:
		case 9365:
		case 9371:
		case 9369:
		case 9370:
		case 9367:
		case 9368:
		case 9330:
		case 9353:
		case 9351:
		case 9337:
		case 9338:
		case 9339:
		case 9340:
		case 9336:
		case 9334:
		case 9335:
		case 9332:
		case 9333:
		case 9352:
		case 9341:
		case 9343:
		case 9348:
		case 9349:
		case 9350:
		case 9342:
		case 9347:
		case 9345:
		case 9346:
		case 9344:
		case 9190:
		case 9283:
		case 9281:
		case 9220:
		case 9221:
		case 9222:
		case 9223:
		case 9219:
		case 9217:
		case 9218:
		case 9215:
		case 9216:
		case 9214:
		case 9224:
		case 9226:
		case 9232:
		case 9233:
		case 9234:
		case 9225:
		case 9231:
		case 9229:
		case 9230:
		case 9227:
		case 9228:
		case 9235:
		case 9213:
		case 9211:
		case 9197:
		case 9198:
		case 9199:
		case 9200:
		case 9196:
		case 9194:
		case 9195:
		case 9192:
		case 9193:
		case 9212:
		case 9201:
		case 9203:
		case 9208:
		case 9209:
		case 9210:
		case 9202:
		case 9207:
		case 9205:
		case 9206:
		case 9204:
		case 9282:
		case 9236:
		case 9238:
		case 9267:
		case 9268:
		case 9269:
		case 9270:
		case 9266:
		case 9264:
		case 9265:
		case 9262:
		case 9263:
		case 9261:
		case 9271:
		case 9273:
		case 9278:
		case 9279:
		case 9280:
		case 9272:
		case 9277:
		case 9275:
		case 9276:
		case 9274:
		case 9237:
		case 9260:
		case 9258:
		case 9244:
		case 9245:
		case 9246:
		case 9247:
		case 9243:
		case 9241:
		case 9242:
		case 9239:
		case 9240:
		case 9259:
		case 9248:
		case 9250:
		case 9255:
		case 9256:
		case 9257:
		case 9249:
		case 9254:
		case 9252:
		case 9253:
		case 9251:
		case 10501:
		case 9751:
		case 9753:
		case 10251:
		case 10252:
		case 10253:
		case 10254:
		case 10250:
		case 10248:
		case 10249:
		case 10246:
		case 10247:
		case 10245:
		case 10255:
		case 10257:
		case 10263:
		case 10264:
		case 10265:
		case 10256:
		case 10262:
		case 10260:
		case 10261:
		case 10258:
		case 10259:
		case 10266:
		case 10244:
		case 10242:
		case 10228:
		case 10229:
		case 10230:
		case 10231:
		case 10227:
		case 10225:
		case 10226:
		case 10223:
		case 10224:
		case 10243:
		case 10232:
		case 10234:
		case 10239:
		case 10240:
		case 10241:
		case 10233:
		case 10238:
		case 10236:
		case 10237:
		case 10235:
		case 10222:
		case 10267:
		case 10269:
		case 10298:
		case 10299:
		case 10300:
		case 10301:
		case 10297:
		case 10295:
		case 10296:
		case 10293:
		case 10294:
		case 10292:
		case 10302:
		case 10304:
		case 10310:
		case 10311:
		case 10312:
		case 10303:
		case 10309:
		case 10307:
		case 10308:
		case 10305:
		case 10306:
		case 10268:
		case 10291:
		case 10289:
		case 10275:
		case 10276:
		case 10277:
		case 10278:
		case 10274:
		case 10272:
		case 10273:
		case 10270:
		case 10271:
		case 10290:
		case 10279:
		case 10281:
		case 10286:
		case 10287:
		case 10288:
		case 10280:
		case 10285:
		case 10283:
		case 10284:
		case 10282:
		case 10313:
		case 10221:
		case 10219:
		case 10157:
		case 10158:
		case 10159:
		case 10160:
		case 10156:
		case 10154:
		case 10155:
		case 10152:
		case 10153:
		case 10151:
		case 10161:
		case 10163:
		case 10169:
		case 10170:
		case 10171:
		case 10162:
		case 10168:
		case 10166:
		case 10167:
		case 10164:
		case 10165:
		case 10172:
		case 10150:
		case 10148:
		case 10134:
		case 10135:
		case 10136:
		case 10137:
		case 10133:
		case 10131:
		case 10132:
		case 10129:
		case 10130:
		case 10149:
		case 10138:
		case 10140:
		case 10145:
		case 10146:
		case 10147:
		case 10139:
		case 10144:
		case 10142:
		case 10143:
		case 10141:
		case 10220:
		case 10173:
		case 10175:
		case 10204:
		case 10205:
		case 10206:
		case 10207:
		case 10203:
		case 10201:
		case 10202:
		case 10199:
		case 10200:
		case 10198:
		case 10208:
		case 10210:
		case 10216:
		case 10217:
		case 10218:
		case 10209:
		case 10215:
		case 10213:
		case 10214:
		case 10211:
		case 10212:
		case 10174:
		case 10197:
		case 10195:
		case 10181:
		case 10182:
		case 10183:
		case 10184:
		case 10180:
		case 10178:
		case 10179:
		case 10176:
		case 10177:
		case 10196:
		case 10185:
		case 10187:
		case 10192:
		case 10193:
		case 10194:
		case 10186:
		case 10191:
		case 10189:
		case 10190:
		case 10188:
		case 10128:
		case 10314:
		case 10316:
		case 10438:
		case 10439:
		case 10440:
		case 10441:
		case 10437:
		case 10435:
		case 10436:
		case 10433:
		case 10434:
		case 10432:
		case 10442:
		case 10444:
		case 10450:
		case 10451:
		case 10452:
		case 10443:
		case 10449:
		case 10447:
		case 10448:
		case 10445:
		case 10446:
		case 10453:
		case 10431:
		case 10429:
		case 10415:
		case 10416:
		case 10417:
		case 10418:
		case 10414:
		case 10412:
		case 10413:
		case 10410:
		case 10411:
		case 10430:
		case 10419:
		case 10421:
		case 10426:
		case 10427:
		case 10428:
		case 10420:
		case 10425:
		case 10423:
		case 10424:
		case 10422:
		case 10409:
		case 10454:
		case 10456:
		case 10485:
		case 10486:
		case 10487:
		case 10488:
		case 10484:
		case 10482:
		case 10483:
		case 10480:
		case 10481:
		case 10479:
		case 10489:
		case 10491:
		case 10497:
		case 10498:
		case 10499:
		case 10490:
		case 10496:
		case 10494:
		case 10495:
		case 10492:
		case 10493:
		case 10455:
		case 10478:
		case 10476:
		case 10462:
		case 10463:
		case 10464:
		case 10465:
		case 10461:
		case 10459:
		case 10460:
		case 10457:
		case 10458:
		case 10477:
		case 10466:
		case 10468:
		case 10473:
		case 10474:
		case 10475:
		case 10467:
		case 10472:
		case 10470:
		case 10471:
		case 10469:
		case 10315:
		case 10408:
		case 10406:
		case 10345:
		case 10346:
		case 10347:
		case 10348:
		case 10344:
		case 10342:
		case 10343:
		case 10340:
		case 10341:
		case 10339:
		case 10349:
		case 10351:
		case 10357:
		case 10358:
		case 10359:
		case 10350:
		case 10356:
		case 10354:
		case 10355:
		case 10352:
		case 10353:
		case 10360:
		case 10338:
		case 10336:
		case 10322:
		case 10323:
		case 10324:
		case 10325:
		case 10321:
		case 10319:
		case 10320:
		case 10317:
		case 10318:
		case 10337:
		case 10326:
		case 10328:
		case 10333:
		case 10334:
		case 10335:
		case 10327:
		case 10332:
		case 10330:
		case 10331:
		case 10329:
		case 10407:
		case 10361:
		case 10363:
		case 10392:
		case 10393:
		case 10394:
		case 10395:
		case 10391:
		case 10389:
		case 10390:
		case 10387:
		case 10388:
		case 10386:
		case 10396:
		case 10398:
		case 10403:
		case 10404:
		case 10405:
		case 10397:
		case 10402:
		case 10400:
		case 10401:
		case 10399:
		case 10362:
		case 10385:
		case 10383:
		case 10369:
		case 10370:
		case 10371:
		case 10372:
		case 10368:
		case 10366:
		case 10367:
		case 10364:
		case 10365:
		case 10384:
		case 10373:
		case 10375:
		case 10380:
		case 10381:
		case 10382:
		case 10374:
		case 10379:
		case 10377:
		case 10378:
		case 10376:
		case 9752:
		case 10127:
		case 10125:
		case 9876:
		case 9877:
		case 9878:
		case 9879:
		case 9875:
		case 9873:
		case 9874:
		case 9871:
		case 9872:
		case 9870:
		case 9880:
		case 9882:
		case 9888:
		case 9889:
		case 9890:
		case 9881:
		case 9887:
		case 9885:
		case 9886:
		case 9883:
		case 9884:
		case 9891:
		case 9869:
		case 9867:
		case 9853:
		case 9854:
		case 9855:
		case 9856:
		case 9852:
		case 9850:
		case 9851:
		case 9848:
		case 9849:
		case 9868:
		case 9857:
		case 9859:
		case 9864:
		case 9865:
		case 9866:
		case 9858:
		case 9863:
		case 9861:
		case 9862:
		case 9860:
		case 9847:
		case 9892:
		case 9894:
		case 9923:
		case 9924:
		case 9925:
		case 9926:
		case 9922:
		case 9920:
		case 9921:
		case 9918:
		case 9919:
		case 9917:
		case 9927:
		case 9929:
		case 9935:
		case 9936:
		case 9937:
		case 9928:
		case 9934:
		case 9932:
		case 9933:
		case 9930:
		case 9931:
		case 9893:
		case 9916:
		case 9914:
		case 9900:
		case 9901:
		case 9902:
		case 9903:
		case 9899:
		case 9897:
		case 9898:
		case 9895:
		case 9896:
		case 9915:
		case 9904:
		case 9906:
		case 9911:
		case 9912:
		case 9913:
		case 9905:
		case 9910:
		case 9908:
		case 9909:
		case 9907:
		case 9938:
		case 9846:
		case 9844:
		case 9782:
		case 9783:
		case 9784:
		case 9785:
		case 9781:
		case 9779:
		case 9780:
		case 9777:
		case 9778:
		case 9776:
		case 9786:
		case 9788:
		case 9794:
		case 9795:
		case 9796:
		case 9787:
		case 9793:
		case 9791:
		case 9792:
		case 9789:
		case 9790:
		case 9797:
		case 9775:
		case 9773:
		case 9759:
		case 9760:
		case 9761:
		case 9762:
		case 9758:
		case 9756:
		case 9757:
		case 9754:
		case 9755:
		case 9774:
		case 9763:
		case 9765:
		case 9770:
		case 9771:
		case 9772:
		case 9764:
		case 9769:
		case 9767:
		case 9768:
		case 9766:
		case 9845:
		case 9798:
		case 9800:
		case 9829:
		case 9830:
		case 9831:
		case 9832:
		case 9828:
		case 9826:
		case 9827:
		case 9824:
		case 9825:
		case 9823:
		case 9833:
		case 9835:
		case 9841:
		case 9842:
		case 9843:
		case 9834:
		case 9840:
		case 9838:
		case 9839:
		case 9836:
		case 9837:
		case 9799:
		case 9822:
		case 9820:
		case 9806:
		case 9807:
		case 9808:
		case 9809:
		case 9805:
		case 9803:
		case 9804:
		case 9801:
		case 9802:
		case 9821:
		case 9810:
		case 9812:
		case 9817:
		case 9818:
		case 9819:
		case 9811:
		case 9816:
		case 9814:
		case 9815:
		case 9813:
		case 10126:
		case 9939:
		case 9941:
		case 10063:
		case 10064:
		case 10065:
		case 10066:
		case 10062:
		case 10060:
		case 10061:
		case 10058:
		case 10059:
		case 10057:
		case 10067:
		case 10069:
		case 10075:
		case 10076:
		case 10077:
		case 10068:
		case 10074:
		case 10072:
		case 10073:
		case 10070:
		case 10071:
		case 10078:
		case 10056:
		case 10054:
		case 10040:
		case 10041:
		case 10042:
		case 10043:
		case 10039:
		case 10037:
		case 10038:
		case 10035:
		case 10036:
		case 10055:
		case 10044:
		case 10046:
		case 10051:
		case 10052:
		case 10053:
		case 10045:
		case 10050:
		case 10048:
		case 10049:
		case 10047:
		case 10034:
		case 10079:
		case 10081:
		case 10110:
		case 10111:
		case 10112:
		case 10113:
		case 10109:
		case 10107:
		case 10108:
		case 10105:
		case 10106:
		case 10104:
		case 10114:
		case 10116:
		case 10122:
		case 10123:
		case 10124:
		case 10115:
		case 10121:
		case 10119:
		case 10120:
		case 10117:
		case 10118:
		case 10080:
		case 10103:
		case 10101:
		case 10087:
		case 10088:
		case 10089:
		case 10090:
		case 10086:
		case 10084:
		case 10085:
		case 10082:
		case 10083:
		case 10102:
		case 10091:
		case 10093:
		case 10098:
		case 10099:
		case 10100:
		case 10092:
		case 10097:
		case 10095:
		case 10096:
		case 10094:
		case 9940:
		case 10033:
		case 10031:
		case 9970:
		case 9971:
		case 9972:
		case 9973:
		case 9969:
		case 9967:
		case 9968:
		case 9965:
		case 9966:
		case 9964:
		case 9974:
		case 9976:
		case 9982:
		case 9983:
		case 9984:
		case 9975:
		case 9981:
		case 9979:
		case 9980:
		case 9977:
		case 9978:
		case 9985:
		case 9963:
		case 9961:
		case 9947:
		case 9948:
		case 9949:
		case 9950:
		case 9946:
		case 9944:
		case 9945:
		case 9942:
		case 9943:
		case 9962:
		case 9951:
		case 9953:
		case 9958:
		case 9959:
		case 9960:
		case 9952:
		case 9957:
		case 9955:
		case 9956:
		case 9954:
		case 10032:
		case 9986:
		case 9988:
		case 10017:
		case 10018:
		case 10019:
		case 10020:
		case 10016:
		case 10014:
		case 10015:
		case 10012:
		case 10013:
		case 10011:
		case 10021:
		case 10023:
		case 10028:
		case 10029:
		case 10030:
		case 10022:
		case 10027:
		case 10025:
		case 10026:
		case 10024:
		case 9987:
		case 10010:
		case 10008:
		case 9994:
		case 9995:
		case 9996:
		case 9997:
		case 9993:
		case 9991:
		case 9992:
		case 9989:
		case 9990:
		case 10009:
		case 9998:
		case 10000:
		case 10005:
		case 10006:
		case 10007:
		case 9999:
		case 10004:
		case 10002:
		case 10003:
		case 10001:
		case 6000:
		case 8175:
		case 5998:
		case 1998:
		case 1999:
		case 2000:
		case 2001:
		case 1997:
		case 1995:
		case 1996:
		case 1993:
		case 1994:
		case 1992:
		case 2002:
		case 2004:
		case 2010:
		case 2011:
		case 2012:
		case 2003:
		case 2009:
		case 2007:
		case 2008:
		case 2005:
		case 2006:
		case 2013:
		case 1991:
		case 1989:
		case 1975:
		case 1976:
		case 1977:
		case 1978:
		case 1974:
		case 1972:
		case 1973:
		case 1970:
		case 1971:
		case 1990:
		case 1979:
		case 1981:
		case 1986:
		case 1987:
		case 1988:
		case 1980:
		case 1985:
		case 1983:
		case 1984:
		case 1982:
		case 1969:
		case 2014:
		case 2016:
		case 2045:
		case 2046:
		case 2047:
		case 2048:
		case 2044:
		case 2042:
		case 2043:
		case 2040:
		case 2041:
		case 2039:
		case 2049:
		case 2051:
		case 2057:
		case 2058:
		case 2059:
		case 2050:
		case 2056:
		case 2054:
		case 2055:
		case 2052:
		case 2053:
		case 2015:
		case 2038:
		case 2036:
		case 2022:
		case 2023:
		case 2024:
		case 2025:
		case 2021:
		case 2019:
		case 2020:
		case 2017:
		case 2018:
		case 2037:
		case 2026:
		case 2028:
		case 2033:
		case 2034:
		case 2035:
		case 2027:
		case 2032:
		case 2030:
		case 2031:
		case 2029:
		case 2060:
		case 1968:
		case 1966:
		case 1904:
		case 1905:
		case 1906:
		case 1907:
		case 1903:
		case 1901:
		case 1902:
		case 1899:
		case 1900:
		case 1898:
		case 1908:
		case 1910:
		case 1916:
		case 1917:
		case 1918:
		case 1909:
		case 1915:
		case 1913:
		case 1914:
		case 1911:
		case 1912:
		case 1919:
		case 1897:
		case 1895:
		case 1881:
		case 1882:
		case 1883:
		case 1884:
		case 1880:
		case 1878:
		case 1879:
		case 1876:
		case 1877:
		case 1896:
		case 1885:
		case 1887:
		case 1892:
		case 1893:
		case 1894:
		case 1886:
		case 1891:
		case 1889:
		case 1890:
		case 1888:
		case 1967:
		case 1920:
		case 1922:
		case 1951:
		case 1952:
		case 1953:
		case 1954:
		case 1950:
		case 1948:
		case 1949:
		case 1946:
		case 1947:
		case 1945:
		case 1955:
		case 1957:
		case 1963:
		case 1964:
		case 1965:
		case 1956:
		case 1962:
		case 1960:
		case 1961:
		case 1958:
		case 1959:
		case 1921:
		case 1944:
		case 1942:
		case 1928:
		case 1929:
		case 1930:
		case 1931:
		case 1927:
		case 1925:
		case 1926:
		case 1923:
		case 1924:
		case 1943:
		case 1932:
		case 1934:
		case 1939:
		case 1940:
		case 1941:
		case 1933:
		case 1938:
		case 1936:
		case 1937:
		case 1935:
		case 1875:
		case 2061:
		case 2063:
		case 2186:
		case 2187:
		case 2188:
		case 2189:
		case 2185:
		case 2183:
		case 2184:
		case 2181:
		case 2182:
		case 2180:
		case 2190:
		case 2192:
		case 2198:
		case 2199:
		case 2200:
		case 2191:
		case 2197:
		case 2195:
		case 2196:
		case 2193:
		case 2194:
		case 2201:
		case 2179:
		case 2177:
		case 2163:
		case 2164:
		case 2165:
		case 2166:
		case 2162:
		case 2160:
		case 2161:
		case 2158:
		case 2159:
		case 2178:
		case 2167:
		case 2169:
		case 2174:
		case 2175:
		case 2176:
		case 2168:
		case 2173:
		case 2171:
		case 2172:
		case 2170:
		case 2157:
		case 2202:
		case 2204:
		case 2233:
		case 2234:
		case 2235:
		case 2236:
		case 2232:
		case 2230:
		case 2231:
		case 2228:
		case 2229:
		case 2227:
		case 2237:
		case 2239:
		case 2245:
		case 2246:
		case 2247:
		case 2238:
		case 2244:
		case 2242:
		case 2243:
		case 2240:
		case 2241:
		case 2203:
		case 2226:
		case 2224:
		case 2210:
		case 2211:
		case 2212:
		case 2213:
		case 2209:
		case 2207:
		case 2208:
		case 2205:
		case 2206:
		case 2225:
		case 2214:
		case 2216:
		case 2221:
		case 2222:
		case 2223:
		case 2215:
		case 2220:
		case 2218:
		case 2219:
		case 2217:
		case 2062:
		case 2156:
		case 2154:
		case 2092:
		case 2093:
		case 2094:
		case 2095:
		case 2091:
		case 2089:
		case 2090:
		case 2087:
		case 2088:
		case 2086:
		case 2096:
		case 2098:
		case 2104:
		case 2105:
		case 2106:
		case 2097:
		case 2103:
		case 2101:
		case 2102:
		case 2099:
		case 2100:
		case 2107:
		case 2085:
		case 2083:
		case 2069:
		case 2070:
		case 2071:
		case 2072:
		case 2068:
		case 2066:
		case 2067:
		case 2064:
		case 2065:
		case 2084:
		case 2073:
		case 2075:
		case 2080:
		case 2081:
		case 2082:
		case 2074:
		case 2079:
		case 2077:
		case 2078:
		case 2076:
		case 2155:
		case 2108:
		case 2110:
		case 2139:
		case 2140:
		case 2141:
		case 2142:
		case 2138:
		case 2136:
		case 2137:
		case 2134:
		case 2135:
		case 2133:
		case 2143:
		case 2145:
		case 2151:
		case 2152:
		case 2153:
		case 2144:
		case 2150:
		case 2148:
		case 2149:
		case 2146:
		case 2147:
		case 2109:
		case 2132:
		case 2130:
		case 2116:
		case 2117:
		case 2118:
		case 2119:
		case 2115:
		case 2113:
		case 2114:
		case 2111:
		case 2112:
		case 2131:
		case 2120:
		case 2122:
		case 2127:
		case 2128:
		case 2129:
		case 2121:
		case 2126:
		case 2124:
		case 2125:
		case 2123:
		case 2248:
		case 1874:
		case 1872:
		case 1623:
		case 1624:
		case 1625:
		case 1626:
		case 1622:
		case 1620:
		case 1621:
		case 1618:
		case 1619:
		case 1617:
		case 1627:
		case 1629:
		case 1635:
		case 1636:
		case 1637:
		case 1628:
		case 1634:
		case 1632:
		case 1633:
		case 1630:
		case 1631:
		case 1638:
		case 1616:
		case 1614:
		case 1600:
		case 1601:
		case 1602:
		case 1603:
		case 1599:
		case 1597:
		case 1598:
		case 1595:
		case 1596:
		case 1615:
		case 1604:
		case 1606:
		case 1611:
		case 1612:
		case 1613:
		case 1605:
		case 1610:
		case 1608:
		case 1609:
		case 1607:
		case 1594:
		case 1639:
		case 1641:
		case 1670:
		case 1671:
		case 1672:
		case 1673:
		case 1669:
		case 1667:
		case 1668:
		case 1665:
		case 1666:
		case 1664:
		case 1674:
		case 1676:
		case 1682:
		case 1683:
		case 1684:
		case 1675:
		case 1681:
		case 1679:
		case 1680:
		case 1677:
		case 1678:
		case 1640:
		case 1663:
		case 1661:
		case 1647:
		case 1648:
		case 1649:
		case 1650:
		case 1646:
		case 1644:
		case 1645:
		case 1642:
		case 1643:
		case 1662:
		case 1651:
		case 1653:
		case 1658:
		case 1659:
		case 1660:
		case 1652:
		case 1657:
		case 1655:
		case 1656:
		case 1654:
		case 1685:
		case 1593:
		case 1591:
		case 1529:
		case 1530:
		case 1531:
		case 1532:
		case 1528:
		case 1526:
		case 1527:
		case 1524:
		case 1525:
		case 1523:
		case 1533:
		case 1535:
		case 1541:
		case 1542:
		case 1543:
		case 1534:
		case 1540:
		case 1538:
		case 1539:
		case 1536:
		case 1537:
		case 1544:
		case 1522:
		case 1520:
		case 1506:
		case 1507:
		case 1508:
		case 1509:
		case 1505:
		case 1503:
		case 1504:
		case 1501:
		case 1502:
		case 1521:
		case 1510:
		case 1512:
		case 1517:
		case 1518:
		case 1519:
		case 1511:
		case 1516:
		case 1514:
		case 1515:
		case 1513:
		case 1592:
		case 1545:
		case 1547:
		case 1576:
		case 1577:
		case 1578:
		case 1579:
		case 1575:
		case 1573:
		case 1574:
		case 1571:
		case 1572:
		case 1570:
		case 1580:
		case 1582:
		case 1588:
		case 1589:
		case 1590:
		case 1581:
		case 1587:
		case 1585:
		case 1586:
		case 1583:
		case 1584:
		case 1546:
		case 1569:
		case 1567:
		case 1553:
		case 1554:
		case 1555:
		case 1556:
		case 1552:
		case 1550:
		case 1551:
		case 1548:
		case 1549:
		case 1568:
		case 1557:
		case 1559:
		case 1564:
		case 1565:
		case 1566:
		case 1558:
		case 1563:
		case 1561:
		case 1562:
		case 1560:
		case 1873:
		case 1686:
		case 1688:
		case 1810:
		case 1811:
		case 1812:
		case 1813:
		case 1809:
		case 1807:
		case 1808:
		case 1805:
		case 1806:
		case 1804:
		case 1814:
		case 1816:
		case 1822:
		case 1823:
		case 1824:
		case 1815:
		case 1821:
		case 1819:
		case 1820:
		case 1817:
		case 1818:
		case 1825:
		case 1803:
		case 1801:
		case 1787:
		case 1788:
		case 1789:
		case 1790:
		case 1786:
		case 1784:
		case 1785:
		case 1782:
		case 1783:
		case 1802:
		case 1791:
		case 1793:
		case 1798:
		case 1799:
		case 1800:
		case 1792:
		case 1797:
		case 1795:
		case 1796:
		case 1794:
		case 1781:
		case 1826:
		case 1828:
		case 1857:
		case 1858:
		case 1859:
		case 1860:
		case 1856:
		case 1854:
		case 1855:
		case 1852:
		case 1853:
		case 1851:
		case 1861:
		case 1863:
		case 1869:
		case 1870:
		case 1871:
		case 1862:
		case 1868:
		case 1866:
		case 1867:
		case 1864:
		case 1865:
		case 1827:
		case 1850:
		case 1848:
		case 1834:
		case 1835:
		case 1836:
		case 1837:
		case 1833:
		case 1831:
		case 1832:
		case 1829:
		case 1830:
		case 1849:
		case 1838:
		case 1840:
		case 1845:
		case 1846:
		case 1847:
		case 1839:
		case 1844:
		case 1842:
		case 1843:
		case 1841:
		case 1687:
		case 1780:
		case 1778:
		case 1717:
		case 1718:
		case 1719:
		case 1720:
		case 1716:
		case 1714:
		case 1715:
		case 1712:
		case 1713:
		case 1711:
		case 1721:
		case 1723:
		case 1729:
		case 1730:
		case 1731:
		case 1722:
		case 1728:
		case 1726:
		case 1727:
		case 1724:
		case 1725:
		case 1732:
		case 1710:
		case 1708:
		case 1694:
		case 1695:
		case 1696:
		case 1697:
		case 1693:
		case 1691:
		case 1692:
		case 1689:
		case 1690:
		case 1709:
		case 1698:
		case 1700:
		case 1705:
		case 1706:
		case 1707:
		case 1699:
		case 1704:
		case 1702:
		case 1703:
		case 1701:
		case 1779:
		case 1733:
		case 1735:
		case 1764:
		case 1765:
		case 1766:
		case 1767:
		case 1763:
		case 1761:
		case 1762:
		case 1759:
		case 1760:
		case 1758:
		case 1768:
		case 1770:
		case 1775:
		case 1776:
		case 1777:
		case 1769:
		case 1774:
		case 1772:
		case 1773:
		case 1771:
		case 1734:
		case 1757:
		case 1755:
		case 1741:
		case 1742:
		case 1743:
		case 1744:
		case 1740:
		case 1738:
		case 1739:
		case 1736:
		case 1737:
		case 1756:
		case 1745:
		case 1747:
		case 1752:
		case 1753:
		case 1754:
		case 1746:
		case 1751:
		case 1749:
		case 1750:
		case 1748:
		case 1500:
		case 2249:
		case 2251:
		case 2749:
		case 2750:
		case 2751:
		case 2752:
		case 2748:
		case 2746:
		case 2747:
		case 2744:
		case 2745:
		case 2743:
		case 2753:
		case 2755:
		case 2761:
		case 2762:
		case 2763:
		case 2754:
		case 2760:
		case 2758:
		case 2759:
		case 2756:
		case 2757:
		case 2764:
		case 2742:
		case 2740:
		case 2726:
		case 2727:
		case 2728:
		case 2729:
		case 2725:
		case 2723:
		case 2724:
		case 2721:
		case 2722:
		case 2741:
		case 2730:
		case 2732:
		case 2737:
		case 2738:
		case 2739:
		case 2731:
		case 2736:
		case 2734:
		case 2735:
		case 2733:
		case 2720:
		case 2765:
		case 2767:
		case 2796:
		case 2797:
		case 2798:
		case 2799:
		case 2795:
		case 2793:
		case 2794:
		case 2791:
		case 2792:
		case 2790:
		case 2800:
		case 2802:
		case 2808:
		case 2809:
		case 2810:
		case 2801:
		case 2807:
		case 2805:
		case 2806:
		case 2803:
		case 2804:
		case 2766:
		case 2789:
		case 2787:
		case 2773:
		case 2774:
		case 2775:
		case 2776:
		case 2772:
		case 2770:
		case 2771:
		case 2768:
		case 2769:
		case 2788:
		case 2777:
		case 2779:
		case 2784:
		case 2785:
		case 2786:
		case 2778:
		case 2783:
		case 2781:
		case 2782:
		case 2780:
		case 2811:
		case 2719:
		case 2717:
		case 2655:
		case 2656:
		case 2657:
		case 2658:
		case 2654:
		case 2652:
		case 2653:
		case 2650:
		case 2651:
		case 2649:
		case 2659:
		case 2661:
		case 2667:
		case 2668:
		case 2669:
		case 2660:
		case 2666:
		case 2664:
		case 2665:
		case 2662:
		case 2663:
		case 2670:
		case 2648:
		case 2646:
		case 2632:
		case 2633:
		case 2634:
		case 2635:
		case 2631:
		case 2629:
		case 2630:
		case 2627:
		case 2628:
		case 2647:
		case 2636:
		case 2638:
		case 2643:
		case 2644:
		case 2645:
		case 2637:
		case 2642:
		case 2640:
		case 2641:
		case 2639:
		case 2718:
		case 2671:
		case 2673:
		case 2702:
		case 2703:
		case 2704:
		case 2705:
		case 2701:
		case 2699:
		case 2700:
		case 2697:
		case 2698:
		case 2696:
		case 2706:
		case 2708:
		case 2714:
		case 2715:
		case 2716:
		case 2707:
		case 2713:
		case 2711:
		case 2712:
		case 2709:
		case 2710:
		case 2672:
		case 2695:
		case 2693:
		case 2679:
		case 2680:
		case 2681:
		case 2682:
		case 2678:
		case 2676:
		case 2677:
		case 2674:
		case 2675:
		case 2694:
		case 2683:
		case 2685:
		case 2690:
		case 2691:
		case 2692:
		case 2684:
		case 2689:
		case 2687:
		case 2688:
		case 2686:
		case 2626:
		case 2812:
		case 2814:
		case 2936:
		case 2937:
		case 2938:
		case 2939:
		case 2935:
		case 2933:
		case 2934:
		case 2931:
		case 2932:
		case 2930:
		case 2940:
		case 2942:
		case 2948:
		case 2949:
		case 2950:
		case 2941:
		case 2947:
		case 2945:
		case 2946:
		case 2943:
		case 2944:
		case 2951:
		case 2929:
		case 2927:
		case 2913:
		case 2914:
		case 2915:
		case 2916:
		case 2912:
		case 2910:
		case 2911:
		case 2908:
		case 2909:
		case 2928:
		case 2917:
		case 2919:
		case 2924:
		case 2925:
		case 2926:
		case 2918:
		case 2923:
		case 2921:
		case 2922:
		case 2920:
		case 2907:
		case 2952:
		case 2954:
		case 2983:
		case 2984:
		case 2985:
		case 2986:
		case 2982:
		case 2980:
		case 2981:
		case 2978:
		case 2979:
		case 2977:
		case 2987:
		case 2989:
		case 2995:
		case 2996:
		case 2997:
		case 2988:
		case 2994:
		case 2992:
		case 2993:
		case 2990:
		case 2991:
		case 2953:
		case 2976:
		case 2974:
		case 2960:
		case 2961:
		case 2962:
		case 2963:
		case 2959:
		case 2957:
		case 2958:
		case 2955:
		case 2956:
		case 2975:
		case 2964:
		case 2966:
		case 2971:
		case 2972:
		case 2973:
		case 2965:
		case 2970:
		case 2968:
		case 2969:
		case 2967:
		case 2813:
		case 2906:
		case 2904:
		case 2843:
		case 2844:
		case 2845:
		case 2846:
		case 2842:
		case 2840:
		case 2841:
		case 2838:
		case 2839:
		case 2837:
		case 2847:
		case 2849:
		case 2855:
		case 2856:
		case 2857:
		case 2848:
		case 2854:
		case 2852:
		case 2853:
		case 2850:
		case 2851:
		case 2858:
		case 2836:
		case 2834:
		case 2820:
		case 2821:
		case 2822:
		case 2823:
		case 2819:
		case 2817:
		case 2818:
		case 2815:
		case 2816:
		case 2835:
		case 2824:
		case 2826:
		case 2831:
		case 2832:
		case 2833:
		case 2825:
		case 2830:
		case 2828:
		case 2829:
		case 2827:
		case 2905:
		case 2859:
		case 2861:
		case 2890:
		case 2891:
		case 2892:
		case 2893:
		case 2889:
		case 2887:
		case 2888:
		case 2885:
		case 2886:
		case 2884:
		case 2894:
		case 2896:
		case 2901:
		case 2902:
		case 2903:
		case 2895:
		case 2900:
		case 2898:
		case 2899:
		case 2897:
		case 2860:
		case 2883:
		case 2881:
		case 2867:
		case 2868:
		case 2869:
		case 2870:
		case 2866:
		case 2864:
		case 2865:
		case 2862:
		case 2863:
		case 2882:
		case 2871:
		case 2873:
		case 2878:
		case 2879:
		case 2880:
		case 2872:
		case 2877:
		case 2875:
		case 2876:
		case 2874:
		case 2250:
		case 2625:
		case 2623:
		case 2374:
		case 2375:
		case 2376:
		case 2377:
		case 2373:
		case 2371:
		case 2372:
		case 2369:
		case 2370:
		case 2368:
		case 2378:
		case 2380:
		case 2386:
		case 2387:
		case 2388:
		case 2379:
		case 2385:
		case 2383:
		case 2384:
		case 2381:
		case 2382:
		case 2389:
		case 2367:
		case 2365:
		case 2351:
		case 2352:
		case 2353:
		case 2354:
		case 2350:
		case 2348:
		case 2349:
		case 2346:
		case 2347:
		case 2366:
		case 2355:
		case 2357:
		case 2362:
		case 2363:
		case 2364:
		case 2356:
		case 2361:
		case 2359:
		case 2360:
		case 2358:
		case 2345:
		case 2390:
		case 2392:
		case 2421:
		case 2422:
		case 2423:
		case 2424:
		case 2420:
		case 2418:
		case 2419:
		case 2416:
		case 2417:
		case 2415:
		case 2425:
		case 2427:
		case 2433:
		case 2434:
		case 2435:
		case 2426:
		case 2432:
		case 2430:
		case 2431:
		case 2428:
		case 2429:
		case 2391:
		case 2414:
		case 2412:
		case 2398:
		case 2399:
		case 2400:
		case 2401:
		case 2397:
		case 2395:
		case 2396:
		case 2393:
		case 2394:
		case 2413:
		case 2402:
		case 2404:
		case 2409:
		case 2410:
		case 2411:
		case 2403:
		case 2408:
		case 2406:
		case 2407:
		case 2405:
		case 2436:
		case 2344:
		case 2342:
		case 2280:
		case 2281:
		case 2282:
		case 2283:
		case 2279:
		case 2277:
		case 2278:
		case 2275:
		case 2276:
		case 2274:
		case 2284:
		case 2286:
		case 2292:
		case 2293:
		case 2294:
		case 2285:
		case 2291:
		case 2289:
		case 2290:
		case 2287:
		case 2288:
		case 2295:
		case 2273:
		case 2271:
		case 2257:
		case 2258:
		case 2259:
		case 2260:
		case 2256:
		case 2254:
		case 2255:
		case 2252:
		case 2253:
		case 2272:
		case 2261:
		case 2263:
		case 2268:
		case 2269:
		case 2270:
		case 2262:
		case 2267:
		case 2265:
		case 2266:
		case 2264:
		case 2343:
		case 2296:
		case 2298:
		case 2327:
		case 2328:
		case 2329:
		case 2330:
		case 2326:
		case 2324:
		case 2325:
		case 2322:
		case 2323:
		case 2321:
		case 2331:
		case 2333:
		case 2339:
		case 2340:
		case 2341:
		case 2332:
		case 2338:
		case 2336:
		case 2337:
		case 2334:
		case 2335:
		case 2297:
		case 2320:
		case 2318:
		case 2304:
		case 2305:
		case 2306:
		case 2307:
		case 2303:
		case 2301:
		case 2302:
		case 2299:
		case 2300:
		case 2319:
		case 2308:
		case 2310:
		case 2315:
		case 2316:
		case 2317:
		case 2309:
		case 2314:
		case 2312:
		case 2313:
		case 2311:
		case 2624:
		case 2437:
		case 2439:
		case 2561:
		case 2562:
		case 2563:
		case 2564:
		case 2560:
		case 2558:
		case 2559:
		case 2556:
		case 2557:
		case 2555:
		case 2565:
		case 2567:
		case 2573:
		case 2574:
		case 2575:
		case 2566:
		case 2572:
		case 2570:
		case 2571:
		case 2568:
		case 2569:
		case 2576:
		case 2554:
		case 2552:
		case 2538:
		case 2539:
		case 2540:
		case 2541:
		case 2537:
		case 2535:
		case 2536:
		case 2533:
		case 2534:
		case 2553:
		case 2542:
		case 2544:
		case 2549:
		case 2550:
		case 2551:
		case 2543:
		case 2548:
		case 2546:
		case 2547:
		case 2545:
		case 2532:
		case 2577:
		case 2579:
		case 2608:
		case 2609:
		case 2610:
		case 2611:
		case 2607:
		case 2605:
		case 2606:
		case 2603:
		case 2604:
		case 2602:
		case 2612:
		case 2614:
		case 2620:
		case 2621:
		case 2622:
		case 2613:
		case 2619:
		case 2617:
		case 2618:
		case 2615:
		case 2616:
		case 2578:
		case 2601:
		case 2599:
		case 2585:
		case 2586:
		case 2587:
		case 2588:
		case 2584:
		case 2582:
		case 2583:
		case 2580:
		case 2581:
		case 2600:
		case 2589:
		case 2591:
		case 2596:
		case 2597:
		case 2598:
		case 2590:
		case 2595:
		case 2593:
		case 2594:
		case 2592:
		case 2438:
		case 2531:
		case 2529:
		case 2468:
		case 2469:
		case 2470:
		case 2471:
		case 2467:
		case 2465:
		case 2466:
		case 2463:
		case 2464:
		case 2462:
		case 2472:
		case 2474:
		case 2480:
		case 2481:
		case 2482:
		case 2473:
		case 2479:
		case 2477:
		case 2478:
		case 2475:
		case 2476:
		case 2483:
		case 2461:
		case 2459:
		case 2445:
		case 2446:
		case 2447:
		case 2448:
		case 2444:
		case 2442:
		case 2443:
		case 2440:
		case 2441:
		case 2460:
		case 2449:
		case 2451:
		case 2456:
		case 2457:
		case 2458:
		case 2450:
		case 2455:
		case 2453:
		case 2454:
		case 2452:
		case 2530:
		case 2484:
		case 2486:
		case 2515:
		case 2516:
		case 2517:
		case 2518:
		case 2514:
		case 2512:
		case 2513:
		case 2510:
		case 2511:
		case 2509:
		case 2519:
		case 2521:
		case 2526:
		case 2527:
		case 2528:
		case 2520:
		case 2525:
		case 2523:
		case 2524:
		case 2522:
		case 2485:
		case 2508:
		case 2506:
		case 2492:
		case 2493:
		case 2494:
		case 2495:
		case 2491:
		case 2489:
		case 2490:
		case 2487:
		case 2488:
		case 2507:
		case 2496:
		case 2498:
		case 2503:
		case 2504:
		case 2505:
		case 2497:
		case 2502:
		case 2500:
		case 2501:
		case 2499:
		case 2998:
		case 1499:
		case 1497:
		case 498:
		case 499:
		case 500:
		case 501:
		case 497:
		case 495:
		case 496:
		case 493:
		case 494:
		case 492:
		case 502:
		case 504:
		case 510:
		case 511:
		case 512:
		case 503:
		case 509:
		case 507:
		case 508:
		case 505:
		case 506:
		case 513:
		case 491:
		case 489:
		case 475:
		case 476:
		case 477:
		case 478:
		case 474:
		case 472:
		case 473:
		case 470:
		case 471:
		case 490:
		case 479:
		case 481:
		case 486:
		case 487:
		case 488:
		case 480:
		case 485:
		case 483:
		case 484:
		case 482:
		case 469:
		case 514:
		case 516:
		case 545:
		case 546:
		case 547:
		case 548:
		case 544:
		case 542:
		case 543:
		case 540:
		case 541:
		case 539:
		case 549:
		case 551:
		case 557:
		case 558:
		case 559:
		case 550:
		case 556:
		case 554:
		case 555:
		case 552:
		case 553:
		case 515:
		case 538:
		case 536:
		case 522:
		case 523:
		case 524:
		case 525:
		case 521:
		case 519:
		case 520:
		case 517:
		case 518:
		case 537:
		case 526:
		case 528:
		case 533:
		case 534:
		case 535:
		case 527:
		case 532:
		case 530:
		case 531:
		case 529:
		case 560:
		case 468:
		case 466:
		case 404:
		case 405:
		case 406:
		case 407:
		case 403:
		case 401:
		case 402:
		case 399:
		case 400:
		case 398:
		case 408:
		case 410:
		case 416:
		case 417:
		case 418:
		case 409:
		case 415:
		case 413:
		case 414:
		case 411:
		case 412:
		case 419:
		case 397:
		case 395:
		case 381:
		case 382:
		case 383:
		case 384:
		case 380:
		case 378:
		case 379:
		case 376:
		case 377:
		case 396:
		case 385:
		case 387:
		case 392:
		case 393:
		case 394:
		case 386:
		case 391:
		case 389:
		case 390:
		case 388:
		case 467:
		case 420:
		case 422:
		case 451:
		case 452:
		case 453:
		case 454:
		case 450:
		case 448:
		case 449:
		case 446:
		case 447:
		case 445:
		case 455:
		case 457:
		case 463:
		case 464:
		case 465:
		case 456:
		case 462:
		case 460:
		case 461:
		case 458:
		case 459:
		case 421:
		case 444:
		case 442:
		case 428:
		case 429:
		case 430:
		case 431:
		case 427:
		case 425:
		case 426:
		case 423:
		case 424:
		case 443:
		case 432:
		case 434:
		case 439:
		case 440:
		case 441:
		case 433:
		case 438:
		case 436:
		case 437:
		case 435:
		case 375:
		case 561:
		case 563:
		case 685:
		case 686:
		case 687:
		case 688:
		case 684:
		case 682:
		case 683:
		case 680:
		case 681:
		case 679:
		case 689:
		case 691:
		case 697:
		case 698:
		case 699:
		case 690:
		case 696:
		case 694:
		case 695:
		case 692:
		case 693:
		case 700:
		case 678:
		case 676:
		case 662:
		case 663:
		case 664:
		case 665:
		case 661:
		case 659:
		case 660:
		case 657:
		case 658:
		case 677:
		case 666:
		case 668:
		case 673:
		case 674:
		case 675:
		case 667:
		case 672:
		case 670:
		case 671:
		case 669:
		case 656:
		case 701:
		case 703:
		case 732:
		case 733:
		case 734:
		case 735:
		case 731:
		case 729:
		case 730:
		case 727:
		case 728:
		case 726:
		case 736:
		case 738:
		case 744:
		case 745:
		case 746:
		case 737:
		case 743:
		case 741:
		case 742:
		case 739:
		case 740:
		case 702:
		case 725:
		case 723:
		case 709:
		case 710:
		case 711:
		case 712:
		case 708:
		case 706:
		case 707:
		case 704:
		case 705:
		case 724:
		case 713:
		case 715:
		case 720:
		case 721:
		case 722:
		case 714:
		case 719:
		case 717:
		case 718:
		case 716:
		case 562:
		case 655:
		case 653:
		case 592:
		case 593:
		case 594:
		case 595:
		case 591:
		case 589:
		case 590:
		case 587:
		case 588:
		case 586:
		case 596:
		case 598:
		case 604:
		case 605:
		case 606:
		case 597:
		case 603:
		case 601:
		case 602:
		case 599:
		case 600:
		case 607:
		case 585:
		case 583:
		case 569:
		case 570:
		case 571:
		case 572:
		case 568:
		case 566:
		case 567:
		case 564:
		case 565:
		case 584:
		case 573:
		case 575:
		case 580:
		case 581:
		case 582:
		case 574:
		case 579:
		case 577:
		case 578:
		case 576:
		case 654:
		case 608:
		case 610:
		case 639:
		case 640:
		case 641:
		case 642:
		case 638:
		case 636:
		case 637:
		case 634:
		case 635:
		case 633:
		case 643:
		case 645:
		case 650:
		case 651:
		case 652:
		case 644:
		case 649:
		case 647:
		case 648:
		case 646:
		case 609:
		case 632:
		case 630:
		case 616:
		case 617:
		case 618:
		case 619:
		case 615:
		case 613:
		case 614:
		case 611:
		case 612:
		case 631:
		case 620:
		case 622:
		case 627:
		case 628:
		case 629:
		case 621:
		case 626:
		case 624:
		case 625:
		case 623:
		case 747:
		case 374:
		case 372:
		case 123:
		case 124:
		case 125:
		case 126:
		case 122:
		case 120:
		case 121:
		case 118:
		case 119:
		case 117:
		case 127:
		case 129:
		case 135:
		case 136:
		case 137:
		case 128:
		case 134:
		case 132:
		case 133:
		case 130:
		case 131:
		case 138:
		case 116:
		case 114:
		case 100:
		case 101:
		case 102:
		case 103:
		case 99:
		case 97:
		case 98:
		case 95:
		case 96:
		case 115:
		case 104:
		case 106:
		case 111:
		case 112:
		case 113:
		case 105:
		case 110:
		case 108:
		case 109:
		case 107:
		case 94:
		case 139:
		case 141:
		case 170:
		case 171:
		case 172:
		case 173:
		case 169:
		case 167:
		case 168:
		case 165:
		case 166:
		case 164:
		case 174:
		case 176:
		case 182:
		case 183:
		case 184:
		case 175:
		case 181:
		case 179:
		case 180:
		case 177:
		case 178:
		case 140:
		case 163:
		case 161:
		case 147:
		case 148:
		case 149:
		case 150:
		case 146:
		case 144:
		case 145:
		case 142:
		case 143:
		case 162:
		case 151:
		case 153:
		case 158:
		case 159:
		case 160:
		case 152:
		case 157:
		case 155:
		case 156:
		case 154:
		case 185:
		case 93:
		case 91:
		case 29:
		case 30:
		case 31:
		case 32:
		case 28:
		case 26:
		case 27:
		case 24:
		case 25:
		case 23:
		case 33:
		case 35:
		case 41:
		case 42:
		case 43:
		case 34:
		case 40:
		case 38:
		case 39:
		case 36:
		case 37:
		case 44:
		case 22:
		case 20:
		case 6:
		case 7:
		case 8:
		case 9:
		case 5:
		case 3:
		case 4:
		case 1:
		case 2:
		case 21:
		case 10:
		case 12:
		case 17:
		case 18:
		case 19:
		case 11:
		case 16:
		case 14:
		case 15:
		case 13:
		case 92:
		case 45:
		case 47:
		case 76:
		case 77:
		case 78:
		case 79:
		case 75:
		case 73:
		case 74:
		case 71:
		case 72:
		case 70:
		case 80:
		case 82:
		case 88:
		case 89:
		case 90:
		case 81:
		case 87:
		case 85:
		case 86:
		case 83:
		case 84:
		case 46:
		case 69:
		case 67:
		case 53:
		case 54:
		case 55:
		case 56:
		case 52:
		case 50:
		case 51:
		case 48:
		case 49:
		case 68:
		case 57:
		case 59:
		case 64:
		case 65:
		case 66:
		case 58:
		case 63:
		case 61:
		case 62:
		case 60:
		case 373:
		case 186:
		case 188:
		case 310:
		case 311:
		case 312:
		case 313:
		case 309:
		case 307:
		case 308:
		case 305:
		case 306:
		case 304:
		case 314:
		case 316:
		case 322:
		case 323:
		case 324:
		case 315:
		case 321:
		case 319:
		case 320:
		case 317:
		case 318:
		case 325:
		case 303:
		case 301:
		case 287:
		case 288:
		case 289:
		case 290:
		case 286:
		case 284:
		case 285:
		case 282:
		case 283:
		case 302:
		case 291:
		case 293:
		case 298:
		case 299:
		case 300:
		case 292:
		case 297:
		case 295:
		case 296:
		case 294:
		case 281:
		case 326:
		case 328:
		case 357:
		case 358:
		case 359:
		case 360:
		case 356:
		case 354:
		case 355:
		case 352:
		case 353:
		case 351:
		case 361:
		case 363:
		case 369:
		case 370:
		case 371:
		case 362:
		case 368:
		case 366:
		case 367:
		case 364:
		case 365:
		case 327:
		case 350:
		case 348:
		case 334:
		case 335:
		case 336:
		case 337:
		case 333:
		case 331:
		case 332:
		case 329:
		case 330:
		case 349:
		case 338:
		case 340:
		case 345:
		case 346:
		case 347:
		case 339:
		case 344:
		case 342:
		case 343:
		case 341:
		case 187:
		case 280:
		case 278:
		case 217:
		case 218:
		case 219:
		case 220:
		case 216:
		case 214:
		case 215:
		case 212:
		case 213:
		case 211:
		case 221:
		case 223:
		case 229:
		case 230:
		case 231:
		case 222:
		case 228:
		case 226:
		case 227:
		case 224:
		case 225:
		case 232:
		case 210:
		case 208:
		case 194:
		case 195:
		case 196:
		case 197:
		case 193:
		case 191:
		case 192:
		case 189:
		case 190:
		case 209:
		case 198:
		case 200:
		case 205:
		case 206:
		case 207:
		case 199:
		case 204:
		case 202:
		case 203:
		case 201:
		case 279:
		case 233:
		case 235:
		case 264:
		case 265:
		case 266:
		case 267:
		case 263:
		case 261:
		case 262:
		case 259:
		case 260:
		case 258:
		case 268:
		case 270:
		case 275:
		case 276:
		case 277:
		case 269:
		case 274:
		case 272:
		case 273:
		case 271:
		case 234:
		case 257:
		case 255:
		case 241:
		case 242:
		case 243:
		case 244:
		case 240:
		case 238:
		case 239:
		case 236:
		case 237:
		case 256:
		case 245:
		case 247:
		case 252:
		case 253:
		case 254:
		case 246:
		case 251:
		case 249:
		case 250:
		case 248:
		case 1498:
		case 748:
		case 750:
		case 1248:
		case 1249:
		case 1250:
		case 1251:
		case 1247:
		case 1245:
		case 1246:
		case 1243:
		case 1244:
		case 1242:
		case 1252:
		case 1254:
		case 1260:
		case 1261:
		case 1262:
		case 1253:
		case 1259:
		case 1257:
		case 1258:
		case 1255:
		case 1256:
		case 1263:
		case 1241:
		case 1239:
		case 1225:
		case 1226:
		case 1227:
		case 1228:
		case 1224:
		case 1222:
		case 1223:
		case 1220:
		case 1221:
		case 1240:
		case 1229:
		case 1231:
		case 1236:
		case 1237:
		case 1238:
		case 1230:
		case 1235:
		case 1233:
		case 1234:
		case 1232:
		case 1219:
		case 1264:
		case 1266:
		case 1295:
		case 1296:
		case 1297:
		case 1298:
		case 1294:
		case 1292:
		case 1293:
		case 1290:
		case 1291:
		case 1289:
		case 1299:
		case 1301:
		case 1307:
		case 1308:
		case 1309:
		case 1300:
		case 1306:
		case 1304:
		case 1305:
		case 1302:
		case 1303:
		case 1265:
		case 1288:
		case 1286:
		case 1272:
		case 1273:
		case 1274:
		case 1275:
		case 1271:
		case 1269:
		case 1270:
		case 1267:
		case 1268:
		case 1287:
		case 1276:
		case 1278:
		case 1283:
		case 1284:
		case 1285:
		case 1277:
		case 1282:
		case 1280:
		case 1281:
		case 1279:
		case 1310:
		case 1218:
		case 1216:
		case 1154:
		case 1155:
		case 1156:
		case 1157:
		case 1153:
		case 1151:
		case 1152:
		case 1149:
		case 1150:
		case 1148:
		case 1158:
		case 1160:
		case 1166:
		case 1167:
		case 1168:
		case 1159:
		case 1165:
		case 1163:
		case 1164:
		case 1161:
		case 1162:
		case 1169:
		case 1147:
		case 1145:
		case 1131:
		case 1132:
		case 1133:
		case 1134:
		case 1130:
		case 1128:
		case 1129:
		case 1126:
		case 1127:
		case 1146:
		case 1135:
		case 1137:
		case 1142:
		case 1143:
		case 1144:
		case 1136:
		case 1141:
		case 1139:
		case 1140:
		case 1138:
		case 1217:
		case 1170:
		case 1172:
		case 1201:
		case 1202:
		case 1203:
		case 1204:
		case 1200:
		case 1198:
		case 1199:
		case 1196:
		case 1197:
		case 1195:
		case 1205:
		case 1207:
		case 1213:
		case 1214:
		case 1215:
		case 1206:
		case 1212:
		case 1210:
		case 1211:
		case 1208:
		case 1209:
		case 1171:
		case 1194:
		case 1192:
		case 1178:
		case 1179:
		case 1180:
		case 1181:
		case 1177:
		case 1175:
		case 1176:
		case 1173:
		case 1174:
		case 1193:
		case 1182:
		case 1184:
		case 1189:
		case 1190:
		case 1191:
		case 1183:
		case 1188:
		case 1186:
		case 1187:
		case 1185:
		case 1125:
		case 1311:
		case 1313:
		case 1435:
		case 1436:
		case 1437:
		case 1438:
		case 1434:
		case 1432:
		case 1433:
		case 1430:
		case 1431:
		case 1429:
		case 1439:
		case 1441:
		case 1447:
		case 1448:
		case 1449:
		case 1440:
		case 1446:
		case 1444:
		case 1445:
		case 1442:
		case 1443:
		case 1450:
		case 1428:
		case 1426:
		case 1412:
		case 1413:
		case 1414:
		case 1415:
		case 1411:
		case 1409:
		case 1410:
		case 1407:
		case 1408:
		case 1427:
		case 1416:
		case 1418:
		case 1423:
		case 1424:
		case 1425:
		case 1417:
		case 1422:
		case 1420:
		case 1421:
		case 1419:
		case 1406:
		case 1451:
		case 1453:
		case 1482:
		case 1483:
		case 1484:
		case 1485:
		case 1481:
		case 1479:
		case 1480:
		case 1477:
		case 1478:
		case 1476:
		case 1486:
		case 1488:
		case 1494:
		case 1495:
		case 1496:
		case 1487:
		case 1493:
		case 1491:
		case 1492:
		case 1489:
		case 1490:
		case 1452:
		case 1475:
		case 1473:
		case 1459:
		case 1460:
		case 1461:
		case 1462:
		case 1458:
		case 1456:
		case 1457:
		case 1454:
		case 1455:
		case 1474:
		case 1463:
		case 1465:
		case 1470:
		case 1471:
		case 1472:
		case 1464:
		case 1469:
		case 1467:
		case 1468:
		case 1466:
		case 1312:
		case 1405:
		case 1403:
		case 1342:
		case 1343:
		case 1344:
		case 1345:
		case 1341:
		case 1339:
		case 1340:
		case 1337:
		case 1338:
		case 1336:
		case 1346:
		case 1348:
		case 1354:
		case 1355:
		case 1356:
		case 1347:
		case 1353:
		case 1351:
		case 1352:
		case 1349:
		case 1350:
		case 1357:
		case 1335:
		case 1333:
		case 1319:
		case 1320:
		case 1321:
		case 1322:
		case 1318:
		case 1316:
		case 1317:
		case 1314:
		case 1315:
		case 1334:
		case 1323:
		case 1325:
		case 1330:
		case 1331:
		case 1332:
		case 1324:
		case 1329:
		case 1327:
		case 1328:
		case 1326:
		case 1404:
		case 1358:
		case 1360:
		case 1389:
		case 1390:
		case 1391:
		case 1392:
		case 1388:
		case 1386:
		case 1387:
		case 1384:
		case 1385:
		case 1383:
		case 1393:
		case 1395:
		case 1400:
		case 1401:
		case 1402:
		case 1394:
		case 1399:
		case 1397:
		case 1398:
		case 1396:
		case 1359:
		case 1382:
		case 1380:
		case 1366:
		case 1367:
		case 1368:
		case 1369:
		case 1365:
		case 1363:
		case 1364:
		case 1361:
		case 1362:
		case 1381:
		case 1370:
		case 1372:
		case 1377:
		case 1378:
		case 1379:
		case 1371:
		case 1376:
		case 1374:
		case 1375:
		case 1373:
		case 749:
		case 1124:
		case 1122:
		case 873:
		case 874:
		case 875:
		case 876:
		case 872:
		case 870:
		case 871:
		case 868:
		case 869:
		case 867:
		case 877:
		case 879:
		case 885:
		case 886:
		case 887:
		case 878:
		case 884:
		case 882:
		case 883:
		case 880:
		case 881:
		case 888:
		case 866:
		case 864:
		case 850:
		case 851:
		case 852:
		case 853:
		case 849:
		case 847:
		case 848:
		case 845:
		case 846:
		case 865:
		case 854:
		case 856:
		case 861:
		case 862:
		case 863:
		case 855:
		case 860:
		case 858:
		case 859:
		case 857:
		case 844:
		case 889:
		case 891:
		case 920:
		case 921:
		case 922:
		case 923:
		case 919:
		case 917:
		case 918:
		case 915:
		case 916:
		case 914:
		case 924:
		case 926:
		case 932:
		case 933:
		case 934:
		case 925:
		case 931:
		case 929:
		case 930:
		case 927:
		case 928:
		case 890:
		case 913:
		case 911:
		case 897:
		case 898:
		case 899:
		case 900:
		case 896:
		case 894:
		case 895:
		case 892:
		case 893:
		case 912:
		case 901:
		case 903:
		case 908:
		case 909:
		case 910:
		case 902:
		case 907:
		case 905:
		case 906:
		case 904:
		case 935:
		case 843:
		case 841:
		case 779:
		case 780:
		case 781:
		case 782:
		case 778:
		case 776:
		case 777:
		case 774:
		case 775:
		case 773:
		case 783:
		case 785:
		case 791:
		case 792:
		case 793:
		case 784:
		case 790:
		case 788:
		case 789:
		case 786:
		case 787:
		case 794:
		case 772:
		case 770:
		case 756:
		case 757:
		case 758:
		case 759:
		case 755:
		case 753:
		case 754:
		case 751:
		case 752:
		case 771:
		case 760:
		case 762:
		case 767:
		case 768:
		case 769:
		case 761:
		case 766:
		case 764:
		case 765:
		case 763:
		case 842:
		case 795:
		case 797:
		case 826:
		case 827:
		case 828:
		case 829:
		case 5999:
		case 823:
		case 824:
		case 821:
		case 822:
		case 820:
		case 830:
		case 832:
		case 838:
		case 839:
		case 840:
		case 831:
		case 837:
		case 835:
		case 836:
		case 833:
		case 834:
		case 796:
		case 819:
		case 817:
		case 803:
		case 804:
		case 805:
		case 806:
		case 802:
		case 800:
		case 801:
		case 798:
		case 799:
		case 818:
		case 807:
		case 809:
		case 814:
		case 815:
		case 816:
		case 808:
		case 813:
		case 811:
		case 812:
		case 810:
		case 1123:
		case 936:
		case 938:
		case 1060:
		case 1061:
		case 1062:
		case 1063:
		case 1059:
		case 1057:
		case 1058:
		case 1055:
		case 1056:
		case 1054:
		case 1064:
		case 1066:
		case 1072:
		case 1073:
		case 1074:
		case 1065:
		case 1071:
		case 1069:
		case 1070:
		case 1067:
		case 1068:
		case 1075:
		case 1053:
		case 1051:
		case 1037:
		case 1038:
		case 1039:
		case 1040:
		case 1036:
		case 1034:
		case 1035:
		case 1032:
		case 1033:
		case 1052:
		case 1041:
		case 1043:
		case 1048:
		case 1049:
		case 1050:
		case 1042:
		case 1047:
		case 1045:
		case 1046:
		case 1044:
		case 1031:
		case 1076:
		case 1078:
		case 1107:
		case 1108:
		case 1109:
		case 1110:
		case 1106:
		case 1104:
		case 1105:
		case 1102:
		case 1103:
		case 1101:
		case 1111:
		case 1113:
		case 1119:
		case 1120:
		case 1121:
		case 1112:
		case 1118:
		case 1116:
		case 1117:
		case 1114:
		case 1115:
		case 1077:
		case 1100:
		case 1098:
		case 1084:
		case 1085:
		case 1086:
		case 1087:
		case 1083:
		case 1081:
		case 1082:
		case 1079:
		case 1080:
		case 1099:
		case 1088:
		case 1090:
		case 1095:
		case 1096:
		case 1097:
		case 1089:
		case 1094:
		case 1092:
		case 1093:
		case 1091:
		case 937:
		case 1030:
		case 1028:
		case 967:
		case 968:
		case 969:
		case 970:
		case 966:
		case 964:
		case 965:
		case 962:
		case 963:
		case 961:
		case 971:
		case 973:
		case 979:
		case 980:
		case 981:
		case 972:
		case 978:
		case 976:
		case 977:
		case 974:
		case 975:
		case 982:
		case 960:
		case 958:
		case 944:
		case 945:
		case 946:
		case 947:
		case 943:
		case 941:
		case 942:
		case 939:
		case 940:
		case 959:
		case 948:
		case 950:
		case 955:
		case 956:
		case 957:
		case 949:
		case 954:
		case 952:
		case 953:
		case 951:
		case 1029:
		case 983:
		case 985:
		case 1014:
		case 1015:
		case 1016:
		case 1017:
		case 1013:
		case 1011:
		case 1012:
		case 1009:
		case 1010:
		case 1008:
		case 1018:
		case 1020:
		case 1025:
		case 1026:
		case 1027:
		case 1019:
		case 1024:
		case 1022:
		case 1023:
		case 1021:
		case 984:
		case 1007:
		case 1005:
		case 991:
		case 992:
		case 993:
		case 994:
		case 990:
		case 988:
		case 989:
		case 986:
		case 987:
		case 1006:
		case 995:
		case 997:
		case 1002:
		case 1003:
		case 1004:
		case 996:
		case 1001:
		case 999:
		case 1000:
		case 998:
		case 2999:
		case 825:
		case 3001:
		case 4998:
		case 4999:
		case 5000:
		case 5001:
		case 4997:
		case 4995:
		case 4996:
		case 4993:
		case 4994:
		case 4992:
		case 5002:
		case 5004:
		case 5010:
		case 5011:
		case 5012:
		case 5003:
		case 5009:
		case 5007:
		case 5008:
		case 5005:
		case 5006:
		case 5013:
		case 4991:
		case 4989:
		case 4975:
		case 4976:
		case 4977:
		case 4978:
		case 4974:
		case 4972:
		case 4973:
		case 4970:
		case 4971:
		case 4990:
		case 4979:
		case 4981:
		case 4986:
		case 4987:
		case 4988:
		case 4980:
		case 4985:
		case 4983:
		case 4984:
		case 4982:
		case 4969:
		case 5014:
		case 5016:
		case 5045:
		case 5046:
		case 5047:
		case 5048:
		case 5044:
		case 5042:
		case 5043:
		case 5040:
		case 5041:
		case 5039:
		case 5049:
		case 5051:
		case 5057:
		case 5058:
		case 5059:
		case 5050:
		case 5056:
		case 5054:
		case 5055:
		case 5052:
		case 5053:
		case 5015:
		case 5038:
		case 5036:
		case 5022:
		case 5023:
		case 5024:
		case 5025:
		case 5021:
		case 5019:
		case 5020:
		case 5017:
		case 5018:
		case 5037:
		case 5026:
		case 5028:
		case 5033:
		case 5034:
		case 5035:
		case 5027:
		case 5032:
		case 5030:
		case 5031:
		case 5029:
		case 5060:
		case 4968:
		case 4966:
		case 4904:
		case 4905:
		case 4906:
		case 4907:
		case 4903:
		case 4901:
		case 4902:
		case 4899:
		case 4900:
		case 4898:
		case 4908:
		case 4910:
		case 4916:
		case 4917:
		case 4918:
		case 4909:
		case 4915:
		case 4913:
		case 4914:
		case 4911:
		case 4912:
		case 4919:
		case 4897:
		case 4895:
		case 4881:
		case 4882:
		case 4883:
		case 4884:
		case 4880:
		case 4878:
		case 4879:
		case 4876:
		case 4877:
		case 4896:
		case 4885:
		case 4887:
		case 4892:
		case 4893:
		case 4894:
		case 4886:
		case 4891:
		case 4889:
		case 4890:
		case 4888:
		case 4967:
		case 4920:
		case 4922:
		case 4951:
		case 4952:
		case 4953:
		case 4954:
		case 4950:
		case 4948:
		case 4949:
		case 4946:
		case 4947:
		case 4945:
		case 4955:
		case 4957:
		case 4963:
		case 4964:
		case 4965:
		case 4956:
		case 4962:
		case 4960:
		case 4961:
		case 4958:
		case 4959:
		case 4921:
		case 4944:
		case 4942:
		case 4928:
		case 4929:
		case 4930:
		case 4931:
		case 4927:
		case 4925:
		case 4926:
		case 4923:
		case 4924:
		case 4943:
		case 4932:
		case 4934:
		case 4939:
		case 4940:
		case 4941:
		case 4933:
		case 4938:
		case 4936:
		case 4937:
		case 4935:
		case 4875:
		case 5061:
		case 5063:
		case 5186:
		case 5187:
		case 5188:
		case 5189:
		case 5185:
		case 5183:
		case 5184:
		case 5181:
		case 5182:
		case 5180:
		case 5190:
		case 5192:
		case 5198:
		case 5199:
		case 5200:
		case 5191:
		case 5197:
		case 5195:
		case 5196:
		case 5193:
		case 5194:
		case 5201:
		case 5179:
		case 5177:
		case 5163:
		case 5164:
		case 5165:
		case 5166:
		case 5162:
		case 5160:
		case 5161:
		case 5158:
		case 5159:
		case 5178:
		case 5167:
		case 5169:
		case 5174:
		case 5175:
		case 5176:
		case 5168:
		case 5173:
		case 5171:
		case 5172:
		case 5170:
		case 5157:
		case 5202:
		case 5204:
		case 5233:
		case 5234:
		case 5235:
		case 5236:
		case 5232:
		case 5230:
		case 5231:
		case 5228:
		case 5229:
		case 5227:
		case 5237:
		case 5239:
		case 5245:
		case 5246:
		case 5247:
		case 5238:
		case 5244:
		case 5242:
		case 5243:
		case 5240:
		case 5241:
		case 5203:
		case 5226:
		case 5224:
		case 5210:
		case 5211:
		case 5212:
		case 5213:
		case 5209:
		case 5207:
		case 5208:
		case 5205:
		case 5206:
		case 5225:
		case 5214:
		case 5216:
		case 5221:
		case 5222:
		case 5223:
		case 5215:
		case 5220:
		case 5218:
		case 5219:
		case 5217:
		case 5062:
		case 5156:
		case 5154:
		case 5092:
		case 5093:
		case 5094:
		case 5095:
		case 5091:
		case 5089:
		case 5090:
		case 5087:
		case 5088:
		case 5086:
		case 5096:
		case 5098:
		case 5104:
		case 5105:
		case 5106:
		case 5097:
		case 5103:
		case 5101:
		case 5102:
		case 5099:
		case 5100:
		case 5107:
		case 5085:
		case 5083:
		case 5069:
		case 5070:
		case 5071:
		case 5072:
		case 5068:
		case 5066:
		case 5067:
		case 5064:
		case 5065:
		case 5084:
		case 5073:
		case 5075:
		case 5080:
		case 5081:
		case 5082:
		case 5074:
		case 5079:
		case 5077:
		case 5078:
		case 5076:
		case 5155:
		case 5108:
		case 5110:
		case 5139:
		case 5140:
		case 5141:
		case 5142:
		case 5138:
		case 5136:
		case 5137:
		case 5134:
		case 5135:
		case 5133:
		case 5143:
		case 5145:
		case 5151:
		case 5152:
		case 5153:
		case 5144:
		case 5150:
		case 5148:
		case 5149:
		case 5146:
		case 5147:
		case 5109:
		case 5132:
		case 5130:
		case 5116:
		case 5117:
		case 5118:
		case 5119:
		case 5115:
		case 5113:
		case 5114:
		case 5111:
		case 5112:
		case 5131:
		case 5120:
		case 5122:
		case 5127:
		case 5128:
		case 5129:
		case 5121:
		case 5126:
		case 5124:
		case 5125:
		case 5123:
		case 5248:
		case 4874:
		case 4872:
		case 4623:
		case 4624:
		case 4625:
		case 4626:
		case 4622:
		case 4620:
		case 4621:
		case 4618:
		case 4619:
		case 4617:
		case 4627:
		case 4629:
		case 4635:
		case 4636:
		case 4637:
		case 4628:
		case 4634:
		case 4632:
		case 4633:
		case 4630:
		case 4631:
		case 4638:
		case 4616:
		case 4614:
		case 4600:
		case 4601:
		case 4602:
		case 4603:
		case 4599:
		case 4597:
		case 4598:
		case 4595:
		case 4596:
		case 4615:
		case 4604:
		case 4606:
		case 4611:
		case 4612:
		case 4613:
		case 4605:
		case 4610:
		case 4608:
		case 4609:
		case 4607:
		case 4594:
		case 4639:
		case 4641:
		case 4670:
		case 4671:
		case 4672:
		case 4673:
		case 4669:
		case 4667:
		case 4668:
		case 4665:
		case 4666:
		case 4664:
		case 4674:
		case 4676:
		case 4682:
		case 4683:
		case 4684:
		case 4675:
		case 4681:
		case 4679:
		case 4680:
		case 4677:
		case 4678:
		case 4640:
		case 4663:
		case 4661:
		case 4647:
		case 4648:
		case 4649:
		case 4650:
		case 4646:
		case 4644:
		case 4645:
		case 4642:
		case 4643:
		case 4662:
		case 4651:
		case 4653:
		case 4658:
		case 4659:
		case 4660:
		case 4652:
		case 4657:
		case 4655:
		case 4656:
		case 4654:
		case 4685:
		case 4593:
		case 4591:
		case 4529:
		case 4530:
		case 4531:
		case 4532:
		case 4528:
		case 4526:
		case 4527:
		case 4524:
		case 4525:
		case 4523:
		case 4533:
		case 4535:
		case 4541:
		case 4542:
		case 4543:
		case 4534:
		case 4540:
		case 4538:
		case 4539:
		case 4536:
		case 4537:
		case 4544:
		case 4522:
		case 4520:
		case 4506:
		case 4507:
		case 4508:
		case 4509:
		case 4505:
		case 4503:
		case 4504:
		case 4501:
		case 4502:
		case 4521:
		case 4510:
		case 4512:
		case 4517:
		case 4518:
		case 4519:
		case 4511:
		case 4516:
		case 4514:
		case 4515:
		case 4513:
		case 4592:
		case 4545:
		case 4547:
		case 4576:
		case 4577:
		case 4578:
		case 4579:
		case 4575:
		case 4573:
		case 4574:
		case 4571:
		case 4572:
		case 4570:
		case 4580:
		case 4582:
		case 4588:
		case 4589:
		case 4590:
		case 4581:
		case 4587:
		case 4585:
		case 4586:
		case 4583:
		case 4584:
		case 4546:
		case 4569:
		case 4567:
		case 4553:
		case 4554:
		case 4555:
		case 4556:
		case 4552:
		case 4550:
		case 4551:
		case 4548:
		case 4549:
		case 4568:
		case 4557:
		case 4559:
		case 4564:
		case 4565:
		case 4566:
		case 4558:
		case 4563:
		case 4561:
		case 4562:
		case 4560:
		case 4873:
		case 4686:
		case 4688:
		case 4810:
		case 4811:
		case 4812:
		case 4813:
		case 4809:
		case 4807:
		case 4808:
		case 4805:
		case 4806:
		case 4804:
		case 4814:
		case 4816:
		case 4822:
		case 4823:
		case 4824:
		case 4815:
		case 4821:
		case 4819:
		case 4820:
		case 4817:
		case 4818:
		case 4825:
		case 4803:
		case 4801:
		case 4787:
		case 4788:
		case 4789:
		case 4790:
		case 4786:
		case 4784:
		case 4785:
		case 4782:
		case 4783:
		case 4802:
		case 4791:
		case 4793:
		case 4798:
		case 4799:
		case 4800:
		case 4792:
		case 4797:
		case 4795:
		case 4796:
		case 4794:
		case 4781:
		case 4826:
		case 4828:
		case 4857:
		case 4858:
		case 4859:
		case 4860:
		case 4856:
		case 4854:
		case 4855:
		case 4852:
		case 4853:
		case 4851:
		case 4861:
		case 4863:
		case 4869:
		case 4870:
		case 4871:
		case 4862:
		case 4868:
		case 4866:
		case 4867:
		case 4864:
		case 4865:
		case 4827:
		case 4850:
		case 4848:
		case 4834:
		case 4835:
		case 4836:
		case 4837:
		case 4833:
		case 4831:
		case 4832:
		case 4829:
		case 4830:
		case 4849:
		case 4838:
		case 4840:
		case 4845:
		case 4846:
		case 4847:
		case 4839:
		case 4844:
		case 4842:
		case 4843:
		case 4841:
		case 4687:
		case 4780:
		case 4778:
		case 4717:
		case 4718:
		case 4719:
		case 4720:
		case 4716:
		case 4714:
		case 4715:
		case 4712:
		case 4713:
		case 4711:
		case 4721:
		case 4723:
		case 4729:
		case 4730:
		case 4731:
		case 4722:
		case 4728:
		case 4726:
		case 4727:
		case 4724:
		case 4725:
		case 4732:
		case 4710:
		case 4708:
		case 4694:
		case 4695:
		case 4696:
		case 4697:
		case 4693:
		case 4691:
		case 4692:
		case 4689:
		case 4690:
		case 4709:
		case 4698:
		case 4700:
		case 4705:
		case 4706:
		case 4707:
		case 4699:
		case 4704:
		case 4702:
		case 4703:
		case 4701:
		case 4779:
		case 4733:
		case 4735:
		case 4764:
		case 4765:
		case 4766:
		case 4767:
		case 4763:
		case 4761:
		case 4762:
		case 4759:
		case 4760:
		case 4758:
		case 4768:
		case 4770:
		case 4775:
		case 4776:
		case 4777:
		case 4769:
		case 4774:
		case 4772:
		case 4773:
		case 4771:
		case 4734:
		case 4757:
		case 4755:
		case 4741:
		case 4742:
		case 4743:
		case 4744:
		case 4740:
		case 4738:
		case 4739:
		case 4736:
		case 4737:
		case 4756:
		case 4745:
		case 4747:
		case 4752:
		case 4753:
		case 4754:
		case 4746:
		case 4751:
		case 4749:
		case 4750:
		case 4748:
		case 4500:
		case 5249:
		case 5251:
		case 5750:
		case 5751:
		case 5752:
		case 5753:
		case 5749:
		case 5747:
		case 5748:
		case 5745:
		case 5746:
		case 5744:
		case 5754:
		case 5756:
		case 5762:
		case 5763:
		case 5764:
		case 5755:
		case 5761:
		case 5759:
		case 5760:
		case 5757:
		case 5758:
		case 5765:
		case 5743:
		case 5741:
		case 5727:
		case 5728:
		case 5729:
		case 5730:
		case 5726:
		case 5724:
		case 5725:
		case 5722:
		case 5723:
		case 5742:
		case 5731:
		case 5733:
		case 5738:
		case 5739:
		case 5740:
		case 5732:
		case 5737:
		case 5735:
		case 5736:
		case 5734:
		case 5721:
		case 5766:
		case 5768:
		case 5797:
		case 5798:
		case 5799:
		case 5800:
		case 5796:
		case 5794:
		case 5795:
		case 5792:
		case 5793:
		case 5791:
		case 5801:
		case 5803:
		case 5809:
		case 5810:
		case 5811:
		case 5802:
		case 5808:
		case 5806:
		case 5807:
		case 5804:
		case 5805:
		case 5767:
		case 5790:
		case 5788:
		case 5774:
		case 5775:
		case 5776:
		case 5777:
		case 5773:
		case 5771:
		case 5772:
		case 5769:
		case 5770:
		case 5789:
		case 5778:
		case 5780:
		case 5785:
		case 5786:
		case 5787:
		case 5779:
		case 5784:
		case 5782:
		case 5783:
		case 5781:
		case 5812:
		case 5720:
		case 5718:
		case 5656:
		case 5657:
		case 5658:
		case 5659:
		case 5655:
		case 5653:
		case 5654:
		case 5651:
		case 5652:
		case 5650:
		case 5660:
		case 5662:
		case 5668:
		case 5669:
		case 5670:
		case 5661:
		case 5667:
		case 5665:
		case 5666:
		case 5663:
		case 5664:
		case 5671:
		case 5649:
		case 5647:
		case 5633:
		case 5634:
		case 5635:
		case 5636:
		case 5632:
		case 5630:
		case 5631:
		case 5628:
		case 5629:
		case 5648:
		case 5637:
		case 5639:
		case 5644:
		case 5645:
		case 5646:
		case 5638:
		case 5643:
		case 5641:
		case 5642:
		case 5640:
		case 5719:
		case 5672:
		case 5674:
		case 5703:
		case 5704:
		case 5705:
		case 5706:
		case 5702:
		case 5700:
		case 5701:
		case 5698:
		case 5699:
		case 5697:
		case 5707:
		case 5709:
		case 5715:
		case 5716:
		case 5717:
		case 5708:
		case 5714:
		case 5712:
		case 5713:
		case 5710:
		case 5711:
		case 5673:
		case 5696:
		case 5694:
		case 5680:
		case 5681:
		case 5682:
		case 5683:
		case 5679:
		case 5677:
		case 5678:
		case 5675:
		case 5676:
		case 5695:
		case 5684:
		case 5686:
		case 5691:
		case 5692:
		case 5693:
		case 5685:
		case 5690:
		case 5688:
		case 5689:
		case 5687:
		case 5627:
		case 5813:
		case 5815:
		case 5937:
		case 5938:
		case 5939:
		case 5940:
		case 5936:
		case 5934:
		case 5935:
		case 5932:
		case 5933:
		case 5931:
		case 5941:
		case 5943:
		case 5949:
		case 5950:
		case 5951:
		case 5942:
		case 5948:
		case 5946:
		case 5947:
		case 5944:
		case 5945:
		case 5952:
		case 5930:
		case 5928:
		case 5914:
		case 5915:
		case 5916:
		case 5917:
		case 5913:
		case 5911:
		case 5912:
		case 5909:
		case 5910:
		case 5929:
		case 5918:
		case 5920:
		case 5925:
		case 5926:
		case 5927:
		case 5919:
		case 5924:
		case 5922:
		case 5923:
		case 5921:
		case 5908:
		case 5953:
		case 5955:
		case 5984:
		case 5985:
		case 5986:
		case 5987:
		case 5983:
		case 5981:
		case 5982:
		case 5979:
		case 5980:
		case 5978:
		case 5988:
		case 5990:
		case 5996:
		case 5997:
		case 3000:
		case 5989:
		case 5995:
		case 5993:
		case 5994:
		case 5991:
		case 5992:
		case 5954:
		case 5977:
		case 5975:
		case 5961:
		case 5962:
		case 5963:
		case 5964:
		case 5960:
		case 5958:
		case 5959:
		case 5956:
		case 5957:
		case 5976:
		case 5965:
		case 5967:
		case 5972:
		case 5973:
		case 5974:
		case 5966:
		case 5971:
		case 5969:
		case 5970:
		case 5968:
		case 5814:
		case 5907:
		case 5905:
		case 5844:
		case 5845:
		case 5846:
		case 5847:
		case 5843:
		case 5841:
		case 5842:
		case 5839:
		case 5840:
		case 5838:
		case 5848:
		case 5850:
		case 5856:
		case 5857:
		case 5858:
		case 5849:
		case 5855:
		case 5853:
		case 5854:
		case 5851:
		case 5852:
		case 5859:
		case 5837:
		case 5835:
		case 5821:
		case 5822:
		case 5823:
		case 5824:
		case 5820:
		case 5818:
		case 5819:
		case 5816:
		case 5817:
		case 5836:
		case 5825:
		case 5827:
		case 5832:
		case 5833:
		case 5834:
		case 5826:
		case 5831:
		case 5829:
		case 5830:
		case 5828:
		case 5906:
		case 5860:
		case 5862:
		case 5891:
		case 5892:
		case 5893:
		case 5894:
		case 5890:
		case 5888:
		case 5889:
		case 5886:
		case 5887:
		case 5885:
		case 5895:
		case 5897:
		case 5902:
		case 5903:
		case 5904:
		case 5896:
		case 5901:
		case 5899:
		case 5900:
		case 5898:
		case 5861:
		case 5884:
		case 5882:
		case 5868:
		case 5869:
		case 5870:
		case 5871:
		case 5867:
		case 5865:
		case 5866:
		case 5863:
		case 5864:
		case 5883:
		case 5872:
		case 5874:
		case 5879:
		case 5880:
		case 5881:
		case 5873:
		case 5878:
		case 5876:
		case 5877:
		case 5875:
		case 5250:
		case 5626:
		case 5624:
		case 5374:
		case 5375:
		case 5376:
		case 5377:
		case 5373:
		case 5371:
		case 5372:
		case 5369:
		case 5370:
		case 5368:
		case 5378:
		case 5380:
		case 5386:
		case 5387:
		case 5388:
		case 5379:
		case 5385:
		case 5383:
		case 5384:
		case 5381:
		case 5382:
		case 5389:
		case 5367:
		case 5365:
		case 5351:
		case 5352:
		case 5353:
		case 5354:
		case 5350:
		case 5348:
		case 5349:
		case 5346:
		case 5347:
		case 5366:
		case 5355:
		case 5357:
		case 5362:
		case 5363:
		case 5364:
		case 5356:
		case 5361:
		case 5359:
		case 5360:
		case 5358:
		case 5345:
		case 5390:
		case 5392:
		case 5421:
		case 5422:
		case 5423:
		case 5424:
		case 5420:
		case 5418:
		case 5419:
		case 5416:
		case 5417:
		case 5415:
		case 5425:
		case 5427:
		case 5433:
		case 5434:
		case 5435:
		case 5426:
		case 5432:
		case 5430:
		case 5431:
		case 5428:
		case 5429:
		case 5391:
		case 5414:
		case 5412:
		case 5398:
		case 5399:
		case 5400:
		case 5401:
		case 5397:
		case 5395:
		case 5396:
		case 5393:
		case 5394:
		case 5413:
		case 5402:
		case 5404:
		case 5409:
		case 5410:
		case 5411:
		case 5403:
		case 5408:
		case 5406:
		case 5407:
		case 5405:
		case 5436:
		case 5344:
		case 5342:
		case 5280:
		case 5281:
		case 5282:
		case 5283:
		case 5279:
		case 5277:
		case 5278:
		case 5275:
		case 5276:
		case 5274:
		case 5284:
		case 5286:
		case 5292:
		case 5293:
		case 5294:
		case 5285:
		case 5291:
		case 5289:
		case 5290:
		case 5287:
		case 5288:
		case 5295:
		case 5273:
		case 5271:
		case 5257:
		case 5258:
		case 5259:
		case 5260:
		case 5256:
		case 5254:
		case 5255:
		case 5252:
		case 5253:
		case 5272:
		case 5261:
		case 5263:
		case 5268:
		case 5269:
		case 5270:
		case 5262:
		case 5267:
		case 5265:
		case 5266:
		case 5264:
		case 5343:
		case 5296:
		case 5298:
		case 5327:
		case 5328:
		case 5329:
		case 5330:
		case 5326:
		case 5324:
		case 5325:
		case 5322:
		case 5323:
		case 5321:
		case 5331:
		case 5333:
		case 5339:
		case 5340:
		case 5341:
		case 5332:
		case 5338:
		case 5336:
		case 5337:
		case 5334:
		case 5335:
		case 5297:
		case 5320:
		case 5318:
		case 5304:
		case 5305:
		case 5306:
		case 5307:
		case 5303:
		case 5301:
		case 5302:
		case 5299:
		case 5300:
		case 5319:
		case 5308:
		case 5310:
		case 5315:
		case 5316:
		case 5317:
		case 5309:
		case 5314:
		case 5312:
		case 5313:
		case 5311:
		case 5625:
		case 5437:
		case 5439:
		case 5561:
		case 5562:
		case 5563:
		case 5564:
		case 5560:
		case 5558:
		case 5559:
		case 5556:
		case 5557:
		case 5555:
		case 5565:
		case 5567:
		case 5573:
		case 5574:
		case 5575:
		case 5566:
		case 5572:
		case 5570:
		case 5571:
		case 5568:
		case 5569:
		case 5576:
		case 5554:
		case 5552:
		case 5538:
		case 5539:
		case 5540:
		case 5541:
		case 5537:
		case 5535:
		case 5536:
		case 5533:
		case 5534:
		case 5553:
		case 5542:
		case 5544:
		case 5549:
		case 5550:
		case 5551:
		case 5543:
		case 5548:
		case 5546:
		case 5547:
		case 5545:
		case 5532:
		case 5577:
		case 5579:
		case 5609:
		case 5610:
		case 5611:
		case 5612:
		case 5608:
		case 5606:
		case 5607:
		case 5604:
		case 5605:
		case 5603:
		case 5613:
		case 5615:
		case 5621:
		case 5622:
		case 5623:
		case 5614:
		case 5620:
		case 5618:
		case 5619:
		case 5616:
		case 5617:
		case 5578:
		case 5602:
		case 5600:
		case 5585:
		case 5587:
		case 5588:
		case 5589:
		case 5584:
		case 5582:
		case 5583:
		case 5580:
		case 5581:
		case 5601:
		case 5590:
		case 5592:
		case 5597:
		case 5598:
		case 5599:
		case 5591:
		case 5596:
		case 5594:
		case 5595:
		case 5593:
		case 5438:
		case 5531:
		case 5529:
		case 5468:
		case 5469:
		case 5470:
		case 5471:
		case 5467:
		case 5465:
		case 5466:
		case 5463:
		case 5464:
		case 5462:
		case 5472:
		case 5474:
		case 5480:
		case 5481:
		case 5482:
		case 5473:
		case 5479:
		case 5477:
		case 5478:
		case 5475:
		case 5476:
		case 5483:
		case 5461:
		case 5459:
		case 5445:
		case 5446:
		case 5447:
		case 5448:
		case 5444:
		case 5442:
		case 5443:
		case 5440:
		case 5441:
		case 5460:
		case 5449:
		case 5451:
		case 5456:
		case 5457:
		case 5458:
		case 5450:
		case 5455:
		case 5453:
		case 5454:
		case 5452:
		case 5530:
		case 5484:
		case 5486:
		case 5515:
		case 5516:
		case 5517:
		case 5518:
		case 5514:
		case 5512:
		case 5513:
		case 5510:
		case 5511:
		case 5509:
		case 5519:
		case 5521:
		case 5526:
		case 5527:
		case 5528:
		case 5520:
		case 5525:
		case 5523:
		case 5524:
		case 5522:
		case 5485:
		case 5508:
		case 5506:
		case 5492:
		case 5493:
		case 5494:
		case 5495:
		case 5491:
		case 5489:
		case 5490:
		case 5487:
		case 5488:
		case 5507:
		case 5496:
		case 5498:
		case 5503:
		case 5504:
		case 5505:
		case 5497:
		case 5502:
		case 5500:
		case 5501:
		case 5499:
		case 4499:
		case 5586:
		case 4497:
		case 3499:
		case 3500:
		case 3501:
		case 3502:
		case 3498:
		case 3496:
		case 3497:
		case 3494:
		case 3495:
		case 3493:
		case 3503:
		case 3505:
		case 3511:
		case 3512:
		case 3513:
		case 3504:
		case 3510:
		case 3508:
		case 3509:
		case 3506:
		case 3507:
		case 3514:
		case 3492:
		case 3490:
		case 3476:
		case 3477:
		case 3478:
		case 3479:
		case 3475:
		case 3473:
		case 3474:
		case 3471:
		case 3472:
		case 3491:
		case 3480:
		case 3482:
		case 3487:
		case 3488:
		case 3489:
		case 3481:
		case 3486:
		case 3484:
		case 3485:
		case 3483:
		case 3470:
		case 3515:
		case 3517:
		case 3546:
		case 3547:
		case 3548:
		case 3549:
		case 3545:
		case 3543:
		case 3544:
		case 3541:
		case 3542:
		case 3540:
		case 3550:
		case 3552:
		case 3558:
		case 3559:
		case 3560:
		case 3551:
		case 3557:
		case 3555:
		case 3556:
		case 3553:
		case 3554:
		case 3516:
		case 3539:
		case 3537:
		case 3523:
		case 3524:
		case 3525:
		case 3526:
		case 3522:
		case 3520:
		case 3521:
		case 3518:
		case 3519:
		case 3538:
		case 3527:
		case 3529:
		case 3534:
		case 3535:
		case 3536:
		case 3528:
		case 3533:
		case 3531:
		case 3532:
		case 3530:
		case 3561:
		case 3469:
		case 3467:
		case 3405:
		case 3406:
		case 3407:
		case 3408:
		case 3404:
		case 3402:
		case 3403:
		case 3400:
		case 3401:
		case 3399:
		case 3409:
		case 3411:
		case 3417:
		case 3418:
		case 3419:
		case 3410:
		case 3416:
		case 3414:
		case 3415:
		case 3412:
		case 3413:
		case 3420:
		case 3398:
		case 3396:
		case 3382:
		case 3383:
		case 3384:
		case 3385:
		case 3381:
		case 3379:
		case 3380:
		case 3377:
		case 3378:
		case 3397:
		case 3386:
		case 3388:
		case 3393:
		case 3394:
		case 3395:
		case 3387:
		case 3392:
		case 3390:
		case 3391:
		case 3389:
		case 3468:
		case 3421:
		case 3423:
		case 3452:
		case 3453:
		case 3454:
		case 3455:
		case 3451:
		case 3449:
		case 3450:
		case 3447:
		case 3448:
		case 3446:
		case 3456:
		case 3458:
		case 3464:
		case 3465:
		case 3466:
		case 3457:
		case 3463:
		case 3461:
		case 3462:
		case 3459:
		case 3460:
		case 3422:
		case 3445:
		case 3443:
		case 3429:
		case 3430:
		case 3431:
		case 3432:
		case 3428:
		case 3426:
		case 3427:
		case 3424:
		case 3425:
		case 3444:
		case 3433:
		case 3435:
		case 3440:
		case 3441:
		case 3442:
		case 3434:
		case 3439:
		case 3437:
		case 3438:
		case 3436:
		case 3376:
		case 3562:
		case 3564:
		case 3686:
		case 3687:
		case 3688:
		case 3689:
		case 3685:
		case 3683:
		case 3684:
		case 3681:
		case 3682:
		case 3680:
		case 3690:
		case 3692:
		case 3698:
		case 3699:
		case 3700:
		case 3691:
		case 3697:
		case 3695:
		case 3696:
		case 3693:
		case 3694:
		case 3701:
		case 3679:
		case 3677:
		case 3663:
		case 3664:
		case 3665:
		case 3666:
		case 3662:
		case 3660:
		case 3661:
		case 3658:
		case 3659:
		case 3678:
		case 3667:
		case 3669:
		case 3674:
		case 3675:
		case 3676:
		case 3668:
		case 3673:
		case 3671:
		case 3672:
		case 3670:
		case 3657:
		case 3702:
		case 3704:
		case 3733:
		case 3734:
		case 3735:
		case 3736:
		case 3732:
		case 3730:
		case 3731:
		case 3728:
		case 3729:
		case 3727:
		case 3737:
		case 3739:
		case 3745:
		case 3746:
		case 3747:
		case 3738:
		case 3744:
		case 3742:
		case 3743:
		case 3740:
		case 3741:
		case 3703:
		case 3726:
		case 3724:
		case 3710:
		case 3711:
		case 3712:
		case 3713:
		case 3709:
		case 3707:
		case 3708:
		case 3705:
		case 3706:
		case 3725:
		case 3714:
		case 3716:
		case 3721:
		case 3722:
		case 3723:
		case 3715:
		case 3720:
		case 3718:
		case 3719:
		case 3717:
		case 3563:
		case 3656:
		case 3654:
		case 3593:
		case 3594:
		case 3595:
		case 3596:
		case 3592:
		case 3590:
		case 3591:
		case 3588:
		case 3589:
		case 3587:
		case 3597:
		case 3599:
		case 3605:
		case 3606:
		case 3607:
		case 3598:
		case 3604:
		case 3602:
		case 3603:
		case 3600:
		case 3601:
		case 3608:
		case 3586:
		case 3584:
		case 3570:
		case 3571:
		case 3572:
		case 3573:
		case 3569:
		case 3567:
		case 3568:
		case 3565:
		case 3566:
		case 3585:
		case 3574:
		case 3576:
		case 3581:
		case 3582:
		case 3583:
		case 3575:
		case 3580:
		case 3578:
		case 3579:
		case 3577:
		case 3655:
		case 3609:
		case 3611:
		case 3640:
		case 3641:
		case 3642:
		case 3643:
		case 3639:
		case 3637:
		case 3638:
		case 3635:
		case 3636:
		case 3634:
		case 3644:
		case 3646:
		case 3651:
		case 3652:
		case 3653:
		case 3645:
		case 3650:
		case 3648:
		case 3649:
		case 3647:
		case 3610:
		case 3633:
		case 3631:
		case 3617:
		case 3618:
		case 3619:
		case 3620:
		case 3616:
		case 3614:
		case 3615:
		case 3612:
		case 3613:
		case 3632:
		case 3621:
		case 3623:
		case 3628:
		case 3629:
		case 3630:
		case 3622:
		case 3627:
		case 3625:
		case 3626:
		case 3624:
		case 3748:
		case 3375:
		case 3373:
		case 3123:
		case 3124:
		case 3125:
		case 3126:
		case 3122:
		case 3120:
		case 3121:
		case 3118:
		case 3119:
		case 3117:
		case 3127:
		case 3129:
		case 3135:
		case 3136:
		case 3137:
		case 3128:
		case 3134:
		case 3132:
		case 3133:
		case 3130:
		case 3131:
		case 3138:
		case 3116:
		case 3114:
		case 3100:
		case 3101:
		case 3102:
		case 3103:
		case 3099:
		case 3097:
		case 3098:
		case 3095:
		case 3096:
		case 3115:
		case 3104:
		case 3106:
		case 3111:
		case 3112:
		case 3113:
		case 3105:
		case 3110:
		case 3108:
		case 3109:
		case 3107:
		case 3094:
		case 3139:
		case 3141:
		case 3170:
		case 3171:
		case 3172:
		case 3173:
		case 3169:
		case 3167:
		case 3168:
		case 3165:
		case 3166:
		case 3164:
		case 3174:
		case 3176:
		case 3182:
		case 3183:
		case 3184:
		case 3175:
		case 3181:
		case 3179:
		case 3180:
		case 3177:
		case 3178:
		case 3140:
		case 3163:
		case 3161:
		case 3147:
		case 3148:
		case 3149:
		case 3150:
		case 3146:
		case 3144:
		case 3145:
		case 3142:
		case 3143:
		case 3162:
		case 3151:
		case 3153:
		case 3158:
		case 3159:
		case 3160:
		case 3152:
		case 3157:
		case 3155:
		case 3156:
		case 3154:
		case 3185:
		case 3093:
		case 3091:
		case 3029:
		case 3030:
		case 3031:
		case 3032:
		case 3028:
		case 3026:
		case 3027:
		case 3024:
		case 3025:
		case 3023:
		case 3033:
		case 3035:
		case 3041:
		case 3042:
		case 3043:
		case 3034:
		case 3040:
		case 3038:
		case 3039:
		case 3036:
		case 3037:
		case 3044:
		case 3022:
		case 3020:
		case 3006:
		case 3007:
		case 3008:
		case 3009:
		case 3005:
		case 3003:
		case 3004:
		case 3002:
		case 4498:
		case 3021:
		case 3010:
		case 3012:
		case 3017:
		case 3018:
		case 3019:
		case 3011:
		case 3016:
		case 3014:
		case 3015:
		case 3013:
		case 3092:
		case 3045:
		case 3047:
		case 3076:
		case 3077:
		case 3078:
		case 3079:
		case 3075:
		case 3073:
		case 3074:
		case 3071:
		case 3072:
		case 3070:
		case 3080:
		case 3082:
		case 3088:
		case 3089:
		case 3090:
		case 3081:
		case 3087:
		case 3085:
		case 3086:
		case 3083:
		case 3084:
		case 3046:
		case 3069:
		case 3067:
		case 3053:
		case 3054:
		case 3055:
		case 3056:
		case 3052:
		case 3050:
		case 3051:
		case 3048:
		case 3049:
		case 3068:
		case 3057:
		case 3059:
		case 3064:
		case 3065:
		case 3066:
		case 3058:
		case 3063:
		case 3061:
		case 3062:
		case 3060:
		case 3374:
		case 3186:
		case 3188:
		case 3311:
		case 3312:
		case 3313:
		case 3314:
		case 3310:
		case 3308:
		case 3309:
		case 3306:
		case 3307:
		case 3305:
		case 3315:
		case 3317:
		case 3323:
		case 3324:
		case 3325:
		case 3316:
		case 3322:
		case 3320:
		case 3321:
		case 3318:
		case 3319:
		case 3326:
		case 3304:
		case 3302:
		case 3288:
		case 3289:
		case 3290:
		case 3291:
		case 3287:
		case 3285:
		case 3286:
		case 3283:
		case 3284:
		case 3303:
		case 3292:
		case 3294:
		case 3299:
		case 3300:
		case 3301:
		case 3293:
		case 3298:
		case 3296:
		case 3297:
		case 3295:
		case 3282:
		case 3327:
		case 3329:
		case 3358:
		case 3359:
		case 3360:
		case 3361:
		case 3357:
		case 3355:
		case 3356:
		case 3353:
		case 3354:
		case 3352:
		case 3362:
		case 3364:
		case 3370:
		case 3371:
		case 3372:
		case 3363:
		case 3369:
		case 3367:
		case 3368:
		case 3365:
		case 3366:
		case 3328:
		case 3351:
		case 3349:
		case 3335:
		case 3336:
		case 3337:
		case 3338:
		case 3334:
		case 3332:
		case 3333:
		case 3330:
		case 3331:
		case 3350:
		case 3339:
		case 3341:
		case 3346:
		case 3347:
		case 3348:
		case 3340:
		case 3345:
		case 3343:
		case 3344:
		case 3342:
		case 3187:
		case 3281:
		case 3279:
		case 3218:
		case 3219:
		case 3220:
		case 3221:
		case 3217:
		case 3215:
		case 3216:
		case 3213:
		case 3214:
		case 3212:
		case 3222:
		case 3224:
		case 3230:
		case 3231:
		case 3232:
		case 3223:
		case 3229:
		case 3227:
		case 3228:
		case 3225:
		case 3226:
		case 3233:
		case 3211:
		case 3209:
		case 3194:
		case 3195:
		case 3196:
		case 3197:
		case 3193:
		case 3191:
		case 3192:
		case 3189:
		case 3190:
		case 3210:
		case 3198:
		case 3200:
		case 3205:
		case 3206:
		case 3207:
		case 3199:
		case 3204:
		case 3202:
		case 3203:
		case 3201:
		case 3280:
		case 3234:
		case 3236:
		case 3265:
		case 3266:
		case 3267:
		case 3268:
		case 3264:
		case 3262:
		case 3263:
		case 3260:
		case 3261:
		case 3259:
		case 3269:
		case 3271:
		case 3276:
		case 3277:
		case 3278:
		case 3270:
		case 3275:
		case 3273:
		case 3274:
		case 3272:
		case 3235:
		case 3258:
		case 3256:
		case 3242:
		case 3243:
		case 3244:
		case 3245:
		case 3241:
		case 3239:
		case 3240:
		case 3237:
		case 3238:
		case 3257:
		case 3246:
		case 3248:
		case 3253:
		case 3254:
		case 3255:
		case 3247:
		case 3252:
		case 3250:
		case 3251:
		case 3249:
		case 3749:
		case 3208:
		case 3751:
		case 4247:
		case 4248:
		case 4249:
		case 4250:
		case 4246:
		case 4244:
		case 4245:
		case 4242:
		case 4243:
		case 4241:
		case 4251:
		case 4253:
		case 4259:
		case 4260:
		case 4261:
		case 4252:
		case 4258:
		case 4256:
		case 4257:
		case 4254:
		case 4255:
		case 4262:
		case 4240:
		case 4238:
		case 4224:
		case 4225:
		case 4226:
		case 4227:
		case 4223:
		case 4221:
		case 4222:
		case 4219:
		case 4220:
		case 4239:
		case 4228:
		case 4230:
		case 4235:
		case 4236:
		case 4237:
		case 4229:
		case 4234:
		case 4232:
		case 4233:
		case 4231:
		case 4218:
		case 4263:
		case 4265:
		case 4294:
		case 4295:
		case 4296:
		case 4297:
		case 4293:
		case 4291:
		case 4292:
		case 4289:
		case 4290:
		case 4288:
		case 4298:
		case 4300:
		case 4306:
		case 4307:
		case 4308:
		case 4299:
		case 4305:
		case 4303:
		case 4304:
		case 4301:
		case 4302:
		case 4264:
		case 4287:
		case 4285:
		case 4271:
		case 4272:
		case 4273:
		case 4274:
		case 4270:
		case 4268:
		case 4269:
		case 4266:
		case 4267:
		case 4286:
		case 4275:
		case 4277:
		case 4282:
		case 4283:
		case 4284:
		case 4276:
		case 4281:
		case 4279:
		case 4280:
		case 4278:
		case 4309:
		case 4217:
		case 4215:
		case 4153:
		case 4154:
		case 4155:
		case 4156:
		case 4152:
		case 4150:
		case 4151:
		case 4148:
		case 4149:
		case 4147:
		case 4157:
		case 4159:
		case 4165:
		case 4166:
		case 4167:
		case 4158:
		case 4164:
		case 4162:
		case 4163:
		case 4160:
		case 4161:
		case 4168:
		case 4146:
		case 4144:
		case 4130:
		case 4131:
		case 4132:
		case 4133:
		case 4129:
		case 4127:
		case 4128:
		case 4125:
		case 4126:
		case 4145:
		case 4134:
		case 4136:
		case 4141:
		case 4142:
		case 4143:
		case 4135:
		case 4140:
		case 4138:
		case 4139:
		case 4137:
		case 4216:
		case 4169:
		case 4171:
		case 4200:
		case 4201:
		case 4202:
		case 4203:
		case 4199:
		case 4197:
		case 4198:
		case 4195:
		case 4196:
		case 4194:
		case 4204:
		case 4206:
		case 4212:
		case 4213:
		case 4214:
		case 4205:
		case 4211:
		case 4209:
		case 4210:
		case 4207:
		case 4208:
		case 4170:
		case 4193:
		case 4191:
		case 4177:
		case 4178:
		case 4179:
		case 4180:
		case 4176:
		case 4174:
		case 4175:
		case 4172:
		case 4173:
		case 4192:
		case 4181:
		case 4183:
		case 4188:
		case 4189:
		case 4190:
		case 4182:
		case 4187:
		case 4185:
		case 4186:
		case 4184:
		case 4124:
		case 4310:
		case 4312:
		case 4436:
		case 4437:
		case 4438:
		case 4439:
		case 4435:
		case 4433:
		case 4434:
		case 4431:
		case 4432:
		case 4430:
		case 4440:
		case 4442:
		case 4448:
		case 4449:
		case 4450:
		case 4441:
		case 4447:
		case 4445:
		case 4446:
		case 4443:
		case 4444:
		case 4451:
		case 4429:
		case 4427:
		case 4413:
		case 4414:
		case 4415:
		case 4416:
		case 4412:
		case 4410:
		case 4411:
		case 4408:
		case 4409:
		case 4428:
		case 4417:
		case 4419:
		case 4424:
		case 4425:
		case 4426:
		case 4418:
		case 4423:
		case 4421:
		case 4422:
		case 4420:
		case 4407:
		case 4452:
		case 4454:
		case 4483:
		case 4484:
		case 4485:
		case 4486:
		case 4482:
		case 4480:
		case 4481:
		case 4478:
		case 4479:
		case 4477:
		case 4487:
		case 4489:
		case 3750:
		case 4495:
		case 4496:
		case 4488:
		case 4494:
		case 4492:
		case 4493:
		case 4490:
		case 4491:
		case 4453:
		case 4476:
		case 4474:
		case 4460:
		case 4461:
		case 4462:
		case 4463:
		case 4459:
		case 4457:
		case 4458:
		case 4455:
		case 4456:
		case 4475:
		case 4464:
		case 4466:
		case 4471:
		case 4472:
		case 4473:
		case 4465:
		case 4470:
		case 4468:
		case 4469:
		case 4467:
		case 4311:
		case 4406:
		case 4404:
		case 4341:
		case 4342:
		case 4343:
		case 4344:
		case 4340:
		case 4338:
		case 4339:
		case 4336:
		case 4337:
		case 4335:
		case 4345:
		case 4347:
		case 4353:
		case 4354:
		case 4355:
		case 4346:
		case 4352:
		case 4350:
		case 4351:
		case 4348:
		case 4349:
		case 4356:
		case 4334:
		case 4332:
		case 4318:
		case 4319:
		case 4320:
		case 4321:
		case 4317:
		case 4315:
		case 4316:
		case 4313:
		case 4314:
		case 4333:
		case 4322:
		case 4324:
		case 4329:
		case 4330:
		case 4331:
		case 4323:
		case 4328:
		case 4326:
		case 4327:
		case 4325:
		case 4405:
		case 4357:
		case 4359:
		case 4388:
		case 4389:
		case 4390:
		case 4391:
		case 4387:
		case 4385:
		case 4386:
		case 4383:
		case 4384:
		case 4382:
		case 4393:
		case 4395:
		case 4401:
		case 4402:
		case 4403:
		case 4394:
		case 4400:
		case 4398:
		case 4399:
		case 4396:
		case 4397:
		case 4358:
		case 4381:
		case 4379:
		case 4365:
		case 4366:
		case 4367:
		case 4368:
		case 4364:
		case 4362:
		case 4363:
		case 4360:
		case 4361:
		case 4380:
		case 4369:
		case 4371:
		case 4376:
		case 4377:
		case 4378:
		case 4370:
		case 4375:
		case 4373:
		case 4374:
		case 4372:
		case 4123:
		case 4392:
		case 4121:
		case 3874:
		case 3875:
		case 3876:
		case 3877:
		case 3873:
		case 3871:
		case 3872:
		case 3869:
		case 3870:
		case 3868:
		case 3878:
		case 3880:
		case 3886:
		case 3887:
		case 3888:
		case 3879:
		case 3885:
		case 3883:
		case 3884:
		case 3881:
		case 3882:
		case 3889:
		case 3867:
		case 3865:
		case 3851:
		case 3852:
		case 3853:
		case 3854:
		case 3850:
		case 3848:
		case 3849:
		case 3846:
		case 3847:
		case 3866:
		case 3855:
		case 3857:
		case 3862:
		case 3863:
		case 3864:
		case 3856:
		case 3861:
		case 3859:
		case 3860:
		case 3858:
		case 3845:
		case 3890:
		case 3892:
		case 3921:
		case 3922:
		case 3923:
		case 3924:
		case 3920:
		case 3918:
		case 3919:
		case 3916:
		case 3917:
		case 3915:
		case 3925:
		case 3927:
		case 3933:
		case 3934:
		case 3935:
		case 3926:
		case 3932:
		case 3930:
		case 3931:
		case 3928:
		case 3929:
		case 3891:
		case 3914:
		case 3912:
		case 3898:
		case 3899:
		case 3900:
		case 3901:
		case 3897:
		case 3895:
		case 3896:
		case 3893:
		case 3894:
		case 3913:
		case 3902:
		case 3904:
		case 3909:
		case 3910:
		case 3911:
		case 3903:
		case 3908:
		case 3906:
		case 3907:
		case 3905:
		case 3936:
		case 3844:
		case 3842:
		case 3779:
		case 3780:
		case 3781:
		case 3782:
		case 3778:
		case 3776:
		case 3777:
		case 3774:
		case 3775:
		case 3773:
		case 3783:
		case 3785:
		case 3791:
		case 3792:
		case 3793:
		case 3784:
		case 3790:
		case 3788:
		case 3789:
		case 3786:
		case 3787:
		case 3794:
		case 3772:
		case 3770:
		case 3756:
		case 3757:
		case 3758:
		case 3759:
		case 3755:
		case 3752:
		case 4122:
		case 3753:
		case 3754:
		case 3771:
		case 3760:
		case 3762:
		case 3767:
		case 3768:
		case 3769:
		case 3761:
		case 3766:
		case 3764:
		case 3765:
		case 3763:
		case 3843:
		case 3795:
		case 3797:
		case 3827:
		case 3828:
		case 3829:
		case 3830:
		case 3826:
		case 3824:
		case 3825:
		case 3822:
		case 3823:
		case 3821:
		case 3831:
		case 3833:
		case 3839:
		case 3840:
		case 3841:
		case 3832:
		case 3838:
		case 3836:
		case 3837:
		case 3834:
		case 3835:
		case 3796:
		case 3820:
		case 3818:
		case 3803:
		case 3804:
		case 3805:
		case 3807:
		case 3802:
		case 3800:
		case 3801:
		case 3798:
		case 3799:
		case 3819:
		case 3808:
		case 3810:
		case 3815:
		case 3816:
		case 3817:
		case 3809:
		case 3814:
		case 3812:
		case 3813:
		case 3811:
		case 3937:
		case 3806:
		case 3939:
		case 4059:
		case 4060:
		case 4061:
		case 4062:
		case 4058:
		case 4056:
		case 4057:
		case 4054:
		case 4055:
		case 4053:
		case 4063:
		case 4065:
		case 4071:
		case 4072:
		case 4073:
		case 4064:
		case 4070:
		case 4068:
		case 4069:
		case 4066:
		case 4067:
		case 4074:
		case 4052:
		case 4050:
		case 4036:
		case 4037:
		case 4038:
		case 4039:
		case 4035:
		case 4033:
		case 4034:
		case 4031:
		case 4032:
		case 4051:
		case 4040:
		case 4042:
		case 4047:
		case 4048:
		case 4049:
		case 4041:
		case 4046:
		case 4044:
		case 4045:
		case 4043:
		case 4030:
		case 4075:
		case 4077:
		case 4107:
		case 4108:
		case 4109:
		case 4110:
		case 4106:
		case 4104:
		case 4105:
		case 4102:
		case 4103:
		case 4101:
		case 4111:
		case 4113:
		case 4117:
		case 4119:
		case 4118:
		case 4112:
		case 4120:
		case 4116:
		case 3938:
		case 4114:
		case 4115:
		case 4076:
		case 4100:
		case 4098:
		case 4083:
		case 4084:
		case 4085:
		case 4086:
		case 4082:
		case 4080:
		case 4081:
		case 4078:
		case 4079:
		case 4099:
		case 4087:
		case 4089:
		case 4095:
		case 4096:
		case 4097:
		case 4088:
		case 4094:
		case 4092:
		case 4093:
		case 4090:
		case 4029:
		case 4091:
		case 4027:
		case 3970:
		case 3971:
		case 3972:
		case 3973:
		case 3969:
		case 3967:
		case 3968:
		case 3965:
		case 3966:
		case 3964:
		case 3974:
		case 3976:
		case 3981:
		case 3982:
		case 3983:
		case 3975:
		case 3980:
		case 3978:
		case 3979:
		case 3977:
		case 3984:
		case 3963:
		case 3961:
		case 3946:
		case 3947:
		case 3948:
		case 3949:
		case 3945:
		case 3941:
		case 4028:
		case 3944:
		case 3942:
		case 3962:
		case 3950:
		case 3952:
		case 3958:
		case 3959:
		case 3960:
		case 3951:
		case 3956:
		case 3954:
		case 3955:
		case 3953:
		case 3985:
		case 3957:
		case 3987:
		case 4013:
		case 4014:
		case 4015:
		case 4016:
		case 4012:
		case 4011:
		case 3940:
		case 4009:
		case 4010:
		case 4008:
		case 4017:
		case 4019:
		case 4024:
		case 4025:
		case 4026:
		case 4018:
		case 4023:
		case 4022:
		case 3986:
		case 4020:
		case 4021:
		case 4007:
		case 3943:
		case 4005:
		case 3994:
		case 3992:
		case 3996:
		case 3997:
		case 3993:
		case 3991:
		case 4006:
		case 3988:
		case 3989:
		case 3998:
		case 3995:
		case 4000:
		case 4004:
		case 3999:
		case 4001:
		case 4003:
		case 4002:
		case 3990:
			function314C8(arg0, glob479AC[arg0], 2004318207);
		case 18100:
		case 18098:
		case 18099:
		case 18101:
		case 18103:
		case 18104:
		case 18106:
		case 18102:
		case 18105:
		case 18108:
		case 18107:
		case 18097:
		case 18092:
		case 18095:
		case 18084:
		case 18085:
		case 18086:
		case 18083:
		case 18081:
		case 18082:
		case 18096:
		case 18087:
		case 18089:
		case 18093:
		case 18094:
		case 18088:
		case 18109:
		case 18090:
		case 18091:
		case 18110:
		case 18117:
		case 18112:
		case 18135:
		case 18136:
		case 18137:
		case 18134:
		case 18132:
		case 18133:
		case 18131:
		case 18138:
		case 18141:
		case 18140:
		case 18142:
		case 18139:
		case 18143:
		case 18080:
		case 18111:
		case 18130:
		case 18127:
		case 18116:
		case 18118:
		case 18119:
		case 18115:
		case 18113:
		case 18114:
		case 18129:
		case 18120:
		case 18122:
		case 18126:
		case 18121:
		case 18125:
		case 18123:
		case 18124:
		case 18128:
		case 18039:
		case 18078:
		case 18032:
		case 18033:
		case 18034:
		case 18031:
		case 18029:
		case 18030:
		case 18028:
		case 18035:
		case 18037:
		case 18042:
		case 18043:
		case 18036:
		case 18041:
		case 18038:
		case 18040:
		case 18044:
		case 18027:
		case 18025:
		case 18017:
		case 18144:
		case 18013:
		case 18016:
		case 18014:
		case 18015:
		case 18026:
		case 18018:
		case 18020:
		case 18024:
		case 18019:
		case 18023:
		case 18021:
		case 18022:
		case 18079:
		case 18045:
		case 18047:
		case 18068:
		case 18069:
		case 18070:
		case 18067:
		case 18065:
		case 18066:
		case 18064:
		case 18071:
		case 18073:
		case 18077:
		case 18072:
		case 18076:
		case 18074:
		case 18075:
		case 18046:
		case 18063:
		case 18061:
		case 18051:
		case 18052:
		case 18053:
		case 18050:
		case 18048:
		case 18049:
		case 18062:
		case 18054:
		case 18056:
		case 18060:
		case 18055:
		case 18059:
		case 18057:
		case 18058:
		case 18145:
		case 18233:
		case 18147:
		case 18237:
		case 18238:
		case 18239:
		case 18236:
		case 18234:
		case 18235:
		case 18232:
		case 18240:
		case 18242:
		case 18246:
		case 18241:
		case 18245:
		case 18243:
		case 18244:
		case 18247:
		case 18231:
		case 18229:
		case 18219:
		case 18220:
		case 18221:
		case 18218:
		case 18216:
		case 18217:
		case 18230:
		case 18222:
		case 18224:
		case 18228:
		case 18223:
		case 18227:
		case 18225:
		case 18226:
		case 18215:
		case 18248:
		case 18250:
		case 18271:
		case 18272:
		case 18273:
		case 18270:
		case 18268:
		case 18269:
		case 18267:
		case 18274:
		case 18279:
		case 18278:
		case 18275:
		case 18277:
		case 18012:
		case 18276:
		case 18249:
		case 18266:
		case 18264:
		case 18254:
		case 18255:
		case 18256:
		case 18253:
		case 18251:
		case 18252:
		case 18265:
		case 18257:
		case 18259:
		case 18263:
		case 18258:
		case 18262:
		case 18260:
		case 18261:
		case 18146:
		case 18214:
		case 18212:
		case 18168:
		case 18169:
		case 18170:
		case 18167:
		case 18165:
		case 18166:
		case 18164:
		case 18171:
		case 18173:
		case 18177:
		case 18172:
		case 18176:
		case 18174:
		case 18175:
		case 18178:
		case 18163:
		case 18161:
		case 18151:
		case 18152:
		case 18153:
		case 18150:
		case 18148:
		case 18149:
		case 18162:
		case 18154:
		case 18156:
		case 18160:
		case 18155:
		case 18159:
		case 18157:
		case 18158:
		case 18213:
		case 18179:
		case 18181:
		case 18202:
		case 18203:
		case 18204:
		case 18201:
		case 18199:
		case 18200:
		case 18198:
		case 18205:
		case 18207:
		case 18211:
		case 18206:
		case 18210:
		case 18208:
		case 18209:
		case 18180:
		case 18197:
		case 18195:
		case 18185:
		case 18186:
		case 18187:
		case 18184:
		case 18182:
		case 18183:
		case 18196:
		case 18188:
		case 18190:
		case 18194:
		case 18189:
		case 18193:
		case 18191:
		case 18192:
		case 18011:
		case 17828:
		case 18009:
		case 17827:
		case 17829:
		case 17830:
		case 17826:
		case 17824:
		case 17825:
		case 17823:
		case 17831:
		case 17833:
		case 17837:
		case 17838:
		case 17832:
		case 17836:
		case 17834:
		case 17835:
		case 17839:
		case 17822:
		case 17820:
		case 17810:
		case 17811:
		case 17812:
		case 17809:
		case 17807:
		case 17808:
		case 17821:
		case 17813:
		case 17815:
		case 17819:
		case 17814:
		case 17818:
		case 17816:
		case 17817:
		case 17806:
		case 17840:
		case 17842:
		case 17863:
		case 17864:
		case 17865:
		case 17862:
		case 17860:
		case 17861:
		case 17859:
		case 17866:
		case 17868:
		case 17872:
		case 17867:
		case 17871:
		case 17869:
		case 17870:
		case 17841:
		case 17858:
		case 17856:
		case 17846:
		case 17847:
		case 17848:
		case 17845:
		case 17843:
		case 17844:
		case 17857:
		case 17849:
		case 17851:
		case 17855:
		case 17850:
		case 17854:
		case 17852:
		case 17853:
		case 17873:
		case 17805:
		case 17803:
		case 17759:
		case 17760:
		case 17761:
		case 17758:
		case 17756:
		case 17757:
		case 17755:
		case 17762:
		case 17764:
		case 17768:
		case 17763:
		case 17767:
		case 17765:
		case 17766:
		case 17769:
		case 17754:
		case 17752:
		case 17740:
		case 17743:
		case 17744:
		case 18280:
		case 17741:
		case 17742:
		case 17753:
		case 17745:
		case 17747:
		case 17751:
		case 17746:
		case 17750:
		case 17748:
		case 17749:
		case 17804:
		case 17770:
		case 17772:
		case 17793:
		case 17794:
		case 17795:
		case 17792:
		case 17790:
		case 17791:
		case 17789:
		case 17796:
		case 17798:
		case 17802:
		case 17797:
		case 17801:
		case 17799:
		case 17800:
		case 17771:
		case 17788:
		case 17786:
		case 17776:
		case 17777:
		case 17778:
		case 17775:
		case 17773:
		case 17774:
		case 17787:
		case 17779:
		case 17781:
		case 17785:
		case 17780:
		case 17784:
		case 17782:
		case 17783:
		case 18010:
		case 17874:
		case 17876:
		case 17965:
		case 17966:
		case 17967:
		case 17964:
		case 17962:
		case 17963:
		case 17961:
		case 17968:
		case 17970:
		case 17974:
		case 17969:
		case 17973:
		case 17971:
		case 17972:
		case 17975:
		case 17960:
		case 17958:
		case 17948:
		case 17949:
		case 17950:
		case 17947:
		case 17945:
		case 17946:
		case 17959:
		case 17951:
		case 17953:
		case 17957:
		case 17952:
		case 17956:
		case 17954:
		case 17955:
		case 17944:
		case 17976:
		case 17978:
		case 17999:
		case 18000:
		case 18001:
		case 17998:
		case 17996:
		case 17997:
		case 17995:
		case 18002:
		case 18004:
		case 18008:
		case 18003:
		case 18007:
		case 18005:
		case 18006:
		case 17977:
		case 17994:
		case 17992:
		case 17982:
		case 17983:
		case 17984:
		case 17981:
		case 17979:
		case 17980:
		case 17993:
		case 17985:
		case 17987:
		case 17991:
		case 17986:
		case 17990:
		case 17988:
		case 17989:
		case 17875:
		case 17943:
		case 17941:
		case 17897:
		case 17898:
		case 17899:
		case 17896:
		case 17894:
		case 17895:
		case 17893:
		case 17900:
		case 17902:
		case 17906:
		case 17901:
		case 17905:
		case 17903:
		case 17904:
		case 17907:
		case 17892:
		case 17890:
		case 17880:
		case 17881:
		case 17882:
		case 17879:
		case 17877:
		case 17878:
		case 17891:
		case 17883:
		case 17885:
		case 17889:
		case 17884:
		case 17888:
		case 17886:
		case 17887:
		case 17942:
		case 17908:
		case 17910:
		case 17931:
		case 17932:
		case 17933:
		case 17930:
		case 17928:
		case 17929:
		case 17927:
		case 17934:
		case 17936:
		case 17940:
		case 17935:
		case 17939:
		case 17937:
		case 17938:
		case 17909:
		case 17926:
		case 17924:
		case 17914:
		case 17915:
		case 17916:
		case 17913:
		case 17911:
		case 17912:
		case 17925:
		case 17917:
		case 17919:
		case 17923:
		case 17918:
		case 17922:
		case 17920:
		case 17921:
		case 18281:
		case 18653:
		case 18283:
		case 18644:
		case 18645:
		case 18646:
		case 18643:
		case 18641:
		case 18642:
		case 18640:
		case 18647:
		case 18649:
		case 18654:
		case 18655:
		case 18648:
		case 18652:
		case 18650:
		case 18651:
		case 18656:
		case 18639:
		case 18637:
		case 18627:
		case 18628:
		case 18629:
		case 18626:
		case 18624:
		case 18625:
		case 18638:
		case 18630:
		case 18632:
		case 18636:
		case 18631:
		case 18635:
		case 18633:
		case 18634:
		case 18623:
		case 18657:
		case 18659:
		case 18680:
		case 18681:
		case 18682:
		case 18679:
		case 18677:
		case 18678:
		case 18676:
		case 18683:
		case 18685:
		case 18689:
		case 18684:
		case 18688:
		case 18686:
		case 18687:
		case 18658:
		case 18675:
		case 18673:
		case 18663:
		case 18664:
		case 18665:
		case 18662:
		case 18660:
		case 18661:
		case 18674:
		case 18666:
		case 18668:
		case 18672:
		case 18667:
		case 18671:
		case 18669:
		case 18670:
		case 18690:
		case 18622:
		case 18620:
		case 18576:
		case 18577:
		case 18578:
		case 18575:
		case 18573:
		case 18574:
		case 18572:
		case 18579:
		case 18581:
		case 18585:
		case 18580:
		case 18584:
		case 18582:
		case 18583:
		case 18586:
		case 18571:
		case 18569:
		case 18559:
		case 18560:
		case 18561:
		case 18558:
		case 18556:
		case 18557:
		case 18570:
		case 18562:
		case 18564:
		case 18568:
		case 18563:
		case 18567:
		case 18565:
		case 18566:
		case 18621:
		case 18587:
		case 18589:
		case 18610:
		case 18611:
		case 18612:
		case 18609:
		case 18607:
		case 18608:
		case 18606:
		case 18613:
		case 18615:
		case 18619:
		case 18614:
		case 18618:
		case 18616:
		case 18617:
		case 18588:
		case 18605:
		case 18603:
		case 18593:
		case 18594:
		case 18595:
		case 18592:
		case 18590:
		case 18591:
		case 18604:
		case 18596:
		case 18598:
		case 18602:
		case 18597:
		case 18601:
		case 18599:
		case 18600:
		case 18555:
		case 18691:
		case 18693:
		case 18782:
		case 18783:
		case 18784:
		case 18781:
		case 18779:
		case 18780:
		case 18778:
		case 18785:
		case 18787:
		case 18791:
		case 18786:
		case 18790:
		case 18788:
		case 18789:
		case 18792:
		case 18777:
		case 18775:
		case 18765:
		case 18766:
		case 18767:
		case 18764:
		case 18762:
		case 18763:
		case 18776:
		case 18768:
		case 18770:
		case 18774:
		case 18769:
		case 18773:
		case 18771:
		case 18772:
		case 18761:
		case 18793:
		case 18795:
		case 18816:
		case 18817:
		case 18818:
		case 18815:
		case 18813:
		case 18814:
		case 18812:
		case 18819:
		case 18821:
		case 18824:
		case 18820:
		case 18823:
		case 18822:
		case 17739:
		case 18794:
		case 18811:
		case 18809:
		case 18799:
		case 18800:
		case 18801:
		case 18798:
		case 18796:
		case 18797:
		case 18810:
		case 18802:
		case 18804:
		case 18808:
		case 18803:
		case 18807:
		case 18805:
		case 18806:
		case 18692:
		case 18760:
		case 18758:
		case 18714:
		case 18715:
		case 18716:
		case 18713:
		case 18711:
		case 18712:
		case 18710:
		case 18717:
		case 18719:
		case 18723:
		case 18718:
		case 18722:
		case 18720:
		case 18721:
		case 18724:
		case 18709:
		case 18707:
		case 18697:
		case 18698:
		case 18699:
		case 18696:
		case 18694:
		case 18695:
		case 18708:
		case 18700:
		case 18702:
		case 18706:
		case 18701:
		case 18705:
		case 18703:
		case 18704:
		case 18759:
		case 18725:
		case 18727:
		case 18748:
		case 18749:
		case 18750:
		case 18747:
		case 18745:
		case 18746:
		case 18744:
		case 18751:
		case 18753:
		case 18757:
		case 18752:
		case 18756:
		case 18754:
		case 18755:
		case 18726:
		case 18743:
		case 18741:
		case 18731:
		case 18732:
		case 18733:
		case 18730:
		case 18728:
		case 18729:
		case 18742:
		case 18734:
		case 18736:
		case 18740:
		case 18735:
		case 18739:
		case 18737:
		case 18738:
		case 18282:
		case 18554:
		case 18552:
		case 18372:
		case 18373:
		case 18374:
		case 18371:
		case 18369:
		case 18370:
		case 18368:
		case 18375:
		case 18377:
		case 18381:
		case 18376:
		case 18380:
		case 18378:
		case 18379:
		case 18382:
		case 18367:
		case 18365:
		case 18355:
		case 18356:
		case 18357:
		case 18354:
		case 18352:
		case 18353:
		case 18366:
		case 18358:
		case 18360:
		case 18364:
		case 18359:
		case 18363:
		case 18361:
		case 18362:
		case 18351:
		case 18383:
		case 18385:
		case 18406:
		case 18407:
		case 18408:
		case 18405:
		case 18403:
		case 18404:
		case 18402:
		case 18409:
		case 18411:
		case 18415:
		case 18410:
		case 18414:
		case 18412:
		case 18413:
		case 18384:
		case 18401:
		case 18399:
		case 18389:
		case 18390:
		case 18391:
		case 18388:
		case 18386:
		case 18387:
		case 18400:
		case 18392:
		case 18394:
		case 18398:
		case 18393:
		case 18397:
		case 18395:
		case 18396:
		case 18416:
		case 18350:
		case 18348:
		case 18304:
		case 18305:
		case 18306:
		case 18303:
		case 18301:
		case 18302:
		case 18300:
		case 18307:
		case 18309:
		case 18313:
		case 18308:
		case 18312:
		case 18310:
		case 18311:
		case 18314:
		case 18299:
		case 18297:
		case 18287:
		case 18288:
		case 18289:
		case 18286:
		case 18284:
		case 18285:
		case 18298:
		case 18290:
		case 18292:
		case 18296:
		case 18291:
		case 18295:
		case 18293:
		case 18294:
		case 18349:
		case 18315:
		case 18317:
		case 18338:
		case 18339:
		case 18340:
		case 18337:
		case 18335:
		case 18336:
		case 18334:
		case 18341:
		case 18343:
		case 18347:
		case 18342:
		case 18346:
		case 18344:
		case 18345:
		case 18316:
		case 18333:
		case 18331:
		case 18321:
		case 18322:
		case 18323:
		case 18320:
		case 18318:
		case 18319:
		case 18332:
		case 18324:
		case 18326:
		case 18330:
		case 18325:
		case 18329:
		case 18327:
		case 18328:
		case 18553:
		case 18417:
		case 18419:
		case 18508:
		case 18509:
		case 18510:
		case 18507:
		case 18505:
		case 18506:
		case 18504:
		case 18511:
		case 18513:
		case 18517:
		case 18512:
		case 18516:
		case 18514:
		case 18515:
		case 18518:
		case 18503:
		case 18501:
		case 18491:
		case 18492:
		case 18493:
		case 18490:
		case 18488:
		case 18489:
		case 18502:
		case 18494:
		case 18496:
		case 18500:
		case 18495:
		case 18499:
		case 18497:
		case 18498:
		case 18487:
		case 18519:
		case 18521:
		case 18542:
		case 18543:
		case 18544:
		case 18541:
		case 18539:
		case 18540:
		case 18538:
		case 18545:
		case 18547:
		case 18551:
		case 18546:
		case 18550:
		case 18548:
		case 18549:
		case 18520:
		case 18537:
		case 18535:
		case 18525:
		case 18526:
		case 18527:
		case 18524:
		case 18522:
		case 18523:
		case 18536:
		case 18528:
		case 18530:
		case 18534:
		case 18529:
		case 18533:
		case 18531:
		case 18532:
		case 18418:
		case 18486:
		case 18484:
		case 18440:
		case 18441:
		case 18442:
		case 18439:
		case 18437:
		case 18438:
		case 18436:
		case 18443:
		case 18445:
		case 18449:
		case 18444:
		case 18448:
		case 18446:
		case 18447:
		case 18450:
		case 18435:
		case 18433:
		case 18423:
		case 18424:
		case 18425:
		case 18422:
		case 18420:
		case 18421:
		case 18434:
		case 18426:
		case 18428:
		case 18432:
		case 18427:
		case 18431:
		case 18429:
		case 18430:
		case 18485:
		case 18451:
		case 18453:
		case 18474:
		case 18475:
		case 18476:
		case 18473:
		case 18471:
		case 18472:
		case 18470:
		case 18477:
		case 18479:
		case 18483:
		case 18478:
		case 18482:
		case 18480:
		case 18481:
		case 18452:
		case 18469:
		case 18467:
		case 18457:
		case 18458:
		case 18459:
		case 18456:
		case 18454:
		case 18455:
		case 18468:
		case 18460:
		case 18462:
		case 18466:
		case 18461:
		case 18465:
		case 18463:
		case 18464:
		case 17738:
		case 16991:
		case 17736:
		case 17012:
		case 17013:
		case 17014:
		case 17011:
		case 17009:
		case 17010:
		case 17008:
		case 17015:
		case 17017:
		case 17021:
		case 17016:
		case 17020:
		case 17018:
		case 17019:
		case 17022:
		case 17007:
		case 17005:
		case 16995:
		case 16996:
		case 16997:
		case 16994:
		case 16992:
		case 16993:
		case 17006:
		case 16998:
		case 17000:
		case 17004:
		case 16999:
		case 17003:
		case 17001:
		case 17002:
		case 16990:
		case 17023:
		case 17025:
		case 17046:
		case 17047:
		case 17048:
		case 17045:
		case 17043:
		case 17044:
		case 17042:
		case 17049:
		case 17051:
		case 17055:
		case 17050:
		case 17054:
		case 17052:
		case 17053:
		case 17024:
		case 17041:
		case 17039:
		case 17029:
		case 17030:
		case 17031:
		case 17028:
		case 17026:
		case 17027:
		case 17040:
		case 17032:
		case 17034:
		case 17038:
		case 17033:
		case 17037:
		case 17035:
		case 17036:
		case 17056:
		case 16989:
		case 16987:
		case 16943:
		case 16944:
		case 16945:
		case 16942:
		case 16940:
		case 16941:
		case 16939:
		case 16946:
		case 16948:
		case 16952:
		case 16947:
		case 16951:
		case 16949:
		case 16950:
		case 16953:
		case 16938:
		case 16936:
		case 16926:
		case 16927:
		case 16928:
		case 16925:
		case 16923:
		case 16924:
		case 16937:
		case 16929:
		case 16931:
		case 16935:
		case 16930:
		case 16934:
		case 16932:
		case 16933:
		case 16988:
		case 16954:
		case 16956:
		case 16977:
		case 16978:
		case 16979:
		case 16976:
		case 16974:
		case 16975:
		case 16973:
		case 16980:
		case 16982:
		case 16986:
		case 16981:
		case 16985:
		case 16983:
		case 16984:
		case 16955:
		case 16972:
		case 16970:
		case 16960:
		case 16961:
		case 16962:
		case 16959:
		case 16957:
		case 16958:
		case 16971:
		case 16963:
		case 16965:
		case 16969:
		case 16964:
		case 16968:
		case 16966:
		case 16967:
		case 16922:
		case 17057:
		case 17059:
		case 17148:
		case 17149:
		case 17150:
		case 17147:
		case 17145:
		case 17146:
		case 17144:
		case 17151:
		case 17153:
		case 17157:
		case 17152:
		case 17156:
		case 17154:
		case 17155:
		case 17158:
		case 17143:
		case 17141:
		case 17131:
		case 17132:
		case 17133:
		case 17130:
		case 17128:
		case 17129:
		case 17142:
		case 17134:
		case 17136:
		case 17140:
		case 17135:
		case 17139:
		case 17137:
		case 17138:
		case 17127:
		case 17159:
		case 17161:
		case 17182:
		case 17183:
		case 17184:
		case 17181:
		case 17179:
		case 17180:
		case 17178:
		case 17185:
		case 17187:
		case 17191:
		case 17186:
		case 17190:
		case 17188:
		case 17189:
		case 17160:
		case 17177:
		case 17175:
		case 17165:
		case 17166:
		case 17167:
		case 17164:
		case 17162:
		case 17163:
		case 17176:
		case 17168:
		case 17170:
		case 17174:
		case 17169:
		case 17173:
		case 17171:
		case 17172:
		case 17058:
		case 17126:
		case 17124:
		case 17080:
		case 17081:
		case 17082:
		case 17079:
		case 17077:
		case 17078:
		case 17076:
		case 17083:
		case 17085:
		case 17089:
		case 17084:
		case 17088:
		case 17086:
		case 17087:
		case 17090:
		case 17075:
		case 17073:
		case 17063:
		case 17064:
		case 17065:
		case 17062:
		case 17060:
		case 17061:
		case 17074:
		case 17066:
		case 17068:
		case 17072:
		case 17067:
		case 17071:
		case 17069:
		case 17070:
		case 17125:
		case 17091:
		case 17093:
		case 17114:
		case 17115:
		case 17116:
		case 17113:
		case 17111:
		case 17112:
		case 17110:
		case 17117:
		case 17119:
		case 17123:
		case 17118:
		case 17122:
		case 17120:
		case 17121:
		case 17092:
		case 17109:
		case 17107:
		case 17097:
		case 17098:
		case 17099:
		case 17096:
		case 17094:
		case 17095:
		case 17108:
		case 17100:
		case 17102:
		case 17106:
		case 17101:
		case 17105:
		case 17103:
		case 17104:
		case 17192:
		case 16921:
		case 16919:
		case 16739:
		case 16740:
		case 16741:
		case 16738:
		case 16736:
		case 16737:
		case 16735:
		case 16742:
		case 16744:
		case 16748:
		case 16743:
		case 16747:
		case 16745:
		case 16746:
		case 16749:
		case 16734:
		case 16732:
		case 16722:
		case 16723:
		case 16724:
		case 16721:
		case 16719:
		case 16720:
		case 16733:
		case 16725:
		case 16727:
		case 16731:
		case 16726:
		case 16730:
		case 16728:
		case 16729:
		case 16718:
		case 16750:
		case 16752:
		case 16773:
		case 16774:
		case 16775:
		case 16772:
		case 16770:
		case 16771:
		case 16769:
		case 16776:
		case 16778:
		case 16782:
		case 16777:
		case 16781:
		case 16779:
		case 16780:
		case 16751:
		case 16768:
		case 16766:
		case 16756:
		case 16757:
		case 16758:
		case 16755:
		case 16753:
		case 16754:
		case 16767:
		case 16759:
		case 16761:
		case 16765:
		case 16760:
		case 16764:
		case 16762:
		case 16763:
		case 16783:
		case 16717:
		case 16715:
		case 16671:
		case 16672:
		case 16673:
		case 16670:
		case 16668:
		case 16669:
		case 16667:
		case 16674:
		case 16676:
		case 16680:
		case 16675:
		case 16679:
		case 16677:
		case 16678:
		case 16681:
		case 16666:
		case 16664:
		case 16654:
		case 16655:
		case 16656:
		case 16653:
		case 16652:
		case 18825:
		case 16665:
		case 16657:
		case 16659:
		case 16663:
		case 16658:
		case 16662:
		case 16660:
		case 16661:
		case 16716:
		case 16682:
		case 16684:
		case 16705:
		case 16706:
		case 16707:
		case 16704:
		case 16702:
		case 16703:
		case 16701:
		case 16708:
		case 16710:
		case 16714:
		case 16709:
		case 16713:
		case 16711:
		case 16712:
		case 16683:
		case 16700:
		case 16698:
		case 16688:
		case 16689:
		case 16690:
		case 16687:
		case 16685:
		case 16686:
		case 16699:
		case 16691:
		case 16693:
		case 16697:
		case 16692:
		case 16696:
		case 16694:
		case 16695:
		case 16920:
		case 16784:
		case 16786:
		case 16875:
		case 16876:
		case 16877:
		case 16874:
		case 16872:
		case 16873:
		case 16871:
		case 16878:
		case 16880:
		case 16884:
		case 16879:
		case 16883:
		case 16881:
		case 16882:
		case 16885:
		case 16870:
		case 16868:
		case 16858:
		case 16859:
		case 16860:
		case 16857:
		case 16855:
		case 16856:
		case 16869:
		case 16861:
		case 16863:
		case 16867:
		case 16862:
		case 16866:
		case 16864:
		case 16865:
		case 16854:
		case 16886:
		case 16888:
		case 16909:
		case 16910:
		case 16911:
		case 16908:
		case 16906:
		case 16907:
		case 16905:
		case 16912:
		case 16914:
		case 16918:
		case 16913:
		case 16917:
		case 16915:
		case 16916:
		case 16887:
		case 16904:
		case 16902:
		case 16892:
		case 16893:
		case 16894:
		case 16891:
		case 16889:
		case 16890:
		case 16903:
		case 16895:
		case 16897:
		case 16901:
		case 16896:
		case 16900:
		case 16898:
		case 16899:
		case 16785:
		case 16853:
		case 16851:
		case 16807:
		case 16808:
		case 16809:
		case 16806:
		case 16804:
		case 16805:
		case 16803:
		case 16810:
		case 16812:
		case 16816:
		case 16811:
		case 16815:
		case 16813:
		case 16814:
		case 16817:
		case 16802:
		case 16800:
		case 16790:
		case 16791:
		case 16792:
		case 16789:
		case 16787:
		case 16788:
		case 16801:
		case 16793:
		case 16795:
		case 16799:
		case 16794:
		case 16798:
		case 16796:
		case 16797:
		case 16852:
		case 16818:
		case 16820:
		case 16841:
		case 16842:
		case 16843:
		case 16840:
		case 16838:
		case 16839:
		case 16837:
		case 16844:
		case 16846:
		case 16850:
		case 16845:
		case 16849:
		case 16847:
		case 16848:
		case 16819:
		case 16836:
		case 16834:
		case 16824:
		case 16825:
		case 16826:
		case 16823:
		case 16821:
		case 16822:
		case 16835:
		case 16827:
		case 16829:
		case 16833:
		case 16828:
		case 16832:
		case 16830:
		case 16831:
		case 17737:
		case 17193:
		case 17195:
		case 17556:
		case 17557:
		case 17558:
		case 17555:
		case 17553:
		case 17554:
		case 17552:
		case 17559:
		case 17561:
		case 17565:
		case 17560:
		case 17564:
		case 17562:
		case 17563:
		case 17566:
		case 17551:
		case 17549:
		case 17539:
		case 17540:
		case 17541:
		case 17538:
		case 17536:
		case 17537:
		case 17550:
		case 17542:
		case 17544:
		case 17548:
		case 17543:
		case 17547:
		case 17545:
		case 17546:
		case 17535:
		case 17567:
		case 17569:
		case 17590:
		case 17591:
		case 17592:
		case 17589:
		case 17587:
		case 17588:
		case 17586:
		case 17593:
		case 17595:
		case 17599:
		case 17594:
		case 17598:
		case 17596:
		case 17597:
		case 17568:
		case 17585:
		case 17583:
		case 17573:
		case 17574:
		case 17575:
		case 17572:
		case 17570:
		case 17571:
		case 17584:
		case 17576:
		case 17578:
		case 17582:
		case 17577:
		case 17581:
		case 17579:
		case 17580:
		case 17600:
		case 17534:
		case 17532:
		case 17488:
		case 17489:
		case 17490:
		case 17487:
		case 17485:
		case 17486:
		case 17484:
		case 17491:
		case 17493:
		case 17497:
		case 17492:
		case 17496:
		case 17494:
		case 17495:
		case 17498:
		case 17483:
		case 17481:
		case 17471:
		case 17472:
		case 17473:
		case 17470:
		case 17468:
		case 17469:
		case 17482:
		case 17474:
		case 17476:
		case 17480:
		case 17475:
		case 17479:
		case 17477:
		case 17478:
		case 17533:
		case 17499:
		case 17501:
		case 17522:
		case 17523:
		case 17524:
		case 17521:
		case 17519:
		case 17520:
		case 17518:
		case 17525:
		case 17527:
		case 17531:
		case 17526:
		case 17530:
		case 17528:
		case 17529:
		case 17500:
		case 17517:
		case 17515:
		case 17505:
		case 17506:
		case 17507:
		case 17504:
		case 17502:
		case 17503:
		case 17516:
		case 17508:
		case 17510:
		case 17514:
		case 17509:
		case 17513:
		case 17511:
		case 17512:
		case 17467:
		case 17601:
		case 17603:
		case 17692:
		case 17693:
		case 17694:
		case 17691:
		case 17689:
		case 17690:
		case 17688:
		case 17695:
		case 17697:
		case 17701:
		case 17696:
		case 17700:
		case 17698:
		case 17699:
		case 17702:
		case 17687:
		case 17685:
		case 17675:
		case 17676:
		case 17677:
		case 17674:
		case 17672:
		case 17673:
		case 17686:
		case 17678:
		case 17680:
		case 17684:
		case 17679:
		case 17683:
		case 17681:
		case 17682:
		case 17671:
		case 17703:
		case 17705:
		case 17726:
		case 17727:
		case 17728:
		case 17725:
		case 17723:
		case 17724:
		case 17722:
		case 17729:
		case 17731:
		case 17735:
		case 17730:
		case 17734:
		case 17732:
		case 17733:
		case 17704:
		case 17721:
		case 17719:
		case 17709:
		case 17710:
		case 17711:
		case 17708:
		case 17706:
		case 17707:
		case 17720:
		case 17712:
		case 17714:
		case 17718:
		case 17713:
		case 17717:
		case 17715:
		case 17716:
		case 17602:
		case 17670:
		case 17668:
		case 17624:
		case 17625:
		case 17626:
		case 17623:
		case 17621:
		case 17622:
		case 17620:
		case 17627:
		case 17629:
		case 17633:
		case 17628:
		case 17632:
		case 17630:
		case 17631:
		case 17634:
		case 17619:
		case 17617:
		case 17607:
		case 17608:
		case 17609:
		case 17606:
		case 17604:
		case 17605:
		case 17618:
		case 17610:
		case 17612:
		case 17616:
		case 17611:
		case 17615:
		case 17613:
		case 17614:
		case 17669:
		case 17635:
		case 17637:
		case 17658:
		case 17659:
		case 17660:
		case 17657:
		case 17655:
		case 17656:
		case 17654:
		case 17661:
		case 17663:
		case 17667:
		case 17662:
		case 17666:
		case 17664:
		case 17665:
		case 17636:
		case 17653:
		case 17651:
		case 17641:
		case 17642:
		case 17643:
		case 17640:
		case 17638:
		case 17639:
		case 17652:
		case 17644:
		case 17646:
		case 17650:
		case 17645:
		case 17649:
		case 17647:
		case 17648:
		case 17194:
		case 17466:
		case 17464:
		case 17284:
		case 17285:
		case 17286:
		case 17283:
		case 17281:
		case 17282:
		case 17280:
		case 17287:
		case 17289:
		case 17293:
		case 17288:
		case 17292:
		case 17290:
		case 17291:
		case 17294:
		case 17279:
		case 17277:
		case 17267:
		case 17268:
		case 17269:
		case 17266:
		case 17264:
		case 17265:
		case 17278:
		case 17270:
		case 17272:
		case 17276:
		case 17271:
		case 17275:
		case 17273:
		case 17274:
		case 17263:
		case 17295:
		case 17297:
		case 17318:
		case 17319:
		case 17320:
		case 17317:
		case 17315:
		case 17316:
		case 17314:
		case 17321:
		case 17323:
		case 17327:
		case 17322:
		case 17326:
		case 17324:
		case 17325:
		case 17296:
		case 17313:
		case 17311:
		case 17301:
		case 17302:
		case 17303:
		case 17300:
		case 17298:
		case 17299:
		case 17312:
		case 17304:
		case 17306:
		case 17310:
		case 17305:
		case 17309:
		case 17307:
		case 17308:
		case 17328:
		case 17262:
		case 17260:
		case 17216:
		case 17217:
		case 17218:
		case 17215:
		case 17213:
		case 17214:
		case 17212:
		case 17219:
		case 17221:
		case 17225:
		case 17220:
		case 17224:
		case 17222:
		case 17223:
		case 17226:
		case 17211:
		case 17209:
		case 17199:
		case 17200:
		case 17201:
		case 17198:
		case 17196:
		case 17197:
		case 17210:
		case 17202:
		case 17204:
		case 17208:
		case 17203:
		case 17207:
		case 17205:
		case 17206:
		case 17261:
		case 17227:
		case 17229:
		case 17250:
		case 17251:
		case 17252:
		case 17249:
		case 17247:
		case 17248:
		case 17246:
		case 17253:
		case 17255:
		case 17259:
		case 17254:
		case 17258:
		case 17256:
		case 17257:
		case 17228:
		case 17245:
		case 17243:
		case 17233:
		case 17234:
		case 17235:
		case 17232:
		case 17230:
		case 17231:
		case 17244:
		case 17236:
		case 17238:
		case 17242:
		case 17237:
		case 17241:
		case 17239:
		case 17240:
		case 17465:
		case 17329:
		case 17331:
		case 17420:
		case 17421:
		case 17422:
		case 17419:
		case 17417:
		case 17418:
		case 17416:
		case 17423:
		case 17425:
		case 17429:
		case 17424:
		case 17428:
		case 17426:
		case 17427:
		case 17430:
		case 17415:
		case 17413:
		case 17403:
		case 17404:
		case 17405:
		case 17402:
		case 17400:
		case 17401:
		case 17414:
		case 17406:
		case 17408:
		case 17412:
		case 17407:
		case 17411:
		case 17409:
		case 17410:
		case 17399:
		case 17431:
		case 17433:
		case 17454:
		case 17455:
		case 17456:
		case 17453:
		case 17451:
		case 17452:
		case 17450:
		case 17457:
		case 17459:
		case 17463:
		case 17458:
		case 17462:
		case 17460:
		case 17461:
		case 17432:
		case 17449:
		case 17447:
		case 17437:
		case 17438:
		case 17439:
		case 17436:
		case 17434:
		case 17435:
		case 17448:
		case 17440:
		case 17442:
		case 17446:
		case 17441:
		case 17445:
		case 17443:
		case 17444:
		case 17330:
		case 17398:
		case 17396:
		case 17352:
		case 17353:
		case 17354:
		case 17351:
		case 17349:
		case 17350:
		case 17348:
		case 17355:
		case 17357:
		case 17361:
		case 17356:
		case 17360:
		case 17358:
		case 17359:
		case 17362:
		case 17347:
		case 17345:
		case 17335:
		case 17336:
		case 17337:
		case 17334:
		case 17332:
		case 17333:
		case 17346:
		case 17338:
		case 17340:
		case 17344:
		case 17339:
		case 17343:
		case 17341:
		case 17342:
		case 17397:
		case 17363:
		case 17365:
		case 17386:
		case 17387:
		case 17388:
		case 17385:
		case 17383:
		case 17384:
		case 17382:
		case 17389:
		case 17391:
		case 17395:
		case 17390:
		case 17394:
		case 17392:
		case 17393:
		case 17364:
		case 17381:
		case 17379:
		case 17369:
		case 17370:
		case 17371:
		case 17368:
		case 17366:
		case 17367:
		case 17380:
		case 17372:
		case 17374:
		case 17378:
		case 17373:
		case 17377:
		case 17375:
		case 17376:
		case 18826:
		case 20324:
		case 18828:
		case 20277:
		case 20278:
		case 20279:
		case 20276:
		case 20274:
		case 20275:
		case 20273:
		case 20280:
		case 20282:
		case 20286:
		case 20281:
		case 20285:
		case 20283:
		case 20284:
		case 20287:
		case 20272:
		case 20270:
		case 20260:
		case 20261:
		case 20262:
		case 20259:
		case 20257:
		case 20258:
		case 20271:
		case 20263:
		case 20265:
		case 20269:
		case 20264:
		case 20268:
		case 20266:
		case 20267:
		case 20256:
		case 20288:
		case 20290:
		case 20311:
		case 20312:
		case 20313:
		case 20310:
		case 20308:
		case 20309:
		case 20307:
		case 20314:
		case 20316:
		case 20320:
		case 20315:
		case 20319:
		case 20317:
		case 20318:
		case 20289:
		case 20306:
		case 20304:
		case 20294:
		case 20295:
		case 20296:
		case 20293:
		case 20291:
		case 20292:
		case 20305:
		case 20297:
		case 20299:
		case 20303:
		case 20298:
		case 20302:
		case 20300:
		case 20301:
		case 20321:
		case 20255:
		case 20253:
		case 20209:
		case 20210:
		case 20211:
		case 20208:
		case 20206:
		case 20207:
		case 20205:
		case 20212:
		case 20214:
		case 20218:
		case 20213:
		case 20217:
		case 20215:
		case 20216:
		case 20219:
		case 20204:
		case 20202:
		case 20192:
		case 20193:
		case 20194:
		case 20191:
		case 20189:
		case 20190:
		case 20203:
		case 20195:
		case 20197:
		case 20201:
		case 20196:
		case 20200:
		case 20198:
		case 20199:
		case 20254:
		case 20220:
		case 20222:
		case 20243:
		case 20244:
		case 20245:
		case 20242:
		case 20240:
		case 20241:
		case 20239:
		case 20246:
		case 20248:
		case 20252:
		case 20247:
		case 20251:
		case 20249:
		case 20250:
		case 20221:
		case 20238:
		case 20236:
		case 20226:
		case 20227:
		case 20228:
		case 20225:
		case 20223:
		case 20224:
		case 20237:
		case 20229:
		case 20231:
		case 20235:
		case 20230:
		case 20234:
		case 20232:
		case 20233:
		case 20188:
		case 20322:
		case 20325:
		case 20414:
		case 20415:
		case 20416:
		case 20413:
		case 20411:
		case 20412:
		case 20410:
		case 20417:
		case 20419:
		case 20423:
		case 20418:
		case 20422:
		case 20420:
		case 20421:
		case 20424:
		case 20409:
		case 20407:
		case 20397:
		case 20398:
		case 20399:
		case 20396:
		case 20394:
		case 20395:
		case 20408:
		case 20400:
		case 20402:
		case 20406:
		case 20401:
		case 20405:
		case 20403:
		case 20404:
		case 20393:
		case 20425:
		case 20427:
		case 20448:
		case 20449:
		case 20450:
		case 20447:
		case 20445:
		case 20446:
		case 20444:
		case 20451:
		case 20453:
		case 20457:
		case 20452:
		case 20456:
		case 20454:
		case 20455:
		case 20426:
		case 20443:
		case 20441:
		case 20431:
		case 20432:
		case 20433:
		case 20430:
		case 20428:
		case 20429:
		case 20442:
		case 20434:
		case 20436:
		case 20440:
		case 20435:
		case 20439:
		case 20437:
		case 20438:
		case 20323:
		case 20392:
		case 20390:
		case 20346:
		case 20347:
		case 20348:
		case 20345:
		case 20343:
		case 20344:
		case 20342:
		case 20349:
		case 20351:
		case 20355:
		case 20350:
		case 20354:
		case 20352:
		case 20353:
		case 20356:
		case 20341:
		case 20339:
		case 20329:
		case 20330:
		case 20331:
		case 20328:
		case 20326:
		case 20327:
		case 20340:
		case 20332:
		case 20334:
		case 20338:
		case 20333:
		case 20337:
		case 20335:
		case 20336:
		case 20391:
		case 20357:
		case 20359:
		case 20380:
		case 20381:
		case 20382:
		case 20379:
		case 20377:
		case 20378:
		case 20376:
		case 20383:
		case 20385:
		case 20389:
		case 20384:
		case 20388:
		case 20386:
		case 20387:
		case 20358:
		case 20375:
		case 20373:
		case 20363:
		case 20364:
		case 20365:
		case 20362:
		case 20360:
		case 20361:
		case 20374:
		case 20366:
		case 20368:
		case 20372:
		case 20367:
		case 20371:
		case 20369:
		case 20370:
		case 20458:
		case 20187:
		case 20185:
		case 20005:
		case 20006:
		case 20007:
		case 20004:
		case 20002:
		case 20003:
		case 20001:
		case 20008:
		case 20010:
		case 20014:
		case 20009:
		case 20013:
		case 20011:
		case 20012:
		case 20015:
		case 20000:
		case 19998:
		case 19988:
		case 19989:
		case 19990:
		case 19987:
		case 19985:
		case 19986:
		case 19999:
		case 19991:
		case 19993:
		case 19997:
		case 19992:
		case 19996:
		case 19994:
		case 19995:
		case 19984:
		case 20016:
		case 20018:
		case 20039:
		case 20040:
		case 20041:
		case 20038:
		case 20036:
		case 20037:
		case 20035:
		case 20042:
		case 20044:
		case 20048:
		case 20043:
		case 20047:
		case 20045:
		case 20046:
		case 20017:
		case 20034:
		case 20032:
		case 20022:
		case 20023:
		case 20024:
		case 20021:
		case 20019:
		case 20020:
		case 20033:
		case 20025:
		case 20027:
		case 20031:
		case 20026:
		case 20030:
		case 20028:
		case 20029:
		case 20049:
		case 19983:
		case 19981:
		case 19937:
		case 19938:
		case 19939:
		case 19936:
		case 19934:
		case 19935:
		case 19933:
		case 19940:
		case 19942:
		case 19946:
		case 19941:
		case 19945:
		case 19943:
		case 19944:
		case 19947:
		case 19932:
		case 19930:
		case 19920:
		case 19921:
		case 19922:
		case 19919:
		case 19917:
		case 19918:
		case 19931:
		case 19923:
		case 19925:
		case 19929:
		case 19924:
		case 19928:
		case 19926:
		case 19927:
		case 19982:
		case 19948:
		case 19950:
		case 19971:
		case 19972:
		case 19973:
		case 19970:
		case 19968:
		case 19969:
		case 19967:
		case 19974:
		case 19976:
		case 19980:
		case 19975:
		case 19979:
		case 19977:
		case 19978:
		case 19949:
		case 19966:
		case 19964:
		case 19954:
		case 19955:
		case 19956:
		case 19953:
		case 19951:
		case 19952:
		case 19965:
		case 19957:
		case 19959:
		case 19963:
		case 19958:
		case 19962:
		case 19960:
		case 19961:
		case 20186:
		case 20050:
		case 20052:
		case 20141:
		case 20142:
		case 20143:
		case 20140:
		case 20138:
		case 20139:
		case 20137:
		case 20144:
		case 20146:
		case 20150:
		case 20145:
		case 20149:
		case 20147:
		case 20148:
		case 20151:
		case 20136:
		case 20134:
		case 20124:
		case 20125:
		case 20126:
		case 20123:
		case 20121:
		case 20122:
		case 20135:
		case 20127:
		case 20129:
		case 20133:
		case 20128:
		case 20132:
		case 20130:
		case 20131:
		case 20120:
		case 20152:
		case 20154:
		case 20175:
		case 20176:
		case 20177:
		case 20174:
		case 20172:
		case 20173:
		case 20171:
		case 20178:
		case 20180:
		case 20184:
		case 20179:
		case 20183:
		case 20181:
		case 20182:
		case 20153:
		case 20170:
		case 20168:
		case 20158:
		case 20159:
		case 20160:
		case 20157:
		case 20155:
		case 20156:
		case 20169:
		case 20161:
		case 20163:
		case 20167:
		case 20162:
		case 20166:
		case 20164:
		case 20165:
		case 20051:
		case 20119:
		case 20117:
		case 20073:
		case 20074:
		case 20075:
		case 20072:
		case 20070:
		case 20071:
		case 20069:
		case 20076:
		case 20078:
		case 20082:
		case 20077:
		case 20081:
		case 20079:
		case 20080:
		case 20083:
		case 20068:
		case 20066:
		case 20056:
		case 20057:
		case 20058:
		case 20055:
		case 20053:
		case 20054:
		case 20067:
		case 20059:
		case 20061:
		case 20065:
		case 20060:
		case 20064:
		case 20062:
		case 20063:
		case 20118:
		case 20084:
		case 20086:
		case 20107:
		case 20108:
		case 20109:
		case 20106:
		case 20104:
		case 20105:
		case 20103:
		case 20110:
		case 20112:
		case 20116:
		case 20111:
		case 20115:
		case 20113:
		case 20114:
		case 20085:
		case 20102:
		case 20100:
		case 20090:
		case 20091:
		case 20092:
		case 20089:
		case 20087:
		case 20088:
		case 20101:
		case 20093:
		case 20095:
		case 20099:
		case 20094:
		case 20098:
		case 20096:
		case 20097:
		case 19916:
		case 20459:
		case 20461:
		case 20822:
		case 20823:
		case 20824:
		case 20821:
		case 20819:
		case 20820:
		case 20818:
		case 20825:
		case 20827:
		case 20831:
		case 20826:
		case 20830:
		case 20828:
		case 20829:
		case 20832:
		case 20817:
		case 20815:
		case 20805:
		case 20806:
		case 20807:
		case 20804:
		case 20802:
		case 20803:
		case 20816:
		case 20808:
		case 20810:
		case 20814:
		case 20809:
		case 20813:
		case 20811:
		case 20812:
		case 20801:
		case 20833:
		case 20835:
		case 20856:
		case 20857:
		case 20858:
		case 20855:
		case 20853:
		case 20854:
		case 20852:
		case 20859:
		case 20861:
		case 20865:
		case 20860:
		case 20864:
		case 20862:
		case 20863:
		case 20834:
		case 20851:
		case 20849:
		case 20839:
		case 20840:
		case 20841:
		case 20838:
		case 20836:
		case 20837:
		case 20850:
		case 20842:
		case 20844:
		case 20848:
		case 20843:
		case 20847:
		case 20845:
		case 20846:
		case 20866:
		case 20800:
		case 20798:
		case 20754:
		case 20755:
		case 20756:
		case 20753:
		case 20751:
		case 20752:
		case 20750:
		case 20757:
		case 20759:
		case 20763:
		case 20758:
		case 20762:
		case 20760:
		case 20761:
		case 20764:
		case 20749:
		case 20747:
		case 20737:
		case 20738:
		case 20739:
		case 20736:
		case 20734:
		case 20735:
		case 20748:
		case 20740:
		case 20742:
		case 20746:
		case 20741:
		case 20745:
		case 20743:
		case 20744:
		case 20799:
		case 20765:
		case 20767:
		case 20788:
		case 20789:
		case 20790:
		case 20787:
		case 20785:
		case 20786:
		case 20784:
		case 20791:
		case 20793:
		case 20797:
		case 20792:
		case 20796:
		case 20794:
		case 20795:
		case 20766:
		case 20783:
		case 20781:
		case 20771:
		case 20772:
		case 20773:
		case 20770:
		case 20768:
		case 20769:
		case 20782:
		case 20774:
		case 20776:
		case 20780:
		case 20775:
		case 20779:
		case 20777:
		case 20778:
		case 20733:
		case 20867:
		case 20869:
		case 20958:
		case 20959:
		case 20960:
		case 20957:
		case 20955:
		case 20956:
		case 20954:
		case 20961:
		case 20963:
		case 20967:
		case 20962:
		case 20966:
		case 20964:
		case 20965:
		case 20968:
		case 20953:
		case 20951:
		case 20941:
		case 20942:
		case 20943:
		case 20940:
		case 20938:
		case 20939:
		case 20952:
		case 20944:
		case 20946:
		case 20950:
		case 20945:
		case 20949:
		case 20947:
		case 20948:
		case 20937:
		case 20969:
		case 20971:
		case 20992:
		case 20993:
		case 20994:
		case 20991:
		case 20989:
		case 20990:
		case 20988:
		case 20995:
		case 20997:
		case 16651:
		case 20996:
		case 21000:
		case 20998:
		case 20999:
		case 20970:
		case 20987:
		case 20985:
		case 20975:
		case 20976:
		case 20977:
		case 20974:
		case 20972:
		case 20973:
		case 20986:
		case 20978:
		case 20980:
		case 20984:
		case 20979:
		case 20983:
		case 20981:
		case 20982:
		case 20868:
		case 20936:
		case 20934:
		case 20890:
		case 20891:
		case 20892:
		case 20889:
		case 20887:
		case 20888:
		case 20886:
		case 20893:
		case 20895:
		case 20899:
		case 20894:
		case 20898:
		case 20896:
		case 20897:
		case 20900:
		case 20885:
		case 20883:
		case 20873:
		case 20874:
		case 20875:
		case 20872:
		case 20870:
		case 20871:
		case 20884:
		case 20876:
		case 20878:
		case 20882:
		case 20877:
		case 20881:
		case 20879:
		case 20880:
		case 20935:
		case 20901:
		case 20903:
		case 20924:
		case 20925:
		case 20926:
		case 20923:
		case 20921:
		case 20922:
		case 20920:
		case 20927:
		case 20929:
		case 20933:
		case 20928:
		case 20932:
		case 20930:
		case 20931:
		case 20902:
		case 20919:
		case 20917:
		case 20907:
		case 20908:
		case 20909:
		case 20906:
		case 20904:
		case 20905:
		case 20918:
		case 20910:
		case 20912:
		case 20916:
		case 20911:
		case 20915:
		case 20913:
		case 20914:
		case 20460:
		case 20732:
		case 20730:
		case 20550:
		case 20551:
		case 20552:
		case 20549:
		case 20547:
		case 20548:
		case 20546:
		case 20553:
		case 20555:
		case 20559:
		case 20554:
		case 20558:
		case 20556:
		case 20557:
		case 20560:
		case 20545:
		case 20543:
		case 20533:
		case 20534:
		case 20535:
		case 20532:
		case 20530:
		case 20531:
		case 20544:
		case 20536:
		case 20538:
		case 20542:
		case 20537:
		case 20541:
		case 20539:
		case 20540:
		case 20529:
		case 20561:
		case 20563:
		case 20584:
		case 20585:
		case 20586:
		case 20583:
		case 20581:
		case 20582:
		case 20580:
		case 20587:
		case 20589:
		case 20593:
		case 20588:
		case 20592:
		case 20590:
		case 20591:
		case 20562:
		case 20579:
		case 20577:
		case 20567:
		case 20568:
		case 20569:
		case 20566:
		case 20564:
		case 20565:
		case 20578:
		case 20570:
		case 20572:
		case 20576:
		case 20571:
		case 20575:
		case 20573:
		case 20574:
		case 20594:
		case 20528:
		case 20526:
		case 20482:
		case 20483:
		case 20484:
		case 20481:
		case 20479:
		case 20480:
		case 20478:
		case 20485:
		case 20487:
		case 20491:
		case 20486:
		case 20490:
		case 20488:
		case 20489:
		case 20492:
		case 20477:
		case 20475:
		case 20465:
		case 20466:
		case 20467:
		case 20464:
		case 20462:
		case 20463:
		case 20476:
		case 20468:
		case 20470:
		case 20474:
		case 20469:
		case 20473:
		case 20471:
		case 20472:
		case 20527:
		case 20493:
		case 20495:
		case 20516:
		case 20517:
		case 20518:
		case 20515:
		case 20513:
		case 20514:
		case 20512:
		case 20519:
		case 20521:
		case 20525:
		case 20520:
		case 20524:
		case 20522:
		case 20523:
		case 20494:
		case 20511:
		case 20509:
		case 20499:
		case 20500:
		case 20501:
		case 20498:
		case 20496:
		case 20497:
		case 20510:
		case 20502:
		case 20504:
		case 20508:
		case 20503:
		case 20507:
		case 20505:
		case 20506:
		case 20731:
		case 20595:
		case 20597:
		case 20686:
		case 20687:
		case 20688:
		case 20685:
		case 20683:
		case 20684:
		case 20682:
		case 20689:
		case 20691:
		case 20695:
		case 20690:
		case 20694:
		case 20692:
		case 20693:
		case 20696:
		case 20681:
		case 20679:
		case 20669:
		case 20670:
		case 20671:
		case 20668:
		case 20666:
		case 20667:
		case 20680:
		case 20672:
		case 20674:
		case 20678:
		case 20673:
		case 20677:
		case 20675:
		case 20676:
		case 20665:
		case 20697:
		case 20699:
		case 20720:
		case 20721:
		case 20722:
		case 20719:
		case 20717:
		case 20718:
		case 20716:
		case 20723:
		case 20725:
		case 20729:
		case 20724:
		case 20728:
		case 20726:
		case 20727:
		case 20698:
		case 20715:
		case 20713:
		case 20703:
		case 20704:
		case 20705:
		case 20702:
		case 20700:
		case 20701:
		case 20714:
		case 20706:
		case 20708:
		case 20712:
		case 20707:
		case 20711:
		case 20709:
		case 20710:
		case 20596:
		case 20664:
		case 20662:
		case 20618:
		case 20619:
		case 20620:
		case 20617:
		case 20615:
		case 20616:
		case 20614:
		case 20621:
		case 20623:
		case 20627:
		case 20622:
		case 20626:
		case 20624:
		case 20625:
		case 20628:
		case 20613:
		case 20611:
		case 20601:
		case 20602:
		case 20603:
		case 20600:
		case 20598:
		case 20599:
		case 20612:
		case 20604:
		case 20606:
		case 20610:
		case 20605:
		case 20609:
		case 20607:
		case 20608:
		case 20663:
		case 20629:
		case 20631:
		case 20652:
		case 20653:
		case 20654:
		case 20651:
		case 20649:
		case 20650:
		case 20648:
		case 20655:
		case 20657:
		case 20661:
		case 20656:
		case 20660:
		case 20658:
		case 20659:
		case 20630:
		case 20647:
		case 20645:
		case 20635:
		case 20636:
		case 20637:
		case 20634:
		case 20632:
		case 20633:
		case 20646:
		case 20638:
		case 20640:
		case 20644:
		case 20639:
		case 20643:
		case 20641:
		case 20642:
		case 18827:
		case 19915:
		case 19913:
		case 19189:
		case 19190:
		case 19191:
		case 19188:
		case 19186:
		case 19187:
		case 19185:
		case 19192:
		case 19194:
		case 19198:
		case 19193:
		case 19197:
		case 19195:
		case 19196:
		case 19199:
		case 19184:
		case 19182:
		case 19172:
		case 19173:
		case 19174:
		case 19171:
		case 19169:
		case 19170:
		case 19183:
		case 19175:
		case 19177:
		case 19181:
		case 19176:
		case 19180:
		case 19178:
		case 19179:
		case 19168:
		case 19200:
		case 19202:
		case 19223:
		case 19224:
		case 19225:
		case 19222:
		case 19220:
		case 19221:
		case 19219:
		case 19226:
		case 19228:
		case 19232:
		case 19227:
		case 19231:
		case 19229:
		case 19230:
		case 19201:
		case 19218:
		case 19216:
		case 19206:
		case 19207:
		case 19208:
		case 19205:
		case 19203:
		case 19204:
		case 19217:
		case 19209:
		case 19211:
		case 19215:
		case 19210:
		case 19214:
		case 19212:
		case 19213:
		case 19233:
		case 19167:
		case 19165:
		case 19121:
		case 19122:
		case 19123:
		case 19120:
		case 19118:
		case 19119:
		case 19117:
		case 19124:
		case 19126:
		case 19130:
		case 19125:
		case 19129:
		case 19127:
		case 19128:
		case 19131:
		case 19116:
		case 19114:
		case 19104:
		case 19105:
		case 19106:
		case 19103:
		case 19101:
		case 19102:
		case 19115:
		case 19107:
		case 19109:
		case 19113:
		case 19108:
		case 19112:
		case 19110:
		case 19111:
		case 19166:
		case 19132:
		case 19134:
		case 19155:
		case 19156:
		case 19157:
		case 19154:
		case 19152:
		case 19153:
		case 19151:
		case 19158:
		case 19160:
		case 19164:
		case 19159:
		case 19163:
		case 19161:
		case 19162:
		case 19133:
		case 19150:
		case 19148:
		case 19138:
		case 19139:
		case 19140:
		case 19137:
		case 19135:
		case 19136:
		case 19149:
		case 19141:
		case 19143:
		case 19147:
		case 19142:
		case 19146:
		case 19144:
		case 19145:
		case 19100:
		case 19234:
		case 19236:
		case 19325:
		case 19326:
		case 19327:
		case 19324:
		case 19322:
		case 19323:
		case 19321:
		case 19328:
		case 19330:
		case 19334:
		case 19329:
		case 19333:
		case 19331:
		case 19332:
		case 19335:
		case 19320:
		case 19318:
		case 19308:
		case 19309:
		case 19310:
		case 19307:
		case 19305:
		case 19306:
		case 19319:
		case 19311:
		case 19313:
		case 19317:
		case 19312:
		case 19316:
		case 19314:
		case 19315:
		case 19304:
		case 19336:
		case 19338:
		case 19359:
		case 19360:
		case 19361:
		case 19358:
		case 19356:
		case 19357:
		case 19355:
		case 19362:
		case 19364:
		case 19368:
		case 19363:
		case 19367:
		case 19365:
		case 19366:
		case 19337:
		case 19354:
		case 19352:
		case 19342:
		case 19343:
		case 19344:
		case 19341:
		case 19339:
		case 19340:
		case 19353:
		case 19345:
		case 19347:
		case 19351:
		case 19346:
		case 19350:
		case 19348:
		case 19349:
		case 19235:
		case 19303:
		case 19301:
		case 19257:
		case 19258:
		case 19259:
		case 19256:
		case 19254:
		case 19255:
		case 19253:
		case 19260:
		case 19262:
		case 19266:
		case 19261:
		case 19265:
		case 19263:
		case 19264:
		case 19267:
		case 19252:
		case 19250:
		case 19240:
		case 19241:
		case 19242:
		case 19239:
		case 19237:
		case 19238:
		case 19251:
		case 19243:
		case 19245:
		case 19249:
		case 19244:
		case 19248:
		case 19246:
		case 19247:
		case 19302:
		case 19268:
		case 19270:
		case 19291:
		case 19292:
		case 19293:
		case 19290:
		case 19288:
		case 19289:
		case 19287:
		case 19294:
		case 19296:
		case 19300:
		case 19295:
		case 19299:
		case 19297:
		case 19298:
		case 19269:
		case 19286:
		case 19284:
		case 19274:
		case 19275:
		case 19276:
		case 19273:
		case 19271:
		case 19272:
		case 19285:
		case 19277:
		case 19279:
		case 19283:
		case 19278:
		case 19282:
		case 19280:
		case 19281:
		case 19369:
		case 19099:
		case 19097:
		case 18917:
		case 18918:
		case 18919:
		case 18916:
		case 18914:
		case 18915:
		case 18913:
		case 18920:
		case 18922:
		case 18926:
		case 18921:
		case 18925:
		case 18923:
		case 18924:
		case 18927:
		case 18912:
		case 18910:
		case 18900:
		case 18901:
		case 18902:
		case 18899:
		case 18897:
		case 18898:
		case 18911:
		case 18903:
		case 18905:
		case 18909:
		case 18904:
		case 18908:
		case 18906:
		case 18907:
		case 18896:
		case 18928:
		case 18930:
		case 18951:
		case 18952:
		case 18953:
		case 18950:
		case 18948:
		case 18949:
		case 18947:
		case 18954:
		case 18956:
		case 18960:
		case 18955:
		case 18959:
		case 18957:
		case 18958:
		case 18929:
		case 18946:
		case 18944:
		case 18934:
		case 18935:
		case 18936:
		case 18933:
		case 18931:
		case 18932:
		case 18945:
		case 18937:
		case 18939:
		case 18943:
		case 18938:
		case 18942:
		case 18940:
		case 18941:
		case 18961:
		case 18895:
		case 18893:
		case 18849:
		case 18850:
		case 18851:
		case 18848:
		case 18846:
		case 18847:
		case 18845:
		case 18852:
		case 18854:
		case 18858:
		case 18853:
		case 18857:
		case 18855:
		case 18856:
		case 18859:
		case 18844:
		case 18842:
		case 18832:
		case 18833:
		case 18834:
		case 18831:
		case 18829:
		case 18830:
		case 18843:
		case 18835:
		case 18837:
		case 18841:
		case 18836:
		case 18840:
		case 18838:
		case 18839:
		case 18894:
		case 18860:
		case 18862:
		case 18883:
		case 18884:
		case 18885:
		case 18882:
		case 18880:
		case 18881:
		case 18879:
		case 18886:
		case 18888:
		case 18892:
		case 18887:
		case 18891:
		case 18889:
		case 18890:
		case 18861:
		case 18878:
		case 18876:
		case 18866:
		case 18867:
		case 18868:
		case 18865:
		case 18863:
		case 18864:
		case 18877:
		case 18869:
		case 18871:
		case 18875:
		case 18870:
		case 18874:
		case 18872:
		case 18873:
		case 19098:
		case 18962:
		case 18964:
		case 19053:
		case 19054:
		case 19055:
		case 19052:
		case 19050:
		case 19051:
		case 19049:
		case 19056:
		case 19058:
		case 19062:
		case 19057:
		case 19061:
		case 19059:
		case 19060:
		case 19063:
		case 19048:
		case 19046:
		case 19036:
		case 19037:
		case 19038:
		case 19035:
		case 19033:
		case 19034:
		case 19047:
		case 19039:
		case 19041:
		case 19045:
		case 19040:
		case 19044:
		case 19042:
		case 19043:
		case 19032:
		case 19064:
		case 19066:
		case 19087:
		case 19088:
		case 19089:
		case 19086:
		case 19084:
		case 19085:
		case 19083:
		case 19090:
		case 19092:
		case 19096:
		case 19091:
		case 19095:
		case 19093:
		case 19094:
		case 19065:
		case 19082:
		case 19080:
		case 19070:
		case 19071:
		case 19072:
		case 19069:
		case 19067:
		case 19068:
		case 19081:
		case 19073:
		case 19075:
		case 19079:
		case 19074:
		case 19078:
		case 19076:
		case 19077:
		case 18963:
		case 19031:
		case 19029:
		case 18985:
		case 18986:
		case 18987:
		case 18984:
		case 18982:
		case 18983:
		case 18981:
		case 18988:
		case 18990:
		case 18994:
		case 18989:
		case 18993:
		case 18991:
		case 18992:
		case 18995:
		case 18980:
		case 18978:
		case 18968:
		case 18969:
		case 18970:
		case 18967:
		case 18965:
		case 18966:
		case 18979:
		case 18971:
		case 18973:
		case 18977:
		case 18972:
		case 18976:
		case 18974:
		case 18975:
		case 19030:
		case 18996:
		case 18998:
		case 19019:
		case 19020:
		case 19021:
		case 19018:
		case 19016:
		case 19017:
		case 19015:
		case 19022:
		case 19024:
		case 19028:
		case 19023:
		case 19027:
		case 19025:
		case 19026:
		case 18997:
		case 19014:
		case 19012:
		case 19002:
		case 19003:
		case 19004:
		case 19001:
		case 18999:
		case 19000:
		case 19013:
		case 19005:
		case 19007:
		case 19011:
		case 19006:
		case 19010:
		case 19008:
		case 19009:
		case 19914:
		case 19370:
		case 19372:
		case 19733:
		case 19734:
		case 19735:
		case 19732:
		case 19730:
		case 19731:
		case 19729:
		case 19736:
		case 19738:
		case 19742:
		case 19737:
		case 19741:
		case 19739:
		case 19740:
		case 19743:
		case 19728:
		case 19726:
		case 19716:
		case 19717:
		case 19718:
		case 19715:
		case 19713:
		case 19714:
		case 19727:
		case 19719:
		case 19721:
		case 19725:
		case 19720:
		case 19724:
		case 19722:
		case 19723:
		case 19712:
		case 19744:
		case 19746:
		case 19767:
		case 19768:
		case 19769:
		case 19766:
		case 19764:
		case 19765:
		case 19763:
		case 19770:
		case 19772:
		case 19776:
		case 19771:
		case 19775:
		case 19773:
		case 19774:
		case 19745:
		case 19762:
		case 19760:
		case 19750:
		case 19751:
		case 19752:
		case 19749:
		case 19747:
		case 19748:
		case 19761:
		case 19753:
		case 19755:
		case 19759:
		case 19754:
		case 19758:
		case 19756:
		case 19757:
		case 19777:
		case 19711:
		case 19709:
		case 19665:
		case 19666:
		case 19667:
		case 19664:
		case 19662:
		case 19663:
		case 19661:
		case 19668:
		case 19670:
		case 19674:
		case 19669:
		case 19673:
		case 19671:
		case 19672:
		case 19675:
		case 19660:
		case 19658:
		case 19648:
		case 19649:
		case 19650:
		case 19647:
		case 19645:
		case 19646:
		case 19659:
		case 19651:
		case 19653:
		case 19657:
		case 19652:
		case 19656:
		case 19654:
		case 19655:
		case 19710:
		case 19676:
		case 19678:
		case 19699:
		case 19700:
		case 19701:
		case 19698:
		case 19696:
		case 19697:
		case 19695:
		case 19702:
		case 19704:
		case 19708:
		case 19703:
		case 19707:
		case 19705:
		case 19706:
		case 19677:
		case 19694:
		case 19692:
		case 19682:
		case 19683:
		case 19684:
		case 19681:
		case 19679:
		case 19680:
		case 19693:
		case 19685:
		case 19687:
		case 19691:
		case 19686:
		case 19690:
		case 19688:
		case 19689:
		case 19644:
		case 19778:
		case 19780:
		case 19869:
		case 19870:
		case 19871:
		case 19868:
		case 19866:
		case 19867:
		case 19865:
		case 19872:
		case 19874:
		case 19878:
		case 19873:
		case 19877:
		case 19875:
		case 19876:
		case 19879:
		case 19864:
		case 19862:
		case 19852:
		case 19853:
		case 19854:
		case 19851:
		case 19849:
		case 19850:
		case 19863:
		case 19855:
		case 19857:
		case 19861:
		case 19856:
		case 19860:
		case 19858:
		case 19859:
		case 19848:
		case 19880:
		case 19882:
		case 19903:
		case 19904:
		case 19905:
		case 19902:
		case 19900:
		case 19901:
		case 19899:
		case 19906:
		case 19908:
		case 19912:
		case 19907:
		case 19911:
		case 19909:
		case 19910:
		case 19881:
		case 19898:
		case 19896:
		case 19886:
		case 19887:
		case 19888:
		case 19885:
		case 19883:
		case 19884:
		case 19897:
		case 19889:
		case 19891:
		case 19895:
		case 19890:
		case 19894:
		case 19892:
		case 19893:
		case 19779:
		case 19847:
		case 19845:
		case 19801:
		case 19802:
		case 19803:
		case 19800:
		case 19798:
		case 19799:
		case 19797:
		case 19804:
		case 19806:
		case 19810:
		case 19805:
		case 19809:
		case 19807:
		case 19808:
		case 19811:
		case 19796:
		case 19794:
		case 19784:
		case 19785:
		case 19786:
		case 19783:
		case 19781:
		case 19782:
		case 19795:
		case 19787:
		case 19789:
		case 19793:
		case 19788:
		case 19792:
		case 19790:
		case 19791:
		case 19846:
		case 19812:
		case 19814:
		case 19835:
		case 19836:
		case 19837:
		case 19834:
		case 19832:
		case 19833:
		case 19831:
		case 19838:
		case 19840:
		case 19844:
		case 19839:
		case 19843:
		case 19841:
		case 19842:
		case 19813:
		case 19830:
		case 19828:
		case 19818:
		case 19819:
		case 19820:
		case 19817:
		case 19815:
		case 19816:
		case 19829:
		case 19821:
		case 19823:
		case 19827:
		case 19822:
		case 19826:
		case 19824:
		case 19825:
		case 19371:
		case 19643:
		case 19641:
		case 19461:
		case 19462:
		case 19463:
		case 19460:
		case 19458:
		case 19459:
		case 19457:
		case 19464:
		case 19466:
		case 19470:
		case 19465:
		case 19469:
		case 19467:
		case 19468:
		case 19471:
		case 19456:
		case 19454:
		case 19444:
		case 19445:
		case 19446:
		case 19443:
		case 19441:
		case 19442:
		case 19455:
		case 19447:
		case 19449:
		case 19453:
		case 19448:
		case 19452:
		case 19450:
		case 19451:
		case 19440:
		case 19472:
		case 19474:
		case 19495:
		case 19496:
		case 19497:
		case 19494:
		case 19492:
		case 19493:
		case 19491:
		case 19498:
		case 19500:
		case 19504:
		case 19499:
		case 19503:
		case 19501:
		case 19502:
		case 19473:
		case 19490:
		case 19488:
		case 19478:
		case 19479:
		case 19480:
		case 19477:
		case 19475:
		case 19476:
		case 19489:
		case 19481:
		case 19483:
		case 19487:
		case 19482:
		case 19486:
		case 19484:
		case 19485:
		case 19505:
		case 19439:
		case 19437:
		case 19393:
		case 19394:
		case 19395:
		case 19392:
		case 19390:
		case 19391:
		case 19389:
		case 19396:
		case 19398:
		case 19402:
		case 19397:
		case 19401:
		case 19399:
		case 19400:
		case 19403:
		case 19388:
		case 19386:
		case 19376:
		case 19377:
		case 19378:
		case 19375:
		case 19373:
		case 19374:
		case 19387:
		case 19379:
		case 19381:
		case 19385:
		case 19380:
		case 19384:
		case 19382:
		case 19383:
		case 19438:
		case 19404:
		case 19406:
		case 19427:
		case 19428:
		case 19429:
		case 19426:
		case 19424:
		case 19425:
		case 19423:
		case 19430:
		case 19432:
		case 19436:
		case 19431:
		case 19435:
		case 19433:
		case 19434:
		case 19405:
		case 19422:
		case 19420:
		case 19410:
		case 19411:
		case 19412:
		case 19409:
		case 19407:
		case 19408:
		case 19421:
		case 19413:
		case 19415:
		case 19419:
		case 19414:
		case 19418:
		case 19416:
		case 19417:
		case 19642:
		case 19506:
		case 19508:
		case 19597:
		case 19598:
		case 19599:
		case 19596:
		case 19594:
		case 19595:
		case 19593:
		case 19600:
		case 19602:
		case 19606:
		case 19601:
		case 19605:
		case 19603:
		case 19604:
		case 19607:
		case 19592:
		case 19590:
		case 19580:
		case 19581:
		case 19582:
		case 19579:
		case 19577:
		case 19578:
		case 19591:
		case 19583:
		case 19585:
		case 19589:
		case 19584:
		case 19588:
		case 19586:
		case 19587:
		case 19576:
		case 19608:
		case 19610:
		case 19631:
		case 19632:
		case 19633:
		case 19630:
		case 19628:
		case 19629:
		case 19627:
		case 19634:
		case 19636:
		case 19640:
		case 19635:
		case 19639:
		case 19637:
		case 19638:
		case 19609:
		case 19626:
		case 19624:
		case 19614:
		case 19615:
		case 19616:
		case 19613:
		case 19611:
		case 19612:
		case 19625:
		case 19617:
		case 19619:
		case 19623:
		case 19618:
		case 19622:
		case 19620:
		case 19621:
		case 19507:
		case 19575:
		case 19573:
		case 19529:
		case 19530:
		case 19531:
		case 19528:
		case 19526:
		case 19527:
		case 19525:
		case 19532:
		case 19534:
		case 19538:
		case 19533:
		case 19537:
		case 19535:
		case 19536:
		case 19539:
		case 19524:
		case 19522:
		case 19512:
		case 19513:
		case 19514:
		case 19511:
		case 19509:
		case 19510:
		case 19523:
		case 19515:
		case 19517:
		case 19521:
		case 19516:
		case 19520:
		case 19518:
		case 19519:
		case 19574:
		case 19540:
		case 19542:
		case 19563:
		case 19564:
		case 19565:
		case 19562:
		case 19560:
		case 19561:
		case 19559:
		case 19566:
		case 19568:
		case 19572:
		case 19567:
		case 19571:
		case 19569:
		case 19570:
		case 19541:
		case 19558:
		case 19556:
		case 19546:
		case 19547:
		case 19548:
		case 19545:
		case 19543:
		case 19544:
		case 19557:
		case 19549:
		case 19551:
		case 19555:
		case 19550:
		case 19554:
		case 19552:
		case 19553:
		case 16650:
		case 15000:
		case 16648:
		case 13748:
		case 13749:
		case 13750:
		case 13747:
		case 13745:
		case 13746:
		case 13744:
		case 13751:
		case 13753:
		case 13757:
		case 13752:
		case 13756:
		case 13754:
		case 13755:
		case 13758:
		case 13743:
		case 13741:
		case 13731:
		case 13732:
		case 13733:
		case 13730:
		case 13728:
		case 13729:
		case 13742:
		case 13734:
		case 13736:
		case 13740:
		case 13735:
		case 13739:
		case 13737:
		case 13738:
		case 13727:
		case 13759:
		case 13761:
		case 13782:
		case 13783:
		case 13784:
		case 13781:
		case 13779:
		case 13780:
		case 13778:
		case 13785:
		case 13787:
		case 13791:
		case 13786:
		case 13790:
		case 13788:
		case 13789:
		case 13760:
		case 13777:
		case 13775:
		case 13765:
		case 13766:
		case 13767:
		case 13764:
		case 13762:
		case 13763:
		case 13776:
		case 13768:
		case 13770:
		case 13774:
		case 13769:
		case 13773:
		case 13771:
		case 13772:
		case 13792:
		case 13726:
		case 13724:
		case 13680:
		case 13681:
		case 13682:
		case 13679:
		case 13677:
		case 13678:
		case 13676:
		case 13683:
		case 13685:
		case 13689:
		case 13684:
		case 13688:
		case 13686:
		case 13687:
		case 13690:
		case 13675:
		case 13673:
		case 13663:
		case 13664:
		case 13665:
		case 13662:
		case 13660:
		case 13661:
		case 13674:
		case 13666:
		case 13668:
		case 13672:
		case 13667:
		case 13671:
		case 13669:
		case 13670:
		case 13725:
		case 13691:
		case 13693:
		case 13714:
		case 13715:
		case 13716:
		case 13713:
		case 13711:
		case 13712:
		case 13710:
		case 13717:
		case 13719:
		case 13723:
		case 13718:
		case 13722:
		case 13720:
		case 13721:
		case 13692:
		case 13709:
		case 13707:
		case 13697:
		case 13698:
		case 13699:
		case 13696:
		case 13694:
		case 13695:
		case 13708:
		case 13700:
		case 13702:
		case 13706:
		case 13701:
		case 13705:
		case 13703:
		case 13704:
		case 13659:
		case 13793:
		case 13795:
		case 13884:
		case 13885:
		case 13886:
		case 13883:
		case 13881:
		case 13882:
		case 13880:
		case 13887:
		case 13889:
		case 13893:
		case 13888:
		case 13892:
		case 13890:
		case 13891:
		case 13894:
		case 13879:
		case 13877:
		case 13867:
		case 13868:
		case 13869:
		case 13866:
		case 13864:
		case 13865:
		case 13878:
		case 13870:
		case 13872:
		case 13876:
		case 13871:
		case 13875:
		case 13873:
		case 13874:
		case 13863:
		case 13895:
		case 13897:
		case 13918:
		case 13919:
		case 13920:
		case 13917:
		case 13915:
		case 13916:
		case 13914:
		case 13921:
		case 13923:
		case 13927:
		case 13922:
		case 13926:
		case 13924:
		case 13925:
		case 13896:
		case 13913:
		case 13911:
		case 13901:
		case 13902:
		case 13903:
		case 13900:
		case 13898:
		case 13899:
		case 13912:
		case 13904:
		case 13906:
		case 13910:
		case 13905:
		case 13909:
		case 13907:
		case 13908:
		case 13794:
		case 13862:
		case 13860:
		case 13816:
		case 13817:
		case 13818:
		case 13815:
		case 13813:
		case 13814:
		case 13812:
		case 13819:
		case 13821:
		case 13825:
		case 13820:
		case 13824:
		case 13822:
		case 13823:
		case 13826:
		case 13811:
		case 13809:
		case 13799:
		case 13800:
		case 13801:
		case 13798:
		case 13796:
		case 13797:
		case 13810:
		case 13802:
		case 13804:
		case 13808:
		case 13803:
		case 13807:
		case 13805:
		case 13806:
		case 13861:
		case 13827:
		case 13829:
		case 13850:
		case 13851:
		case 13852:
		case 13849:
		case 13847:
		case 13848:
		case 13846:
		case 13853:
		case 13855:
		case 13859:
		case 13854:
		case 13858:
		case 13856:
		case 13857:
		case 13828:
		case 13845:
		case 13843:
		case 13833:
		case 13834:
		case 13835:
		case 13832:
		case 13830:
		case 13831:
		case 13844:
		case 13836:
		case 13838:
		case 13842:
		case 13837:
		case 13841:
		case 13839:
		case 13840:
		case 13928:
		case 13658:
		case 13656:
		case 13476:
		case 13477:
		case 13478:
		case 13475:
		case 13473:
		case 13474:
		case 13472:
		case 13479:
		case 13481:
		case 13485:
		case 13480:
		case 13484:
		case 13482:
		case 13483:
		case 13486:
		case 13471:
		case 13469:
		case 13459:
		case 13460:
		case 13461:
		case 13458:
		case 13456:
		case 13457:
		case 13470:
		case 13462:
		case 13464:
		case 13468:
		case 13463:
		case 13467:
		case 13465:
		case 13466:
		case 13455:
		case 13487:
		case 13489:
		case 13510:
		case 13511:
		case 13512:
		case 13509:
		case 13507:
		case 13508:
		case 13506:
		case 13513:
		case 13515:
		case 13519:
		case 13514:
		case 13518:
		case 13516:
		case 13517:
		case 13488:
		case 13505:
		case 13503:
		case 13493:
		case 13494:
		case 13495:
		case 13492:
		case 13490:
		case 13491:
		case 13504:
		case 13496:
		case 13498:
		case 13502:
		case 13497:
		case 13501:
		case 13499:
		case 13500:
		case 13520:
		case 13454:
		case 13452:
		case 13408:
		case 13409:
		case 13410:
		case 13407:
		case 13405:
		case 13406:
		case 13404:
		case 13411:
		case 13413:
		case 13417:
		case 13412:
		case 13416:
		case 13414:
		case 13415:
		case 13418:
		case 13403:
		case 13401:
		case 13391:
		case 13392:
		case 13393:
		case 13390:
		case 13388:
		case 13389:
		case 13402:
		case 13394:
		case 13396:
		case 13400:
		case 13395:
		case 13399:
		case 13397:
		case 13398:
		case 13453:
		case 13419:
		case 13421:
		case 13442:
		case 13443:
		case 13444:
		case 13441:
		case 13439:
		case 13440:
		case 13438:
		case 13445:
		case 13447:
		case 13451:
		case 13446:
		case 13450:
		case 13448:
		case 13449:
		case 13420:
		case 13437:
		case 13435:
		case 13425:
		case 13426:
		case 13427:
		case 13424:
		case 13422:
		case 13423:
		case 13436:
		case 13428:
		case 13430:
		case 13434:
		case 13429:
		case 13433:
		case 13431:
		case 13432:
		case 13657:
		case 13521:
		case 13523:
		case 13612:
		case 13613:
		case 13614:
		case 13611:
		case 13609:
		case 13610:
		case 13608:
		case 13615:
		case 13617:
		case 13621:
		case 13616:
		case 13620:
		case 13618:
		case 13619:
		case 13622:
		case 13607:
		case 13605:
		case 13595:
		case 13596:
		case 13597:
		case 13594:
		case 13592:
		case 13593:
		case 13606:
		case 13598:
		case 13600:
		case 13604:
		case 13599:
		case 13603:
		case 13601:
		case 13602:
		case 13591:
		case 13623:
		case 13625:
		case 13646:
		case 13647:
		case 13648:
		case 13645:
		case 13643:
		case 13644:
		case 13642:
		case 13649:
		case 13651:
		case 13655:
		case 13650:
		case 13654:
		case 13652:
		case 13653:
		case 13624:
		case 13641:
		case 13639:
		case 13629:
		case 13630:
		case 13631:
		case 13628:
		case 13626:
		case 13627:
		case 13640:
		case 13632:
		case 13634:
		case 13638:
		case 13633:
		case 13637:
		case 13635:
		case 13636:
		case 13522:
		case 13590:
		case 13588:
		case 13544:
		case 13545:
		case 13546:
		case 13543:
		case 13541:
		case 13542:
		case 13540:
		case 13547:
		case 13549:
		case 13553:
		case 13548:
		case 13552:
		case 13550:
		case 13551:
		case 13554:
		case 13539:
		case 13537:
		case 13527:
		case 13528:
		case 13529:
		case 13526:
		case 13524:
		case 13525:
		case 13538:
		case 13530:
		case 13532:
		case 13536:
		case 13531:
		case 13535:
		case 13533:
		case 13534:
		case 13589:
		case 13555:
		case 13557:
		case 13578:
		case 13579:
		case 13580:
		case 13577:
		case 13575:
		case 13576:
		case 13574:
		case 13581:
		case 13583:
		case 13587:
		case 13582:
		case 13586:
		case 13584:
		case 13585:
		case 13556:
		case 13573:
		case 13571:
		case 13561:
		case 13562:
		case 13563:
		case 13560:
		case 13558:
		case 13559:
		case 13572:
		case 13564:
		case 13566:
		case 13570:
		case 13565:
		case 13569:
		case 13567:
		case 13568:
		case 13386:
		case 13929:
		case 13931:
		case 14292:
		case 14293:
		case 14294:
		case 14291:
		case 14289:
		case 14290:
		case 14288:
		case 14295:
		case 14297:
		case 14301:
		case 14296:
		case 14300:
		case 14298:
		case 14299:
		case 14302:
		case 14287:
		case 14285:
		case 14275:
		case 14276:
		case 14277:
		case 14274:
		case 14272:
		case 14273:
		case 14286:
		case 14278:
		case 14280:
		case 14284:
		case 14279:
		case 14283:
		case 14281:
		case 14282:
		case 14271:
		case 14303:
		case 14305:
		case 14326:
		case 14327:
		case 14328:
		case 14325:
		case 14323:
		case 14324:
		case 14322:
		case 14329:
		case 14331:
		case 14335:
		case 14330:
		case 14334:
		case 14332:
		case 14333:
		case 14304:
		case 14321:
		case 14319:
		case 14309:
		case 14310:
		case 14311:
		case 14308:
		case 14306:
		case 14307:
		case 14320:
		case 14312:
		case 14314:
		case 14318:
		case 14313:
		case 14317:
		case 14315:
		case 14316:
		case 14336:
		case 14270:
		case 14268:
		case 14224:
		case 14225:
		case 14226:
		case 14223:
		case 14221:
		case 14222:
		case 14220:
		case 14227:
		case 14229:
		case 14233:
		case 14228:
		case 14232:
		case 14230:
		case 14231:
		case 14234:
		case 14219:
		case 14217:
		case 14207:
		case 14208:
		case 14209:
		case 14206:
		case 14204:
		case 14205:
		case 14218:
		case 14210:
		case 14212:
		case 14216:
		case 14211:
		case 14215:
		case 14213:
		case 14214:
		case 14269:
		case 14235:
		case 14237:
		case 14258:
		case 14259:
		case 14260:
		case 14257:
		case 14255:
		case 14256:
		case 14254:
		case 14261:
		case 14263:
		case 14267:
		case 14262:
		case 14266:
		case 14264:
		case 14265:
		case 14236:
		case 14253:
		case 14251:
		case 14241:
		case 14242:
		case 14243:
		case 14240:
		case 14238:
		case 14239:
		case 14252:
		case 14244:
		case 14246:
		case 14250:
		case 14245:
		case 14249:
		case 14247:
		case 14248:
		case 14203:
		case 14337:
		case 14339:
		case 14428:
		case 14429:
		case 14430:
		case 14427:
		case 14425:
		case 14426:
		case 14424:
		case 14431:
		case 14433:
		case 14437:
		case 14432:
		case 14436:
		case 14434:
		case 14435:
		case 14438:
		case 14423:
		case 14421:
		case 14411:
		case 14412:
		case 14413:
		case 14410:
		case 14408:
		case 14409:
		case 14422:
		case 14414:
		case 14416:
		case 14420:
		case 14415:
		case 14419:
		case 14417:
		case 14418:
		case 14407:
		case 14439:
		case 14441:
		case 14462:
		case 14463:
		case 14464:
		case 14461:
		case 14459:
		case 14460:
		case 14458:
		case 14465:
		case 14467:
		case 14471:
		case 14466:
		case 14470:
		case 14468:
		case 14469:
		case 14440:
		case 14457:
		case 14455:
		case 14445:
		case 14446:
		case 14447:
		case 14444:
		case 14442:
		case 14443:
		case 14456:
		case 14448:
		case 14450:
		case 14454:
		case 14449:
		case 14453:
		case 14451:
		case 14452:
		case 14338:
		case 14406:
		case 14404:
		case 14360:
		case 14361:
		case 14362:
		case 14359:
		case 14357:
		case 14358:
		case 14356:
		case 14363:
		case 14365:
		case 14369:
		case 14364:
		case 14368:
		case 14366:
		case 14367:
		case 14370:
		case 14355:
		case 14353:
		case 14343:
		case 14344:
		case 14345:
		case 14342:
		case 14340:
		case 14341:
		case 14354:
		case 14346:
		case 14348:
		case 14352:
		case 14347:
		case 14351:
		case 14349:
		case 14350:
		case 14405:
		case 14371:
		case 14373:
		case 14394:
		case 14395:
		case 14396:
		case 14393:
		case 14391:
		case 14392:
		case 14390:
		case 14397:
		case 14399:
		case 14403:
		case 14398:
		case 14402:
		case 14400:
		case 14401:
		case 14372:
		case 14389:
		case 14387:
		case 14377:
		case 14378:
		case 14379:
		case 14376:
		case 14374:
		case 14375:
		case 14388:
		case 14380:
		case 14382:
		case 14386:
		case 14381:
		case 14385:
		case 14383:
		case 14384:
		case 13930:
		case 14202:
		case 14200:
		case 14020:
		case 14021:
		case 14022:
		case 14019:
		case 14017:
		case 14018:
		case 14016:
		case 14023:
		case 14025:
		case 14029:
		case 14024:
		case 14028:
		case 14026:
		case 14027:
		case 14030:
		case 14015:
		case 14013:
		case 14003:
		case 14004:
		case 14005:
		case 14002:
		case 14000:
		case 14001:
		case 14014:
		case 14006:
		case 14008:
		case 14012:
		case 14007:
		case 14011:
		case 14009:
		case 14010:
		case 13999:
		case 14031:
		case 14033:
		case 14054:
		case 14055:
		case 14056:
		case 14053:
		case 14051:
		case 14052:
		case 14050:
		case 14057:
		case 14059:
		case 14063:
		case 14058:
		case 14062:
		case 14060:
		case 14061:
		case 14032:
		case 14049:
		case 14047:
		case 14037:
		case 14038:
		case 14039:
		case 14036:
		case 14034:
		case 14035:
		case 14048:
		case 14040:
		case 14042:
		case 14046:
		case 14041:
		case 14045:
		case 14043:
		case 14044:
		case 14064:
		case 13998:
		case 13996:
		case 13952:
		case 13953:
		case 13954:
		case 13951:
		case 13949:
		case 13950:
		case 13948:
		case 13955:
		case 13957:
		case 13961:
		case 13956:
		case 13960:
		case 13958:
		case 13959:
		case 13962:
		case 13947:
		case 13945:
		case 13935:
		case 13936:
		case 13937:
		case 13934:
		case 13932:
		case 13933:
		case 13946:
		case 13938:
		case 13940:
		case 13944:
		case 13939:
		case 13943:
		case 13941:
		case 13942:
		case 13997:
		case 13963:
		case 13965:
		case 13986:
		case 13987:
		case 13988:
		case 13985:
		case 13983:
		case 13984:
		case 13982:
		case 13989:
		case 13991:
		case 13995:
		case 13990:
		case 13994:
		case 13992:
		case 13993:
		case 13964:
		case 13981:
		case 13979:
		case 13969:
		case 13970:
		case 13971:
		case 13968:
		case 13966:
		case 13967:
		case 13980:
		case 13972:
		case 13974:
		case 13978:
		case 13973:
		case 13977:
		case 13975:
		case 13976:
		case 14201:
		case 14065:
		case 14067:
		case 14156:
		case 14157:
		case 14158:
		case 14155:
		case 14153:
		case 14154:
		case 14152:
		case 14159:
		case 14161:
		case 14165:
		case 14160:
		case 14164:
		case 14162:
		case 14163:
		case 14166:
		case 14151:
		case 14149:
		case 14139:
		case 14140:
		case 14141:
		case 14138:
		case 14136:
		case 14137:
		case 14150:
		case 14142:
		case 14144:
		case 14148:
		case 14143:
		case 14147:
		case 14145:
		case 14146:
		case 14135:
		case 14167:
		case 14169:
		case 14190:
		case 14191:
		case 14192:
		case 14189:
		case 14187:
		case 14188:
		case 14186:
		case 14193:
		case 14195:
		case 14199:
		case 14194:
		case 14198:
		case 14196:
		case 14197:
		case 14168:
		case 14185:
		case 14183:
		case 14173:
		case 14174:
		case 14175:
		case 14172:
		case 14170:
		case 14171:
		case 14184:
		case 14176:
		case 14178:
		case 14182:
		case 14177:
		case 14181:
		case 14179:
		case 14180:
		case 14066:
		case 14134:
		case 14132:
		case 14088:
		case 14089:
		case 14090:
		case 14087:
		case 14085:
		case 14086:
		case 14084:
		case 14091:
		case 14093:
		case 14097:
		case 14092:
		case 14096:
		case 14094:
		case 14095:
		case 14098:
		case 14083:
		case 14081:
		case 14071:
		case 14072:
		case 14073:
		case 14070:
		case 14068:
		case 14069:
		case 14082:
		case 14074:
		case 14076:
		case 14080:
		case 14075:
		case 14079:
		case 14077:
		case 14078:
		case 14133:
		case 14099:
		case 14101:
		case 14122:
		case 14123:
		case 14124:
		case 14121:
		case 14119:
		case 14120:
		case 14118:
		case 14125:
		case 14127:
		case 14131:
		case 14126:
		case 14130:
		case 14128:
		case 14129:
		case 14100:
		case 14117:
		case 14115:
		case 14105:
		case 14106:
		case 14107:
		case 14104:
		case 14102:
		case 14103:
		case 14116:
		case 14108:
		case 14110:
		case 14114:
		case 14109:
		case 14113:
		case 14111:
		case 14112:
		case 14472:
		case 13385:
		case 13383:
		case 12659:
		case 12660:
		case 12661:
		case 12658:
		case 12656:
		case 12657:
		case 12655:
		case 12662:
		case 12664:
		case 12668:
		case 12663:
		case 12667:
		case 12665:
		case 12666:
		case 12669:
		case 12654:
		case 12652:
		case 12642:
		case 12643:
		case 12644:
		case 12641:
		case 12639:
		case 12640:
		case 12653:
		case 12645:
		case 12647:
		case 12651:
		case 12646:
		case 12650:
		case 12648:
		case 12649:
		case 12638:
		case 12670:
		case 12672:
		case 12693:
		case 12694:
		case 12695:
		case 12692:
		case 12690:
		case 12691:
		case 12689:
		case 12696:
		case 12698:
		case 12702:
		case 12697:
		case 12701:
		case 12699:
		case 12700:
		case 12671:
		case 12688:
		case 12686:
		case 12676:
		case 12677:
		case 12678:
		case 12675:
		case 12673:
		case 12674:
		case 12687:
		case 12679:
		case 12681:
		case 12685:
		case 12680:
		case 12684:
		case 12682:
		case 12683:
		case 12703:
		case 12637:
		case 12635:
		case 12591:
		case 12592:
		case 12593:
		case 12590:
		case 12588:
		case 12589:
		case 12587:
		case 12594:
		case 12596:
		case 12600:
		case 12595:
		case 12599:
		case 12597:
		case 12598:
		case 12601:
		case 12586:
		case 12584:
		case 12574:
		case 12575:
		case 12576:
		case 12573:
		case 12571:
		case 12572:
		case 12585:
		case 12577:
		case 12579:
		case 12583:
		case 12578:
		case 12582:
		case 12580:
		case 12581:
		case 12636:
		case 12602:
		case 12604:
		case 12625:
		case 12626:
		case 12627:
		case 12624:
		case 12622:
		case 12623:
		case 12621:
		case 12628:
		case 12630:
		case 12634:
		case 12629:
		case 12633:
		case 12631:
		case 12632:
		case 12603:
		case 12620:
		case 12618:
		case 12608:
		case 12609:
		case 12610:
		case 12607:
		case 12605:
		case 12606:
		case 12619:
		case 12611:
		case 12613:
		case 12617:
		case 12612:
		case 12616:
		case 12614:
		case 12615:
		case 12570:
		case 12704:
		case 12706:
		case 12795:
		case 12796:
		case 12797:
		case 12794:
		case 12792:
		case 12793:
		case 12791:
		case 12798:
		case 12800:
		case 12804:
		case 12799:
		case 12803:
		case 12801:
		case 12802:
		case 12805:
		case 12790:
		case 12788:
		case 12778:
		case 12779:
		case 12780:
		case 12777:
		case 12775:
		case 12776:
		case 12789:
		case 12781:
		case 12783:
		case 12787:
		case 12782:
		case 12786:
		case 12784:
		case 12785:
		case 12774:
		case 12806:
		case 12808:
		case 12829:
		case 12830:
		case 12831:
		case 12828:
		case 12826:
		case 12827:
		case 12825:
		case 12832:
		case 12834:
		case 12838:
		case 12833:
		case 12837:
		case 12835:
		case 12836:
		case 12807:
		case 12824:
		case 12822:
		case 12812:
		case 12813:
		case 12814:
		case 12811:
		case 12809:
		case 12810:
		case 12823:
		case 12815:
		case 12817:
		case 12821:
		case 12816:
		case 12820:
		case 12818:
		case 12819:
		case 12705:
		case 12773:
		case 12771:
		case 12727:
		case 12728:
		case 12729:
		case 12726:
		case 12724:
		case 12725:
		case 12723:
		case 12730:
		case 12732:
		case 12736:
		case 12731:
		case 12735:
		case 12733:
		case 12734:
		case 12737:
		case 12722:
		case 12720:
		case 12710:
		case 12711:
		case 12712:
		case 12709:
		case 12707:
		case 12708:
		case 12721:
		case 12713:
		case 12715:
		case 12719:
		case 12714:
		case 12718:
		case 12716:
		case 12717:
		case 12772:
		case 12738:
		case 12740:
		case 12761:
		case 12762:
		case 12763:
		case 12760:
		case 12758:
		case 12759:
		case 12757:
		case 12764:
		case 12766:
		case 12770:
		case 12765:
		case 12769:
		case 12767:
		case 12768:
		case 12739:
		case 12756:
		case 12754:
		case 12744:
		case 12745:
		case 12746:
		case 12743:
		case 12741:
		case 12742:
		case 12755:
		case 12747:
		case 12749:
		case 12753:
		case 12748:
		case 12752:
		case 12750:
		case 12751:
		case 12839:
		case 12569:
		case 12567:
		case 12387:
		case 12388:
		case 12389:
		case 12386:
		case 12384:
		case 12385:
		case 12383:
		case 12390:
		case 12392:
		case 12396:
		case 12391:
		case 12395:
		case 12393:
		case 12394:
		case 12397:
		case 12382:
		case 12380:
		case 12370:
		case 12371:
		case 12372:
		case 12369:
		case 12367:
		case 12368:
		case 12381:
		case 12373:
		case 12375:
		case 12379:
		case 12374:
		case 12378:
		case 12376:
		case 12377:
		case 12366:
		case 12398:
		case 12400:
		case 12421:
		case 12422:
		case 12423:
		case 12420:
		case 12418:
		case 12419:
		case 12417:
		case 12424:
		case 12426:
		case 12430:
		case 12425:
		case 12429:
		case 12427:
		case 12428:
		case 12399:
		case 12416:
		case 12414:
		case 12404:
		case 12405:
		case 12406:
		case 12403:
		case 12401:
		case 12402:
		case 12415:
		case 12407:
		case 12409:
		case 12413:
		case 12408:
		case 12412:
		case 12410:
		case 12411:
		case 12431:
		case 12365:
		case 12363:
		case 12319:
		case 12320:
		case 12321:
		case 12318:
		case 12316:
		case 12317:
		case 12315:
		case 12322:
		case 12324:
		case 12328:
		case 12323:
		case 12327:
		case 12325:
		case 12326:
		case 12329:
		case 12314:
		case 12312:
		case 12302:
		case 12303:
		case 12304:
		case 12301:
		case 16649:
		case 12300:
		case 12313:
		case 12305:
		case 12307:
		case 12311:
		case 12306:
		case 12310:
		case 12308:
		case 12309:
		case 12364:
		case 12330:
		case 12332:
		case 12353:
		case 12354:
		case 12355:
		case 12352:
		case 12350:
		case 12351:
		case 12349:
		case 12356:
		case 12358:
		case 12362:
		case 12357:
		case 12361:
		case 12359:
		case 12360:
		case 12331:
		case 12348:
		case 12346:
		case 12336:
		case 12337:
		case 12338:
		case 12335:
		case 12333:
		case 12334:
		case 12347:
		case 12339:
		case 12341:
		case 12345:
		case 12340:
		case 12344:
		case 12342:
		case 12343:
		case 12568:
		case 12432:
		case 12434:
		case 12523:
		case 12524:
		case 12525:
		case 12522:
		case 12520:
		case 12521:
		case 12519:
		case 12526:
		case 12528:
		case 12532:
		case 12527:
		case 12531:
		case 12529:
		case 12530:
		case 12533:
		case 12518:
		case 12516:
		case 12506:
		case 12507:
		case 12508:
		case 12505:
		case 12503:
		case 12504:
		case 12517:
		case 12509:
		case 12511:
		case 12515:
		case 12510:
		case 12514:
		case 12512:
		case 12513:
		case 12502:
		case 12534:
		case 12536:
		case 12557:
		case 12558:
		case 12559:
		case 12556:
		case 12554:
		case 12555:
		case 12553:
		case 12560:
		case 12562:
		case 12566:
		case 12561:
		case 12565:
		case 12563:
		case 12564:
		case 12535:
		case 12552:
		case 12550:
		case 12540:
		case 12541:
		case 12542:
		case 12539:
		case 12537:
		case 12538:
		case 12551:
		case 12543:
		case 12545:
		case 12549:
		case 12544:
		case 12548:
		case 12546:
		case 12547:
		case 12433:
		case 12501:
		case 12499:
		case 12455:
		case 12456:
		case 12457:
		case 12454:
		case 12452:
		case 12453:
		case 12451:
		case 12458:
		case 12460:
		case 12464:
		case 12459:
		case 12463:
		case 12461:
		case 12462:
		case 12465:
		case 12450:
		case 12448:
		case 12438:
		case 12439:
		case 12440:
		case 12437:
		case 12435:
		case 12436:
		case 12449:
		case 12441:
		case 12443:
		case 12447:
		case 12442:
		case 12446:
		case 12444:
		case 12445:
		case 12500:
		case 12466:
		case 12468:
		case 12489:
		case 12490:
		case 12491:
		case 12488:
		case 12486:
		case 12487:
		case 12485:
		case 12492:
		case 12494:
		case 12498:
		case 12493:
		case 12497:
		case 12495:
		case 12496:
		case 12467:
		case 12484:
		case 12482:
		case 12472:
		case 12473:
		case 12474:
		case 12471:
		case 12469:
		case 12470:
		case 12483:
		case 12475:
		case 12477:
		case 12481:
		case 12476:
		case 12480:
		case 12478:
		case 12479:
		case 13384:
		case 12840:
		case 12842:
		case 13203:
		case 13204:
		case 13205:
		case 13202:
		case 13200:
		case 13201:
		case 13199:
		case 13206:
		case 13208:
		case 13212:
		case 13207:
		case 13211:
		case 13209:
		case 13210:
		case 13213:
		case 13198:
		case 13196:
		case 13186:
		case 13187:
		case 13188:
		case 13185:
		case 13183:
		case 13184:
		case 13197:
		case 13189:
		case 13191:
		case 13195:
		case 13190:
		case 13194:
		case 13192:
		case 13193:
		case 13182:
		case 13214:
		case 13216:
		case 13237:
		case 13238:
		case 13239:
		case 13236:
		case 13234:
		case 13235:
		case 13233:
		case 13240:
		case 13242:
		case 13246:
		case 13241:
		case 13245:
		case 13243:
		case 13244:
		case 13215:
		case 13232:
		case 13230:
		case 13220:
		case 13221:
		case 13222:
		case 13219:
		case 13217:
		case 13218:
		case 13231:
		case 13223:
		case 13225:
		case 13229:
		case 13224:
		case 13228:
		case 13226:
		case 13227:
		case 13247:
		case 13181:
		case 13179:
		case 13135:
		case 13136:
		case 13137:
		case 13134:
		case 13132:
		case 13133:
		case 13131:
		case 13138:
		case 13140:
		case 13144:
		case 13139:
		case 13143:
		case 13141:
		case 13142:
		case 13145:
		case 13130:
		case 13128:
		case 13118:
		case 13119:
		case 13120:
		case 13117:
		case 13115:
		case 13116:
		case 13129:
		case 13121:
		case 13123:
		case 13127:
		case 13122:
		case 13126:
		case 13124:
		case 13125:
		case 13180:
		case 13146:
		case 13148:
		case 13169:
		case 13170:
		case 13171:
		case 13168:
		case 13166:
		case 13167:
		case 13165:
		case 13172:
		case 13174:
		case 13178:
		case 13173:
		case 13177:
		case 13175:
		case 13176:
		case 13147:
		case 13164:
		case 13162:
		case 13152:
		case 13153:
		case 13154:
		case 13151:
		case 13149:
		case 13150:
		case 13163:
		case 13155:
		case 13157:
		case 13161:
		case 13156:
		case 13160:
		case 13158:
		case 13159:
		case 13114:
		case 13248:
		case 13250:
		case 13339:
		case 13340:
		case 13341:
		case 13338:
		case 13336:
		case 13337:
		case 13335:
		case 13342:
		case 13344:
		case 13348:
		case 13343:
		case 13347:
		case 13345:
		case 13346:
		case 13349:
		case 13334:
		case 13332:
		case 13322:
		case 13323:
		case 13324:
		case 13321:
		case 13319:
		case 13320:
		case 13333:
		case 13325:
		case 13327:
		case 13331:
		case 13326:
		case 13330:
		case 13328:
		case 13329:
		case 13318:
		case 13350:
		case 13352:
		case 13373:
		case 13374:
		case 13375:
		case 13372:
		case 13370:
		case 13371:
		case 13369:
		case 13376:
		case 13378:
		case 13382:
		case 13377:
		case 13381:
		case 13379:
		case 13380:
		case 13351:
		case 13368:
		case 13366:
		case 13356:
		case 13357:
		case 13358:
		case 13355:
		case 13353:
		case 13354:
		case 13367:
		case 13359:
		case 13361:
		case 13365:
		case 13360:
		case 13364:
		case 13362:
		case 13363:
		case 13249:
		case 13317:
		case 13315:
		case 13271:
		case 13272:
		case 13273:
		case 13270:
		case 13268:
		case 13269:
		case 13267:
		case 13274:
		case 13276:
		case 13280:
		case 13275:
		case 13279:
		case 13277:
		case 13278:
		case 13281:
		case 13266:
		case 13264:
		case 13254:
		case 13255:
		case 13256:
		case 13253:
		case 13251:
		case 13252:
		case 13265:
		case 13257:
		case 13259:
		case 13263:
		case 13258:
		case 13262:
		case 13260:
		case 13261:
		case 13316:
		case 13282:
		case 13284:
		case 13305:
		case 13306:
		case 13307:
		case 13304:
		case 13302:
		case 13303:
		case 13301:
		case 13308:
		case 13310:
		case 13314:
		case 13309:
		case 13313:
		case 13311:
		case 13312:
		case 13283:
		case 13300:
		case 13298:
		case 13288:
		case 13289:
		case 13290:
		case 13287:
		case 13285:
		case 13286:
		case 13299:
		case 13291:
		case 13293:
		case 13297:
		case 13292:
		case 13296:
		case 13294:
		case 13295:
		case 12841:
		case 13113:
		case 13111:
		case 12931:
		case 12932:
		case 12933:
		case 12930:
		case 12928:
		case 12929:
		case 12927:
		case 12934:
		case 12936:
		case 12940:
		case 12935:
		case 12939:
		case 12937:
		case 12938:
		case 12941:
		case 12926:
		case 12924:
		case 12914:
		case 12915:
		case 12916:
		case 12913:
		case 12911:
		case 12912:
		case 12925:
		case 12917:
		case 12919:
		case 12923:
		case 12918:
		case 12922:
		case 12920:
		case 12921:
		case 12910:
		case 12942:
		case 12944:
		case 12965:
		case 12966:
		case 12967:
		case 12964:
		case 12962:
		case 12963:
		case 12961:
		case 12968:
		case 12970:
		case 12974:
		case 12969:
		case 12973:
		case 12971:
		case 12972:
		case 12943:
		case 12960:
		case 12958:
		case 12948:
		case 12949:
		case 12950:
		case 12947:
		case 12945:
		case 12946:
		case 12959:
		case 12951:
		case 12953:
		case 12957:
		case 12952:
		case 12956:
		case 12954:
		case 12955:
		case 12975:
		case 12909:
		case 12907:
		case 12863:
		case 12864:
		case 12865:
		case 12862:
		case 12860:
		case 12861:
		case 12859:
		case 12866:
		case 12868:
		case 12872:
		case 12867:
		case 12871:
		case 12869:
		case 12870:
		case 12873:
		case 12858:
		case 12856:
		case 12846:
		case 12847:
		case 12848:
		case 12845:
		case 12843:
		case 12844:
		case 12857:
		case 12849:
		case 12851:
		case 12855:
		case 12850:
		case 12854:
		case 12852:
		case 12853:
		case 12908:
		case 12874:
		case 12876:
		case 12897:
		case 12898:
		case 12899:
		case 12896:
		case 12894:
		case 12895:
		case 12893:
		case 12900:
		case 12902:
		case 12906:
		case 12901:
		case 12905:
		case 12903:
		case 12904:
		case 12875:
		case 12892:
		case 12890:
		case 12880:
		case 12881:
		case 12882:
		case 12879:
		case 12877:
		case 12878:
		case 12891:
		case 12883:
		case 12885:
		case 12889:
		case 12884:
		case 12888:
		case 12886:
		case 12887:
		case 13112:
		case 12976:
		case 12978:
		case 13067:
		case 13068:
		case 13069:
		case 13066:
		case 13064:
		case 13065:
		case 13063:
		case 13070:
		case 13072:
		case 13076:
		case 13071:
		case 13075:
		case 13073:
		case 13074:
		case 13077:
		case 13062:
		case 13060:
		case 13050:
		case 13051:
		case 13052:
		case 13049:
		case 13047:
		case 13048:
		case 13061:
		case 13053:
		case 13055:
		case 13059:
		case 13054:
		case 13058:
		case 13056:
		case 13057:
		case 13046:
		case 13078:
		case 13080:
		case 13101:
		case 13102:
		case 13103:
		case 13100:
		case 13098:
		case 13099:
		case 13097:
		case 13104:
		case 13106:
		case 13110:
		case 13105:
		case 13109:
		case 13107:
		case 13108:
		case 13079:
		case 13096:
		case 13094:
		case 13084:
		case 13085:
		case 13086:
		case 13083:
		case 13081:
		case 13082:
		case 13095:
		case 13087:
		case 13089:
		case 13093:
		case 13088:
		case 13092:
		case 13090:
		case 13091:
		case 12977:
		case 13045:
		case 13043:
		case 12999:
		case 13000:
		case 13001:
		case 12998:
		case 12996:
		case 12997:
		case 12995:
		case 13002:
		case 13004:
		case 13008:
		case 13003:
		case 13007:
		case 13005:
		case 13006:
		case 13009:
		case 12994:
		case 12992:
		case 12982:
		case 12983:
		case 12984:
		case 12981:
		case 12979:
		case 12980:
		case 12993:
		case 12985:
		case 12987:
		case 12991:
		case 12986:
		case 12990:
		case 12988:
		case 12989:
		case 13044:
		case 13010:
		case 13012:
		case 13033:
		case 13034:
		case 13035:
		case 13032:
		case 13030:
		case 13031:
		case 13029:
		case 13036:
		case 13038:
		case 13042:
		case 13037:
		case 13041:
		case 13039:
		case 13040:
		case 13011:
		case 13028:
		case 13026:
		case 13016:
		case 13017:
		case 13018:
		case 13015:
		case 13013:
		case 13014:
		case 13027:
		case 13019:
		case 13021:
		case 13025:
		case 13020:
		case 13024:
		case 13022:
		case 13023:
		case 14473:
		case 13387:
		case 14475:
		case 15923:
		case 15924:
		case 15925:
		case 15922:
		case 15920:
		case 15921:
		case 15919:
		case 15926:
		case 15928:
		case 15932:
		case 15927:
		case 15931:
		case 15929:
		case 15930:
		case 15933:
		case 15918:
		case 15916:
		case 15906:
		case 15907:
		case 15908:
		case 15905:
		case 15903:
		case 15904:
		case 15917:
		case 15909:
		case 15911:
		case 15915:
		case 15910:
		case 15914:
		case 15912:
		case 15913:
		case 15902:
		case 15934:
		case 15936:
		case 15957:
		case 15958:
		case 15959:
		case 15956:
		case 15954:
		case 15955:
		case 15953:
		case 15960:
		case 15962:
		case 15966:
		case 15961:
		case 15965:
		case 15963:
		case 15964:
		case 15935:
		case 15952:
		case 15950:
		case 15940:
		case 15941:
		case 15942:
		case 15939:
		case 15937:
		case 15938:
		case 15951:
		case 15943:
		case 15945:
		case 15949:
		case 15944:
		case 15948:
		case 15946:
		case 15947:
		case 15967:
		case 15901:
		case 15899:
		case 15855:
		case 15856:
		case 15857:
		case 15854:
		case 15852:
		case 15853:
		case 15851:
		case 15858:
		case 15860:
		case 15864:
		case 15859:
		case 15863:
		case 15861:
		case 15862:
		case 15865:
		case 15850:
		case 15848:
		case 15838:
		case 15839:
		case 15840:
		case 15837:
		case 15835:
		case 15836:
		case 15849:
		case 15841:
		case 15843:
		case 15847:
		case 15842:
		case 15846:
		case 15844:
		case 15845:
		case 15900:
		case 15866:
		case 15868:
		case 15889:
		case 15890:
		case 15891:
		case 15888:
		case 15886:
		case 15887:
		case 15885:
		case 15892:
		case 15894:
		case 15898:
		case 15893:
		case 15897:
		case 15895:
		case 15896:
		case 15867:
		case 15884:
		case 15882:
		case 15872:
		case 15873:
		case 15874:
		case 15871:
		case 15869:
		case 15870:
		case 15883:
		case 15875:
		case 15877:
		case 15881:
		case 15876:
		case 15880:
		case 15878:
		case 15879:
		case 15834:
		case 15968:
		case 15970:
		case 16059:
		case 16060:
		case 16061:
		case 16058:
		case 16056:
		case 16057:
		case 16055:
		case 16062:
		case 16064:
		case 16068:
		case 16063:
		case 16067:
		case 16065:
		case 16066:
		case 16069:
		case 16054:
		case 16052:
		case 16042:
		case 16043:
		case 16044:
		case 16041:
		case 16039:
		case 16040:
		case 16053:
		case 16045:
		case 16047:
		case 16051:
		case 16046:
		case 16050:
		case 16048:
		case 16049:
		case 16038:
		case 16070:
		case 16072:
		case 16093:
		case 16094:
		case 16095:
		case 16092:
		case 16090:
		case 16091:
		case 16089:
		case 16096:
		case 16098:
		case 16102:
		case 16097:
		case 16101:
		case 16099:
		case 16100:
		case 16071:
		case 16088:
		case 16086:
		case 16076:
		case 16077:
		case 16078:
		case 16075:
		case 16073:
		case 16074:
		case 16087:
		case 16079:
		case 16081:
		case 16085:
		case 16080:
		case 16084:
		case 16082:
		case 16083:
		case 15969:
		case 16037:
		case 16035:
		case 15991:
		case 15992:
		case 15993:
		case 15990:
		case 15988:
		case 15989:
		case 15987:
		case 15994:
		case 15996:
		case 16000:
		case 15995:
		case 15999:
		case 15997:
		case 15998:
		case 16001:
		case 15986:
		case 15984:
		case 15974:
		case 15975:
		case 15976:
		case 15973:
		case 15971:
		case 15972:
		case 15985:
		case 15977:
		case 15979:
		case 15983:
		case 15978:
		case 15982:
		case 15980:
		case 15981:
		case 16036:
		case 16002:
		case 16004:
		case 16025:
		case 16026:
		case 16027:
		case 16024:
		case 16022:
		case 16023:
		case 16021:
		case 16028:
		case 16030:
		case 16034:
		case 16029:
		case 16033:
		case 16031:
		case 16032:
		case 16003:
		case 16020:
		case 16018:
		case 16008:
		case 16009:
		case 16010:
		case 16007:
		case 16005:
		case 16006:
		case 16019:
		case 16011:
		case 16013:
		case 16017:
		case 16012:
		case 16016:
		case 16014:
		case 16015:
		case 16104:
		case 15833:
		case 15831:
		case 15651:
		case 15652:
		case 15653:
		case 15650:
		case 15648:
		case 15649:
		case 15647:
		case 15654:
		case 15656:
		case 15660:
		case 15655:
		case 15659:
		case 15657:
		case 15658:
		case 15661:
		case 15646:
		case 15644:
		case 15634:
		case 15635:
		case 15636:
		case 15633:
		case 15631:
		case 15632:
		case 15645:
		case 15637:
		case 15639:
		case 15643:
		case 15638:
		case 15642:
		case 15640:
		case 15641:
		case 15630:
		case 15662:
		case 15664:
		case 15685:
		case 15686:
		case 15687:
		case 15684:
		case 15682:
		case 15683:
		case 15681:
		case 15688:
		case 15690:
		case 15694:
		case 15689:
		case 15693:
		case 15691:
		case 15692:
		case 15663:
		case 15680:
		case 15678:
		case 15668:
		case 15669:
		case 15670:
		case 15667:
		case 15665:
		case 15666:
		case 15679:
		case 15671:
		case 15673:
		case 15677:
		case 15672:
		case 15676:
		case 15674:
		case 15675:
		case 15695:
		case 15629:
		case 15627:
		case 15583:
		case 15584:
		case 15585:
		case 15582:
		case 15580:
		case 15581:
		case 15579:
		case 15586:
		case 15588:
		case 15592:
		case 15587:
		case 15591:
		case 15589:
		case 15590:
		case 15593:
		case 15578:
		case 15576:
		case 15566:
		case 15567:
		case 15568:
		case 15565:
		case 15563:
		case 15564:
		case 15577:
		case 15569:
		case 15571:
		case 15575:
		case 15570:
		case 15574:
		case 15572:
		case 15573:
		case 15628:
		case 15594:
		case 15596:
		case 15617:
		case 15618:
		case 15619:
		case 15616:
		case 15614:
		case 15615:
		case 15613:
		case 15620:
		case 15622:
		case 15626:
		case 15621:
		case 15625:
		case 15623:
		case 15624:
		case 15595:
		case 15612:
		case 15610:
		case 15600:
		case 15601:
		case 15602:
		case 15599:
		case 15597:
		case 15598:
		case 15611:
		case 15603:
		case 15605:
		case 15609:
		case 15604:
		case 15608:
		case 15606:
		case 15607:
		case 15832:
		case 15696:
		case 15698:
		case 15787:
		case 15788:
		case 15789:
		case 15786:
		case 15784:
		case 15785:
		case 15783:
		case 15790:
		case 15792:
		case 15796:
		case 15791:
		case 15795:
		case 15793:
		case 15794:
		case 15797:
		case 15782:
		case 15780:
		case 15770:
		case 15771:
		case 15772:
		case 15769:
		case 15767:
		case 15768:
		case 15781:
		case 15773:
		case 15775:
		case 15779:
		case 15774:
		case 15778:
		case 15776:
		case 15777:
		case 15766:
		case 15798:
		case 15800:
		case 15821:
		case 15822:
		case 15823:
		case 15820:
		case 15818:
		case 15819:
		case 15817:
		case 15824:
		case 15826:
		case 15830:
		case 15825:
		case 15829:
		case 15827:
		case 15828:
		case 15799:
		case 15816:
		case 15814:
		case 15804:
		case 15805:
		case 15806:
		case 15803:
		case 15801:
		case 15802:
		case 15815:
		case 15807:
		case 15809:
		case 15813:
		case 15808:
		case 15812:
		case 15810:
		case 15811:
		case 15697:
		case 15765:
		case 15763:
		case 15719:
		case 15720:
		case 15721:
		case 15718:
		case 15716:
		case 15717:
		case 15715:
		case 15722:
		case 15724:
		case 15728:
		case 15723:
		case 15727:
		case 15725:
		case 15726:
		case 15729:
		case 15714:
		case 15712:
		case 15702:
		case 15703:
		case 15704:
		case 15701:
		case 15699:
		case 15700:
		case 15713:
		case 15705:
		case 15707:
		case 15711:
		case 15706:
		case 15710:
		case 15708:
		case 15709:
		case 15764:
		case 15730:
		case 15732:
		case 15753:
		case 15754:
		case 15755:
		case 15752:
		case 15750:
		case 15751:
		case 15749:
		case 15756:
		case 15758:
		case 15762:
		case 15757:
		case 15761:
		case 15759:
		case 15760:
		case 15731:
		case 15748:
		case 15746:
		case 15736:
		case 15737:
		case 15738:
		case 15735:
		case 15733:
		case 15734:
		case 15747:
		case 15739:
		case 15741:
		case 15745:
		case 15740:
		case 15744:
		case 15742:
		case 15743:
		case 15562:
		case 16105:
		case 16107:
		case 16468:
		case 16469:
		case 16470:
		case 16467:
		case 16465:
		case 16466:
		case 16464:
		case 16471:
		case 16473:
		case 16477:
		case 16472:
		case 16476:
		case 16474:
		case 16475:
		case 16478:
		case 16463:
		case 16461:
		case 16451:
		case 16452:
		case 16453:
		case 16450:
		case 16448:
		case 16449:
		case 16462:
		case 16454:
		case 16456:
		case 16460:
		case 16455:
		case 16459:
		case 16457:
		case 16458:
		case 16447:
		case 16479:
		case 16481:
		case 16502:
		case 16503:
		case 16504:
		case 16501:
		case 16499:
		case 16500:
		case 16498:
		case 16505:
		case 16507:
		case 16511:
		case 16506:
		case 16510:
		case 16508:
		case 16509:
		case 16480:
		case 16497:
		case 16495:
		case 16485:
		case 16486:
		case 16487:
		case 16484:
		case 16482:
		case 16483:
		case 16496:
		case 16488:
		case 16490:
		case 16494:
		case 16489:
		case 16493:
		case 16491:
		case 16492:
		case 16512:
		case 16446:
		case 16444:
		case 16400:
		case 16401:
		case 16402:
		case 16399:
		case 16397:
		case 16398:
		case 16396:
		case 16403:
		case 16405:
		case 16409:
		case 16404:
		case 16408:
		case 16406:
		case 16407:
		case 16410:
		case 16395:
		case 16393:
		case 16383:
		case 16384:
		case 16385:
		case 16382:
		case 16380:
		case 16381:
		case 16394:
		case 16386:
		case 16388:
		case 16392:
		case 16387:
		case 16391:
		case 16389:
		case 16390:
		case 16445:
		case 16411:
		case 16413:
		case 16434:
		case 16435:
		case 16436:
		case 16433:
		case 16431:
		case 16432:
		case 16430:
		case 16437:
		case 16439:
		case 16443:
		case 16438:
		case 16442:
		case 16440:
		case 16441:
		case 16412:
		case 16429:
		case 16427:
		case 16417:
		case 16418:
		case 16419:
		case 16416:
		case 16414:
		case 16415:
		case 16428:
		case 16420:
		case 16422:
		case 16426:
		case 16421:
		case 16425:
		case 16423:
		case 16424:
		case 16379:
		case 16513:
		case 16515:
		case 16604:
		case 16605:
		case 16606:
		case 16603:
		case 16601:
		case 16602:
		case 16600:
		case 16607:
		case 16609:
		case 16613:
		case 16608:
		case 16612:
		case 16610:
		case 16611:
		case 16614:
		case 16599:
		case 16597:
		case 16587:
		case 16588:
		case 16589:
		case 16586:
		case 16584:
		case 16585:
		case 16598:
		case 16590:
		case 16592:
		case 16596:
		case 16591:
		case 16595:
		case 16593:
		case 16594:
		case 16583:
		case 16615:
		case 16617:
		case 16638:
		case 16639:
		case 16640:
		case 16637:
		case 16635:
		case 16636:
		case 16634:
		case 16641:
		case 16643:
		case 14474:
		case 16642:
		case 16646:
		case 16644:
		case 16645:
		case 16616:
		case 16633:
		case 16631:
		case 16621:
		case 16622:
		case 16623:
		case 16620:
		case 16618:
		case 16619:
		case 16632:
		case 16624:
		case 16626:
		case 16630:
		case 16625:
		case 16629:
		case 16627:
		case 16628:
		case 16514:
		case 16582:
		case 16580:
		case 16536:
		case 16537:
		case 16538:
		case 16535:
		case 16533:
		case 16534:
		case 16532:
		case 16539:
		case 16541:
		case 16545:
		case 16540:
		case 16544:
		case 16542:
		case 16543:
		case 16546:
		case 16531:
		case 16529:
		case 16519:
		case 16520:
		case 16521:
		case 16518:
		case 16516:
		case 16517:
		case 16530:
		case 16522:
		case 16524:
		case 16528:
		case 16523:
		case 16527:
		case 16525:
		case 16526:
		case 16581:
		case 16547:
		case 16549:
		case 16570:
		case 16571:
		case 16572:
		case 16569:
		case 16567:
		case 16568:
		case 16566:
		case 16573:
		case 16575:
		case 16579:
		case 16574:
		case 16578:
		case 16576:
		case 16577:
		case 16548:
		case 16565:
		case 16563:
		case 16553:
		case 16554:
		case 16555:
		case 16552:
		case 16550:
		case 16551:
		case 16564:
		case 16556:
		case 16558:
		case 16562:
		case 16557:
		case 16561:
		case 16559:
		case 16560:
		case 16106:
		case 16378:
		case 16376:
		case 16196:
		case 16197:
		case 16198:
		case 16195:
		case 16193:
		case 16194:
		case 16192:
		case 16199:
		case 16201:
		case 16205:
		case 16200:
		case 16204:
		case 16202:
		case 16203:
		case 16206:
		case 16191:
		case 16189:
		case 16179:
		case 16180:
		case 16181:
		case 16178:
		case 16176:
		case 16177:
		case 16190:
		case 16182:
		case 16184:
		case 16188:
		case 16183:
		case 16187:
		case 16185:
		case 16186:
		case 16175:
		case 16207:
		case 16209:
		case 16230:
		case 16231:
		case 16232:
		case 16229:
		case 16227:
		case 16228:
		case 16226:
		case 16233:
		case 16235:
		case 16239:
		case 16234:
		case 16238:
		case 16236:
		case 16237:
		case 16208:
		case 16225:
		case 16223:
		case 16213:
		case 16214:
		case 16215:
		case 16212:
		case 16210:
		case 16211:
		case 16224:
		case 16216:
		case 16218:
		case 16222:
		case 16217:
		case 16221:
		case 16219:
		case 16220:
		case 16240:
		case 16174:
		case 16172:
		case 16128:
		case 16129:
		case 16130:
		case 16127:
		case 16125:
		case 16126:
		case 16124:
		case 16131:
		case 16133:
		case 16137:
		case 16132:
		case 16136:
		case 16134:
		case 16135:
		case 16138:
		case 16123:
		case 16121:
		case 16111:
		case 16112:
		case 16113:
		case 16110:
		case 16108:
		case 16109:
		case 16122:
		case 16114:
		case 16116:
		case 16120:
		case 16115:
		case 16119:
		case 16117:
		case 16118:
		case 16173:
		case 16139:
		case 16141:
		case 16162:
		case 16163:
		case 16164:
		case 16161:
		case 16159:
		case 16160:
		case 16158:
		case 16165:
		case 16167:
		case 16171:
		case 16166:
		case 16170:
		case 16168:
		case 16169:
		case 16140:
		case 16157:
		case 16155:
		case 16145:
		case 16146:
		case 16147:
		case 16144:
		case 16142:
		case 16143:
		case 16156:
		case 16148:
		case 16150:
		case 16154:
		case 16149:
		case 16153:
		case 16151:
		case 16152:
		case 16377:
		case 16241:
		case 16243:
		case 16332:
		case 16333:
		case 16334:
		case 16331:
		case 16329:
		case 16330:
		case 16328:
		case 16335:
		case 16337:
		case 16341:
		case 16336:
		case 16340:
		case 16338:
		case 16339:
		case 16342:
		case 16327:
		case 16325:
		case 16315:
		case 16316:
		case 16317:
		case 16314:
		case 16312:
		case 16313:
		case 16326:
		case 16318:
		case 16320:
		case 16324:
		case 16319:
		case 16323:
		case 16321:
		case 16322:
		case 16311:
		case 16343:
		case 16345:
		case 16366:
		case 16367:
		case 16368:
		case 16365:
		case 16363:
		case 16364:
		case 16362:
		case 16369:
		case 16371:
		case 16375:
		case 16370:
		case 16374:
		case 16372:
		case 16373:
		case 16344:
		case 16361:
		case 16359:
		case 16349:
		case 16350:
		case 16351:
		case 16348:
		case 16346:
		case 16347:
		case 16360:
		case 16352:
		case 16354:
		case 16358:
		case 16353:
		case 16357:
		case 16355:
		case 16356:
		case 16242:
		case 16310:
		case 16308:
		case 16264:
		case 16265:
		case 16266:
		case 16263:
		case 16261:
		case 16262:
		case 16260:
		case 16267:
		case 16269:
		case 16273:
		case 16268:
		case 16272:
		case 16270:
		case 16271:
		case 16274:
		case 16259:
		case 16257:
		case 16247:
		case 16248:
		case 16249:
		case 16246:
		case 16244:
		case 16245:
		case 16258:
		case 16250:
		case 16252:
		case 16256:
		case 16251:
		case 16255:
		case 16253:
		case 16254:
		case 16309:
		case 16275:
		case 16277:
		case 16298:
		case 16299:
		case 16300:
		case 16297:
		case 16295:
		case 16296:
		case 16294:
		case 16301:
		case 16303:
		case 16307:
		case 16302:
		case 16306:
		case 16304:
		case 16305:
		case 16276:
		case 16293:
		case 16291:
		case 16281:
		case 16282:
		case 16283:
		case 16280:
		case 16278:
		case 16279:
		case 16292:
		case 16284:
		case 16286:
		case 16290:
		case 16285:
		case 16289:
		case 16287:
		case 16288:
		case 15561:
		case 16103:
		case 14476:
		case 14837:
		case 14838:
		case 14839:
		case 14836:
		case 14834:
		case 14835:
		case 14833:
		case 14840:
		case 14842:
		case 14846:
		case 14841:
		case 14845:
		case 14843:
		case 14844:
		case 14847:
		case 14832:
		case 14830:
		case 14820:
		case 14821:
		case 14822:
		case 14819:
		case 14817:
		case 14818:
		case 14831:
		case 14823:
		case 14825:
		case 14829:
		case 14824:
		case 14828:
		case 14826:
		case 14827:
		case 14816:
		case 14848:
		case 14850:
		case 14871:
		case 14872:
		case 14873:
		case 14870:
		case 14868:
		case 14869:
		case 14867:
		case 14874:
		case 14876:
		case 14880:
		case 14875:
		case 14879:
		case 14877:
		case 14878:
		case 14849:
		case 14866:
		case 14864:
		case 14854:
		case 14855:
		case 14856:
		case 14853:
		case 14851:
		case 14852:
		case 14865:
		case 14857:
		case 14859:
		case 14863:
		case 14858:
		case 14862:
		case 14860:
		case 14861:
		case 14881:
		case 14815:
		case 14813:
		case 14769:
		case 14770:
		case 14771:
		case 14768:
		case 14766:
		case 14767:
		case 14765:
		case 14772:
		case 14774:
		case 14778:
		case 14773:
		case 14777:
		case 14775:
		case 14776:
		case 14779:
		case 14764:
		case 14762:
		case 14752:
		case 14753:
		case 14754:
		case 14751:
		case 14749:
		case 14750:
		case 14763:
		case 14755:
		case 14757:
		case 14761:
		case 14756:
		case 14760:
		case 14758:
		case 14759:
		case 14814:
		case 14780:
		case 14782:
		case 14803:
		case 14804:
		case 14805:
		case 14802:
		case 14800:
		case 14801:
		case 14799:
		case 14806:
		case 14808:
		case 14812:
		case 14807:
		case 14811:
		case 14809:
		case 14810:
		case 14781:
		case 14798:
		case 14796:
		case 14786:
		case 14787:
		case 14788:
		case 14785:
		case 14783:
		case 14784:
		case 14797:
		case 14789:
		case 14791:
		case 14795:
		case 14790:
		case 14794:
		case 14792:
		case 14793:
		case 14747:
		case 14882:
		case 14884:
		case 14973:
		case 14974:
		case 14975:
		case 14972:
		case 14970:
		case 14971:
		case 14969:
		case 14976:
		case 14978:
		case 14982:
		case 14977:
		case 14981:
		case 14979:
		case 14980:
		case 14983:
		case 14968:
		case 14966:
		case 14956:
		case 14957:
		case 14958:
		case 14955:
		case 14953:
		case 14954:
		case 14967:
		case 14959:
		case 14961:
		case 14965:
		case 14960:
		case 14964:
		case 14962:
		case 14963:
		case 14952:
		case 14984:
		case 14986:
		case 15007:
		case 15008:
		case 15009:
		case 15006:
		case 15004:
		case 15005:
		case 15003:
		case 15010:
		case 15012:
		case 15016:
		case 15011:
		case 15015:
		case 15013:
		case 15014:
		case 14985:
		case 15002:
		case 16647:
		case 14990:
		case 14991:
		case 14992:
		case 14989:
		case 14987:
		case 14988:
		case 15001:
		case 14993:
		case 14995:
		case 14999:
		case 14994:
		case 14998:
		case 14996:
		case 14997:
		case 14883:
		case 14951:
		case 14949:
		case 14905:
		case 14906:
		case 14907:
		case 14904:
		case 14902:
		case 14903:
		case 14901:
		case 14908:
		case 14910:
		case 14914:
		case 14909:
		case 14913:
		case 14911:
		case 14912:
		case 14915:
		case 14900:
		case 14898:
		case 14888:
		case 14889:
		case 14890:
		case 14887:
		case 14885:
		case 14886:
		case 14899:
		case 14891:
		case 14893:
		case 14897:
		case 14892:
		case 14896:
		case 14894:
		case 14895:
		case 14950:
		case 14916:
		case 14918:
		case 14939:
		case 14940:
		case 14941:
		case 14938:
		case 14936:
		case 14937:
		case 14935:
		case 14942:
		case 14944:
		case 14948:
		case 14943:
		case 14947:
		case 14945:
		case 14946:
		case 14917:
		case 14934:
		case 14932:
		case 14922:
		case 14923:
		case 14924:
		case 14921:
		case 14919:
		case 14920:
		case 14933:
		case 14925:
		case 14927:
		case 14931:
		case 14926:
		case 14930:
		case 14928:
		case 14929:
		case 15017:
		case 14746:
		case 14744:
		case 14564:
		case 14565:
		case 14566:
		case 14563:
		case 14561:
		case 14562:
		case 14560:
		case 14567:
		case 14569:
		case 14573:
		case 14568:
		case 14572:
		case 14570:
		case 14571:
		case 14574:
		case 14559:
		case 14557:
		case 14547:
		case 14548:
		case 14549:
		case 14546:
		case 14544:
		case 14545:
		case 14558:
		case 14550:
		case 14552:
		case 14556:
		case 14551:
		case 14555:
		case 14553:
		case 14554:
		case 14543:
		case 14575:
		case 14577:
		case 14598:
		case 14599:
		case 14600:
		case 14597:
		case 14595:
		case 14596:
		case 14594:
		case 14601:
		case 14603:
		case 14607:
		case 14602:
		case 14606:
		case 14604:
		case 14605:
		case 14576:
		case 14593:
		case 14591:
		case 14581:
		case 14582:
		case 14583:
		case 14580:
		case 14578:
		case 14579:
		case 14592:
		case 14584:
		case 14586:
		case 14590:
		case 14585:
		case 14589:
		case 14587:
		case 14588:
		case 14608:
		case 14542:
		case 14540:
		case 14496:
		case 14497:
		case 14498:
		case 14495:
		case 14493:
		case 14494:
		case 14492:
		case 14499:
		case 14501:
		case 14505:
		case 14500:
		case 14504:
		case 14502:
		case 14503:
		case 14506:
		case 14491:
		case 14489:
		case 14479:
		case 14480:
		case 14481:
		case 14478:
		case 15560:
		case 14477:
		case 14490:
		case 14482:
		case 14484:
		case 14488:
		case 14483:
		case 14487:
		case 14485:
		case 14486:
		case 14541:
		case 14507:
		case 14509:
		case 14530:
		case 14531:
		case 14532:
		case 14529:
		case 14527:
		case 14528:
		case 14526:
		case 14533:
		case 14535:
		case 14539:
		case 14534:
		case 14538:
		case 14536:
		case 14537:
		case 14508:
		case 14525:
		case 14523:
		case 14513:
		case 14514:
		case 14515:
		case 14512:
		case 14510:
		case 14511:
		case 14524:
		case 14516:
		case 14518:
		case 14522:
		case 14517:
		case 14521:
		case 14519:
		case 14520:
		case 14745:
		case 14609:
		case 14611:
		case 14700:
		case 14701:
		case 14702:
		case 14699:
		case 14697:
		case 14698:
		case 14696:
		case 14703:
		case 14705:
		case 14709:
		case 14704:
		case 14708:
		case 14706:
		case 14707:
		case 14710:
		case 14695:
		case 14693:
		case 14683:
		case 14684:
		case 14685:
		case 14682:
		case 14680:
		case 14681:
		case 14694:
		case 14686:
		case 14688:
		case 14692:
		case 14687:
		case 14691:
		case 14689:
		case 14690:
		case 14679:
		case 14711:
		case 14713:
		case 14734:
		case 14735:
		case 14736:
		case 14733:
		case 14731:
		case 14732:
		case 14730:
		case 14737:
		case 14739:
		case 14743:
		case 14738:
		case 14742:
		case 14740:
		case 14741:
		case 14712:
		case 14729:
		case 14727:
		case 14717:
		case 14718:
		case 14719:
		case 14716:
		case 14714:
		case 14715:
		case 14728:
		case 14720:
		case 14722:
		case 14726:
		case 14721:
		case 14725:
		case 14723:
		case 14724:
		case 14610:
		case 14678:
		case 14676:
		case 14632:
		case 14633:
		case 14634:
		case 14631:
		case 14629:
		case 14630:
		case 14628:
		case 14635:
		case 14637:
		case 14641:
		case 14636:
		case 14640:
		case 14638:
		case 14639:
		case 14642:
		case 14627:
		case 14625:
		case 14615:
		case 14616:
		case 14617:
		case 14614:
		case 14612:
		case 14613:
		case 14626:
		case 14618:
		case 14620:
		case 14624:
		case 14619:
		case 14623:
		case 14621:
		case 14622:
		case 14677:
		case 14643:
		case 14645:
		case 14666:
		case 14667:
		case 14668:
		case 14665:
		case 14663:
		case 14664:
		case 14662:
		case 14669:
		case 14671:
		case 14675:
		case 14670:
		case 14674:
		case 14672:
		case 14673:
		case 14644:
		case 14661:
		case 14659:
		case 14649:
		case 14650:
		case 14651:
		case 14648:
		case 14646:
		case 14647:
		case 14660:
		case 14652:
		case 14654:
		case 14658:
		case 14653:
		case 14657:
		case 14655:
		case 14656:
		case 15018:
		case 14748:
		case 15559:
		case 15379:
		case 15380:
		case 15381:
		case 15378:
		case 15376:
		case 15377:
		case 15375:
		case 15382:
		case 15384:
		case 15388:
		case 15383:
		case 15387:
		case 15385:
		case 15386:
		case 15389:
		case 15374:
		case 15372:
		case 15362:
		case 15363:
		case 15364:
		case 15361:
		case 15359:
		case 15360:
		case 15373:
		case 15365:
		case 15367:
		case 15371:
		case 15366:
		case 15370:
		case 15368:
		case 15369:
		case 15358:
		case 15390:
		case 15392:
		case 15413:
		case 15414:
		case 15415:
		case 15412:
		case 15410:
		case 15411:
		case 15409:
		case 15416:
		case 15418:
		case 15422:
		case 15417:
		case 15421:
		case 15419:
		case 15420:
		case 15391:
		case 15408:
		case 15406:
		case 15396:
		case 15397:
		case 15398:
		case 15395:
		case 15393:
		case 15394:
		case 15407:
		case 15399:
		case 15401:
		case 15405:
		case 15400:
		case 15404:
		case 15402:
		case 15403:
		case 15424:
		case 15357:
		case 15355:
		case 15311:
		case 15312:
		case 15313:
		case 15310:
		case 15308:
		case 15309:
		case 15307:
		case 15314:
		case 15316:
		case 15320:
		case 15315:
		case 15319:
		case 15317:
		case 15318:
		case 15321:
		case 15306:
		case 15304:
		case 15294:
		case 15295:
		case 15296:
		case 15293:
		case 15291:
		case 15292:
		case 15305:
		case 15297:
		case 15299:
		case 15303:
		case 15298:
		case 15302:
		case 15300:
		case 15301:
		case 15356:
		case 15322:
		case 15324:
		case 15345:
		case 15346:
		case 15347:
		case 15344:
		case 15342:
		case 15343:
		case 15341:
		case 15348:
		case 15350:
		case 15354:
		case 15349:
		case 15353:
		case 15351:
		case 15352:
		case 15323:
		case 15340:
		case 15338:
		case 15328:
		case 15329:
		case 15330:
		case 15327:
		case 15325:
		case 15326:
		case 15339:
		case 15331:
		case 15333:
		case 15337:
		case 15332:
		case 15336:
		case 15334:
		case 15335:
		case 15290:
		case 15425:
		case 15427:
		case 15516:
		case 15517:
		case 15518:
		case 15515:
		case 15513:
		case 15514:
		case 15512:
		case 15519:
		case 15521:
		case 15525:
		case 15520:
		case 15524:
		case 15522:
		case 15523:
		case 15526:
		case 15511:
		case 15509:
		case 15499:
		case 15500:
		case 15501:
		case 15498:
		case 15496:
		case 15497:
		case 15510:
		case 15502:
		case 15504:
		case 15508:
		case 15503:
		case 15507:
		case 15505:
		case 15506:
		case 15495:
		case 15527:
		case 15529:
		case 15550:
		case 15551:
		case 15552:
		case 15549:
		case 15547:
		case 15548:
		case 15546:
		case 15553:
		case 15555:
		case 15019:
		case 15554:
		case 15558:
		case 15556:
		case 15557:
		case 15528:
		case 15545:
		case 15543:
		case 15533:
		case 15534:
		case 15535:
		case 15532:
		case 15530:
		case 15531:
		case 15544:
		case 15536:
		case 15538:
		case 15542:
		case 15537:
		case 15541:
		case 15539:
		case 15540:
		case 15426:
		case 15494:
		case 15492:
		case 15448:
		case 15449:
		case 15450:
		case 15447:
		case 15445:
		case 15446:
		case 15444:
		case 15451:
		case 15453:
		case 15457:
		case 15452:
		case 15456:
		case 15454:
		case 15455:
		case 15458:
		case 15443:
		case 15441:
		case 15431:
		case 15432:
		case 15433:
		case 15430:
		case 15428:
		case 15429:
		case 15442:
		case 15434:
		case 15436:
		case 15440:
		case 15435:
		case 15439:
		case 15437:
		case 15438:
		case 15493:
		case 15459:
		case 15461:
		case 15482:
		case 15483:
		case 15484:
		case 15481:
		case 15479:
		case 15480:
		case 15478:
		case 15485:
		case 15487:
		case 15491:
		case 15486:
		case 15490:
		case 15488:
		case 15489:
		case 15460:
		case 15477:
		case 15475:
		case 15465:
		case 15466:
		case 15467:
		case 15464:
		case 15462:
		case 15463:
		case 15476:
		case 15468:
		case 15470:
		case 15474:
		case 15469:
		case 15473:
		case 15471:
		case 15472:
		case 15289:
		case 15423:
		case 15020:
		case 15109:
		case 15110:
		case 15111:
		case 15108:
		case 15106:
		case 15107:
		case 15105:
		case 15112:
		case 15114:
		case 15118:
		case 15113:
		case 15117:
		case 15115:
		case 15116:
		case 15119:
		case 15104:
		case 15102:
		case 15092:
		case 15093:
		case 15094:
		case 15091:
		case 15089:
		case 15090:
		case 15103:
		case 15095:
		case 15097:
		case 15101:
		case 15096:
		case 15100:
		case 15098:
		case 15099:
		case 15087:
		case 15120:
		case 15122:
		case 15143:
		case 15144:
		case 15145:
		case 15142:
		case 15140:
		case 15141:
		case 15139:
		case 15146:
		case 15148:
		case 15152:
		case 15147:
		case 15151:
		case 15149:
		case 15150:
		case 15121:
		case 15138:
		case 15136:
		case 15126:
		case 15127:
		case 15128:
		case 15125:
		case 15123:
		case 15124:
		case 15137:
		case 15129:
		case 15131:
		case 15135:
		case 15130:
		case 15134:
		case 15132:
		case 15133:
		case 15153:
		case 15086:
		case 15084:
		case 15040:
		case 15041:
		case 15042:
		case 15039:
		case 15037:
		case 15038:
		case 15036:
		case 15043:
		case 15045:
		case 15049:
		case 15044:
		case 15048:
		case 15046:
		case 15047:
		case 15050:
		case 15035:
		case 15033:
		case 15023:
		case 15024:
		case 15025:
		case 15022:
		case 15288:
		case 15021:
		case 15034:
		case 15026:
		case 15028:
		case 15032:
		case 15027:
		case 15031:
		case 15029:
		case 15030:
		case 15085:
		case 15051:
		case 15053:
		case 15074:
		case 15075:
		case 15076:
		case 15073:
		case 15071:
		case 15072:
		case 15070:
		case 15077:
		case 15079:
		case 15083:
		case 15078:
		case 15082:
		case 15080:
		case 15081:
		case 15052:
		case 15069:
		case 15067:
		case 15057:
		case 15058:
		case 15059:
		case 15056:
		case 15054:
		case 15055:
		case 15068:
		case 15060:
		case 15062:
		case 15066:
		case 15061:
		case 15065:
		case 15063:
		case 15064:
		case 15154:
		case 15088:
		case 15287:
		case 15243:
		case 15244:
		case 15245:
		case 15242:
		case 15240:
		case 15241:
		case 15239:
		case 15246:
		case 15248:
		case 15252:
		case 15247:
		case 15251:
		case 15249:
		case 15250:
		case 15254:
		case 15238:
		case 15236:
		case 15226:
		case 15227:
		case 15228:
		case 15225:
		case 15223:
		case 15224:
		case 15237:
		case 15229:
		case 15231:
		case 15235:
		case 15230:
		case 15234:
		case 15232:
		case 15233:
		case 15222:
		case 15255:
		case 15257:
		case 15278:
		case 15279:
		case 15280:
		case 15277:
		case 15275:
		case 15276:
		case 15274:
		case 15281:
		case 15283:
		case 15155:
		case 15282:
		case 15286:
		case 15284:
		case 15285:
		case 15256:
		case 15273:
		case 15271:
		case 15261:
		case 15262:
		case 15263:
		case 15260:
		case 15258:
		case 15259:
		case 15272:
		case 15264:
		case 15266:
		case 15270:
		case 15265:
		case 15269:
		case 15267:
		case 15268:
		case 15221:
		case 15253:
		case 15156:
		case 15177:
		case 15178:
		case 15179:
		case 15176:
		case 15174:
		case 15175:
		case 15172:
		case 15180:
		case 15182:
		case 15186:
		case 15181:
		case 15185:
		case 15183:
		case 15184:
		case 15187:
		case 15171:
		case 15169:
		case 15159:
		case 15160:
		case 15161:
		case 15158:
		case 15220:
		case 15157:
		case 15170:
		case 15162:
		case 15164:
		case 15168:
		case 15163:
		case 15167:
		case 15165:
		case 15166:
		case 15188:
		case 15173:
		case 15219:
		case 15209:
		case 15211:
		case 15212:
		case 15208:
		case 15206:
		case 15207:
		case 15205:
		case 15213:
		case 15215:
		case 15189:
		case 15214:
		case 15218:
		case 15216:
		case 15217:
		case 15204:
		case 15210:
		case 15190:
		case 15193:
		case 15195:
		case 15196:
		case 15192:
		case 15203:
		case 15191:
		case 15197:
		case 15194:
		case 15202:
		case 15198:
		case 15201:
		case 15200:
		case 15199:
			function314C8(arg0, glob479AC[arg0], 3970776780);
		case 27099:
		case 27100:
		case 27098:
		case 27096:
		case 27101:
		case 27097:
		case 27102:
		case 27108:
		case 27104:
		case 27095:
		case 27103:
		case 27107:
		case 27105:
		case 27106:
		case 27094:
		case 27079:
		case 27092:
		case 27082:
		case 27083:
		case 27084:
		case 27081:
		case 27109:
		case 27080:
		case 27093:
		case 27085:
		case 27087:
		case 27091:
		case 27086:
		case 27090:
		case 27088:
		case 27089:
		case 27110:
		case 27142:
		case 27112:
		case 27133:
		case 27134:
		case 27135:
		case 27132:
		case 27130:
		case 27131:
		case 27129:
		case 27136:
		case 27138:
		case 27078:
		case 27137:
		case 27141:
		case 27139:
		case 27140:
		case 27111:
		case 27128:
		case 27126:
		case 27116:
		case 27117:
		case 27118:
		case 27115:
		case 27113:
		case 27114:
		case 27127:
		case 27119:
		case 27121:
		case 27125:
		case 27120:
		case 27124:
		case 27122:
		case 27123:
		case 27077:
		case 27011:
		case 27075:
		case 27031:
		case 27032:
		case 27033:
		case 27030:
		case 27028:
		case 27029:
		case 27027:
		case 27034:
		case 27036:
		case 27040:
		case 27035:
		case 27039:
		case 27037:
		case 27038:
		case 27041:
		case 27026:
		case 27024:
		case 27014:
		case 27015:
		case 27016:
		case 27013:
		case 27143:
		case 27012:
		case 27025:
		case 27017:
		case 27019:
		case 27023:
		case 27018:
		case 27022:
		case 27020:
		case 27021:
		case 27076:
		case 27042:
		case 27044:
		case 27065:
		case 27066:
		case 27067:
		case 27064:
		case 27062:
		case 27063:
		case 27061:
		case 27068:
		case 27070:
		case 27074:
		case 27069:
		case 27073:
		case 27071:
		case 27072:
		case 27043:
		case 27060:
		case 27058:
		case 27048:
		case 27049:
		case 27050:
		case 27047:
		case 27045:
		case 27046:
		case 27059:
		case 27051:
		case 27053:
		case 27057:
		case 27052:
		case 27056:
		case 27054:
		case 27055:
		case 27144:
		case 27278:
		case 27146:
		case 27235:
		case 27236:
		case 27237:
		case 27234:
		case 27232:
		case 27233:
		case 27231:
		case 27238:
		case 27240:
		case 27244:
		case 27239:
		case 27243:
		case 27241:
		case 27242:
		case 27245:
		case 27230:
		case 27228:
		case 27218:
		case 27219:
		case 27220:
		case 27217:
		case 27215:
		case 27216:
		case 27229:
		case 27221:
		case 27223:
		case 27227:
		case 27222:
		case 27226:
		case 27224:
		case 27225:
		case 27214:
		case 27246:
		case 27248:
		case 27269:
		case 27270:
		case 27271:
		case 27268:
		case 27266:
		case 27267:
		case 27265:
		case 27272:
		case 27274:
		case 27010:
		case 27273:
		case 27277:
		case 27275:
		case 27276:
		case 27247:
		case 27264:
		case 27262:
		case 27252:
		case 27253:
		case 27254:
		case 27251:
		case 27249:
		case 27250:
		case 27263:
		case 27255:
		case 27257:
		case 27261:
		case 27256:
		case 27260:
		case 27258:
		case 27259:
		case 27145:
		case 27213:
		case 27211:
		case 27167:
		case 27168:
		case 27169:
		case 27166:
		case 27164:
		case 27165:
		case 27163:
		case 27170:
		case 27172:
		case 27176:
		case 27171:
		case 27175:
		case 27173:
		case 27174:
		case 27177:
		case 27162:
		case 27160:
		case 27150:
		case 27151:
		case 27152:
		case 27149:
		case 27147:
		case 27148:
		case 27161:
		case 27153:
		case 27155:
		case 27159:
		case 27154:
		case 27158:
		case 27156:
		case 27157:
		case 27212:
		case 27178:
		case 27180:
		case 27201:
		case 27202:
		case 27203:
		case 27200:
		case 27198:
		case 27199:
		case 27197:
		case 27204:
		case 27206:
		case 27210:
		case 27205:
		case 27209:
		case 27207:
		case 27208:
		case 27179:
		case 27196:
		case 27194:
		case 27184:
		case 27185:
		case 27186:
		case 27183:
		case 27181:
		case 27182:
		case 27195:
		case 27187:
		case 27189:
		case 27193:
		case 27188:
		case 27192:
		case 27190:
		case 27191:
		case 27009:
		case 26739:
		case 27007:
		case 26827:
		case 26828:
		case 26829:
		case 26826:
		case 26824:
		case 26825:
		case 26823:
		case 26830:
		case 26832:
		case 26836:
		case 26831:
		case 26835:
		case 26833:
		case 26834:
		case 26837:
		case 26822:
		case 26820:
		case 26810:
		case 26811:
		case 26812:
		case 26809:
		case 26807:
		case 26808:
		case 26821:
		case 26813:
		case 26815:
		case 26819:
		case 26814:
		case 26818:
		case 26816:
		case 26817:
		case 26806:
		case 26838:
		case 26840:
		case 26861:
		case 26862:
		case 26863:
		case 26860:
		case 26858:
		case 26859:
		case 26857:
		case 26864:
		case 26866:
		case 26870:
		case 26865:
		case 26869:
		case 26867:
		case 26868:
		case 26839:
		case 26856:
		case 26854:
		case 26844:
		case 26845:
		case 26846:
		case 26843:
		case 26841:
		case 26842:
		case 26855:
		case 26847:
		case 26849:
		case 26853:
		case 26848:
		case 26852:
		case 26850:
		case 26851:
		case 26871:
		case 26805:
		case 26803:
		case 26759:
		case 26760:
		case 26761:
		case 26758:
		case 26756:
		case 26757:
		case 26755:
		case 26762:
		case 26764:
		case 26768:
		case 26763:
		case 26767:
		case 26765:
		case 26766:
		case 26769:
		case 26754:
		case 26752:
		case 26742:
		case 26743:
		case 26744:
		case 26741:
		case 27279:
		case 26740:
		case 26753:
		case 26745:
		case 26747:
		case 26751:
		case 26746:
		case 26750:
		case 26748:
		case 26749:
		case 26804:
		case 26770:
		case 26772:
		case 26793:
		case 26794:
		case 26795:
		case 26792:
		case 26790:
		case 26791:
		case 26789:
		case 26796:
		case 26798:
		case 26802:
		case 26797:
		case 26801:
		case 26799:
		case 26800:
		case 26771:
		case 26788:
		case 26786:
		case 26776:
		case 26777:
		case 26778:
		case 26775:
		case 26773:
		case 26774:
		case 26787:
		case 26779:
		case 26781:
		case 26785:
		case 26780:
		case 26784:
		case 26782:
		case 26783:
		case 27008:
		case 26872:
		case 26874:
		case 26963:
		case 26964:
		case 26965:
		case 26962:
		case 26960:
		case 26961:
		case 26959:
		case 26966:
		case 26968:
		case 26972:
		case 26967:
		case 26971:
		case 26969:
		case 26970:
		case 26973:
		case 26958:
		case 26956:
		case 26946:
		case 26947:
		case 26948:
		case 26945:
		case 26943:
		case 26944:
		case 26957:
		case 26949:
		case 26951:
		case 26955:
		case 26950:
		case 26954:
		case 26952:
		case 26953:
		case 26942:
		case 26974:
		case 26976:
		case 26997:
		case 26998:
		case 26999:
		case 26996:
		case 26994:
		case 26995:
		case 26993:
		case 27000:
		case 27002:
		case 27006:
		case 27001:
		case 27005:
		case 27003:
		case 27004:
		case 26975:
		case 26992:
		case 26990:
		case 26980:
		case 26981:
		case 26982:
		case 26979:
		case 26977:
		case 26978:
		case 26991:
		case 26983:
		case 26985:
		case 26989:
		case 26984:
		case 26988:
		case 26986:
		case 26987:
		case 26873:
		case 26941:
		case 26939:
		case 26895:
		case 26896:
		case 26897:
		case 26894:
		case 26892:
		case 26893:
		case 26891:
		case 26898:
		case 26900:
		case 26904:
		case 26899:
		case 26903:
		case 26901:
		case 26902:
		case 26905:
		case 26890:
		case 26888:
		case 26878:
		case 26879:
		case 26880:
		case 26877:
		case 26875:
		case 26876:
		case 26889:
		case 26881:
		case 26883:
		case 26887:
		case 26882:
		case 26886:
		case 26884:
		case 26885:
		case 26940:
		case 26906:
		case 26908:
		case 26929:
		case 26930:
		case 26931:
		case 26928:
		case 26926:
		case 26927:
		case 26925:
		case 26932:
		case 26934:
		case 26938:
		case 26933:
		case 26937:
		case 26935:
		case 26936:
		case 26907:
		case 26924:
		case 26922:
		case 26912:
		case 26913:
		case 26914:
		case 26911:
		case 26909:
		case 26910:
		case 26923:
		case 26915:
		case 26917:
		case 26921:
		case 26916:
		case 26920:
		case 26918:
		case 26919:
		case 27280:
		case 27822:
		case 27282:
		case 27643:
		case 27644:
		case 27645:
		case 27642:
		case 27640:
		case 27641:
		case 27639:
		case 27646:
		case 27648:
		case 27652:
		case 27647:
		case 27651:
		case 27649:
		case 27650:
		case 27653:
		case 27638:
		case 27636:
		case 27626:
		case 27627:
		case 27628:
		case 27625:
		case 27623:
		case 27624:
		case 27637:
		case 27629:
		case 27631:
		case 27635:
		case 27630:
		case 27634:
		case 27632:
		case 27633:
		case 27622:
		case 27654:
		case 27656:
		case 27677:
		case 27678:
		case 27679:
		case 27676:
		case 27674:
		case 27675:
		case 27673:
		case 27680:
		case 27682:
		case 27686:
		case 27681:
		case 27685:
		case 27683:
		case 27684:
		case 27655:
		case 27672:
		case 27670:
		case 27660:
		case 27661:
		case 27662:
		case 27659:
		case 27657:
		case 27658:
		case 27671:
		case 27663:
		case 27665:
		case 27669:
		case 27664:
		case 27668:
		case 27666:
		case 27667:
		case 27687:
		case 27621:
		case 27619:
		case 27575:
		case 27576:
		case 27577:
		case 27574:
		case 27572:
		case 27573:
		case 27571:
		case 27578:
		case 27580:
		case 27584:
		case 27579:
		case 27583:
		case 27581:
		case 27582:
		case 27585:
		case 27570:
		case 27568:
		case 27558:
		case 27559:
		case 27560:
		case 27557:
		case 27555:
		case 27556:
		case 27569:
		case 27561:
		case 27563:
		case 27567:
		case 27562:
		case 27566:
		case 27564:
		case 27565:
		case 27620:
		case 27586:
		case 27588:
		case 27609:
		case 27610:
		case 27611:
		case 27608:
		case 27606:
		case 27607:
		case 27605:
		case 27612:
		case 27614:
		case 27618:
		case 27613:
		case 27617:
		case 27615:
		case 27616:
		case 27587:
		case 27604:
		case 27602:
		case 27592:
		case 27593:
		case 27594:
		case 27591:
		case 27589:
		case 27590:
		case 27603:
		case 27595:
		case 27597:
		case 27601:
		case 27596:
		case 27600:
		case 27598:
		case 27599:
		case 27554:
		case 27688:
		case 27690:
		case 27779:
		case 27780:
		case 27781:
		case 27778:
		case 27776:
		case 27777:
		case 27775:
		case 27782:
		case 27784:
		case 27788:
		case 27783:
		case 27787:
		case 27785:
		case 27786:
		case 27789:
		case 27774:
		case 27772:
		case 27762:
		case 27763:
		case 27764:
		case 27761:
		case 27759:
		case 27760:
		case 27773:
		case 27765:
		case 27767:
		case 27771:
		case 27766:
		case 27770:
		case 27768:
		case 27769:
		case 27758:
		case 27790:
		case 27792:
		case 27813:
		case 27814:
		case 27815:
		case 27812:
		case 27810:
		case 27811:
		case 27809:
		case 27816:
		case 27818:
		case 26738:
		case 27817:
		case 27821:
		case 27819:
		case 27820:
		case 27791:
		case 27808:
		case 27806:
		case 27796:
		case 27797:
		case 27798:
		case 27795:
		case 27793:
		case 27794:
		case 27807:
		case 27799:
		case 27801:
		case 27805:
		case 27800:
		case 27804:
		case 27802:
		case 27803:
		case 27689:
		case 27757:
		case 27755:
		case 27711:
		case 27712:
		case 27713:
		case 27710:
		case 27708:
		case 27709:
		case 27707:
		case 27714:
		case 27716:
		case 27720:
		case 27715:
		case 27719:
		case 27717:
		case 27718:
		case 27721:
		case 27706:
		case 27704:
		case 27694:
		case 27695:
		case 27696:
		case 27693:
		case 27691:
		case 27692:
		case 27705:
		case 27697:
		case 27699:
		case 27703:
		case 27698:
		case 27702:
		case 27700:
		case 27701:
		case 27756:
		case 27722:
		case 27724:
		case 27745:
		case 27746:
		case 27747:
		case 27744:
		case 27742:
		case 27743:
		case 27741:
		case 27748:
		case 27750:
		case 27754:
		case 27749:
		case 27753:
		case 27751:
		case 27752:
		case 27723:
		case 27740:
		case 27738:
		case 27728:
		case 27729:
		case 27730:
		case 27727:
		case 27725:
		case 27726:
		case 27739:
		case 27731:
		case 27733:
		case 27737:
		case 27732:
		case 27736:
		case 27734:
		case 27735:
		case 27281:
		case 27553:
		case 27551:
		case 27371:
		case 27372:
		case 27373:
		case 27370:
		case 27368:
		case 27369:
		case 27367:
		case 27374:
		case 27376:
		case 27380:
		case 27375:
		case 27379:
		case 27377:
		case 27378:
		case 27381:
		case 27366:
		case 27364:
		case 27354:
		case 27355:
		case 27356:
		case 27353:
		case 27351:
		case 27352:
		case 27365:
		case 27357:
		case 27359:
		case 27363:
		case 27358:
		case 27362:
		case 27360:
		case 27361:
		case 27350:
		case 27382:
		case 27384:
		case 27405:
		case 27406:
		case 27407:
		case 27404:
		case 27402:
		case 27403:
		case 27401:
		case 27408:
		case 27410:
		case 27414:
		case 27409:
		case 27413:
		case 27411:
		case 27412:
		case 27383:
		case 27400:
		case 27398:
		case 27388:
		case 27389:
		case 27390:
		case 27387:
		case 27385:
		case 27386:
		case 27399:
		case 27391:
		case 27393:
		case 27397:
		case 27392:
		case 27396:
		case 27394:
		case 27395:
		case 27415:
		case 27349:
		case 27347:
		case 27303:
		case 27304:
		case 27305:
		case 27302:
		case 27300:
		case 27301:
		case 27299:
		case 27306:
		case 27308:
		case 27312:
		case 27307:
		case 27311:
		case 27309:
		case 27310:
		case 27313:
		case 27298:
		case 27296:
		case 27286:
		case 27287:
		case 27288:
		case 27285:
		case 27283:
		case 27284:
		case 27297:
		case 27289:
		case 27291:
		case 27295:
		case 27290:
		case 27294:
		case 27292:
		case 27293:
		case 27348:
		case 27314:
		case 27316:
		case 27337:
		case 27338:
		case 27339:
		case 27336:
		case 27334:
		case 27335:
		case 27333:
		case 27340:
		case 27342:
		case 27346:
		case 27341:
		case 27345:
		case 27343:
		case 27344:
		case 27315:
		case 27332:
		case 27330:
		case 27320:
		case 27321:
		case 27322:
		case 27319:
		case 27317:
		case 27318:
		case 27331:
		case 27323:
		case 27325:
		case 27329:
		case 27324:
		case 27328:
		case 27326:
		case 27327:
		case 27552:
		case 27416:
		case 27418:
		case 27507:
		case 27508:
		case 27509:
		case 27506:
		case 27504:
		case 27505:
		case 27503:
		case 27510:
		case 27512:
		case 27516:
		case 27511:
		case 27515:
		case 27513:
		case 27514:
		case 27517:
		case 27502:
		case 27500:
		case 27490:
		case 27491:
		case 27492:
		case 27489:
		case 27487:
		case 27488:
		case 27501:
		case 27493:
		case 27495:
		case 27499:
		case 27494:
		case 27498:
		case 27496:
		case 27497:
		case 27486:
		case 27518:
		case 27520:
		case 27541:
		case 27542:
		case 27543:
		case 27540:
		case 27538:
		case 27539:
		case 27537:
		case 27544:
		case 27546:
		case 27550:
		case 27545:
		case 27549:
		case 27547:
		case 27548:
		case 27519:
		case 27536:
		case 27534:
		case 27524:
		case 27525:
		case 27526:
		case 27523:
		case 27521:
		case 27522:
		case 27535:
		case 27527:
		case 27529:
		case 27533:
		case 27528:
		case 27532:
		case 27530:
		case 27531:
		case 27417:
		case 27485:
		case 27483:
		case 27439:
		case 27440:
		case 27441:
		case 27438:
		case 27436:
		case 27437:
		case 27435:
		case 27442:
		case 27444:
		case 27448:
		case 27443:
		case 27447:
		case 27445:
		case 27446:
		case 27449:
		case 27434:
		case 27432:
		case 27422:
		case 27423:
		case 27424:
		case 27421:
		case 27419:
		case 27420:
		case 27433:
		case 27425:
		case 27427:
		case 27431:
		case 27426:
		case 27430:
		case 27428:
		case 27429:
		case 27484:
		case 27450:
		case 27452:
		case 27473:
		case 27474:
		case 27475:
		case 27472:
		case 27470:
		case 27471:
		case 27469:
		case 27476:
		case 27478:
		case 27482:
		case 27477:
		case 27481:
		case 27479:
		case 27480:
		case 27451:
		case 27468:
		case 27466:
		case 27456:
		case 27457:
		case 27458:
		case 27455:
		case 27453:
		case 27454:
		case 27467:
		case 27459:
		case 27461:
		case 27465:
		case 27460:
		case 27464:
		case 27462:
		case 27463:
		case 26737:
		case 25652:
		case 26735:
		case 26011:
		case 26012:
		case 26013:
		case 26010:
		case 26008:
		case 26009:
		case 26007:
		case 26014:
		case 26016:
		case 26020:
		case 26015:
		case 26019:
		case 26017:
		case 26018:
		case 26021:
		case 26006:
		case 26004:
		case 25994:
		case 25995:
		case 25996:
		case 25993:
		case 25991:
		case 25992:
		case 26005:
		case 25997:
		case 25999:
		case 26003:
		case 25998:
		case 26002:
		case 26000:
		case 26001:
		case 25990:
		case 26022:
		case 26024:
		case 26045:
		case 26046:
		case 26047:
		case 26044:
		case 26042:
		case 26043:
		case 26041:
		case 26048:
		case 26050:
		case 26054:
		case 26049:
		case 26053:
		case 26051:
		case 26052:
		case 26023:
		case 26040:
		case 26038:
		case 26028:
		case 26029:
		case 26030:
		case 26027:
		case 26025:
		case 26026:
		case 26039:
		case 26031:
		case 26033:
		case 26037:
		case 26032:
		case 26036:
		case 26034:
		case 26035:
		case 26055:
		case 25989:
		case 25987:
		case 25943:
		case 25944:
		case 25945:
		case 25942:
		case 25940:
		case 25941:
		case 25939:
		case 25946:
		case 25948:
		case 25952:
		case 25947:
		case 25951:
		case 25949:
		case 25950:
		case 25953:
		case 25938:
		case 25936:
		case 25926:
		case 25927:
		case 25928:
		case 25925:
		case 25923:
		case 25924:
		case 25937:
		case 25929:
		case 25931:
		case 25935:
		case 25930:
		case 25934:
		case 25932:
		case 25933:
		case 25988:
		case 25954:
		case 25956:
		case 25977:
		case 25978:
		case 25979:
		case 25976:
		case 25974:
		case 25975:
		case 25973:
		case 25980:
		case 25982:
		case 25986:
		case 25981:
		case 25985:
		case 25983:
		case 25984:
		case 25955:
		case 25972:
		case 25970:
		case 25960:
		case 25961:
		case 25962:
		case 25959:
		case 25957:
		case 25958:
		case 25971:
		case 25963:
		case 25965:
		case 25969:
		case 25964:
		case 25968:
		case 25966:
		case 25967:
		case 25922:
		case 26056:
		case 26058:
		case 26147:
		case 26148:
		case 26149:
		case 26146:
		case 26144:
		case 26145:
		case 26143:
		case 26150:
		case 26152:
		case 26156:
		case 26151:
		case 26155:
		case 26153:
		case 26154:
		case 26157:
		case 26142:
		case 26140:
		case 26130:
		case 26131:
		case 26132:
		case 26129:
		case 26127:
		case 26128:
		case 26141:
		case 26133:
		case 26135:
		case 26139:
		case 26134:
		case 26138:
		case 26136:
		case 26137:
		case 26126:
		case 26158:
		case 26160:
		case 26181:
		case 26182:
		case 26183:
		case 26180:
		case 26178:
		case 26179:
		case 26177:
		case 26184:
		case 26186:
		case 26190:
		case 26185:
		case 26189:
		case 26187:
		case 26188:
		case 26159:
		case 26176:
		case 26174:
		case 26164:
		case 26165:
		case 26166:
		case 26163:
		case 26161:
		case 26162:
		case 26175:
		case 26167:
		case 26169:
		case 26173:
		case 26168:
		case 26172:
		case 26170:
		case 26171:
		case 26057:
		case 26125:
		case 26123:
		case 26079:
		case 26080:
		case 26081:
		case 26078:
		case 26076:
		case 26077:
		case 26075:
		case 26082:
		case 26084:
		case 26088:
		case 26083:
		case 26087:
		case 26085:
		case 26086:
		case 26089:
		case 26074:
		case 26072:
		case 26062:
		case 26063:
		case 26064:
		case 26061:
		case 26059:
		case 26060:
		case 26073:
		case 26065:
		case 26067:
		case 26071:
		case 26066:
		case 26070:
		case 26068:
		case 26069:
		case 26124:
		case 26090:
		case 26092:
		case 26113:
		case 26114:
		case 26115:
		case 26112:
		case 26110:
		case 26111:
		case 26109:
		case 26116:
		case 26118:
		case 26122:
		case 26117:
		case 26121:
		case 26119:
		case 26120:
		case 26091:
		case 26108:
		case 26106:
		case 26096:
		case 26097:
		case 26098:
		case 26095:
		case 26093:
		case 26094:
		case 26107:
		case 26099:
		case 26101:
		case 26105:
		case 26100:
		case 26104:
		case 26102:
		case 26103:
		case 26191:
		case 25921:
		case 25919:
		case 25739:
		case 25740:
		case 25741:
		case 25738:
		case 25736:
		case 25737:
		case 25735:
		case 25742:
		case 25744:
		case 25748:
		case 25743:
		case 25747:
		case 25745:
		case 25746:
		case 25749:
		case 25734:
		case 25732:
		case 25722:
		case 25723:
		case 25724:
		case 25721:
		case 25719:
		case 25720:
		case 25733:
		case 25725:
		case 25727:
		case 25731:
		case 25726:
		case 25730:
		case 25728:
		case 25729:
		case 25718:
		case 25750:
		case 25752:
		case 25773:
		case 25774:
		case 25775:
		case 25772:
		case 25770:
		case 25771:
		case 25769:
		case 25776:
		case 25778:
		case 25782:
		case 25777:
		case 25781:
		case 25779:
		case 25780:
		case 25751:
		case 25768:
		case 25766:
		case 25756:
		case 25757:
		case 25758:
		case 25755:
		case 25753:
		case 25754:
		case 25767:
		case 25759:
		case 25761:
		case 25765:
		case 25760:
		case 25764:
		case 25762:
		case 25763:
		case 25783:
		case 25717:
		case 25715:
		case 25671:
		case 25672:
		case 25673:
		case 25670:
		case 25668:
		case 25669:
		case 25667:
		case 25674:
		case 25676:
		case 25680:
		case 25675:
		case 25679:
		case 25677:
		case 25678:
		case 25681:
		case 25666:
		case 25664:
		case 25654:
		case 25655:
		case 25656:
		case 25653:
		case 25651:
		case 27823:
		case 25665:
		case 25657:
		case 25659:
		case 25663:
		case 25658:
		case 25662:
		case 25660:
		case 25661:
		case 25716:
		case 25682:
		case 25684:
		case 25705:
		case 25706:
		case 25707:
		case 25704:
		case 25702:
		case 25703:
		case 25701:
		case 25708:
		case 25710:
		case 25714:
		case 25709:
		case 25713:
		case 25711:
		case 25712:
		case 25683:
		case 25700:
		case 25698:
		case 25688:
		case 25689:
		case 25690:
		case 25687:
		case 25685:
		case 25686:
		case 25699:
		case 25691:
		case 25693:
		case 25697:
		case 25692:
		case 25696:
		case 25694:
		case 25695:
		case 25920:
		case 25784:
		case 25786:
		case 25875:
		case 25876:
		case 25877:
		case 25874:
		case 25872:
		case 25873:
		case 25871:
		case 25878:
		case 25880:
		case 25884:
		case 25879:
		case 25883:
		case 25881:
		case 25882:
		case 25885:
		case 25870:
		case 25868:
		case 25858:
		case 25859:
		case 25860:
		case 25857:
		case 25855:
		case 25856:
		case 25869:
		case 25861:
		case 25863:
		case 25867:
		case 25862:
		case 25866:
		case 25864:
		case 25865:
		case 25854:
		case 25886:
		case 25888:
		case 25909:
		case 25910:
		case 25911:
		case 25908:
		case 25906:
		case 25907:
		case 25905:
		case 25912:
		case 25914:
		case 25918:
		case 25913:
		case 25917:
		case 25915:
		case 25916:
		case 25887:
		case 25904:
		case 25902:
		case 25892:
		case 25893:
		case 25894:
		case 25891:
		case 25889:
		case 25890:
		case 25903:
		case 25895:
		case 25897:
		case 25901:
		case 25896:
		case 25900:
		case 25898:
		case 25899:
		case 25785:
		case 25853:
		case 25851:
		case 25807:
		case 25808:
		case 25809:
		case 25806:
		case 25804:
		case 25805:
		case 25803:
		case 25810:
		case 25812:
		case 25816:
		case 25811:
		case 25815:
		case 25813:
		case 25814:
		case 25817:
		case 25802:
		case 25800:
		case 25790:
		case 25791:
		case 25792:
		case 25789:
		case 25787:
		case 25788:
		case 25801:
		case 25793:
		case 25795:
		case 25799:
		case 25794:
		case 25798:
		case 25796:
		case 25797:
		case 25852:
		case 25818:
		case 25820:
		case 25841:
		case 25842:
		case 25843:
		case 25840:
		case 25838:
		case 25839:
		case 25837:
		case 25844:
		case 25846:
		case 25850:
		case 25845:
		case 25849:
		case 25847:
		case 25848:
		case 25819:
		case 25836:
		case 25834:
		case 25824:
		case 25825:
		case 25826:
		case 25823:
		case 25821:
		case 25822:
		case 25835:
		case 25827:
		case 25829:
		case 25833:
		case 25828:
		case 25832:
		case 25830:
		case 25831:
		case 26736:
		case 26192:
		case 26194:
		case 26555:
		case 26556:
		case 26557:
		case 26554:
		case 26552:
		case 26553:
		case 26551:
		case 26558:
		case 26560:
		case 26564:
		case 26559:
		case 26563:
		case 26561:
		case 26562:
		case 26565:
		case 26550:
		case 26548:
		case 26538:
		case 26539:
		case 26540:
		case 26537:
		case 26535:
		case 26536:
		case 26549:
		case 26541:
		case 26543:
		case 26547:
		case 26542:
		case 26546:
		case 26544:
		case 26545:
		case 26534:
		case 26566:
		case 26568:
		case 26589:
		case 26590:
		case 26591:
		case 26588:
		case 26586:
		case 26587:
		case 26585:
		case 26592:
		case 26594:
		case 26598:
		case 26593:
		case 26597:
		case 26595:
		case 26596:
		case 26567:
		case 26584:
		case 26582:
		case 26572:
		case 26573:
		case 26574:
		case 26571:
		case 26569:
		case 26570:
		case 26583:
		case 26575:
		case 26577:
		case 26581:
		case 26576:
		case 26580:
		case 26578:
		case 26579:
		case 26599:
		case 26533:
		case 26531:
		case 26487:
		case 26488:
		case 26489:
		case 26486:
		case 26484:
		case 26485:
		case 26483:
		case 26490:
		case 26492:
		case 26496:
		case 26491:
		case 26495:
		case 26493:
		case 26494:
		case 26497:
		case 26482:
		case 26480:
		case 26470:
		case 26471:
		case 26472:
		case 26469:
		case 26467:
		case 26468:
		case 26481:
		case 26473:
		case 26475:
		case 26479:
		case 26474:
		case 26478:
		case 26476:
		case 26477:
		case 26532:
		case 26498:
		case 26500:
		case 26521:
		case 26522:
		case 26523:
		case 26520:
		case 26518:
		case 26519:
		case 26517:
		case 26524:
		case 26526:
		case 26530:
		case 26525:
		case 26529:
		case 26527:
		case 26528:
		case 26499:
		case 26516:
		case 26514:
		case 26504:
		case 26505:
		case 26506:
		case 26503:
		case 26501:
		case 26502:
		case 26515:
		case 26507:
		case 26509:
		case 26513:
		case 26508:
		case 26512:
		case 26510:
		case 26511:
		case 26466:
		case 26600:
		case 26602:
		case 26691:
		case 26692:
		case 26693:
		case 26690:
		case 26688:
		case 26689:
		case 26687:
		case 26694:
		case 26696:
		case 26700:
		case 26695:
		case 26699:
		case 26697:
		case 26698:
		case 26701:
		case 26686:
		case 26684:
		case 26674:
		case 26675:
		case 26676:
		case 26673:
		case 26671:
		case 26672:
		case 26685:
		case 26677:
		case 26679:
		case 26683:
		case 26678:
		case 26682:
		case 26680:
		case 26681:
		case 26670:
		case 26702:
		case 26704:
		case 26725:
		case 26726:
		case 26727:
		case 26724:
		case 26722:
		case 26723:
		case 26721:
		case 26728:
		case 26730:
		case 26734:
		case 26729:
		case 26733:
		case 26731:
		case 26732:
		case 26703:
		case 26720:
		case 26718:
		case 26708:
		case 26709:
		case 26710:
		case 26707:
		case 26705:
		case 26706:
		case 26719:
		case 26711:
		case 26713:
		case 26717:
		case 26712:
		case 26716:
		case 26714:
		case 26715:
		case 26601:
		case 26669:
		case 26667:
		case 26623:
		case 26624:
		case 26625:
		case 26622:
		case 26620:
		case 26621:
		case 26619:
		case 26626:
		case 26628:
		case 26632:
		case 26627:
		case 26631:
		case 26629:
		case 26630:
		case 26633:
		case 26618:
		case 26616:
		case 26606:
		case 26607:
		case 26608:
		case 26605:
		case 26603:
		case 26604:
		case 26617:
		case 26609:
		case 26611:
		case 26615:
		case 26610:
		case 26614:
		case 26612:
		case 26613:
		case 26668:
		case 26634:
		case 26636:
		case 26657:
		case 26658:
		case 26659:
		case 26656:
		case 26654:
		case 26655:
		case 26653:
		case 26660:
		case 26662:
		case 26666:
		case 26661:
		case 26665:
		case 26663:
		case 26664:
		case 26635:
		case 26652:
		case 26650:
		case 26640:
		case 26641:
		case 26642:
		case 26639:
		case 26637:
		case 26638:
		case 26651:
		case 26643:
		case 26645:
		case 26649:
		case 26644:
		case 26648:
		case 26646:
		case 26647:
		case 26193:
		case 26465:
		case 26463:
		case 26283:
		case 26284:
		case 26285:
		case 26282:
		case 26280:
		case 26281:
		case 26279:
		case 26286:
		case 26288:
		case 26292:
		case 26287:
		case 26291:
		case 26289:
		case 26290:
		case 26293:
		case 26278:
		case 26276:
		case 26266:
		case 26267:
		case 26268:
		case 26265:
		case 26263:
		case 26264:
		case 26277:
		case 26269:
		case 26271:
		case 26275:
		case 26270:
		case 26274:
		case 26272:
		case 26273:
		case 26262:
		case 26294:
		case 26296:
		case 26317:
		case 26318:
		case 26319:
		case 26316:
		case 26314:
		case 26315:
		case 26313:
		case 26320:
		case 26322:
		case 26326:
		case 26321:
		case 26325:
		case 26323:
		case 26324:
		case 26295:
		case 26312:
		case 26310:
		case 26300:
		case 26301:
		case 26302:
		case 26299:
		case 26297:
		case 26298:
		case 26311:
		case 26303:
		case 26305:
		case 26309:
		case 26304:
		case 26308:
		case 26306:
		case 26307:
		case 26327:
		case 26261:
		case 26259:
		case 26215:
		case 26216:
		case 26217:
		case 26214:
		case 26212:
		case 26213:
		case 26211:
		case 26218:
		case 26220:
		case 26224:
		case 26219:
		case 26223:
		case 26221:
		case 26222:
		case 26225:
		case 26210:
		case 26208:
		case 26198:
		case 26199:
		case 26200:
		case 26197:
		case 26195:
		case 26196:
		case 26209:
		case 26201:
		case 26203:
		case 26207:
		case 26202:
		case 26206:
		case 26204:
		case 26205:
		case 26260:
		case 26226:
		case 26228:
		case 26249:
		case 26250:
		case 26251:
		case 26248:
		case 26246:
		case 26247:
		case 26245:
		case 26252:
		case 26254:
		case 26258:
		case 26253:
		case 26257:
		case 26255:
		case 26256:
		case 26227:
		case 26244:
		case 26242:
		case 26232:
		case 26233:
		case 26234:
		case 26231:
		case 26229:
		case 26230:
		case 26243:
		case 26235:
		case 26237:
		case 26241:
		case 26236:
		case 26240:
		case 26238:
		case 26239:
		case 26464:
		case 26328:
		case 26330:
		case 26419:
		case 26420:
		case 26421:
		case 26418:
		case 26416:
		case 26417:
		case 26415:
		case 26422:
		case 26424:
		case 26428:
		case 26423:
		case 26427:
		case 26425:
		case 26426:
		case 26429:
		case 26414:
		case 26412:
		case 26402:
		case 26403:
		case 26404:
		case 26401:
		case 26399:
		case 26400:
		case 26413:
		case 26405:
		case 26407:
		case 26411:
		case 26406:
		case 26410:
		case 26408:
		case 26409:
		case 26398:
		case 26430:
		case 26432:
		case 26453:
		case 26454:
		case 26455:
		case 26452:
		case 26450:
		case 26451:
		case 26449:
		case 26456:
		case 26458:
		case 26462:
		case 26457:
		case 26461:
		case 26459:
		case 26460:
		case 26431:
		case 26448:
		case 26446:
		case 26436:
		case 26437:
		case 26438:
		case 26435:
		case 26433:
		case 26434:
		case 26447:
		case 26439:
		case 26441:
		case 26445:
		case 26440:
		case 26444:
		case 26442:
		case 26443:
		case 26329:
		case 26397:
		case 26395:
		case 26351:
		case 26352:
		case 26353:
		case 26350:
		case 26348:
		case 26349:
		case 26347:
		case 26354:
		case 26356:
		case 26360:
		case 26355:
		case 26359:
		case 26357:
		case 26358:
		case 26361:
		case 26346:
		case 26344:
		case 26334:
		case 26335:
		case 26336:
		case 26333:
		case 26331:
		case 26332:
		case 26345:
		case 26337:
		case 26339:
		case 26343:
		case 26338:
		case 26342:
		case 26340:
		case 26341:
		case 26396:
		case 26362:
		case 26364:
		case 26385:
		case 26386:
		case 26387:
		case 26384:
		case 26382:
		case 26383:
		case 26381:
		case 26388:
		case 26390:
		case 26394:
		case 26389:
		case 26393:
		case 26391:
		case 26392:
		case 26363:
		case 26380:
		case 26378:
		case 26368:
		case 26369:
		case 26370:
		case 26367:
		case 26365:
		case 26366:
		case 26379:
		case 26371:
		case 26373:
		case 26377:
		case 26372:
		case 26376:
		case 26374:
		case 26375:
		case 27824:
		case 29997:
		case 27826:
		case 29275:
		case 29276:
		case 29277:
		case 29274:
		case 29272:
		case 29273:
		case 29271:
		case 29278:
		case 29280:
		case 29284:
		case 29279:
		case 29283:
		case 29281:
		case 29282:
		case 29285:
		case 29270:
		case 29268:
		case 29258:
		case 29259:
		case 29260:
		case 29257:
		case 29255:
		case 29256:
		case 29269:
		case 29261:
		case 29263:
		case 29267:
		case 29262:
		case 29266:
		case 29264:
		case 29265:
		case 29254:
		case 29286:
		case 29288:
		case 29309:
		case 29310:
		case 29311:
		case 29308:
		case 29306:
		case 29307:
		case 29305:
		case 29312:
		case 29314:
		case 29318:
		case 29313:
		case 29317:
		case 29315:
		case 29316:
		case 29287:
		case 29304:
		case 29302:
		case 29292:
		case 29293:
		case 29294:
		case 29291:
		case 29289:
		case 29290:
		case 29303:
		case 29295:
		case 29297:
		case 29301:
		case 29296:
		case 29300:
		case 29298:
		case 29299:
		case 29319:
		case 29253:
		case 29251:
		case 29207:
		case 29208:
		case 29209:
		case 29206:
		case 29204:
		case 29205:
		case 29203:
		case 29210:
		case 29212:
		case 29216:
		case 29211:
		case 29215:
		case 29213:
		case 29214:
		case 29217:
		case 29202:
		case 29200:
		case 29190:
		case 29191:
		case 29192:
		case 29189:
		case 29187:
		case 29188:
		case 29201:
		case 29193:
		case 29195:
		case 29199:
		case 29194:
		case 29198:
		case 29196:
		case 29197:
		case 29252:
		case 29218:
		case 29220:
		case 29241:
		case 29242:
		case 29243:
		case 29240:
		case 29238:
		case 29239:
		case 29237:
		case 29244:
		case 29246:
		case 29250:
		case 29245:
		case 29249:
		case 29247:
		case 29248:
		case 29219:
		case 29236:
		case 29234:
		case 29224:
		case 29225:
		case 29226:
		case 29223:
		case 29221:
		case 29222:
		case 29235:
		case 29227:
		case 29229:
		case 29233:
		case 29228:
		case 29232:
		case 29230:
		case 29231:
		case 29186:
		case 29320:
		case 29322:
		case 29411:
		case 29412:
		case 29413:
		case 29410:
		case 29408:
		case 29409:
		case 29407:
		case 29414:
		case 29416:
		case 29420:
		case 29415:
		case 29419:
		case 29417:
		case 29418:
		case 29421:
		case 29406:
		case 29404:
		case 29394:
		case 29395:
		case 29396:
		case 29393:
		case 29391:
		case 29392:
		case 29405:
		case 29397:
		case 29399:
		case 29403:
		case 29398:
		case 29402:
		case 29400:
		case 29401:
		case 29390:
		case 29422:
		case 29424:
		case 29445:
		case 29446:
		case 29447:
		case 29444:
		case 29442:
		case 29443:
		case 29441:
		case 29448:
		case 29450:
		case 29454:
		case 29449:
		case 29453:
		case 29451:
		case 29452:
		case 29423:
		case 29440:
		case 29438:
		case 29428:
		case 29429:
		case 29430:
		case 29427:
		case 29425:
		case 29426:
		case 29439:
		case 29431:
		case 29433:
		case 29437:
		case 29432:
		case 29436:
		case 29434:
		case 29435:
		case 29321:
		case 29389:
		case 29387:
		case 29343:
		case 29344:
		case 29345:
		case 29342:
		case 29340:
		case 29341:
		case 29339:
		case 29346:
		case 29348:
		case 29352:
		case 29347:
		case 29351:
		case 29349:
		case 29350:
		case 29353:
		case 29338:
		case 29336:
		case 29326:
		case 29327:
		case 29328:
		case 29325:
		case 29323:
		case 29324:
		case 29337:
		case 29329:
		case 29331:
		case 29335:
		case 29330:
		case 29334:
		case 29332:
		case 29333:
		case 29388:
		case 29354:
		case 29356:
		case 29377:
		case 29378:
		case 29379:
		case 29376:
		case 29374:
		case 29375:
		case 29373:
		case 29380:
		case 29382:
		case 29386:
		case 29381:
		case 29385:
		case 29383:
		case 29384:
		case 29355:
		case 29372:
		case 29370:
		case 29360:
		case 29361:
		case 29362:
		case 29359:
		case 29357:
		case 29358:
		case 29371:
		case 29363:
		case 29365:
		case 29369:
		case 29364:
		case 29368:
		case 29366:
		case 29367:
		case 29455:
		case 29185:
		case 29183:
		case 29003:
		case 29004:
		case 29005:
		case 29002:
		case 29000:
		case 29001:
		case 28999:
		case 29006:
		case 29008:
		case 29012:
		case 29007:
		case 29011:
		case 29009:
		case 29010:
		case 29013:
		case 28998:
		case 28996:
		case 28986:
		case 28987:
		case 28988:
		case 28985:
		case 28983:
		case 28984:
		case 28997:
		case 28989:
		case 28991:
		case 28995:
		case 28990:
		case 28994:
		case 28992:
		case 28993:
		case 28982:
		case 29014:
		case 29016:
		case 29037:
		case 29038:
		case 29039:
		case 29036:
		case 29034:
		case 29035:
		case 29033:
		case 29040:
		case 29042:
		case 29046:
		case 29041:
		case 29045:
		case 29043:
		case 29044:
		case 29015:
		case 29032:
		case 29030:
		case 29020:
		case 29021:
		case 29022:
		case 29019:
		case 29017:
		case 29018:
		case 29031:
		case 29023:
		case 29025:
		case 29029:
		case 29024:
		case 29028:
		case 29026:
		case 29027:
		case 29047:
		case 28981:
		case 28979:
		case 28935:
		case 28936:
		case 28937:
		case 28934:
		case 28932:
		case 28933:
		case 28931:
		case 28938:
		case 28940:
		case 28944:
		case 28939:
		case 28943:
		case 28941:
		case 28942:
		case 28945:
		case 28930:
		case 28928:
		case 28918:
		case 28919:
		case 28920:
		case 28917:
		case 28915:
		case 28916:
		case 28929:
		case 28921:
		case 28923:
		case 28927:
		case 28922:
		case 28926:
		case 28924:
		case 28925:
		case 28980:
		case 28946:
		case 28948:
		case 28969:
		case 28970:
		case 28971:
		case 28968:
		case 28966:
		case 28967:
		case 28965:
		case 28972:
		case 28974:
		case 28978:
		case 28973:
		case 28977:
		case 28975:
		case 28976:
		case 28947:
		case 28964:
		case 28962:
		case 28952:
		case 28953:
		case 28954:
		case 28951:
		case 28949:
		case 28950:
		case 28963:
		case 28955:
		case 28957:
		case 28961:
		case 28956:
		case 28960:
		case 28958:
		case 28959:
		case 29184:
		case 29048:
		case 29050:
		case 29139:
		case 29140:
		case 29141:
		case 29138:
		case 29136:
		case 29137:
		case 29135:
		case 29142:
		case 29144:
		case 29148:
		case 29143:
		case 29147:
		case 29145:
		case 29146:
		case 29149:
		case 29134:
		case 29132:
		case 29122:
		case 29123:
		case 29124:
		case 29121:
		case 29119:
		case 29120:
		case 29133:
		case 29125:
		case 29127:
		case 29131:
		case 29126:
		case 29130:
		case 29128:
		case 29129:
		case 29118:
		case 29150:
		case 29152:
		case 29173:
		case 29174:
		case 29175:
		case 29172:
		case 29170:
		case 29171:
		case 29169:
		case 29176:
		case 29178:
		case 29182:
		case 29177:
		case 29181:
		case 29179:
		case 29180:
		case 29151:
		case 29168:
		case 29166:
		case 29156:
		case 29157:
		case 29158:
		case 29155:
		case 29153:
		case 29154:
		case 29167:
		case 29159:
		case 29161:
		case 29165:
		case 29160:
		case 29164:
		case 29162:
		case 29163:
		case 29049:
		case 29117:
		case 29115:
		case 29071:
		case 29072:
		case 29073:
		case 29070:
		case 29068:
		case 29069:
		case 29067:
		case 29074:
		case 29076:
		case 29080:
		case 29075:
		case 29079:
		case 29077:
		case 29078:
		case 29081:
		case 29066:
		case 29064:
		case 29054:
		case 29055:
		case 29056:
		case 29053:
		case 29051:
		case 29052:
		case 29065:
		case 29057:
		case 29059:
		case 29063:
		case 29058:
		case 29062:
		case 29060:
		case 29061:
		case 29116:
		case 29082:
		case 29084:
		case 29105:
		case 29106:
		case 29107:
		case 29104:
		case 29102:
		case 29103:
		case 29101:
		case 29108:
		case 29110:
		case 29114:
		case 29109:
		case 29113:
		case 29111:
		case 29112:
		case 29083:
		case 29100:
		case 29098:
		case 29088:
		case 29089:
		case 29090:
		case 29087:
		case 29085:
		case 29086:
		case 29099:
		case 29091:
		case 29093:
		case 29097:
		case 29092:
		case 29096:
		case 29094:
		case 29095:
		case 28914:
		case 29456:
		case 29458:
		case 29819:
		case 29820:
		case 29821:
		case 29818:
		case 29816:
		case 29817:
		case 29815:
		case 29822:
		case 29824:
		case 29828:
		case 29823:
		case 29827:
		case 29825:
		case 29826:
		case 29829:
		case 29814:
		case 29812:
		case 29802:
		case 29803:
		case 29804:
		case 29801:
		case 29799:
		case 29800:
		case 29813:
		case 29805:
		case 29807:
		case 29811:
		case 29806:
		case 29810:
		case 29808:
		case 29809:
		case 29798:
		case 29830:
		case 29832:
		case 29853:
		case 29854:
		case 29855:
		case 29852:
		case 29850:
		case 29851:
		case 29849:
		case 29856:
		case 29858:
		case 29862:
		case 29857:
		case 29861:
		case 29859:
		case 29860:
		case 29831:
		case 29848:
		case 29846:
		case 29836:
		case 29837:
		case 29838:
		case 29835:
		case 29833:
		case 29834:
		case 29847:
		case 29839:
		case 29841:
		case 29845:
		case 29840:
		case 29844:
		case 29842:
		case 29843:
		case 29863:
		case 29797:
		case 29795:
		case 29751:
		case 29752:
		case 29753:
		case 29750:
		case 29748:
		case 29749:
		case 29747:
		case 29754:
		case 29756:
		case 29760:
		case 29755:
		case 29759:
		case 29757:
		case 29758:
		case 29761:
		case 29746:
		case 29744:
		case 29734:
		case 29735:
		case 29736:
		case 29733:
		case 29731:
		case 29732:
		case 29745:
		case 29737:
		case 29739:
		case 29743:
		case 29738:
		case 29742:
		case 29740:
		case 29741:
		case 29796:
		case 29762:
		case 29764:
		case 29785:
		case 29786:
		case 29787:
		case 29784:
		case 29782:
		case 29783:
		case 29781:
		case 29788:
		case 29790:
		case 29794:
		case 29789:
		case 29793:
		case 29791:
		case 29792:
		case 29763:
		case 29780:
		case 29778:
		case 29768:
		case 29769:
		case 29770:
		case 29767:
		case 29765:
		case 29766:
		case 29779:
		case 29771:
		case 29773:
		case 29777:
		case 29772:
		case 29776:
		case 29774:
		case 29775:
		case 29730:
		case 29864:
		case 29866:
		case 29955:
		case 29956:
		case 29957:
		case 29954:
		case 29952:
		case 29953:
		case 29951:
		case 29958:
		case 29960:
		case 29964:
		case 29959:
		case 29963:
		case 29961:
		case 29962:
		case 29965:
		case 29950:
		case 29948:
		case 29938:
		case 29939:
		case 29940:
		case 29937:
		case 29935:
		case 29936:
		case 29949:
		case 29941:
		case 29943:
		case 29947:
		case 29942:
		case 29946:
		case 29944:
		case 29945:
		case 29934:
		case 29966:
		case 29968:
		case 29989:
		case 29990:
		case 29991:
		case 29988:
		case 29986:
		case 29987:
		case 29985:
		case 29992:
		case 29994:
		case 29998:
		case 29993:
		case 25650:
		case 29995:
		case 29996:
		case 29967:
		case 29984:
		case 29982:
		case 29972:
		case 29973:
		case 29974:
		case 29971:
		case 29969:
		case 29970:
		case 29983:
		case 29975:
		case 29977:
		case 29981:
		case 29976:
		case 29980:
		case 29978:
		case 29979:
		case 29865:
		case 29933:
		case 29931:
		case 29887:
		case 29888:
		case 29889:
		case 29886:
		case 29884:
		case 29885:
		case 29883:
		case 29890:
		case 29892:
		case 29896:
		case 29891:
		case 29895:
		case 29893:
		case 29894:
		case 29897:
		case 29882:
		case 29880:
		case 29870:
		case 29871:
		case 29872:
		case 29869:
		case 29867:
		case 29868:
		case 29881:
		case 29873:
		case 29875:
		case 29879:
		case 29874:
		case 29878:
		case 29876:
		case 29877:
		case 29932:
		case 29898:
		case 29900:
		case 29921:
		case 29922:
		case 29923:
		case 29920:
		case 29918:
		case 29919:
		case 29917:
		case 29924:
		case 29926:
		case 29930:
		case 29925:
		case 29929:
		case 29927:
		case 29928:
		case 29899:
		case 29916:
		case 29914:
		case 29904:
		case 29905:
		case 29906:
		case 29903:
		case 29901:
		case 29902:
		case 29915:
		case 29907:
		case 29909:
		case 29913:
		case 29908:
		case 29912:
		case 29910:
		case 29911:
		case 29457:
		case 29729:
		case 29727:
		case 29547:
		case 29548:
		case 29549:
		case 29546:
		case 29544:
		case 29545:
		case 29543:
		case 29550:
		case 29552:
		case 29556:
		case 29551:
		case 29555:
		case 29553:
		case 29554:
		case 29557:
		case 29542:
		case 29540:
		case 29530:
		case 29531:
		case 29532:
		case 29529:
		case 29527:
		case 29528:
		case 29541:
		case 29533:
		case 29535:
		case 29539:
		case 29534:
		case 29538:
		case 29536:
		case 29537:
		case 29526:
		case 29558:
		case 29560:
		case 29581:
		case 29582:
		case 29583:
		case 29580:
		case 29578:
		case 29579:
		case 29577:
		case 29584:
		case 29586:
		case 29590:
		case 29585:
		case 29589:
		case 29587:
		case 29588:
		case 29559:
		case 29576:
		case 29574:
		case 29564:
		case 29565:
		case 29566:
		case 29563:
		case 29561:
		case 29562:
		case 29575:
		case 29567:
		case 29569:
		case 29573:
		case 29568:
		case 29572:
		case 29570:
		case 29571:
		case 29591:
		case 29525:
		case 29523:
		case 29479:
		case 29480:
		case 29481:
		case 29478:
		case 29476:
		case 29477:
		case 29475:
		case 29482:
		case 29484:
		case 29488:
		case 29483:
		case 29487:
		case 29485:
		case 29486:
		case 29489:
		case 29474:
		case 29472:
		case 29462:
		case 29463:
		case 29464:
		case 29461:
		case 29459:
		case 29460:
		case 29473:
		case 29465:
		case 29467:
		case 29471:
		case 29466:
		case 29470:
		case 29468:
		case 29469:
		case 29524:
		case 29490:
		case 29492:
		case 29513:
		case 29514:
		case 29515:
		case 29512:
		case 29510:
		case 29511:
		case 29509:
		case 29516:
		case 29518:
		case 29522:
		case 29517:
		case 29521:
		case 29519:
		case 29520:
		case 29491:
		case 29508:
		case 29506:
		case 29496:
		case 29497:
		case 29498:
		case 29495:
		case 29493:
		case 29494:
		case 29507:
		case 29499:
		case 29501:
		case 29505:
		case 29500:
		case 29504:
		case 29502:
		case 29503:
		case 29728:
		case 29592:
		case 29594:
		case 29683:
		case 29684:
		case 29685:
		case 29682:
		case 29680:
		case 29681:
		case 29679:
		case 29686:
		case 29688:
		case 29692:
		case 29687:
		case 29691:
		case 29689:
		case 29690:
		case 29693:
		case 29678:
		case 29676:
		case 29666:
		case 29667:
		case 29668:
		case 29665:
		case 29663:
		case 29664:
		case 29677:
		case 29669:
		case 29671:
		case 29675:
		case 29670:
		case 29674:
		case 29672:
		case 29673:
		case 29662:
		case 29694:
		case 29696:
		case 29717:
		case 29718:
		case 29719:
		case 29716:
		case 29714:
		case 29715:
		case 29713:
		case 29720:
		case 29722:
		case 29726:
		case 29721:
		case 29725:
		case 29723:
		case 29724:
		case 29695:
		case 29712:
		case 29710:
		case 29700:
		case 29701:
		case 29702:
		case 29699:
		case 29697:
		case 29698:
		case 29711:
		case 29703:
		case 29705:
		case 29709:
		case 29704:
		case 29708:
		case 29706:
		case 29707:
		case 29593:
		case 29661:
		case 29659:
		case 29615:
		case 29616:
		case 29617:
		case 29614:
		case 29612:
		case 29613:
		case 29611:
		case 29618:
		case 29620:
		case 29624:
		case 29619:
		case 29623:
		case 29621:
		case 29622:
		case 29625:
		case 29610:
		case 29608:
		case 29598:
		case 29599:
		case 29600:
		case 29597:
		case 29595:
		case 29596:
		case 29609:
		case 29601:
		case 29603:
		case 29607:
		case 29602:
		case 29606:
		case 29604:
		case 29605:
		case 29660:
		case 29626:
		case 29628:
		case 29649:
		case 29650:
		case 29651:
		case 29648:
		case 29646:
		case 29647:
		case 29645:
		case 29652:
		case 29654:
		case 29658:
		case 29653:
		case 29657:
		case 29655:
		case 29656:
		case 29627:
		case 29644:
		case 29642:
		case 29632:
		case 29633:
		case 29634:
		case 29631:
		case 29629:
		case 29630:
		case 29643:
		case 29635:
		case 29637:
		case 29641:
		case 29636:
		case 29640:
		case 29638:
		case 29639:
		case 27825:
		case 28913:
		case 28911:
		case 28187:
		case 28188:
		case 28189:
		case 28186:
		case 28184:
		case 28185:
		case 28183:
		case 28190:
		case 28192:
		case 28196:
		case 28191:
		case 28195:
		case 28193:
		case 28194:
		case 28197:
		case 28182:
		case 28180:
		case 28170:
		case 28171:
		case 28172:
		case 28169:
		case 28167:
		case 28168:
		case 28181:
		case 28173:
		case 28175:
		case 28179:
		case 28174:
		case 28178:
		case 28176:
		case 28177:
		case 28166:
		case 28198:
		case 28200:
		case 28221:
		case 28222:
		case 28223:
		case 28220:
		case 28218:
		case 28219:
		case 28217:
		case 28224:
		case 28226:
		case 28230:
		case 28225:
		case 28229:
		case 28227:
		case 28228:
		case 28199:
		case 28216:
		case 28214:
		case 28204:
		case 28205:
		case 28206:
		case 28203:
		case 28201:
		case 28202:
		case 28215:
		case 28207:
		case 28209:
		case 28213:
		case 28208:
		case 28212:
		case 28210:
		case 28211:
		case 28231:
		case 28165:
		case 28163:
		case 28119:
		case 28120:
		case 28121:
		case 28118:
		case 28116:
		case 28117:
		case 28115:
		case 28122:
		case 28124:
		case 28128:
		case 28123:
		case 28127:
		case 28125:
		case 28126:
		case 28129:
		case 28114:
		case 28112:
		case 28102:
		case 28103:
		case 28104:
		case 28101:
		case 28099:
		case 28100:
		case 28113:
		case 28105:
		case 28107:
		case 28111:
		case 28106:
		case 28110:
		case 28108:
		case 28109:
		case 28164:
		case 28130:
		case 28132:
		case 28153:
		case 28154:
		case 28155:
		case 28152:
		case 28150:
		case 28151:
		case 28149:
		case 28156:
		case 28158:
		case 28162:
		case 28157:
		case 28161:
		case 28159:
		case 28160:
		case 28131:
		case 28148:
		case 28146:
		case 28136:
		case 28137:
		case 28138:
		case 28135:
		case 28133:
		case 28134:
		case 28147:
		case 28139:
		case 28141:
		case 28145:
		case 28140:
		case 28144:
		case 28142:
		case 28143:
		case 28098:
		case 28232:
		case 28234:
		case 28323:
		case 28324:
		case 28325:
		case 28322:
		case 28320:
		case 28321:
		case 28319:
		case 28326:
		case 28328:
		case 28332:
		case 28327:
		case 28331:
		case 28329:
		case 28330:
		case 28333:
		case 28318:
		case 28316:
		case 28306:
		case 28307:
		case 28308:
		case 28305:
		case 28303:
		case 28304:
		case 28317:
		case 28309:
		case 28311:
		case 28315:
		case 28310:
		case 28314:
		case 28312:
		case 28313:
		case 28302:
		case 28334:
		case 28336:
		case 28357:
		case 28358:
		case 28359:
		case 28356:
		case 28354:
		case 28355:
		case 28353:
		case 28360:
		case 28362:
		case 28366:
		case 28361:
		case 28365:
		case 28363:
		case 28364:
		case 28335:
		case 28352:
		case 28350:
		case 28340:
		case 28341:
		case 28342:
		case 28339:
		case 28337:
		case 28338:
		case 28351:
		case 28343:
		case 28345:
		case 28349:
		case 28344:
		case 28348:
		case 28346:
		case 28347:
		case 28233:
		case 28301:
		case 28299:
		case 28255:
		case 28256:
		case 28257:
		case 28254:
		case 28252:
		case 28253:
		case 28251:
		case 28258:
		case 28260:
		case 28264:
		case 28259:
		case 28263:
		case 28261:
		case 28262:
		case 28265:
		case 28250:
		case 28248:
		case 28238:
		case 28239:
		case 28240:
		case 28237:
		case 28235:
		case 28236:
		case 28249:
		case 28241:
		case 28243:
		case 28247:
		case 28242:
		case 28246:
		case 28244:
		case 28245:
		case 28300:
		case 28266:
		case 28268:
		case 28289:
		case 28290:
		case 28291:
		case 28288:
		case 28286:
		case 28287:
		case 28285:
		case 28292:
		case 28294:
		case 28298:
		case 28293:
		case 28297:
		case 28295:
		case 28296:
		case 28267:
		case 28284:
		case 28282:
		case 28272:
		case 28273:
		case 28274:
		case 28271:
		case 28269:
		case 28270:
		case 28283:
		case 28275:
		case 28277:
		case 28281:
		case 28276:
		case 28280:
		case 28278:
		case 28279:
		case 28367:
		case 28097:
		case 28095:
		case 27915:
		case 27916:
		case 27917:
		case 27914:
		case 27912:
		case 27913:
		case 27911:
		case 27918:
		case 27920:
		case 27924:
		case 27919:
		case 27923:
		case 27921:
		case 27922:
		case 27925:
		case 27910:
		case 27908:
		case 27898:
		case 27899:
		case 27900:
		case 27897:
		case 27895:
		case 27896:
		case 27909:
		case 27901:
		case 27903:
		case 27907:
		case 27902:
		case 27906:
		case 27904:
		case 27905:
		case 27894:
		case 27926:
		case 27928:
		case 27949:
		case 27950:
		case 27951:
		case 27948:
		case 27946:
		case 27947:
		case 27945:
		case 27952:
		case 27954:
		case 27958:
		case 27953:
		case 27957:
		case 27955:
		case 27956:
		case 27927:
		case 27944:
		case 27942:
		case 27932:
		case 27933:
		case 27934:
		case 27931:
		case 27929:
		case 27930:
		case 27943:
		case 27935:
		case 27937:
		case 27941:
		case 27936:
		case 27940:
		case 27938:
		case 27939:
		case 27959:
		case 27893:
		case 27891:
		case 27847:
		case 27848:
		case 27849:
		case 27846:
		case 27844:
		case 27845:
		case 27843:
		case 27850:
		case 27852:
		case 27856:
		case 27851:
		case 27855:
		case 27853:
		case 27854:
		case 27857:
		case 27842:
		case 27840:
		case 27830:
		case 27831:
		case 27832:
		case 27829:
		case 27827:
		case 27828:
		case 27841:
		case 27833:
		case 27835:
		case 27839:
		case 27834:
		case 27838:
		case 27836:
		case 27837:
		case 27892:
		case 27858:
		case 27860:
		case 27881:
		case 27882:
		case 27883:
		case 27880:
		case 27878:
		case 27879:
		case 27877:
		case 27884:
		case 27886:
		case 27890:
		case 27885:
		case 27889:
		case 27887:
		case 27888:
		case 27859:
		case 27876:
		case 27874:
		case 27864:
		case 27865:
		case 27866:
		case 27863:
		case 27861:
		case 27862:
		case 27875:
		case 27867:
		case 27869:
		case 27873:
		case 27868:
		case 27872:
		case 27870:
		case 27871:
		case 28096:
		case 27960:
		case 27962:
		case 28051:
		case 28052:
		case 28053:
		case 28050:
		case 28048:
		case 28049:
		case 28047:
		case 28054:
		case 28056:
		case 28060:
		case 28055:
		case 28059:
		case 28057:
		case 28058:
		case 28061:
		case 28046:
		case 28044:
		case 28034:
		case 28035:
		case 28036:
		case 28033:
		case 28031:
		case 28032:
		case 28045:
		case 28037:
		case 28039:
		case 28043:
		case 28038:
		case 28042:
		case 28040:
		case 28041:
		case 28030:
		case 28062:
		case 28064:
		case 28085:
		case 28086:
		case 28087:
		case 28084:
		case 28082:
		case 28083:
		case 28081:
		case 28088:
		case 28090:
		case 28094:
		case 28089:
		case 28093:
		case 28091:
		case 28092:
		case 28063:
		case 28080:
		case 28078:
		case 28068:
		case 28069:
		case 28070:
		case 28067:
		case 28065:
		case 28066:
		case 28079:
		case 28071:
		case 28073:
		case 28077:
		case 28072:
		case 28076:
		case 28074:
		case 28075:
		case 27961:
		case 28029:
		case 28027:
		case 27983:
		case 27984:
		case 27985:
		case 27982:
		case 27980:
		case 27981:
		case 27979:
		case 27986:
		case 27988:
		case 27992:
		case 27987:
		case 27991:
		case 27989:
		case 27990:
		case 27993:
		case 27978:
		case 27976:
		case 27966:
		case 27967:
		case 27968:
		case 27965:
		case 27963:
		case 27964:
		case 27977:
		case 27969:
		case 27971:
		case 27975:
		case 27970:
		case 27974:
		case 27972:
		case 27973:
		case 28028:
		case 27994:
		case 27996:
		case 28017:
		case 28018:
		case 28019:
		case 28016:
		case 28014:
		case 28015:
		case 28013:
		case 28020:
		case 28022:
		case 28026:
		case 28021:
		case 28025:
		case 28023:
		case 28024:
		case 27995:
		case 28012:
		case 28010:
		case 28000:
		case 28001:
		case 28002:
		case 27999:
		case 27997:
		case 27998:
		case 28011:
		case 28003:
		case 28005:
		case 28009:
		case 28004:
		case 28008:
		case 28006:
		case 28007:
		case 28912:
		case 28368:
		case 28370:
		case 28731:
		case 28732:
		case 28733:
		case 28730:
		case 28728:
		case 28729:
		case 28727:
		case 28734:
		case 28736:
		case 28740:
		case 28735:
		case 28739:
		case 28737:
		case 28738:
		case 28741:
		case 28726:
		case 28724:
		case 28714:
		case 28715:
		case 28716:
		case 28713:
		case 28711:
		case 28712:
		case 28725:
		case 28717:
		case 28719:
		case 28723:
		case 28718:
		case 28722:
		case 28720:
		case 28721:
		case 28710:
		case 28742:
		case 28744:
		case 28765:
		case 28766:
		case 28767:
		case 28764:
		case 28762:
		case 28763:
		case 28761:
		case 28768:
		case 28770:
		case 28774:
		case 28769:
		case 28773:
		case 28771:
		case 28772:
		case 28743:
		case 28760:
		case 28758:
		case 28748:
		case 28749:
		case 28750:
		case 28747:
		case 28745:
		case 28746:
		case 28759:
		case 28751:
		case 28753:
		case 28757:
		case 28752:
		case 28756:
		case 28754:
		case 28755:
		case 28775:
		case 28709:
		case 28707:
		case 28663:
		case 28664:
		case 28665:
		case 28662:
		case 28660:
		case 28661:
		case 28659:
		case 28666:
		case 28668:
		case 28672:
		case 28667:
		case 28671:
		case 28669:
		case 28670:
		case 28673:
		case 28658:
		case 28656:
		case 28646:
		case 28647:
		case 28648:
		case 28645:
		case 28643:
		case 28644:
		case 28657:
		case 28649:
		case 28651:
		case 28655:
		case 28650:
		case 28654:
		case 28652:
		case 28653:
		case 28708:
		case 28674:
		case 28676:
		case 28697:
		case 28698:
		case 28699:
		case 28696:
		case 28694:
		case 28695:
		case 28693:
		case 28700:
		case 28702:
		case 28706:
		case 28701:
		case 28705:
		case 28703:
		case 28704:
		case 28675:
		case 28692:
		case 28690:
		case 28680:
		case 28681:
		case 28682:
		case 28679:
		case 28677:
		case 28678:
		case 28691:
		case 28683:
		case 28685:
		case 28689:
		case 28684:
		case 28688:
		case 28686:
		case 28687:
		case 28642:
		case 28776:
		case 28778:
		case 28867:
		case 28868:
		case 28869:
		case 28866:
		case 28864:
		case 28865:
		case 28863:
		case 28870:
		case 28872:
		case 28876:
		case 28871:
		case 28875:
		case 28873:
		case 28874:
		case 28877:
		case 28862:
		case 28860:
		case 28850:
		case 28851:
		case 28852:
		case 28849:
		case 28847:
		case 28848:
		case 28861:
		case 28853:
		case 28855:
		case 28859:
		case 28854:
		case 28858:
		case 28856:
		case 28857:
		case 28846:
		case 28878:
		case 28880:
		case 28901:
		case 28902:
		case 28903:
		case 28900:
		case 28898:
		case 28899:
		case 28897:
		case 28904:
		case 28906:
		case 28910:
		case 28905:
		case 28909:
		case 28907:
		case 28908:
		case 28879:
		case 28896:
		case 28894:
		case 28884:
		case 28885:
		case 28886:
		case 28883:
		case 28881:
		case 28882:
		case 28895:
		case 28887:
		case 28889:
		case 28893:
		case 28888:
		case 28892:
		case 28890:
		case 28891:
		case 28777:
		case 28845:
		case 28843:
		case 28799:
		case 28800:
		case 28801:
		case 28798:
		case 28796:
		case 28797:
		case 28795:
		case 28802:
		case 28804:
		case 28808:
		case 28803:
		case 28807:
		case 28805:
		case 28806:
		case 28809:
		case 28794:
		case 28792:
		case 28782:
		case 28783:
		case 28784:
		case 28781:
		case 28779:
		case 28780:
		case 28793:
		case 28785:
		case 28787:
		case 28791:
		case 28786:
		case 28790:
		case 28788:
		case 28789:
		case 28844:
		case 28810:
		case 28812:
		case 28833:
		case 28834:
		case 28835:
		case 28832:
		case 28830:
		case 28831:
		case 28829:
		case 28836:
		case 28838:
		case 28842:
		case 28837:
		case 28841:
		case 28839:
		case 28840:
		case 28811:
		case 28828:
		case 28826:
		case 28816:
		case 28817:
		case 28818:
		case 28815:
		case 28813:
		case 28814:
		case 28827:
		case 28819:
		case 28821:
		case 28825:
		case 28820:
		case 28824:
		case 28822:
		case 28823:
		case 28369:
		case 28641:
		case 28639:
		case 28459:
		case 28460:
		case 28461:
		case 28458:
		case 28456:
		case 28457:
		case 28455:
		case 28462:
		case 28464:
		case 28468:
		case 28463:
		case 28467:
		case 28465:
		case 28466:
		case 28469:
		case 28454:
		case 28452:
		case 28442:
		case 28443:
		case 28444:
		case 28441:
		case 28439:
		case 28440:
		case 28453:
		case 28445:
		case 28447:
		case 28451:
		case 28446:
		case 28450:
		case 28448:
		case 28449:
		case 28438:
		case 28470:
		case 28472:
		case 28493:
		case 28494:
		case 28495:
		case 28492:
		case 28490:
		case 28491:
		case 28489:
		case 28496:
		case 28498:
		case 28502:
		case 28497:
		case 28501:
		case 28499:
		case 28500:
		case 28471:
		case 28488:
		case 28486:
		case 28476:
		case 28477:
		case 28478:
		case 28475:
		case 28473:
		case 28474:
		case 28487:
		case 28479:
		case 28481:
		case 28485:
		case 28480:
		case 28484:
		case 28482:
		case 28483:
		case 28503:
		case 28437:
		case 28435:
		case 28391:
		case 28392:
		case 28393:
		case 28390:
		case 28388:
		case 28389:
		case 28387:
		case 28394:
		case 28396:
		case 28400:
		case 28395:
		case 28399:
		case 28397:
		case 28398:
		case 28401:
		case 28386:
		case 28384:
		case 28374:
		case 28375:
		case 28376:
		case 28373:
		case 28371:
		case 28372:
		case 28385:
		case 28377:
		case 28379:
		case 28383:
		case 28378:
		case 28382:
		case 28380:
		case 28381:
		case 28436:
		case 28402:
		case 28404:
		case 28425:
		case 28426:
		case 28427:
		case 28424:
		case 28422:
		case 28423:
		case 28421:
		case 28428:
		case 28430:
		case 28434:
		case 28429:
		case 28433:
		case 28431:
		case 28432:
		case 28403:
		case 28420:
		case 28418:
		case 28408:
		case 28409:
		case 28410:
		case 28407:
		case 28405:
		case 28406:
		case 28419:
		case 28411:
		case 28413:
		case 28417:
		case 28412:
		case 28416:
		case 28414:
		case 28415:
		case 28640:
		case 28504:
		case 28506:
		case 28595:
		case 28596:
		case 28597:
		case 28594:
		case 28592:
		case 28593:
		case 28591:
		case 28598:
		case 28600:
		case 28604:
		case 28599:
		case 28603:
		case 28601:
		case 28602:
		case 28605:
		case 28590:
		case 28588:
		case 28578:
		case 28579:
		case 28580:
		case 28577:
		case 28575:
		case 28576:
		case 28589:
		case 28581:
		case 28583:
		case 28587:
		case 28582:
		case 28586:
		case 28584:
		case 28585:
		case 28574:
		case 28606:
		case 28608:
		case 28629:
		case 28630:
		case 28631:
		case 28628:
		case 28626:
		case 28627:
		case 28625:
		case 28632:
		case 28634:
		case 28638:
		case 28633:
		case 28637:
		case 28635:
		case 28636:
		case 28607:
		case 28624:
		case 28622:
		case 28612:
		case 28613:
		case 28614:
		case 28611:
		case 28609:
		case 28610:
		case 28623:
		case 28615:
		case 28617:
		case 28621:
		case 28616:
		case 28620:
		case 28618:
		case 28619:
		case 28505:
		case 28573:
		case 28571:
		case 28527:
		case 28528:
		case 28529:
		case 28526:
		case 28524:
		case 28525:
		case 28523:
		case 28530:
		case 28532:
		case 28536:
		case 28531:
		case 28535:
		case 28533:
		case 28534:
		case 28537:
		case 28522:
		case 28520:
		case 28510:
		case 28511:
		case 28512:
		case 28509:
		case 28507:
		case 28508:
		case 28521:
		case 28513:
		case 28515:
		case 28519:
		case 28514:
		case 28518:
		case 28516:
		case 28517:
		case 28572:
		case 28538:
		case 28540:
		case 28561:
		case 28562:
		case 28563:
		case 28560:
		case 28558:
		case 28559:
		case 28557:
		case 28564:
		case 28566:
		case 28570:
		case 28565:
		case 28569:
		case 28567:
		case 28568:
		case 28539:
		case 28556:
		case 28554:
		case 28544:
		case 28545:
		case 28546:
		case 28543:
		case 28541:
		case 28542:
		case 28555:
		case 28547:
		case 28549:
		case 28553:
		case 28548:
		case 28552:
		case 28550:
		case 28551:
		case 25649:
		case 23475:
		case 25647:
		case 22747:
		case 22748:
		case 22749:
		case 22746:
		case 22744:
		case 22745:
		case 22743:
		case 22750:
		case 22752:
		case 22756:
		case 22751:
		case 22755:
		case 22753:
		case 22754:
		case 22757:
		case 22742:
		case 22740:
		case 22730:
		case 22731:
		case 22732:
		case 22729:
		case 22727:
		case 22728:
		case 22741:
		case 22733:
		case 22735:
		case 22739:
		case 22734:
		case 22738:
		case 22736:
		case 22737:
		case 22726:
		case 22758:
		case 22760:
		case 22781:
		case 22782:
		case 22783:
		case 22780:
		case 22778:
		case 22779:
		case 22777:
		case 22784:
		case 22786:
		case 22790:
		case 22785:
		case 22789:
		case 22787:
		case 22788:
		case 22759:
		case 22776:
		case 22774:
		case 22764:
		case 22765:
		case 22766:
		case 22763:
		case 22761:
		case 22762:
		case 22775:
		case 22767:
		case 22769:
		case 22773:
		case 22768:
		case 22772:
		case 22770:
		case 22771:
		case 22791:
		case 22725:
		case 22723:
		case 22679:
		case 22680:
		case 22681:
		case 22678:
		case 22676:
		case 22677:
		case 22675:
		case 22682:
		case 22684:
		case 22688:
		case 22683:
		case 22687:
		case 22685:
		case 22686:
		case 22689:
		case 22674:
		case 22672:
		case 22662:
		case 22663:
		case 22664:
		case 22661:
		case 22659:
		case 22660:
		case 22673:
		case 22665:
		case 22667:
		case 22671:
		case 22666:
		case 22670:
		case 22668:
		case 22669:
		case 22724:
		case 22690:
		case 22692:
		case 22713:
		case 22714:
		case 22715:
		case 22712:
		case 22710:
		case 22711:
		case 22709:
		case 22716:
		case 22718:
		case 22722:
		case 22717:
		case 22721:
		case 22719:
		case 22720:
		case 22691:
		case 22708:
		case 22706:
		case 22696:
		case 22697:
		case 22698:
		case 22695:
		case 22693:
		case 22694:
		case 22707:
		case 22699:
		case 22701:
		case 22705:
		case 22700:
		case 22704:
		case 22702:
		case 22703:
		case 22658:
		case 22792:
		case 22794:
		case 22883:
		case 22884:
		case 22885:
		case 22882:
		case 22880:
		case 22881:
		case 22879:
		case 22886:
		case 22888:
		case 22892:
		case 22887:
		case 22891:
		case 22889:
		case 22890:
		case 22893:
		case 22878:
		case 22876:
		case 22866:
		case 22867:
		case 22868:
		case 22865:
		case 22863:
		case 22864:
		case 22877:
		case 22869:
		case 22871:
		case 22875:
		case 22870:
		case 22874:
		case 22872:
		case 22873:
		case 22862:
		case 22894:
		case 22896:
		case 22917:
		case 22918:
		case 22919:
		case 22916:
		case 22914:
		case 22915:
		case 22913:
		case 22920:
		case 22922:
		case 22926:
		case 22921:
		case 22925:
		case 22923:
		case 22924:
		case 22895:
		case 22912:
		case 22910:
		case 22900:
		case 22901:
		case 22902:
		case 22899:
		case 22897:
		case 22898:
		case 22911:
		case 22903:
		case 22905:
		case 22909:
		case 22904:
		case 22908:
		case 22906:
		case 22907:
		case 22793:
		case 22861:
		case 22859:
		case 22815:
		case 22816:
		case 22817:
		case 22814:
		case 22812:
		case 22813:
		case 22811:
		case 22818:
		case 22820:
		case 22824:
		case 22819:
		case 22823:
		case 22821:
		case 22822:
		case 22825:
		case 22810:
		case 22808:
		case 22798:
		case 22799:
		case 22800:
		case 22797:
		case 22795:
		case 22796:
		case 22809:
		case 22801:
		case 22803:
		case 22807:
		case 22802:
		case 22806:
		case 22804:
		case 22805:
		case 22860:
		case 22826:
		case 22828:
		case 22849:
		case 22850:
		case 22851:
		case 22848:
		case 22846:
		case 22847:
		case 22845:
		case 22852:
		case 22854:
		case 22858:
		case 22853:
		case 22857:
		case 22855:
		case 22856:
		case 22827:
		case 22844:
		case 22842:
		case 22832:
		case 22833:
		case 22834:
		case 22831:
		case 22829:
		case 22830:
		case 22843:
		case 22835:
		case 22837:
		case 22841:
		case 22836:
		case 22840:
		case 22838:
		case 22839:
		case 22927:
		case 22657:
		case 22655:
		case 22475:
		case 22476:
		case 22477:
		case 22474:
		case 22472:
		case 22473:
		case 22471:
		case 22478:
		case 22480:
		case 22484:
		case 22479:
		case 22483:
		case 22481:
		case 22482:
		case 22485:
		case 22470:
		case 22468:
		case 22458:
		case 22459:
		case 22460:
		case 22457:
		case 22455:
		case 22456:
		case 22469:
		case 22461:
		case 22463:
		case 22467:
		case 22462:
		case 22466:
		case 22464:
		case 22465:
		case 22454:
		case 22486:
		case 22488:
		case 22509:
		case 22510:
		case 22511:
		case 22508:
		case 22506:
		case 22507:
		case 22505:
		case 22512:
		case 22514:
		case 22518:
		case 22513:
		case 22517:
		case 22515:
		case 22516:
		case 22487:
		case 22504:
		case 22502:
		case 22492:
		case 22493:
		case 22494:
		case 22491:
		case 22489:
		case 22490:
		case 22503:
		case 22495:
		case 22497:
		case 22501:
		case 22496:
		case 22500:
		case 22498:
		case 22499:
		case 22519:
		case 22453:
		case 22451:
		case 22407:
		case 22408:
		case 22409:
		case 22406:
		case 22404:
		case 22405:
		case 22403:
		case 22410:
		case 22412:
		case 22416:
		case 22411:
		case 22415:
		case 22413:
		case 22414:
		case 22417:
		case 22402:
		case 22400:
		case 22390:
		case 22391:
		case 22392:
		case 22389:
		case 22387:
		case 22388:
		case 22401:
		case 22393:
		case 22395:
		case 22399:
		case 22394:
		case 22398:
		case 22396:
		case 22397:
		case 22452:
		case 22418:
		case 22420:
		case 22441:
		case 22442:
		case 22443:
		case 22440:
		case 22438:
		case 22439:
		case 22437:
		case 22444:
		case 22446:
		case 22450:
		case 22445:
		case 22449:
		case 22447:
		case 22448:
		case 22419:
		case 22436:
		case 22434:
		case 22424:
		case 22425:
		case 22426:
		case 22423:
		case 22421:
		case 22422:
		case 22435:
		case 22427:
		case 22429:
		case 22433:
		case 22428:
		case 22432:
		case 22430:
		case 22431:
		case 22656:
		case 22520:
		case 22522:
		case 22611:
		case 22612:
		case 22613:
		case 22610:
		case 22608:
		case 22609:
		case 22607:
		case 22614:
		case 22616:
		case 22620:
		case 22615:
		case 22619:
		case 22617:
		case 22618:
		case 22621:
		case 22606:
		case 22604:
		case 22594:
		case 22595:
		case 22596:
		case 22593:
		case 22591:
		case 22592:
		case 22605:
		case 22597:
		case 22599:
		case 22603:
		case 22598:
		case 22602:
		case 22600:
		case 22601:
		case 22590:
		case 22622:
		case 22624:
		case 22645:
		case 22646:
		case 22647:
		case 22644:
		case 22642:
		case 22643:
		case 22641:
		case 22648:
		case 22650:
		case 22654:
		case 22649:
		case 22653:
		case 22651:
		case 22652:
		case 22623:
		case 22640:
		case 22638:
		case 22628:
		case 22629:
		case 22630:
		case 22627:
		case 22625:
		case 22626:
		case 22639:
		case 22631:
		case 22633:
		case 22637:
		case 22632:
		case 22636:
		case 22634:
		case 22635:
		case 22521:
		case 22589:
		case 22587:
		case 22543:
		case 22544:
		case 22545:
		case 22542:
		case 22540:
		case 22541:
		case 22539:
		case 22546:
		case 22548:
		case 22552:
		case 22547:
		case 22551:
		case 22549:
		case 22550:
		case 22553:
		case 22538:
		case 22536:
		case 22526:
		case 22527:
		case 22528:
		case 22525:
		case 22523:
		case 22524:
		case 22537:
		case 22529:
		case 22531:
		case 22535:
		case 22530:
		case 22534:
		case 22532:
		case 22533:
		case 22588:
		case 22554:
		case 22556:
		case 22577:
		case 22578:
		case 22579:
		case 22576:
		case 22574:
		case 22575:
		case 22573:
		case 22580:
		case 22582:
		case 22586:
		case 22581:
		case 22585:
		case 22583:
		case 22584:
		case 22555:
		case 22572:
		case 22570:
		case 22560:
		case 22561:
		case 22562:
		case 22559:
		case 22557:
		case 22558:
		case 22571:
		case 22563:
		case 22565:
		case 22569:
		case 22564:
		case 22568:
		case 22566:
		case 22567:
		case 22386:
		case 22928:
		case 22930:
		case 23291:
		case 23292:
		case 23293:
		case 23290:
		case 23288:
		case 23289:
		case 23287:
		case 23294:
		case 23296:
		case 23300:
		case 23295:
		case 23299:
		case 23297:
		case 23298:
		case 23301:
		case 23286:
		case 23284:
		case 23274:
		case 23275:
		case 23276:
		case 23273:
		case 23271:
		case 23272:
		case 23285:
		case 23277:
		case 23279:
		case 23283:
		case 23278:
		case 23282:
		case 23280:
		case 23281:
		case 23270:
		case 23302:
		case 23304:
		case 23325:
		case 23326:
		case 23327:
		case 23324:
		case 23322:
		case 23323:
		case 23321:
		case 23328:
		case 23330:
		case 23334:
		case 23329:
		case 23333:
		case 23331:
		case 23332:
		case 23303:
		case 23320:
		case 23318:
		case 23308:
		case 23309:
		case 23310:
		case 23307:
		case 23305:
		case 23306:
		case 23319:
		case 23311:
		case 23313:
		case 23317:
		case 23312:
		case 23316:
		case 23314:
		case 23315:
		case 23335:
		case 23269:
		case 23267:
		case 23223:
		case 23224:
		case 23225:
		case 23222:
		case 23220:
		case 23221:
		case 23219:
		case 23226:
		case 23228:
		case 23232:
		case 23227:
		case 23231:
		case 23229:
		case 23230:
		case 23233:
		case 23218:
		case 23216:
		case 23206:
		case 23207:
		case 23208:
		case 23205:
		case 23203:
		case 23204:
		case 23217:
		case 23209:
		case 23211:
		case 23215:
		case 23210:
		case 23214:
		case 23212:
		case 23213:
		case 23268:
		case 23234:
		case 23236:
		case 23257:
		case 23258:
		case 23259:
		case 23256:
		case 23254:
		case 23255:
		case 23253:
		case 23260:
		case 23262:
		case 23266:
		case 23261:
		case 23265:
		case 23263:
		case 23264:
		case 23235:
		case 23252:
		case 23250:
		case 23240:
		case 23241:
		case 23242:
		case 23239:
		case 23237:
		case 23238:
		case 23251:
		case 23243:
		case 23245:
		case 23249:
		case 23244:
		case 23248:
		case 23246:
		case 23247:
		case 23202:
		case 23336:
		case 23338:
		case 23427:
		case 23428:
		case 23429:
		case 23426:
		case 23424:
		case 23425:
		case 23423:
		case 23430:
		case 23432:
		case 23436:
		case 23431:
		case 23435:
		case 23433:
		case 23434:
		case 23437:
		case 23422:
		case 23420:
		case 23410:
		case 23411:
		case 23412:
		case 23409:
		case 23407:
		case 23408:
		case 23421:
		case 23413:
		case 23415:
		case 23419:
		case 23414:
		case 23418:
		case 23416:
		case 23417:
		case 23406:
		case 23438:
		case 23440:
		case 23461:
		case 23462:
		case 23463:
		case 23460:
		case 23458:
		case 23459:
		case 23457:
		case 23464:
		case 23466:
		case 23470:
		case 23465:
		case 23469:
		case 23467:
		case 23468:
		case 23439:
		case 23456:
		case 23454:
		case 23444:
		case 23445:
		case 23446:
		case 23443:
		case 23441:
		case 23442:
		case 23455:
		case 23447:
		case 23449:
		case 23453:
		case 23448:
		case 23452:
		case 23450:
		case 23451:
		case 23337:
		case 23405:
		case 23403:
		case 23359:
		case 23360:
		case 23361:
		case 23358:
		case 23356:
		case 23357:
		case 23355:
		case 23362:
		case 23364:
		case 23368:
		case 23363:
		case 23367:
		case 23365:
		case 23366:
		case 23369:
		case 23354:
		case 23352:
		case 23342:
		case 23343:
		case 23344:
		case 23341:
		case 23339:
		case 23340:
		case 23353:
		case 23345:
		case 23347:
		case 23351:
		case 23346:
		case 23350:
		case 23348:
		case 23349:
		case 23404:
		case 23370:
		case 23372:
		case 23393:
		case 23394:
		case 23395:
		case 23392:
		case 23390:
		case 23391:
		case 23389:
		case 23396:
		case 23398:
		case 23402:
		case 23397:
		case 23401:
		case 23399:
		case 23400:
		case 23371:
		case 23388:
		case 23386:
		case 23376:
		case 23377:
		case 23378:
		case 23375:
		case 23373:
		case 23374:
		case 23387:
		case 23379:
		case 23381:
		case 23385:
		case 23380:
		case 23384:
		case 23382:
		case 23383:
		case 22929:
		case 23201:
		case 23199:
		case 23019:
		case 23020:
		case 23021:
		case 23018:
		case 23016:
		case 23017:
		case 23015:
		case 23022:
		case 23024:
		case 23028:
		case 23023:
		case 23027:
		case 23025:
		case 23026:
		case 23029:
		case 23014:
		case 23012:
		case 23002:
		case 23003:
		case 23004:
		case 23001:
		case 22999:
		case 23000:
		case 23013:
		case 23005:
		case 23007:
		case 23011:
		case 23006:
		case 23010:
		case 23008:
		case 23009:
		case 22998:
		case 23030:
		case 23032:
		case 23053:
		case 23054:
		case 23055:
		case 23052:
		case 23050:
		case 23051:
		case 23049:
		case 23056:
		case 23058:
		case 23062:
		case 23057:
		case 23061:
		case 23059:
		case 23060:
		case 23031:
		case 23048:
		case 23046:
		case 23036:
		case 23037:
		case 23038:
		case 23035:
		case 23033:
		case 23034:
		case 23047:
		case 23039:
		case 23041:
		case 23045:
		case 23040:
		case 23044:
		case 23042:
		case 23043:
		case 23063:
		case 22997:
		case 22995:
		case 22951:
		case 22952:
		case 22953:
		case 22950:
		case 22948:
		case 22949:
		case 22947:
		case 22954:
		case 22956:
		case 22960:
		case 22955:
		case 22959:
		case 22957:
		case 22958:
		case 22961:
		case 22946:
		case 22944:
		case 22934:
		case 22935:
		case 22936:
		case 22933:
		case 22931:
		case 22932:
		case 22945:
		case 22937:
		case 22939:
		case 22943:
		case 22938:
		case 22942:
		case 22940:
		case 22941:
		case 22996:
		case 22962:
		case 22964:
		case 22985:
		case 22986:
		case 22987:
		case 22984:
		case 22982:
		case 22983:
		case 22981:
		case 22988:
		case 22990:
		case 22994:
		case 22989:
		case 22993:
		case 22991:
		case 22992:
		case 22963:
		case 22980:
		case 22978:
		case 22968:
		case 22969:
		case 22970:
		case 22967:
		case 22965:
		case 22966:
		case 22979:
		case 22971:
		case 22973:
		case 22977:
		case 22972:
		case 22976:
		case 22974:
		case 22975:
		case 23200:
		case 23064:
		case 23066:
		case 23155:
		case 23156:
		case 23157:
		case 23154:
		case 23152:
		case 23153:
		case 23151:
		case 23158:
		case 23160:
		case 23164:
		case 23159:
		case 23163:
		case 23161:
		case 23162:
		case 23165:
		case 23150:
		case 23148:
		case 23138:
		case 23139:
		case 23140:
		case 23137:
		case 23135:
		case 23136:
		case 23149:
		case 23141:
		case 23143:
		case 23147:
		case 23142:
		case 23146:
		case 23144:
		case 23145:
		case 23134:
		case 23166:
		case 23168:
		case 23189:
		case 23190:
		case 23191:
		case 23188:
		case 23186:
		case 23187:
		case 23185:
		case 23192:
		case 23194:
		case 23198:
		case 23193:
		case 23197:
		case 23195:
		case 23196:
		case 23167:
		case 23184:
		case 23182:
		case 23172:
		case 23173:
		case 23174:
		case 23171:
		case 23169:
		case 23170:
		case 23183:
		case 23175:
		case 23177:
		case 23181:
		case 23176:
		case 23180:
		case 23178:
		case 23179:
		case 23065:
		case 23133:
		case 23131:
		case 23087:
		case 23088:
		case 23089:
		case 23086:
		case 23084:
		case 23085:
		case 23083:
		case 23090:
		case 23092:
		case 23096:
		case 23091:
		case 23095:
		case 23093:
		case 23094:
		case 23097:
		case 23082:
		case 23080:
		case 23070:
		case 23071:
		case 23072:
		case 23069:
		case 23067:
		case 23068:
		case 23081:
		case 23073:
		case 23075:
		case 23079:
		case 23074:
		case 23078:
		case 23076:
		case 23077:
		case 23132:
		case 23098:
		case 23100:
		case 23121:
		case 23122:
		case 23123:
		case 23120:
		case 23118:
		case 23119:
		case 23117:
		case 23124:
		case 23126:
		case 23130:
		case 23125:
		case 23129:
		case 23127:
		case 23128:
		case 23099:
		case 23116:
		case 23114:
		case 23104:
		case 23105:
		case 23106:
		case 23103:
		case 23101:
		case 23102:
		case 23115:
		case 23107:
		case 23109:
		case 23113:
		case 23108:
		case 23112:
		case 23110:
		case 23111:
		case 23471:
		case 22385:
		case 22383:
		case 21659:
		case 21660:
		case 21661:
		case 21658:
		case 21656:
		case 21657:
		case 21655:
		case 21662:
		case 21664:
		case 21668:
		case 21663:
		case 21667:
		case 21665:
		case 21666:
		case 21669:
		case 21654:
		case 21652:
		case 21642:
		case 21643:
		case 21644:
		case 21641:
		case 21639:
		case 21640:
		case 21653:
		case 21645:
		case 21647:
		case 21651:
		case 21646:
		case 21650:
		case 21648:
		case 21649:
		case 21638:
		case 21670:
		case 21672:
		case 21693:
		case 21694:
		case 21695:
		case 21692:
		case 21690:
		case 21691:
		case 21689:
		case 21696:
		case 21698:
		case 21702:
		case 21697:
		case 21701:
		case 21699:
		case 21700:
		case 21671:
		case 21688:
		case 21686:
		case 21676:
		case 21677:
		case 21678:
		case 21675:
		case 21673:
		case 21674:
		case 21687:
		case 21679:
		case 21681:
		case 21685:
		case 21680:
		case 21684:
		case 21682:
		case 21683:
		case 21703:
		case 21637:
		case 21635:
		case 21591:
		case 21592:
		case 21593:
		case 21590:
		case 21588:
		case 21589:
		case 21587:
		case 21594:
		case 21596:
		case 21600:
		case 21595:
		case 21599:
		case 21597:
		case 21598:
		case 21601:
		case 21586:
		case 21584:
		case 21574:
		case 21575:
		case 21576:
		case 21573:
		case 21571:
		case 21572:
		case 21585:
		case 21577:
		case 21579:
		case 21583:
		case 21578:
		case 21582:
		case 21580:
		case 21581:
		case 21636:
		case 21602:
		case 21604:
		case 21625:
		case 21626:
		case 21627:
		case 21624:
		case 21622:
		case 21623:
		case 21621:
		case 21628:
		case 21630:
		case 21634:
		case 21629:
		case 21633:
		case 21631:
		case 21632:
		case 21603:
		case 21620:
		case 21618:
		case 21608:
		case 21609:
		case 21610:
		case 21607:
		case 21605:
		case 21606:
		case 21619:
		case 21611:
		case 21613:
		case 21617:
		case 21612:
		case 21616:
		case 21614:
		case 21615:
		case 21570:
		case 21704:
		case 21706:
		case 21795:
		case 21796:
		case 21797:
		case 21794:
		case 21792:
		case 21793:
		case 21791:
		case 21798:
		case 21800:
		case 21804:
		case 21799:
		case 21803:
		case 21801:
		case 21802:
		case 21805:
		case 21790:
		case 21788:
		case 21778:
		case 21779:
		case 21780:
		case 21777:
		case 21775:
		case 21776:
		case 21789:
		case 21781:
		case 21783:
		case 21787:
		case 21782:
		case 21786:
		case 21784:
		case 21785:
		case 21774:
		case 21806:
		case 21808:
		case 21829:
		case 21830:
		case 21831:
		case 21828:
		case 21826:
		case 21827:
		case 21825:
		case 21832:
		case 21834:
		case 21838:
		case 21833:
		case 21837:
		case 21835:
		case 21836:
		case 21807:
		case 21824:
		case 21822:
		case 21812:
		case 21813:
		case 21814:
		case 21811:
		case 21809:
		case 21810:
		case 21823:
		case 21815:
		case 21817:
		case 21821:
		case 21816:
		case 21820:
		case 21818:
		case 21819:
		case 21705:
		case 21773:
		case 21771:
		case 21727:
		case 21728:
		case 21729:
		case 21726:
		case 21724:
		case 21725:
		case 21723:
		case 21730:
		case 21732:
		case 21736:
		case 21731:
		case 21735:
		case 21733:
		case 21734:
		case 21737:
		case 21722:
		case 21720:
		case 21710:
		case 21711:
		case 21712:
		case 21709:
		case 21707:
		case 21708:
		case 21721:
		case 21713:
		case 21715:
		case 21719:
		case 21714:
		case 21718:
		case 21716:
		case 21717:
		case 21772:
		case 21738:
		case 21740:
		case 21761:
		case 21762:
		case 21763:
		case 21760:
		case 21758:
		case 21759:
		case 21757:
		case 21764:
		case 21766:
		case 21770:
		case 21765:
		case 21769:
		case 21767:
		case 21768:
		case 21739:
		case 21756:
		case 21754:
		case 21744:
		case 21745:
		case 21746:
		case 21743:
		case 21741:
		case 21742:
		case 21755:
		case 21747:
		case 21749:
		case 21753:
		case 21748:
		case 21752:
		case 21750:
		case 21751:
		case 21839:
		case 21569:
		case 21567:
		case 21387:
		case 21388:
		case 21389:
		case 21386:
		case 21384:
		case 21385:
		case 21383:
		case 21390:
		case 21392:
		case 21396:
		case 21391:
		case 21395:
		case 21393:
		case 21394:
		case 21397:
		case 21382:
		case 21380:
		case 21370:
		case 21371:
		case 21372:
		case 21369:
		case 21367:
		case 21368:
		case 21381:
		case 21373:
		case 21375:
		case 21379:
		case 21374:
		case 21378:
		case 21376:
		case 21377:
		case 21366:
		case 21398:
		case 21400:
		case 21421:
		case 21422:
		case 21423:
		case 21420:
		case 21418:
		case 21419:
		case 21417:
		case 21424:
		case 21426:
		case 21430:
		case 21425:
		case 21429:
		case 21427:
		case 21428:
		case 21399:
		case 21416:
		case 21414:
		case 21404:
		case 21405:
		case 21406:
		case 21403:
		case 21401:
		case 21402:
		case 21415:
		case 21407:
		case 21409:
		case 21413:
		case 21408:
		case 21412:
		case 21410:
		case 21411:
		case 21431:
		case 21365:
		case 21363:
		case 21319:
		case 21320:
		case 21321:
		case 21318:
		case 21316:
		case 21317:
		case 21315:
		case 21322:
		case 21324:
		case 21328:
		case 21323:
		case 21327:
		case 21325:
		case 21326:
		case 21329:
		case 21314:
		case 21312:
		case 21302:
		case 21303:
		case 21304:
		case 21301:
		case 29999:
		case 21300:
		case 21313:
		case 21305:
		case 21307:
		case 21311:
		case 21306:
		case 21310:
		case 21308:
		case 21309:
		case 21364:
		case 21330:
		case 21332:
		case 21353:
		case 21354:
		case 21355:
		case 21352:
		case 21350:
		case 21351:
		case 21349:
		case 21356:
		case 21358:
		case 21362:
		case 21357:
		case 21361:
		case 21359:
		case 21360:
		case 21331:
		case 21348:
		case 21346:
		case 21336:
		case 21337:
		case 21338:
		case 21335:
		case 21333:
		case 21334:
		case 21347:
		case 21339:
		case 21341:
		case 21345:
		case 21340:
		case 21344:
		case 21342:
		case 21343:
		case 21568:
		case 21432:
		case 21434:
		case 21523:
		case 21524:
		case 21525:
		case 21522:
		case 21520:
		case 21521:
		case 21519:
		case 21526:
		case 21528:
		case 21532:
		case 21527:
		case 21531:
		case 21529:
		case 21530:
		case 21533:
		case 21518:
		case 21516:
		case 21506:
		case 21507:
		case 21508:
		case 21505:
		case 21503:
		case 21504:
		case 21517:
		case 21509:
		case 21511:
		case 21515:
		case 21510:
		case 21514:
		case 21512:
		case 21513:
		case 21502:
		case 21534:
		case 21536:
		case 21557:
		case 21558:
		case 21559:
		case 21556:
		case 21554:
		case 21555:
		case 21553:
		case 21560:
		case 21562:
		case 21566:
		case 21561:
		case 21565:
		case 21563:
		case 21564:
		case 21535:
		case 21552:
		case 21550:
		case 21540:
		case 21541:
		case 21542:
		case 21539:
		case 21537:
		case 21538:
		case 21551:
		case 21543:
		case 21545:
		case 21549:
		case 21544:
		case 21548:
		case 21546:
		case 21547:
		case 21433:
		case 21501:
		case 21499:
		case 21455:
		case 21456:
		case 21457:
		case 21454:
		case 21452:
		case 21453:
		case 21451:
		case 21458:
		case 21460:
		case 21464:
		case 21459:
		case 21463:
		case 21461:
		case 21462:
		case 21465:
		case 21450:
		case 21448:
		case 21438:
		case 21439:
		case 21440:
		case 21437:
		case 21435:
		case 21436:
		case 21449:
		case 21441:
		case 21443:
		case 21447:
		case 21442:
		case 21446:
		case 21444:
		case 21445:
		case 21500:
		case 21466:
		case 21468:
		case 21489:
		case 21490:
		case 21491:
		case 21488:
		case 21486:
		case 21487:
		case 21485:
		case 21492:
		case 21494:
		case 21498:
		case 21493:
		case 21497:
		case 21495:
		case 21496:
		case 21467:
		case 21484:
		case 21482:
		case 21472:
		case 21473:
		case 21474:
		case 21471:
		case 21469:
		case 21470:
		case 21483:
		case 21475:
		case 21477:
		case 21481:
		case 21476:
		case 21480:
		case 21478:
		case 21479:
		case 22384:
		case 21840:
		case 21842:
		case 22203:
		case 22204:
		case 22205:
		case 22202:
		case 22200:
		case 22201:
		case 22199:
		case 22206:
		case 22208:
		case 22212:
		case 22207:
		case 22211:
		case 22209:
		case 22210:
		case 22213:
		case 22198:
		case 22196:
		case 22186:
		case 22187:
		case 22188:
		case 22185:
		case 22183:
		case 22184:
		case 22197:
		case 22189:
		case 22191:
		case 22195:
		case 22190:
		case 22194:
		case 22192:
		case 22193:
		case 22182:
		case 22214:
		case 22216:
		case 22237:
		case 22238:
		case 22239:
		case 22236:
		case 22234:
		case 22235:
		case 22233:
		case 22240:
		case 22242:
		case 22246:
		case 22241:
		case 22245:
		case 22243:
		case 22244:
		case 22215:
		case 22232:
		case 22230:
		case 22220:
		case 22221:
		case 22222:
		case 22219:
		case 22217:
		case 22218:
		case 22231:
		case 22223:
		case 22225:
		case 22229:
		case 22224:
		case 22228:
		case 22226:
		case 22227:
		case 22247:
		case 22181:
		case 22179:
		case 22135:
		case 22136:
		case 22137:
		case 22134:
		case 22132:
		case 22133:
		case 22131:
		case 22138:
		case 22140:
		case 22144:
		case 22139:
		case 22143:
		case 22141:
		case 22142:
		case 22145:
		case 22130:
		case 22128:
		case 22118:
		case 22119:
		case 22120:
		case 22117:
		case 22115:
		case 22116:
		case 22129:
		case 22121:
		case 22123:
		case 22127:
		case 22122:
		case 22126:
		case 22124:
		case 22125:
		case 22180:
		case 22146:
		case 22148:
		case 22169:
		case 22170:
		case 22171:
		case 22168:
		case 22166:
		case 22167:
		case 22165:
		case 22172:
		case 22174:
		case 22178:
		case 22173:
		case 22177:
		case 22175:
		case 22176:
		case 22147:
		case 22164:
		case 22162:
		case 22152:
		case 22153:
		case 22154:
		case 22151:
		case 22149:
		case 22150:
		case 22163:
		case 22155:
		case 22157:
		case 22161:
		case 22156:
		case 22160:
		case 22158:
		case 22159:
		case 22114:
		case 22248:
		case 22250:
		case 22339:
		case 22340:
		case 22341:
		case 22338:
		case 22336:
		case 22337:
		case 22335:
		case 22342:
		case 22344:
		case 22348:
		case 22343:
		case 22347:
		case 22345:
		case 22346:
		case 22349:
		case 22334:
		case 22332:
		case 22322:
		case 22323:
		case 22324:
		case 22321:
		case 22319:
		case 22320:
		case 22333:
		case 22325:
		case 22327:
		case 22331:
		case 22326:
		case 22330:
		case 22328:
		case 22329:
		case 22318:
		case 22350:
		case 22352:
		case 22373:
		case 22374:
		case 22375:
		case 22372:
		case 22370:
		case 22371:
		case 22369:
		case 22376:
		case 22378:
		case 22382:
		case 22377:
		case 22381:
		case 22379:
		case 22380:
		case 22351:
		case 22368:
		case 22366:
		case 22356:
		case 22357:
		case 22358:
		case 22355:
		case 22353:
		case 22354:
		case 22367:
		case 22359:
		case 22361:
		case 22365:
		case 22360:
		case 22364:
		case 22362:
		case 22363:
		case 22249:
		case 22317:
		case 22315:
		case 22271:
		case 22272:
		case 22273:
		case 22270:
		case 22268:
		case 22269:
		case 22267:
		case 22274:
		case 22276:
		case 22280:
		case 22275:
		case 22279:
		case 22277:
		case 22278:
		case 22281:
		case 22266:
		case 22264:
		case 22254:
		case 22255:
		case 22256:
		case 22253:
		case 22251:
		case 22252:
		case 22265:
		case 22257:
		case 22259:
		case 22263:
		case 22258:
		case 22262:
		case 22260:
		case 22261:
		case 22316:
		case 22282:
		case 22284:
		case 22305:
		case 22306:
		case 22307:
		case 22304:
		case 22302:
		case 22303:
		case 22301:
		case 22308:
		case 22310:
		case 22314:
		case 22309:
		case 22313:
		case 22311:
		case 22312:
		case 22283:
		case 22300:
		case 22298:
		case 22288:
		case 22289:
		case 22290:
		case 22287:
		case 22285:
		case 22286:
		case 22299:
		case 22291:
		case 22293:
		case 22297:
		case 22292:
		case 22296:
		case 22294:
		case 22295:
		case 21841:
		case 22113:
		case 22111:
		case 21931:
		case 21932:
		case 21933:
		case 21930:
		case 21928:
		case 21929:
		case 21927:
		case 21934:
		case 21936:
		case 21940:
		case 21935:
		case 21939:
		case 21937:
		case 21938:
		case 21941:
		case 21926:
		case 21924:
		case 21914:
		case 21915:
		case 21916:
		case 21913:
		case 21911:
		case 21912:
		case 21925:
		case 21917:
		case 21919:
		case 21923:
		case 21918:
		case 21922:
		case 21920:
		case 21921:
		case 21910:
		case 21942:
		case 21944:
		case 21965:
		case 21966:
		case 21967:
		case 21964:
		case 21962:
		case 21963:
		case 21961:
		case 21968:
		case 21970:
		case 21974:
		case 21969:
		case 21973:
		case 21971:
		case 21972:
		case 21943:
		case 21960:
		case 21958:
		case 21948:
		case 21949:
		case 21950:
		case 21947:
		case 21945:
		case 21946:
		case 21959:
		case 21951:
		case 21953:
		case 21957:
		case 21952:
		case 21956:
		case 21954:
		case 21955:
		case 21975:
		case 21909:
		case 21907:
		case 21863:
		case 21864:
		case 21865:
		case 21862:
		case 21860:
		case 21861:
		case 21859:
		case 21866:
		case 21868:
		case 21872:
		case 21867:
		case 21871:
		case 21869:
		case 21870:
		case 21873:
		case 21858:
		case 21856:
		case 21846:
		case 21847:
		case 21848:
		case 21845:
		case 21843:
		case 21844:
		case 21857:
		case 21849:
		case 21851:
		case 21855:
		case 21850:
		case 21854:
		case 21852:
		case 21853:
		case 21908:
		case 21874:
		case 21876:
		case 21897:
		case 21898:
		case 21899:
		case 21896:
		case 21894:
		case 21895:
		case 21893:
		case 21900:
		case 21902:
		case 21906:
		case 21901:
		case 21905:
		case 21903:
		case 21904:
		case 21875:
		case 21892:
		case 21890:
		case 21880:
		case 21881:
		case 21882:
		case 21879:
		case 21877:
		case 21878:
		case 21891:
		case 21883:
		case 21885:
		case 21889:
		case 21884:
		case 21888:
		case 21886:
		case 21887:
		case 22112:
		case 21976:
		case 21978:
		case 22067:
		case 22068:
		case 22069:
		case 22066:
		case 22064:
		case 22065:
		case 22063:
		case 22070:
		case 22072:
		case 22076:
		case 22071:
		case 22075:
		case 22073:
		case 22074:
		case 22077:
		case 22062:
		case 22060:
		case 22050:
		case 22051:
		case 22052:
		case 22049:
		case 22047:
		case 22048:
		case 22061:
		case 22053:
		case 22055:
		case 22059:
		case 22054:
		case 22058:
		case 22056:
		case 22057:
		case 22046:
		case 22078:
		case 22080:
		case 22101:
		case 22102:
		case 22103:
		case 22100:
		case 22098:
		case 22099:
		case 22097:
		case 22104:
		case 22106:
		case 22110:
		case 22105:
		case 22109:
		case 22107:
		case 22108:
		case 22079:
		case 22096:
		case 22094:
		case 22084:
		case 22085:
		case 22086:
		case 22083:
		case 22081:
		case 22082:
		case 22095:
		case 22087:
		case 22089:
		case 22093:
		case 22088:
		case 22092:
		case 22090:
		case 22091:
		case 21977:
		case 22045:
		case 22043:
		case 21999:
		case 22000:
		case 22001:
		case 21998:
		case 21996:
		case 21997:
		case 21995:
		case 22002:
		case 22004:
		case 22008:
		case 22003:
		case 22007:
		case 22005:
		case 22006:
		case 22009:
		case 21994:
		case 21992:
		case 21982:
		case 21983:
		case 21984:
		case 21981:
		case 21979:
		case 21980:
		case 21993:
		case 21985:
		case 21987:
		case 21991:
		case 21986:
		case 21990:
		case 21988:
		case 21989:
		case 22044:
		case 22010:
		case 22012:
		case 22033:
		case 22034:
		case 22035:
		case 22032:
		case 22030:
		case 22031:
		case 22029:
		case 22036:
		case 22038:
		case 22042:
		case 22037:
		case 22041:
		case 22039:
		case 22040:
		case 22011:
		case 22028:
		case 22026:
		case 22016:
		case 22017:
		case 22018:
		case 22015:
		case 22013:
		case 22014:
		case 22027:
		case 22019:
		case 22021:
		case 22025:
		case 22020:
		case 22024:
		case 22022:
		case 22023:
		case 25648:
		case 23472:
		case 23474:
		case 24923:
		case 24924:
		case 24925:
		case 24922:
		case 24920:
		case 24921:
		case 24919:
		case 24926:
		case 24928:
		case 24932:
		case 24927:
		case 24931:
		case 24929:
		case 24930:
		case 24933:
		case 24918:
		case 24916:
		case 24906:
		case 24907:
		case 24908:
		case 24905:
		case 24903:
		case 24904:
		case 24917:
		case 24909:
		case 24911:
		case 24915:
		case 24910:
		case 24914:
		case 24912:
		case 24913:
		case 24902:
		case 24934:
		case 24936:
		case 24957:
		case 24958:
		case 24959:
		case 24956:
		case 24954:
		case 24955:
		case 24953:
		case 24960:
		case 24962:
		case 24966:
		case 24961:
		case 24965:
		case 24963:
		case 24964:
		case 24935:
		case 24952:
		case 24950:
		case 24940:
		case 24941:
		case 24942:
		case 24939:
		case 24937:
		case 24938:
		case 24951:
		case 24943:
		case 24945:
		case 24949:
		case 24944:
		case 24948:
		case 24946:
		case 24947:
		case 24967:
		case 24901:
		case 24899:
		case 24855:
		case 24856:
		case 24857:
		case 24854:
		case 24852:
		case 24853:
		case 24851:
		case 24858:
		case 24860:
		case 24864:
		case 24859:
		case 24863:
		case 24861:
		case 24862:
		case 24865:
		case 24850:
		case 24848:
		case 24838:
		case 24839:
		case 24840:
		case 24837:
		case 24835:
		case 24836:
		case 24849:
		case 24841:
		case 24843:
		case 24847:
		case 24842:
		case 24846:
		case 24844:
		case 24845:
		case 24900:
		case 24866:
		case 24868:
		case 24889:
		case 24890:
		case 24891:
		case 24888:
		case 24886:
		case 24887:
		case 24885:
		case 24892:
		case 24894:
		case 24898:
		case 24893:
		case 24897:
		case 24895:
		case 24896:
		case 24867:
		case 24884:
		case 24882:
		case 24872:
		case 24873:
		case 24874:
		case 24871:
		case 24869:
		case 24870:
		case 24883:
		case 24875:
		case 24877:
		case 24881:
		case 24876:
		case 24880:
		case 24878:
		case 24879:
		case 24834:
		case 24968:
		case 24970:
		case 25059:
		case 25060:
		case 25061:
		case 25058:
		case 25056:
		case 25057:
		case 25055:
		case 25062:
		case 25064:
		case 25068:
		case 25063:
		case 25067:
		case 25065:
		case 25066:
		case 25069:
		case 25054:
		case 25052:
		case 25042:
		case 25043:
		case 25044:
		case 25041:
		case 25039:
		case 25040:
		case 25053:
		case 25045:
		case 25047:
		case 25051:
		case 25046:
		case 25050:
		case 25048:
		case 25049:
		case 25038:
		case 25070:
		case 25072:
		case 25093:
		case 25094:
		case 25095:
		case 25092:
		case 25090:
		case 25091:
		case 25089:
		case 25096:
		case 25098:
		case 25102:
		case 25097:
		case 25101:
		case 25099:
		case 25100:
		case 25071:
		case 25088:
		case 25086:
		case 25076:
		case 25077:
		case 25078:
		case 25075:
		case 25073:
		case 25074:
		case 25087:
		case 25079:
		case 25081:
		case 25085:
		case 25080:
		case 25084:
		case 25082:
		case 25083:
		case 24969:
		case 25037:
		case 25035:
		case 24991:
		case 24992:
		case 24993:
		case 24990:
		case 24988:
		case 24989:
		case 24987:
		case 24994:
		case 24996:
		case 25000:
		case 24995:
		case 24999:
		case 24997:
		case 24998:
		case 25001:
		case 24986:
		case 24984:
		case 24974:
		case 24975:
		case 24976:
		case 24973:
		case 24971:
		case 24972:
		case 24985:
		case 24977:
		case 24979:
		case 24983:
		case 24978:
		case 24982:
		case 24980:
		case 24981:
		case 25036:
		case 25002:
		case 25004:
		case 25025:
		case 25026:
		case 25027:
		case 25024:
		case 25022:
		case 25023:
		case 25021:
		case 25028:
		case 25030:
		case 25034:
		case 25029:
		case 25033:
		case 25031:
		case 25032:
		case 25003:
		case 25020:
		case 25018:
		case 25008:
		case 25009:
		case 25010:
		case 25007:
		case 25005:
		case 25006:
		case 25019:
		case 25011:
		case 25013:
		case 25017:
		case 25012:
		case 25016:
		case 25014:
		case 25015:
		case 25103:
		case 24833:
		case 24831:
		case 24651:
		case 24652:
		case 24653:
		case 24650:
		case 24648:
		case 24649:
		case 24647:
		case 24654:
		case 24656:
		case 24660:
		case 24655:
		case 24659:
		case 24657:
		case 24658:
		case 24661:
		case 24646:
		case 24644:
		case 24634:
		case 24635:
		case 24636:
		case 24633:
		case 24631:
		case 24632:
		case 24645:
		case 24637:
		case 24639:
		case 24643:
		case 24638:
		case 24642:
		case 24640:
		case 24641:
		case 24630:
		case 24662:
		case 24664:
		case 24685:
		case 24686:
		case 24687:
		case 24684:
		case 24682:
		case 24683:
		case 24681:
		case 24688:
		case 24690:
		case 24694:
		case 24689:
		case 24693:
		case 24691:
		case 24692:
		case 24663:
		case 24680:
		case 24678:
		case 24668:
		case 24669:
		case 24670:
		case 24667:
		case 24665:
		case 24666:
		case 24679:
		case 24671:
		case 24673:
		case 24677:
		case 24672:
		case 24676:
		case 24674:
		case 24675:
		case 24695:
		case 24629:
		case 24627:
		case 24583:
		case 24584:
		case 24585:
		case 24582:
		case 24580:
		case 24581:
		case 24579:
		case 24586:
		case 24588:
		case 24592:
		case 24587:
		case 24591:
		case 24589:
		case 24590:
		case 24593:
		case 24578:
		case 24576:
		case 24566:
		case 24567:
		case 24568:
		case 24565:
		case 24563:
		case 24564:
		case 24577:
		case 24569:
		case 24571:
		case 24575:
		case 24570:
		case 24574:
		case 24572:
		case 24573:
		case 24628:
		case 24594:
		case 24596:
		case 24617:
		case 24618:
		case 24619:
		case 24616:
		case 24614:
		case 24615:
		case 24613:
		case 24620:
		case 24622:
		case 24626:
		case 24621:
		case 24625:
		case 24623:
		case 24624:
		case 24595:
		case 24612:
		case 24610:
		case 24600:
		case 24601:
		case 24602:
		case 24599:
		case 24597:
		case 24598:
		case 24611:
		case 24603:
		case 24605:
		case 24609:
		case 24604:
		case 24608:
		case 24606:
		case 24607:
		case 24832:
		case 24696:
		case 24698:
		case 24787:
		case 24788:
		case 24789:
		case 24786:
		case 24784:
		case 24785:
		case 24783:
		case 24790:
		case 24792:
		case 24796:
		case 24791:
		case 24795:
		case 24793:
		case 24794:
		case 24797:
		case 24782:
		case 24780:
		case 24770:
		case 24771:
		case 24772:
		case 24769:
		case 24767:
		case 24768:
		case 24781:
		case 24773:
		case 24775:
		case 24779:
		case 24774:
		case 24778:
		case 24776:
		case 24777:
		case 24766:
		case 24798:
		case 24800:
		case 24821:
		case 24822:
		case 24823:
		case 24820:
		case 24818:
		case 24819:
		case 24817:
		case 24824:
		case 24826:
		case 24830:
		case 24825:
		case 24829:
		case 24827:
		case 24828:
		case 24799:
		case 24816:
		case 24814:
		case 24804:
		case 24805:
		case 24806:
		case 24803:
		case 24801:
		case 24802:
		case 24815:
		case 24807:
		case 24809:
		case 24813:
		case 24808:
		case 24812:
		case 24810:
		case 24811:
		case 24697:
		case 24765:
		case 24763:
		case 24719:
		case 24720:
		case 24721:
		case 24718:
		case 24716:
		case 24717:
		case 24715:
		case 24722:
		case 24724:
		case 24728:
		case 24723:
		case 24727:
		case 24725:
		case 24726:
		case 24729:
		case 24714:
		case 24712:
		case 24702:
		case 24703:
		case 24704:
		case 24701:
		case 24699:
		case 24700:
		case 24713:
		case 24705:
		case 24707:
		case 24711:
		case 24706:
		case 24710:
		case 24708:
		case 24709:
		case 24764:
		case 24730:
		case 24732:
		case 24753:
		case 24754:
		case 24755:
		case 24752:
		case 24750:
		case 24751:
		case 24749:
		case 24756:
		case 24758:
		case 24762:
		case 24757:
		case 24761:
		case 24759:
		case 24760:
		case 24731:
		case 24748:
		case 24746:
		case 24736:
		case 24737:
		case 24738:
		case 24735:
		case 24733:
		case 24734:
		case 24747:
		case 24739:
		case 24741:
		case 24745:
		case 24740:
		case 24744:
		case 24742:
		case 24743:
		case 24562:
		case 25104:
		case 25106:
		case 25467:
		case 25468:
		case 25469:
		case 25466:
		case 25464:
		case 25465:
		case 25463:
		case 25470:
		case 25472:
		case 25476:
		case 25471:
		case 25475:
		case 25473:
		case 25474:
		case 25477:
		case 25462:
		case 25460:
		case 25450:
		case 25451:
		case 25452:
		case 25449:
		case 25447:
		case 25448:
		case 25461:
		case 25453:
		case 25455:
		case 25459:
		case 25454:
		case 25458:
		case 25456:
		case 25457:
		case 25446:
		case 25478:
		case 25480:
		case 25501:
		case 25502:
		case 25503:
		case 25500:
		case 25498:
		case 25499:
		case 25497:
		case 25504:
		case 25506:
		case 25510:
		case 25505:
		case 25509:
		case 25507:
		case 25508:
		case 25479:
		case 25496:
		case 25494:
		case 25484:
		case 25485:
		case 25486:
		case 25483:
		case 25481:
		case 25482:
		case 25495:
		case 25487:
		case 25489:
		case 25493:
		case 25488:
		case 25492:
		case 25490:
		case 25491:
		case 25511:
		case 25445:
		case 25443:
		case 25399:
		case 25400:
		case 25401:
		case 25398:
		case 25396:
		case 25397:
		case 25395:
		case 25402:
		case 25404:
		case 25408:
		case 25403:
		case 25407:
		case 25405:
		case 25406:
		case 25409:
		case 25394:
		case 25392:
		case 25382:
		case 25383:
		case 25384:
		case 25381:
		case 25379:
		case 25380:
		case 25393:
		case 25385:
		case 25387:
		case 25391:
		case 25386:
		case 25390:
		case 25388:
		case 25389:
		case 25444:
		case 25410:
		case 25412:
		case 25433:
		case 25434:
		case 25435:
		case 25432:
		case 25430:
		case 25431:
		case 25429:
		case 25436:
		case 25438:
		case 25442:
		case 25437:
		case 25441:
		case 25439:
		case 25440:
		case 25411:
		case 25428:
		case 25426:
		case 25416:
		case 25417:
		case 25418:
		case 25415:
		case 25413:
		case 25414:
		case 25427:
		case 25419:
		case 25421:
		case 25425:
		case 25420:
		case 25424:
		case 25422:
		case 25423:
		case 25378:
		case 25512:
		case 25514:
		case 25603:
		case 25604:
		case 25605:
		case 25602:
		case 25600:
		case 25601:
		case 25599:
		case 25606:
		case 25608:
		case 25612:
		case 25607:
		case 25611:
		case 25609:
		case 25610:
		case 25613:
		case 25598:
		case 25596:
		case 25586:
		case 25587:
		case 25588:
		case 25585:
		case 25583:
		case 25584:
		case 25597:
		case 25589:
		case 25591:
		case 25595:
		case 25590:
		case 25594:
		case 25592:
		case 25593:
		case 25582:
		case 25614:
		case 25616:
		case 25637:
		case 25638:
		case 25639:
		case 25636:
		case 25634:
		case 25635:
		case 25633:
		case 25640:
		case 25642:
		case 25646:
		case 25641:
		case 25645:
		case 25643:
		case 25644:
		case 25615:
		case 25632:
		case 25630:
		case 25620:
		case 25621:
		case 25622:
		case 25619:
		case 25617:
		case 25618:
		case 25631:
		case 25623:
		case 25625:
		case 25629:
		case 25624:
		case 25628:
		case 25626:
		case 25627:
		case 25513:
		case 25581:
		case 25579:
		case 25535:
		case 25536:
		case 25537:
		case 25534:
		case 25532:
		case 25533:
		case 25531:
		case 25538:
		case 25540:
		case 25544:
		case 25539:
		case 25543:
		case 25541:
		case 25542:
		case 25545:
		case 25530:
		case 25528:
		case 25518:
		case 25519:
		case 25520:
		case 25517:
		case 25515:
		case 25516:
		case 25529:
		case 25521:
		case 25523:
		case 25527:
		case 25522:
		case 25526:
		case 25524:
		case 25525:
		case 25580:
		case 25546:
		case 25548:
		case 25569:
		case 25570:
		case 25571:
		case 25568:
		case 25566:
		case 25567:
		case 25565:
		case 25572:
		case 25574:
		case 25578:
		case 25573:
		case 25577:
		case 25575:
		case 25576:
		case 25547:
		case 25564:
		case 25562:
		case 25552:
		case 25553:
		case 25554:
		case 25551:
		case 25549:
		case 25550:
		case 25563:
		case 25555:
		case 25557:
		case 25561:
		case 25556:
		case 25560:
		case 25558:
		case 25559:
		case 25105:
		case 25377:
		case 25375:
		case 25195:
		case 25196:
		case 25197:
		case 25194:
		case 25192:
		case 25193:
		case 25191:
		case 25198:
		case 25200:
		case 25204:
		case 25199:
		case 25203:
		case 25201:
		case 25202:
		case 25205:
		case 25190:
		case 25188:
		case 25178:
		case 25179:
		case 25180:
		case 25177:
		case 25175:
		case 25176:
		case 25189:
		case 25181:
		case 25183:
		case 25187:
		case 25182:
		case 25186:
		case 25184:
		case 25185:
		case 25174:
		case 25206:
		case 25208:
		case 25229:
		case 25230:
		case 25231:
		case 25228:
		case 25226:
		case 25227:
		case 25225:
		case 25232:
		case 25234:
		case 25238:
		case 25233:
		case 25237:
		case 25235:
		case 25236:
		case 25207:
		case 25224:
		case 25222:
		case 25212:
		case 25213:
		case 25214:
		case 25211:
		case 25209:
		case 25210:
		case 25223:
		case 25215:
		case 25217:
		case 25221:
		case 25216:
		case 25220:
		case 25218:
		case 25219:
		case 25239:
		case 25173:
		case 25171:
		case 25127:
		case 25128:
		case 25129:
		case 25126:
		case 25124:
		case 25125:
		case 25123:
		case 25130:
		case 25132:
		case 25136:
		case 25131:
		case 25135:
		case 25133:
		case 25134:
		case 25137:
		case 25122:
		case 25120:
		case 25110:
		case 25111:
		case 25112:
		case 25109:
		case 25107:
		case 25108:
		case 25121:
		case 25113:
		case 25115:
		case 25119:
		case 25114:
		case 25118:
		case 25116:
		case 25117:
		case 25172:
		case 25138:
		case 25140:
		case 25161:
		case 25162:
		case 25163:
		case 25160:
		case 25158:
		case 25159:
		case 25157:
		case 25164:
		case 25166:
		case 25170:
		case 25165:
		case 25169:
		case 25167:
		case 25168:
		case 25139:
		case 25156:
		case 25154:
		case 25144:
		case 25145:
		case 25146:
		case 25143:
		case 25141:
		case 25142:
		case 25155:
		case 25147:
		case 25149:
		case 25153:
		case 25148:
		case 25152:
		case 25150:
		case 25151:
		case 25376:
		case 25240:
		case 25242:
		case 25331:
		case 25332:
		case 25333:
		case 25330:
		case 25328:
		case 25329:
		case 25327:
		case 25334:
		case 25336:
		case 25340:
		case 25335:
		case 25339:
		case 25337:
		case 25338:
		case 25341:
		case 25326:
		case 25324:
		case 25314:
		case 25315:
		case 25316:
		case 25313:
		case 25311:
		case 25312:
		case 25325:
		case 25317:
		case 25319:
		case 25323:
		case 25318:
		case 25322:
		case 25320:
		case 25321:
		case 25310:
		case 25342:
		case 25344:
		case 25365:
		case 25366:
		case 25367:
		case 25364:
		case 25362:
		case 25363:
		case 25361:
		case 25368:
		case 25370:
		case 25374:
		case 25369:
		case 25373:
		case 25371:
		case 25372:
		case 25343:
		case 25360:
		case 25358:
		case 25348:
		case 25349:
		case 25350:
		case 25347:
		case 25345:
		case 25346:
		case 25359:
		case 25351:
		case 25353:
		case 25357:
		case 25352:
		case 25356:
		case 25354:
		case 25355:
		case 25241:
		case 25309:
		case 25307:
		case 25263:
		case 25264:
		case 25265:
		case 25262:
		case 25260:
		case 25261:
		case 25259:
		case 25266:
		case 25268:
		case 25272:
		case 25267:
		case 25271:
		case 25269:
		case 25270:
		case 25273:
		case 25258:
		case 25256:
		case 25246:
		case 25247:
		case 25248:
		case 25245:
		case 25243:
		case 25244:
		case 25257:
		case 25249:
		case 25251:
		case 25255:
		case 25250:
		case 25254:
		case 25252:
		case 25253:
		case 25308:
		case 25274:
		case 25276:
		case 25297:
		case 25298:
		case 25299:
		case 25296:
		case 25294:
		case 25295:
		case 25293:
		case 25300:
		case 25302:
		case 25306:
		case 25301:
		case 25305:
		case 25303:
		case 25304:
		case 25275:
		case 25292:
		case 25290:
		case 25280:
		case 25281:
		case 25282:
		case 25279:
		case 25277:
		case 25278:
		case 25291:
		case 25283:
		case 25285:
		case 25289:
		case 25284:
		case 25288:
		case 25286:
		case 25287:
		case 23473:
		case 24561:
		case 24559:
		case 23836:
		case 23837:
		case 23838:
		case 23835:
		case 23833:
		case 23834:
		case 23832:
		case 23839:
		case 23841:
		case 23845:
		case 23840:
		case 23844:
		case 23842:
		case 23843:
		case 23846:
		case 23831:
		case 23829:
		case 23819:
		case 23820:
		case 23821:
		case 23818:
		case 23816:
		case 23817:
		case 23830:
		case 23822:
		case 23824:
		case 23828:
		case 23823:
		case 23827:
		case 23825:
		case 23826:
		case 23815:
		case 23847:
		case 23849:
		case 23870:
		case 23871:
		case 23872:
		case 23869:
		case 23867:
		case 23868:
		case 23866:
		case 23873:
		case 23875:
		case 23879:
		case 23874:
		case 23878:
		case 23876:
		case 23877:
		case 23848:
		case 23865:
		case 23863:
		case 23853:
		case 23854:
		case 23855:
		case 23852:
		case 23850:
		case 23851:
		case 23864:
		case 23856:
		case 23858:
		case 23862:
		case 23857:
		case 23861:
		case 23859:
		case 23860:
		case 23880:
		case 23814:
		case 23812:
		case 23768:
		case 23769:
		case 23770:
		case 23767:
		case 23765:
		case 23766:
		case 23764:
		case 23771:
		case 23773:
		case 23777:
		case 23772:
		case 23776:
		case 23774:
		case 23775:
		case 23778:
		case 23763:
		case 23761:
		case 23751:
		case 23752:
		case 23753:
		case 23750:
		case 23748:
		case 23749:
		case 23762:
		case 23754:
		case 23756:
		case 23760:
		case 23755:
		case 23759:
		case 23757:
		case 23758:
		case 23813:
		case 23779:
		case 23781:
		case 23802:
		case 23803:
		case 23804:
		case 23801:
		case 23799:
		case 23800:
		case 23798:
		case 23805:
		case 23807:
		case 23811:
		case 23806:
		case 23810:
		case 23808:
		case 23809:
		case 23780:
		case 23797:
		case 23795:
		case 23785:
		case 23786:
		case 23787:
		case 23784:
		case 23782:
		case 23783:
		case 23796:
		case 23788:
		case 23790:
		case 23794:
		case 23789:
		case 23793:
		case 23791:
		case 23792:
		case 23747:
		case 23881:
		case 23883:
		case 23972:
		case 23973:
		case 23974:
		case 23971:
		case 23969:
		case 23970:
		case 23968:
		case 23975:
		case 23977:
		case 23981:
		case 23976:
		case 23980:
		case 23978:
		case 23979:
		case 23982:
		case 23967:
		case 23965:
		case 23955:
		case 23956:
		case 23957:
		case 23954:
		case 23952:
		case 23953:
		case 23966:
		case 23958:
		case 23960:
		case 23964:
		case 23959:
		case 23963:
		case 23961:
		case 23962:
		case 23951:
		case 23983:
		case 23985:
		case 24006:
		case 24007:
		case 24008:
		case 24005:
		case 24003:
		case 24004:
		case 24002:
		case 24009:
		case 24011:
		case 24015:
		case 24010:
		case 24014:
		case 24012:
		case 24013:
		case 23984:
		case 24001:
		case 23999:
		case 23989:
		case 23990:
		case 23991:
		case 23988:
		case 23986:
		case 23987:
		case 24000:
		case 23992:
		case 23994:
		case 23998:
		case 23993:
		case 23997:
		case 23995:
		case 23996:
		case 23882:
		case 23950:
		case 23948:
		case 23904:
		case 23905:
		case 23906:
		case 23903:
		case 23901:
		case 23902:
		case 23900:
		case 23907:
		case 23909:
		case 23913:
		case 23908:
		case 23912:
		case 23910:
		case 23911:
		case 23914:
		case 23899:
		case 23897:
		case 23887:
		case 23888:
		case 23889:
		case 23886:
		case 23884:
		case 23885:
		case 23898:
		case 23890:
		case 23892:
		case 23896:
		case 23891:
		case 23895:
		case 23893:
		case 23894:
		case 23949:
		case 23915:
		case 23917:
		case 23938:
		case 23939:
		case 23940:
		case 23937:
		case 23935:
		case 23936:
		case 23934:
		case 23941:
		case 23943:
		case 23947:
		case 23942:
		case 23946:
		case 23944:
		case 23945:
		case 23916:
		case 23933:
		case 23931:
		case 23921:
		case 23922:
		case 23923:
		case 23920:
		case 23918:
		case 23919:
		case 23932:
		case 23924:
		case 23926:
		case 23930:
		case 23925:
		case 23929:
		case 23927:
		case 23928:
		case 24016:
		case 23746:
		case 23744:
		case 23564:
		case 23565:
		case 23566:
		case 23563:
		case 23561:
		case 23562:
		case 23560:
		case 23567:
		case 23569:
		case 23573:
		case 23568:
		case 23572:
		case 23570:
		case 23571:
		case 23574:
		case 23559:
		case 23557:
		case 23547:
		case 23548:
		case 23549:
		case 23546:
		case 23544:
		case 23545:
		case 23558:
		case 23550:
		case 23552:
		case 23556:
		case 23551:
		case 23555:
		case 23553:
		case 23554:
		case 23543:
		case 23575:
		case 23577:
		case 23598:
		case 23599:
		case 23600:
		case 23597:
		case 23595:
		case 23596:
		case 23594:
		case 23601:
		case 23603:
		case 23607:
		case 23602:
		case 23606:
		case 23604:
		case 23605:
		case 23576:
		case 23593:
		case 23591:
		case 23581:
		case 23582:
		case 23583:
		case 23580:
		case 23578:
		case 23579:
		case 23592:
		case 23584:
		case 23586:
		case 23590:
		case 23585:
		case 23589:
		case 23587:
		case 23588:
		case 23608:
		case 23542:
		case 23540:
		case 23496:
		case 23497:
		case 23498:
		case 23495:
		case 23493:
		case 23494:
		case 23492:
		case 23499:
		case 23501:
		case 23505:
		case 23500:
		case 23504:
		case 23502:
		case 23503:
		case 23506:
		case 23491:
		case 23489:
		case 23479:
		case 23480:
		case 23481:
		case 23478:
		case 23476:
		case 23477:
		case 23490:
		case 23482:
		case 23484:
		case 23488:
		case 23483:
		case 23487:
		case 23485:
		case 23486:
		case 23541:
		case 23507:
		case 23509:
		case 23530:
		case 23531:
		case 23532:
		case 23529:
		case 23527:
		case 23528:
		case 23526:
		case 23533:
		case 23535:
		case 23539:
		case 23534:
		case 23538:
		case 23536:
		case 23537:
		case 23508:
		case 23525:
		case 23523:
		case 23513:
		case 23514:
		case 23515:
		case 23512:
		case 23510:
		case 23511:
		case 23524:
		case 23516:
		case 23518:
		case 23522:
		case 23517:
		case 23521:
		case 23519:
		case 23520:
		case 23745:
		case 23609:
		case 23611:
		case 23700:
		case 23701:
		case 23702:
		case 23699:
		case 23697:
		case 23698:
		case 23696:
		case 23703:
		case 23705:
		case 23709:
		case 23704:
		case 23708:
		case 23706:
		case 23707:
		case 23710:
		case 23695:
		case 23693:
		case 23683:
		case 23684:
		case 23685:
		case 23682:
		case 23680:
		case 23681:
		case 23694:
		case 23686:
		case 23688:
		case 23692:
		case 23687:
		case 23691:
		case 23689:
		case 23690:
		case 23679:
		case 23711:
		case 23713:
		case 23734:
		case 23735:
		case 23736:
		case 23733:
		case 23731:
		case 23732:
		case 23730:
		case 23737:
		case 23739:
		case 23743:
		case 23738:
		case 23742:
		case 23740:
		case 23741:
		case 23712:
		case 23729:
		case 23727:
		case 23717:
		case 23718:
		case 23719:
		case 23716:
		case 23714:
		case 23715:
		case 23728:
		case 23720:
		case 23722:
		case 23726:
		case 23721:
		case 23725:
		case 23723:
		case 23724:
		case 23610:
		case 23678:
		case 23676:
		case 23632:
		case 23633:
		case 23634:
		case 23631:
		case 23629:
		case 23630:
		case 23628:
		case 23635:
		case 23637:
		case 23641:
		case 23636:
		case 23640:
		case 23638:
		case 23639:
		case 23642:
		case 23627:
		case 23625:
		case 23615:
		case 23616:
		case 23617:
		case 23614:
		case 23612:
		case 23613:
		case 23626:
		case 23618:
		case 23620:
		case 23624:
		case 23619:
		case 23623:
		case 23621:
		case 23622:
		case 23677:
		case 23643:
		case 23645:
		case 23666:
		case 23667:
		case 23668:
		case 23665:
		case 23663:
		case 23664:
		case 23662:
		case 23669:
		case 23671:
		case 23675:
		case 23670:
		case 23674:
		case 23672:
		case 23673:
		case 23644:
		case 23661:
		case 23659:
		case 23649:
		case 23650:
		case 23651:
		case 23648:
		case 23646:
		case 23647:
		case 23660:
		case 23652:
		case 23654:
		case 23658:
		case 23653:
		case 23657:
		case 23655:
		case 23656:
		case 24560:
		case 24017:
		case 24019:
		case 24379:
		case 24380:
		case 24381:
		case 24378:
		case 24376:
		case 24377:
		case 24375:
		case 24382:
		case 24384:
		case 24388:
		case 24383:
		case 24387:
		case 24385:
		case 24386:
		case 24389:
		case 24374:
		case 24372:
		case 24362:
		case 24363:
		case 24364:
		case 24361:
		case 24359:
		case 24360:
		case 24373:
		case 24365:
		case 24367:
		case 24371:
		case 24366:
		case 24370:
		case 24368:
		case 24369:
		case 24358:
		case 24390:
		case 24392:
		case 24413:
		case 24414:
		case 24415:
		case 24412:
		case 24410:
		case 24411:
		case 24409:
		case 24416:
		case 24418:
		case 24422:
		case 24417:
		case 24421:
		case 24419:
		case 24420:
		case 24391:
		case 24408:
		case 24406:
		case 24396:
		case 24397:
		case 24398:
		case 24395:
		case 24393:
		case 24394:
		case 24407:
		case 24399:
		case 24401:
		case 24405:
		case 24400:
		case 24404:
		case 24402:
		case 24403:
		case 24423:
		case 24357:
		case 24355:
		case 24311:
		case 24312:
		case 24313:
		case 24310:
		case 24308:
		case 24309:
		case 24307:
		case 24314:
		case 24316:
		case 24320:
		case 24315:
		case 24319:
		case 24317:
		case 24318:
		case 24321:
		case 24306:
		case 24304:
		case 24294:
		case 24295:
		case 24296:
		case 24293:
		case 24291:
		case 24292:
		case 24305:
		case 24297:
		case 24299:
		case 24303:
		case 24298:
		case 24302:
		case 24300:
		case 24301:
		case 24356:
		case 24322:
		case 24324:
		case 24345:
		case 24346:
		case 24347:
		case 24344:
		case 24342:
		case 24343:
		case 24341:
		case 24348:
		case 24350:
		case 24354:
		case 24349:
		case 24353:
		case 24351:
		case 24352:
		case 24323:
		case 24340:
		case 24338:
		case 24328:
		case 24329:
		case 24330:
		case 24327:
		case 24325:
		case 24326:
		case 24339:
		case 24331:
		case 24333:
		case 24337:
		case 24332:
		case 24336:
		case 24334:
		case 24335:
		case 24290:
		case 24424:
		case 24426:
		case 24515:
		case 24516:
		case 24517:
		case 24514:
		case 24512:
		case 24513:
		case 24511:
		case 24518:
		case 24520:
		case 24524:
		case 24519:
		case 24523:
		case 24521:
		case 24522:
		case 24525:
		case 24510:
		case 24508:
		case 24498:
		case 24499:
		case 24500:
		case 24497:
		case 24495:
		case 24496:
		case 24509:
		case 24501:
		case 24503:
		case 24507:
		case 24502:
		case 24506:
		case 24504:
		case 24505:
		case 24494:
		case 24526:
		case 24528:
		case 24549:
		case 24550:
		case 24551:
		case 24548:
		case 24546:
		case 24547:
		case 24545:
		case 24552:
		case 24554:
		case 24558:
		case 24553:
		case 24557:
		case 24555:
		case 24556:
		case 24527:
		case 24544:
		case 24542:
		case 24532:
		case 24533:
		case 24534:
		case 24531:
		case 24529:
		case 24530:
		case 24543:
		case 24535:
		case 24537:
		case 24541:
		case 24536:
		case 24540:
		case 24538:
		case 24539:
		case 24425:
		case 24493:
		case 24491:
		case 24447:
		case 24448:
		case 24449:
		case 24446:
		case 24444:
		case 24445:
		case 24443:
		case 24450:
		case 24452:
		case 24456:
		case 24451:
		case 24455:
		case 24453:
		case 24454:
		case 24457:
		case 24442:
		case 24440:
		case 24430:
		case 24431:
		case 24432:
		case 24429:
		case 24427:
		case 24428:
		case 24441:
		case 24433:
		case 24435:
		case 24439:
		case 24434:
		case 24438:
		case 24436:
		case 24437:
		case 24492:
		case 24458:
		case 24460:
		case 24481:
		case 24482:
		case 24483:
		case 24480:
		case 24478:
		case 24479:
		case 24477:
		case 24484:
		case 24486:
		case 24490:
		case 24485:
		case 24489:
		case 24487:
		case 24488:
		case 24459:
		case 24476:
		case 24474:
		case 24464:
		case 24465:
		case 24466:
		case 24463:
		case 24461:
		case 24462:
		case 24475:
		case 24467:
		case 24469:
		case 24473:
		case 24468:
		case 24472:
		case 24470:
		case 24471:
		case 24018:
		case 24289:
		case 24287:
		case 24108:
		case 24109:
		case 24110:
		case 24107:
		case 24105:
		case 24106:
		case 24104:
		case 24111:
		case 24113:
		case 24117:
		case 24112:
		case 24116:
		case 24114:
		case 24115:
		case 24118:
		case 24103:
		case 24101:
		case 24091:
		case 24092:
		case 24093:
		case 24090:
		case 24088:
		case 24089:
		case 24102:
		case 24094:
		case 24096:
		case 24100:
		case 24095:
		case 24099:
		case 24097:
		case 24098:
		case 24087:
		case 24119:
		case 24121:
		case 24142:
		case 24143:
		case 24144:
		case 24141:
		case 24139:
		case 24140:
		case 24138:
		case 24145:
		case 24147:
		case 24151:
		case 24146:
		case 24150:
		case 24148:
		case 24149:
		case 24120:
		case 24137:
		case 24135:
		case 24125:
		case 24126:
		case 24127:
		case 24124:
		case 24122:
		case 24123:
		case 24136:
		case 24128:
		case 24130:
		case 24134:
		case 24129:
		case 24133:
		case 24131:
		case 24132:
		case 24152:
		case 24086:
		case 24084:
		case 24040:
		case 24041:
		case 24042:
		case 24039:
		case 24037:
		case 24038:
		case 24036:
		case 24043:
		case 24045:
		case 24049:
		case 24044:
		case 24048:
		case 24046:
		case 24047:
		case 24050:
		case 24035:
		case 24033:
		case 24023:
		case 24024:
		case 24025:
		case 24022:
		case 24020:
		case 24021:
		case 24034:
		case 24026:
		case 24028:
		case 24032:
		case 24027:
		case 24031:
		case 24029:
		case 24030:
		case 24085:
		case 24051:
		case 24053:
		case 24074:
		case 24075:
		case 24076:
		case 24073:
		case 24071:
		case 24072:
		case 24070:
		case 24077:
		case 24079:
		case 24083:
		case 24078:
		case 24082:
		case 24080:
		case 24081:
		case 24052:
		case 24069:
		case 24067:
		case 24057:
		case 24058:
		case 24059:
		case 24056:
		case 24054:
		case 24055:
		case 24068:
		case 24060:
		case 24062:
		case 24066:
		case 24061:
		case 24065:
		case 24063:
		case 24064:
		case 24288:
		case 24153:
		case 24155:
		case 24243:
		case 24244:
		case 24245:
		case 24242:
		case 24240:
		case 24241:
		case 24239:
		case 24246:
		case 24248:
		case 24252:
		case 24247:
		case 24251:
		case 24249:
		case 24250:
		case 24253:
		case 24238:
		case 24236:
		case 24226:
		case 24227:
		case 24228:
		case 24225:
		case 24223:
		case 24224:
		case 24237:
		case 24229:
		case 24231:
		case 24235:
		case 24230:
		case 24234:
		case 24232:
		case 24233:
		case 24222:
		case 24254:
		case 24256:
		case 24277:
		case 24278:
		case 24279:
		case 24276:
		case 24274:
		case 24275:
		case 24273:
		case 24280:
		case 24282:
		case 24286:
		case 24281:
		case 24285:
		case 24283:
		case 24284:
		case 24255:
		case 24272:
		case 24270:
		case 24260:
		case 24261:
		case 24262:
		case 24259:
		case 24257:
		case 24258:
		case 24271:
		case 24263:
		case 24265:
		case 24269:
		case 24264:
		case 24268:
		case 24266:
		case 24267:
		case 24154:
		case 24221:
		case 24219:
		case 24176:
		case 24177:
		case 24178:
		case 24175:
		case 24173:
		case 24174:
		case 24172:
		case 24179:
		case 24181:
		case 24185:
		case 24180:
		case 24184:
		case 24182:
		case 24183:
		case 24186:
		case 24171:
		case 24169:
		case 24159:
		case 24160:
		case 24161:
		case 24158:
		case 24156:
		case 24157:
		case 24170:
		case 24162:
		case 24164:
		case 24168:
		case 24163:
		case 24167:
		case 24165:
		case 24166:
		case 24220:
		case 24187:
		case 24189:
		case 24209:
		case 24210:
		case 24211:
		case 24208:
		case 24206:
		case 24207:
		case 24205:
		case 24212:
		case 24214:
		case 24218:
		case 24213:
		case 24217:
		case 24215:
		case 24216:
		case 24188:
		case 24204:
		case 24202:
		case 24193:
		case 24194:
		case 24192:
		case 24190:
		case 24191:
		case 24203:
		case 24195:
		case 24197:
		case 24201:
		case 24196:
		case 24200:
		case 24198:
		case 24199:
		case 30000:
			function314C8(arg0, glob479AC[arg0], 3791651020);
		default:
			function314C8(arg0, glob479AC[arg0], 2113929420);
	}
	return var0;
}

function8E508(playerid, arg1, arg2)
{
	glob4597C[playerid][arg1] = arg2 + glob4597C[playerid][arg1];
	new var0[36];
	format(var0, 36, "+ %s (%i)", glob44490[arg1][0], arg2);
	function98144(playerid, var0);
	switch(arg1) {
		case 4:
			SetVehicleParamsForPlayer(glob4A33C[playerid][6], playerid, false, false);
		case 3:
			for(new var1 = 100; 100 != var1 = glob4C230[0][var1]; )
			{
				SetVehicleParamsForPlayer(var1, playerid, false, false);
			}
		case 98:
			for(new var1 = 100; 100 != var1 = glob4C230[1][var1]; )
			{
				SetVehicleParamsForPlayer(var1, playerid, false, false);
			}
		case 99:
			for(new var1 = 100; 100 != var1 = glob4C230[2][var1]; )
			{
				SetVehicleParamsForPlayer(var1, playerid, false, false);
			}
		case 100:
			for(new var1 = 100; 100 != var1 = glob4C230[3][var1]; )
			{
				SetVehicleParamsForPlayer(var1, playerid, false, false);
			}
		case 101:
			for(new var1 = 100; 100 != var1 = glob4C230[4][var1]; )
			{
				SetVehicleParamsForPlayer(var1, playerid, false, false);
			}
		case 14:
			function69A4(playerid, glob4597C[playerid][14]);
		case 60:
			if(function8F248(playerid, 2))
			{
				SetPlayerAmmo(playerid, function8F1B4(playerid, 2), glob4597C[playerid][60]);
			}
			glob4597C[playerid][arg1] = glob4597C[playerid][arg1] + 50;
		case 61:
			if(function8F248(playerid, 2))
			{
				SetPlayerAmmo(playerid, function8F1B4(playerid, 4), glob4597C[playerid][62]);
			}
			glob4597C[playerid][arg1] = glob4597C[playerid][arg1] + 50;
		case 62:
			if(function8F248(playerid, 2))
			{
				SetPlayerAmmo(playerid, function8F1B4(playerid, 3), glob4597C[playerid][61]);
			}
			glob4597C[playerid][arg1] = glob4597C[playerid][arg1] + 50;
		case 63:
			if(function8F248(playerid, 2))
			{
				SetPlayerAmmo(playerid, function8F1B4(playerid, 5), glob4597C[playerid][63]);
			}
			glob4597C[playerid][arg1] = glob4597C[playerid][arg1] + 50;
		case 64:
			if(function8F248(playerid, 2))
			{
				SetPlayerAmmo(playerid, function8F1B4(playerid, 6), glob4597C[playerid][64]);
			}
			glob4597C[playerid][arg1] = glob4597C[playerid][arg1] + 50;
		case 65:
			if(function8F248(playerid, 2))
			{
				SetPlayerAmmo(playerid, function8F1B4(playerid, 7), glob4597C[playerid][65]);
			}
			glob4597C[playerid][arg1] = glob4597C[playerid][arg1] + 50;
	}
	return 0;
}

function8F1B4(playerid, arg1)
{
	new var0 = 0, var1 = 0;
	GetPlayerWeaponData(playerid, arg1, var0, var1);
	if(var0)
	{
		return var0;
	}
	return 0;
}

function8F248(playerid, arg1)
{
	new var0 = 0, var1 = 0;
	GetPlayerWeaponData(playerid, arg1, var0, var1);
	if(var0)
	{
		return 1;
	}
	return 0;
}

function8F2DC(playerid, arg1, arg2)
{
	if(arg2 == -1 || glob4597C[playerid][arg1] < arg2)
	{
		glob4597C[playerid][arg1] = 0;
	}
	else
	{
		glob4597C[playerid][arg1] = glob4597C[playerid][arg1] - arg2;
	}
	if(!glob4597C[playerid][arg1] && arg1 > 23 && arg1 < 48)
	{
		function8334(playerid, arg1 - 2);
	}
	return 0;
}

function8F508(playerid)
{
	GameTextForPlayer(playerid, "����!$$%&'()*+,-./01~!@#$^&*()_-+={[}]:;'<,>.?/", 1000, 0);
	GameTextForPlayer(playerid, "����!$$%&'()*+,-./01~!@#$^&*()_-+={[}]:;'<,>.?/", 2000, 1);
	GameTextForPlayer(playerid, "����!$$%&'()*+,-./01~!@#$^&*()_-+={[}]:;'<,>.?/", 3000, 2);
	GameTextForPlayer(playerid, "����!$$%&'()*+,-./01~!@#$^&*()_-+={[}]:;'<,>.?/", 4000, 3);
	GameTextForPlayer(playerid, "����!$$%&'()*+,-./01~!@#$^&*()_-+={[}]:;'<,>.?/", 5000, 4);
	GameTextForPlayer(playerid, "����!$$%&'()*+,-./01~!@#$^&*()_-+={[}]:;'<,>.?/", 6000, 5);
	GameTextForPlayer(playerid, "����!$$%&'()*+,-./01~!@#$^&*()_-+={[}]:;'<,>.?/", 7000, 6);
	return 0;
}

public update_xp(playerid)
{
	new var0 = GetPlayerScore(playerid);
	if(!glob4A930[playerid][4])
	{
		SetPlayerScore(playerid, var0 + 1);
	}
	if(glob4A33C[playerid][3] == 1 && !glob4A930[playerid][4])
	{
		SetPlayerScore(playerid, var0 + 2);
	}
	if(glob4A33C[playerid][3] == 2 && !glob4A930[playerid][4])
	{
		SetPlayerScore(playerid, var0 + 3);
	}
	if(glob4A33C[playerid][3] == 3 && !glob4A930[playerid][4])
	{
		SetPlayerScore(playerid, var0 + 5);
	}
	if(glob4A930[playerid][4] == 1)
	{
		switch(random(1)) {
			case 0:
				random(1);
				SetPlayerScore(playerid, var0 + 1);
			default:
				SetPlayerScore(playerid, var0);
		}
	}
	if(glob4A33C[playerid][9] == 1 && glob4A930[playerid][4] == 1)
	{
		switch(random(1)) {
			case 0:
				random(1);
				SetPlayerScore(playerid, var0 + 2);
			default:
				SetPlayerScore(playerid, var0);
		}
	}
	if(glob4A33C[playerid][9] == 2 && glob4A930[playerid][4] == 1)
	{
		switch(random(1)) {
			case 0:
				random(1);
				SetPlayerScore(playerid, var0 + 3);
			default:
				SetPlayerScore(playerid, var0);
		}
	}
	if(glob4A33C[playerid][9] == 3 && glob4A930[playerid][4] == 1)
	{
		switch(random(1)) {
			case 0:
				random(1);
				SetPlayerScore(playerid, var0 + 5);
			default:
				SetPlayerScore(playerid, var0);
		}
	}
	return 0;
}

function8FF10(playerid)
{
	new var0 = GetPlayerState(playerid);
	if(var0 && 7 != var0 && 8 != var0)
	{
		return 1;
	}
	return 0;
}

function8FFD4(playerid)
{
	switch(glob4A33C[playerid][14]) {
		case 2:
		case 5:
		case 4:
		case 6:
		case 3:
			function90B64(playerid);
			TextDrawShowForPlayer(playerid, glob4FB60[0]);
		case 12:
		case 13:
		case 14:
		case 10:
		case 11:
		case 9:
		case 8:
		case 7:
			function90B64(playerid);
			for(new var0 = 0; var0 < 2; var0++)
			{
				TextDrawShowForPlayer(playerid, glob4FB60[var0]);
			}
		case 22:
		case 23:
		case 24:
		case 25:
		case 21:
		case 20:
		case 17:
		case 18:
		case 19:
		case 16:
		case 15:
			function90B64(playerid);
			for(new var0 = 0; var0 < 3; var0++)
			{
				TextDrawShowForPlayer(playerid, glob4FB60[var0]);
			}
		case 36:
		case 35:
		case 37:
		case 38:
		case 33:
		case 39:
		case 32:
		case 34:
		case 27:
		case 26:
		case 29:
		case 28:
		case 31:
		case 30:
			function90B64(playerid);
			for(new var0 = 0; var0 < 4; var0++)
			{
				TextDrawShowForPlayer(playerid, glob4FB60[var0]);
			}
		case 51:
		case 50:
		case 52:
		case 53:
		case 55:
		case 49:
		case 54:
		case 56:
		case 48:
		case 47:
		case 46:
		case 42:
		case 40:
		case 43:
		case 41:
		case 45:
		case 44:
			function90B64(playerid);
			for(new var0 = 0; var0 < 5; var0++)
			{
				TextDrawShowForPlayer(playerid, glob4FB60[var0]);
			}
		case 70:
		case 69:
		case 68:
		case 71:
		case 67:
		case 73:
		case 72:
		case 75:
		case 74:
		case 66:
		case 76:
		case 64:
		case 59:
		case 57:
		case 65:
		case 60:
		case 58:
		case 63:
		case 62:
		case 61:
			function90B64(playerid);
			for(new var0 = 0; var0 < 6; var0++)
			{
				TextDrawShowForPlayer(playerid, glob4FB60[var0]);
			}
		case 94:
		case 93:
		case 91:
		case 92:
		case 95:
		case 99:
		case 97:
		case 96:
		case 89:
		case 98:
		case 88:
		case 90:
		case 86:
		case 78:
		case 80:
		case 77:
		case 87:
		case 81:
		case 79:
		case 83:
		case 85:
		case 82:
		case 84:
			function90B64(playerid);
			for(new var0 = 0; var0 < 7; var0++)
			{
				TextDrawShowForPlayer(playerid, glob4FB60[var0]);
			}
		case 117:
		case 116:
		case 115:
		case 118:
		case 125:
		case 119:
		case 124:
		case 121:
		case 114:
		case 120:
		case 123:
		case 122:
		case 113:
		case 109:
		case 111:
		case 101:
		case 103:
		case 100:
		case 112:
		case 104:
		case 102:
		case 106:
		case 108:
		case 105:
		case 107:
		case 110:
			function90B64(playerid);
			for(new var0 = 0; var0 < 8; var0++)
			{
				TextDrawShowForPlayer(playerid, glob4FB60[var0]);
			}
		case 141:
		case 139:
		case 142:
		case 140:
		case 143:
		case 148:
		case 145:
		case 138:
		case 144:
		case 147:
		case 146:
		case 137:
		case 132:
		case 135:
		case 127:
		case 128:
		case 126:
		case 149:
		case 136:
		case 129:
		case 131:
		case 130:
		case 134:
		case 133:
			function90B64(playerid);
			for(new var0 = 0; var0 < 9; var0++)
			{
				TextDrawShowForPlayer(playerid, glob4FB60[var0]);
			}
		case 150:
			for(new var0 = 0; var0 < 10; var0++)
			{
				TextDrawShowForPlayer(playerid, glob4FB60[var0]);
			}
		default:
			function90B64(playerid);
	}
	return 0;
}

function90B64(playerid)
{
	for(new var0 = 9; 0 <= var0; var0--)
	{
		TextDrawHideForPlayer(playerid, glob4FB60[var0]);
	}
	return 0;
}

public check_cars()
{
	new Float:var0 = 0.0;
	if(-1 != glob4CF28[0])
	{
		function6860(glob4CF28[0]);
		GetVehicleZAngle(glob4CF28[0], var0);
		if(GetVehicleDistanceFromPoint(glob4CF28[0], 1128564222, 3279272896, 1066558659) > 2 || var0 > 280 || var0 < 260)
		{
			function65A4(glob4CF28[0], 1128564222, 3279272896, 1066558659);
			SetVehicleZAngle(glob4CF28[0], 270.0);
		}
	}
	if(-1 != glob4CF28[1])
	{
		function6860(glob4CF28[1]);
		GetVehicleZAngle(glob4CF28[1], var0);
		if(GetVehicleDistanceFromPoint(glob4CF28[1], 1128564222, 3278945216, 1066558659) > 2 || var0 > 280 || var0 < 260)
		{
			function65A4(glob4CF28[1], 1128564222, 3278945216, 1066558659);
			SetVehicleZAngle(glob4CF28[1], 270.0);
		}
	}
	if(-1 != glob4CF28[2])
	{
		function6860(glob4CF28[2]);
		GetVehicleZAngle(glob4CF28[2], var0);
		if(GetVehicleDistanceFromPoint(glob4CF28[2], 1128564222, 3278617536, 1066558659) > 2 || var0 > 280 || var0 < 260)
		{
			function65A4(glob4CF28[2], 1128564222, 3278617536, 1066558659);
			SetVehicleZAngle(glob4CF28[2], 270.0);
		}
	}
	if(-1 != glob4CF28[3])
	{
		function6860(glob4CF28[3]);
		GetVehicleZAngle(glob4CF28[3], var0);
		if(GetVehicleDistanceFromPoint(glob4CF28[3], 1128564222, 3278289856, 1066558659) > 2 || var0 > 280 || var0 < 260)
		{
			function65A4(glob4CF28[3], 1128564222, 3278289856, 1066558659);
			SetVehicleZAngle(glob4CF28[3], 270.0);
		}
	}
	if(-1 != glob4CF28[4])
	{
		function6860(glob4CF28[4]);
		GetVehicleZAngle(glob4CF28[4], var0);
		if(GetVehicleDistanceFromPoint(glob4CF28[4], 1129935399, 3279256650, 1066558659) > 2 || var0 > 100 || var0 < 80)
		{
			function65A4(glob4CF28[4], 1129935399, 3279256650, 1066558659);
			SetVehicleZAngle(glob4CF28[4], 90.0);
		}
	}
	if(-1 != glob4CF28[5])
	{
		function6860(glob4CF28[5]);
		GetVehicleZAngle(glob4CF28[5], var0);
		if(GetVehicleDistanceFromPoint(glob4CF28[5], 1129935399, 3278928970, 1066558659) > 2 || var0 > 100 || var0 < 80)
		{
			function65A4(glob4CF28[5], 1129935399, 3278928970, 1066558659);
			SetVehicleZAngle(glob4CF28[5], 90.0);
		}
	}
	if(-1 != glob4CF28[6])
	{
		function6860(glob4CF28[6]);
		GetVehicleZAngle(glob4CF28[6], var0);
		if(GetVehicleDistanceFromPoint(glob4CF28[6], 1129935399, 3278601290, 1066558659) > 2 || var0 > 100 || var0 < 80)
		{
			function65A4(glob4CF28[6], 1129935399, 3278601290, 1066558659);
			SetVehicleZAngle(glob4CF28[6], 90.0);
		}
	}
	if(-1 != glob4CF28[7])
	{
		function6860(glob4CF28[7]);
		GetVehicleZAngle(glob4CF28[7], var0);
		if(GetVehicleDistanceFromPoint(glob4CF28[7], 1129935399, 3278273610, 1066558659) > 2 || var0 > 100 || var0 < 80)
		{
			function65A4(glob4CF28[7], 1129935399, 3278273610, 1066558659);
			SetVehicleZAngle(glob4CF28[7], 90.0);
		}
	}
	function6860(glob4CFA8);
	GetVehicleZAngle(glob4CFA8, var0);
	if(GetVehicleDistanceFromPoint(glob4CFA8, 1144270760, 3286373063, 1098975438) > 2 || var0 > 100 || var0 < 80)
	{
		function65A4(glob4CFA8, 1144270760, 3286373063, 1098975438);
		SetVehicleZAngle(glob4CFA8, 180.0);
	}
	return 1;
}

function91F74(playerid)
{
	if(IsPlayerInAnyVehicle(playerid))
	{
		RemovePlayerFromVehicle(playerid);
		glob4CFCC[playerid][0] = 0;
		glob4CFCC[playerid][1] = 0;
		glob4CFCC[playerid][2] = 0;
		glob4CFCC[playerid][3] = 0;
		PlayerTextDrawShow(playerid, glob51864[playerid]);
		PlayerTextDrawShow(playerid, glob518B4[playerid]);
		PlayerTextDrawShow(playerid, glob51904[playerid]);
		PlayerTextDrawShow(playerid, glob51954[playerid]);
		PlayerTextDrawShow(playerid, glob519A4[playerid]);
		PlayerTextDrawShow(playerid, glob519F4[playerid]);
		PlayerTextDrawShow(playerid, glob51A44[playerid]);
		PlayerTextDrawShow(playerid, glob51A94[playerid]);
		PlayerTextDrawShow(playerid, glob51AE4[playerid]);
		ApplyAnimation(playerid, "VENDING", "VEND_Use", 1.0, 0, 0, 0, 0, 1500, 1);
	}
	return 0;
}

public degaline_use(arg0)
{
	function9302C(arg0);
	new var0[2];
	glob4B510[glob4D33C[arg0]][2]++;
	glob4CFCC[arg0][0]++;
	glob4CFCC[arg0][3]++;
	if(glob4CFCC[arg0][3] == 10)
	{
		glob4CFCC[arg0][3] = 0;
		glob4CFCC[arg0][2]++;
	}
	if(glob4CFCC[arg0][2] == 10)
	{
		glob4CFCC[arg0][2] = 0;
		glob4CFCC[arg0][1]++;
	}
	glob4D15C[arg0][0] = glob4D15C[arg0][0] + 3;
	glob4D15C[arg0][4] = glob4D15C[arg0][4] + 3;
	if(glob4D15C[arg0][4] == 12)
	{
		glob4D15C[arg0][4] = 2;
		glob4D15C[arg0][3]++;
	}
	if(glob4D15C[arg0][4] == 11)
	{
		glob4D15C[arg0][4] = 1;
		glob4D15C[arg0][3]++;
	}
	if(glob4D15C[arg0][4] == 10)
	{
		glob4D15C[arg0][4] = 0;
		glob4D15C[arg0][3]++;
	}
	if(glob4D15C[arg0][3] == 10)
	{
		glob4D15C[arg0][3] = 0;
		glob4D15C[arg0][2]++;
	}
	if(glob4D15C[arg0][2] == 10)
	{
		glob4D15C[arg0][2] = 0;
		glob4D15C[arg0][1]++;
	}
	format(var0, 2, "%i", glob4CFCC[arg0][3]);
	PlayerTextDrawSetString(arg0, glob519A4[arg0], var0);
	format(var0, 2, "%i", glob4CFCC[arg0][2]);
	PlayerTextDrawSetString(arg0, glob51954[arg0], var0);
	format(var0, 2, "%i", glob4CFCC[arg0][1]);
	PlayerTextDrawSetString(arg0, glob51904[arg0], var0);
	format(var0, 2, "%i", glob4D15C[arg0][4]);
	PlayerTextDrawSetString(arg0, glob518B4[arg0], var0);
	format(var0, 2, "%i", glob4D15C[arg0][3]);
	PlayerTextDrawSetString(arg0, glob51A44[arg0], var0);
	format(var0, 2, "%i", glob4D15C[arg0][2]);
	PlayerTextDrawSetString(arg0, glob519F4[arg0], var0);
	format(var0, 2, "%i", glob4D15C[arg0][1]);
	PlayerTextDrawSetString(arg0, glob51A94[arg0], var0);
	return 1;
}

function9302C(arg0)
{
	function674C(arg0, 0);
	return 0;
}

function9305C(playerid)
{
	new Float:var0 = 0.0, Float:var1 = 0.0, Float:var2 = 0.0, Float:var3 = 0.0;
	function543B4(playerid, var0, var1, var2, var3, 6.0);
	var0 = var0 + random(3) + 2;
	var1 = var1 + random(3) + 2;
	SetPlayerCameraPos(playerid, var0, var1, var2 + 4);
	GetPlayerPos(playerid, var0, var1, var2);
	SetPlayerCameraLookAt(playerid, var0, var1, var2, 1);
	function9302C(playerid);
	return 0;
}

function932D8(arg0)
{
	function674C(arg0, 1);
	return 0;
}

function93308(playerid)
{
	function674C(playerid, 1);
	SetCameraBehindPlayer(playerid);
	ClearAnimations(playerid, 0);
	return 0;
}

public car_degalai(playerid)
{
	if(function8680(playerid))
	{
		new var0[7], var1 = GetPlayerVehicleID(playerid);
		GetVehicleParamsEx(var1, var0, var0, var0, var0, var0, var0, var0);
		if(0 < glob4B510[var1][2])
		{
			if(!var0[6])
			{
				SetVehicleParamsEx(var1, 1, var0[0], var0[1], var0[2], var0[3], var0[4], var0[5]);
			}
			glob4B510[var1][2]--;
		}
		if(glob4B510[var1][2] < 1)
		{
			SetVehicleParamsEx(var1, 0, var0[0], var0[1], var0[2], var0[3], var0[4], var0[5]);
			function98144(playerid, 478280);
		}
	}
	return 0;
}

function93738(playerid)
{
	new Menu:var0[256];
	strdel(glob4D42C, 0, 2050);
	format(var0, 256, "{FFAE00}|____________________________________|Serverio ReadMe|____________________________________|\n{96FF00}%s,\nmalonu kad prisijungei prie m�s�!\n\n", function9D970(playerid));
	format(glob4D42C, 2050, var0);
	strcat(glob4D42C, "{89B0FF}Kad �aidimas b�t� kiek �manoma malonesnis, rekomenduoju perskaityti \ninformacij�, pateikt� �emiau. \n\nVis� pirma, prakti�kai visos durys, visi vartai yra darin�jami su ENTER.", 2050);
	strcat(glob4D42C, "Taip pat ir su \nNPC.\n \nAntra, jeigu tik kokia technin� b�da i�tiko, visada yra komanda /fix. Ji automati�kai \naptiks ir sutvarkys mums �inomus bugus, kuri� i�taisyti neina. \n\n", 2050);
	strcat(glob4D42C, "Tre�ia, negadinkite sau nerv� ir neeksperementuokite su anti �ytu. A� tikrai neturiu \ndidelio noro klausytis kaip �ia nety�ia viskas buvo, kaip j�s nieko nedar�te, bet \nma�ina pati ", 2050);
	strcat(glob4D42C, "u�sitiuningavo arba ka�kas � jus atsitrenk� ir j�s nuskridote +300km/h \ngrei�iu tiesiai � mechanik� gara�� kur jums susitais� ma�ina. Serveryje yra \npasiekim� sistema. Visi �aid�jai ", 2050);
	strcat(glob4D42C, "pasiek� 100k patirties be jokio kicko ar bano nuo \nanti�yto, gaus priz�. O a� dosnus. Jeigu per visi�k� atsitiktinum� buvote neteisingai \ni�metas ar u�banintas, ir jeigu tai �rodysite ", 2050);
	strcat(glob4D42C, "kickas ar banas bus anuliuotas.\n\nNa ir vis� detalesn� informacij� rasite para�� komand� '/apie'.\n\nS�km�s �aidime!", 2050);
	function31714(playerid, "dialog_readme", 0, 483072, 316460, 483168, 483212);
	return 0;
}

public CheckPaused()
{
	for(new var0 = 20; 20 != var0 = glob31D0[var0]; )
	{
		if(glob4A8E0[var0] > 2 && !glob4A930[var0][4])
		{
			glob4A930[var0][4] = 1;
			CallLocalFunction(483216, 483272, var0);
		}
		else if(glob4A8E0[var0] < 3 && glob4A930[var0][4] == 1)
		{
			glob4A930[var0][4] = 0;
			CallLocalFunction(483280, 483344, var0);
		}
		glob4A8E0[var0]++;
	}
	return 1;
}

public car_buy_timer(playerid)
{
	if(!function91A0(playerid, 207.373, -237.105, 25.0))
	{
		if(IsPlayerInVehicle(playerid, glob4A33C[playerid][6]))
		{
			new Float:var0 = 0.0, Float:var1 = 0.0, Float:var2 = 0.0, Float:var3 = 0.0;
			glob4CF68 = random(6) + 32;
			glob4CF6C = random(6) + 32;
			glob4CF70 = random(6) + 32;
			glob4CF74 = random(6) + 32;
			glob4CF78 = random(6) + 32;
			glob4CF7C = random(6) + 32;
			glob4CF80 = random(6) + 32;
			glob4CF84 = random(6) + 32;
			glob4CF88 = random(6) + 32;
			glob4CF8C = random(6) + 32;
			glob4CF90 = random(6) + 32;
			glob4CF94 = random(6) + 32;
			glob4CF98 = random(6) + 32;
			glob4CF9C = random(6) + 32;
			glob4CFA0 = random(6) + 32;
			glob4CFA4 = random(6) + 32;
			if(glob4CF28[0] == -1)
			{
				glob4CF28[0] = function689C(475, 1128564222, 3279272896, 1082952516, 1132920832, glob4CF68, glob4CF6C, 1000);
				glob4CA78[glob4CF28[0]][0] = glob4CF68;
				glob4CA78[glob4CF28[0]][1] = glob4CF6C;
				glob4CFAC[0] = 0;
				function54584(glob4CF28[0], var0, var1, var2, var3, 1.0);
				SetDynamicObjectMaterialText(glob4CF48[0], 0, 90, 483352, 72, 1, 4294967295, 0, 1);
				AttachDynamicObjectToVehicle(glob4CF48[0], glob4CF28[0], 0, 1069547520, 1059481190, 0, 0, 1127481344);
				KillTimer(glob4F514[playerid]);
			}
			if(glob4CF28[1] == -1)
			{
				glob4CF28[1] = function689C(410, 1128564222, 3278945216, 1082952516, 1132920832, glob4CF70, glob4CF74, 1000);
				glob4CA78[glob4CF28[1]][0] = glob4CF70;
				glob4CA78[glob4CF28[1]][1] = glob4CF74;
				glob4CFAC[1] = 0;
				function54584(glob4CF28[1], var0, var1, var2, var3, 1.0);
				SetDynamicObjectMaterialText(glob4CF48[1], 0, 90, 483380, 72, 1, 4294967295, 0, 1);
				AttachDynamicObjectToVehicle(glob4CF48[1], glob4CF28[1], 0, 1069547520, 1059481190, 0, 0, 1127481344);
				KillTimer(glob4F514[playerid]);
			}
			if(glob4CF28[2] == -1)
			{
				glob4CF28[2] = function689C(412, 1128564222, 3278617536, 1082952516, 1132920832, glob4CF78, glob4CF7C, 1000);
				glob4CA78[glob4CF28[2]][0] = glob4CF78;
				glob4CA78[glob4CF28[2]][1] = glob4CF7C;
				glob4CFAC[2] = 0;
				function54584(glob4CF28[2], var0, var1, var2, var3, 1.0);
				SetDynamicObjectMaterialText(glob4CF48[2], 0, 90, 483408, 72, 1, 4294967295, 0, 1);
				AttachDynamicObjectToVehicle(glob4CF48[2], glob4CF28[2], 0, 1069547520, 1059481190, 0, 0, 1127481344);
				KillTimer(glob4F514[playerid]);
			}
			if(glob4CF28[3] == -1)
			{
				glob4CF28[3] = function689C(419, 1128564222, 3278289856, 1082952516, 1132920832, glob4CF80, glob4CF84, 1000);
				glob4CA78[glob4CF28[3]][0] = glob4CF80;
				glob4CA78[glob4CF28[3]][1] = glob4CF84;
				glob4CFAC[3] = 0;
				function54584(glob4CF28[3], var0, var1, var2, var3, 1.0);
				SetDynamicObjectMaterialText(glob4CF48[3], 0, 90, 483436, 72, 1, 4294967295, 0, 1);
				AttachDynamicObjectToVehicle(glob4CF48[3], glob4CF28[3], 0, 1069547520, 1059481190, 0, 0, 1127481344);
				KillTimer(glob4F514[playerid]);
			}
			if(glob4CF28[4] == -1)
			{
				glob4CF28[4] = function689C(492, 1129935399, 3279256650, 1068809322, 1119092736, glob4CF88, glob4CF8C, 1000);
				glob4CA78[glob4CF28[4]][0] = glob4CF88;
				glob4CA78[glob4CF28[4]][1] = glob4CF8C;
				glob4CFAC[4] = 0;
				function54584(glob4CF28[4], var0, var1, var2, var3, 1.0);
				SetDynamicObjectMaterialText(glob4CF48[4], 0, 90, 483464, 72, 1, 4294967295, 0, 1);
				AttachDynamicObjectToVehicle(glob4CF48[4], glob4CF28[4], 0, 1069547520, 1059481190, 0, 0, 1127481344);
				KillTimer(glob4F514[playerid]);
			}
			if(glob4CF28[5] == -1)
			{
				glob4CF28[5] = function689C(549, 1129935399, 3278928970, 1068809322, 1119092736, glob4CF90, glob4CF94, 1000);
				glob4CA78[glob4CF28[5]][0] = glob4CF90;
				glob4CA78[glob4CF28[5]][1] = glob4CF94;
				glob4CFAC[5] = 0;
				function54584(glob4CF28[5], var0, var1, var2, var3, 1.0);
				SetDynamicObjectMaterialText(glob4CF48[5], 0, 90, 483492, 72, 1, 4294967295, 0, 1);
				AttachDynamicObjectToVehicle(glob4CF48[5], glob4CF28[5], 0, 1069547520, 1059481190, 0, 0, 1127481344);
				KillTimer(glob4F514[playerid]);
			}
			if(glob4CF28[6] == -1)
			{
				glob4CF28[6] = function689C(462, 1129935399, 3278601290, 1068809322, 1119092736, glob4CF98, glob4CF9C, 1000);
				glob4CA78[glob4CF28[6]][0] = glob4CF98;
				glob4CA78[glob4CF28[6]][1] = glob4CF9C;
				glob4CFAC[6] = 0;
				function54584(glob4CF28[6], var0, var1, var2, var3, 1.0);
				SetDynamicObjectMaterialText(glob4CF48[6], 0, 90, 483520, 72, 1, 4294967295, 0, 1);
				AttachDynamicObjectToVehicle(glob4CF48[6], glob4CF28[6], 0, 1069547520, 1059481190, 0, 0, 1127481344);
				KillTimer(glob4F514[playerid]);
			}
			if(glob4CF28[7] == -1)
			{
				glob4CF28[7] = function689C(542, 1129935399, 3278273610, 1068809322, 1119092736, glob4CFA0, glob4CFA4, 1000);
				glob4CA78[glob4CF28[7]][0] = glob4CFA0;
				glob4CA78[glob4CF28[7]][1] = glob4CFA4;
				glob4CFAC[7] = 0;
				function54584(glob4CF28[7], var0, var1, var2, var3, 1.0);
				SetDynamicObjectMaterialText(glob4CF48[7], 0, 90, 483548, 72, 1, 4294967295, 0, 1);
				AttachDynamicObjectToVehicle(glob4CF48[7], glob4CF28[7], 0, 1069547520, 1059481190, 0, 0, 1127481344);
				KillTimer(glob4F514[playerid]);
			}
		}
	}
	return 0;
}

public spd()
{
	for(new var0 = 20; 20 != var0 = glob31D0[var0]; )
	{
		if(function8680(var0))
		{
			new var1[16], var2 = function69E8(var0, 0), var3 = GetPlayerVehicleID(var0);
			GetVehicleHealth(var3, glob76148[var0]);
			if(glob760F8[var0] > var2 - 90 && glob76148[var0][0] < glob76148[var0][1] - 400.0)
			{
				function9660C(var0, var3);
				return 1;
			}
			if(var2 > 300)
			{
				function674C(var0, 0);
				SetTimerEx("tpct", 3000, false, "i", var0);
				return 1;
			}
			format(var1, 16, "%i", var2);
			PlayerTextDrawSetString(var0, glob51184[var0], var1);
			glob4B510[var3][3] = glob4B510[var3][3] + (var2 / 18000);
			format(var1, 16, "%i", glob4B510[var3][2]);
			PlayerTextDrawSetString(var0, glob51364[var0], var1);
			format(var1, 16, "%.1f", glob4B510[var3][3]);
			PlayerTextDrawSetString(var0, glob513B4[var0], var1);
			glob76148[var0][1] = glob76148[var0][0];
			glob760F8[var0] = var2;
			GetVehicleVelocity(var3, glob76238[var3], glob76238[var3], glob76238[var3]);
		}
	}
	return 1;
}

function9660C(playerid, arg1)
{
	ClearAnimations(playerid, 0);
	ApplyAnimation(playerid, "PARACHUTE", "FALL_skyDive_DIE", 4.0, 0, 0, 0, 1, 0, 0);
	new Float:var0 = 0.0, Float:var1 = 0.0, Float:var2 = 0.0;
	GetVehiclePos(arg1, var0, var1, var2);
	function64FC(playerid, var0, var1, var2 + 2);
	SetPlayerVelocity(playerid, glob76238[arg1][0], glob76238[arg1][1], var2 + 1);
	SendClientMessage(playerid, 0xFF1111FF, "Bum");
	glob760F8[playerid] = 0;
	glob76148[playerid][1] = 0;
	return 0;
}

public tpct(arg0)
{
	function674C(arg0, 1);
	return 0;
}

function96930(playerid)
{
	for(new var0 = 0; var0 < 65; var0++)
	{
		PlayerTextDrawHide(playerid, glob4FB88[playerid][var0]);
	}
	function30C00(playerid, glob479AC[playerid]);
	return 0;
}

function96A30(playerid, arg1)
{
	function96930(playerid);
	new var0 = 0, var1[32], var2 = 12, var3 = 0, Float:var4 = 0.0;
	switch(arg1) {
		case 0:
			var0 = 0;
		case 1:
			var0 = function97A70(playerid);
		case 2:
			var0 = function97BF0(playerid);
		case 3:
			var0 = function97D70(playerid);
	}
	format(var1, 32, "%i", glob49ACC[playerid][13] + 1);
	PlayerTextDrawSetString(playerid, glob4FB88[playerid][11], var1);
	PlayerTextDrawShow(playerid, glob4FB88[playerid][11]);
	glob4C050[playerid] = 3;
	glob49ACC[playerid][17] = -1;
	glob49ACC[playerid][16] = -1;
	glob49ACC[playerid][15] = -1;
	glob49ACC[playerid][12] = -1;
	for(new var5 = 0; var5 < 12; var5++)
	{
		PlayerTextDrawShow(playerid, glob4FB88[playerid][var5]);
	}
	PlayerTextDrawShow(playerid, glob4FB88[playerid][64]);
	function30E38(playerid, glob479AC[playerid], function54C04(playerid));
	function309C8(playerid, glob479AC[playerid]);
	if(!glob49ACC[playerid][13])
	{
		PlayerTextDrawHide(playerid, glob4FB88[playerid][10]);
	}
	else
	{
		PlayerTextDrawShow(playerid, glob4FB88[playerid][10]);
	}
	if(glob49ACC[playerid][13] + 1 == function97EA8(playerid))
	{
		PlayerTextDrawHide(playerid, glob4FB88[playerid][9]);
	}
	else
	{
		PlayerTextDrawShow(playerid, glob4FB88[playerid][9]);
	}
	if(!function54958(playerid))
	{
		new var5 = var0;
		while(++var5 < 102 && var3 < 13)
		{
			if(!function54A90(playerid, var5))
			{
			}
			else
			{
			}
		}
		glob49ACC[playerid][var3] = var5;
		var3++;
		if(glob47A4C[playerid][var5] == 1)
		{
			PlayerTextDrawColor(playerid, glob4FB88[playerid][var2], 2549890303);
		}
		else
		{
			PlayerTextDrawColor(playerid, glob4FB88[playerid][var2], 4294967295);
		}
		format(var1, 32, "%s", glob44490[var5][0]);
		PlayerTextDrawSetString(playerid, glob4FB88[playerid][var2], var1);
		PlayerTextDrawShow(playerid, glob4FB88[playerid][var2]);
		var2++;
		function98024(playerid);
		format(var1, 32, "%i", function54A90(playerid, var5));
		PlayerTextDrawSetString(playerid, glob4FB88[playerid][var2], var1);
		PlayerTextDrawShow(playerid, glob4FB88[playerid][var2]);
		var2++;
		var4 = function54B70(playerid, var5);
		format(var1, 32, "%.1fkg");
		PlayerTextDrawSetString(playerid, glob4FB88[playerid][var2], var1);
		PlayerTextDrawShow(playerid, glob4FB88[playerid][var2]);
		var2++;
		format(var1, 32, "%i", function54AE4(playerid, var5));
		PlayerTextDrawSetString(playerid, glob4FB88[playerid][var2], var1);
		PlayerTextDrawShow(playerid, glob4FB88[playerid][var2]);
		var2++;
	}
	return 0;
}

function97A70(arg0)
{
	glob49ACC[arg0][13]++;
	new var0 = 0, var1 = glob49ACC[arg0][13] * 13;
	for(new var2 = 0; var2 < 102; var2++)
	{
		if(!function54A90(arg0, var2))
		{
		}
		else
		{
			var0++;
		}
	}
	if(var0 == var1)
	{
		return var2;
	}
	return 0;
}

function97BF0(arg0)
{
	glob49ACC[arg0][13]--;
	new var0 = 0, var1 = glob49ACC[arg0][13] * 13;
	for(new var2 = 0; var2 < 102; var2++)
	{
		if(!function54A90(arg0, var2))
		{
		}
		else
		{
			var0++;
		}
	}
	if(var0 == var1)
	{
		return var2;
	}
	return 0;
}

function97D70(arg0)
{
	new var0 = 0, var1 = glob49ACC[arg0][13] * 13;
	for(new var2 = 0; var2 < 102; var2++)
	{
		if(!function54A90(arg0, var2))
		{
		}
		else
		{
			var0++;
		}
	}
	if(var0 == var1)
	{
		return var2;
	}
	return 0;
}

function97EA8(arg0)
{
	if(function54958(arg0))
	{
		return 1;
	}
	new var0 = 0, var1 = 0;
	for(new var2 = 0; var2 < 102; var2++)
	{
		if(!function54A90(arg0, var2))
		{
		}
		else
		{
			var0++;
		}
	}
	while(var0 >= 13)
	{
		var0 = var0 - 13;
		var1++;
	}
	if(!var0)
	{
		return var1;
	}
	return var1 + 1;
}

function98024(playerid)
{
	new var0 = 0, var1 = 0;
	for(new var2 = 2; var2 < 8; var2++)
	{
		GetPlayerWeaponData(playerid, var2, var0, var1);
		if(var0)
		{
			glob4597C[playerid][var2 + 60] = var1;
		}
	}
	return 0;
}

function98144(arg0, arg1)
{
	KillTimer(glob4F8D4[arg0]);
	PlayerTextDrawHide(arg0, glob51C68[arg0]);
	PlayerTextDrawHide(arg0, glob51CB8[arg0]);
	PlayerTextDrawShow(arg0, glob51C68[arg0]);
	PlayerTextDrawShow(arg0, glob51CB8[arg0]);
	PlayerTextDrawSetString(arg0, glob51CB8[arg0], arg1);
	glob4F8D4[arg0] = SetTimerEx("hide_notification", 2000, false, "i", arg0);
	return 1;
}

public hide_notification(arg0)
{
	PlayerTextDrawHide(arg0, glob51C68[arg0]);
	PlayerTextDrawHide(arg0, glob51CB8[arg0]);
	return 0;
}

function983F0(arg0)
{
	PlayerTextDrawSetSelectable(arg0, glob514A4[arg0], 1);
	PlayerTextDrawSetSelectable(arg0, glob514F4[arg0], 1);
	PlayerTextDrawSetSelectable(arg0, glob51544[arg0], 1);
	PlayerTextDrawSetSelectable(arg0, glob51594[arg0], 1);
	PlayerTextDrawSetSelectable(arg0, glob515E4[arg0], 1);
	PlayerTextDrawSetSelectable(arg0, glob51634[arg0], 1);
	PlayerTextDrawSetSelectable(arg0, glob51684[arg0], 1);
	PlayerTextDrawSetSelectable(arg0, glob516D4[arg0], 1);
	PlayerTextDrawSetSelectable(arg0, glob51724[arg0], 1);
	PlayerTextDrawSetSelectable(arg0, glob51774[arg0], 1);
	PlayerTextDrawSetSelectable(arg0, glob51814[arg0], 1);
	PlayerTextDrawShow(arg0, glob51454[arg0]);
	PlayerTextDrawShow(arg0, glob514A4[arg0]);
	PlayerTextDrawShow(arg0, glob514F4[arg0]);
	PlayerTextDrawShow(arg0, glob51544[arg0]);
	PlayerTextDrawShow(arg0, glob51594[arg0]);
	PlayerTextDrawShow(arg0, glob515E4[arg0]);
	PlayerTextDrawShow(arg0, glob51634[arg0]);
	PlayerTextDrawShow(arg0, glob51684[arg0]);
	PlayerTextDrawShow(arg0, glob516D4[arg0]);
	PlayerTextDrawShow(arg0, glob51724[arg0]);
	PlayerTextDrawShow(arg0, glob51774[arg0]);
	PlayerTextDrawShow(arg0, glob517C4[arg0]);
	PlayerTextDrawShow(arg0, glob51814[arg0]);
	return 0;
}

function98AB4(arg0)
{
	glob4C050[arg0] = 0;
	PlayerTextDrawHide(arg0, glob51454[arg0]);
	PlayerTextDrawHide(arg0, glob514A4[arg0]);
	PlayerTextDrawHide(arg0, glob514F4[arg0]);
	PlayerTextDrawHide(arg0, glob51544[arg0]);
	PlayerTextDrawHide(arg0, glob51594[arg0]);
	PlayerTextDrawHide(arg0, glob515E4[arg0]);
	PlayerTextDrawHide(arg0, glob51634[arg0]);
	PlayerTextDrawHide(arg0, glob51684[arg0]);
	PlayerTextDrawHide(arg0, glob516D4[arg0]);
	PlayerTextDrawHide(arg0, glob51724[arg0]);
	PlayerTextDrawHide(arg0, glob51774[arg0]);
	PlayerTextDrawHide(arg0, glob517C4[arg0]);
	PlayerTextDrawHide(arg0, glob51814[arg0]);
	return 0;
}

function98E60(playerid)
{
	PlayerTextDrawHide(playerid, glob51B78[playerid]);
	PlayerTextDrawHide(playerid, glob51BC8[playerid]);
	PlayerTextDrawHide(playerid, glob51C18[playerid]);
	TextDrawHideForPlayer(playerid, glob51B60);
	TextDrawHideForPlayer(playerid, glob51B64);
	TextDrawHideForPlayer(playerid, glob51B68);
	TextDrawHideForPlayer(playerid, glob51B6C);
	TextDrawHideForPlayer(playerid, glob51B70);
	TextDrawHideForPlayer(playerid, glob51B74);
	return 0;
}

function99040(arg0)
{
	glob4C050[arg0] = 1;
	PlayerTextDrawSetString(arg0, glob51454[arg0], 485848);
	PlayerTextDrawSetString(arg0, glob514A4[arg0], 486044);
	PlayerTextDrawSetString(arg0, glob514F4[arg0], 486072);
	PlayerTextDrawSetString(arg0, glob51544[arg0], 486120);
	PlayerTextDrawSetString(arg0, glob51594[arg0], 486156);
	PlayerTextDrawSetString(arg0, glob515E4[arg0], 486192);
	PlayerTextDrawSetString(arg0, glob51634[arg0], 486244);
	PlayerTextDrawSetString(arg0, glob51684[arg0], 486292);
	PlayerTextDrawSetString(arg0, glob516D4[arg0], 486336);
	PlayerTextDrawSetString(arg0, glob51724[arg0], 486344);
	PlayerTextDrawSetString(arg0, glob51814[arg0], 486352);
	return 0;
}

function993C0(playerid)
{
	glob4C050[playerid] = 2;
	PlayerTextDrawSetString(playerid, glob51454[playerid], 486372);
	if(function91A0(playerid, 64.134, -229.7443, 10.0) || (function91A0(playerid, 2237.4167, 27.6812, 10.0) && function8680(playerid) && !glob4A930[playerid][6]))
	{
		PlayerTextDrawSetString(playerid, glob514A4[playerid], 486608);
	}
	else
	{
		PlayerTextDrawSetString(playerid, glob514A4[playerid], 486664);
	}
	PlayerTextDrawSetString(playerid, glob514F4[playerid], 486672);
	PlayerTextDrawSetString(playerid, glob51544[playerid], 486680);
	PlayerTextDrawSetString(playerid, glob51594[playerid], 486688);
	PlayerTextDrawSetString(playerid, glob515E4[playerid], 486720);
	PlayerTextDrawSetString(playerid, glob51634[playerid], 486752);
	PlayerTextDrawSetString(playerid, glob51684[playerid], 486776);
	PlayerTextDrawSetString(playerid, glob516D4[playerid], 486824);
	PlayerTextDrawSetString(playerid, glob51724[playerid], 486852);
	PlayerTextDrawSetString(playerid, glob51814[playerid], 486876);
	return 0;
}

function998D4(playerid)
{
	if(glob4D38C[playerid] < 1 || glob4D38C[playerid] > 8)
	{
		glob4D38C[playerid] = 1;
	}
	switch(glob4D38C[playerid]) {
		case 1:
			SetPlayerCameraPos(playerid, 203.5216, -238.0611, 1.25);
			SetPlayerCameraLookAt(playerid, 196.5234, -240.7334, 1.3919, 1);
			PlayerTextDrawSetString(playerid, glob51B78[playerid], glob4BE70[glob4D38C[playerid]]);
			PlayerTextDrawSetString(playerid, glob51BC8[playerid], glob4BE70[glob4D38C[playerid]]);
			if(!glob4A33C[playerid][9])
			{
				PlayerTextDrawSetString(playerid, glob51C18[playerid]);
			}
			else
			{
				PlayerTextDrawSetString(playerid, glob51C18[playerid]);
			}
			glob4D38C[playerid] = 2;
			return 1;
		case 2:
			SetPlayerCameraPos(playerid, 203.5216, -233.0611, 1.25);
			SetPlayerCameraLookAt(playerid, 196.5234, -235.7334, 1.3919, 1);
			PlayerTextDrawSetString(playerid, glob51B78[playerid], glob4BE70[glob4D38C[playerid]]);
			PlayerTextDrawSetString(playerid, glob51BC8[playerid], glob4BE70[glob4D38C[playerid]]);
			if(!glob4A33C[playerid][9])
			{
				PlayerTextDrawSetString(playerid, glob51C18[playerid]);
			}
			else
			{
				PlayerTextDrawSetString(playerid, glob51C18[playerid]);
			}
			glob4D38C[playerid] = 3;
			return 1;
		case 3:
			SetPlayerCameraPos(playerid, 203.5216, -228.0611, 1.25);
			SetPlayerCameraLookAt(playerid, 196.5234, -230.7334, 1.3919, 1);
			PlayerTextDrawSetString(playerid, glob51B78[playerid], glob4BE70[glob4D38C[playerid]]);
			PlayerTextDrawSetString(playerid, glob51BC8[playerid], glob4BE70[glob4D38C[playerid]]);
			if(!glob4A33C[playerid][9])
			{
				PlayerTextDrawSetString(playerid, glob51C18[playerid]);
			}
			else
			{
				PlayerTextDrawSetString(playerid, glob51C18[playerid]);
			}
			glob4D38C[playerid] = 4;
			return 1;
		case 7:
			SetPlayerCameraPos(playerid, 211.7014, -228.3306, 1.25);
			SetPlayerCameraLookAt(playerid, 217.4459, -230.4856, 1.4119, 1);
			PlayerTextDrawSetString(playerid, glob51B78[playerid], glob4BE70[glob4D38C[playerid]]);
			PlayerTextDrawSetString(playerid, glob51BC8[playerid], glob4BE70[glob4D38C[playerid]]);
			if(!glob4A33C[playerid][9])
			{
				PlayerTextDrawSetString(playerid, glob51C18[playerid]);
			}
			else
			{
				PlayerTextDrawSetString(playerid, glob51C18[playerid]);
			}
			glob4D38C[playerid] = 8;
			return 1;
		case 6:
			SetPlayerCameraPos(playerid, 211.7014, -233.3306, 1.25);
			SetPlayerCameraLookAt(playerid, 217.4459, -235.4856, 1.4119, 1);
			PlayerTextDrawSetString(playerid, glob51B78[playerid], glob4BE70[glob4D38C[playerid]]);
			PlayerTextDrawSetString(playerid, glob51BC8[playerid], glob4BE70[glob4D38C[playerid]]);
			if(!glob4A33C[playerid][9])
			{
				PlayerTextDrawSetString(playerid, glob51C18[playerid]);
			}
			else
			{
				PlayerTextDrawSetString(playerid, glob51C18[playerid]);
			}
			glob4D38C[playerid] = 7;
			return 1;
		case 5:
			SetPlayerCameraPos(playerid, 211.7014, -238.3306, 1.25);
			SetPlayerCameraLookAt(playerid, 217.4459, -240.4856, 1.4119, 1);
			PlayerTextDrawSetString(playerid, glob51B78[playerid], glob4BE70[glob4D38C[playerid]]);
			PlayerTextDrawSetString(playerid, glob51BC8[playerid], glob4BE70[glob4D38C[playerid]]);
			if(!glob4A33C[playerid][9])
			{
				PlayerTextDrawSetString(playerid, glob51C18[playerid]);
			}
			else
			{
				PlayerTextDrawSetString(playerid, glob51C18[playerid]);
			}
			glob4D38C[playerid] = 6;
			return 1;
		case 4:
			SetPlayerCameraPos(playerid, 211.7014, -243.3306, 1.25);
			SetPlayerCameraLookAt(playerid, 217.4459, -245.4856, 1.4119, 1);
			PlayerTextDrawSetString(playerid, glob51B78[playerid], glob4BE70[glob4D38C[playerid]]);
			PlayerTextDrawSetString(playerid, glob51BC8[playerid], glob4BE70[glob4D38C[playerid]]);
			if(!glob4A33C[playerid][9])
			{
				PlayerTextDrawSetString(playerid, glob51C18[playerid]);
			}
			else
			{
				PlayerTextDrawSetString(playerid, glob51C18[playerid]);
			}
			glob4D38C[playerid] = 5;
			return 1;
		case 8:
			SetPlayerCameraPos(playerid, 203.5216, -243.0611, 1.25);
			SetPlayerCameraLookAt(playerid, 196.5234, -245.7334, 1.3919, 1);
			PlayerTextDrawSetString(playerid, glob51B78[playerid], glob4BE70[0]);
			PlayerTextDrawSetString(playerid, glob51BC8[playerid], glob4BE70[0]);
			PlayerTextDrawSetString(playerid, glob51C18[playerid]);
			glob4D38C[playerid] = 1;
			return 1;
	}
	return 1;
}

function9B804(playerid)
{
	if(glob4D38C[playerid] < 1 || glob4D38C[playerid] > 8)
	{
		glob4D38C[playerid] = 1;
	}
	switch(glob4D38C[playerid]) {
		case 6:
			SetPlayerCameraPos(playerid, 210.7014, -243.3306, 1.25);
			SetPlayerCameraLookAt(playerid, 217.4459, -245.4856, 1.4119, 1);
			PlayerTextDrawSetString(playerid, glob51B78[playerid], glob4BE70[4]);
			PlayerTextDrawSetString(playerid, glob51BC8[playerid], glob4BE70[4]);
			PlayerTextDrawSetString(playerid, glob51C18[playerid]);
			glob4D38C[playerid] = 5;
			return 1;
		case 2:
			SetPlayerCameraPos(playerid, 203.5216, -243.0611, 1.25);
			SetPlayerCameraLookAt(playerid, 196.5234, -245.7334, 1.3919, 1);
			PlayerTextDrawSetString(playerid, glob51B78[playerid], glob4BE70[glob4D38C[playerid] - 2]);
			PlayerTextDrawSetString(playerid, glob51BC8[playerid], glob4BE70[glob4D38C[playerid] - 2]);
			PlayerTextDrawSetString(playerid, glob51C18[playerid]);
			glob4D38C[playerid] = 1;
			return 1;
		case 3:
			SetPlayerCameraPos(playerid, 203.5216, -238.0611, 1.25);
			SetPlayerCameraLookAt(playerid, 196.5234, -240.7334, 1.3919, 1);
			PlayerTextDrawSetString(playerid, glob51B78[playerid], glob4BE70[glob4D38C[playerid] - 2]);
			PlayerTextDrawSetString(playerid, glob51BC8[playerid], glob4BE70[glob4D38C[playerid] - 2]);
			PlayerTextDrawSetString(playerid, glob51C18[playerid]);
			glob4D38C[playerid] = 2;
			return 1;
		case 4:
			SetPlayerCameraPos(playerid, 203.5216, -233.0611, 1.25);
			SetPlayerCameraLookAt(playerid, 196.5234, -235.7334, 1.3919, 1);
			PlayerTextDrawSetString(playerid, glob51B78[playerid], glob4BE70[glob4D38C[playerid] - 2]);
			PlayerTextDrawSetString(playerid, glob51BC8[playerid], glob4BE70[glob4D38C[playerid] - 2]);
			PlayerTextDrawSetString(playerid, glob51C18[playerid]);
			glob4D38C[playerid] = 3;
			return 1;
		case 5:
			SetPlayerCameraPos(playerid, 203.5216, -228.0611, 1.25);
			SetPlayerCameraLookAt(playerid, 196.5234, -230.7334, 1.3919, 1);
			PlayerTextDrawSetString(playerid, glob51B78[playerid], glob4BE70[glob4D38C[playerid] - 2]);
			PlayerTextDrawSetString(playerid, glob51BC8[playerid], glob4BE70[glob4D38C[playerid] - 2]);
			PlayerTextDrawSetString(playerid, glob51C18[playerid]);
			glob4D38C[playerid] = 4;
			return 1;
		case 1:
			SetPlayerCameraPos(playerid, 210.7014, -228.3306, 1.25);
			SetPlayerCameraLookAt(playerid, 217.4459, -230.4856, 1.4119, 1);
			PlayerTextDrawSetString(playerid, glob51B78[playerid], glob4BE70[glob4D38C[playerid] - 2]);
			PlayerTextDrawSetString(playerid, glob51BC8[playerid], glob4BE70[glob4D38C[playerid] - 2]);
			PlayerTextDrawSetString(playerid, glob51C18[playerid]);
			glob4D38C[playerid] = 8;
			return 1;
		case 8:
			SetPlayerCameraPos(playerid, 211.7014, -233.3306, 1.25);
			SetPlayerCameraLookAt(playerid, 217.4459, -235.4856, 1.4119, 1);
			PlayerTextDrawSetString(playerid, glob51B78[playerid], glob4BE70[glob4D38C[playerid] - 2]);
			PlayerTextDrawSetString(playerid, glob51BC8[playerid], glob4BE70[glob4D38C[playerid] - 2]);
			PlayerTextDrawSetString(playerid, glob51C18[playerid]);
			glob4D38C[playerid] = 7;
			return 1;
		case 7:
			SetPlayerCameraPos(playerid, 210.755, -238.6093, 1.25);
			SetPlayerCameraLookAt(playerid, 217.4459, -240.4856, 1.4119, 1);
			PlayerTextDrawSetString(playerid, glob51B78[playerid], glob4BE70[glob4D38C[playerid] - 2]);
			PlayerTextDrawSetString(playerid, glob51BC8[playerid], glob4BE70[glob4D38C[playerid] - 2]);
			PlayerTextDrawSetString(playerid, glob51C18[playerid]);
			glob4D38C[playerid] = 6;
			return 1;
	}
	return 1;
}

function9CFA4(playerid)
{
	if(glob4A930[playerid][5])
	{
		new var0 = glob4597C[playerid][14];
		if(!glob4A33C[playerid][6])
		{
			if(glob4CFAC[glob4D38C[playerid] - 1] == 1)
			{
				function98144(playerid, 486916);
				return 1;
			}
			if(glob4A33C[playerid][9])
			{
				if(function33C(var0, 0.6999 * glob4BE70[glob4D38C[playerid] - 1][8]))
				{
					return 1;
				}
				glob4597C[playerid][14] = function168(glob4597C[playerid][14], 0.6999 * glob4BE70[glob4D38C[playerid] - 1][8]);
				function69A4(playerid, glob4597C[playerid][14]);
			}
			else
			{
				if(glob4BE70[glob4D38C[playerid] - 1][8] > var0)
				{
					return 1;
				}
				glob4597C[playerid][14] = glob4597C[playerid][14] - glob4BE70[glob4D38C[playerid] - 1][8];
				function69A4(playerid, glob4597C[playerid][14]);
			}
			glob4CFAC[glob4D38C[playerid] - 1] = 1;
			glob4A33C[playerid][6] = glob4CF28[glob4D38C[playerid] - 1];
			printf("oldwood_selected p-1 = %i", glob4D38C[playerid] - 1);
			glob4B510[glob4CF28[glob4D38C[playerid] - 1]][1] = 1;
			function8E508(playerid, 4, 1);
			function98144(playerid, 487168);
			glob4A930[playerid][7] = 1;
			glob4A930[playerid][5] = 0;
			CancelSelectTextDraw(playerid);
			function98E60(playerid);
			SetCameraBehindPlayer(playerid);
			function932D8(playerid);
			return 1;
		}
		function98144(playerid, 487228);
		return 1;
	}
	return 1;
}

function9D848(playerid)
{
	CancelSelectTextDraw(playerid);
	function98E60(playerid);
	glob4D38C[playerid] = 1;
	SetCameraBehindPlayer(playerid);
	function932D8(playerid);
	function98144(playerid, 487420);
	glob4A930[playerid][5] = 0;
	return 1;
}

function9D970(playerid)
{
	new var0[24];
	GetPlayerName(playerid, var0, 24);
	return var0;
}

function9D9F0(arg0)
{
	if(glob6383C[arg0] + 100 > tickcount(0))
	{
		return 1;
	}
	glob6383C[arg0] = tickcount(0);
	return 0;
}

function9DADC(arg0)
{
	if(glob6383C[arg0] + 1000 > tickcount(0))
	{
		return 1;
	}
	glob6383C[arg0] = tickcount(0);
	return 0;
}

function9DBC8(arg0)
{
	if(glob6383C[arg0] + 500 > tickcount(0))
	{
		return 1;
	}
	glob6383C[arg0] = tickcount(0);
	return 0;
}

function9DCB4(arg0, arg1)
{
	new var0[255];
	for(new var1 = 20; 20 != var1 = glob31D0[var1]; )
	{
		GetPlayerName(var1, var0, 255);
		if(!strcmp(var0, arg0, true))
		{
			return var1;
		}
	}
	new var1 = 4294967295;
	new var2[255];
	new var3 = 4294967295;
	if(arg1)
	{
		new var4 = 20;
		while(20 != var4 = glob31D0[var4])
		{
			GetPlayerName(var4, var2, 255);
			if(!strfind(var2, arg0, true, 0))
			{
				var3++;
				var1 = var4;
			}
			if(0 < var3)
			{
				return -2;
			}
		}
	}
	return var1;
}

