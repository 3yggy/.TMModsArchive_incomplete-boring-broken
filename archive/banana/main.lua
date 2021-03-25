
PlayersBananas = {}
PlayersRefresh = {}
Bananas = {}
function TrySplat(cb)
  tm.os.Log("try")
  local Id = tonumber(cb.playerId)
  if(Id ~= nil and PlayersBananas[Id]>0 and PlayersRefresh[Id]<=0)then
    tm.os.Log("splat")

    PlayersBananas[Id]=PlayersBananas[Id]-1
    PlayersRefresh[Id]=bananaRate
    local pos = tm.players.GetPlayerPosition(Id)
    Bananas[tm.physics.SpawnCustomObject(tm.vector3.Create(pos.x, pos.y+5, pos.z), "banana", "texture", false, 9999)] = pos
  end
end

function update()
  for Id,val in pairs(PlayersRefresh) do

    if(PlayersBananas[Id]<5 and math.random(0, 90)>89)then
      PlayersBananas[Id]=PlayersBananas[Id]+1
    end
    if(val>0)then
      PlayersRefresh[Id]=PlayersRefresh[Id]-1
    else
      for nana,pos in pairs(Bananas) do
        posp = tm.players.GetPlayerPosition(Id)
        if(math.sqrt((pos.x- posp.x)^2 +(pos.z- posp.z)^2) <5 )then
          nana.Despawn()
          local torque = math.random(-99500, 99500)
          for i,v in ipairs(tm.players.GetPlayerStructures(Id))do
            for ii,iv in ipairs(v.GetBlocks())do
              iv.SetHealth(iv.GetCurrentHealth()-330)
              iv.AddTorque(0,torque,0)
            end
          end
        end
      end
    end
    local num = math.floor((val/bananaRate)*10)
    tm.playerUI.SetUIValue(Id,"splat"..Id,string.sub("៛៛៛៛៛",0,PlayersBananas[Id]).." : SPLAT : "..string.sub("⋘⋘⋘⋘⋘⋘⋘⋘⋘⋘⋘⋘⋘",1,num))
  end
end

function onPlayerJoined(player)
  tm.playerUI.AddUIButton(player.playerId, "z"..player.playerId, "By: Ziggy")

  tm.os.Log("player joined")
  tm.playerUI.AddUIButton(player.playerId, "splat"..player.playerId, "Splat ", TrySplat, player.playerId)
  PlayersBananas[player.playerId] = 5
  PlayersRefresh[player.playerId] = 0
end
function onPlayerLeft(player)
  tm.os.Log("player left")
  PlayersBananas.remove(player.playerId)
  PlayersRefresh.remove(player.playerId)
end

function purgeNanas()
tm.physics.ClearAllSpawns()
end


tm.playerUI.AddUIButton(0, "perge ","Remove All nanas ", purgeNanas)

tm.players.OnPlayerJoined.add(onPlayerJoined)
tm.players.onPlayerLeft.add(onPlayerLeft)

tm.physics.AddMesh("banana.obj", "banana")
tm.physics.AddTexture("nana.png", "texture")


bananaRate = 15
