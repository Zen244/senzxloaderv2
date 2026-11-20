-- Services
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Cleanup UI lama jika ada agar tidak double
pcall(function()
    if CoreGui:FindFirstChild("SX1_Hub_UI") then
        CoreGui.SX1_Hub_UI:Destroy()
    end
end)

-- Create ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SX1_Hub_UI"
ScreenGui.ResetOnSpawn = false

if syn and syn.protect_gui then
    syn.protect_gui(ScreenGui)
    ScreenGui.Parent = CoreGui
elseif gethui then
    ScreenGui.Parent = gethui()
else
    ScreenGui.Parent = CoreGui
end

-- ==================== FLOATING TOGGLE BUTTON ====================
local FloatingButton = Instance.new("ImageButton")
FloatingButton.Name = "FloatingButton"
FloatingButton.Size = UDim2.new(0, 48, 0, 48)
FloatingButton.Position = UDim2.new(0, 20, 0.5, -24)
FloatingButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FloatingButton.Image = "rbxassetid://117711220679541"
FloatingButton.ScaleType = Enum.ScaleType.Fit
FloatingButton.AutoButtonColor = false
FloatingButton.ZIndex = 10
FloatingButton.Parent = ScreenGui

local FBCorner = Instance.new("UICorner")
FBCorner.CornerRadius = UDim.new(1, 0)
FBCorner.Parent = FloatingButton

-- ==================== MAIN WINDOW FRAME ====================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 460, 0, 265)
MainFrame.Position = UDim2.new(0.5, -230, 0.5, -132)
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = false
MainFrame.Visible = true
MainFrame.ZIndex = 1
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

-- Topbar
local Topbar = Instance.new("Frame")
Topbar.Name = "Topbar"
Topbar.Size = UDim2.new(1, 0, 0, 45)
Topbar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Topbar.BorderSizePixel = 0
Topbar.ClipsDescendants = false
Topbar.ZIndex = 20
Topbar.Parent = MainFrame

local TopbarCorner = Instance.new("UICorner")
TopbarCorner.CornerRadius = UDim.new(0, 12)
TopbarCorner.Parent = Topbar

local LogoImage = Instance.new("ImageLabel")
LogoImage.Name = "Logo"
LogoImage.Size = UDim2.new(0, 30, 0, 30)
LogoImage.Position = UDim2.new(0, 10, 0.5, -15)
LogoImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LogoImage.Image = "rbxassetid://117711220679541"
LogoImage.ScaleType = Enum.ScaleType.Fit
LogoImage.ZIndex = 22
LogoImage.Parent = Topbar

local LogoCorner = Instance.new("UICorner")
LogoCorner.CornerRadius = UDim.new(0, 6)
LogoCorner.Parent = LogoImage

local TopbarTitle = Instance.new("TextLabel")
TopbarTitle.Name = "Title"
TopbarTitle.Size = UDim2.new(1, -150, 0, 15)
TopbarTitle.Position = UDim2.new(0, 48, 0, 8)
TopbarTitle.BackgroundTransparency = 1
TopbarTitle.RichText = true
TopbarTitle.Text = "<font color=\"#9333EA\">SHENX</font> <font color=\"#000000\">MODZ</font>"
TopbarTitle.TextSize = 13
TopbarTitle.Font = Enum.Font.GothamBold
TopbarTitle.TextXAlignment = Enum.TextXAlignment.Left
TopbarTitle.ZIndex = 22
TopbarTitle.Parent = Topbar

local TopbarDesc = Instance.new("TextLabel")
TopbarDesc.Name = "Desc"
TopbarDesc.Size = UDim2.new(1, -150, 0, 12)
TopbarDesc.Position = UDim2.new(0, 48, 0, 24)
TopbarDesc.BackgroundTransparency = 1
TopbarDesc.Text = "INTERNAL 1.0"
TopbarDesc.TextColor3 = Color3.fromRGB(150, 150, 150)
TopbarDesc.TextSize = 9
TopbarDesc.Font = Enum.Font.GothamMedium
TopbarDesc.TextXAlignment = Enum.TextXAlignment.Left
TopbarDesc.ZIndex = 22
TopbarDesc.Parent = Topbar

-- Tombol Minimize / Close
local ActionCard = Instance.new("Frame")
ActionCard.Name = "ActionCard"
ActionCard.Size = UDim2.new(0, 70, 0, 30)
ActionCard.Position = UDim2.new(1, -80, 0.5, -15)
ActionCard.BackgroundColor3 = Color3.fromRGB(245, 245, 245)
ActionCard.BorderSizePixel = 0
ActionCard.ZIndex = 22
ActionCard.Parent = Topbar

local ActionCardCorner = Instance.new("UICorner")
ActionCardCorner.CornerRadius = UDim.new(0, 6)
ActionCardCorner.Parent = ActionCard

local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0.5, 0, 1, 0)
CloseButton.Position = UDim2.new(0.5, 0, 0, 0)
CloseButton.BackgroundTransparency = 1
CloseButton.Text = "✕"
CloseButton.TextColor3 = Color3.fromRGB(100, 100, 100)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 10
CloseButton.AutoButtonColor = false
CloseButton.ZIndex = 23
CloseButton.Parent = ActionCard

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Size = UDim2.new(0.5, 0, 1, 0)
MinimizeButton.Position = UDim2.new(0, 0, 0, 0)
MinimizeButton.BackgroundTransparency = 1
MinimizeButton.Text = "—"
MinimizeButton.TextColor3 = Color3.fromRGB(100, 100, 100)
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.TextSize = 10
MinimizeButton.AutoButtonColor = false
MinimizeButton.ZIndex = 23
MinimizeButton.Parent = ActionCard

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local TopbarLine = Instance.new("Frame")
TopbarLine.Size = UDim2.new(1, -20, 0, 1)
TopbarLine.Position = UDim2.new(0, 10, 1, 0)
TopbarLine.BackgroundColor3 = Color3.fromRGB(235, 235, 235)
TopbarLine.BorderSizePixel = 0
TopbarLine.ZIndex = 22
TopbarLine.Parent = Topbar

-- Sidebar Frame
local Sidebar = Instance.new("Frame")
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, 100, 1, -45)
Sidebar.Position = UDim2.new(0, 0, 0, 45)
Sidebar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Sidebar.BorderSizePixel = 0
Sidebar.ClipsDescendants = true
Sidebar.ZIndex = 15
Sidebar.Parent = MainFrame

local SidebarCorner = Instance.new("UICorner")
SidebarCorner.CornerRadius = UDim.new(0, 12)
SidebarCorner.Parent = Sidebar

-- Tab Container
local TabContainer = Instance.new("ScrollingFrame")
TabContainer.Name = "TabContainer"
TabContainer.Size = UDim2.new(1, -6, 1, -10)
TabContainer.Position = UDim2.new(0, 6, 0, 5)
TabContainer.BackgroundTransparency = 1
TabContainer.ScrollBarThickness = 0
TabContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
TabContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
TabContainer.ScrollingDirection = Enum.ScrollingDirection.Y
TabContainer.ZIndex = 16
TabContainer.Parent = Sidebar

local TabListLayout = Instance.new("UIListLayout")
TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabListLayout.Padding = UDim.new(0, 5)
TabListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
TabListLayout.Parent = TabContainer

-- Content Panel
local ContentPanel = Instance.new("Frame")
ContentPanel.Name = "ContentPanel"
ContentPanel.Size = UDim2.new(1, -100, 1, -45)
ContentPanel.Position = UDim2.new(0, 100, 0, 45)
ContentPanel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ContentPanel.BorderSizePixel = 0
ContentPanel.ClipsDescendants = false
ContentPanel.ZIndex = 2
ContentPanel.Parent = MainFrame

local ContentCorner = Instance.new("UICorner")
ContentCorner.CornerRadius = UDim.new(0, 12)
ContentCorner.Parent = ContentPanel

-- Animasi Buka & Tutup UI
local isOpen = true
local isAnimating = false

local function ToggleUI()
    if isAnimating then return end
    isAnimating = true

    if isOpen then
        isOpen = false
        local tweenInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
        
        TweenService:Create(MainFrame, tweenInfo, {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(MainFrame.Position.X.Scale, MainFrame.Position.X.Offset + 230, MainFrame.Position.Y.Scale, MainFrame.Position.Y.Offset + 132)
        }):Play()
        
        task.wait(0.25)
        MainFrame.Visible = false
        isAnimating = false
    else
        MainFrame.Visible = true
        isOpen = true
        local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
        
        MainFrame.Size = UDim2.new(0, 0, 0, 0)
        MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
        
        TweenService:Create(MainFrame, tweenInfo, {
            Size = UDim2.new(0, 460, 0, 265),
            Position = UDim2.new(0.5, -230, 0.5, -132)
        }):Play()
        
        task.wait(0.3)
        isAnimating = false
    end
end

FloatingButton.MouseButton1Click:Connect(ToggleUI)
MinimizeButton.MouseButton1Click:Connect(ToggleUI)

local function MakeDraggable(item, dragTarget)
    dragTarget = dragTarget or item
    local dragging, dragInput, dragStart, startPos

    dragTarget.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = item.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    dragTarget.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            item.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

MakeDraggable(MainFrame, Topbar)
MakeDraggable(FloatingButton)

-- ==================== LIBRARY BUILDER SYSTEM ====================
local Library = {}
local Tabs = {}
local ActiveTab = nil

function Library:AddTab(name)
    local TabButton = Instance.new("TextButton")
    TabButton.Name = name .. "_Tab"
    TabButton.Size = UDim2.new(1, 0, 0, 26)
    TabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabButton.Text = "  " .. name
    TabButton.TextColor3 = Color3.fromRGB(120, 120, 120)
    TabButton.Font = Enum.Font.GothamBold
    TabButton.TextSize = 10
    TabButton.TextXAlignment = Enum.TextXAlignment.Left
    TabButton.AutoButtonColor = false
    TabButton.ZIndex = 17
    TabButton.Parent = TabContainer

    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 6)
    ButtonCorner.Parent = TabButton

    local Indicator = Instance.new("Frame")
    Indicator.Name = "Indicator"
    Indicator.Size = UDim2.new(0, 3, 0, 14)
    Indicator.Position = UDim2.new(0, 0, 0.5, -7)
    Indicator.BackgroundColor3 = Color3.fromRGB(147, 51, 234)
    Indicator.BorderSizePixel = 0
    Indicator.Transparency = 1
    Indicator.ZIndex = 18
    Indicator.Parent = TabButton

    local IndicatorCorner = Instance.new("UICorner")
    IndicatorCorner.CornerRadius = UDim.new(1, 0)
    IndicatorCorner.Parent = Indicator

    local Page = Instance.new("Frame")
    Page.Name = name .. "_Page"
    Page.Size = UDim2.new(1, 0, 1, 0)
    Page.BackgroundTransparency = 1
    Page.Visible = false
    Page.ZIndex = 3
    Page.Parent = ContentPanel

    local PagePadding = Instance.new("UIPadding")
    PagePadding.PaddingTop = UDim.new(0, 8)
    PagePadding.PaddingLeft = UDim.new(0, 8)
    PagePadding.PaddingRight = UDim.new(0, 8)
    PagePadding.PaddingBottom = UDim.new(0, 8)
    PagePadding.Parent = Page

    local ColumnLayout = Instance.new("UIListLayout")
    ColumnLayout.SortOrder = Enum.SortOrder.LayoutOrder
    ColumnLayout.FillDirection = Enum.FillDirection.Horizontal
    ColumnLayout.Padding = UDim.new(0, 8)
    ColumnLayout.Parent = Page

    local TabObj = {}

    function TabObj:AddColumn(side)
        local ColumnCard = Instance.new("Frame")
        ColumnCard.Name = side .. "ColumnCard"
        ColumnCard.Size = UDim2.new(0.5, -4, 1, 0)
        ColumnCard.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ColumnCard.BorderSizePixel = 0
        ColumnCard.ClipsDescendants = true
        ColumnCard.ZIndex = 3
        ColumnCard.Parent = Page

        local CC_Corner = Instance.new("UICorner")
        CC_Corner.CornerRadius = UDim.new(0, 10)
        CC_Corner.Parent = ColumnCard

        local CC_Stroke = Instance.new("UIStroke")
        CC_Stroke.Color = Color3.fromRGB(230, 230, 230)
        CC_Stroke.Thickness = 1
        CC_Stroke.Parent = ColumnCard

        local Column = Instance.new("ScrollingFrame")
        Column.Name = side .. "Column"
        Column.Size = UDim2.new(1, 0, 1, 0)
        Column.BackgroundTransparency = 1
        Column.BorderSizePixel = 0
        Column.ScrollBarThickness = 2
        Column.ScrollBarImageTransparency = 1
        Column.CanvasSize = UDim2.new(0, 0, 0, 0)
        Column.AutomaticCanvasSize = Enum.AutomaticSize.Y
        Column.ScrollingDirection = Enum.ScrollingDirection.Y
        Column.ClipsDescendants = false
        Column.ZIndex = 4
        Column.Parent = ColumnCard

        local ColPadding = Instance.new("UIPadding")
        ColPadding.PaddingTop = UDim.new(0, 8)
        ColPadding.PaddingBottom = UDim.new(0, 8)
        ColPadding.PaddingRight = UDim.new(0, 8)
        ColPadding.PaddingLeft = UDim.new(0, 8)
        ColPadding.Parent = Column

        local ColLayout = Instance.new("UIListLayout")
        ColLayout.SortOrder = Enum.SortOrder.LayoutOrder
        ColLayout.Padding = UDim.new(0, 6)
        ColLayout.Parent = Column

        local ColumnObj = {}

        function ColumnObj:AddSection(titleText)
            local SectionContainer = Instance.new("Frame")
            SectionContainer.Name = titleText .. "Section"
            SectionContainer.Size = UDim2.new(1, 0, 0, 20)
            SectionContainer.BackgroundTransparency = 1
            SectionContainer.BorderSizePixel = 0
            SectionContainer.ZIndex = 5
            SectionContainer.Parent = Column

            local SectionLabel = Instance.new("TextLabel")
            SectionLabel.Name = "Label"
            SectionLabel.Size = UDim2.new(1, 0, 1, 0)
            SectionLabel.BackgroundTransparency = 1
            SectionLabel.Text = titleText
            SectionLabel.TextColor3 = Color3.fromRGB(147, 51, 234)
            SectionLabel.Font = Enum.Font.GothamBold
            SectionLabel.TextSize = 10
            SectionLabel.TextXAlignment = Enum.TextXAlignment.Left
            SectionLabel.ZIndex = 6
            SectionLabel.Parent = SectionContainer

            local SecLine = Instance.new("Frame")
            SecLine.Size = UDim2.new(1, 0, 0, 1)
            SecLine.Position = UDim2.new(0, 0, 1, 0)
            SecLine.BackgroundColor3 = Color3.fromRGB(235, 235, 235)
            SecLine.BorderSizePixel = 0
            SecLine.ZIndex = 6
            SecLine.Parent = SectionContainer
        end

        function ColumnObj:AddToggle(id, config)
            local hasDesc = config.Desc and config.Desc ~= ""
            local containerHeight = hasDesc and 32 or 26

            local ToggleContainer = Instance.new("Frame")
            ToggleContainer.Name = id .. "Toggle"
            ToggleContainer.Size = UDim2.new(1, 0, 0, containerHeight)
            ToggleContainer.BackgroundTransparency = 1
            ToggleContainer.BorderSizePixel = 0
            ToggleContainer.ZIndex = 5
            ToggleContainer.Parent = Column

            local TCText = Instance.new("TextLabel")
            TCText.Name = "Label"
            TCText.Size = UDim2.new(1, -34, 0, 14)
            TCText.Position = UDim2.new(0, 0, 0, hasDesc and 0 or 6)
            TCText.BackgroundTransparency = 1
            TCText.Text = config.Title or id
            TCText.TextColor3 = Color3.fromRGB(30, 30, 30)
            TCText.Font = Enum.Font.GothamMedium
            TCText.TextSize = 10
            TCText.TextXAlignment = Enum.TextXAlignment.Left
            TCText.ZIndex = 6
            TCText.Parent = ToggleContainer

            if hasDesc then
                local DescText = Instance.new("TextLabel")
                DescText.Name = "Desc"
                DescText.Size = UDim2.new(1, -34, 0, 12)
                DescText.Position = UDim2.new(0, 0, 0, 13)
                DescText.BackgroundTransparency = 1
                DescText.Text = config.Desc
                DescText.TextColor3 = Color3.fromRGB(140, 140, 140)
                DescText.Font = Enum.Font.GothamMedium
                DescText.TextSize = 8
                DescText.TextXAlignment = Enum.TextXAlignment.Left
                DescText.ZIndex = 6
                DescText.Parent = ToggleContainer
            end

            local PillSwitch = Instance.new("Frame")
            PillSwitch.Name = "PillSwitch"
            PillSwitch.Size = UDim2.new(0, 28, 0, 14)
            PillSwitch.Position = UDim2.new(1, -28, 0.5, -7)
            PillSwitch.BackgroundColor3 = config.Default and Color3.fromRGB(147, 51, 234) or Color3.fromRGB(215, 215, 215)
            PillSwitch.BorderSizePixel = 0
            PillSwitch.ZIndex = 6
            PillSwitch.Parent = ToggleContainer

            local PillCorner = Instance.new("UICorner")
            PillCorner.CornerRadius = UDim.new(1, 0)
            PillCorner.Parent = PillSwitch

            local PillCircle = Instance.new("Frame")
            PillCircle.Name = "Circle"
            PillCircle.Size = UDim2.new(0, 10, 0, 10)
            PillCircle.Position = config.Default and UDim2.new(1, -12, 0.5, -5) or UDim2.new(0, 2, 0.5, -5)
            PillCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            PillCircle.BorderSizePixel = 0
            PillCircle.ZIndex = 7
            PillCircle.Parent = PillSwitch

            local CircleCorner = Instance.new("UICorner")
            CircleCorner.CornerRadius = UDim.new(1, 0)
            CircleCorner.Parent = PillCircle

            local SwitchButton = Instance.new("TextButton")
            SwitchButton.Name = "Trigger"
            SwitchButton.Size = UDim2.new(1, 6, 1, 6)
            SwitchButton.Position = UDim2.new(0, -3, 0, -3)
            SwitchButton.BackgroundTransparency = 1
            SwitchButton.Text = ""
            SwitchButton.ZIndex = 8
            SwitchButton.Parent = PillSwitch

            local toggled = config.Default or false
            SwitchButton.MouseButton1Click:Connect(function()
                toggled = not toggled
                if toggled then
                    TweenService:Create(PillSwitch, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(147, 51, 234)}):Play()
                    TweenService:Create(PillCircle, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(1, -12, 0.5, -5), BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
                else
                    TweenService:Create(PillSwitch, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(215, 215, 215)}):Play()
                    TweenService:Create(PillCircle, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0, 2, 0.5, -5), BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
                end
                if config.Callback then
                    config.Callback(toggled)
                end
            end)
        end

        function ColumnObj:AddSlider(id, config)
            local min = config.Min or 0
            local max = config.Max or 100
            local default = config.Default or min
            local increment = config.Increment or 1

            local SliderContainer = Instance.new("Frame")
            SliderContainer.Name = id .. "Slider"
            SliderContainer.Size = UDim2.new(1, 0, 0, 36)
            SliderContainer.BackgroundTransparency = 1
            SliderContainer.BorderSizePixel = 0
            SliderContainer.ZIndex = 5
            SliderContainer.Parent = Column

            local SCText = Instance.new("TextLabel")
            SCText.Name = "Label"
            SCText.Size = UDim2.new(1, -38, 0, 16)
            SCText.Position = UDim2.new(0, 0, 0, 0)
            SCText.BackgroundTransparency = 1
            SCText.Text = config.Title or id
            SCText.TextColor3 = Color3.fromRGB(30, 30, 30)
            SCText.Font = Enum.Font.GothamMedium
            SCText.TextSize = 10
            SCText.TextXAlignment = Enum.TextXAlignment.Left
            SCText.ZIndex = 6
            SCText.Parent = SliderContainer

            local ValueLabel = Instance.new("TextLabel")
            ValueLabel.Name = "Value"
            ValueLabel.Size = UDim2.new(0, 38, 0, 16)
            ValueLabel.Position = UDim2.new(1, -38, 0, 0)
            ValueLabel.BackgroundTransparency = 1
            ValueLabel.Text = tostring(default)
            ValueLabel.TextColor3 = Color3.fromRGB(147, 51, 234)
            ValueLabel.Font = Enum.Font.GothamBold
            ValueLabel.TextSize = 10
            ValueLabel.TextXAlignment = Enum.TextXAlignment.Right
            ValueLabel.ZIndex = 6
            ValueLabel.Parent = SliderContainer

            local SliderBar = Instance.new("Frame")
            SliderBar.Name = "Bar"
            SliderBar.Size = UDim2.new(1, 0, 0, 5)
            SliderBar.Position = UDim2.new(0, 0, 0, 22)
            SliderBar.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
            SliderBar.BorderSizePixel = 0
            SliderBar.ZIndex = 6
            SliderBar.Parent = SliderContainer

            local SB_Corner = Instance.new("UICorner")
            SB_Corner.CornerRadius = UDim.new(1, 0)
            SB_Corner.Parent = SliderBar

            local SliderFill = Instance.new("Frame")
            SliderFill.Name = "Fill"
            SliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
            SliderFill.BackgroundColor3 = Color3.fromRGB(147, 51, 234)
            SliderFill.BorderSizePixel = 0
            SliderFill.ZIndex = 7
            SliderFill.Parent = SliderBar

            local SF_Corner = Instance.new("UICorner")
            SF_Corner.CornerRadius = UDim.new(1, 0)
            SF_Corner.Parent = SliderFill

            local SliderButton = Instance.new("TextButton")
            SliderButton.Name = "Trigger"
            SliderButton.Size = UDim2.new(1, 10, 1, 10)
            SliderButton.Position = UDim2.new(0, -5, 0, -5)
            SliderButton.BackgroundTransparency = 1
            SliderButton.Text = ""
            SliderButton.ZIndex = 8
            SliderButton.Parent = SliderBar

            local dragging = false
            local currentValue = default

            local function updateSlider(input)
                local pos = UDim2.new(math.clamp((input.Position.X - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X, 0, 1), 0, 1, 0)
                SliderFill.Size = pos
                local rawValue = min + ((max - min) * pos.X.Scale)
                currentValue = math.floor(rawValue / increment + 0.5) * increment
                currentValue = math.clamp(currentValue, min, max)
                ValueLabel.Text = tostring(currentValue)
                if config.Callback then
                    config.Callback(currentValue)
                end
            end

            SliderButton.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = true
                    updateSlider(input)
                end
            end)

            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = false
                end
            end)

            UserInputService.InputChanged:Connect(function(input)
                if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                    updateSlider(input)
                end
            end)
        end

        function ColumnObj:AddDropdown(id, config)
            local values = config.Values or {}
            local default = config.Default or values[1] or ""
            local selected = default
            local opened = false

            local calculatedHeight = #values * 22 + 6
            local maxListHeight = math.clamp(calculatedHeight, 0, 60)

            local DropdownContainer = Instance.new("Frame")
            DropdownContainer.Name = id .. "Dropdown"
            DropdownContainer.Size = UDim2.new(1, 0, 0, 26)
            DropdownContainer.BackgroundTransparency = 1
            DropdownContainer.BorderSizePixel = 0
            DropdownContainer.ClipsDescendants = true
            DropdownContainer.ZIndex = 5
            DropdownContainer.Parent = Column

            local DCText = Instance.new("TextLabel")
            DCText.Name = "Label"
            DCText.Size = UDim2.new(1, -24, 0, 26)
            DCText.Position = UDim2.new(0, 0, 0, 0)
            DCText.BackgroundTransparency = 1
            DCText.Text = (config.Title or id) .. ": " .. tostring(selected)
            DCText.TextColor3 = Color3.fromRGB(30, 30, 30)
            DCText.Font = Enum.Font.GothamMedium
            DCText.TextSize = 10
            DCText.TextXAlignment = Enum.TextXAlignment.Left
            DCText.ZIndex = 6
            DCText.Parent = DropdownContainer

            local Arrow = Instance.new("TextLabel")
            Arrow.Name = "Arrow"
            Arrow.Size = UDim2.new(0, 16, 0, 26)
            Arrow.Position = UDim2.new(1, -16, 0, 0)
            Arrow.BackgroundTransparency = 1
            Arrow.Text = "▼"
            Arrow.TextColor3 = Color3.fromRGB(130, 130, 130)
            Arrow.Font = Enum.Font.GothamBold
            Arrow.TextSize = 9
            Arrow.ZIndex = 6
            Arrow.Parent = DropdownContainer

            -- DropList background dibuat TRANSPARAN sepenuhnya sesuai permintaan
            local DropList = Instance.new("ScrollingFrame")
            DropList.Name = "List"
            DropList.Size = UDim2.new(1, 0, 0, 0)
            DropList.Position = UDim2.new(0, 0, 0, 26)
            DropList.BackgroundTransparency = 1
            DropList.BorderSizePixel = 0
            DropList.Visible = false
            DropList.ZIndex = 6
            DropList.CanvasSize = UDim2.new(0, 0, 0, 0)
            DropList.AutomaticCanvasSize = Enum.AutomaticSize.Y
            DropList.ScrollBarThickness = 2
            DropList.ScrollBarImageTransparency = 1
            DropList.ScrollingDirection = Enum.ScrollingDirection.Y
            DropList.Parent = DropdownContainer

            local DL_Layout = Instance.new("UIListLayout")
            DL_Layout.SortOrder = Enum.SortOrder.LayoutOrder
            DL_Layout.Padding = UDim.new(0, 2)
            DL_Layout.Parent = DropList

            local DropButton = Instance.new("TextButton")
            DropButton.Name = "Trigger"
            DropButton.Size = UDim2.new(1, 0, 0, 26)
            DropButton.BackgroundTransparency = 1
            DropButton.Text = ""
            DropButton.ZIndex = 7
            DropButton.Parent = DropdownContainer

            local function rebuildList()
                for _, child in ipairs(DropList:GetChildren()) do
                    if child:IsA("TextButton") then
                        child:Destroy()
                    end
                end

                for _, val in ipairs(values) do
                    local ItemBtn = Instance.new("TextButton")
                    ItemBtn.Size = UDim2.new(1, -4, 0, 22)
                    ItemBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    ItemBtn.BackgroundTransparency = 0.3 -- Dibuat agak transparan agar menyatu rapi dengan card
                    ItemBtn.BorderSizePixel = 0
                    ItemBtn.AutoButtonColor = false
                    ItemBtn.Text = "  " .. tostring(val)
                    ItemBtn.TextColor3 = (val == selected) and Color3.fromRGB(147, 51, 234) or Color3.fromRGB(60, 60, 60)
                    ItemBtn.Font = Enum.Font.GothamMedium
                    ItemBtn.TextSize = 9
                    ItemBtn.TextXAlignment = Enum.TextXAlignment.Left
                    ItemBtn.ZIndex = 8
                    ItemBtn.Parent = DropList

                    local IB_Corner = Instance.new("UICorner")
                    IB_Corner.CornerRadius = UDim.new(0, 4)
                    IB_Corner.Parent = ItemBtn

                    ItemBtn.MouseButton1Click:Connect(function()
                        selected = val
                        DCText.Text = (config.Title or id) .. ": " .. tostring(selected)
                        opened = false
                        TweenService:Create(DropdownContainer, TweenInfo.new(0.2), {Size = UDim2.new(1, 0, 0, 26)}):Play()
                        TweenService:Create(DropList, TweenInfo.new(0.2), {Size = UDim2.new(1, 0, 0, 0)}):Play()
                        task.wait(0.2)
                        DropList.Visible = false
                        Arrow.Text = "▼"
                        rebuildList()
                        if config.Callback then
                            config.Callback(selected)
                        end
                    end)
                end
            end

            rebuildList()

            DropButton.MouseButton1Click:Connect(function()
                opened = not opened
                local targetContainerHeight = opened and (26 + maxListHeight + 4) or 26

                if opened then
                    DropList.Visible = true
                    TweenService:Create(DropdownContainer, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 0, targetContainerHeight)}):Play()
                    TweenService:Create(DropList, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 0, maxListHeight)}):Play()
                    Arrow.Text = "▲"
                else
                    TweenService:Create(DropdownContainer, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 0, 26)}):Play()
                    TweenService:Create(DropList, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 0, 0)}):Play()
                    task.wait(0.2)
                    DropList.Visible = false
                    Arrow.Text = "▼"
                end
            end)
        end

        return ColumnObj
    end

    TabButton.MouseButton1Click:Connect(function()
        if ActiveTab == name then return end
        
        for tabName, btn in pairs(Tabs) do
            if tabName ~= name then
                TweenService:Create(btn, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    TextColor3 = Color3.fromRGB(120, 120, 120)
                }):Play()
                
                TweenService:Create(btn:FindFirstChild("Indicator"), TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    Transparency = 1
                }):Play()

                ContentPanel:FindFirstChild(tabName .. "_Page").Visible = false
            end
        end

        ActiveTab = name
        
        TweenService:Create(TabButton, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundColor3 = Color3.fromRGB(245, 235, 255),
            TextColor3 = Color3.fromRGB(147, 51, 234)
        }):Play()

        TweenService:Create(Indicator, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Transparency = 0
        }):Play()

        Page.Visible = true
    end)

    Tabs[name] = TabButton
    return TabObj
end

-- ==================== CONTOH CARA PEMANGGILAN FITUR ====================
local ESPTab = Library:AddTab("ESP")
local ESPLeft = ESPTab:AddColumn("Left")
local ESPRight = ESPTab:AddColumn("Right")

ESPLeft:AddSection("ESP PLAYERS")
ESPRight:AddSection("ESP SETTINGS")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

local LineConfig = {
    Enabled = false,
    Color = Color3.fromRGB(255, 0, 0),
    Origin = "Bottom", -- Options: "Top", "Center", "Bottom", "Mouse"
}

local ColorMap = {
    ["Red"] = Color3.fromRGB(255, 0, 0),
    ["Green"] = Color3.fromRGB(0, 255, 0),
    ["Blue"] = Color3.fromRGB(0, 120, 255),
    ["White"] = Color3.fromRGB(255, 255, 255),
    ["Yellow"] = Color3.fromRGB(255, 255, 0),
    ["Purple"] = Color3.fromRGB(170, 0, 255)
}

local ActiveLines = {}

local function RemoveLine(player)
    if ActiveLines[player] then
        pcall(function()
            ActiveLines[player]:Remove()
        end)
        ActiveLines[player] = nil
    end
end

RunService.RenderStepped:Connect(function()
    if not LineConfig.Enabled then
        for player, _ in pairs(ActiveLines) do
            RemoveLine(player)
        end
        return
    end

    local viewportSize = Camera.ViewportSize
    local originPoint = Vector2.new(viewportSize.X / 2, viewportSize.Y) -- Default Bottom

    if LineConfig.Origin == "Top" then
        originPoint = Vector2.new(viewportSize.X / 2, 0)
    elseif LineConfig.Origin == "Center" then
        originPoint = Vector2.new(viewportSize.X / 2, viewportSize.Y / 2)
    elseif LineConfig.Origin == "Mouse" then
        local mousePos = LocalPlayer:GetMouse()
        originPoint = Vector2.new(mousePos.X, mousePos.Y + 36) -- Offset for standard top bar
    end

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local char = player.Character
            local rootPart = char:FindFirstChild("HumanoidRootPart")
            local humanoid = char:FindFirstChildOfClass("Humanoid")

            if rootPart and humanoid and humanoid.Health > 0 then
                local vector, onScreen = Camera:WorldToViewportPoint(rootPart.Position)
                
                if onScreen then
                    if not ActiveLines[player] then
                        local line = Drawing.new("Line")
                        line.Thickness = 1.5
                        line.Transparency = 1
                        ActiveLines[player] = line
                    end

                    local line = ActiveLines[player]
                    line.Visible = true
                    line.Color = LineConfig.Color
                    line.From = originPoint
                    line.To = Vector2.new(vector.X, vector.Y)
                else
                    if ActiveLines[player] then
                        ActiveLines[player].Visible = false
                    end
                end
            else
                RemoveLine(player)
            end
        else
            RemoveLine(player)
        end
    end
end)

Players.PlayerRemoving:Connect(function(player)
    RemoveLine(player)
end)

ESPLeft:AddToggle("LineESP", {
    Title = "Esp Line",
    Desc = "Tracer lines to enemies",
    Default = false,
    Callback = function(State)
        LineConfig.Enabled = State
        print("Line ESP Status:", State)
    end
})

ESPRight:AddDropdown("LineColor", {
    Title = "Line Color",
    Values = {"Red", "Green", "Blue", "White", "Yellow", "Purple"},
    Default = "Red",
    Callback = function(Value)
        if ColorMap[Value] then
            LineConfig.Color = ColorMap[Value]
            print("Selected Line Color:", Value)
        end
    end
})

ESPRight:AddDropdown("LineOrigin", {
    Title = "Line Origin",
    Values = {"Top", "Center", "Bottom", "Mouse"},
    Default = "Bottom",
    Callback = function(Value)
        LineConfig.Origin = Value
        print("Selected Line Origin:", Value)
    end
})

local CornerConfig = {
    Enabled = false,
    Color = Color3.fromRGB(255, 0, 0),
}

local ColorMap = {
    ["Red"] = Color3.fromRGB(255, 0, 0),
    ["Green"] = Color3.fromRGB(0, 255, 0),
    ["Blue"] = Color3.fromRGB(0, 120, 255),
    ["White"] = Color3.fromRGB(255, 255, 255),
    ["Yellow"] = Color3.fromRGB(255, 255, 0),
    ["Purple"] = Color3.fromRGB(170, 0, 255)
}

local ActiveCorners = {}

local function RemoveCorner(player)
    if ActiveCorners[player] then
        for _, line in pairs(ActiveCorners[player]) do
            pcall(function()
                line:Remove()
            end)
        end
        ActiveCorners[player] = nil
    end
end

RunService.RenderStepped:Connect(function()
    if not CornerConfig.Enabled then
        for player, _ in pairs(ActiveCorners) do
            RemoveCorner(player)
        end
        return
    end

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local char = player.Character
            local rootPart = char:FindFirstChild("HumanoidRootPart")
            local head = char:FindFirstChild("Head")
            local humanoid = char:FindFirstChildOfClass("Humanoid")

            if rootPart and head and humanoid and humanoid.Health > 0 then
                -- Utilizing precise spatial boundaries for R6/R15 consistency
                local cf, size = char:GetBoundingBox()
                local topPosition = (cf + Vector3.new(0, size.Y / 2, 0)).Position
                local bottomPosition = (cf - Vector3.new(0, size.Y / 2, 0)).Position

                local topVector, topOnScreen = Camera:WorldToViewportPoint(topPosition)
                local bottomVector, bottomOnScreen = Camera:WorldToViewportPoint(bottomPosition)

                if topOnScreen or bottomOnScreen then
                    local height = math.abs(topVector.Y - bottomVector.Y)
                    local width = height / 2.2 -- Stabilized proportion ratio
                    local position = Vector2.new(topVector.X - width / 2, topVector.Y)

                    if not ActiveCorners[player] then
                        local lines = {}
                        for i = 1, 8 do
                            local l = Drawing.new("Line")
                            l.Thickness = 1.5
                            l.Transparency = 1
                            table.insert(lines, l)
                        end
                        ActiveCorners[player] = lines
                    end

                    local l = ActiveCorners[player]
                    local col = CornerConfig.Color
                    local len = math.clamp(width / 3, 4, 18)
                    local boxH = math.clamp(height, 10, 2000)
                    local boxW = math.clamp(width, 5, 1000)

                    local function drawLine(index, fromX, fromY, toX, toY)
                        local line = l[index]
                        line.Visible = true
                        line.Color = col
                        line.From = Vector2.new(fromX, fromY)
                        line.To = Vector2.new(toX, toY)
                    end

                    -- Top Left
                    drawLine(1, position.X, position.Y, position.X + len, position.Y)
                    drawLine(2, position.X, position.Y, position.X, position.Y + len)

                    -- Top Right
                    drawLine(3, position.X + boxW, position.Y, position.X + boxW - len, position.Y)
                    drawLine(4, position.X + boxW, position.Y, position.X + boxW, position.Y + len)

                    -- Bottom Left
                    drawLine(5, position.X, position.Y + boxH, position.X + len, position.Y + boxH)
                    drawLine(6, position.X, position.Y + boxH, position.X, position.Y + boxH - len)

                    -- Bottom Right
                    drawLine(7, position.X + boxW, position.Y + boxH, position.X + boxW - len, position.Y + boxH)
                    drawLine(8, position.X + boxW, position.Y + boxH, position.X + boxW, position.Y + boxH - len)
                else
                    if ActiveCorners[player] then
                        for _, line in ipairs(ActiveCorners[player]) do
                            line.Visible = false
                        end
                    end
                end
            else
                RemoveCorner(player)
            end
        else
            RemoveCorner(player)
        end
    end
end)

Players.PlayerRemoving:Connect(function(player)
    RemoveCorner(player)
end)

ESPLeft:AddToggle("CornerESP", {
    Title = "Esp Corner",
    Desc = "Corner box around enemies",
    Default = false,
    Callback = function(State)
        CornerConfig.Enabled = State
        print("Corner ESP Status:", State)
    end
})

ESPRight:AddDropdown("CornerColor", {
    Title = "Corner Color",
    Values = {"Red", "Green", "Blue", "White", "Yellow", "Purple"},
    Default = "Red",
    Callback = function(Value)
        if ColorMap[Value] then
            CornerConfig.Color = ColorMap[Value]
            print("Selected Corner Color:", Value)
        end
    end
})

local SkeletonConfig = {
    Enabled = false,
    Color = Color3.fromRGB(255, 255, 255),
}

local ColorMap = {
    ["Red"] = Color3.fromRGB(255, 0, 0),
    ["Green"] = Color3.fromRGB(0, 255, 0),
    ["Blue"] = Color3.fromRGB(0, 120, 255),
    ["White"] = Color3.fromRGB(255, 255, 255),
    ["Yellow"] = Color3.fromRGB(255, 255, 0),
    ["Purple"] = Color3.fromRGB(170, 0, 255)
}

local ActiveSkeletons = {}

-- Definition of bone connections for R15 and R6
local R15BoneStructure = {
    {"Head", "UpperTorso"},
    {"UpperTorso", "LowerTorso"},
    -- Left Arm
    {"UpperTorso", "LeftUpperArm"},
    {"LeftUpperArm", "LeftLowerArm"},
    {"LeftLowerArm", "LeftHand"},
    -- Right Arm
    {"UpperTorso", "RightUpperArm"},
    {"RightUpperArm", "RightLowerArm"},
    {"RightLowerArm", "RightHand"},
    -- Left Leg
    {"LowerTorso", "LeftUpperLeg"},
    {"LeftUpperLeg", "LeftLowerLeg"},
    {"LeftLowerLeg", "LeftFoot"},
    -- Right Leg
    {"LowerTorso", "RightUpperLeg"},
    {"RightUpperLeg", "RightLowerLeg"},
    {"RightLowerLeg", "RightFoot"}
}

local R6BoneStructure = {
    {"Head", "Torso"},
    {"Torso", "Left Arm"},
    {"Torso", "Right Arm"},
    {"Torso", "Left Leg"},
    {"Torso", "Right Leg"}
}

local function RemoveSkeleton(player)
    if ActiveSkeletons[player] then
        for _, line in pairs(ActiveSkeletons[player]) do
            pcall(function()
                line:Remove()
            end)
        end
        ActiveSkeletons[player] = nil
    end
end

RunService.RenderStepped:Connect(function()
    if not SkeletonConfig.Enabled then
        for player, _ in pairs(ActiveSkeletons) do
            RemoveSkeleton(player)
        end
        return
    end

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local char = player.Character
            local humanoid = char:FindFirstChildOfClass("Humanoid")
            local rootPart = char:FindFirstChild("HumanoidRootPart")

            if humanoid and rootPart and humanoid.Health > 0 then
                local rigType = humanoid.RigType
                local structure = (rigType == Enum.HumanoidRigType.R15) and R15BoneStructure or R6BoneStructure
                
                if not ActiveSkeletons[player] then
                    local lines = {}
                    for i = 1, #structure do
                        local l = Drawing.new("Line")
                        l.Thickness = 1.5
                        l.Transparency = 1
                        table.insert(lines, l)
                    end
                    ActiveSkeletons[player] = lines
                end

                local lines = ActiveSkeletons[player]
                local allOnScreen = true

                for i, bonePair in ipairs(structure) do
                    local partA = char:FindFirstChild(bonePair[1])
                    local partB = char:FindFirstChild(bonePair[2])
                    local line = lines[i]

                    if partA and partB and line then
                        local posA, onScreenA = Camera:WorldToViewportPoint(partA.Position)
                        local posB, onScreenB = Camera:WorldToViewportPoint(partB.Position)

                        if onScreenA or onScreenB then
                            line.Visible = true
                            line.Color = SkeletonConfig.Color
                            line.From = Vector2.new(posA.X, posA.Y)
                            line.To = Vector2.new(posB.X, posB.Y)
                        else
                            line.Visible = false
                        end
                    else
                        if line then line.Visible = false end
                    end
                end
            else
                RemoveSkeleton(player)
            end
        else
            RemoveSkeleton(player)
        end
    end
end)

Players.PlayerRemoving:Connect(function(player)
    RemoveSkeleton(player)
end)

ESPLeft:AddToggle("SkeletonESP", {
    Title = "Esp Skeletons",
    Desc = "Bone lines for R6 and R15",
    Default = false,
    Callback = function(State)
        SkeletonConfig.Enabled = State
        print("Skeleton ESP Status:", State)
    end
})

ESPRight:AddDropdown("SkeletonColor", {
    Title = "Skeleton Color",
    Values = {"Red", "Green", "Blue", "White", "Yellow", "Purple"},
    Default = "White",
    Callback = function(Value)
        if ColorMap[Value] then
            SkeletonConfig.Color = ColorMap[Value]
            print("Selected Skeleton Color:", Value)
        end
    end
})

local TROLLTab = Library:AddTab("TROLL")
local TROLLLeft = TROLLTab:AddColumn("Left")
local TROLLRight = TROLLTab:AddColumn("Right")

TROLLLeft:AddSection("TROLL PLAYERS")
TROLLRight:AddSection("TROLL SETTINGS")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local WallflingEnabled = false
local SelectedTarget = nil

TROLLLeft:AddToggle("wallfling", {
    Title = "wallfling",
    Default = false,
    Description = "Wallfling ke player yang dipilih",
    Callback = function(State)
        WallflingEnabled = State
        print("wallfling:", State)
        if not State then
            local char = LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.Velocity = Vector3.zero
                hrp.RotVelocity = Vector3.zero
            end
        end
    end
})

local playerList = {}
for _, plr in ipairs(Players:GetPlayers()) do
    if plr ~= LocalPlayer then
        table.insert(playerList, plr.Name)
    end
end

TROLLRight:AddDropdown("TargetPlayer", {
    Title = "Target Player",
    Values = playerList,
    Default = playerList[1] or "None",
    Callback = function(Value)
        SelectedTarget = Players:FindFirstChild(Value)
        print("Selected Target:", Value)
    end
})

local function refreshPlayerList()
    local newList = {}
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            table.insert(newList, plr.Name)
        end
    end
    if TROLLRight.Options and TROLLRight.Options.TargetPlayer then
        TROLLRight.Options.TargetPlayer:SetValues(newList)
    end
end

Players.PlayerAdded:Connect(refreshPlayerList)
Players.PlayerRemoving:Connect(refreshPlayerList)

RunService.Heartbeat:Connect(function()
    if not WallflingEnabled then return end

    local char = LocalPlayer.Character
    if not char then return end

    local hrp = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hrp or not hum or hum.Health <= 0 then return end

    if not SelectedTarget or not SelectedTarget.Character then
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr.Character then
                SelectedTarget = plr
                break
            end
        end
        if not SelectedTarget then return end
    end

    local targetChar = SelectedTarget.Character
    local targetHum = targetChar:FindFirstChildOfClass("Humanoid")
    local targetPart = targetChar:FindFirstChild("HumanoidRootPart")
    if not targetHum or not targetPart or targetHum.Health <= 0 then return end

    hrp.CFrame = CFrame.new(targetPart.Position)

    targetPart.Velocity = Vector3.new(99999, 99999, 99999)
    targetPart.RotVelocity = Vector3.new(99999, 99999, 99999)
end)

local OrbitEnabled = false
local SelectedTarget = nil
local orbitAngle = 0

TROLLLeft:AddToggle("orbitplayers", {
    Title = "orbitplayers",
    Default = false,
    Description = "Mutarin target di sekitar player",
    Callback = function(State)
        OrbitEnabled = State
        print("orbitplayers:", State)
        orbitAngle = 0
    end
})

local playerList = {}
for _, plr in ipairs(Players:GetPlayers()) do
    if plr ~= LocalPlayer then
        table.insert(playerList, plr.Name)
    end
end

TROLLRight:AddDropdown("OrbitTarget", {
    Title = "Target Player",
    Values = playerList,
    Default = playerList[1] or "None",
    Callback = function(Value)
        SelectedTarget = Players:FindFirstChild(Value)
        print("Selected Target:", Value)
    end
})

local function refreshPlayerList()
    local newList = {}
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            table.insert(newList, plr.Name)
        end
    end
    if TROLLRight.Options and TROLLRight.Options.OrbitTarget then
        TROLLRight.Options.OrbitTarget:SetValues(newList)
    end
end

Players.PlayerAdded:Connect(refreshPlayerList)
Players.PlayerRemoving:Connect(refreshPlayerList)

RunService.Heartbeat:Connect(function(dt)
    if not OrbitEnabled then return end

    local char = LocalPlayer.Character
    if not char then return end

    local hrp = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hrp or not hum or hum.Health <= 0 then return end

    if not SelectedTarget or not SelectedTarget.Character then
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr.Character then
                SelectedTarget = plr
                break
            end
        end
        if not SelectedTarget then return end
    end

    local targetChar = SelectedTarget.Character
    local targetHum = targetChar:FindFirstChildOfClass("Humanoid")
    local targetPart = targetChar:FindFirstChild("HumanoidRootPart")
    if not targetHum or not targetPart or targetHum.Health <= 0 then return end

    local radius = 15
    local speed = 6
    local heightOffset = 5

    orbitAngle = orbitAngle + dt * speed

    local center = hrp.Position
    local orbitPos = Vector3.new(
        center.X + math.cos(orbitAngle) * radius,
        center.Y + heightOffset,
        center.Z + math.sin(orbitAngle) * radius
    )

    targetPart.CFrame = CFrame.new(orbitPos)
    targetPart.Velocity = Vector3.zero
    targetPart.RotVelocity = Vector3.new(0, 50, 0)
end)

-- Set Tab default yang aktif pertama kali
if Tabs["ESP"] then
    Tabs["ESP"].BackgroundColor3 = Color3.fromRGB(245, 235, 255)
    Tabs["ESP"].TextColor3 = Color3.fromRGB(147, 51, 234)
    Tabs["ESP"]:FindFirstChild("Indicator").Transparency = 0
    ContentPanel:FindFirstChild("ESP_Page").Visible = true
    ActiveTab = "ESP"
end
