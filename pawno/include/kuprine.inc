#define TALPA       7

#define GPS 		1
#define MP3 		2
#define RAKTAI_D 	3
#define RAKTAI_D_M 	4
#define RAKTAI_M 	5
#define RAKTAI_V 	6
#define CIGARETES 	7

#include <a_samp>

enum bag_info
{
	item[TALPA],
	kiekis,
	kaina,
	Float:svoris
}

new Bag[MAX_PLAYERS][bag_info];

stock IsBagFull(bagid)
{
	for(new i = 0; i < TALPA; i++)
	{
	    if(Bag[bagid][item[i]] == 0) return 0;
	}
	return 1;
}

stock IsBagEmpty(bagid)
{
	for(new i = 0; i < TALPA; i++)
	{
	    if(Bag[bagid][item[i]] != 0) return 0;
	}
	return 1;
}

stock IsItemInBag(bagid, itemid)
{
    for(new i = 0; i < TALPA; i++)
	{
	    if(Bag[bagid][item[i]] == itemid) return 1;
	}
	return 0;
}

stock GetEmptySlot(bagid)
{
    for(new i = 0; i < TALPA; i++)
	{
	    if(Bag[bagid][item[i]] == 0) return i;
	}
	return -1;
}

stock GetItemSlot(bagid, itemid)
{
    for(new i = 0; i < TALPA; i++)
	{
	    if(Bag[bagid][item[i]] == itemid) return i;
	}
	return -1;
}
/*
stock GetItemAmount(bagid, itemid)
{

}
*/
stock GetItemFromSlot(bagid, slot)
{
	slot = item[slot];
	
	return Bag[bagid][slot];
}

stock AddBagItem(bagid, itemid)
{
	if(!IsBagFull(bagid))
	{
		new slot = GetEmptySlot(bagid);
		if(slot != -1)
		{
		    Bag[bagid][item[slot]] = itemid;
		    return 1;
		}
	}
	return 0;
}

stock RemoveBagItem(bagid, itemid)
{
	if(!IsBagEmpty(bagid, itemid)
	{
		new slot = GetItemSlot(bagid, itemid);
		if(slot != -1)
		{
		    Bag[bagid][item[slot]] = 0;
		    return 1;
		}
	}
	return 0;
}
