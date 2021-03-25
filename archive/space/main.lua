



function Update()

end

function ShowUi()
  tm.playerUI.AddUIButton(0, "80085", "Do", SpawnBodies)


end

function SpawnBodies(cb)
tm.physics.SpawnCustomObject(tm.vector3.Create(0,tm.players.GetPlayerPosition(cb.playerId).y+370,0), "sol", "_sol", true, 9999997)
tm.physics.SpawnCustomObject(tm.vector3.Create(200,tm.players.GetPlayerPosition(cb.playerId).y+370,0), "mer", "_sol", true, 9999997)
tm.physics.SpawnCustomObject(tm.vector3.Create(400,tm.players.GetPlayerPosition(cb.playerId).y+370,0), "ven", "_sol", true, 9999997)
tm.physics.SpawnCustomObject(tm.vector3.Create(600,tm.players.GetPlayerPosition(cb.playerId).y+370,0), "ear", "_sol", true, 9999997)
tm.physics.SpawnCustomObject(tm.vector3.Create(600,tm.players.GetPlayerPosition(cb.playerId).y+400,0), "lun", "_sol", true, 9999997)
tm.physics.SpawnCustomObject(tm.vector3.Create(800,tm.players.GetPlayerPosition(cb.playerId).y+370,0), "mar", "_sol", true, 9999997)
tm.physics.SpawnCustomObject(tm.vector3.Create(1000,tm.players.GetPlayerPosition(cb.playerId).y+370,0), "jup", "_sol", true, 9999997)
tm.physics.SpawnCustomObject(tm.vector3.Create(1400,tm.players.GetPlayerPosition(cb.playerId).y+370,0), "sat", "_sol", true, 9999997)
tm.physics.SpawnCustomObject(tm.vector3.Create(1600,tm.players.GetPlayerPosition(cb.playerId).y+370,0), "urn", "_sol", true, 9999997)
tm.physics.SpawnCustomObject(tm.vector3.Create(1800,tm.players.GetPlayerPosition(cb.playerId).y+370,0), "nep", "_sol", true, 9999997)



tm.os.Log(tm.players.GetPlayerPosition(cb.playerId).x.." "..tm.players.GetPlayerPosition(cb.playerId).y.." "..tm.players.GetPlayerPosition(cb.playerId).z)
end

ShowUi()
tm.physics.AddMesh("sol.obj", "sol")
tm.physics.AddTexture("sol.png","_sol")
tm.physics.AddMesh("lun.obj", "lun")


tm.physics.AddMesh("mer.obj", "mer")
--tm.physics.AddTexture("mer.png","_mer")

tm.physics.AddMesh("ven.obj", "ven")
--tm.physics.AddTexture("venu.png","_ven")

tm.physics.AddMesh("ear.obj", "ear")
--tm.physics.AddTexture("ear.png","_ear")

tm.physics.AddMesh("mar.obj", "mar")
--tm.physics.AddTexture("mar.png","_mar")

tm.physics.AddMesh("jup.obj", "jup")
--tm.physics.AddTexture("anus.png","penis")

tm.physics.AddMesh("sat.obj", "sat")
--tm.physics.AddTexture("anus.png","penis")

tm.physics.AddMesh("urn.obj", "urn")
--tm.physics.AddTexture("anus.png","penis")

tm.physics.AddMesh("nep.obj", "nep")
--tm.physics.AddTexture("anus.png","penis")
