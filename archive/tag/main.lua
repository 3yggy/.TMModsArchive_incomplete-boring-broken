function onPlayerJoined(player)
  if(not ready) then
    ready = true
    innitialise()
  end
  tm.os.Log("new player"..NameOf(player))

  local pId = player.playerId
  tm.playerUI.AddUIButton(pId, "ui"..pId, "By: Ziggy")

  tm.playerUI.AddUIButton(pId, "hiderTitle"..pId, "Hider:")
  tm.playerUI.AddUIText(pId, "hiderName"..pId, "No Hider")
  --
  tm.playerUI.AddUIButton(pId, "winnerTitle"..pId, "Last Winner:")
  tm.playerUI.AddUIText(pId, "winnerName"..pId, "No Winner")
end

function newHider()
  playerList = tm.players.CurrentPlayers()

  if(#playerList>0) then
    hider = playerList[math.random(#playerList)]
    if(hider == nil and(hide ~= lastHider or #playerList == 1   )) then
      tm.os.Log("nill hider or hider repeated")
      newHider()
    else
      lastHider = hider
      tm.os.Log("random hider chosen: "..tm.players.GetPlayerName(hider.playerId).." | "..tostring(hider.playerId))
      for k,player in pairs(playerList) do
        if(player == nil) then
          tm.os.Log("nill player!!! !")
        else
          local pId = player.playerId
          tm.playerUI.SetUIValue(pId, "hiderName"..pId, tm.players.GetPlayerName(hider.playerId))
        --  tm.os.Log(tm.players.GetPlayerName(pId).."'s ui updated")
        end
      end
    end
  else
  tm.os.Log("empty playerlist"..tostring(#playerList))
  end
end

function update()
  if(hider ~= nil) then
  --  tm.os.Log("-hider is: "..NameOf(hider).." | hider is at: "..HV3.x..","..HV3.y..","..HV3.z)
    for k,player in pairs(playerList) do
      if(hider~=nil)then
        tm.playerUI.SetUIValue(player.playerId, "hiderName"..player.playerId, NameOf(hider))
      else
        tm.playerUI.SetUIValue(player.playerId, "hiderName"..player.playerId, "No Hider")
      end
      if(player == hider) then
    --   tm.os.Log("You are hiding from:")
      else
        local HV3 = tm.players.GetPlayerPosition(hider.playerId)
        local PV3 = tm.players.GetPlayerPosition(player.playerId)
        local distance = math.sqrt((HV3.x- PV3.x)^2 +(HV3.y- PV3.y)^2 +(HV3.z- PV3.z)^2)
        tm.os.Log("-"..NameOf(player).."is at: "..PV3.x..","..PV3.y..","..PV3.z)
        if(distance<35) then
          tm.os.Log(NameOf(player).."found "..NameOf(hider))
          hider = nil
          if (AutoHider)then
            newHider()
            tm.os.Log("automaticly chose a new hider!!!")
          end
          for k,uiplayer in pairs(playerList) do
            tm.playerUI.SetUIValue(uiplayer.playerId, "winnerName"..uiplayer.playerId, NameOf(player))
          end
          break
        end
      end
    end
  end
end

function toggleAutoHider()
  AutoHider = not AutoHider
  if(AutoHider) then
    tm.playerUI.SetUIValue(0, "tn", "Toggle Auto Hider | On")
  else
    tm.playerUI.SetUIValue(0, "tn", "Toggle Auto Hider | Off")
  end
end

function innitialise()
  tm.playerUI.AddUIButton(0, "nh", "New Hider", newHider)
  tm.playerUI.AddUIButton(0, "tn", "Toggle Auto Hider | Off", toggleAutoHider)
  tm.os.Log("started")
  newHider()
end

function NameOf(player)
  return tm.players.GetPlayerName(player.playerId)
end

tm.players.OnPlayerJoined.add(onPlayerJoined)
