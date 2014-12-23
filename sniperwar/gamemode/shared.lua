GM.Name = "Sniper War"
GM.Author = "Kyle Smith"
GM.Email = "N/A"
GM.Website = "N/A"

//Teams
team.SetUp( 0, "Waiting", Color(0, 255, 0) )
team.SetUp( 1, "Criminals", Color(0, 0, 255) )
team.SetUp( 2, "Police", Color(255, 0, 0) )

//Models Pre Cache
util.PrecacheModel("models/player/Police.mdl")
util.PrecacheModel("models/player/phoenix.mdl")
util.PrecacheModel("models/player/Group01/Male_01.mdl")

function GM:Initialize()
	self.BaseClass.Initialize( self )
end