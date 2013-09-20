public OnVehicleDeath(vehicleid, killerid)	return onVehicleDeath(getVehicleFromSampID(vehicleid), killerid);
public OnVehicleDamageStatusUpdate(vehicleid, playerid) return onVehicleDamageStatusUpdate(getVehicleFromSampID(vehicleid), playerid);
public OnUnoccupiedVehicleUpdate(vehicleid, playerid, passenger_seat) return onUnoccupiedVehicleUpdate(getVehicleFromSampID(vehicleid), playerid, passenger_seat);
public OnVehicleStreamIn(vehicleid, forplayerid) return onVehicleStreamIn(getVehicleFromSampID(vehicleid), forplayerid);
public OnVehicleStreamOut(vehicleid, forplayerid) return onVehicleStreamOut(getVehicleFromSampID(vehicleid), forplayerid);
hook   OnVehicleSpawn(vehicleid) return onVehicleSpawn(getVehicleFromSampID(vehicleid));
public OnVehicleMod(playerid, vehicleid, componentid) return onVehicleMod(playerid, getVehicleFromSampID(vehicleid), componentid);
public OnVehiclePaintjob(playerid, vehicleid, paintjobid) return onVehiclePaintjob(playerid, getVehicleFromSampID(vehicleid), paintjobid);
public OnVehicleRespray(playerid, vehicleid, color1, color2) return onVehicleRespray(playerid, getVehicleFromSampID(vehicleid), color1, color2);
public OnPlayerEnterVehicle(pid, vehicleid, ispassenger) return onPlayerEnterVehicle(pid, getVehicleFromSampID(vehicleid), ispassenger);
public OnPlayerExitVehicle(pid, vehicleid) return onPlayerExitVehicle(pid, getVehicleFromSampID(vehicleid));

#define isPlayerInRangeOfVehicle(%0,%1,%2) IsPlayerInRangeOfVehicle(%0,getVehicle(%1),%2)
#define attachObjectToVehicle(%0,%1,%2) AttachObjectToVehicle(%0,getVehicle(%1),%2)
#define getVehiclePos(%0,%1) GetVehiclePos(getVehicle(%0),%1)
#define setVehicleParamsForPlayer(%0,%1,%2) SetVehicleParamsForPlayer(getVehicle(%1),%0,%2)
#define getVehicleZAngle(%0,%1) GetVehicleZAngle(getVehicle(%0),%1)
#define setVehicleHealth(%0,%1) SetVehicleHealth(getVehicle(%0),%1)
#define getVehicleHealth(%0,%1) GetVehicleHealth(getVehicle(%0),%1)
#define addVehicleComponent(%0,%1) AddVehicleComponent(getVehicle(%0),%1)
#define isVehicleStreamedIn(%0,%1) IsVehicleStreamedIn(getVehicle(%0),%1)
#define setVehiclePos(%0,%1) SetVehiclePos(getVehicle(%0),%1)
#define getVehicleRotationQuat(%0,%1) GetVehicleRotationQuat(getVehicle(%0),%1)
#define getVehicleDistanceFromPoint(%0,%1) GetVehicleDistanceFromPoint(getVehicle(%0),%1)
#define setVehicleZAngle(%0,%1) SetVehicleZAngle(getVehicle(%0),%1)
#define setVehicleParamsEx(%0,%1) SetVehicleParamsEx(getVehicle(%0),%1)
#define getVehicleParamsEx(%0,%1) GetVehicleParamsEx(getVehicle(%0),%1)
#define setVehicleToRespawn(%0,%1) SetVehicleToRespawn(getVehicle(%0),%1)
#define linkVehicleToInterior(%0,%1) LinkVehicleToInterior(getVehicle(%0),%1)
#define removeVehicleComponent(%0,%1) RemoveVehicleComponent(getVehicle(%0),%1)
#define changeVehicleColor(%0,%1,%2) ChangeVehicleColor(getVehicle(%0),%1,%2),car[%0][car_color1]=%1,car[%0][car_color2]=%2
#define changeVehiclePaintjob(%0,%1) ChangeVehiclePaintjob(getVehicle(%0),%1)
#define attachTrailerToVehicle(%0,%1) AttachTrailerToVehicle(getVehicle(%0),%1)
#define detachTrailerFromVehicle(%0) DetachTrailerFromVehicle(getVehicle(%0))
#define isTrailerAttachedToVehicle(%0,%1) IsTrailerAttachedToVehicle(getVehicle(%0),%1)
#define getVehicleTrailer(%0,%1) GetVehicleTrailer(getVehicle(%0),%1)
#define setVehicleNumberPlate(%0,%1) SetVehicleNumberPlate(getVehicle(%0),%1)
#define getVehicleModel(%0) GetVehicleModel(getVehicle(%0))
#define getVehicleComponentInSlot(%0,%1) GetVehicleComponentInSlot(getVehicle(%0),%1)
#define getVehicleComponentType(%0,%1) GetVehicleComponentType(getVehicle(%0),%1)
#define repairVehicle(%0) RepairVehicle(getVehicle(%0))
#define getVehicleVelocity(%0,%1) GetVehicleVelocity(getVehicle(%0),%1)
#define setVehicleVelocity(%0,%1) SetVehicleVelocity(getVehicle(%0),%1)
#define setVehicleAngularVelocity(%0,%1) SetVehicleAngularVelocity(getVehicle(%0),%1)
#define getVehicleDamageStatus(%0,%1) GetVehicleDamageStatus(getVehicle(%0),%1)
#define updateVehicleDamageStatus(%0,%1) UpdateVehicleDamageStatus(getVehicle(%0),%1)
#define setVehicleVirtualWorld(%0,%1) SetVehicleVirtualWorld(getVehicle(%0),%1)
#define getVehicleVirtualWorld(%0,%1) GetVehicleVirtualWorld(getVehicle(%0),%1)
#define getPlayerVehicleID(%0) (!IsPlayerInAnyVehicle(%0)?(INVALID_VEHICLE_ID):(getVehicleFromSampID(GetPlayerVehicleID(%0))))
#define getPlayerSurfingVehicleID(%0) ((GetPlayerSurfingVehicleID(%0) == INVALID_VEHICLE_ID)?INVALID_VEHICLE_ID:getVehicleFromSampID(GetPlayerSurfingVehicleID(%0)))
#define attach3DTextLabelToVehicle(%0,%1,%2) Attach3DTextLabelToVehicle(%0,getVehicle(%1),%2)
#define putPlayerInVehicle(%0,%1,%2) PutPlayerInVehicle(%0,getVehicle(%1),%2)
#define isPlayerInVehicle(%0,%1) IsPlayerInVehicle(%0,getVehicle(%1))
#define destroyVehicle(%0) DestroyVehicle(getVehicle(%0))