enum zINFO	{
	id,
	masina,
	pinigai,
	reputacija,
	wins,
	loses
};
enum iNFO   {
	bool:prisijunges,
	bandymai_prisijungti,
	registracija,
	bool:renkasi_masina,
	masinos_id,
	pasirinkta_masina,
	bool:inrace,
	bool:inraceselect
};

native WP_Hash(buffer[], len, const str[]);

// Textdrawai
new Text:Textdraw0;
new Text:Textdraw1;
new Text:Textdraw2;
new Text:Textdraw3;
new Text:Textdraw4;
new PlayerText:TextdrawGreitis[MAX_PLAYERS];
new PlayerText:TextdrawKaina[MAX_PLAYERS];
new PlayerText:TextdrawPavadinimas[MAX_PLAYERS];
new PlayerText:Notification0[MAX_PLAYERS];
new PlayerText:Notification1[MAX_PLAYERS];
enum RMENIU
{
	box,
	vienam,
	keliems,
	gatviu,
	drifto,
	buliu,
	grandprix,
	timelapse,
	driftoT,
	greicioD
};
new Text:rmeniu[10];

// Zaidejo informacija
new ZzZ[MAX_PLAYERS][zINFO];
new info[MAX_PLAYERS][iNFO];
new _zaidejo_Vardas[MAX_PLAYERS][MAX_PLAYER_NAME];
new timer_notification[MAX_PLAYERS];
new pticks[MAX_PLAYERS];

#define MySQL_HOST "localhost"
#define MySQL_USER "root"
#define MySQL_DATA "race"
#define MySQL_PASS ""

#define COLOR_SERVER 0xA9C4E4FF
#define COLOR_OK 0x97FC3CFF
#define COLOR_NO 0xFF1111FF
#define COLOR_SELECT 0xC80000FF
#define COLOR_BLUE 0x576E86FF
#define COLOR_GREEN 0x44FF44FF

#define pid playerid
#define PID [playerid]
#define pinfo info[playerid]
#define zinfo ZzZ[playerid]
#define notification(%0) show_notification(playerid, %0)
#define message(%0) SendClientMessage(playerid, 0xAAAAAAFF, %0)
#define dialog(%0,%1,%2,%3,%4,%5) ShowDialog(playerid, Show:<%0>, %1, %2, %3, %4, %5)
#define freeze Freeze(playerid)
#define unfreeze UnFreeze(playerid)
#define PlayerToVehicle(%0) PutPlayerInVehicle(playerid, %0,0)
#define PutInVeh PutPlayerInVehicle(pid, pinfo[masinos_id],0)
#define PlayerName GetPlayerNameEx(playerid)
#define tdshow(%0) TextDrawShowForPlayer(playerid, %0)
#define ptdshow(%0) PlayerTextDrawShow(playerid, %0)
#define tdhide(%0) TextDrawHideForPlayer(playerid, %0)
#define ptdhide(%0) PlayerTextDrawHide(playerid, %0)
#define ptdstring(%0,%1) PlayerTextDrawSetString(playerid, %0, %1)
#define komanda:<%0> COMMAND:%0(playerid, params[])
#define Coords Float:cx, Float:cy, Float:cz
#define coords cx, cy, cz
#define MasinosPirkimas_Rodyti show_masinupirkimas(pid)
#define MasinosPirkimas_Nerodyti hide_masinupirkimas(pid)
#define Save save(playerid)
#define Load load(playerid)

#define GetPlayerNameEx(%0) _zaidejo_Vardas[%0]
#define PUBLIC:%0(%1) 	forward %0(%1); \
						public %0(%1)
enum vInfo
{
	vName [32 char],
	vMaxSpeed
}

new VehicleInfo [][vInfo] =
{
	{!"Landstalker", 140},
	{!"Bravura", 131},
	{!"Buffalo", 166},
	{!"Linerunner", 98},
	{!"Pereniel", 118},
	{!"Sentinel", 146},
	{!"Dumper", 98},
	{!"Firetruck", 132},
	{!"Trashmaster", 89},
	{!"Stretch", 140},
	{!"Manana", 115},
	{!"Infernus", 197},
	{!"Voodoo", 150},
	{!"Pony", 98},
	{!"Mule", 94},
	{!"Cheetah", 171},
	{!"Ambulance", 137},
	{!"Leviathan", 399},
	{!"Moonbeam", 103},
	{!"Esperanto", 133},
	{!"Taxi", 129},
	{!"Washington", 137},
	{!"Bobcat", 124},
	{!"Mr Whoopee", 88},
	{!"BF Injection", 120},
	{!"Hunter", 399},
	{!"Premier", 154},
	{!"Enforcer", 147},
	{!"Securicar", 139},
	{!"Banshee", 179},
	{!"Predator", 399},
	{!"Bus", 116},
	{!"Rhino", 84},
	{!"Barracks", 98},
	{!"Hotknife", 148},
	{!"Trailer", 0},
	{!"Previon", 133},
	{!"Coach", 140},
	{!"Cabbie", 127},
	{!"Stallion", 150},
	{!"Rumpo", 121},
	{!"RC Bandit", 67},
	{!"Romero", 124},
	{!"Packer", 112},
	{!"Monster Truck A", 98},
	{!"Admiral", 146},
	{!"Squalo", 399},
	{!"Seasparrow", 399},
	{!"Pizzaboy", 162},
	{!"Tram", 399},
	{!"Trailer", 399},
	{!"Turismo", 172},
	{!"Speeder", 399},
	{!"Reefer", 399},
	{!"Tropic", 399},
	{!"Flatbed", 140},
	{!"Yankee", 94},
	{!"Caddy", 84},
	{!"Solair", 140},
	{!"Berkley's RC Van", 121},
	{!"Skimmer", 399},
	{!"PCJ-600", 180},
	{!"Faggio", 105},
	{!"Freeway", 180},
	{!"RC Baron", 399},
	{!"RC Raider", 399},
	{!"Glendale", 131},
	{!"Oceanic", 125},
	{!"Sanchez", 164},
	{!"Sparrow", 399},
	{!"Patriot", 139},
	{!"Quad", 98},
	{!"Coastguard", 399},
	{!"Dinghy", 399},
	{!"Hermes", 133},
	{!"Sabre", 154},
	{!"Rustler", 399},
	{!"ZR-350", 166},
	{!"Walton", 105},
	{!"Regina", 124},
	{!"Comet", 164},
	{!"BMX", 86},
	{!"Burrito", 139},
	{!"Camper", 109},
	{!"Marquis", 399},
	{!"Baggage", 88},
	{!"Dozer", 56},
	{!"Maverick", 399},
	{!"News Chopper", 399},
	{!"Rancher", 124},
	{!"FBI Rancher", 139},
	{!"Virgo", 132},
	{!"Greenwood", 125},
	{!"Jetmax", 399},
	{!"Hotring", 191},
	{!"Sandking", 157},
	{!"Blista Compact", 145},
	{!"Police Maverick", 399},
	{!"Boxville", 96},
	{!"Benson", 109},
	{!"Mesa", 125},
	{!"RC Goblin", 399},
	{!"Hotring Racer", 191},
	{!"Hotring Racer", 191},
	{!"Bloodring Banger", 154},
	{!"Rancher", 124},
	{!"Super GT", 159},
	{!"Elegant", 148},
	{!"Journey", 96},
	{!"Bike", 93},
	{!"Mountain Bike", 117},
	{!"Beagle", 399},
	{!"Cropdust", 399},
	{!"Stunt", 399},
	{!"Tanker", 107},
	{!"RoadTrain", 126},
	{!"Nebula", 140},
	{!"Majestic", 140},
	{!"Buccaneer", 146},
	{!"Shamal", 399},
	{!"Hydra", 399},
	{!"FCR-900", 190},
	{!"NRG-500", 200},
	{!"HPV1000", 172},
	{!"Cement Truck", 116},
	{!"Tow Truck", 143},
	{!"Fortune", 140},
	{!"Cadrona", 133},
	{!"FBI Truck", 157},
	{!"Willard", 133},
	{!"Forklift", 54},
	{!"Tractor", 62},
	{!"Combine", 98},
	{!"Feltzer", 148},
	{!"Remington", 150},
	{!"Slamvan", 140},
	{!"Blade", 154},
	{!"Freight", 399},
	{!"Streak", 399},
	{!"Vortex", 89},
	{!"Vincent", 136},
	{!"Bullet", 180},
	{!"Clover", 146},
	{!"Sadler", 134},
	{!"Firetruck", 132},
	{!"Hustler", 131},
	{!"Intruder", 133},
	{!"Primo", 127},
	{!"Cargobob", 399},
	{!"Tampa", 136},
	{!"Sunrise", 128},
	{!"Merit", 140},
	{!"Utility", 108},
	{!"Nevada", 399},
	{!"Yosemite", 128},
	{!"Windsor", 141},
	{!"Monster Truck B", 98},
	{!"Monster Truck C", 98},
	{!"Uranus", 139},
	{!"Jester", 158},
	{!"Sultan", 150},
	{!"Stratum", 137},
	{!"Elegy", 158},
	{!"Raindance", 399},
	{!"RC Tiger", 79},
	{!"Flash", 146},
	{!"Tahoma", 142},
	{!"Savanna", 154},
	{!"Bandito", 130},
	{!"Freight", 399},
	{!"Trailer", 399},
	{!"Kart", 83},
	{!"Mower", 54},
	{!"Duneride", 98},
	{!"Sweeper", 53},
	{!"Broadway", 140},
	{!"Tornado", 140},
	{!"AT-400", 399},
	{!"DFT-30", 116},
	{!"Huntley", 140},
	{!"Stafford", 136},
	{!"BF-400", 170},
	{!"Newsvan", 121},
	{!"Tug", 76},
	{!"Trailer", 399},
	{!"Emperor", 136},
	{!"Wayfarer", 175},
	{!"Euros", 147},
	{!"Hotdog", 96},
	{!"Club", 145},
	{!"Trailer", 399},
	{!"Trailer", 399},
	{!"Andromada", 399},
	{!"Dodo", 399},
	{!"RC Cam", 54},
	{!"Launch", 399},
	{!"Police Car (LSPD)", 156},
	{!"Police Car (SFPD)", 156},
	{!"Police Car (LVPD)", 156},
	{!"Police Ranger", 140},
	{!"Picador", 134},
	{!"S.W.A.T. Van", 98},
	{!"Alpha", 150},
	{!"Phoenix", 152},
	{!"Glendale", 131},
	{!"Sadler", 134},
	{!"Luggage Trailer", 399},
	{!"Luggage Trailer", 399},
	{!"Stair Trailer", 399},
	{!"Boxville", 96},
	{!"Farm Plow", 399},
	{!"Utility Trailer", 399}
};

#define Dialog:%0(%1,%2,%3,%4) \
	forward dialog_%0(%1,%2,%3,%4); public dialog_%0(%1,%2,%3,%4)

#define Show:<%0> #dialog_%0

#if !defined isnull
    #define isnull(%1) ((!(%1[0])) || (((%1[0]) == '\1') && (!(%1[1]))))
#endif

new stock g_DialogHandle[MAX_PLAYERS char];
new stock g_CurrentDialog[MAX_PLAYERS][32 char];

stock ShowDialog(playerid, dialog[], style, caption[], dinfo[], button1[], button2[])
{
	if (funcidx(dialog) != -1)
	{
		g_DialogHandle{playerid} = random(255);
		strpack(g_CurrentDialog[playerid], dialog);
		ShowPlayerDialog(playerid, g_DialogHandle{playerid}, style, caption, dinfo, button1, button2);
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















/*
		ROUTER PLUGIN
		- GPS ADDITION TO SA-MP
		- Made By Gamer_Z a.k.a. grasmanek94 , Rafal Grasman

		October-


		contact: grasmanek94@live.nl

		http://gamer-gps.googlecode.com/
*/

#if defined ROUTE_CONNECTOR_PLUGIN_INCLUDED

#else

#define MAX_NODES					(16384)
#define MAX_CONNECTIONS				(5)

#define CONNECT_TYPE_BOTH			(0)
#define CONNECT_TYPE_One_To_Two		(1)

#define INCLUDE_VERSION				(179)

#define ROUTE_CONNECTOR_PLUGIN_INCLUDED
#pragma library "RouteConnectorPlugin"

native AddNode(Float:X,Float:Y,Float:Z,AddToPathFinder = 0, AddToScanner = 0);
/*
	Function:
		AddNode
	Description:
		Adds a node into the memory of the plugin,
		This node will be unavailable in route calculations.
	Parameters:
		Position as X Y Z
		AddToPathFinder - if set to 1 it will also make sure the graph will be updated so when searching for a route it will be added to the list.
		AddToScanner - If set to 1 the node will be available in OnPlayerClosestNodeIDChange, else not.
	Returns the added nodeID, -1 if failed.
	Note:
		NEVER EVER set AddToPathFinder to 1 when a calculation is in progress! THAT IS YOUR OWN RESPOSIBILITY IF IT HAPPENS.
*/
native AddNodeEx(ID,Float:X,Float:Y,Float:Z,AddToPathFinder = 0);
/*
	Function:
		AddNodeEx
	Description:
		The only difference with AddNode is that you can specify your own NodeID here AND the node will be automaticly added to the appropriate area.
		Gaps may be present (eg AddNodeEx(0,0.0,0.0,0.0,0),AddNodeEx(6,0.0,0.0,0.0,0);).
	Parameters:
		ID as Custom NodeID
		Position as X Y Z
		AddToPathFinder - if set to 1 it will also make sure the graph will be updated so when searching for a route it will be added to the list.
	Returns the added nodeID, -1 if failed.
	Note:
		NEVER EVER set AddToPathFinder to 1 when a calculation is in progress! THAT IS YOUR OWN RESPOSIBILITY IF IT HAPPENS.
*/
native ConnectNodes(NodeID_one,NodeID_two,AddToPathFinder = 0,direction = 0);
/*
	Function:
		ConnectNodes
	Description:
		This will connect two nodes stored in memory, same rules as for AddNode(Ex), it won't be available in path calculations.
		When you connect NodeID_one with NodeID_two it will automaticly connect the opposite, no distance suplying is needed as the XYZ are supplied at node creation.
	Parameters:
		NodeID_one and NodeID_two as NodeID's
		AddToPathFinder - if set to 1 it will also make sure the graph will be updated so when searching for a route it will be added to the list.
		direction - you can choose to only connect nodeID one with nodeID two (One_To_Two = 1) or to connect them together (BOTH = 0)
	Returns:
		-1 - NodeOne is out of boundaries
		-2 - NodeTwo is out of boundaries
		-3 - NodeOne equals NodeTwo
		-4 - NodeOne doesn't exist
		-5 - NodeTwo doesn't exist
		-6 - NodeOne already connected with NodeTwo
		-7 - NodeTwo already connected with NodeOne
		-8 - No more connection slots left or direction does not equal 1 or 0
		Anything above or equal to 0 means success (the NodeOne[connectid] is retuned).
	Note:
		NEVER EVER set AddToPathFinder to 1 when a calculation is in progress! THAT IS YOUR OWN RESPOSIBILITY IF IT HAPPENS.
*/
native NearestPlayerNode(playerid,Float:MaxDist=9999.99,IgnoreNodeID=(-1),UseAreas = 0);
/*
	Function:
		NearestPlayerNode
	Description:
		This function will get the closest player node, if you used AddNode(Ex) this nodes will also be considered.
	Parameters:
		playerid - the playerid to count from
		MaxDist - the maximal distance to search from the player
		IgnoreNodeID - this node ID will not be returned as the closest one, it will be ignored in the search.
		UseAreas - if set to 0 it will go through all nodes in memory, else if to 1 it will do just the nodes in the area where the player is (not so accurate)
	Returns the closest nodeID, -1 if no node Id is found in range
*/
native NearestNodeFromPoint(Float:X,Float:Y,Float:Z,Float:MaxDist=9999.99,IgnoreNodeID=(-1),UseAreas = 0);
/*
	Function:
		NearestNodeFromPoint
	Description:
		Same as NearestPlayerNode, but here you can supply an point instead of an playerid
	Parameters:
		XYZ - the position of the point to search from
		MaxDist - the maximal distance to search from the player
		IgnoreNodeID - this node ID will not be returned as the closest one, it will be ignored in the search.
		UseAreas - if set to 0 it will go through all nodes in memory, else if to 1 it will do just the nodes in the area where the player is (not so accurate)
	Returns the closest nodeID, -1 if no node Id is found in range
*/
native WriteNodesToFile(filename[]);
/*
	Function:
		WriteNodesToFile
	Description:
		Write all nodes, connections, contents of the memory into an loadable file,
		can be used by ReadNodesFromFile later.
	Parameters:
		filename -	the "path/filename.extension" to store the information in,
					note that if you want to make a file in the scriptfiles folder you need to supply:
					WriteNodesToFile("scriptfiles/your.file.name");
	Returns 1 on success, 0 on failure.
*/
native ReadNodesFromFile(filename[]);
/*
	Function:
		ReadNodesFromFile
	Description:
		Read all nodes, connections, contents of the file into the memory,
		This function will automaticly create nodes, connect them, create the virtual graph to search paths on
		after it has been loaded into the memory.
	Parameters:
		filename -	the "path/filename.extension" to read the information from,
					note that if you want to read a file in the scriptfiles folder you need to supply:
					ReadNodesFromFile("scriptfiles/your.file.name");
	Warning:
		It is not recommended to use this funcion, use at your own risk.
		The plugin calls this function only at server startup, however I have included it for you.
		You still can make aditional nodes with it (if you analyse the project source code correctly, you will know what I mean)
	Returns 1 on success, 0 on failure.
*/
native GetNodePos(NodeID,&Float:X,&Float:Y,&Float:Z);
/*
	Function:
		GetNodePos
	Description:
		Get the XYZ position of the supplied NodeID
	Parameters:
		NodeID - The NodeID to get the XYZ from
		(returns) X Y Z - The XYZ positions.
	Returns 0 on failure (Out Of Range?), -1 if node doesn't exist, 1 on success.
*/
native CalculatePath(Start,End,routeID = 0);//Threaded calculating, everything done here will be added to an Queue
/*
	Function:
		CalculatePath
	Description:
		Get the XYZ position of the supplied NodeID
	Parameters:
		Start - The start NodeID
		End - the destination NodeID
		routeID (optional) - [custom integer supply] Here you can specify an integer value that will be passed
		to the callback, along with the calculated path information, for example the PlayerID.
	Note:
		if you will be using the routeID parameter for recognizing routes, make sure they all are unique,
		once started route search cannot be aborted and will just be queued and the callback will still be called.

		This function is Threaded, this means that if the CalculatePath search takes 3 seconds, it won't lagg your server.
		Your server will continue to work normally.

		Only the callback in the script which calls the plugin will get executed with this, if you do CalculatePath in Script1,
		and have your callback in Script2 then it won't get executed

		Returns always 1.
*/
native IsNodeIntersection(NodeID);
/*
	Function:
		IsNodeIntersection
	Description:
		Check if a node has 3 or more connections
	Parameters:
		NodeID - The ID of the node
	Return 1 if true, 0 if false, -1 if node doesn't exist.
*/
native Float:GetAngleBetweenNodes(NodeID_one,NodeID_middle_aka_two,NodeID_three);
/*
	Function:
		GetAngleBetweenNodes (Returns Float)
	Description:
		Gets the angle between 3 nodes (2 connections/lines).
	Parameters:
		NodeID* - The ID of the node
	Return 0.0 if one of the three nodes doesn't exist
*/
native GetConnectedNodes(NodeID);
/*
	Function:
		GetConnectedNodes
	Description:
		returns the amount of other nodes that are connected to this node, max is 5
	Parameters:
		NodeID* - The ID of the node
	Returns amount of nodes connected (0 to 5), on failure -1.
*/
native GetNextEmptyNodeID();
/*
	Function:
		GetNextEmptyNodeID
	Description:
		returns the closest empty node ID (closest starting from 0 to up);
	Note:
		Example:

				 new id = GetNextEmptyNodeID();
				 if(id != -1)AddNodeEx(id,X,Y,Z);

				 However this example results in:

				 AddNode(X,Y,Z);
		Returns -1 if no more available node slots.
*/
native GetQueueSize();
/*
	Function:
		GetQueueSize
	Description:
		gets the size of all queued path calculations to do.
	Returns -1 if the vector was locked when tried to access (Threading crash prevention), else it returns the vector size.
*/
native GetConnectedNodeID(NodeID,ConnectID);
/*
	Function:
		GetConnectedNodeID
	Description:
		gets the ID of an connection to NodeID, -1 if ConnectID has no connection, connectid must be between 0 and (MAX_CONNECTIONS-1), however there is OFB prevention check.
*/
native Float:GetConnectedNodeDistance(NodeID,ConnectID);
/*
	Function:
		GetConnectedNodeDistance (Returns Float)
	Description:
		gets the distance to a connected node (ConnectID) from the selected node (NodeID).
*/
native Float:GetDistanceBetweenNodes(NodeID_one,NodeID_two);
/*
	Function:
		GetDistanceBetweenNodes (Returns Float)
	Description:
		gets the distance between the two nodes (NOT VIA OTHER NODES, THIS JUST DOES THE X Y Z POSITION CALCULATION).
*/
native IsNodeInPathFinder(NodeID);
/*
	Function:
		IsNodeInPathFinder
	Description:
		Checks if NodeID is added to the routecalculator.
	Returns -1 if the NodeID is invalid and 0 if node is not in the route calculator, 1 if yes.
*/
native GetRouteArray(ID,destination[],size = sizeof(destination));
/*
	Function:
		GetRouteArray
	Description:
		Stores an saved array with assigned ID to destination[]
	Returns the amount of nodes in array at ID, Returns 0 if array is empty or ID doesn't exist.
*/
native GetRouteAtPos(ID,Array_Pos,&amount_of_nodes=0);
/*
	Function:
		GetRouteAtPos
	Description:
		Returns the NodeID in array[Array_Pos] at ID.
		Optionally you can specify an variable to store the amount of nodes in it.
*/
native StoreRouteArray(amount_of_nodes,array[]);
/*
	Function:
		StoreRouteArray
	Description:
		Stores an array to the plugins vector memory,
	returns the ID you can use in GetRouteArray or DeleteArray.
*/
native DeleteArray(ID);
/*
	Function:
		DeleteArray
	Description:
		Remove contents of the memory at ID.
*/
native AddExistingNodeToPathFinder(NodeID);
/*
	Function:
		AddExistingNodeToPathFinder
	Description:
		Adds an created node to the routecalculator.
	Returns -1 if the NodeID is invalid and 0 if node id does not exist or is already added, 1 on success.
*/
native RemoveNode(NodeID);
/*
	Function:
		RemoveNode
	Description:
		Deletes an node from the memory, to use in Write data, nodes loaded into the calculator won't be deleted, connections too.
	Returns -1 if the NodeID is invalid and 0 if node id does not exist, 1 on success.
*/
native DisconnectNodeFromNode(NodeIDOne,NodeIDTwo);
/*
	Function:
		DisconnectNodeFromNode
	Description:
		Disconnects Node ID One from Two, please see RemoveNode for information about the calculator memory.
	Returns -1 if the NodeID is invalid and 0 if node id does not exist, 1 on success.
*/
native DisconnectAllFromNode(NodeID);
/*
	Function:
		DisconnectAllFromNode
	Description:
		Disconnects all other nodes from NodeID, and NodeID from them.
	Returns -1 if the NodeID is invalid and 0 if node id does not exist, 1 on success.
*/
native DeleteNodeSystemAtNode(NodeID,array[],size = sizeof(array));
/*
	Function:
		DeleteNodeSystemAtNode
	Description:
		Get ALL nodeIDs that are CONNECTED IN ANY WAY, ALSO VIA OTHER NODES to NodeID into the array[].
		Usefull for deleting big-not-connected chunks of nodes.
	Returns 0 on failure, the array size on success.
*/
native GetNodeDirectionToConnect(NodeID,ConnectID);
/*
	Function:
		GetNodeDirectionToConnect
	Description:
		Get the direction this node[connectid] is connected in,
		0 means that :
			connectid is connected to nodeid
			nodeid is connected to connectid
		1 means that:
			nodeid is connected to connectid
			connectid is NOT connected to nodeid
		2 means that:
			nodeid is NOT connected to connectid
			connectid is connected to nodeid
	Note:
		Usefull for making 'left and right' road sides.
	Returns -1 on failure.
*/
native SetNodeDirectionToConnect(NodeID,ConectID,Direction);
/*
	Function:
		SetNodeDirectionToConnect
	Description:
		See GetNodeDirectionToConnect, this SETS the direction manually.
		It automaticly get the nodeID of 'ConectID' and sets the connection_direction to the good value.
	Returns 0 on failure, 1 on success.
*/
native NodeExists(NodeID);
/*
	Function:
		NodeExists
	Description:
		Checks if the given nodeID exists in the memory.
	Returns 0 if not, 1 if yes, -1 on failure.
*/
native RemoveAllRouteIDFromQueue(routeid);
/*
	Function:
		RemoveAllRouteIDFromQueue
	Description:
		Removes all pending calculations with 'routeid' from the queue.
	Returns -1 if the Queue is locked/accessed, else it returns the amount of entries deleted.
*/
forward GPS_WhenRouteIsCalculated(routeid,node_id_array[],amount_of_nodes,Float:distance);//Every processed Queue will be called here
/*
	Called when a path finding calculation is done.

	routeid - the id you specified for recognition of calls
	node_id_array -	this array is up to 1792 cells long
					it is build from the following information:

					node_id_array[0] ... node_id_array[1791] -
						all points (Node ID's) on the route
						in following order:
							from start, to end
	amount_of_nodes - this is the amount of nodes the total path is, is set to 0 when it's impossible to calculate the route.
	distance - the total distance all nodes take, rounded to an integer, is -1 if it's impossible to calculate the route.
	so you can do:
	public GPS_WhenRouteIsCalculated(routeid,node_id_array[],amount_of_nodes,distance)
	{
		for(new i = 0; i < amount_of_nodes; ++i)
		{
			printf("Point(%d)=NodeID(%d)",i,node_id_array[i]);
		}
		return 1;
	}
*/
forward OnPlayerClosestNodeIDChange(playerid,old_NodeID,new_NodeID);
/*
	Called when a player's closest nodeID changes.

	playerid - the id of the player
	old_NodeID and new_NodeID - the node ID's, old and new.
		new_NodeID is 'now' the closest node ID.

*/
native GetGPSdatVersion();
/*
	Function:
		GetGPSdatVersion
	Description:
		Gets the file version of GPS.dat
	Returns -1 if getting the GPS.dat version failed, else it returns the version number, this function is only available since package 162
*/
native GetPluginVersion();
/*
	Function:
		GetPluginVersion
	Description:
		Gets the plugin version
	Returns the plugin version, this function is only available since package 162
*/
stock GetIncludeVersion()
{
	return INCLUDE_VERSION;
}
/*
	Function:
		GetIncludeVersion
	Description:
		Gets the include file version
	Returns the inclde file version, this function is only available since package 162
*/
native gps_ManualPlayerAdding(enabled = 1);
/*
	Function:
		gps_ManualPlayerAdding
	Description:
		Lets the plugin know if it has to add players for OnClosestNodeIDChange automatically or you want to do it yourself.
	Returns the value you have set it to, 0 disabled, 1 enabled.
*/
native gps_AddPlayer(playerid);
/*
	Function:
		gps_AddPlayer
	Description:
		If manualadding enabled, adds the player to the update check.
	Returns 1 on success, 0 on failure, 2 if player already in list.
*/
native gps_RemovePlayer(playerid);
/*
	Function:
		gps_RemovePlayer
	Description:
		If manualadding enabled, removes the player from the update check.
	Returns 1 on success, 0 on failure.
*/
native GetRouteArrayFromTo(ID,From,To,dest[],size=sizeof(dest));
/*
	Function:
		GetRouteArrayFromTo
	Description:
		Please see GetRouteArray, the only difference is you can specify an range, from to, to extract.
	Returns amount of nodes put into dest[].
*/
native GetRouteArraySize(ID);
/*
	Function:
		GetRouteArraySize
	Description:
		returns the amount of nodes in the <ID>array.
	Returns returns the amount of nodes in the <ID>array.
*/
native GetNextNodeInArray(ArrayID,mark_done = 0);//return nodeid, else -1
/*
	Function:
		GetNextNodeInArray
	Description:
		returns the first node with mark_done == 0 from ArrayID , else -1 on failure
*/
native IsNodeInArray(ArrayID,NodeID);//Return 1 else 0
/*
	Function:
		IsNodeInArray
	Description:
		returns 1 if nodeid is in ArrayID, else 0
*/
native SetNodeIDMarkInArray(ArrayID,NodeID,mark_done,mark_all_prevous_same=0);//return 1 on success
/*
	Function:
		SetNodeIDMarkInArray
	Description:
		Marks the nodeID in ArrayID to the value you set (1 or 0) eg player already visited the nodeID
        mark_all_prevous_same if set to 1 will mark all NodeID's before the selected NodeID@index also to the same value you set mark_done to.
*/
native SetIndexMarkInArray(ArrayID,Index,mark_done,mark_all_prevous_same=0);//returns 1 on on success
/*
	Function:
		SetIndexMarkInArray
	Description:
		Marks the Index (instead check if nodeid, just Marked[index] = mark_done) in ArrayID to the value you set (1 or 0) eg player already visited the Index according to NodeID
        mark_all_prevous_same if set to 1 will mark all NodeID's before the selected NodeID@index also to the same value you set mark_done to.
*/
native EnableOnPlayerNodeIDChange();
/*
	Function:
		EnableOnPlayerNodeIDChange
	Description:
		Enables OnPlayerClosestNodeIDChange callback.
*/
native DisableOnPlayerNodeIDChange();
/*
	Function:
		DisableOnPlayerNodeIDChange
	Description:
		Disables OnPlayerClosestNodeIDChange callback.
*/
native NodeChangeScanAllNodes();
/*
	Function:
		NodeChangeScanAllNodes
	Description:
		Goes through all nodes when checking the closest nodeID in the callback.
*/
native NodeChangeScanAreaOnly();
/*
	Function:
		NodeChangeScanAreaOnly
	Description:
		Goes only through nodes in player area when checking the closest nodeID in the callback.
*/
native EnablePlayerOPIDC(playerid);
/*
	Function:
		EnablePlayerOPIDC
	Description:
		Enables a player to be checked in the OnPlayerClosestNodeID callback.
*/
native DisablePlayerOPIDC(playerid);
/*
	Function:
		DisablePlayerOPIDC
	Description:
		Removes a player from the OnPlayerClosestNodeID callback checking.
*/
native GetNodeIDMarkInArray(ArrayID,NodeID);//return 1 on true, 0 on false, -1 on failure
/*
	Function:
		GetNodeIDMarkInArray
	Description:
		The get function of the Set equilivant
*/
native GetIndexMarkInArray(ArrayID,Index);//return 1 on true, 0 on false, -1 on failure
/*
	Function:
		GetIndexMarkInArray
	Description:
		The get function of the Set equilivant
*/
#endif