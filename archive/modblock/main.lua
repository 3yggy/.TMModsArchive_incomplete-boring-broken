function onPlayerLeft(player)
  playerList = tm.players.CurrentPlayers()
end

function onPlayerJoined(player)
  playerList = tm.players.CurrentPlayers()
  --

  local Id = player.playerId

  tm.playerUI.AddUIButton(Id, "ui"..Id, "By: Ziggy")
  --
  tm.playerUI.AddUIButton(Id, "PickVals", "Copy Values",CopyVals, Id)
  --
  tm.playerUI.AddUIButton(Id, "tall"..Id, "Toggle Apply To All | off", toggleAllBlock,Id)


  tm.playerUI.AddUIText(Id, "_buoyancy"..Id, "Bouyancy: ",_setBuoyancy)


tm.playerUI.AddUIText(Id, "_mass"..Id, "Mass: ",_setMass)

--tm.playerUI.AddUIText(Id, "_dragall"..Id, "DragAll: ",_setDragAll)

tm.playerUI.AddUIText(Id, "_enginepower"..Id, "EnginePower: ",_setEnginePower)

tm.playerUI.AddUIText(Id, "_jetpower"..Id, "JetPower: ",_setJetPower)

tm.playerUI.AddUIText(Id, "_health"..Id, "Health: ",_setHealth)
--
tm.playerUI.AddUIButton(Id, "SetColorTitle"..Id, "SetColor[R,G,B]",SetColor, player.playerId)
tm.playerUI.AddUIText(Id, "SetColor"..Id, "SetColor",SetColor_)
--
tm.playerUI.AddUIButton(Id, "SetSecondaryColorTitle"..Id, "SetSecondaryColor[R,G,B]",SetSecondaryColor, player.playerId)
tm.playerUI.AddUIText(Id, "SetSecondaryColor"..Id, "SetSecondaryColor",SetSecondaryColor_)

--
  tm.os.Log("new player"..tm.players.GetPlayerName(Id))
end


AllBlocks = {}
function toggleAllBlock(cb)
  AllBlocks[cb.playerId] = not AllBlocks[cb.playerId]
  if(AllBlocks[cb.playerId]) then
    tm.playerUI.SetUIValue(cb.playerId, "tall"..cb.playerId, "Toggle Apply To All | On")
  else
    tm.playerUI.SetUIValue(cb.playerId, "tall"..cb.playerId, "Toggle Apply To All | Off")
  end
end

function CopyVals(cb)
  local Id = tonumber(cb.playerId)
  local Block = tm.players.GetPlayerSelectBlockInBuild(Id)
  if(Block ~= nil) then
    tm.playerUI.SetUIValue(Id,"_buoyancy"..Id,"Bouyancy: "..Block.GetBuoyancy())
    tm.playerUI.SetUIValue(Id,"_mass"..Id,"Mass: "..Block.GetMass())
  --  tm.playerUI.SetUIValue(Id,"_dragall"..Id,"DragAll: "..Block.GetDragAll())
    tm.playerUI.SetUIValue(Id,"_enginepower"..Id,"EnginePower: "..Block.GetEnginePower())
    tm.playerUI.SetUIValue(Id,"_jetpower"..Id,"JetPower: "..Block.GetJetPower())
    tm.playerUI.SetUIValue(Id,"_health"..Id,"Health: "..Block.GetStartHealth())

    local colourLst = {tostring(math.random(255)),tostring(math.random(255)),tostring(math.random(255))}
    colourString = colourLst[1]..","..colourLst[2]..","..colourLst[3]
    tm.playerUI.SetUIValue(Id,"SetColor"..Id,colourString)
    _Color = colourLst
    tm.playerUI.SetUIValue(Id,"SetSecondaryColor"..Id,colourString)
    _sColor = colourLst
  end
end

--set functions:

function _setBuoyancy(cb)
  local Id = cb.playerId
  local cont = cb.value
  local num = tonumber(cont)
  if(num == nil) then
    num = tonumber(string.sub(cont,10))
  end
    tm.os.Log("vv "..cont..tostring(num))
  if(cont=="" or num == nil)then
    tm.playerUI.SetUIValue(Id, "_buoyancy"..Id, "Bouyancy: ")
  else
    if(AllBlocks[Id])then
        tm.os.Log("block set to bouyancy of "..tostring(num))
      for i,v in ipairs(tm.players.GetPlayerStructuresInBuild(Id))do
        for ii,iv in ipairs(v.GetBlocks())do
          iv.SetBuoyancy(num)
        end
      end
    else
      local Block = tm.players.GetPlayerSelectBlockInBuild(Id)
      if(Block ~= nil) then
        Block.SetBuoyancy(num)
      end
    end
  end
end

--
function _setMass(cb)
  local Id = cb.playerId
  local cont = cb.value
  local num = tonumber(cont)
  if(num == nil) then
    num = tonumber(string.sub(cont,6))
  end
    tm.os.Log("vv "..cont..tostring(num))
  if(cont=="" or num == nil)then
    tm.playerUI.SetUIValue(Id, "_mass"..Id, "Mass: ")
  else
    if(AllBlocks[Id])then
        tm.os.Log("block set to mass of "..tostring(num))
      for i,v in ipairs(tm.players.GetPlayerStructuresInBuild(Id))do
        for ii,iv in ipairs(v.GetBlocks())do
          iv.SetMass(num)
        end
      end
    else
      local Block = tm.players.GetPlayerSelectBlockInBuild(Id)
      if(Block ~= nil) then
        Block.SetMass(num)
      end
    end
  end
end
--

function _setDragAll(cb)
  local Id = cb.playerId
  local cont = cb.value
  local num = tonumber(cont)
  if(num == nil) then
    num = tonumber(string.sub(cont,9))
  end
    tm.os.Log("vv "..cont..tostring(num))
  if(cont=="" or num == nil)then
    tm.playerUI.SetUIValue(Id, "_dragall"..Id, "DragAll: ")
  else
    if(AllBlocks[Id])then
        tm.os.Log("block set to dragall of "..tostring(num))
      for i,v in ipairs(tm.players.GetPlayerStructuresInBuild(Id))do
        for ii,iv in ipairs(v.GetBlocks())do
          iv.SetDragAll(num)
        end
      end
    else
      local Block = tm.players.GetPlayerSelectBlockInBuild(Id)
      if(Block ~= nil) then
        Block.SetDragAll(num)
      end
    end
  end
end
--
function _setEnginePower(cb)
  local Id = cb.playerId
  local cont = cb.value
  local num = tonumber(cont)
  if(num == nil) then
    num = tonumber(string.sub(cont,13))
  end
    tm.os.Log("vv "..cont..tostring(num))
  if(cont=="" or num == nil)then
    tm.playerUI.SetUIValue(Id, "_enginepower"..Id, "EnginePower: ")
  else
    if(AllBlocks[Id])then
        tm.os.Log("block set to EnginePower of "..tostring(num))
      for i,v in ipairs(tm.players.GetPlayerStructuresInBuild(Id))do
        for ii,iv in ipairs(v.GetBlocks())do
          iv.SetEnginePower(num)
        end
      end
    else
      local Block = tm.players.GetPlayerSelectBlockInBuild(Id)
      if(Block ~= nil) then
        Block.SetEnginePower(num)
      end
    end
  end
end
--
function _setJetPower(cb)
  local Id = cb.playerId
  local cont = cb.value
  local num = tonumber(cont)
  if(num == nil) then
    num = tonumber(string.sub(cont,10))
  end
    tm.os.Log("vv "..cont..tostring(num))
  if(cont=="" or num == nil)then
    tm.playerUI.SetUIValue(Id, "_jetpower"..Id, "JetPower: ")
  else
    if(AllBlocks[Id])then
        tm.os.Log("block set to JetPower of "..tostring(num))
      for i,v in ipairs(tm.players.GetPlayerStructuresInBuild(Id))do
        for ii,iv in ipairs(v.GetBlocks())do
          iv.SetJetPower(num)
        end
      end
    else
      local Block = tm.players.GetPlayerSelectBlockInBuild(Id)
      if(Block ~= nil) then
        Block.SetJetPower(num)
      end
    end
  end
end
--
function _setHealth(cb)
  local Id = cb.playerId
  local cont = cb.value
  local num = tonumber(cont)
  if(num == nil) then
    num = tonumber(string.sub(cont,8))
  end
    tm.os.Log("vv "..cont..tostring(num))
  if(cont=="" or num == nil)then
    tm.playerUI.SetUIValue(Id, "_health"..Id, "Health: ")
  else
    if(AllBlocks[Id])then
        tm.os.Log("block set to Health of "..tostring(num))
      for i,v in ipairs(tm.players.GetPlayerStructuresInBuild(Id))do
        for ii,iv in ipairs(v.GetBlocks())do
          iv.SetHealth(num)
        end
      end
    else
      local Block = tm.players.GetPlayerSelectBlockInBuild(Id)
      if(Block ~= nil) then
        Block.SetHealth(num)
      end
    end
  end
end
--
--
function SetColor_(cb)
  local result = {};
  local t={}
         for str in string.gmatch(tostring(cb.value), "([^"..",".."]+)") do
           local n = tonumber(str)

           if(str=="!r")then
              n=-3.147
           elseif(n==nil)then
             n=0
           end
           table.insert(t, n)
         end
  _Color = t
end
function SetColor(cb)
  local Id = tonumber(cb.playerId)
  if(_Color ~= nil) then
      local r=_Color[1]
      local g=_Color[2]
      local b=_Color[3]
      local a=_Color[4]

      if(r == -3.147) then
        r = math.random(255)
      end
      if(g == -3.147) then
        g = math.random(255)
      end
      if(b == -3.147) then
        b = math.random(255)
      end

      if(a == nil) then
        a = 1
      else
        a = a/10
      end
      if(AllBlocks[Id])then
        for i,v in ipairs(tm.players.GetPlayerStructuresInBuild(Id))do
          for ii,iv in ipairs(v.GetBlocks())do
            iv.SetColor(r/255,b/255,g/255,a)
            iv.SetSecondaryColor(r/255,b/255,g/255,a)
          end
        end
      else
        local Block = tm.players.GetPlayerSelectBlockInBuild(Id)
        if(Block ~= nil) then
          Block.SetColor(r/255,b/255,g/255,a)
          Block.SetSecondaryColor(r/255,b/255,g/255,a)

        end
      end
     --
      tm.os.Log("set Color to "..r..","..b..","..g)
    else
        tm.os.Log("block missing")
    end
end
--

--
function SetSecondaryColor_(cb)
  local result = {};
  local t={}
         for str in string.gmatch(tostring(cb.value), "([^"..",".."]+)") do
           local n = tonumber(str)
           if(str=="!r")then
              n= -3.147
           elseif(n==nil)then
             n=0
           end
           table.insert(t, n)
         end
  _sColor = t
end
function SetSecondaryColor(cb)
  local Id = tonumber(cb.playerId)
  if(_sColor ~= nil) then
      local r=_sColor[1]
      local g=_sColor[2]
      local b=_sColor[3]
      local a=_sColor[4]

      if(r == -3.147) then
        r = math.random(255)
      end

      if(g == -3.147) then
        g = math.random(255)
      end

      if(b == -3.147) then
        b = math.random(255)
      end
      if(a == nil) then
        a = 1
      else
        a = a/10
      end
      if(AllBlocks[Id])then
        for i,v in ipairs(tm.players.GetPlayerStructuresInBuild(Id))do
          for ii,iv in ipairs(v.GetBlocks())do
            iv.SetSecondaryColor(r/255,b/255,g/255,a)
          end
        end
      else
        local Block = tm.players.GetPlayerSelectBlockInBuild(Id)
        if(Block ~= nil) then
          Block.SetSecondaryColor(r/255,b/255,g/255,a)
        end
      end      tm.os.Log("set Secondary Color to "..r..","..b..","..g)
  else
  tm.playerUI.SetUIValue(Id,"SecondaryColor"..Id,"SecondaryColor[R,G,B]")
  tm.os.Log("colour wrong format")
  end
end
--
tm.players.OnPlayerLeft.add(onPlayerLeft)
tm.players.OnPlayerJoined.add(onPlayerJoined)
