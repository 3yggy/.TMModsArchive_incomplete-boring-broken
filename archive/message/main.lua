
function updateUi()
  for k,p in pairs(playerList) do
    tm.os.Log("p")
    local pId = p.playerId
    --tm.playerUI.ClearUI(pId)
    for kk,pp in pairs(playerList) do
      if(pp~=p)then
        tm.os.Log("pp")
        local ppId = pp.playerId
        tm.playerUI.AddUIButton(pId,"send"..pId..ppId,"[Click]Send:"..tm.players.GetPlayerName(pp.playerId).. ":",send,ppId)
        tm.playerUI.AddUIText(pId,"sent"..pId..ppId,"",setPlayerMessage,ppId)
        tm.playerUI.AddUIButton(pId,"Recieved"..pId..ppId,"From "..tm.players.GetPlayerName(pp.playerId).. ":")
        tm.playerUI.AddUIText(pId,"recieved"..pId..ppId,"No Messages Yet ;(",messageLovededWith,ppId) --cb.playerId = man ; cb.data = to whom the man's ui is adressed
      end
    end
  end
end

function send(cb)
  SentPlayerMessages[cb.playerId][cb.data] = PlayerMessages[cb.playerId][cb.data]
  tm.playerUI.SetUIValue(cb.data,"recieved"..cb.data..cb.playerId,SentPlayerMessages[cb.data][cb.playerId])
end

function setPlayerMessage(cb)
  PlayerMessages[cb.playerId][cb.data] = cb.value
end

function messageLovedWith(cb)
  text =SentPlayerMessages[cb.data][cb.playerId]
  if(text == nil) then
    text = "No Messages Yet ;("
  end
  tm.playerUI.SetUIValue(cb.playerId,"recieved"..cb.playerId..cb.data,SentPlayerMessages[cb.data][cb.playerId])
end
PlayerMessages={}
SentPlayerMessages={}
function onPlayerJoined(player)
  tm.playerUI.AddUIButton(player.playerId,"ziggy"..player.playerId,"Made by: Ziggy")
  tm.os.Log("player joined")
  PlayerMessages[player.playerId]={}
  SentPlayerMessages[player.playerId]={}
  playerList = tm.players.CurrentPlayers()
  updateUi()
end
function OnPlayerLeft(player)
  PlayerMessages[player.playerId]=nil
  SentPlayerMessages[player.playerId]=nil
  table.remove(playerList,player)
  updateUi()
  tm.os.Log("player left")
end

tm.players.OnPlayerJoined.add(onPlayerJoined)
tm.players.OnPlayerLeft.add(OnPlayerLeft)
