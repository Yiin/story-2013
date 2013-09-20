#include <a_samp>
#include <zcmd>
#include "RouteConnector"

stock Float:Angle2D(Float:PointAx, Float:PointAy, Float:PointBx, Float:PointBy)
{
    new Float:Angle;
    Angle = -atan2(PointBx - PointAx, PointBy - PointAy);
    return Angle;
}

stock GetMiddlePos(Float:x_1, Float:y_1, Float:x_2, Float:y_2, &Float:x_mid, &Float:y_mid)
{
    x_mid = (x_1 + x_2) / 2;    // Arithmetic mean value is all you need
    y_mid = (y_1 + y_2) / 2;
}

stock GetXYInFrontOfPoint( &Float: x, &Float: y, Float: angle, Float: distance ) {

   x += ( distance * floatsin( -angle, degrees ) );
   y += ( distance * floatcos( -angle, degrees ) );
}

stock GetXYInBehindOfPoint( &Float: x, &Float: y, Float: angle, Float: distance ) {

   x -= ( distance * floatsin( -angle, degrees ) );
   y -= ( distance * floatcos( -angle, degrees ) );
}

stock Float:GetDistanceBetweenPoints2D(Float:x,Float:y,Float:tx,Float:ty)
{
  new Float:temp1, Float:temp2;
  temp1 = x-tx;temp2 = y-ty;
  return floatsqroot(temp1*temp1+temp2*temp2);
}

stock GetXYLeftOfPoint(Float:x, Float:y, Float:Angle, Float:distance)
{
    Angle += 90.0;
    x += floatmul(floatsin(-Angle, degrees), distance);
    y += floatmul(floatcos(-Angle, degrees), distance);
}
stock GetXYRightOfPoint(Float:x, Float:y, Float:Angle, Float:distance)
{
    Angle -= 90.0;
    x += floatmul(floatsin(-Angle, degrees), distance);
    y += floatmul(floatcos(-Angle, degrees), distance);
}

/*stock CreateArea(Float:x, Float:y, Float:z, Float:distancetoadd)
{
    new Float:miny, Float:maxy, Float:minx, Float:maxx, Float:a = 90.0;
    miny = y - (distance * floatcos(-a, degrees));
    maxy = y + (distance * floatcos(-a, degrees));
    minx = x - floatmul(floatsin(-a, degrees), distance);
    maxx = x + floatmul(floatsin(-a, degrees), distance);
	return 1;
}*/

// NearestPlayerNode(playerid,Float:MaxDist=9999.99);

// NearestNodeFromPoint(Float:X,Float:Y,Float:Z,Float:MaxDist=9999.99);

// GetNodePos(NodeID,&Float:X,&Float:Y,&Float:Z);

// CalculatePath(Start,End,routeID = 0);

new IV_GPS_GZ[MAX_PLAYERS][20];

public GPS_WhenRouteIsCalculated(routeid, node_id_array[], amount_of_nodes)//Every processed Queue will be called here
{
	/*
	Called when a path finding calculation is done.

	routeid - the id you specified for recognition of calls
	node_id_array -	this array is up to 4000 cells long
					it is build from the following information:

					node_id_array[0] ... node_id_array[3999] -
						all points (Node ID's) on the route
						in following order:
							from start, to end
	amount_of_nodes - this is the amount of nodes the total path is.
	so you can do:
	public GPS_WhenRouteIsCalculated(routeid,node_id_array[],amount_of_nodes)
	{
		for(new i = 0; i < amount_of_nodes; ++i)
		{
			printf("Point(%d)=NodeID(%d)",i,node_id_array[i]);
		}
		return 1;
	}
	*/
	printf("[System: GPS_WhenRouteIsCalculated] - routeid: %d - node_id_array[0] - %d - amount_of_nodes: %d", routeid, node_id_array[0], amount_of_nodes);
	new playerid = routeid;
	new Float:midx, Float:midy, Float:x1, Float:y1, Float:z1, Float:x2, Float:y2, Float:z2, Float:a;
	new Float:frontdis, Float:backdis, Float:frontx, Float:fronty, Float:backx, Float:backy;
	new Float:minx, Float:maxx;
	for(new i = 1; i != amount_of_nodes; i++)
	{
	    GetNodePos(node_id_array[i], x1, y1, z1);
	    GetNodePos(node_id_array[i] + 1, x2, y2, z2);
    	GetMiddlePos(x1, y1, x2, y2, midx, midy);
        frontdis = GetDistanceBetweenPoints2D(midx, midy, x2, y2);
        backdis = GetDistanceBetweenPoints2D(midx, midy, x1, y1);
    	a = Angle2D( x1, y1, x2, y2 );
    	frontx = x1;
    	fronty = y1;
    	backx = x2;
    	backy = y2;
    	GetXYInFrontOfPoint( frontx, fronty, a, frontdis );
    	GetXYInFrontOfPoint( backx, backy, a, backdis );
		GetXYLeftOfPoint(midx, midy, a, 2);
		minx = midx;
    	GetXYRightOfPoint(midx, midy, a, 4);
    	maxx = midx;
    	IV_GPS_GZ[playerid][i] = GangZoneCreate(minx, backy, maxx, fronty);
    	printf("minx: %f - backy: %f - maxx: %f - front : %f", minx, backy, maxx, fronty);
    	GangZoneShowForPlayer(playerid, IV_GPS_GZ[playerid][i], 0xFF00F7FF);
    }
	return 1;
}
public OnPlayerClosestNodeIDChange(playerid, old_NodeID, new_NodeID)
{
	if(IsPlayerNPC(playerid)) return 1;
/*
	Called when a player's closest nodeID changes.

	playerid - the id of the player
	old_NodeID and new_NodeID - the node ID's, old and new.
		new_NodeID is 'now' the closest node ID.

*/
    return 1;
}

CMD:calnode(playerid, params[])
{
   	new nodeid = NearestPlayerNode(playerid, 9999.99);
   	new endnode = NearestNodeFromPoint(-2449, 2435, 0, 9999.99);
   	CalculatePath(nodeid, endnode, playerid);
	return 1;
}
