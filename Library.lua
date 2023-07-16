local lib = {}

function lib:CreateWindow(guiName)
    local Window = Instance.new("ScreenGui")
    local MainBackground = Instance.new("Frame", Window)
    local TopBar = Instance.new("Frame", MainBackground )
    local GuiName = Instance.new("TextLabel", TopBar)
    local shadow = Instance.new("Frame", TopBar)
    local shadow_2 = Instance.new("Frame", MainBackground)
    local TabName = Instance.new("TextLabel", TopBar)
    local Tabs = Instance.new("Frame", MainBackground)
    local List = Instance.new("Frame", Tabs)
    local UIListLayout = Instance.new("UIListLayout", List)
    local TabFrame = Instance.new("Frame", MainBackground)
    local ScrollingFrame = Instance.new("ScrollingFrame", TabFrame)
    local UIListLayout_2 = Instance.new("UIListLayout", ScrollingFrame)

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

    shadow.Name = "shadow"
    shadow.BackgroundColor3 = Color3.new(1, 1, 1)
    shadow.BorderColor3 = Color3.new(0, 0, 0)
    shadow.BorderSizePixel = 0
    shadow.Position = UDim2.new(0, 0, 0.302325577, 0)
    shadow.Size = UDim2.new(0, 550, 0, 30)

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
    Tabs.Position = UDim2.new(0, 0, 0.122857146, 0)
    Tabs.Size = UDim2.new(0, 139, 0, 275)

    List.Name = "List"
    List.BackgroundColor3 = Color3.new(1, 1, 1)
    List.BackgroundTransparency = 1
    List.BorderColor3 = Color3.new(0, 0, 0)
    List.BorderSizePixel = 0
    List.Size = UDim2.new(1, 0, 0.939999998, 0)
    List.ZIndex = 2

    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

    UIListLayout_2.Parent = ScrollingFrame
    UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout_2.Padding = UDim.new(0, 5)

    shadow_2.Name = "shadow"
    shadow_2.BackgroundColor3 = Color3.new(1, 1, 1)
    shadow_2.BorderColor3 = Color3.new(0, 0, 0)
    shadow_2.BorderSizePixel = 0
    shadow_2.Position = UDim2.new(0, 0, 0.908571422, 0)
    shadow_2.Size = UDim2.new(0, 550, 0, 20)

    Window.Parent = game.CoreGui

    local Windowlib = {}

    function Windowlib:CreatetTab(Text, Callback)
        if not (type(Callback) == "function") then Callback = function()end end
        if not (type(Text) == "string") then Text = "" end

        local Button = Instance.new("TextButton", List)
        Button.Name = Text
        Button.BackgroundColor3 = Color3.new(0.156863, 0.156863, 0.156863)
        Button.BorderColor3 = Color3.new(0.137255, 0.137255, 0.137255)
        Button.BorderSizePixel = 0
        Button.Size = UDim2.new(1.00364947, 0, 0.0196278561, 30)
        Button.AutoButtonColor = false
        Button.Font = Enum.Font.SourceSansLight
        Button.Text = "Text"
        Button.TextColor3 = Color3.new(1, 1, 1)
        Button.TextScaled = true
        Button.TextSize = 24
        Button.TextStrokeColor3 = Color3.new(1, 1, 1)
        Button.TextStrokeTransparency = 0.949999988079071
        Button.TextWrapped = true

        Button.MouseButton1Click:Connect(Callback)
    end
    return Windowlib
end

return lib