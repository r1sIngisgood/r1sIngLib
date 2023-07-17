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

    local TabsTable = {}
    local CurrentTab = nil
    local function switchTab(Tab)
        if TabsTable == {} then return end
        if not TabsTable[Tab] then return end
        if CurrentTab ~= nil then TabsTable[CurrentTab].Parent = TabsTemp end

        CurrentTab = Tab
        TabsTable[Tab].Parent = MainBackground
    end

    --Ui Closing
    local guiState = true
    local sizeTable = {[true] = 275, [false] = 0}
    CloseButton.MouseButton1Click:Connect(function()
        guiState = not guiState
        TweenService:Create(MainBackground, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Size = UDim2.new(1,0,0,sizeTable[guiState])}):Play()
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
        local Parent = nil
        if TabsTable == {} then Parent = MainBackground else Parent = TabsTemp end
        local tabButton = Instance.new("TextButton", List)
        tabButton.Name = TabName
        tabButton.BackgroundColor3 = Color3.new(0.156863, 0.156863, 0.156863)
        tabButton.BorderColor3 = Color3.new(0.137255, 0.137255, 0.137255)
        tabButton.BorderSizePixel = 0
        tabButton.Size = UDim2.new(1, 0, 0, 30)
        tabButton.AutoButtonColor = false
        tabButton.Font = Enum.Font.SourceSansLight
        tabButton.Text = TabName
        tabButton.TextColor3 = Color3.new(1, 1, 1)
        tabButton.TextScaled = true
        tabButton.TextSize = 24
        tabButton.TextStrokeColor3 = Color3.new(1, 1, 1)
        tabButton.TextStrokeTransparency = 0.95
        tabButton.TextWrapped = true
        local itTabFrame = Instance.new("Frame", Parent)
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
        local itUiListLayout = Instance.new("UIListLayout", itScrollingFrame)
        itUiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        itUiListLayout.Padding = UDim.new(0, 5)
        
        if itTabFrame.Parent == MainBackground then CurrentTab = itTabFrame.Name end
        TabsTable[tabButton.Name] = itTabFrame
        tabButton.MouseButton1Click:Connect(function()
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

            local newButton = Instance.new("TextButton", newButtonFrame)
            newButton.BackgroundColor3 = Color3.new(1, 1, 1)
            newButton.BorderColor3 = Color3.new(0, 0, 0)
            newButton.BorderSizePixel = 0
            newButton.Size = UDim2.new(0.065, 0, 1, 0)
            newButton.ZIndex = 2
            newButton.AutoButtonColor = false
            newButton.Font = Enum.Font.SourceSansLight
            newButton.Text = ""
            newButton.TextColor3 = Color3.new(0, 0, 0)
            newButton.TextScaled = true
            newButton.TextSize = 24
            newButton.TextWrapped = true
            newButton.ZIndex = 2

            local newButtonUICorner = Instance.new("UICorner", newButton)
            newButtonUICorner.CornerRadius = UDim.new(0,15)
            local newButtonAspectRatio = Instance.new("UIAspectRatioConstraint", newButton)

            local newButtonText = Instance.new("TextLabel", newButtonFrame)
            newButtonText.AnchorPoint = Vector2.new(1, 0)
            newButtonText.BackgroundColor3 = Color3.new(1, 1, 1)
            newButtonText.BackgroundTransparency = 1
            newButtonText.BorderSizePixel = 0
            newButtonText.Position = UDim2.new(1, 0, 0, 0)
            newButtonText.Size = UDim2.new(0.935, -5, 1, 0)
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
            newDivider.Size = UDim2.new(1, 0, 0, 27)
            newDivider.ZIndex = 2

            local newDividerText = Instance.new("TextLabel", newDivider)
            newDividerText.AnchorPoint = Vector2.new(1, 0)
            newDividerText.BackgroundColor3 = Color3.new(1, 1, 1)
            newDividerText.BackgroundTransparency = 1
            newDividerText.BorderColor3 = Color3.new(1, 1, 1)
            newDividerText.BorderSizePixel = 0
            newDividerText.Position = UDim2.new(1, 0, 0, 0)
            newDividerText.Size = UDim2.new(1, -5, 1, 0)
            newDividerText.Font = Enum.Font.SourceSansLight
            newDividerText.Text = Text
            newDividerText.TextColor3 = Color3.new(1, 1, 1)
            newDividerText.TextScaled = true
            newDividerText.TextSize = 14
            newDividerText.TextWrapped = true
            newDividerText.TextXAlignment = Enum.TextXAlignment.Left
            newDividerText.ZIndex = 2

            local newDividerLine = Instance.new("Frame", newDivider)
            newDividerLine.BackgroundColor3 = Color3.new(0.639216, 0.639216, 0.639216)
            newDividerLine.BorderColor3 = Color3.new(0, 0, 0)
            newDividerLine.BorderSizePixel = 0
            newDividerLine.Size = UDim2.new(1, 0, 0, 1)
            newDividerLine.ZIndex = 2

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
            newToggleFrame.Size = UDim2.new(1, 0, 0, 27)
            newToggleFrame.ZIndex = 2
            local newToggleText = Instance.new("TextLabel", newToggleFrame)
            newToggleText.AnchorPoint = Vector2.new(1, 0)
            newToggleText.BackgroundColor3 = Color3.new(1, 1, 1)
            newToggleText.BackgroundTransparency = 1
            newToggleText.BorderColor3 = Color3.new(1, 1, 1)
            newToggleText.BorderSizePixel = 0
            newToggleText.Position = UDim2.new(1, 0, 0, 0)
            newToggleText.Size = UDim2.new(0.879999995, -5, 1, 0)
            newToggleText.Font = Enum.Font.SourceSansLight
            newToggleText.Text = Text
            newToggleText.TextColor3 = Color3.new(1, 1, 1)
            newToggleText.TextScaled = true
            newToggleText.TextSize = 14
            newToggleText.TextWrapped = true
            newToggleText.TextXAlignment = Enum.TextXAlignment.Left
            newToggleText.ZIndex = 2
            local newToggleButton = Instance.new("TextButton", newToggleFrame)
            newToggleButton.BackgroundColor3 = Color3.new(0.478431, 0.478431, 0.478431)
            newToggleButton.BackgroundTransparency = 1
            newToggleButton.BorderColor3 = Color3.new(0, 0, 0)
            newToggleButton.BorderSizePixel = 0
            newToggleButton.Position = UDim2.new(0, 5, 0, 0)
            newToggleButton.Size = UDim2.new(-0.022127308, 50, 1, 0)
            newToggleButton.AutoButtonColor = false
            newToggleButton.Font = Enum.Font.SourceSans
            newToggleButton.Text = ""
            newToggleButton.TextColor3 = Color3.new(0, 0, 0)
            newToggleButton.TextSize = 14
            newToggleButton.ZIndex = 4
            local newToggleButtonUICorner = Instance.new("UICorner", newToggleButton)
            newToggleButtonUICorner.CornerRadius = UDim.new(1,0)
            local newToggleBack = Instance.new("Frame", newToggleButton)
            newToggleBack.AnchorPoint = Vector2.new(0, 0.5)
            newToggleBack.BackgroundColor3 = Color3.new(0.478431, 0.478431, 0.478431)
            newToggleBack.BorderColor3 = Color3.new(0, 0, 0)
            newToggleBack.BorderSizePixel = 0
            newToggleBack.Position = UDim2.new(0, 0, 0.5, 0)
            newToggleBack.Size = UDim2.new(0, 40, 0, 15)
            newToggleBack.ZIndex = 2
            local newToggleBackUICorner = Instance.new("UICorner", newToggleBack)
            newToggleBackUICorner.CornerRadius = UDim.new(1,0)
            local newToggleCircle = Instance.new("Frame", newToggleButton)
            newToggleCircle.Name = "Circle"
            newToggleCircle.AnchorPoint = Vector2.new(1, 0.5)
            newToggleCircle.BackgroundColor3 = Color3.new(1, 1, 1)
            newToggleCircle.BorderColor3 = Color3.new(0, 0, 0)
            newToggleCircle.BorderSizePixel = 0
            newToggleCircle.Position = UDim2.new(0.5, 0, 0.5, 0)
            newToggleCircle.Size = UDim2.new(0, 100, 0, 25)
            newToggleCircle.ZIndex = 3
            local newCircleAspectRatio = Instance.new("UIAspectRatioConstraint", newToggleCircle)
            local newCircleUICorner = Instance.new("UICorner", newToggleCircle)
            newCircleUICorner.CornerRadius = UDim.new(1,0)

            local newToggleState = Instance.new("BoolValue", newToggleButton)
            if defaultState then newToggleState.Value = defaultState end
            
            local stateTable = {[true] = UDim2.new(1,0,.5,0), [false] = UDim2.new(.5,0,.5,0)}
            newToggleButton.MouseButton1Click:Connect(function()
                newToggleState.Value = not newToggleState.Value
                TweenService:Create(newToggleCircle, TweenInfo.new(0.05, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Position = stateTable[newToggleState.Value]}):Play()
                Callback(newToggleState.Value)
            end)
            return newToggleState
        end
        return Tablib
    end
    function Windowlib:ChangeName(Text)
        GuiName.Text = Text
    end
    return Windowlib
end
return lib