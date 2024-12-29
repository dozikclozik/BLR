local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local RS = game:GetService("ReplicatedStorage")
local teams = RS:FindFirstChild("Teams")

local camera = workspace.CurrentCamera

local PenaltyArea = workspace:FindFirstChild("Goals")

local BallRemotes = RS:FindFirstChild("Packages"):FindFirstChild("Knit"):FindFirstChild("Services"):FindFirstChild("BallService"):FindFirstChild("RE")

local uis = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local YourTeam = ""

		local function GetMagnitude(pos1: Vector3, pos2: Vector3)
			return (pos1 - pos2).Magnitude
		end

		local function FindYourTeam(folder: Folder)
			for _, item in ipairs(folder:GetChildren()) do
				if item:IsA("ObjectValue") and item.Value == player then
					return folder.Name
				end
			end
			return nil
		end

		
		if FindYourTeam(teams.HomeTeam) then
			YourTeam = "Home"
		elseif FindYourTeam(teams.AwayTeam) then
			YourTeam = "Away"
		else
			return
		end

local function ShootInGates()
		if YourTeam ~= "" then
			if YourTeam == "Home" then
				camera.CFrame = CFrame.lookAt(camera.CFrame.Position + Vector3.new(0,10,0), PenaltyArea.Home.Position)
				task.wait()
				camera.CFrame = CFrame.lookAt(camera.CFrame.Position + Vector3.new(0,10,0), PenaltyArea.Home.Position)
				task.wait()
				camera.CFrame = CFrame.lookAt(camera.CFrame.Position + Vector3.new(0,10,0), PenaltyArea.Home.Position)
				task.wait(0.1)
				BallRemotes:FindFirstChild("Shoot"):FireServer(GetMagnitude(PenaltyArea.Away.Position, character.HumanoidRootPart.Position) / 1.5)

			elseif YourTeam == "Away" then
				camera.CFrame = CFrame.lookAt(camera.CFrame.Position + Vector3.new(0,10,0), PenaltyArea.Away.Position)
				task.wait()
				camera.CFrame = CFrame.lookAt(camera.CFrame.Position + Vector3.new(0,10,0) , PenaltyArea.Away.Position)
				task.wait()
				camera.CFrame = CFrame.lookAt(camera.CFrame.Position + Vector3.new(0,10,0), PenaltyArea.Away.Position)
				task.wait(0.1)
				BallRemotes:FindFirstChild("Shoot"):FireServer(GetMagnitude(PenaltyArea.Home.Position, character.HumanoidRootPart.Position) / 1.5)
end
end
end

local function GetBallInCharacters()
	for _, player in pairs(game:GetService("Players"):GetPlayers()) do
		local character = player.Character or player.CharacterAdded:Wait()
		if character then
			
			end
		end
	end
end

RunService.RenderStepped:Connect(function()
	if GetBallInCharacters() then
		print(GetBallInCharacters().Name)
	end
end)
