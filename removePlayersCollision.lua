local Players = game:GetService("Players")
local PhysicsService = game:GetService("PhysicsService")
local GroupName = "Players"

PhysicsService:CreateCollisionGroup(GroupName)
PhysicsService:CollisionGroupSetCollidable(GroupName, GroupName, false)

Players.PlayerAdded:Connect(function(Player)
	Player.CharacterAdded:Connect(function(Character)
		local function ChangeGroup(Part)
			if Part:IsA("BasePart") then
				PhysicsService:SetPartCollisionGroup(Part, GroupName) 
			end
		end

		Character.ChildAdded:Connect(function(Object)  
			ChangeGroup(Object)
		end)

		for _, part in ipairs(Character:GetDescendants()) do
			ChangeGroup(part)
		end
	end)
end)