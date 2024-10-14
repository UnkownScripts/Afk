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
proFrame.Size = UDim2.new(0, 380, 0, 400)  -- Increased height for additional content
proFrame.Position = UDim2.new(0.5, -190, 0.5, -200)
proFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
proFrame.BorderSizePixel = 0
proFrame.Active = true
proFrame.Draggable = true  -- Make the frame draggable
proFrame.Parent = screenGui
createUICorner(proFrame, 10) -- Rounded corners for the frame
createUIStroke(proFrame, 2, Color3.fromRGB(255, 255, 255)) -- Add white border to the frame

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
titleLabel.Text = "AFK Menu By UnkownScripts"
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

-- Create the "Speed Control" Tab Button
local speedTabButton = Instance.new("TextButton")
speedTabButton.Size = UDim2.new(0, 120, 0, 35)
speedTabButton.Position = UDim2.new(0, 140, 0, 0)
speedTabButton.Text = "Speed Control"
speedTabButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
speedTabButton.TextColor3 = Color3.new(1, 1, 1)
speedTabButton.Font = Enum.Font.GothamBold
speedTabButton.TextSize = 16
speedTabButton.Parent = tabContainer
createUICorner(speedTabButton, 6)

-- Create the "Credits" Tab Button
local creditsTabButton = Instance.new("TextButton")
creditsTabButton.Size = UDim2.new(0, 120, 0, 35)
creditsTabButton.Position = UDim2.new(0, 270, 0, 0)
creditsTabButton.Text = "Credits"
creditsTabButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
creditsTabButton.TextColor3 = Color3.new(1, 1, 1)
creditsTabButton.Font = Enum.Font.GothamBold
creditsTabButton.TextSize = 16
creditsTabButton.Parent = tabContainer
createUICorner(creditsTabButton, 6)

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

-- AFK Button Click Events
afkOnButton.MouseButton1Click:Connect(enableAFK)
afkOffButton.MouseButton1Click:Connect(disableAFK)

-- Create a Content Frame (Speed Control Tab Content)
local speedContentFrame = Instance.new("Frame")
speedContentFrame.Size = UDim2.new(1, 0, 1, -75)
speedContentFrame.Position = UDim2.new(0, 0, 0, 75)
speedContentFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
speedContentFrame.BorderSizePixel = 0
speedContentFrame.Parent = proFrame
createUICorner(speedContentFrame, 10)
speedContentFrame.Visible = false  -- Hide speed content initially

-- Create Speed Control Elements
local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(0, 200, 0, 40)
speedLabel.Position = UDim2.new(0.5, -100, 0.1, 0)
speedLabel.Text = "Set Walk Speed:"
speedLabel.BackgroundTransparency = 1
speedLabel.TextColor3 = Color3.new(1, 1, 1)
speedLabel.Font = Enum.Font.GothamBold
speedLabel.TextSize = 18
speedLabel.Parent = speedContentFrame

local speedInput = Instance.new("TextBox")
speedInput.Size = UDim2.new(0, 200, 0, 40)
speedInput.Position = UDim2.new(0.5, -100, 0.2, 0)
speedInput.PlaceholderText = "Enter speed (default: 16)"
speedInput.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
speedInput.TextColor3 = Color3.new(1, 1, 1)
speedInput.Font = Enum.Font.Gotham
speedInput.TextSize = 16
speedInput.Parent = speedContentFrame
createUICorner(speedInput, 10)

local speedSetButton = Instance.new("TextButton")
speedSetButton.Size = UDim2.new(0, 100, 0, 40)
speedSetButton.Position = UDim2.new(0.5, -50, 0.35, 0)
speedSetButton.Text = "Set Speed"
speedSetButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
speedSetButton.TextColor3 = Color3.new(1, 1, 1)
speedSetButton.Font = Enum.Font.GothamBold
speedSetButton.TextSize = 18
speedSetButton.Parent = speedContentFrame
createUICorner(speedSetButton, 10)

-- Reset Speed Button
local resetSpeedButton = Instance.new("TextButton")
resetSpeedButton.Size = UDim2.new(0, 50, 0, 40)
resetSpeedButton.Position = UDim2.new(0.5, 60, 0.35, 0)  -- Positioned next to Set Speed
resetSpeedButton.Text = "Reset"
resetSpeedButton.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
resetSpeedButton.TextColor3 = Color3.new(1, 1, 1)
resetSpeedButton.Font = Enum.Font.GothamBold
resetSpeedButton.TextSize = 14
resetSpeedButton.Parent = speedContentFrame
createUICorner(resetSpeedButton, 10)

-- Create Credits Content Frame
local creditsContentFrame = Instance.new("Frame")
creditsContentFrame.Size = UDim2.new(1, 0, 1, -75)
creditsContentFrame.Position = UDim2.new(0, 0, 0, 75)
creditsContentFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
creditsContentFrame.BorderSizePixel = 0
creditsContentFrame.Parent = proFrame
createUICorner(creditsContentFrame, 10)
creditsContentFrame.Visible = false  -- Initially hide credits

-- Create Credits UI Elements
local creditsTitleLabel = Instance.new("TextLabel")
creditsTitleLabel.Size = UDim2.new(1, 0, 0, 40)
creditsTitleLabel.Position = UDim2.new(0, 0, 0, 10)
creditsTitleLabel.Text = "Credits"
creditsTitleLabel.BackgroundTransparency = 1
creditsTitleLabel.TextColor3 = Color3.new(1, 1, 1)
creditsTitleLabel.Font = Enum.Font.GothamBold
creditsTitleLabel.TextSize = 24
creditsTitleLabel.Parent = creditsContentFrame

local usernameLabel = Instance.new("TextLabel")
usernameLabel.Size = UDim2.new(1, 0, 0, 30)
usernameLabel.Position = UDim2.new(0, 0, 0.1, 0)
usernameLabel.Text = "Username: UnkownScript"  -- Replace with your username
usernameLabel.BackgroundTransparency = 1
usernameLabel.TextColor3 = Color3.new(1, 1, 1)
usernameLabel.Font = Enum.Font.Gotham
usernameLabel.TextSize = 18
usernameLabel.Parent = creditsContentFrame

local discordLabel = Instance.new("TextLabel")
discordLabel.Size = UDim2.new(1, 0, 0, 30)
discordLabel.Position = UDim2.new(0, 0, 0.2, 0)
discordLabel.Text = "Discord: unkownscripts"  -- Replace with your Discord
discordLabel.BackgroundTransparency = 1
discordLabel.TextColor3 = Color3.new(1, 1, 1)
discordLabel.Font = Enum.Font.Gotham
discordLabel.TextSize = 18
discordLabel.Parent = creditsContentFrame

local copyButton = Instance.new("TextButton")
copyButton.Size = UDim2.new(0, 150, 0, 40)
copyButton.Position = UDim2.new(0.5, -75, 0.4, 0)
copyButton.Text = "Copy Discord"
copyButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
copyButton.TextColor3 = Color3.new(1, 1, 1)
copyButton.Font = Enum.Font.GothamBold
copyButton.TextSize = 18
copyButton.Parent = creditsContentFrame
createUICorner(copyButton, 10)

copyButton.MouseButton1Click:Connect(function()
    setclipboard("unkownscripts")  -- Replace with your Discord
end)

local youtubeLabel = Instance.new("TextLabel")
youtubeLabel.Size = UDim2.new(1, 0, 0, 30)
youtubeLabel.Position = UDim2.new(0, 0, 0.6, 0)
youtubeLabel.Text = "YouTube: @Shinzuu"  -- Replace with your YouTube channel
youtubeLabel.BackgroundTransparency = 1
youtubeLabel.TextColor3 = Color3.new(1, 1, 1)
youtubeLabel.Font = Enum.Font.Gotham
youtubeLabel.TextSize = 18
youtubeLabel.Parent = creditsContentFrame

-- Infinite Jump Control
local infiniteJumpEnabled = false  -- Track infinite jump state

local function toggleInfiniteJump()
    infiniteJumpEnabled = not infiniteJumpEnabled
    if infiniteJumpEnabled then
        player.Character.Humanoid.JumpPower = 50  -- Set jump power for infinite jump
        player.Character.Humanoid.Changed:Connect(function(property)
            if property == "Jump" and infiniteJumpEnabled then
                player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
    else
        player.Character.Humanoid.JumpPower = 50  -- Reset jump power
    end
end

local infiniteJumpButton = Instance.new("TextButton")
infiniteJumpButton.Size = UDim2.new(0, 150, 0, 40)
infiniteJumpButton.Position = UDim2.new(0.15, 55, 0.45, 15)
infiniteJumpButton.Text = "Inf Jump ON/OFF"
infiniteJumpButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
infiniteJumpButton.TextColor3 = Color3.new(1, 1, 1)
infiniteJumpButton.Font = Enum.Font.GothamBold
infiniteJumpButton.TextSize = 18
infiniteJumpButton.Parent = speedContentFrame
createUICorner(infiniteJumpButton, 10)

-- Button Click Events
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

afkTabButton.MouseButton1Click:Connect(function()
    contentFrame.Visible = true
    speedContentFrame.Visible = false
    creditsContentFrame.Visible = false
end)

speedTabButton.MouseButton1Click:Connect(function()
    contentFrame.Visible = false
    speedContentFrame.Visible = true
    creditsContentFrame.Visible = false
end)

creditsTabButton.MouseButton1Click:Connect(function()
    contentFrame.Visible = false
    speedContentFrame.Visible = false
    creditsContentFrame.Visible = true
end)

-- Variables for Speed Loop
local speedLoopActive = false
local speedValue = 16  -- Default speed

-- Function to update speed in a loop
local function updateSpeedLoop()
    while speedLoopActive do
        humanoid.WalkSpeed = speedValue
        wait(0.1)  -- Adjust the update interval as needed
    end
end

-- Handle Speed Setting
speedSetButton.MouseButton1Click:Connect(function()
    local inputSpeedValue = tonumber(speedInput.Text)  -- Convert input to number
    if inputSpeedValue and inputSpeedValue > 16 then
        speedValue = inputSpeedValue  -- Update the speed value
        if not speedLoopActive then
            speedLoopActive = true
            spawn(updateSpeedLoop)  -- Start the speed update loop
        end
        print("Set Walk Speed to:", speedValue)  -- Debugging line
        speedInput.Text = ""  -- Clear the speed input
    else
        warn("Invalid speed value. Please enter a number greater than 16.")
    end
end)

-- Reset Speed to Default (16) on Button Click
resetSpeedButton.MouseButton1Click:Connect(function()
    speedLoopActive = false  -- Stop the speed loop
    humanoid.WalkSpeed = 16  -- Reset the player's walk speed
    speedValue = 16  -- Reset speed value
    speedInput.Text = ""  -- Clear the speed input
    infiniteJumpEnabled = false  -- Disable infinite jump
    player.Character.Humanoid.JumpPower = 50  -- Reset jump power
end)

creditsTabButton.MouseButton1Click:Connect(function()
    contentFrame.Visible = false
    speedContentFrame.Visible = false
    creditsContentFrame.Visible = true
end)

-- Toggle Infinite Jump on Button Click
infiniteJumpButton.MouseButton1Click:Connect(toggleInfiniteJump)

-- Default speed setting
humanoid.WalkSpeed = 16  -- Set default speed

-- Cleanup connections
game.Players.LocalPlayer.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    humanoid = character:WaitForChild("Humanoid")
    humanoid.WalkSpeed = 16  -- Reset speed when character respawns
end)
