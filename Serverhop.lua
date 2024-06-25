local Seconds_Last = (math.random(1, 7) >= 4) and 400 or 425

spawn(function()
	for i = 1, Seconds_Last do
		if #game.Players:GetPlayers() <= 5 then
			break
		end
		wait((math.random(1, 2)==1 and .75 or 1.25))
	end
	setfpscap(27)
	local httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
	local servers = {}
	local req = httprequest({Url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true", game.PlaceId)})
	local body = game.HttpService:JSONDecode(req.Body)

	if body and body.data then
		for i, v in next, body.data do
			if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.playing > 8 and v.id ~= JobId then
				table.insert(servers, 1, v.id)
			end
		end
	end

	game.Players.LocalPlayer:Kick("\n\n\n\n\n\n\n\nServerhopping...\n\n\n\n\n\n\n")

	if #servers > 3 then
		while wait(1) do
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, servers[(math.random(1, 2) == 1) and 1 or (math.random(0, #servers/2) + math.random(0, #servers/2))], game.Players.LocalPlayer)
		wait(9) end
	else
		while wait(1) do
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, servers[(math.random(1, 3) == 1) and 1 or (math.random(1, #servers))], game.Players.LocalPlayer)
		wait(9) end
	end
end)

return Seconds_Last
