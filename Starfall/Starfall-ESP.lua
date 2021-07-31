--@name CheeseESP
--@author Redox (I made it better 100% noscope)
--@shared

if CLIENT then
    local Players

    if player() == owner() then
        enableHud(owner(),true)
    end
    
    local scrW, scrH
    local scrW, scrH = render.getResolution()
    
    function Find() 
        Players = find.allPlayers()
    end
    
    Find()
    
    timer.create( "findTimer", 10, 0, function()
        Find()
    end)
    
    hook.add("PlayerDisconnected","discon",Find )
    hook.add("PlayerSpawn","firstspawn",Find )
    

    hook.add("postdrawopaquerenderables","draw",function()
        for N,Player in pairs(Players) do
        
            if Player:isValid() == false then
                Find()
                break
            end
        
            if Player == player() then
                continue
            end
            
            local TeamColor = team.getColor(Player:getTeam())
            local CustomColor = Color(255,0,0,254)
            
            render.setColor(TeamColor)
            
            if Player:getPos()[2] - owner():getPos()[2] < 2000 then
                if Player:getPos()[2] - owner():getPos()[2] > -2000 then
                    if Player:getPos()[1] - owner():getPos()[1] < 2000 then
                        if Player:getPos()[1] - owner():getPos()[1] > -2000 then
                            render.draw3DWireframeBox(Player:getPos(),Player:getAngles(),Player:obbMaxs(),Player:obbMins())
                            render.draw3DLine(owner():getPos(), Player:getPos())
                        end
                    end
                end
            end
            
        end
    end)

    
    hook.add("drawhud","draw",function()
        for N,Player in pairs(Players) do
        
            if Player:isValid() == false then
                Find()
                break
            end
        
            if Player == player() then
                continue
            end
            
            local Dis = player():obbCenterW():getDistance(Player:getPos())
            local Cords = Player:getPos():toScreen()
            local TeamColor = team.getColor(Player:getTeam())
            local CustomColor = Color(255,0,0,254)
            
            render.setColor(TeamColor)
            render.drawText(Cords["x"]-#Player:getName()*3,Cords["y"]-70000/Dis,Player:getName(), alignment)
        end
    end)
end