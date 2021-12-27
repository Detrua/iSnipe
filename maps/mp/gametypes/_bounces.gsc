/*
###Bounce mod
##Mod ADDON made by JoeyB
*/

#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

init()
{
	level thread onPlayerConnect();
	
	//The threads below set up each bounce
	
	if(getDvar("mapname") == "mp_terminal"){ 
		level thread Terminal();
	}
	if(getDvar("mapname") == "mp_afghan"){ 
		level thread Afghan();
	}
	if(getDvar("mapname") == "mp_derail"){ 
		level thread Derail();
	}
	if(getDvar("mapname") == "mp_estate"){ 
		level thread Estate();
	}
	if(getDvar("mapname") == "mp_favela"){ 
		level thread Favela();
	}
	if(getDvar("mapname") == "mp_highrise"){ 
		level thread Highrise();
	}
	if(getDvar("mapname") == "mp_invasion"){ 
		level thread Invasion();
	}
	if(getDvar("mapname") == "mp_checkpoint"){ 
		level thread Karachi();
	}
	if(getDvar("mapname") == "mp_quarry"){ 
		level thread Quarry();
	}
	if(getDvar("mapname") == "mp_rundown"){ 
		level thread Rundown();
	}
	if(getDvar("mapname") == "mp_rust"){ 
		level thread Rust();
	}
	if(getDvar("mapname") == "mp_boneyard"){ 
		level thread Scrapyard();
	}
	if(getDvar("mapname") == "mp_nightshift"){ 
		level thread Skidrow();
	}
	if(getDvar("mapname") == "mp_underpass"){ 
		level thread Underpass();
	}
	if(getDvar("mapname") == "mp_bailout"){ 
		level thread Bailout();
	}
	if(getDvar("mapname") == "mp_crash"){ 
		level thread Crash();
	}
	if(getDvar("mapname") == "mp_fuel2"){ 
		level thread Fuel();
	}
	if(getDvar("mapname") == "mp_boneyard"){ 
		level thread Scrapyard();
	}
	if(getDvar("mapname") == "mp_strike"){ 
		level thread Strike();
	}
	if(getDvar("mapname") == "mp_storm"){ 
		level thread Storm();
	}
}

onPlayerConnect()
{
	level endon( "game_ended" );
	for(;;)
	{
		level waittill( "connected", player );
		player thread onPlayerSpawned();
		
		player thread doThreads();
	}
}

onPlayerSpawned()
{
	self endon( "disconnect" );
	
	for(;;)
	{
		self waittill( "spawned_player" );

			self thread doDvars();
			
			self.vel = self GetVelocity();
			self.newVel = ( self.vel[0], self.vel[1], self.vel[2] );
			self SetVelocity( self.newVel );
	}
}

doDvars()
{
	setDvar("jump_height", 43.3);
	
	self maps\mp\perks\_perks::givePerk("specialty_falldamage"); //not a dvar - the perk that gives commando no fall damage - too lazy to make another thread
}

doThreads()
{
	self thread doVariables();
	self thread detectVelocity();
}

doVariables()
{
	self.vel = 0;
	self.newVel = 0;
	self.topVel = 0;
	self.canBounce = true;
}

detectVelocity()
{
	for(;;)
	{

		self.vel = self GetVelocity();
		
		self.newVel = (self.vel[0], self.vel[1], self Negate(self.vel[2]));

		wait 0.1;
	}
}

Negate( vector ) // Credits go to CodJumper.
{
	self endon( "death" );
	negative = vector - (vector * 2.25);
	return( negative );
}

CreateBounce(bounceCoord)
{
	self thread BounceThink(bounceCoord);
}

BounceThink(bounceCoord)
{
	self endon("disconnect");
	
	while(1) {
		foreach(player in level.players)
		{
			if(Distance(bounceCoord, player.origin) <= 100 && player.CanBounce == true){
					wait 0.1;
					player SetVelocity( player.newVel );
					player.CanBounce = false;
					wait 2.5;
					player.CanBounce = true;
			}
		}
		wait .1;
	}
}

//Be aware I haven't tested every single bounce. 
//You can go into private match with the mod and use devmap, and setviewpos <insert coords here> to teleport yourself to a bounce, this way you can find out where they all are.

Terminal() //FERTIG
{
	CreateBounce((1546.2, 3661.8, 129.2));
	CreateBounce((1120.6, 4401, 80));
	CreateBounce((633.7, 4588.3, 153.1));

}

Afghan()
{
	CreateBounce((1285, 1024, 150));
	CreateBounce((934, 1352, 196));
	CreateBounce((1472, 1849, 121));
	CreateBounce((1891, 1757, 150));
	CreateBounce((2166, 640, 90));
	CreateBounce((1882, 1760, 40));
}

Derail()
{
	CreateBounce((-1321, -2495, 206));
	CreateBounce((-591, -602, 113));
	CreateBounce((-860, 1774, 42));
	CreateBounce((2005, 3717, 290));
	CreateBounce((1456, 2801, 270));
}

Estate()
{
	CreateBounce((-808, 101, 54));
	CreateBounce((-1256, 482, -122));
	CreateBounce((-1438, 1033, -319));
	CreateBounce((-1260, 1386, -431));
	CreateBounce((-613, 2693, -19));
	CreateBounce((1839, 3851, 37));
	CreateBounce((645, 4098, 107));
}

Favela() //FERTIG
{
	CreateBounce((-123.4, -46.7, 142.3));
	CreateBounce((424, 581, 212.7));
	CreateBounce((514, 297.7, 248));
	CreateBounce((-900.5, 667.3, 102.1));
	CreateBounce((-1188.1, 550, 122.1));
	CreateBounce((-1131.3, -21.9, 126.1));
	CreateBounce((381.1, -80, 142.3));
	CreateBounce((-1315.2, 157.3, 132.1));
	CreateBounce((-1320.2, -109.4, 166.1));
	
	
	
}

Highrise()
{
	CreateBounce((-2598, 7304, 3015));
	CreateBounce((-647, 6942, 2747));
	CreateBounce((-1223, 8182, 2885));
	CreateBounce((-1908, 6899, 2835));
	CreateBounce((-2426, 6111, 2863));
	CreateBounce((-531, 6556, 2895));
	CreateBounce((-920, 5870, 2854));
}

Invasion()
{
	CreateBounce((-2612, -3035, 323));
	CreateBounce((-3183, -2509, 311));
	CreateBounce((-2987, -1551, 341));
	CreateBounce((-2334, -1057, 319));
	CreateBounce((-693, -1698, 368));
	CreateBounce((-772, -3352, 500));
	CreateBounce((-1126, -3168, 316));
	CreateBounce((-1745, -2596, 323));
	CreateBounce((829, -1337, 342));
}

Karachi()
{
	CreateBounce((-100, 209, 198));
	CreateBounce((-899, 171, 60));
	CreateBounce((-1346, 9, 46));
	CreateBounce((-736, 1407, 65));
	CreateBounce((-740, 1438, 95));
	CreateBounce((-761, 1249, 37));
	CreateBounce((1113, 1005, 69));
	CreateBounce((1274, 530, 130));
	CreateBounce((-1194, -630, 192));
	CreateBounce((-369, -1305, 61));
	CreateBounce((-42, -1030, 69));
	CreateBounce((17, -1072, 69));
	CreateBounce((52, 307, 156));
	CreateBounce((124, -368, 137));
	CreateBounce((176, -2670, 44));
	CreateBounce((2230, -486, 114));
}

Quarry()
{
	CreateBounce((-3412, -557, -132));
	CreateBounce((-3632, -434, -44));
	CreateBounce((-5558, -175, -75));
	CreateBounce((-5596, 81, -67));
	CreateBounce((-5308, 228, -54));
	CreateBounce((-4358, 929, -250));
	CreateBounce((-3039, 2285, 87));
	CreateBounce((-3683, 408, -65));
	CreateBounce((-3097, -89, -165));
}

Rundown()
{
	CreateBounce((761, -13, -69));
	CreateBounce((783, -657, 89));
}

Rust() //FERTIG
{
	//CreateBounce((1494, 580, -147));
	CreateBounce((192, 898, -151));
	CreateBounce((127, 1335, -175));
	CreateBounce((511.5, 445.2, -15.5));
	CreateBounce((710.2, 1350, 70.5));
}

Scrapyard()
{
	CreateBounce((-359, 772, -32));
	CreateBounce((536, 32, -66));
	CreateBounce((1015, 260, -95));
	CreateBounce((-855, 233, -59));
	CreateBounce((-1006, 575, 90));
}

Skidrow() //FERTIG
{
	CreateBounce((1576, -395, 60));
	CreateBounce((7, -110, 113));
	CreateBounce((-863, -1876, 60));
	CreateBounce((-1928, -872, 52.3));
	CreateBounce((596, -1374, 93));
	CreateBounce((1469, -1487, 123));
	CreateBounce((-1704, -666, 49));
}

Underpass()
{
	CreateBounce((922, 230, 227));
	CreateBounce((2291, 1992, 345));
	CreateBounce((771, 2061, 240));
	CreateBounce((-290, 1255, 180));
	CreateBounce((-330, 2085, 140));
	CreateBounce((2728, 1677, 365));
	CreateBounce((7, 727, 177));
	CreateBounce((574, 560, 240));
	CreateBounce((755, 690, 327));
}

Bailout()
{
	CreateBounce((1687, -2356, 479));
	CreateBounce((1571, -2359, 494));
	CreateBounce((-73, -2660, 732));
	CreateBounce((-16, -3495, 716));
}

Crash()
{
	CreateBounce((792, 597, 212));
	CreateBounce((-308, -863, -148));
	CreateBounce((844, 618, 224));
	CreateBounce((480, -216, 176));
	CreateBounce((1202, -1274, 111));
	CreateBounce((-322, -878, 150));
	CreateBounce((-462, 1293, 290));
	CreateBounce((-256, 1723, 266));
	CreateBounce((1381, 96, 300));
}

Overgrown()
{
	CreateBounce((-283, -3532, -245));
	CreateBounce((530, -1914, -252));
	CreateBounce((1073, -1390, -261));
	CreateBounce((1232, -440, -218));
}

Fuel()
{
	CreateBounce((1249, -1337, -60));
}

Strike()
{
	CreateBounce((-462, 737, 101));
	CreateBounce((-599, 595, 92));
	CreateBounce((-710, 599, 92));
	CreateBounce((-44, 735, 92));
	CreateBounce((-847, 845, 92));
	CreateBounce((-712, 982, 92));
	CreateBounce((-599, 982, 92));
	CreateBounce((-462, 845, 92));
	CreateBounce((-1434, -223, 79));
	CreateBounce((1482, -757, 65));
	CreateBounce((830, 316, 134));
}

Storm()
{
	CreateBounce((-1280, 1142, 52));
	CreateBounce((-885, -426, 39));
	CreateBounce((-1775, -560, 46));
	CreateBounce((-1378, -1306, 38));
}
