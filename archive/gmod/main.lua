function onPlayerJoined(player)
  tm.playerUI.AddUIButton(player.playerId, "ui"..player.playerId, "By: Ziggy")

  playerList = tm.players.CurrentPlayers()
  tm.playerUI.AddUIText(player.playerId, "Acceleration"..player.playerId, "ERROR")
  tm.os.Log("new player"..tm.players.GetPlayerName(player.playerId))
end

PrevPos = {}
PrevVol = {}
function update()
  for k,player in pairs(playerList) do
    if(player == nil) then
      tm.os.Log("nill player: "..tm.players.GetPlayerName(player.playerId).."!")
    else
      if(PrevPos[player] == nil)then

        PrevPos[player] =tm.players.GetPlayerPosition(player.playerId)
        tm.os.Log("started doing: "..tm.players.GetPlayerName(player.playerId))
      else
        pt = PrevPos[player]
        ct = tm.players.GetPlayerPosition(player.playerId)

        num = math.sqrt((ct.x- pt.x)^2 +(ct.y- pt.y)^2 +(ct.z- pt.z)^2)
        --
        if(PrevVol[player] == nil)then

          PrevVol[player] =num
          tm.os.Log("started doing: "..tm.players.GetPlayerName(player.playerId))
        else
          pv = PrevVol[player]
          cv = num

          acell = cv - pv

          tm.playerUI.SetUIValue(player.playerId,"Acceleration"..player.playerId,"a:".. string.sub(tostring(math.abs(acell * 18.1).."000000"),1,6).." | ".."s:".. string.sub(tostring(math.abs(num * 18.1).."000000"),1,6))
          PrevVol[player] = num
        end
        PrevPos[player] = tm.players.GetPlayerPosition(player.playerId)
      end
    end
  end
end

tm.players.OnPlayerJoined.add(onPlayerJoined)
