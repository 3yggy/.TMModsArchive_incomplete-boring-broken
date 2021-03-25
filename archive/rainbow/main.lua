



Rain = {}
function togglerainbow(cb)
  Rain[cb.playerId] = Rain[cb.playerId]+1
  if(Rain[cb.playerId]==3)then
    Rain[cb.playerId]=0
  end
  local val = Rain[cb.playerId]
  if(val==0) then
    tm.playerUI.SetUIValue(cb.playerId, "rainbow"..cb.playerId, "Rainbow | off       ")
  elseif(val==1 )then
    tm.playerUI.SetUIValue(cb.playerId, "rainbow"..cb.playerId, "Rainbow | uniform")
  else
    tm.playerUI.SetUIValue(cb.playerId, "rainbow"..cb.playerId, "Rainbow | crazy   ")
  end
end

function update()
  for k,player in pairs(playerList) do
    if(Rain[player.playerId]~=0)then
      local r =math.random(0, 255)/255
      local b =math.random(0, 255)/255
      local g =math.random(0, 255)/255
      for i,v in ipairs(tm.players.GetPlayerStructures(player.playerId))do
        for ii,iv in ipairs(v.GetBlocks())do
          if(Rain[player.playerId]~=1)then
             r =math.random(0, 255)/255
             b =math.random(0, 255)/255
             g =math.random(0, 255)/255
          end
            colour(iv,b,g,r)
        end
      end
    end
  end
end

function colour(iv,r,g,b)
  iv.SetColor(r,b,g,1)
  iv.SetSecondaryColor(r,b,g,1)
end

function onPlayerJoined(player)
  Rain[player.playerId] = 0
  playerList = tm.players.CurrentPlayers()
  tm.os.Log("player joined")
  tm.playerUI.AddUIButton(player.playerId, "ui"..player.playerId, "By: Ziggy")
  tm.playerUI.AddUIButton(player.playerId, "rainbow"..player.playerId, "Rainbow | off", togglerainbow, player.playerId)
end

tm.players.OnPlayerJoined.add(onPlayerJoined)
