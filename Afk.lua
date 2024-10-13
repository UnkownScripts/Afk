-- AFK Script with Advanced GUI Design, Tabs, Close Button, and Draggable Frame

-- Create the ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AFKScreenGui"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create a UI Corner Function for Rounded Corners
local function createUICorner(parent, cornerRadius)
    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0, cornerRadius)
    uiCorner.Parent = parent
    return uiCorner
end

-- Create a UIStroke Function for Borders
local function createUIStroke(parent, thickness, color)
    local uiStroke = Instance.new("UIStroke")
    uiStroke.Thickness = thickness
    uiStroke.Color = color
    uiStroke.Parent = parent
    return uiStroke
end

-- Create the Draggable Main Frame (ProFrame)
local proFrame = Instance.new("Frame")
proFrame.Size = UDim2.new(0, 380, 0, 250)
proFrame.Position = UDim2.new(0.5, -190, 0.5, -125)
proFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
proFrame.BorderSizePixel = 0
proFrame.Active = true
proFrame.Draggable = true  -- Make the frame draggable
proFrame.Parent = screenGui
createUICorner(proFrame, 10) -- Rounded corners for the frame
createUIStroke(proFrame, 2, Color3.fromRGB(255, 255, 255)) -- Add white border to the frame

-- Add a shadow effect to the main frame
local shadowFrame = Instance.new("ImageLabel")
shadowFrame.Size = proFrame.Size + UDim2.new(0, 30, 0, 30)
shadowFrame.Position = proFrame.Position + UDim2.new(0, -15, 0, -15)
shadowFrame.Image = "rbxassetid://1316045217"
shadowFrame.ImageColor3 = Color3.fromRGB(0, 0, 0)
shadowFrame.BackgroundTransparency = 1
shadowFrame.ImageTransparency = 0.5
shadowFrame.ScaleType = Enum.ScaleType.Slice
shadowFrame.SliceCenter = Rect.new(10, 10, 118, 118)
shadowFrame.Parent = proFrame

-- Create a Header (Title Bar)
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 40)
header.Position = UDim2.new(0, 0, 0, 0)
header.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
header.BorderSizePixel = 0
header.Parent = proFrame
createUICorner(header, 10) -- Rounded corners for the header

-- Create a Title Label
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -40, 1, 0)  -- Leave space for the close button
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "AFK Toggle Menu"
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 20
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = header

-- Add UIPadding to the Title Label
local padding = Instance.new("UIPadding")
padding.PaddingLeft = UDim.new(0, 10)  -- Add left padding
padding.Parent = titleLabel

-- Create the Close Button
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0.5, -15)
closeButton.Text = "X"
closeButton.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 18
closeButton.Parent = header
createUICorner(closeButton, 6)

-- Create Tabs Container
local tabContainer = Instance.new("Frame")
tabContainer.Size = UDim2.new(1, 0, 0, 35)
tabContainer.Position = UDim2.new(0, 0, 0, 40)
tabContainer.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
tabContainer.BorderSizePixel = 0
tabContainer.Parent = proFrame
createUICorner(tabContainer, 10)

-- Create the "AFK Control" Tab Button
local afkTabButton = Instance.new("TextButton")
afkTabButton.Size = UDim2.new(0, 120, 0, 35)
afkTabButton.Position = UDim2.new(0, 10, 0, 0)
afkTabButton.Text = "AFK Control"
afkTabButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
afkTabButton.TextColor3 = Color3.new(1, 1, 1)
afkTabButton.Font = Enum.Font.GothamBold
afkTabButton.TextSize = 16
afkTabButton.Parent = tabContainer
createUICorner(afkTabButton, 6)

-- Create a Content Frame (AFK Control Tab Content)
local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, 0, 1, -75)
contentFrame.Position = UDim2.new(0, 0, 0, 75)
contentFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
contentFrame.BorderSizePixel = 0
contentFrame.Parent = proFrame
createUICorner(contentFrame, 10)

-- Create AFK On/Off Buttons
local afkOnButton = Instance.new("TextButton")
afkOnButton.Size = UDim2.new(0, 150, 0, 40)
afkOnButton.Position = UDim2.new(0.15, 0, 0.3, 0)
afkOnButton.Text = "Turn AFK On"
afkOnButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
afkOnButton.TextColor3 = Color3.new(1, 1, 1)
afkOnButton.Font = Enum.Font.GothamBold
afkOnButton.TextSize = 18
afkOnButton.Parent = contentFrame
createUICorner(afkOnButton, 10)

local afkOffButton = Instance.new("TextButton")
afkOffButton.Size = UDim2.new(0, 150, 0, 40)
afkOffButton.Position = UDim2.new(0.55, 0, 0.3, 0)
afkOffButton.Text = "Turn AFK Off"
afkOffButton.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
afkOffButton.TextColor3 = Color3.new(1, 1, 1)
afkOffButton.Font = Enum.Font.GothamBold
afkOffButton.TextSize = 18
afkOffButton.Parent = contentFrame
createUICorner(afkOffButton, 10)

-- Variables to store player and AFK state
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local AFK = false
local keepAFKActive = false

-- Function to simulate activity (jumping)
local function keepActive()
    while keepAFKActive do
        if character and character:FindFirstChild("Humanoid") then
            humanoid.Jump = true  -- Simulate jumping
        end
        wait(10)  -- Adjust the time between jumps
    end
end

-- Function to enable AFK mode
local function enableAFK()
    if not keepAFKActive then
        keepAFKActive = true
        AFK = true
        spawn(keepActive)  -- Start AFK simulation in a new thread
    end
end

-- Function to disable AFK mode
local function disableAFK()
    if keepAFKActive then
        keepAFKActive = false
        AFK = false
    end
end

-- Connect buttons to their respective functions
afkOnButton.MouseButton1Click:Connect(enableAFK)
afkOffButton.MouseButton1Click:Connect(disableAFK)

-- Close Button Functionality (Hides the GUI)
closeButton.MouseButton1Click:Connect(function()
    proFrame.Visible = false  -- Hides the frame instead of destroying it
end)
