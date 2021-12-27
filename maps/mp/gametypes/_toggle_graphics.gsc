init()
{
	level thread onPlayerConnect();
}

onPlayerConnect()
{
	for(;;)
	{
		level waittill( "connected", player );		
		
		if( !isDefined( player.pers[ "message_shown" ] ) )
			player.pers[ "message_shown" ] = 0;
		
		if( !isDefined( player.pers[ "cur_bright" ] ) )
			player.pers[ "cur_bright" ] = 0;
		
		player thread watchButton();
		player thread onPlayerSpawned();
	}
}

onPlayerSpawned()
{
	self endon("disconnect");

	for(;;)
	{
		self waittill("spawned_player");
		if( isDefined( self.pers[ "message_shown" ] ) && self.pers[ "message_shown" ] < 2 )
			self thread infoMessage();
	}
}

watchButton()
{
	self endon("disconnect");
	
	self notifyOnPlayerCommand("dat_dvar", "+actionslot 1");
	
	for(;;) {
		self waittill( "dat_dvar" );
		
		self.pers["cur_bright"] = !self.pers["cur_bright"];
		self setClientDvar( "r_fullbright", self.pers["cur_bright"]);
		
		if( self.pers["cur_bright"] )
			self iPrintlnBold("");
		else 
			self iPrintlnBold("");
	}
	
}

infoMessage()
{
	self endon("disconnect");
	self endon("death");
	
	self.pers[ "message_shown" ]++;
	wait 0.5;
	for( i=0; i<3; i++) {
		self iPrintlnBold("");
		wait 2;
	}
	
}