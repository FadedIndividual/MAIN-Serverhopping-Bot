--[[

Hits made your mom cum with one pinky. 🤡

--]]

repeat task.wait() until game:IsLoaded() -- Sucking Krones Inciteful Dingaling (S.K.I.D)

Players = game:GetService("Players")
LocalPlayer = Players.LocalPlayer
Mouse = LocalPlayer:GetMouse()
UserInputService = game:GetService("UserInputService")
RunService = game:GetService("RunService")

--[[Totalitarianism Causes Downsyndrome in Diabetic Children]]--
Prefix = ";"
CMDS = {}

AddCommand = function(String, Aliases, Define, Funkpops)
    table.insert(Aliases, String)
    CMDS[#CMDS + 1] = {["Aliases"] = Aliases, ["Define"] = Define, ["Function"] = Funkpops}
end

ExecuteCommand = function(String)
    local Arguments = string.split(string.lower(String), " ")
    
    if Arguments[1]:sub(1, #Prefix) == Prefix then
        for _,z in next, CMDS do
            if table.find(z["Aliases"], string.sub(Arguments[1], #Prefix + 1)) then
                table.remove(Arguments, 1)
                return z["Function"](Arguments)
            end
        end
    end
end
LocalPlayer.Chatted:Connect(ExecuteCommand)
--[[
Mouse.KeyDown:Connect(function(key)
	if key == Prefix then
		CommandBar:CaptureFocus()
	end
end)
CommandBar.FocusLost:Connect(ExecuteCommand)]]

GetPlayer = function(String)
    if String ~= "" and String ~= " " then
        PlayersFound = nil
        for _,Player in next, Players:GetPlayers() do
            if string.sub(string.lower(Player.DisplayName),1,#String) == string.lower(String) or string.sub(string.lower(Player.Name),1,#String) == string.lower(String) then
    			PlayersFound = Player
            end
        end
        if PlayersFound then
            return PlayersFound
        else
            return nil
        end
    end
end

Addkeybind = function(key, toggle)
	local Bool, Toes = {false}, nil
	if toggle then
		Toes = UserInputService.InputBegan:Connect(function(Key, focused) if focused then return end
			if Key.KeyCode == key then
				Bool[1] = not Bool[1]
			end
		end)
	else
		Toes = RunService.Stepped:Connect(function()
			if UserInputService:IsKeyDown(key) and not UserInputService:GetFocusedTextBox() then
				Bool[1] = true
			else
				Bool[1] = false
			end
		end)
	end
	return Bool, Toes
end

GetDistBetweenTwoCFrames = function(Part1, Part2) return (Vector3.new(Part1.X, Part1.Y, Part1.Z) - Vector3.new(Part2.X, Part2.Y, Part2.Z)).Magnitude end

local RemoveVelocity = function(Character)
    task.spawn(function()
        for _,Part in next, Character:GetChildren() do
            if Part:IsA("BasePart") then
                Part.Velocity = Vector3.zero
                Part.RotVelocity = Vector3.zero
            end
        end
    end)
end

Sfling = function(_1Plr)
    pcall(function()
        local Character = LocalPlayer.Character
        local Humanoid = Character:FindFirstChildOfClass("Humanoid")
        local RootPart = Humanoid.RootPart
        
        local TCharacter = _1Plr.Character
        local THumanoid
        local TRootPart
        local THead
        local Accessory
        local Handle
        
        if TCharacter:FindFirstChildOfClass("Humanoid") then
            THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
        end
        if THumanoid and THumanoid.RootPart then
            TRootPart = THumanoid.RootPart
        end
        if TCharacter:FindFirstChild("Head") then
            THead = TCharacter.Head
        end
        if TCharacter:FindFirstChildOfClass("Accessory") then
            Accessory = TCharacter:FindFirstChildOfClass("Accessory")
        end
        if Accessoy and Accessory:FindFirstChild("Handle") then
            Handle = Accessory.Handle
        end
        
        if Character and Humanoid and RootPart then
            if not TCharacter:FindFirstChildWhichIsA("BasePart") then
                return
            end
            local function FPos(BasePart,Pos,Ang)
                RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
                RootPart.Velocity = Vector3.new(1e6,1e6,1e6)
                RootPart.RotVelocity = Vector3.new(1e6,1e6,1e6)
            end
            local function SFBasePart(BasePart)
                local TimeToWait = 1.35
                local Time = tick()
                local Angle = 0
                
                repeat
                    pcall(function() LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RootPart.Anchored = false end)
                    if RootPart and THumanoid then
                        if BasePart.Velocity.Magnitude < 250 then
                            Angle = math.random(0, 360)
                            FPos(BasePart,CFrame.new(0,-1.5,0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / (math.random(1,2) == 1 and math.random(5,8) or math.random(1,4)),CFrame.Angles(math.rad(90),math.rad(Angle),0))
                            task.wait()
                        else
                            break
                        end
                    else
                        break
                    end
                until GetDistBetweenTwoCFrames(CFrame.new(5450, 34, -17000), _1Plr.Character:FindFirstChildOfClass("Humanoid").RootPart.CFrame) > 200 or BasePart.Velocity.Magnitude > 250 or BasePart.Parent ~= _1Plr.Character or _1Plr.Parent ~= Players or not _1Plr.Character == TCharacter or THumanoid.Sit or Humanoid.Health <= 0 or (tick() - Time >= TimeToWait)
            end
            workspace.FallenPartsDestroyHeight = 0/0
            local BV = Instance.new("BodyVelocity")
            BV.Parent = RootPart
            BV.Velocity = Vector3.new(9e9,9e9,9e9)
            BV.MaxForce = Vector3.new(1/0, 1/0, 1/0)
            if TRootPart and THead then
                if (TRootPart.CFrame.p - THead.CFrame.p).Magnitude > 5 then
                    SFBasePart(THead)
                else
                    SFBasePart(TRootPart)
                end
            elseif TRootPart and not THead then
                SFBasePart(TRootPart)
            elseif not TRootPart and THead then
                SFBasePart(THead)
            elseif not TRootPart and not THead and Accessory and Handle then
                SFBasePart(Handle)
            end
            pcall(function() LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RootPart.Anchored = true end)
            BV:Destroy()
            Humanoid:ChangeState("GettingUp")
        end
    end)
end

AddCommand("fling", {}, "Flings Player", function(args)
	local Player = GetPlayer(args[1])
	local Local_HRP = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RootPart
	local Fling_OCF = Local_HRP.CFrame
	if Player and Local_HRP then
		Sfling(Player)
		
		task.spawn(function()
			task.wait(.5)
			LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Anchored = false
		end)
		
		local BodyGyro = Instance.new("BodyGyro", Local_HRP)
        BodyGyro.CFrame = Fling_OCF
        BodyGyro.D = 8e8
        BodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
        BodyGyro.P = 9e9
        local BodyPosition = Instance.new("BodyPosition", Local_HRP)
        BodyPosition.Position = Fling_OCF.p
        BodyPosition.D = 8e8
        BodyPosition.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        BodyPosition.P = 9e9
        
        local Check_Time = tick()
        repeat task.wait() Local_HRP.CFrame = Fling_OCF; RemoveVelocity(Local_HRP.Parent) until LocalPlayer.Character:FindFirstChildOfClass("Humanoid").MoveDirection.Magnitude > 0 or (tick() - Check_Time) >= 2.2
        
        BodyGyro:Destroy()
        BodyPosition:Destroy()
	end
end)

AddCommand("rj", {"rejoin"}, "Rejoins Game", function(args)
	game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId)
end)

local Noclip = Addkeybind(Enum.KeyCode.N, true)
AddCommand("noclip", {"collide"}, "Toggles On/Off Noclip", function(args)
	Noclip[1] = not Noclip[1]
end)

local Suspected_Flingers, AntiFling_Toggle = {}, true
AddCommand("antifling", {"nofling"}, "Toggles On/Off Anti-Fling", function(args)
	AntiFling_Toggle = not AntiFling_Toggle
end)

_G.Buzz = AntiFling_Toggle

RunService.Stepped:Connect(function()
	_G.Buzz = AntiFling_Toggle
end)

task.spawn(function()
	while task.wait(2) do
		print(_G.Buzz)
	end
end)

RunService.Stepped:Connect(function()
	if AntiFling_Toggle then
		for _, Player in next, Players:GetPlayers() do
			if Player ~= LocalPlayer then
				if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
					local HRP = Player.Character:FindFirstChild("HumanoidRootPart")
					if HRP.Velocity.Magnitude >= 250 then
						Suspected_Flingers[#Suspected_Flingers + 1] = {["Name"] = Player.Name, ["Time"] = tick(), ["Attached"] = nil}
					end
					for _, Suspect in next, Suspected_Flingers do
						if Suspect.Name == Player.Name then
							if Suspect.Attached == nil then
								Suspect.Attached = RunService.RenderStepped:Connect(function()
									if (tick() - Suspect.Time) >= 300 or not Players:FindFirstChild(Suspect.Name) then
										Suspect.Attached:Disconnect()
									end
									pcall(function()
										for _, Partss in next, Players:FindFirstChild(Suspect.Name).Character:GetDescendants() do
											if Partss:IsA("BasePart") then
												Partss.Velocity = Vector3.zero
												Partss.RotVelocity = Vector3.zero
												Partss.CanCollide = false
											end
										end
									end)
								end)
							end
						end
					end
				end
			end
		end
	end
end)

New_Character = function() repeat task.wait() until LocalPlayer.Character and LocalPlayer.Character:WaitForChild("HumanoidRootPart")
	local Parts = {}
	for _, Instance in next, LocalPlayer.Character:GetDescendants() do
		if Instance:IsA("BasePart") and Instance.CanCollide == true then
			table.insert(Parts, Instance)
		end
	end
	for _, illi in next, Parts do
		local Connect = RunService.RenderStepped:Connect(function()
			illi.CanCollide = not Noclip[1]
		end)
	end
end; task.spawn(New_Character) LocalPlayer.CharacterAdded:Connect(New_Character)
