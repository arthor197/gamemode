include( "shared.lua" )

function HUDHide( myhud )
	for k, v in pairs{"CHudHealth","CHudBattery"} do
		if myhud == v then return false end
	end
end
hook.Add("HUDShouldDraw","HudHide",HUDHide)

rdmplayer = {}

function GM:HUDPaint()
	self.BaseClass:HUDPaint()
	local ply = LocalPlayer()
	local HP = LocalPlayer():Health()
	local ARM = LocalPlayer():Armor()
	local VIP = table.Random( rdmplayer )
	
	surface.CreateFont( "ScoreboardText", 40, 250, false, false, "HudFont" )
	surface.SetTextColor( 20, 180, 50, 255 )
	surface.SetTextPos( 20, 20 )
	surface.SetFont( "HudFont" )
	surface.DrawText( HP )
	
	surface.SetTextColor( 180, 180, 50, 255 )
	surface.SetTextPos( 20, 80 )
	surface.SetFont( "HudFont" )
	surface.DrawText( ARM )
	
	surface.SetTextColor( 180, 180, 50, 255 )
	surface.SetTextPos( 20, 80 )
	surface.SetFont( "HudFont" )
	surface.DrawText( VIP )
end