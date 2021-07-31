--@client

local url = "https://u.teknik.io/u7KBU.png"
local myMaterial = material.create("VertexLitGeneric")

local function loadCallback( mat, url, w, h, layout )
  if not url then return end

  layout( 0, 0, 1400, 1050 ) -- PosX, PosY, ScaleX, ScaleY
end

myMaterial:setTextureURL( "$basetexture", url, loadCallback, function() end )

myMaterial:setInt("$flags", 0)

local holo = holograms.create( chip():getPos() + Vector( 0, -10, 65 ), Angle(90,-90,0), "models/holograms/plane.mdl" )

holo:setSize(Vector(300, 300, 100))
holo:setParent(chip())

holo:setMaterial("!" .. myMaterial:getName())