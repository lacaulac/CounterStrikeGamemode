// This is called every second to see if we can end the round
include( "shared.lua" )
AddCSLuaFile( "shared.lua" )
function GM:CheckRoundEnd()
 
	if ( !GAMEMODE:InRound() ) then return end
end
 
// This is called after a player wins in a free for all
function GM:OnRoundWinner( ply, resulttext )
 
	ply:AddScore( 1 ) // Let's pretend we have AddScore for brevity's sake
 
end
 
// Called when the round ends
function GM:OnRoundEnd( num )
	print("End of the round.")
       for k,v in pairs( team.GetPlayers( TEAM_HUMAN ) ) do
             v:SetFrags( 0 ) // Reset their frags for next round
       end
 
end
function GM:PlayerInitialSpawn(ply)
	ply:SetTeam( 3 )
end