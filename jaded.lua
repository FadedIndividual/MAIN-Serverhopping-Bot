local Players = game.Players
local lp = Players.LocalPlayer

function chatMessage(str)
    str = tostring(str)
    if game.TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        game.TextChatService.TextChannels.RBXGeneral:SendAsync(str)
    else
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(str, "All")
    end
end

local Seconds = loadstring(game:HttpGet('https://raw.githubusercontent.com/FadedIndividual/My-Own-Scripts/main/Serverhop.lua'))()
local tablef = loadstring(game:HttpGet('https://raw.githubusercontent.com/FadedIndividual/My-Own-Scripts/main/STRINGS.lua'))()

local queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)

lp.OnTeleport:Connect(function()
	queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/FadedIndividual/My-Own-Scripts/main/jaded.lua'))()")
end)

local amount = 2
local Time = 6
local Tick = tick()
local tik = tick()
local tiktok = tick()
spawn(function()
	while task.wait() do
		if tick()-tik >= Time then tik = tick()
			local rnp = tablef[math.random(1, #tablef)]
			for _, z in pairs(rnp) do
				chatMessage(z)
			end
		end
	end
end)

spawn(function()
	while task.wait() do
		pcall(function()
			for _,z in next, lp.Character:GetChildren() do
				if z:IsA'BasePart' then
					z.Velocity = Vector3.zero
					z.RotVelocity = Vector3.zero
					z.Massless = true
					z.CanCollide = false
				end
			end
		end)
		if tick() - tiktok >= 2 then
			tiktok = tick()
			pcall(function()
				lp.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
			end)
		end
	end
end)

Funk = function(pqs, Original)
	if pqs and pqs.Character and pqs.Character.Humanoid and pqs.Character.Humanoid.Health >= 1.5 then
		local num = 0
		local timeee = tick()
		repeat task.wait()
			pcall(function()
				num = num + 10
				local Ours, Theirs = lp.Character:FindFirstChild("HumanoidRootPart"), pqs.Character:FindFirstChild("Torso") or pqs.Character:FindFirstChild("Upper Torso")
				
				if Ours and Theirs then
					Ours.CFrame = Theirs.CFrame * CFrame.Angles(0, math.rad(num), 0) * CFrame.new(0, 0, 2)
				end
			end)
		until not pqs.Character or pqs.Character:FindFirstChild("Humanoid").Health <= 1.5 or not pqs.Character:FindFirstChild("HumanoidRootPart") or (pqs.Character:FindFirstChild("HumanoidRootPart").Position - Original).Magnitude >= 7 or tick() - timeee >= 15
	else
		return
	end
end

spawn(function()
	while task.wait() do
		for _, z in pairs(Players:GetPlayers()) do
			if z~=lp and not table.find({186860567}, z.UserId) then
				if z.Character and z.Character:FindFirstChild("HumanoidRootPart") then
					local Pos_Saved = z.Character:FindFirstChild("HumanoidRootPart").Position
					Funk(z, Pos_Saved)
				end
			end
		end
	end
end)
