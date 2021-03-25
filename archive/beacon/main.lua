



Marker = {}
Markers = {}
function toggleMarker(cb)
  Marker[cb.playerId] = not Marker[cb.playerId]
  if(Marker[cb.playerId]) then
    tm.playerUI.SetUIValue(cb.playerId, "Marker"..cb.playerId, "Toggle Marker | On")
  else
    tm.playerUI.SetUIValue(cb.playerId, "Marker"..cb.playerId, "Toggle Marker | Off")
  end
end

function update()
  for k,_Marker in pairs(Markers) do
    --if(MarkersLife[Marker]<1)then
    tm.physics.ClearAllSpawns()
  --  else
    --  MarkersLife[Marker] = MarkersLife[Marker]-1
  --  end
  end
  for k,player in pairs(playerList) do
    if(Marker[player.playerId])then
      local pos = tm.players.GetPlayerPosition(player.playerId)
      table.insert(Markers,tm.physics.SpawnCustomObject(tm.vector3.Create(pos.x, pos.y+59, pos.z), "Marker", "texture", true, 1))
      tm.os.Log("Marker")
    end
  end
end

function colour(iv,r,g,b)
  iv.SetColor(r,b,g,1)
  iv.SetSecondaryColor(r,b,g,1)
end

function onPlayerJoined(player)
  Marker[player.playerId] = false
  playerList = tm.players.CurrentPlayers()
  tm.os.Log("player joined")
  tm.playerUI.AddUIButton(player.playerId, "ui"..player.playerId, "By: Ziggy")
  tm.playerUI.AddUIButton(player.playerId, "Marker"..player.playerId, "Toggle Marker | Off", toggleMarker, player.playerId)
end

tm.players.OnPlayerJoined.add(onPlayerJoined)
tm.physics.AddMesh("tinker.obj", "Marker")
tm.physics.AddTexture("nana.png", "texture")
