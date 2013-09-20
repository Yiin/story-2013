//
// A Driver NPC that goes around a path continuously
// Kye 2009
//

#include <a_npc>

//------------------------------------------

main(){}

//------------------------------------------

public OnRecordingPlaybackEnd()
{
    StopRecordingPlayback();
}

//------------------------------------------

public OnNPCEnterVehicle(vehicleid, seatid)
{
    StartRecordingPlayback(1, "Intro_Bus3");
}

//------------------------------------------

public OnNPCExitVehicle()
{
    StopRecordingPlayback();
}

//------------------------------------------
