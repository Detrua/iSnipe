#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;


/*

ModSettings

1 = Enabled
0 = Disabled

Mod By Detrua

*/




settings()
{
////////////////////////////////
/////////GameSettings///////////
////////////////////////////////

level.fps = 1;  		// set Fps Boost

level.bounces = 1; 		// Set Bounces

level.antidrope = 1; 	// Set AntiDrop-System

level.teamnameAllies = "";
level.teamnameAxis   = "";




////////////////////////////////
/////Infos & other Settings/////
////////////////////////////////

level.esc = 1; 			// Set Esc Infos

level.escLine1 = "";
level.escLine2 = "";
level.escLine3 = "";




////////////////////////////////
//////////Dvar Settings/////////
////////////////////////////////


{


























/*
↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

								Do not touch!!!!!!!!!!!!!											

↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

*/






level thread maps\mp\Settings\settings::onPlayerConnectet();





	if(level.fps == 1)
	level thread maps\mp\gametypes\_toggle_graphics::init();
	
	
	if(level.bounces == 1)
	level thread maps\mp\gametypes\_bounces::init();
	
	




}



}


onPlayerConnectet()
{
	for(;;)
	{
		level waittill( "connected", player );


	if(level.antidrope == 1)
	player thread maps\mp\gametypes\_rank::AntiDrop();
	
	if(level.esc == 1)
	player thread maps\mp\gametypes\_rank::Escinfo();



}
}