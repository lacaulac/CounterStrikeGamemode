local CLASS = {}
 
CLASS.DisplayName			= "Human"
CLASS.WalkSpeed 			= 260
CLASS.CrouchedWalkSpeed 	= 0.2
CLASS.RunSpeed				= 250
CLASS.DuckSpeed				= 0.2
CLASS.JumpPower				= 300
CLASS.PlayerModel			= "models/player/breen.mdl"
CLASS.DrawTeamRing			= true
CLASS.DrawViewModel			= true
CLASS.CanUseFlashlight      = true
CLASS.MaxHealth				= 100
CLASS.StartHealth			= 100
CLASS.StartArmor			= 100
CLASS.RespawnTime           = 0 // 0 means use the default spawn time chosen by gamemode
CLASS.DropWeaponOnDie		= true
CLASS.TeammateNoCollide 	= false
CLASS.AvoidPlayers			= false // Automatically avoid players that we're no colliding
CLASS.Selectable			= true // When false, this disables all the team checking
CLASS.FullRotation			= true // Allow the player's model to rotate upwards, etc etc
 
function CLASS:Loadout( pl )
 
 
end
function GM:PlayerSetModel( ply )
	if pl:Team() == 1 then
		ply:SetModel("models/player/guerilla.mdl")//Set model to a guerilla terrorist
	end
	if pl:Team() == 2 then
		ply:SetModel("models/player/swat.mdl")//Set model to a SWAT ct
	end
end
function CLASS:OnSpawn( pl )
	
end
 
function CLASS:OnDeath( pl, attacker, dmginfo )
end
 
function CLASS:Think( pl )
end
 
function CLASS:Move( pl, mv )
end
 
function CLASS:OnKeyPress( pl, key )
end
 
function CLASS:OnKeyRelease( pl, key )
end
 
function CLASS:ShouldDrawLocalPlayer( pl )
	return false
end
 
function CLASS:CalcView( ply, origin, angles, fov )
end
 
player_class.Register( "Human", CLASS )