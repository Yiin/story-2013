#include <a_samp>
//#include <YSI\y_groups>
#include <YSI\y_commands>
#include <YSI\y_inline>
//#include <YSI\y_malloc>
#include <YSI\y_dialog>
//#include <YSI\y_hooks>
#include <YSI\y_iterate>
//#include <YSI\y_text>
//#include <YSI\y_jaggedarray>
#include <gvar>
#include <sscanf2>
#include <JunkBuster>
//#include <foreach>
#include <streamer>
#include <soc_defines>
#include <uf>
//#include <a_rnpc>
#include <physics>
#include <p_bar>
#include <RouteConnector>
#include <strlib>
#include <sql>
#include <FCNPC>
//#include <a_timefunctions>
#include <srt>
#include <socket>
#include <cstl>
#include <formatnumber>
#include <vehicle_matrix>
#include <CTime>
#include <Vectoral>
#include <soc_textdraws>
#include "../gamemodes/namespaces.soc"
#include <soc_kintamieji>
#include <soc_vehicles>
#include <soc_funkcijos>
//#include <soc_mapp>

#define infoMsg(%0,%1) SendClientMessage(%0,-1,(format(g_szSprintfBuffer, sizeof g_szSprintfBuffer, "{e3ae67}•"C_SOC" "%1),g_szSprintfBuffer)) // "C_Y" ( "C_W"i"C_Y" )
#define C_TASKAS "{e3ae67}•"

native AddServerRule(name[], value[], flags = CON_VARFLAG_RULE);
native SetServerRule(name[], value[]);
native SetModeRestartTime(Float:seconds);

#define W(%0)%1; {new QWERTY@W;static const _QWERTY@W[]="@WAIT:...:";if(!Inline_Loop(INLINE_LOOP_PATTERNS,QWERTY@W,_QWERTY@W))return QWERTY_Wait((%0),callback_tag:_QWERTY@W);}


forward @QWERTY_Wait(a, b, c, d);
 
public @QWERTY_Wait(a, b, c, d)
{
        new
                res[E_CALLBACK_DATA];
        res[E_CALLBACK_DATA_FLAGS] = e_CALLBACK_FLAGS:a;
        res[E_CALLBACK_DATA_POINTER] = b;
        res[E_CALLBACK_DATA_FORMAT] = c;
        res[E_CALLBACK_DATA_ALLOC] = Alloc:d;
        Callback_Call(res);
        Callback_Release(res);
}
 
stock QWERTY_Wait(delay, callback:c)
{
        new
                res[E_CALLBACK_DATA];
        Callback_Get(c, res, _F<>);
        SetTimerEx("@QWERTY_Wait", delay, false, "iiii", _:res[E_CALLBACK_DATA_FLAGS], res[E_CALLBACK_DATA_POINTER], res[E_CALLBACK_DATA_FORMAT], _:res[E_CALLBACK_DATA_ALLOC]);
        return cellmin;
}


public::Float:Distance(Float:xA,Float:yA,Float:zA,Float:xB,Float:yB,Float:zB)
{
	new Float:Dist=floatsqroot((xB-xA)*(xB-xA)+(yB-yA)*(yB-yA)+(zB-zA)*(zB-zA));
	return Dist;
}

stock AdjustVector(& Float: vX, & Float: vY, & Float: vZ, Float: oX, Float: oY, const Float: oZ)
{
        // Credits Nero_3D
        static
        Float: _Angle_;
        _Angle_ = -atan2(vX, vY);
        if(45.0 < _Angle_)
        {
                oX ^= oY;
                oY ^= oX;
                oX ^= oY;
                if(90.0 < _Angle_)
                {
                        oX *= -1;
                        if(135.0 < _Angle_)
                        {
                                oX *= -1;
                                oX ^= oY;
                                oY ^= oX;
                                oX ^= oY;
                                oX *= -1;
                               
                        }
                       
                }
               
        }
        else if(_Angle_ < 0.0)
        {
                oY *= -1;
                if(_Angle_ < -45.0)
                {
                        oX *= -1;
                        oX ^= oY;
                        oY ^= oX;
                        oX ^= oY;
                        oX *= -1;
                        if(_Angle_ < -90.0)
                        {
                                oX *= -1;
                                if(_Angle_ < -135.0)
                                {
                                        oX ^= oY;
                                        oY ^= oX;
                                        oX ^= oY;
                                       
                                }
                               
                        }
                       
                }
               
        }
        vX += oX,
        vY += oY;
        vZ += oZ;
        return false;
}

stock GetPlayerCameraWeaponVector(playerid, & Float: vX, & Float: vY, & Float: vZ)
{
        // Credits Nero_3D. I just added the offset for Widescreen ON players
        static
        weapon;
        if(21 < (weapon = GetPlayerWeapon(playerid)) < 39)
        {
                GetPlayerCameraFrontVector(playerid, vX, vY, vZ);
                switch(weapon)
                {
                        case WEAPON_SNIPER, WEAPON_ROCKETLAUNCHER, WEAPON_HEATSEEKER:
                        {
                        }
                        case WEAPON_RIFLE:
                        {
                                if(GetPVarInt(playerid,"Widescreen")==0) AdjustVector(vX, vY, vZ, 0.016204, 0.009899, 0.047177);
                                else AdjustVector(vX, vY, vZ, 0.015085, 0.010467, 0.035687);
                               
                               
                        }
                       
                        case WEAPON_AK47, WEAPON_M4:
                        {
                                if(GetPVarInt(playerid,"Widescreen")==0) AdjustVector(vX, vY, vZ, 0.026461, 0.013070, 0.069079);
                                else AdjustVector(vX, vY, vZ, 0.024255, 0.013714, 0.053342);
                               
                               
                        }
                       
                        default:
                        {
                                if(GetPVarInt(playerid,"Widescreen")==0) AdjustVector(vX, vY, vZ, 0.043949, 0.015922, 0.103412);
                                else AdjustVector(vX, vY, vZ, 0.041103, 0.014111, 0.079249);
                               
                               
                        }
                       
                }
                return true;
               
        }
        else
        GetPlayerCameraFrontVector(playerid, vX, vY, vZ);
        return false;
}

stock crossp(Float:v1x, Float:v1y, Float:v1z, Float:v2x, Float:v2y, Float:v2z, &Float:output)
{
        new
        Float:c1 = (v1y * v2z) - (v1z * v2y),
        Float:c2 = (v1z * v2x) - (v1x * v2z),
        Float:c3 = (v1x * v2y) - (v1y * v2x);
        output = floatsqroot ((c1 * c1) + (c2 * c2) + (c3 * c3));
        return 0;
}

stock GetDistanceFromPointToLine(&Float:distance, Float:line_vector_x, Float:line_vector_y, Float:line_vector_z, Float:line_x, Float:line_y, Float:line_z, Float:point_x, Float:point_y, Float:point_z)
{
        //A line is defined by a point (which is on the line (line_x/y/z)) and a vector which defines the direction (line_vector_x/y/z).
        static Float:output;
        crossp(line_vector_x, line_vector_y, line_vector_z, point_x - line_x, point_y - line_y, point_z - line_z, output);//Cross product of 2 vectors.
        distance = output / floatsqroot ((line_vector_x * line_vector_x) + (line_vector_y * line_vector_y) + (line_vector_z * line_vector_z));
        return 0;
}
 
stock GetPlayerAimedBodyPart(playerid, targetid, Float:range)
{
        new Float:xv,Float:yv,Float:zv,Float:xc,Float:yc,Float:zc,Float:zt,Float:_X2_,Float:_Y2_,Float:_Z2_;
        new Float:AngleP,Float:xP,Float:yP,Float:zP;
        new Float:DistH,Float:DistL,Float:DistA;
        GetPlayerPos(targetid,_X2_,_Y2_,_Z2_);
        GetPlayerPos(playerid,xP,yP,zP);
        GetPlayerCameraPos(playerid,xc,yc,zc);
        GetPlayerCameraWeaponVector(playerid,xv,yv,zv);
        GetPlayerFacingAngle(targetid,AngleP);
       
        zt=range*zv+zc;
       
        if(GetPlayerSpecialAction(targetid)==1)
        {
                GetDistanceFromPointToLine(DistH,xv,yv,zv,xc,yc,zc,_X2_,_Y2_,_Z2_-0.1);
                GetDistanceFromPointToLine(DistA,xv,yv,zv,xc,yc,zc,0.5*floatcos(-AngleP,degrees)+_X2_,_Y2_-0.5*floatsin(-AngleP,degrees),_Z2_-0.55);
                if(DistH<=0.2) return HEAD;
                else if(DistA<=0.3) return ARM;
               
        }
        else if(GetPlayerState(targetid)!=1)
        {
                if(_Z2_+0.4<=zt) return HEAD;
               
        }
        else
        {
                GetDistanceFromPointToLine(DistH,xv,yv,zv,xc,yc,zc,_X2_,_Y2_,_Z2_+0.6);
                GetDistanceFromPointToLine(DistL,xv,yv,zv,xc,yc,zc,_X2_,_Y2_,_Z2_-0.4);
                GetDistanceFromPointToLine(DistA,xv,yv,zv,xc,yc,zc,0.5*floatcos(-AngleP,degrees)+_X2_,_Y2_-0.5*floatsin(-AngleP,degrees),_Z2_);
                if(DistH<=0.2) return HEAD;
                else if(DistL<=0.5) return LEG;
                else if(DistA<=0.4) return ARM;
               
        }
        return BODY;
}

stock CompressFormat(const data[])
{
	// This function encodes the data format in to a single cell.  The format is:
	//  
	//  1111111001
	//  
	// Leading 1s indicate no data.  The 0 immediately following the leading 1s
	// indicates the start of the format section (but is not PART of the format
	// section).  The remaining bits represent either strings (1) or non-strings
	// (0).  For example "(a, string:b, c)" would be:
	//  
	//  1..10010
	//  
	// Where "1..1" indicates full-cell padding of 1s.  From this it is known that
	// the function takes three parameters: non-string, string, non-string.  In
	// addition, as strings in inline functions MUST use the "string:" tag, it is
	// known that ALL strings will ALWAYS be 128 (or "YSI_MAX_STRING") cells big.
	new
		pos = 0,
		total = 1;
	for ( ; ; )
	{
		// Now matchs the compile-time code much closer.
		switch (data[pos++])
		{
			case '\0':
			{
				break;
			}
			case 's':
			{
				total <<= 1;
			}
			default:
			{
				total = (total << 1) | 1;
			}
		}
	}
	// Store the compressed format, also instantly end the string.
	return ~total;
}

forward @SetTimer2(repeat, e_CALLBACK_FLAGS:cF, cP, cX, Alloc:cA, Alloc:a);

public @SetTimer2(repeat, e_CALLBACK_FLAGS:cF, cP, cX, Alloc:cA, Alloc:a)
{
	new
		ret[E_CALLBACK_DATA];
	ret[E_CALLBACK_DATA_FLAGS] = cF;
	ret[E_CALLBACK_DATA_POINTER] = cP;
	ret[E_CALLBACK_DATA_FORMAT] = cX;
	ret[E_CALLBACK_DATA_ALLOC] = cA;
	Callback_Block(ret, Malloc_GetData(a, 2), Malloc_GetSlotSize(a) - 2);
	if (!repeat)
	{
		free(cA);
		free(a);
	}
}

forward @queryCallback(e_CALLBACK_FLAGS:cF, cP, cX, Alloc:cA, Alloc:a);
public @queryCallback(e_CALLBACK_FLAGS:cF, cP, cX, Alloc:cA, Alloc:a)
{
	new
		ret[E_CALLBACK_DATA];
	ret[E_CALLBACK_DATA_FLAGS] = cF;
	ret[E_CALLBACK_DATA_POINTER] = cP;
	ret[E_CALLBACK_DATA_FORMAT] = cX;
	ret[E_CALLBACK_DATA_ALLOC] = cA;
	Callback_Block(ret, Malloc_GetData(a, 2), Malloc_GetSlotSize(a) - 2);
	free(cA);
	free(a);
}

stock killTimer(t)
{
	if(t)
	{
		KillTimer(Malloc_Get(Alloc:t, 0));
		free(Alloc:Malloc_Get(Alloc:t, 1));
		free(Alloc:t);
	}
}

stock setTimerEx(callback:callback, delay, repeat, const type[], GLOBAL_TAG_TYPES:...)
{
	new
		ret[E_CALLBACK_DATA],
		mem = CompressFormat(type);
	if (!Callback_Get(callback, ret))
	{
		return 0;
	}
	if (!(ret[E_CALLBACK_DATA_FLAGS] & e_CALLBACK_FLAGS_PUBLIC) && mem != ret[E_CALLBACK_DATA_FORMAT])
	{
		P:E("Format specifier didn't match on inline function %s: %04x%04x != %04x%04x", callback, mem >>> 16, mem & 0xFFFF, ret[E_CALLBACK_DATA_FORMAT] >>> 16, ret[E_CALLBACK_DATA_FORMAT] & 0xFFFF);
		Callback_Release(ret);
		return 0;
	}
	mem = 2;
	// Allocate enough memory to store all the parameters.
	for (new i = 0; ; ++i)
	{
		switch (type[i])
		{
			case '\0':
			{
				break;
			}
			case 's':
			{
				mem += YSI_MAX_STRING;
			}
			case 'a':
			{
				P:E("y_inline doesn't support arrays.");
				return 0;
			}
			default:
			{
				++mem;
			}
		}
	}
	new
		Alloc:a = malloc(mem);
	if (a == NO_ALLOC)
	{
		Callback_Release(ret);
		return 0;
	}
	// Copy all the data to an array.
	//mem = 2;
	for (new i = 0, j = 4; ; ++i, ++j)
	{
		switch (type[i])
		{
			case '\0':
			{
				break;
			}
			case 's':
			{
				// Set variable argument string.
				mem -= YSI_MAX_STRING;
				Malloc_SetVAS(a, mem, j);
				//Malloc_Set(a, mem - 1, '\0');
			}
			default:
			{
				--mem;
				Malloc_Set(a, mem, getarg(j));
			}
		}
	}
	// Now call the handler.
	Malloc_Set(a, 1, _:ret[E_CALLBACK_DATA_ALLOC]);
	Malloc_Set(a, 0, SetTimerEx("@SetTimer2", delay, repeat, "iiiiii", repeat, _:ret[E_CALLBACK_DATA_FLAGS], ret[E_CALLBACK_DATA_POINTER], ret[E_CALLBACK_DATA_FORMAT], _:ret[E_CALLBACK_DATA_ALLOC], _:a));
	return _:a;
}

/*
stock send_query2(connectionHandle, query[], bool:cache, callback:callback, const type[], GLOBAL_TAG_TYPES:...)
{
	new
		ret[E_CALLBACK_DATA],
		mem = CompressFormat(type);
	if (!Callback_Get(callback, ret))
	{
		return 0;
	}
	if (!(ret[E_CALLBACK_DATA_FLAGS] & e_CALLBACK_FLAGS_PUBLIC) && mem != ret[E_CALLBACK_DATA_FORMAT])
	{
		P:E("Format specifier didn't match on inline function %s: %04x%04x != %04x%04x", callback, mem >>> 16, mem & 0xFFFF, ret[E_CALLBACK_DATA_FORMAT] >>> 16, ret[E_CALLBACK_DATA_FORMAT] & 0xFFFF);
		Callback_Release(ret);
		return 0;
	}
	mem = 2;
	// Allocate enough memory to store all the parameters.
	for (new i = 0; ; ++i)
	{
		switch (type[i])
		{
			case '\0':
			{
				break;
			}
			case 's':
			{
				mem += YSI_MAX_STRING;
			}
			case 'a':
			{
				P:E("y_inline doesn't support arrays.");
				return 0;
			}
			default:
			{
				++mem;
			}
		}
	}
	new
		Alloc:a = malloc(mem);
	if (a == NO_ALLOC)
	{
		Callback_Release(ret);
		return 0;
	}
	// Copy all the data to an array.
	//mem = 2;
	for (new i = 0, j = 4; ; ++i, ++j)
	{
		switch (type[i])
		{
			case '\0':
			{
				break;
			}
			case 's':
			{
				// Set variable argument string.
				mem -= YSI_MAX_STRING;
				Malloc_SetVAS(a, mem, j);
				//Malloc_Set(a, mem - 1, '\0');
			}
			default:
			{
				--mem;
				Malloc_Set(a, mem, getarg(j));
			}
		}
	}
	// Now call the handler.
	Malloc_Set(a, 1, _:ret[E_CALLBACK_DATA_ALLOC]);
	Malloc_Set(a, 0, mysql_function_query(connectionHandle, query, cache, "@queryCallback", "iiiii", _:ret[E_CALLBACK_DATA_FLAGS], ret[E_CALLBACK_DATA_POINTER], ret[E_CALLBACK_DATA_FORMAT], _:ret[E_CALLBACK_DATA_ALLOC], _:a));
	return 1;
}*/

stock setTimer(callback:callback, delay, repeat)
{
	new
		ret[E_CALLBACK_DATA];
	if (!Callback_Get(callback, ret))
	{
		return 0;
	}
	new
		Alloc:a = malloc(2);
	if (a == NO_ALLOC)
	{
		Callback_Release(ret);
		return 0;
	}
	// Now call the handler.
	Malloc_Set(a, 1, _:ret[E_CALLBACK_DATA_ALLOC]);
	Malloc_Set(a, 0, SetTimerEx("@SetTimer2", delay, repeat, "iiiiii", repeat, _:ret[E_CALLBACK_DATA_FLAGS], ret[E_CALLBACK_DATA_POINTER], ret[E_CALLBACK_DATA_FORMAT], _:ret[E_CALLBACK_DATA_ALLOC], _:a));
	return _:a;
}

#define Dialog:%0(%1,%2,%3,%4) \
	forward dialog_%0(%1,%2,%3,%4); public dialog_%0(%1,%2,%3,%4)

#define Show:<%0> #dialog_%0

#if !defined isnull
	#define isnull(%1) ((!(%1[0])) || (((%1[0]) == '\1') && (!(%1[1]))))
#endif

new stock g_DialogHandle[MAX_PLAYERS char];
new stock g_CurrentDialog[MAX_PLAYERS][32 char];

stock ShowDialog(playerid, dialog[], style, caption[], info[], button1[], button2[])
{
	if (funcidx(dialog) != -1)
	{
		g_DialogHandle{playerid} = random(255);
		strpack(g_CurrentDialog[playerid], dialog);
		ShowPlayerDialog(playerid, g_DialogHandle{playerid}, style, caption, info, button1, button2);
		return 1;
	}
	return 0;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if (g_DialogHandle{playerid} != -1 && dialogid == g_DialogHandle{playerid})
	{
		new unpacked[32];
		strunpack(unpacked, g_CurrentDialog[playerid]);
		if (funcidx(unpacked) != -1)
		{
			g_DialogHandle{playerid} = -1;
			if (isnull(inputtext))
			{
				CallLocalFunction(unpacked, "ddds", playerid, response, listitem, "\1");
				return 1;
			}
			CallLocalFunction(unpacked, "ddds", playerid, response, listitem, inputtext);
			return 1;
		}
	}
	return 0;
}