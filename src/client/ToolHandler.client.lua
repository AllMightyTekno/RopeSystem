local Players = game:GetService("Players")
local player = game.Players.LocalPlayer
local Tool = script.Parent --Rope Tool
local playerMouse = player:GetMouse()
local Target = playerMouse.Target

local Highlight = Instance.new("Highlight")

---When the RopeTool is put on by the client
local function OnRopeToolActivated()

    --->Move event to update the Target Property
playerMouse.Move:Connect(function()
    Target = playerMouse.Target
end)

    while true do
        task.wait()  
        if Target and Target.Parent:FindFirstChild("Humanoid") then
            local CharacterModel = Target.Parent --Every character with a Humanoid is set to the CharacterModel Variable
            Highlight.Parent = CharacterModel
            warn("FOUND A CHARACTER")
        else
            Highlight.Parent = nil
            print("DID NOT FIND A CHARACTER")
            end   
    end


end

local playerRopeTool = player.Backpack:FindFirstChild("RopeTool")
if playerRopeTool then
    OnRopeToolActivated()
    else
        return 10
end

sd