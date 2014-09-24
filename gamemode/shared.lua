GM.Name 	= "Counter Strike"
GM.Author 	= "lacaulac and xX_GeogebraMaster_Xx"
GM.Email 	= ""
GM.Website 	= ""
GM.Help		= "Kill the other team!"
 
GM.Data = {}
 
DeriveGamemode( "fretta" )
include( "player_class/class_human.lua" )
 
GM.TeamBased = true					// Team based game or a Free For All game?
GM.AllowAutoTeam = false
GM.AllowSpectating = true
GM.SecondsBetweenTeamSwitches = 10
GM.GameLength = 15
GM.RoundLimit = 10					// Maximum amount of rounds to be played in round based games
GM.VotingDelay = 5					// Delay between end of game, and vote. if you want to display any extra screens before the vote pops up
 
GM.NoPlayerSuicide = false
GM.NoPlayerDamage = false
GM.NoPlayerSelfDamage = false		// Allow players to hurt themselves?
GM.NoPlayerTeamDamage = false		// Allow team-members to hurt each other?
GM.NoPlayerPlayerDamage = false 	// Allow players to hurt each other?
GM.NoNonPlayerPlayerDamage = false 	// Allow damage from non players (physics, fire etc)
GM.NoPlayerFootsteps = false		// When true, all players have silent footsteps
GM.PlayerCanNoClip = false			// When true, players can use noclip without sv_cheats
GM.TakeFragOnSuicide = true			// -1 frag on suicide
 
GM.MaximumDeathLength = 10			// Player will respawn if death length > this (can be 0 to disable)
GM.MinimumDeathLength = 5			// Player has to be dead for at least this long
GM.AutomaticTeamBalance = true     // Teams will be periodically balanced 
GM.ForceJoinBalancedTeams = false	// Players won't be allowed to join a team if it has more players than another team
GM.RealisticFallDamage = false
GM.AddFragsToTeamScore = false		// Adds player's individual kills to team score (must be team based)
 
GM.NoAutomaticSpawning = false		// Players don't spawn automatically when they die, some other system spawns them
GM.RoundBased = true				// Round based, like CS
GM.RoundLength = 60 * 2					// Round length, in seconds
GM.RoundPreStartTime = 5			// Preperation time before a round starts
GM.RoundPostLength = 5				// Seconds to show the 'x team won!' screen at the end of a round
GM.RoundEndsWhenOneTeamAlive = true	// CS Style rules
 
GM.EnableFreezeCam = true			// TF2 Style Freezecam
GM.DeathLingerTime = 3				// The time between you dying and it going into spectator mode, 0 disables
 
GM.SelectModel = true               // Can players use the playermodel picker in the F1 menu?
GM.SelectColor = true				// Can players modify the colour of their name? (ie.. no teams)
 
GM.PlayerRingSize = 48              // How big are the colored rings under the player's feet (if they are enabled) ?
GM.HudSkin = "SimpleSkin"
 
GM.ValidSpectatorModes = { OBS_MODE_CHASE, OBS_MODE_IN_EYE, OBS_MODE_ROAMING }
GM.ValidSpectatorEntities = { "player" }	// Entities we can spectate
GM.CanOnlySpectateOwnTeam = false // you can only spectate players on your own team

function gotot(player)
	player:SetTeam( 1 )
	player:ConCommand("kill")
end
function gotoct(player)
	player:SetTeam( 2 )
	player:ConCommand("kill")
end
function getSID()
	for _, v in pairs( player.GetAll() ) do
		print( v:SteamID() )
	end
end
concommand.Add( "gotot", gotot )
concommand.Add( "gotoct", gotoct )
concommand.Add( "getsid", getSID )
 
function GM:CreateTeams()
 
	if ( !GAMEMODE.TeamBased ) then return end
 
	team.SetUp( 1, "Terrorists", Color( 50, 255, 50 ), true )
	team.SetSpawnPoint( 1, { "info_player_start", "info_player_terrorist", "info_player_rebel", "info_player_deathmatch" } )
	team.SetClass( 1, { "Human" } ) // "Human" is the class we want players to use
	
	team.SetUp( 2, "Counter Terrorists", Color( 50, 255, 50 ), true )
	team.SetSpawnPoint( 2, { "info_player_start", "info_player_counterterrorist", "info_player_combine", "info_player_rebel" } )
	team.SetClass( 2, { "Human" } ) // "Human" is the class we want players to use
 
	team.SetUp( TEAM_SPECTATOR, "Spectators", Color( 200, 200, 200 ), true )
	team.SetSpawnPoint( TEAM_SPECTATOR, { "info_player_start", "info_player_terrorist", "info_player_counterterrorist", "info_player_combine", "info_player_rebel" } ) 
 
end
function GM:PlayerSpawn( pl )
	if pl:Team() != 3 then
		pl:Give("bb_css_knife")
		pl:Give("bb_cssfrag")
		pl:Give("bb_css_smoke")
		if pl:Team() == 1 then
			pl:Give("bb_ak47")
			pl:Give("bb_glock")
		end
		if pl:Team() == 2 then
			pl:Give("bb_m4a1")
			pl:Give("bb_usp")
		end
		if(pl:SteamID() == "STEAM_0:1:32902178") then
			pl:Give("weapon_physgun")
			pl:Give("weapon_awp")
		end
	end
end