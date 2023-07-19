--[[
loadstring(game:HttpGet("https://raw.githubusercontent.com/r1sIngisgood/r1sIngLib/main/Library.lua"))()
]]--

local localPlayer = game:GetService("Players").LocalPlayer
local mouse = localPlayer:GetMouse()
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local lib = {}

function lib:NewWindow(guiName)
    if not (type(guiName) == "string") then guiName = "r1sIngLib" end

    local Window = Instance.new("ScreenGui", game.CoreGui)
    local TopBar = Instance.new("Frame", Window)
    local MainBackground = Instance.new("Frame", TopBar)
    local CloseButton = Instance.new("ImageButton", TopBar)
    local GuiName = Instance.new("TextLabel", TopBar)
    local Tabs = Instance.new("Frame", MainBackground)
    local List = Instance.new("Frame", Tabs)
    local UIListLayout = Instance.new("UIListLayout", List)

    local TabsTemp = Instance.new("Folder", game.CoreGui)
    TabsTemp.Name = "TabsTemp"

    MainBackground.Name = "MainBackground"
    MainBackground.Parent = TopBar
    MainBackground.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
    MainBackground.BorderColor3 = Color3.new(0.137255, 0.137255, 0.137255)
    MainBackground.ClipsDescendants = true
    MainBackground.Position = UDim2.new(0, 0, 1, 0)
    MainBackground.Size = UDim2.new(1, 0, 0, 275)

    TopBar.Name = "TopBar"
    TopBar.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
    TopBar.BorderColor3 = Color3.new(0.137255, 0.137255, 0.137255)
    TopBar.BorderSizePixel = 2
    TopBar.Position = UDim2.new(0.25, 0, 0.25, 0)
    TopBar.Size = UDim2.new(0, 550, 0, 40)

    CloseButton.Name = "CloseButton"
    CloseButton.Parent = TopBar
    CloseButton.AnchorPoint = Vector2.new(1, 0.5)
    CloseButton.BackgroundColor3 = Color3.new(1, 1, 1)
    CloseButton.BackgroundTransparency = 1
    CloseButton.BorderColor3 = Color3.new(0, 0, 0)
    CloseButton.BorderSizePixel = 0
    CloseButton.Position = UDim2.new(1, -5, 0.5, 0)
    CloseButton.Size = UDim2.new(0, 35, 0, 35)
    CloseButton.Image = "http://www.roblox.com/asset/?id=14097204007"

    GuiName.Name = "GuiName"
    GuiName.AnchorPoint = Vector2.new(0, 0.5)
    GuiName.BackgroundColor3 = Color3.new(0, 0, 0)
    GuiName.BackgroundTransparency = 1
    GuiName.BorderColor3 = Color3.new(0, 0, 0)
    GuiName.BorderSizePixel = 0
    GuiName.Position = UDim2.new(0, 5, 0.5, 0)
    GuiName.Size = UDim2.new(0, 135, 1, 0)
    GuiName.ZIndex = 2
    GuiName.Font = Enum.Font.SourceSansLight
    GuiName.Text = guiName
    GuiName.TextColor3 = Color3.new(1, 1, 1)
    GuiName.TextScaled = true
    GuiName.TextSize = 14
    GuiName.TextStrokeColor3 = Color3.new(1, 1, 1)
    GuiName.TextStrokeTransparency = 0.95
    GuiName.TextWrapped = true

    Tabs.Name = "Tabs"
    Tabs.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
    Tabs.BorderColor3 = Color3.new(0.137255, 0.137255, 0.137255)
    Tabs.BorderSizePixel = 2
    Tabs.ClipsDescendants = true
    Tabs.Size = UDim2.new(0.25, 1, 0, 275)

    List.Name = "List"
    List.BackgroundColor3 = Color3.new(1, 1, 1)
    List.BackgroundTransparency = 1
    List.BorderColor3 = Color3.new(0, 0, 0)
    List.BorderSizePixel = 0
    List.Size = UDim2.new(1, 0, 1, 0)
    List.ZIndex = 2

    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

    local HomeTabFrame = Instance.new("Frame")
    HomeTabFrame.Name = "HomeTab"
    HomeTabFrame.AnchorPoint = Vector2.new(1, 0)
    HomeTabFrame.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
    HomeTabFrame.BorderColor3 = Color3.new(0.137255, 0.137255, 0.137255)
    HomeTabFrame.BorderSizePixel = 2
    HomeTabFrame.ClipsDescendants = true
    HomeTabFrame.LayoutOrder = 1
    HomeTabFrame.Position = UDim2.new(1, 0, 0, 0)
    HomeTabFrame.Size = UDim2.new(0.75, 0, 0, 275)
    HomeTabFrame.ZIndex = 2
    local HomeTabScrollingFrame = Instance.new("ScrollingFrame", HomeTabFrame)
    HomeTabScrollingFrame.Active = true
    HomeTabScrollingFrame.AnchorPoint = Vector2.new(0, 1)
    HomeTabScrollingFrame.BackgroundColor3 = Color3.new(1, 1, 1)
    HomeTabScrollingFrame.BackgroundTransparency = 1
    HomeTabScrollingFrame.BorderColor3 = Color3.new(0, 0, 0)
    HomeTabScrollingFrame.BorderSizePixel = 0
    HomeTabScrollingFrame.Position = UDim2.new(0, 0, 1, 0)
    HomeTabScrollingFrame.Size = UDim2.new(1, 0, 1, -30)
    HomeTabScrollingFrame.CanvasPosition = Vector2.new(0, 150)
    HomeTabScrollingFrame.ScrollBarThickness = 5
    HomeTabScrollingFrame.ZIndex = 2
    local HomeTabUIListLayout = Instance.new("UIListLayout", HomeTabScrollingFrame)
    HomeTabUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    HomeTabUIListLayout.Padding = UDim.new(0, 4)
    local HomeTabDivider = Instance.new("Frame", HomeTabScrollingFrame)
    HomeTabDivider.BackgroundColor3 = Color3.new(1, 1, 1)
    HomeTabDivider.BackgroundTransparency = 1
    HomeTabDivider.BorderColor3 = Color3.new(0, 0, 0)
    HomeTabDivider.BorderSizePixel = 0
    HomeTabDivider.Size = UDim2.new(1, 0, 0, 20)
    HomeTabDivider.ZIndex = 2
    local HomeTabDividerText = Instance.new("TextLabel", HomeTabDivider)
    HomeTabDividerText.AnchorPoint = Vector2.new(0, 1)
    HomeTabDividerText.BackgroundColor3 = Color3.new(1, 1, 1)
    HomeTabDividerText.BackgroundTransparency = 1
    HomeTabDividerText.BorderColor3 = Color3.new(1, 1, 1)
    HomeTabDividerText.BorderSizePixel = 0
    HomeTabDividerText.Position = UDim2.new(0, 10, 1, 4)
    HomeTabDividerText.Size = UDim2.new(1, -10, 0.75, 0)
    HomeTabDividerText.Font = Enum.Font.SourceSansLight
    HomeTabDividerText.Text = "Home"
    HomeTabDividerText.TextColor3 = Color3.new(1, 1, 1)
    HomeTabDividerText.TextSize = 19
    HomeTabDividerText.TextWrapped = true
    HomeTabDividerText.TextXAlignment = Enum.TextXAlignment.Left
    HomeTabDividerText.TextYAlignment = Enum.TextYAlignment.Bottom
    HomeTabDividerText.ZIndex = 2
    local HomeFrame = Instance.new("Frame", HomeTabScrollingFrame)
    HomeFrame.BackgroundColor3 = Color3.new(1, 1, 1)
    HomeFrame.BackgroundTransparency = 1
    HomeFrame.BorderColor3 = Color3.new(0, 0, 0)
    HomeFrame.BorderSizePixel = 0
    HomeFrame.Size = UDim2.new(1, -5, 0, 100)
    HomeFrame.ZIndex = 2
    local HomeBackground = Instance.new("Frame", HomeFrame)
    HomeBackground.AnchorPoint = Vector2.new(0.5, 0.5)
    HomeBackground.BackgroundColor3 = Color3.new(0.290196, 0.290196, 0.290196)
    HomeBackground.BorderColor3 = Color3.new(0, 0, 0)
    HomeBackground.BorderSizePixel = 0
    HomeBackground.Position = UDim2.new(0.5, 0, 0.5, 0)
    HomeBackground.Size = UDim2.new(1, -10, 1, 0)
    HomeBackground.ZIndex = 2
    local HomeBackgroundUIStroke = Instance.new("UIStroke", HomeBackground)
    HomeBackgroundUIStroke.Color = Color3.fromRGB(140,140,140)
    HomeBackgroundUIStroke.Thickness = 1
    local HomeBackgroundUICorner = Instance.new("UICorner", HomeBackground)
    HomeBackgroundUICorner.CornerRadius = UDim.new(0,8)
    local HomeUserImage = Instance.new("ImageLabel", HomeBackground)
    HomeUserImage.AnchorPoint = Vector2.new(0, 0.5)
    HomeUserImage.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
    HomeUserImage.BorderColor3 = Color3.new(0, 0, 0)
    HomeUserImage.BorderSizePixel = 0
    HomeUserImage.Position = UDim2.new(0, 5, 0.5, 0)
    HomeUserImage.Size = UDim2.new(1, -10, 1, -10)
    HomeUserImage.Image = game:GetService("Players"):GetUserThumbnailAsync(localPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
    HomeUserImage.ZIndex = 2
    local HomeUserImageAspectRatio = Instance.new("UIAspectRatioConstraint", HomeUserImage)
    local HomeUserImageUICorner = Instance.new("UICorner", HomeUserImage)
    HomeUserImageUICorner.CornerRadius = UDim.new(1,0)
    local HomeUserImageUIStroke = Instance.new("UIStroke", HomeBackground)
    HomeUserImageUIStroke.Color = Color3.fromRGB(63,63,63)
    HomeUserImageUIStroke.Thickness = 3
    local HomeUsernameText = Instance.new("TextLabel", HomeBackground)
    HomeUsernameText.AnchorPoint = Vector2.new(0, 1)
    HomeUsernameText.BackgroundColor3 = Color3.new(1, 1, 1)
    HomeUsernameText.BackgroundTransparency = 1
    HomeUsernameText.BorderColor3 = Color3.new(0, 0, 0)
    HomeUsernameText.BorderSizePixel = 0
    HomeUsernameText.Position = UDim2.new(0.25, 0, 0.3, 0)
    HomeUsernameText.Size = UDim2.new(0.649999976, 0, 0, 25)
    HomeUsernameText.Font = Enum.Font.SourceSansSemibold
    HomeUsernameText.Text = "Hi, "..localPlayer.DisplayName
    HomeUsernameText.TextColor3 = Color3.new(1, 1, 1)
    HomeUsernameText.TextScaled = true
    HomeUsernameText.TextSize = 14
    HomeUsernameText.TextWrapped = true
    HomeUsernameText.TextXAlignment = Enum.TextXAlignment.Left
    HomeUsernameText.TextYAlignment = Enum.TextYAlignment.Bottom
    HomeUsernameText.ZIndex = 2
    local HomeDescription = Instance.new("TextLabel", HomeBackground)
    HomeDescription.AnchorPoint = Vector2.new(0, 1)
    HomeDescription.BackgroundColor3 = Color3.new(1, 1, 1)
    HomeDescription.BackgroundTransparency = 1
    HomeDescription.BorderColor3 = Color3.new(0, 0, 0)
    HomeDescription.BorderSizePixel = 0
    HomeDescription.Position = UDim2.new(0.3, 0, 1, 0)
    HomeDescription.Size = UDim2.new(0.6, -10, 1, -30)
    HomeDescription.Font = Enum.Font.SourceSansLight
    HomeDescription.Text = "Welcome to "..guiName
    HomeDescription.TextColor3 = Color3.new(1, 1, 1)
    HomeDescription.TextSize = 20
    HomeDescription.TextWrapped = true
    HomeDescription.TextXAlignment = Enum.TextXAlignment.Left
    HomeDescription.TextYAlignment = Enum.TextYAlignment.Top
    HomeDescription.ZIndex = 2
    local HomeDiscordButton = Instance.new("TextButton", HomeBackground)
    HomeDiscordButton.AnchorPoint = Vector2.new(1, 1)
    HomeDiscordButton.BackgroundColor3 = Color3.new(0.337255, 0.384314, 0.964706)
    HomeDiscordButton.BorderColor3 = Color3.new(0, 0, 0)
    HomeDiscordButton.BorderSizePixel = 0
    HomeDiscordButton.Position = UDim2.new(1, -10, 1, -10)
    HomeDiscordButton.Size = UDim2.new(0, 50, 0, 25)
    HomeDiscordButton.AutoButtonColor = false
    HomeDiscordButton.Font = Enum.Font.SourceSansSemibold
    HomeDiscordButton.Text = "Discord"
    HomeDiscordButton.TextColor3 = Color3.new(1, 1, 1)
    HomeDiscordButton.TextSize = 14
    HomeDiscordButton.TextWrapped = true
    HomeDiscordButton.ZIndex = 2
    local HomeDiscordButtonUICorner = Instance.new("UICorner", HomeDiscordButton)
    HomeDiscordButtonUICorner.CornerRadius = UDim.new(0,8)
    local HomeTabNameFrame = Instance.new("Frame", HomeTabFrame)
    HomeTabNameFrame.BackgroundColor3 = Color3.new(1, 1, 1)
    HomeTabNameFrame.BackgroundTransparency = 1
    HomeTabNameFrame.BorderColor3 = Color3.new(0, 0, 0)
    HomeTabNameFrame.BorderSizePixel = 0
    HomeTabNameFrame.Size = UDim2.new(1, 0, 0, 30)
    HomeTabNameFrame.ZIndex = 2
    local HomeTabName = Instance.new("TextLabel", HomeTabNameFrame)
    HomeTabName.BackgroundColor3 = Color3.new(0, 0, 0)
    HomeTabName.BackgroundTransparency = 1
    HomeTabName.BorderColor3 = Color3.new(0, 0, 0)
    HomeTabName.BorderSizePixel = 0
    HomeTabName.Size = UDim2.new(1, 0, 1, 0)
    HomeTabName.ZIndex = 2
    HomeTabName.Font = Enum.Font.SourceSansSemibold
    HomeTabName.Text = "Home"
    HomeTabName.TextColor3 = Color3.new(1, 1, 1)
    HomeTabName.TextScaled = true
    HomeTabName.TextSize = 14
    HomeTabName.TextStrokeColor3 = Color3.new(1, 1, 1)
    HomeTabName.TextWrapped = true
    HomeTabName.TextYAlignment = Enum.TextYAlignment.Bottom
    HomeTabName.ZIndex = 2
    local HomeTabLine = Instance.new("Frame", HomeTabNameFrame)
    HomeTabLine.AnchorPoint = Vector2.new(0, 1)
    HomeTabLine.BackgroundColor3 = Color3.new(1, 1, 1)
    HomeTabLine.BorderColor3 = Color3.new(0, 0, 0)
    HomeTabLine.BorderSizePixel = 0
    HomeTabLine.Position = UDim2.new(0, 0, 1.00000024, 0)
    HomeTabLine.Size = UDim2.new(1, -5, 0, 1)
    HomeTabLine.ZIndex = 2
    local HomeTabButtonFrame = Instance.new("Frame", List)
    HomeTabButtonFrame.BackgroundColor3 = Color3.new(1, 1, 1)
    HomeTabButtonFrame.BackgroundTransparency = 1
    HomeTabButtonFrame.BorderColor3 = Color3.new(0, 0, 0)
    HomeTabButtonFrame.BorderSizePixel = 0
    HomeTabButtonFrame.Size = UDim2.new(1, 0, 0, 35)
    local HomeTabButtonStrokeFrame = Instance.new("Frame", HomeTabButtonFrame)
    HomeTabButtonStrokeFrame.Name = "Stroke"
    HomeTabButtonStrokeFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    HomeTabButtonStrokeFrame.BackgroundColor3 = Color3.new(1, 1, 1)
    HomeTabButtonStrokeFrame.BackgroundTransparency = 1
    HomeTabButtonStrokeFrame.BorderColor3 = Color3.new(0, 0, 0)
    HomeTabButtonStrokeFrame.BorderSizePixel = 0
    HomeTabButtonStrokeFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    HomeTabButtonStrokeFrame.Size = UDim2.new(1, -5, 1, -5)
    local HomeTabButton = Instance.new("TextButton", HomeTabButtonFrame)
    HomeTabButton.Name = "Home"
    HomeTabButton.AnchorPoint = Vector2.new(0.5, 0.5)
    HomeTabButton.BackgroundColor3 = Color3.new(0.282353, 0.282353, 0.282353)
    HomeTabButton.BorderColor3 = Color3.new(0.137255, 0.137255, 0.137255)
    HomeTabButton.BorderSizePixel = 0
    HomeTabButton.Position = UDim2.new(0.5, 0, 0.5, 0)
    HomeTabButton.Size = UDim2.new(1, -5, 1, -5)
    HomeTabButton.AutoButtonColor = false
    HomeTabButton.Font = Enum.Font.SourceSansLight
    HomeTabButton.Text = "Home"
    HomeTabButton.TextColor3 = Color3.new(1, 1, 1)
    HomeTabButton.TextScaled = true
    HomeTabButton.TextSize = 24
    HomeTabButton.TextStrokeColor3 = Color3.new(1, 1, 1)
    HomeTabButton.TextStrokeTransparency = 0.949999988079071
    HomeTabButton.TextWrapped = true
    local HomeTabButtonUICorner = Instance.new("UICorner", HomeTabButton)
    HomeTabButtonUICorner.CornerRadius = UDim.new(0,8)
    local HomeTabButtonStrokeFrameUICorner = Instance.new("UICorner", HomeTabButtonStrokeFrame)
    HomeTabButtonStrokeFrameUICorner.CornerRadius = UDim.new(0,8)
    local HomeTabButtonStrokeFrameUIStroke = Instance.new("UIStroke", HomeTabButtonStrokeFrame)
    HomeTabButtonStrokeFrameUIStroke.Thickness = 1
    HomeTabButtonStrokeFrameUIStroke.Color = Color3.fromRGB(125,125,125)

    HomeTabFrame.Parent = MainBackground
    local TabsTable = {["Home"] = {HomeTabFrame, HomeTabButtonFrame}}
    local buttonColorsTable = {[false] = Color3.fromRGB(75,75,75), [true] = Color3.fromRGB(125,125,125)}
    local CurrentTab = "Home"
    local function switchTab(Tab)
        if TabsTable == {} then return end
        if not TabsTable[Tab] then return end
        local clickedTabFrame = TabsTable[Tab][1]
        local clickedTabButtonFrame = TabsTable[Tab][2]
        local currentTabFrame, currentTabButtonFrame = nil, nil
        if TabsTable[CurrentTab] then
            currentTabFrame = TabsTable[CurrentTab][1]
            currentTabButtonFrame = TabsTable[CurrentTab][2]
            TweenService:Create(currentTabButtonFrame.Stroke.UIStroke, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Color = buttonColorsTable[false]}):Play()
        end
        TweenService:Create(clickedTabButtonFrame.Stroke.UIStroke, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Color = buttonColorsTable[true]}):Play()
        CurrentTab = Tab
        clickedTabFrame.Parent = MainBackground
    end

    --Ui Closing
    local guiState = true
    local closeButtonTable = {[true] = {275, 0}, [false] = {0, 180}}
    CloseButton.MouseButton1Click:Connect(function()
        guiState = not guiState
        TweenService:Create(MainBackground, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Size = UDim2.new(1,0,0,closeButtonTable[guiState][1])}):Play()
        TweenService:Create(CloseButton, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Rotation = closeButtonTable[guiState][2]}):Play()
    end)

    --Dragging
    local Holding = false
    local Hovered = false
    local MoveCon = nil

    local InitX, InitY, UIInitPos

    local function Drag()
        if Holding == false then MoveCon:Disconnect(); return end
        local distMovedX = InitX - mouse.X
        local distMovedY = InitY - mouse.Y

        TopBar.Position = UIInitPos - UDim2.new(0, distMovedX, 0, distMovedY)
    end

    TopBar.MouseEnter:Connect(function()
        Hovered = true
    end)
    TopBar.MouseLeave:Connect(function()
        Hovered = false
    end)
    UserInputService.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            Holding = Hovered
            if Holding then
                InitX, InitY = mouse.X, mouse.Y
                UIInitPos = TopBar.Position
                MoveCon = mouse.Move:Connect(Drag)
            end
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then Holding = false end
    end)

    MoveCon = mouse.Move:Connect(Drag)

    local Windowlib = {}

    function Windowlib:NewTab(TabName)
        if not (type(TabName) == "string") then TabName = "" end
        local itTabButtonFrame = Instance.new("Frame", List)
        itTabButtonFrame.BackgroundColor3 = Color3.new(1, 1, 1)
        itTabButtonFrame.BackgroundTransparency = 1
        itTabButtonFrame.BorderColor3 = Color3.new(0, 0, 0)
        itTabButtonFrame.BorderSizePixel = 0
        itTabButtonFrame.Size = UDim2.new(1, 0, 0, 35)
        local itTabButton = Instance.new("TextButton", itTabButtonFrame)
        itTabButton.Name = TabName
        itTabButton.AnchorPoint = Vector2.new(0.5, 0.5)
        itTabButton.BackgroundColor3 = Color3.new(0.282353, 0.282353, 0.282353)
        itTabButton.BorderColor3 = Color3.new(0.137255, 0.137255, 0.137255)
        itTabButton.BorderSizePixel = 0
        itTabButton.Position = UDim2.new(0.5, 0, 0.5, 0)
        itTabButton.Size = UDim2.new(1, -5, 1, -5)
        itTabButton.AutoButtonColor = false
        itTabButton.Font = Enum.Font.SourceSansLight
        itTabButton.Text = "Game"
        itTabButton.TextColor3 = Color3.new(1, 1, 1)
        itTabButton.TextScaled = true
        itTabButton.TextSize = 24
        itTabButton.TextStrokeColor3 = Color3.new(1, 1, 1)
        itTabButton.TextStrokeTransparency = 0.949999988079071
        itTabButton.TextWrapped = true
        local itTabButtonUICorner = Instance.new("UICorner", itTabButton)
        itTabButtonUICorner.CornerRadius = UDim.new(0,8)
        local itTabButtonStrokeFrame = Instance.new("Frame", itTabButtonFrame)
        itTabButtonStrokeFrame.Name = "Stroke"
        itTabButtonStrokeFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        itTabButtonStrokeFrame.BackgroundColor3 = Color3.new(1, 1, 1)
        itTabButtonStrokeFrame.BackgroundTransparency = 1
        itTabButtonStrokeFrame.BorderColor3 = Color3.new(0, 0, 0)
        itTabButtonStrokeFrame.BorderSizePixel = 0
        itTabButtonStrokeFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
        itTabButtonStrokeFrame.Size = UDim2.new(1, -5, 1, -5)
        local itTabButtonStrokeFrameUICorner = Instance.new("UICorner", itTabButtonStrokeFrame)
        itTabButtonStrokeFrameUICorner.CornerRadius = UDim.new(0,8)
        local itTabButtonStrokeFrameUIStroke = Instance.new("UIStroke", itTabButtonStrokeFrame)
        itTabButtonStrokeFrameUIStroke.Thickness = 1
        itTabButtonStrokeFrameUIStroke.Color = buttonColorsTable[false]
        local itTabFrame = Instance.new("Frame", TabsTemp)
        itTabFrame.AnchorPoint = Vector2.new(1, 0)
        itTabFrame.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
        itTabFrame.BorderColor3 = Color3.new(0.137255, 0.137255, 0.137255)
        itTabFrame.BorderSizePixel = 2
        itTabFrame.ClipsDescendants = true
        itTabFrame.LayoutOrder = 1
        itTabFrame.Position = UDim2.new(1, 0, 0, 0)
        itTabFrame.Size = UDim2.new(0.75, 0, 0, 275)
        itTabFrame.ZIndex = 2
        local itTabNameFrame = Instance.new("Frame", itTabFrame)
        itTabNameFrame.Name = "TabNameFrame"
        itTabNameFrame.BackgroundColor3 = Color3.new(1, 1, 1)
        itTabNameFrame.BackgroundTransparency = 1
        itTabNameFrame.BorderColor3 = Color3.new(0, 0, 0)
        itTabNameFrame.BorderSizePixel = 0
        itTabNameFrame.Position = UDim2.new(0, 0, 0, 0)
        itTabNameFrame.Size = UDim2.new(1, 0, 0, 30)
        local itTabName = Instance.new("TextLabel", itTabNameFrame)
        itTabName.Name = "TabName"
        itTabName.BackgroundColor3 = Color3.new(0, 0, 0)
        itTabName.BackgroundTransparency = 1
        itTabName.BorderColor3 = Color3.new(0, 0, 0)
        itTabName.BorderSizePixel = 0
        itTabName.Size = UDim2.new(1, 0, 1, 0)
        itTabName.ZIndex = 2
        itTabName.Font = Enum.Font.SourceSansLight
        itTabName.Text = TabName
        itTabName.TextColor3 = Color3.new(1, 1, 1)
        itTabName.TextScaled = true
        itTabName.TextSize = 14
        itTabName.TextStrokeColor3 = Color3.new(1, 1, 1)
        itTabName.TextStrokeTransparency = 0.95
        itTabName.TextWrapped = true
        itTabName.TextYAlignment = Enum.TextYAlignment.Bottom
        local itTabLine = Instance.new("Frame", itTabNameFrame)
        itTabLine.AnchorPoint = Vector2.new(0, 1)
        itTabLine.BackgroundColor3 = Color3.new(1, 1, 1)
        itTabLine.BorderColor3 = Color3.new(0, 0, 0)
        itTabLine.BorderSizePixel = 0
        itTabLine.Position = UDim2.new(0, 0, 1, 0)
        itTabLine.Size = UDim2.new(1, -5, 0, 1)
        itTabLine.ZIndex = 2
        local itScrollingFrame = Instance.new("ScrollingFrame", itTabFrame)
        itScrollingFrame.Active = true
        itScrollingFrame.AnchorPoint = Vector2.new(0, 1)
        itScrollingFrame.BackgroundColor3 = Color3.new(1, 1, 1)
        itScrollingFrame.BackgroundTransparency = 1
        itScrollingFrame.BorderColor3 = Color3.new(0, 0, 0)
        itScrollingFrame.BorderSizePixel = 0
        itScrollingFrame.Position = UDim2.new(0, 0, 1, 0)
        itScrollingFrame.Size = UDim2.new(1, 0, 1, -30)
        itScrollingFrame.ScrollBarThickness = 5
        itScrollingFrame.ZIndex = 2
        local itUiListLayout = Instance.new("UIListLayout", itScrollingFrame)
        itUiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        itUiListLayout.Padding = UDim.new(0, 5)
        
        if itTabFrame.Parent == MainBackground then CurrentTab = itTabFrame.Name end
        TabsTable[itTabButton.Name] = {itTabFrame, itTabButtonFrame}
        itTabButton.MouseButton1Click:Connect(function()
            switchTab(TabName)
        end)

        local Tablib = {}
        function Tablib:NewButton(Text, Callback)
            if not (type(Callback) == "function") then Callback = function()end end
            if not (type(Text) == "string") then Text = "" end
            local newButtonFrame = Instance.new("Frame", itScrollingFrame)
            newButtonFrame.Parent = itScrollingFrame
            newButtonFrame.BackgroundColor3 = Color3.new(1, 1, 1)
            newButtonFrame.BackgroundTransparency = 1
            newButtonFrame.BorderColor3 = Color3.new(0, 0, 0)
            newButtonFrame.BorderSizePixel = 0
            newButtonFrame.Size = UDim2.new(1, 0, 0, 27)
            newButtonFrame.ZIndex = 2
            local newButtonCornerFrame = Instance.new("Frame", newButtonFrame)
            newButtonCornerFrame.AnchorPoint = Vector2.new(0.5, 0.5)
            newButtonCornerFrame.BackgroundColor3 = Color3.new(0.282353, 0.282353, 0.282353)
            newButtonCornerFrame.BorderColor3 = Color3.new(0, 0, 0)
            newButtonCornerFrame.BorderSizePixel = 0
            newButtonCornerFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
            newButtonCornerFrame.Size = UDim2.new(1, -10, 1, 0)
            newButtonCornerFrame.ZIndex = 2
            local newButtonCornerFrameUICorner = Instance.new("UICorner", newButtonCornerFrame)
            newButtonCornerFrameUICorner.CornerRadius = UDim.new(0,8)
            local newButtonCornerFrameUIStroke = Instance.new("UIStroke", newButtonCornerFrame)
            newButtonCornerFrameUIStroke.Thickness = 1
            newButtonCornerFrameUIStroke.Color = Color3.fromRGB(140,140,140)
            local newButton = Instance.new("TextButton", newButtonCornerFrame)
            newButton.AnchorPoint = Vector2.new(0, 0.5)
            newButton.BackgroundColor3 = Color3.new(1, 1, 1)
            newButton.BackgroundTransparency = 1
            newButton.BorderColor3 = Color3.new(0, 0, 0)
            newButton.BorderSizePixel = 0
            newButton.Position = UDim2.new(0, 0, 0.5, 0)
            newButton.Size = UDim2.new(1, 0, 1, 0)
            newButton.ZIndex = 2
            newButton.AutoButtonColor = false
            newButton.Font = Enum.Font.SourceSansLight
            newButton.Text = ""
            newButton.TextColor3 = Color3.new(0, 0, 0)
            newButton.TextScaled = true
            newButton.TextSize = 24
            newButton.TextWrapped = true
            newButton.ZIndex = 2
            local newButtonText = Instance.new("TextLabel", newButtonCornerFrame)
            newButtonText.AnchorPoint = Vector2.new(0, 0.5)
            newButtonText.BackgroundColor3 = Color3.new(1, 1, 1)
            newButtonText.BackgroundTransparency = 1
            newButtonText.BorderColor3 = Color3.new(0, 0, 0)
            newButtonText.BorderSizePixel = 0
            newButtonText.Position = UDim2.new(0, 15, 0.5, 0)
            newButtonText.Size = UDim2.new(1, -10, 1, -6)
            newButtonText.Font = Enum.Font.SourceSansLight
            newButtonText.Text = Text
            newButtonText.TextColor3 = Color3.new(1, 1, 1)
            newButtonText.TextScaled = true
            newButtonText.TextSize = 14
            newButtonText.TextWrapped = true
            newButtonText.TextXAlignment = Enum.TextXAlignment.Left
            newButtonText.ZIndex = 2
            newButton.MouseButton1Click:Connect(Callback)
        end
        function Tablib:NewDivider(Text)
            if not (type(Text) == "string") then Text = "" end
            local newDivider = Instance.new("Frame", itScrollingFrame)
            newDivider.BackgroundColor3 = Color3.new(1, 1, 1)
            newDivider.BackgroundTransparency = 1
            newDivider.BorderColor3 = Color3.new(0, 0, 0)
            newDivider.BorderSizePixel = 0
            newDivider.Position = UDim2.new(0, 0, 0.136910275, 0)
            newDivider.Size = UDim2.new(1, 0, 0, 20)
            newDivider.ZIndex = 2

            local newDividerText = Instance.new("TextLabel", newDivider)
            newDividerText.AnchorPoint = Vector2.new(0, 1)
            newDividerText.BackgroundColor3 = Color3.new(1, 1, 1)
            newDividerText.BackgroundTransparency = 1
            newDividerText.BorderColor3 = Color3.new(1, 1, 1)
            newDividerText.BorderSizePixel = 0
            newDividerText.Position = UDim2.new(0, 10, 1, 4)
            newDividerText.Size = UDim2.new(1, -10, 0.75, 0)
            newDividerText.Font = Enum.Font.SourceSansLight
            newDividerText.Text = Text
            newDividerText.TextColor3 = Color3.new(1, 1, 1)
            newDividerText.TextSize = 19
            newDividerText.TextWrapped = true
            newDividerText.TextXAlignment = Enum.TextXAlignment.Left
            newDividerText.TextYAlignment = Enum.TextYAlignment.Bottom
            newDividerText.ZIndex = 2

            newDivider.Name = Text
            newDividerText.Text = Text
        end
        function Tablib:NewToggle(Text, Callback, defaultState)
            if not (type(Callback) == "function") then Callback = function()end end
            if not (type(Text) == "string") then Text = "" end
            if not (type(defaultState) == "boolean") then defaultState = false end
            
            local newToggleFrame = Instance.new("Frame", itScrollingFrame)
            newToggleFrame.BackgroundColor3 = Color3.new(1, 1, 1)
            newToggleFrame.BackgroundTransparency = 1
            newToggleFrame.BorderColor3 = Color3.new(0, 0, 0)
            newToggleFrame.BorderSizePixel = 0
            newToggleFrame.Position = UDim2.new(0, 0, 0.136910275, 0)
            newToggleFrame.Size = UDim2.new(1, -5, 0, 35)
            newToggleFrame.ZIndex = 2
            local newToggleCornerFrame = Instance.new("Frame", newToggleFrame)
            newToggleCornerFrame.AnchorPoint = Vector2.new(0.5, 0.5)
            newToggleCornerFrame.BackgroundColor3 = Color3.new(0.282353, 0.282353, 0.282353)
            newToggleCornerFrame.BorderColor3 = Color3.new(0, 0, 0)
            newToggleCornerFrame.BorderSizePixel = 0
            newToggleCornerFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
            newToggleCornerFrame.Size = UDim2.new(1, -10, 1, 0)
            local newToggleText = Instance.new("TextLabel", newToggleCornerFrame)
            newToggleText.AnchorPoint = Vector2.new(1, 0.5)
            newToggleText.BackgroundColor3 = Color3.new(1, 1, 1)
            newToggleText.BackgroundTransparency = 1
            newToggleText.BorderColor3 = Color3.new(1, 1, 1)
            newToggleText.BorderSizePixel = 0
            newToggleText.Position = UDim2.new(1, 0, 0.5, 0)
            newToggleText.Size = UDim2.new(1, -45, 1, -6)
            newToggleText.Font = Enum.Font.SourceSansLight
            newToggleText.Text = Text
            newToggleText.TextColor3 = Color3.new(1, 1, 1)
            newToggleText.TextScaled = true
            newToggleText.TextSize = 14
            newToggleText.TextWrapped = true
            newToggleText.TextXAlignment = Enum.TextXAlignment.Left
            newToggleText.ZIndex = 2
            local newToggleButton = Instance.new("TextButton", newToggleCornerFrame)
            newToggleButton.AnchorPoint = Vector2.new(0, 0.5)
            newToggleButton.BackgroundColor3 = Color3.new(0.478431, 0.478431, 0.478431)
            newToggleButton.BackgroundTransparency = 1
            newToggleButton.BorderColor3 = Color3.new(0, 0, 0)
            newToggleButton.BorderSizePixel = 0
            newToggleButton.Position = UDim2.new(0, 0, 0.5, 0)
            newToggleButton.Size = UDim2.new(1, 0, 1, 0)
            newToggleButton.AutoButtonColor = false
            newToggleButton.Font = Enum.Font.SourceSans
            newToggleButton.Text = ""
            newToggleButton.TextColor3 = Color3.new(0, 0, 0)
            newToggleButton.TextSize = 14
            newToggleButton.ZIndex = 3
            local newToggleBackground = Instance.new("Frame", newToggleCornerFrame)
            newToggleBackground.AnchorPoint = Vector2.new(0, 0.5)
            newToggleBackground.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
            newToggleBackground.BorderColor3 = Color3.new(0, 0, 0)
            newToggleBackground.BorderSizePixel = 0
            newToggleBackground.Position = UDim2.new(0, 10, 0.5, 0)
            newToggleBackground.Size = UDim2.new(0, 25, 0, 25)
            newToggleBackground.ZIndex = 2
            local newToggleBackgroundInner = Instance.new("Frame", newToggleBackground)
            newToggleBackgroundInner.AnchorPoint = Vector2.new(0.5, 0.5)
            newToggleBackgroundInner.BackgroundColor3 = Color3.new(1, 1, 1)
            newToggleBackgroundInner.BackgroundTransparency = 0
            newToggleBackgroundInner.BorderColor3 = Color3.new(0, 0, 0)
            newToggleBackgroundInner.BorderSizePixel = 0
            newToggleBackgroundInner.Position = UDim2.new(0.5, 0, 0.5, 0)
            newToggleBackgroundInner.Size = UDim2.new(1, -8, 1, -8)
            newToggleBackgroundInner.ZIndex = 2
            local newToggleCornerFrameUICorner = Instance.new("UICorner", newToggleCornerFrame)
            newToggleCornerFrameUICorner.CornerRadius = UDim.new(0,8)
            local newToggleBackgroundInnerUICorner = Instance.new("UICorner", newToggleBackgroundInner)
            newToggleBackgroundInnerUICorner.CornerRadius = UDim.new(0.5,0)
            local newToggleBackgroundUICorner = Instance.new("UICorner", newToggleBackground)
            newToggleBackgroundUICorner.CornerRadius = UDim.new(0.5,0)


            local newToggleState = Instance.new("BoolValue", newToggleButton)
            if defaultState then newToggleState.Value = defaultState end
            
            local stateTable = {[true] = UDim2.new({1, -8},1, -8), [false] = UDim2.new(0,0,0,0)}
            newToggleButton.MouseButton1Click:Connect(function()
                newToggleState.Value = not newToggleState.Value
                TweenService:Create(newToggleBackgroundInner, TweenInfo.new(0.05, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Size = stateTable[newToggleState.Value]}):Play()
                local newValue = newToggleState.Value
                Callback(newValue)
            end)
            return newToggleState
        end
        function Tablib:NewDescription(Text)
        end
        return Tablib
    end
    function Windowlib:ChangeName(Text)
        GuiName.Text = Text
    end
    return Windowlib
end
return lib