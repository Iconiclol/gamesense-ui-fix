-- Assuming this code is inside a LocalScript in StarterPlayerScripts or StarterGui
local success, GameSenseUI = pcall(function()
    return require(game.ServerScriptService:WaitForChild("GameSenseUI"))
end)

if not success then
    warn("Failed to load GameSenseUI module: " .. tostring(GameSenseUI))
    return
end

-- GameSenseUI Module
local GameSenseUI = {}

function GameSenseUI:CreateWindow(title)
    local screenGui = Instance.new("ScreenGui")
    local mainFrame = Instance.new("Frame")
    local titleLabel = Instance.new("TextLabel")

    -- ScreenGui properties
    screenGui.Name = "GameSenseUI"
    screenGui.ResetOnSpawn = false

    -- MainFrame properties
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, 300, 0, 400)
    mainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
    mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    mainFrame.BorderSizePixel = 0

    -- TitleLabel properties
    titleLabel.Name = "TitleLabel"
    titleLabel.Size = UDim2.new(1, 0, 0, 50)
    titleLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    titleLabel.BorderSizePixel = 0
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.Font = Enum.Font.SourceSans
    titleLabel.TextSize = 24

    -- Parent-Child hierarchy
    titleLabel.Parent = mainFrame
    mainFrame.Parent = screenGui
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- Function to create a checkbox
    function GameSenseUI:CreateCheckbox(text, callback)
        local checkbox = Instance.new("TextButton")
        checkbox.Name = "Checkbox"
        checkbox.Size = UDim2.new(1, -20, 0, 30)
        checkbox.Position = UDim2.new(0, 10, 0, 60 + #mainFrame:GetChildren() * 40)
        checkbox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        checkbox.BorderSizePixel = 0
        checkbox.Text = text
        checkbox.TextColor3 = Color3.fromRGB(255, 255, 255)
        checkbox.Font = Enum.Font.SourceSans
        checkbox.TextSize = 18

        checkbox.MouseButton1Click:Connect(function()
            callback(not checkbox.Selected)
            checkbox.Selected = not checkbox.Selected
            checkbox.BackgroundColor3 = checkbox.Selected and Color3.fromRGB(70, 70, 70) or Color3.fromRGB(40, 40, 40)
        end)

        checkbox.Parent = mainFrame
    end

    return GameSenseUI
end

return GameSenseUI
