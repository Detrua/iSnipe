#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;


MENU() //BY DETRUA
{
	self endon( "disconnect" );
	self notifyOnPlayerCommand("pressed", "+actionslot 3");
		
	centertextA = self createFontString("objective", 2.3);
	centertextB = self createFontString("objective", 1.95);
	centertextH = self createFontString("objective", 1.95);
	centertextD = self createFontString("objective", 1.8);
	centertextE = self createFontString("objective", 1.8);
	centertextC = self createFontString("objective", 1.8);
	centertextG = self createFontString("objective", 1.8);
	centertextF = self createFontString("objective", 1.8);
	centertextI = self createFontString("objective", 1.8);
	
	
	level.opened = 0;
		
	while(true)
	{
		if(level.opened==0)
		{		
			self waittill( "pressed");
			
			
			self SetClientDvar( "g_hardcore", "1" );
			
			self freezeControls(true);
	
			
			centertextA setPoint("CENTER", "CENTER", 0, -110);
			centertextA setText("^1Welcome, ^2" +self.name );
			centertextA.hideWhenInMenu = true;
			centertextA.foreground = false;
			
			centertextB setPoint("CENTER", "CENTER", 0, -88);
			centertextB setText("^0______________________________________");
			centertextB.hideWhenInMenu = true;
			centertextB.foreground = false;
			
		
			centertextC setPoint("CENTER", "CENTER", 0, -44);
			centertextC setText("^1Press");
			centertextC.hideWhenInMenu = true;
			centertextC.foreground = false;
			
			
			centertextD setPoint("CENTER", "CENTER", 0, -22);
			centertextD setText("^1Press");
			centertextD.hideWhenInMenu = true;
			centertextD.foreground = false;
			
			
			centertextE setPoint("CENTER", "CENTER", 0, 0);
			centertextE setText("^1Press");
			centertextE.hideWhenInMenu = true;
			centertextE.foreground = false;
			
			
		
			centertextF setPoint("CENTER", "CENTER", 0, 20);
			centertextF setText("^1Press");
			centertextF.hideWhenInMenu = true;
			centertextF.foreground = false;
			
			
			
			
			centertextG setPoint("CENTER", "CENTER", 0, 42);
			centertextG setText("^1Press");
			centertextG.hideWhenInMenu = true;
			centertextG.foreground = false;
			
			centertextH setPoint("CENTER", "CENTER", 0, 88);
			centertextH setText("^0______________________________________");
			centertextH.hideWhenInMenu = true;
			centertextH.foreground = false;
			
			centertextI setPoint("CENTER", "CENTER", 0, 110);
			centertextI setText("VIP: ^1OFF");
			centertextI.hideWhenInMenu = true;
			centertextI.foreground = false;
			
			///////////////////////////////////////////////////////////////////////////////
		
			
			
			level.opened = 1;
		}
		else if(level.opened == 1)
		{
		
			self waittill( "pressed");
			
			self SetClientDvar( "g_hardcore", "0" );
			
		

			self freezeControls(false);
			
			centertextA setText("");
			
			centertextB setText("");
			
			centertextC setText("");
			
			centertextD setText("");
			
			centertextE setText("");
			
			centertextF setText("");
			
			centertextG setText("");
			
			centertextH setText("");
			
			centertextI setText("");
			
			
			level.opened = 0;
		}
	}
}



