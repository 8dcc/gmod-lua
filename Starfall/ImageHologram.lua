--@name Anime girl probably
--@client

local url = "https://u.teknik.io/u7KBU.png"
local myMaterial = material.create("VertexLitGeneric")
local holoSize = 100

local function loadCallback( mat, url, w, h, layout )
  if not url then return end

  layout( 0, 0, 1400, 1050 ) -- PosX, PosY, ScaleX, ScaleY
end

myMaterial:setTextureURL( "$basetexture", url, loadCallback, function() end )

myMaterial:setInt("$flags", 0)

local holo = holograms.create( chip():getPos() + Vector( 0, -5, holoSize/1.9 ), Angle(90,-90,0), "models/holograms/plane.mdl" )

holo:setSize(Vector(holoSize, holoSize, holoSize))
holo:setParent(chip())

holo:setMaterial("!" .. myMaterial:getName())

print("Done. Check the Y coordinate.")  -- I kept forgoting the holo is created facing Y
