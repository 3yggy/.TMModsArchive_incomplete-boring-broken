Drag = {}
function toggleDrag(cb)
  Drag[cb.playerId] = Drag[cb.playerId]+1
  if(Drag[cb.playerId]==6)then
    Drag[cb.playerId]=0
  end
  local val = Drag[cb.playerId]
  if(val==0) then
    tm.playerUI.SetUIValue(cb.playerId, "DragDir"..cb.playerId, "Drag | Front")
  elseif(val==1 )then
    tm.playerUI.SetUIValue(cb.playerId, "DragDir"..cb.playerId, "Drag | Back")
  elseif(val==2 )then
    tm.playerUI.SetUIValue(cb.playerId, "DragDir"..cb.playerId, "Drag | Up  ")
  elseif(val==3 )then
    tm.playerUI.SetUIValue(cb.playerId, "DragDir"..cb.playerId, "Drag | Down")
  elseif(val==4 )then
    tm.playerUI.SetUIValue(cb.playerId, "DragDir"..cb.playerId, "Drag | Left")
  else
    tm.playerUI.SetUIValue(cb.playerId, "DragDir"..cb.playerId, "Drag | Right")
  end
end

function setDrag(cb)
  local Id = cb.playerId
  local num = tonumber(cb.value)
  local Block = tm.players.GetPlayerSelectBlockInBuild(Id)
  if(Block ~= nil)then
    local val = Drag[cb.playerId]
    if(val==0) then
      Block.SetDragAll(num,1,1,1,1,1)
    elseif(val==1 )then
      Block.SetDragAll(1,num,1,1,1,1)
    elseif(val==2 )then
      Block.SetDragAll(1,1,num,1,1,1)
    elseif(val==3 )then
      Block.SetDragAll(1,1,1,num,1,1)
    elseif(val==4 )then
      Block.SetDragAll(1,1,1,1,num,1)
    else
      Block.SetDragAll(1,1,1,1,1,num)
    end
  end
end


function onPlayerJoined(player)
  Drag[player.playerId] = 0
  tm.os.Log("player joined")
  tm.playerUI.AddUIButton(player.playerId, "ui"..player.playerId, "By: Ziggy")
  tm.playerUI.AddUIButton(player.playerId, "DragDir"..player.playerId, "Drag | front", toggleDrag, player.playerId)
  tm.playerUI.AddUIText(player.playerId, "DragVal"..player.playerId, "",setDrag)

end

tm.players.OnPlayerJoined.add(onPlayerJoined)
