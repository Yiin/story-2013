#define FILTERSCRIPT
#define yDamage
#define by_Yiin

#include <a_samp>

public OnFilterScriptInit()
{
	print(" ---:: Weapons Damage");
	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}

public OnPlayerGiveDamage(playerid, damagedid, Float:amount, weaponid)
{
	amount = 0;
	switch(weaponid)
	{
		case 0: amount = 5; // Unarmed
		case 1: amount = 5; // Brass Knuckles
		case 2: amount = 5; // Golf
		case 3: amount = 5; // Nite Stick
		case 4: amount = 5; // Knife
		case 5: amount = 5; // BaseBall Bat
		case 6: amount = 5; // Shovel
		case 7: amount = 5; // Pool Cue
		case 8: amount = 5; // Katana
		case 9: amount = 5; // Chainsaw
		case 10: amount = 5; // Purple Dildo
		case 11: amount = 5; // Small White Dildo
		case 12: amount = 5; // Large White Dildo
		case 13: amount = 5; // Silver Vibrator
		case 14: amount = 5; // Flowers
		case 15: amount = 5; // Cane
		case 16: amount = 5; // Grenade
		case 17: amount = 5; // Tear Gas
		case 18: amount = 5; // Molotov
		case 22: amount = 5; // 9mm
		case 23: amount = 5; // Silenced 9mm
		case 24: amount = 5; // Desert Eagle
		case 25: amount = 5; // Shotgun
		case 26: amount = 5; // Sawn-Off
		case 27: amount = 5; // Combat Shotgun
		case 28: amount = 5; // Micro SMG
		case 29: amount = 5; // MP5
		case 30: amount = 5; // AK-47
		case 31: amount = 5; // M4
		case 32: amount = 5; // Tec-9
		case 33: amount = 5; // Country Rifle
		case 34: amount = 5; // Sniper Rifle
		case 38: amount = 5; // Minigun
	}
	return 1;
}
}