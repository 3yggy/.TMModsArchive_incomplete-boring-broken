
function toggleToggle(cb)
  Toggle[cb.playerId] = not Toggle[cb.playerId]
  if(Toggle[cb.playerId]) then
    tm.playerUI.SetUIValue(cb.playerId, "Toggle"..cb.playerId, "Toggle Toggle | On")
  else
    tm.playerUI.SetUIValue(cb.playerId, "Toggle"..cb.playerId, "Toggle Toggle | Off")
  end
end

function update()
  end
  for k,player in pairs(playerList) do
    if(Toggle[player.playerId])then
      local pos = tm.players.GetPlayerPosition(player.playerId)
      table.insert(Toggles,tm.physics.SpawnCustomObject(tm.vector3.Create(pos.x, pos.y+59, pos.z), "Toggle", "texture", true, 1))
      tm.os.Log("Toggle")
    end
  end
end

function colour(iv,r,g,b)
  iv.SetColor(r,b,g,1)
  iv.SetSecondaryColor(r,b,g,1)
end

function onPlayerJoined(player)
  Toggle[player.playerId] = false
  playerList = tm.players.CurrentPlayers()
  tm.os.Log("player joined")
  tm.playerUI.AddUIButton(player.playerId, "ui"..player.playerId, "By: Ziggy")
  tm.playerUI.AddUIButton(player.playerId, "Toggle"..player.playerId, "Toggle Toggle | Off", toggleToggle, player.playerId)
end

tm.players.OnPlayerJoined.add(onPlayerJoined)
--tm.physics.AddMesh("tinker.obj", "Toggle")
--tm.physics.AddTexture("nana.png", "texture")
