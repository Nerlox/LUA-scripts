local part = workspace.part
local TweenService = game:GetService("TweenService")

local info = TweenInfo.new(4,Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1, false)
local newOrientation = part.Orientation + Vector3.new(0, 360, 0)
	
local tween = TweenService:Create(part, info, {Orientation = newOrientation})
tween:Play()
	
part.Touched:Connect(function(hit)
	if hit.Parent:FindFirstChild("Humanoid") then
		hit.Parent.Humanoid.Health = 0
	end
end)