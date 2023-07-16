local lib = {}

function lib:CreateWindow(guiName)
    local Window = Instance.new("ScreenGui")
    local MainBackground = Instance.new("Frame", Window)
    local TopBar = Instance.new("Frame", MainBackground )
    local GuiName = Instance.new("TextLabel", TopBar)
    local TabName = Instance.new("TextLabel", TopBar)
    local Tabs = Instance.new("Frame", MainBackground)
    local List = Instance.new("Frame", Tabs)
    local UIListLayout = Instance.new("UIListLayout", List)

    local TabsTemp = Instance.new("Folder", game.CoreGui)
    TabsTemp.Name = "TabsTemp"

    MainBackground.Name = "MainBackground"
    MainBackground.BackgroundColor3 = Color3.new(0, 0, 0)
    MainBackground.BackgroundTransparency = 0.375
    MainBackground.BorderColor3 = Color3.new(0, 0, 0)
    MainBackground.BorderSizePixel = 0
    MainBackground.Position = UDim2.new(0.325949371, 0, 0.199021786, 0)
    MainBackground.Size = UDim2.new(0, 550, 0, 350)

    TopBar.Name = "TopBar"
    TopBar.BackgroundColor3 = Color3.new(0, 0, 0)
    TopBar.BackgroundTransparency = 1
    TopBar.BorderColor3 = Color3.new(0, 0, 0)
    TopBar.BorderSizePixel = 0
    TopBar.ClipsDescendants = true
    TopBar.Size = UDim2.new(0, 550, 0, 43)

    GuiName.Name = "GuiName"
    GuiName.AnchorPoint = Vector2.new(0, 0.5)
    GuiName.BackgroundColor3 = Color3.new(0, 0, 0)
    GuiName.BackgroundTransparency = 1
    GuiName.BorderColor3 = Color3.new(0, 0, 0)
    GuiName.BorderSizePixel = 0
    GuiName.Position = UDim2.new(0, 5, 0.546999931, 0)
    GuiName.Size = UDim2.new(-0.00819513481, 137, 1, 0)
    GuiName.ZIndex = 2
    GuiName.Font = Enum.Font.SourceSansLight
    GuiName.Text = guiName
    GuiName.TextColor3 = Color3.new(1, 1, 1)
    GuiName.TextScaled = true
    GuiName.TextSize = 14
    GuiName.TextStrokeColor3 = Color3.new(1, 1, 1)
    GuiName.TextStrokeTransparency = 0.949999988079071
    GuiName.TextWrapped = true
    GuiName.TextYAlignment = Enum.TextYAlignment.Bottom

    TabName.Name = "TabName"
    TabName.AnchorPoint = Vector2.new(0, 0.5)
    TabName.BackgroundColor3 = Color3.new(0, 0, 0)
    TabName.BackgroundTransparency = 1
    TabName.BorderColor3 = Color3.new(0, 0, 0)
    TabName.BorderSizePixel = 0
    TabName.Position = UDim2.new(0.375, 0, 0.545000017, 0)
    TabName.Size = UDim2.new(0.5, 0, 1, 0)
    TabName.ZIndex = 2
    TabName.Font = Enum.Font.SourceSansLight
    TabName.Text = "Tab"
    TabName.TextColor3 = Color3.new(1, 1, 1)
    TabName.TextScaled = true
    TabName.TextSize = 14
    TabName.TextStrokeColor3 = Color3.new(1, 1, 1)
    TabName.TextStrokeTransparency = 0.949999988079071
    TabName.TextWrapped = true
    TabName.TextYAlignment = Enum.TextYAlignment.Bottom

    Tabs.Name = "Tabs"
    Tabs.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
    Tabs.BorderColor3 = Color3.new(0.137255, 0.137255, 0.137255)
    Tabs.BorderSizePixel = 2
    Tabs.ClipsDescendants = true
    Tabs.Position = UDim2.new(0, 0, 0.125, 0)
    Tabs.Size = UDim2.new(0.25, 0, 0, 275)

    List.Name = "List"
    List.BackgroundColor3 = Color3.new(1, 1, 1)
    List.BackgroundTransparency = 1
    List.BorderColor3 = Color3.new(0, 0, 0)
    List.BorderSizePixel = 0
    List.Size = UDim2.new(1, 0, 0.939999998, 0)
    List.ZIndex = 2

    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

    Window.Parent = game.CoreGui

    local TabsTable = {}
    local CurrentTab = nil
    local function switchTab(Tab)
        if TabsTable == {} then return end
        if not TabsTable[Tab] then return end
        if CurrentTab ~= nil then TabsTable[CurrentTab].Parent = TabsTemp end

        TabName.Text = Tab
        CurrentTab = Tab
        TabsTable[Tab].Parent = MainBackground
    end

    local Windowlib = {}
    function Windowlib:CreateTab(TabName)
        if not (type(TabName) == "string") then TabName = "" end

        local Button = Instance.new("TextButton", List)
        Button.Name = TabName
        Button.BackgroundColor3 = Color3.new(0.156863, 0.156863, 0.156863)
        Button.BorderColor3 = Color3.new(0.137255, 0.137255, 0.137255)
        Button.BorderSizePixel = 0
        Button.Size = UDim2.new(1.00364947, 0, 0.0196278561, 30)
        Button.AutoButtonColor = false
        Button.Font = Enum.Font.SourceSansLight
        Button.Text = TabName
        Button.TextColor3 = Color3.new(1, 1, 1)
        Button.TextScaled = true
        Button.TextSize = 24
        Button.TextStrokeColor3 = Color3.new(1, 1, 1)
        Button.TextStrokeTransparency = 0.949999988079071
        Button.TextWrapped = true

        local itTabFrame = Instance.new("Frame")
        itTabFrame.AnchorPoint = Vector2.new(1, 0)
        itTabFrame.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
        itTabFrame.BorderColor3 = Color3.new(0.137255, 0.137255, 0.137255)
        itTabFrame.BorderSizePixel = 2
        itTabFrame.ClipsDescendants = true
        itTabFrame.LayoutOrder = 1
        itTabFrame.Position = UDim2.new(1, 0, 0.125, 0)
        itTabFrame.Size = UDim2.new(0.75, 0, 0, 275)
        itTabFrame.ZIndex = 2

        local itScrollingFrame = Instance.new("ScrollingFrame", itTabFrame)
        itScrollingFrame.Active = true
        itScrollingFrame.BackgroundColor3 = Color3.new(1, 1, 1)
        itScrollingFrame.BackgroundTransparency = 1
        itScrollingFrame.BorderColor3 = Color3.new(0, 0, 0)
        itScrollingFrame.BorderSizePixel = 0
        itScrollingFrame.Position = UDim2.new(0.00484848488, 0, 0.00729261618, 0)
        itScrollingFrame.Size = UDim2.new(1, 0, 1, 0)

        local itUiListLayout = Instance.new("UIListLayout", itScrollingFrame)
        itUiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        itUiListLayout.Padding = UDim.new(0, 5)
        
        TabsTable[Button.Name] = itTabFrame
        if table.maxn(TabsTable) == 1 then switchTab(TabName) end
        Button.MouseButton1Click:Connect(function()
            switchTab(TabName)
        end)
    end
    return Windowlib
end
return lib