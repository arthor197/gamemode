AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( "shared.lua" )

if SERVER then
	timer.Start("PrintMapChange")
	timer.Start("MapChange")
end

function GM:PlayerInitialSpawn( ply )
// These are default speeds
	ply:SetGravity( 1 )
	ply:SetWalkSpeed( 250 )
	ply:SetRunSpeed( 400 )
	RNDSPAWN = math.random( 1, 2 )
	ply:SetTeam( RNDSPAWN )
	timer.Start("Team")
	chat.AddText( "SYSTEM: Welcome ".. ply:Nick() .. " to the server!" )
end

function GM:PlayerSpawn( ply )
//Player Spawns
	if ply:Team() == 0 then
		ply:Give( "weapon_pistol" )
		ply:SetModel( "models/player/Group01/Male_01.mdl" )
		ply:SetRunSpeed( 1000 )
	end
	if ply:Team() == 1 then
		ply:Give( "weapon_crowbar" )
		ply:Give( "weapon_pistol" )
		ply:SetModel( "models/player/phoenix.mdl" )
	end
	if ply:Team() == 2 then
		ply:Give( "weapon_pistol" )
		ply:Give( "weapon_stunstick" )
		ply:SetModel( "models/player/Police.mdl" )
	end
	
//Auto Team Balance
function TeamBal()
	CRIM = team.NumPlayers( 1 )
	POL = team.NumPlayers( 2 )
	if CRIM > POL then
		ply:SetTeam( 2 )
	elseif POL > CRIM then
		ply:SetTeam( 1 )
	end
end

//Random Team
function RandTeam()
	RND = math.random( 1, 2 )
	ply:SetTeam( RND )
end

//Map Rotate
Maps = {}
Maps[1] = "gm_flatgrass"
Maps[2] = "gm_construct"
Maps[3] = "cs_assault"
Maps[4] = "cs_compound"
Maps[5] = "cs_office"

function PrintingMapChange()
	PrintMessage( HUD_PRINTTALK, "SYSTEM: Changing to a random map in 30 seconds!" )
end

function ChangeMap()
	RunConsoleCommand("changelevel", Maps[math.random( 1, 5 )]);
end

//Timers
timer.Create( "TeamBal", 900, 2, TeamBal )
timer.Create( "PrintMapChange", 10, 0, PrintingMapChange )
timer.Create( "MapChange", 1800, 0, ChangeMap )

//Console Commands
concommand.Add( "rndteam", RandTeam )
concommand.Add( "force_teambal", TeamBal )
concommand.Add( "force_mapchange", ChangeMap )
concommand.Add( "kill" )