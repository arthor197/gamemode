AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( "shared.lua" )

function GM:PlayerInitialSpawn( ply )
// These are default speeds
	ply:SetGravity( 1 )
	ply:SetWalkSpeed( 250 )
	ply:SetRunSpeed( 400 )
	ply:SetTeam( 0 )
	timer.Start("Team")
	print("Player: " .. ply:Nick() .. ", has spawned.")
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
	
//Team Balance
function TeamT()
	local RNDTEAM = math.random( 1, 2 )
		if RNDTEAM == 1 then
			ply:SetTeam( 1 )
		elseif RNDTEAM == 2 then
			ply:SetTeam( 2 )
	end
	CRIM = team.NumPlayers( 1 )
	POL = team.NumPlayers( 2 )
		if CRIM > POL then
			ply:SetTeam( 2 )
		elseif POL > CRIM then
			ply:SetTeam( 1 )
		end
	end
timer.Pause("Team")
end

function PAC_STARTFUNC()
	RND = math.random( 1, 2 )
	ply:SetTeam( RND )
end

//Console Commands
concommand.Add( "PAC_START", PAC_STARTFUNC )
concommand.Add( "kill" )