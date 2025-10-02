local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Lightsmoke666/LS_HubPro/refs/heads/main/windui.txt"))()

function gradient(text, startColor, endColor)
    local result = ""
    local length = #text
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r = math.floor((startColor.R + (endColor.R - startColor.R) * t) * 255)
        local g = math.floor((startColor.G + (endColor.G - startColor.G) * t) * 255)
        local b = math.floor((startColor.B + (endColor.B - startColor.B) * t) * 255)
        local char = text:sub(i, i)
        result = result .. "<font color=\"rgb(" .. r ..", " .. g .. ", " .. b .. ")\">" .. char .. "</font>"
    end
    return result
end

local openButtonColor = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromHex("#FF0000")),
    ColorSequenceKeypoint.new(0.2, Color3.fromHex("#FFA500")),
    ColorSequenceKeypoint.new(0.4, Color3.fromHex("#FFFF00")),
    ColorSequenceKeypoint.new(0.6, Color3.fromHex("#00FF00")),
    ColorSequenceKeypoint.new(0.65, Color3.fromHex("#00FFFF")),
    ColorSequenceKeypoint.new(0.8, Color3.fromHex("#0000FF")),
    ColorSequenceKeypoint.new(0.9, Color3.fromHex("#8A2BE2")),
    ColorSequenceKeypoint.new(1, Color3.fromHex("#FFFFFF"))
})

local Window = WindUI:CreateWindow({
    Title = "LS_Hub",
    Icon = "crown",
    IconThemed = true,
    Author = "By轻烟",
    Folder = "CloudHub",
    Size = UDim2.fromOffset(300, 200),
    Transparent = false,
    Theme = "Light",
    User = { Enabled = true },
    SideBarWidth = 200,
    ScrollBarEnabled = true,
    BackgroundColor3 = Color3.fromRGB(0, 0, 0)
})
Window:SetBackgroundImage("rbxassetid://127195280746735")
Window:SetBackgroundImageTransparency(0.9)

Window:EditOpenButton({
    Title = "轻烟Hub",
    Icon = "crown",
    CornerRadius = UDim.new(0, 6),
    StrokeThickness = 2,
    Theme = "Light",
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0.00, Color3.fromHex("FF0000")),
        ColorSequenceKeypoint.new(0.14, Color3.fromHex("FF7F00")),
        ColorSequenceKeypoint.new(0.28, Color3.fromHex("FFFF00")),
        ColorSequenceKeypoint.new(0.42, Color3.fromHex("00FF00")),
        ColorSequenceKeypoint.new(0.56, Color3.fromHex("0000FF")),
        ColorSequenceKeypoint.new(0.70, Color3.fromHex("4B0082")),
        ColorSequenceKeypoint.new(0.84, Color3.fromHex("9400D3")),
        ColorSequenceKeypoint.new(1.00, Color3.fromHex("FF0000"))
    }),
    Draggable = true
})

local Tabs = {
    Main = Window:Tab({ Title = "主页", Icon = "star" }),
    Player = Window:Tab({ Title = "玩家", Icon = "user" }),
    Auto = Window:Tab({ Title = "自动", Icon = "star" }),
    Collect = Window:Tab({ Title = "收集", Icon = "star" }),
    Fight = Window:Tab({ Title = "攻击", Icon = "star" }),
    ESP = Window:Tab({ Title = "透视", Icon = "star"})
}
Window:SelectTab(1)

Tabs.Main:Paragraph({
    Title = "欢迎使用轻烟ohio",
    Desc = "QQ群:1057220534",
    Image = "https://c-ssl.duitang.com/uploads/blog/202310/21/oVS4gnBVIg4A1yJ.jpg",
    ImageSize = 50,
    Thumbnail = "https://c-ssl.duitang.com/uploads/blog/202103/27/20210327131203_74b6b.jpg",
    ThumbnailSize = 130
})

Tabs.Main:Button({
    Title = "重新加载脚本",
    Callback = function()
        print("脚本重新加载中...")
    end
})

local function getServicesAndVariables()
    local success, result = pcall(function()
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local RunService = game:GetService("RunService")
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        local UserInputService = game:GetService("UserInputService")
        
        
        if not ReplicatedStorage:FindFirstChild("devv") then
            error("devv模块未找到")
        end
        
        local devvModule = require(ReplicatedStorage.devv)
        local Signal = devvModule.load("Signal")
        local item = devvModule.load("v3item")
        
        return {
            ReplicatedStorage = ReplicatedStorage,
            RunService = RunService,
            Players = Players,
            LocalPlayer = LocalPlayer,
            UserInputService = UserInputService,
            Signal = Signal,
            item = item
        }
    end)
    
    if not success then
        warn("获取服务或变量失败:", result)
        return nil
    end
    
    return result
end

local services = getServicesAndVariables()
if not services then 
    warn("初始化失败: 无法获取必要的服务")
    return 
end

local ReplicatedStorage, RunService, Players, LocalPlayer, UserInputService, Signal, item = services.ReplicatedStorage, services.RunService, services.Players, services.LocalPlayer, services.UserInputService, services.Signal, services.item
local ZDJ = false
local FDY = "Light Vest"
local Bandage = false
local ZDXG = false
local ZDuse = false
local ZDXG = false
local ZDSQ = false
local zdatm = false
local ZDYH = false
local zdkbxbx = false
local lock = false
local bxgh = false
local mngh = false
local czycj = false
local autobs = false
local autohk = false
local autolk = false
local automn = false
local autodj = false
local autojt = false
local autoqq = false
local autoblue = false
local autoluck = false
local autosd = false
-- 自动收集系统变量
local ZDSQ = false  
local autobs = false  
-- 银行相关对象
local BankDoor = game:GetService("Workspace").BankRobbery.VaultDoor
local BankCashs = game:GetService("Workspace").BankRobbery.BankCash


-- 角色初始化函数
local character, humanoid, humanoidRootPart
local function setupCharacter()
    character = LocalPlayer.Character
    if character then
        humanoid = character:WaitForChild("Humanoid")
        humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        humanoid.Died:Connect(function()
            repeat task.wait() until LocalPlayer.Character ~= nil
            setupCharacter()
        end)
    end
end

LocalPlayer.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    setupCharacter()
end)
setupCharacter()
-- 自动开保险&宝箱功能
Tabs.Auto:Toggle({
    Title = "自动开保险&宝箱",
    Desc = "",
    Value = false,
    Callback = function(v)
    zdkbxbx = v
    if zdkbxbx then
        while zdkbxbx and wait() do  
            local epoh2 = game:GetService("Players")
            local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
            local Players = game:GetService("Players")
            local localPlayer = Players.LocalPlayer
            
            if localPlayer.Character then
                local rootPart = localPlayer.Character:FindFirstChild("HumanoidRootPart")
                if rootPart then
                    -- 检查银行门是否可开启
                    if BankDoor.Door.Attachment.ProximityPrompt.Enabled then
                        BankDoor.Door.Attachment.ProximityPrompt.HoldDuration = 0
                        BankDoor.Door.Attachment.ProximityPrompt.MaxActivationDistance = 20
                        local epoh1 = CFrame.new(1071.955810546875, 9, -343.80816650390625)
                        epoh3.CFrame = epoh1
                        wait(0.3)
                        BankDoor.Door.Attachment.ProximityPrompt:InputHoldBegin()
                        wait(0.3)
                        BankDoor.Door.Attachment.ProximityPrompt:InputHoldEnd()
                    else
                        -- 搜索并开启保险箱和宝箱
                        for _, obj in ipairs(workspace.Game.Entities:GetDescendants()) do
                            if obj:IsA("ProximityPrompt") and (obj.ActionText == "Crack Chest" or obj.ActionText == "Crack Safe") and obj.Enabled then
                                if zdkbxbx then
                                    obj.RequiresLineOfSight = false
                                    obj.HoldDuration = 0 
                                    local target = obj.Parent and obj.Parent.Parent
                                    if target and target:IsA("BasePart") then
                                        local snow4 = target.CFrame * CFrame.new(0, 2, 2)
                                        local snow5 = game:GetService("Players")
                                        local snow6 = snow5.LocalPlayer.Character.HumanoidRootPart
                                        snow6.CFrame = snow4
                                        wait(0.5) 
                                        fireproximityprompt(obj) 
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end})

-- 自动购买撬锁功能
Tabs.Auto:Toggle({
    Title = "自动购买撬锁",
    Desc = "", 
    Value = false, 
    Callback = function(v)
        lock = v
        if lock then
            while lock and wait() do  
                local Players = game:GetService("Players")
                local localPlayer = Players.LocalPlayer
                if localPlayer.Character then
                    local rootPart = localPlayer.       Character:FindFirstChild("HumanoidRootPart")
                    if rootPart then
                        Signal.InvokeServer("attemptPurchase", "Lockpick")
                    end
                end
            end
        end
    end
    })

-- 保险&箱子&银行光环功能
Tabs.Auto:Toggle({
    Title = "保险&箱子&银行光环",
    Desc = "",
    Value = false,
    Callback = function(v)
    bxgh = v
    if bxgh then
        while bxgh and wait() do 
            local player = game:GetService("Players").LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local rootPart = character:FindFirstChild("HumanoidRootPart")
            
            -- 各种保险箱和宝箱的远程互动
            for _,obj in ipairs(workspace.Game.Entities.GoldJewelSafe:GetDescendants()) do 
                if obj:IsA("ProximityPrompt") and rootPart and (obj.Parent.Position - rootPart.Position).Magnitude > 35 then 
                    obj.RequiresLineOfSight = false 
                    obj.HoldDuration = 0 
                    fireproximityprompt(obj)
                end 
            end 
            
            for _,obj in ipairs(workspace.Game.Entities.SmallSafe:GetDescendants()) do 
                if obj:IsA("ProximityPrompt") and rootPart and (obj.Parent.Position - rootPart.Position).Magnitude > 35 then 
                    obj.RequiresLineOfSight = false 
                    obj.HoldDuration = 0 
                    fireproximityprompt(obj)
                end 
            end 
            
            for _,obj in ipairs(workspace.Game.Entities.SmallChest:GetDescendants()) do 
                if obj:IsA("ProximityPrompt") and rootPart and (obj.Parent.Position - rootPart.Position).Magnitude > 35 then 
                    obj.RequiresLineOfSight = false 
                    obj.HoldDuration = 0 
                    fireproximityprompt(obj)
                end 
            end 
            
            for _,obj in ipairs(workspace.Game.Entities.LargeSafe:GetDescendants()) do 
                if obj:IsA("ProximityPrompt") and rootPart and (obj.Parent.Position - rootPart.Position).Magnitude > 35 then 
                    obj.RequiresLineOfSight = false 
                    obj.HoldDuration = 0 
                    fireproximityprompt(obj)
                end 
            end 
            
            for _,obj in ipairs(workspace.Game.Entities.MediumSafe:GetDescendants()) do 
                if obj:IsA("ProximityPrompt") and rootPart and (obj.Parent.Position - rootPart.Position).Magnitude > 35 then 
                    obj.RequiresLineOfSight = false 
                    obj.HoldDuration = 0 
                    fireproximityprompt(obj)
                end 
            end 
            
            for _,obj in ipairs(workspace.Game.Entities.LargeChest:GetDescendants()) do 
                if obj:IsA("ProximityPrompt") and rootPart and (obj.Parent.Position - rootPart.Position).Magnitude > 35 then 
                    obj.RequiresLineOfSight = false 
                    obj.HoldDuration = 0 
                    fireproximityprompt(obj)
                end 
            end 
            
            for _,obj in ipairs(workspace.Game.Entities.JewelSafe:GetDescendants()) do 
                if obj:IsA("ProximityPrompt") and rootPart and (obj.Parent.Position - rootPart.Position).Magnitude > 35 then 
                    obj.RequiresLineOfSight = false 
                    obj.HoldDuration = 0 
                    fireproximityprompt(obj)
                end 
            end 
            for _,obj in ipairs(workspace.BankRobbery.VaultDoor:GetDescendants()) do 
                if obj:IsA("ProximityPrompt") and rootPart and (obj.Parent.Position - rootPart.Position).Magnitude > 35 then 
                    obj.RequiresLineOfSight = false 
                    obj.HoldDuration = 0 
                    fireproximityprompt(obj)
                end 
            end
        end
    end
end})



local qtid
if item and item.inventory and item.inventory.items then
    for i, v in next, item.inventory.items do
        if v.name == 'Fists' then
            qtid = v.guid
            break
        end
    end
end

if not qtid then
    warn("未找到拳头物品")
end

local function zdatmFunction()

    if not LocalPlayer.Character then
        return
    end
    
    local character = LocalPlayer.Character
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    local humanoid = character:FindFirstChild("Humanoid")
    
    if not humanoidRootPart or not humanoid then
        return
    end
    
    local originalWalkSpeed = humanoid.WalkSpeed
    local originalJumpPower = humanoid.JumpPower
    local originalAutoRotate = humanoid.AutoRotate
    humanoid.WalkSpeed = 0
    humanoid.JumpPower = 0
    humanoid.AutoRotate = false
    pcall(function()
        local cashBundles = workspace:FindFirstChild("Game")
        if cashBundles then
            cashBundles = cashBundles:FindFirstChild("Entities")
            if cashBundles then
                cashBundles = cashBundles:FindFirstChild("CashBundle")
                if cashBundles then
                    for _, v in pairs(cashBundles:GetDescendants()) do
                        if v:IsA("ClickDetector") then
                            local detectorPos = v.Parent:GetPivot().Position
                            local distance = (humanoidRootPart.Position - detectorPos).Magnitude
                            if distance <= 35 then
                                fireclickdetector(v)
                            end
                        end
                    end
                end
            end
        end
    end)
    pcall(function()
        local atmContainer = workspace:FindFirstChild("Game")
        if atmContainer then
            atmContainer = atmContainer:FindFirstChild("Props")
            if atmContainer then
                atmContainer = atmContainer:FindFirstChild("ATM")
                if atmContainer then
                    for _, v in ipairs(atmContainer:GetChildren()) do
                        if v:IsA("Model") and (v:GetAttribute("health") or 0) > 0 then
                            local currentATM = v
                            local ATMguid = currentATM:GetAttribute("guid")
                            local pos = currentATM:GetPivot().Position
                            
                            humanoidRootPart.CFrame = CFrame.new(pos.x, pos.y - 5, pos.z) 
                            humanoidRootPart.Anchored = true
                            
                            local distance = (humanoidRootPart.Position - pos).Magnitude
                            if distance <= 40 and qtid then
                                local hitATM = {
                                    meleeType = "meleepunch",
                                    guid = ATMguid
                                }
                                Signal.FireServer("equip", qtid)
                                Signal.FireServer("meleeItemHit", "prop", hitATM)
                            end
humanoidRootPart.Anchored = false
                            break
                        end
                    end
                end
            end
        end
    end)
    pcall(function()
        humanoid.WalkSpeed = originalWalkSpeed
        humanoid.JumpPower = originalJumpPower
        humanoid.AutoRotate = originalAutoRotate
    end)
end

local function teleportToATM()
    if not lastATM or not lastATM.position then
        return false
    end
    
    local character, humanoidRootPart = getCharacterSafely()
    if not character or not humanoidRootPart then
        return false
    end
    
    local offset = Vector3.new(2, 2, 0) 
    local targetPosition = lastATM.position + offset
    
    pcall(function()
        humanoidRootPart.CFrame = CFrame.new(targetPosition, lastATM.position)
    end)
    
    return true
end
local atmThread = nil
Tabs.Auto:Toggle({
    Title = "自动打ATM", 
    Desc = "带智能回传功能",
    Value = false,
    Callback = function(isEnabled)
        if isEnabled then
    
            local originalPosition
            local Players = game:GetService("Players")
            local localPlayer = Players.LocalPlayer
            local atmActive = true
            
            if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
                originalPosition = localPlayer.Character.HumanoidRootPart.CFrame
                print("📌 ATM功能：初始位置已保存")
            end
            
          
            local function teleportBack()
                if originalPosition and localPlayer.Character then
                    local rootPart = localPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if rootPart then
                        rootPart.CFrame = originalPosition
                        print("🔙 ATM功能：已传送回初始位置")
                        return true
                    end
                end
                return false
            end
            
     
            local function checkATMStatus()
                local foundATM = false
                local atmCount = 0
                
                pcall(function()
                    local atmContainer = workspace:FindFirstChild("Game")
                    if atmContainer then
                        atmContainer = atmContainer:FindFirstChild("Props")
                        if atmContainer then
                            atmContainer = atmContainer:FindFirstChild("ATM")
                            if atmContainer then
                                for _, v in ipairs(atmContainer:GetChildren()) do
                                    if v:IsA("Model") and (v:GetAttribute("health") or 0) > 0 then
                                        foundATM = true
                                        atmCount = atmCount + 1
                                    end
                                end
                            end
                        end
                    end
                end)
                
                return foundATM, atmCount
            end
            
            atmThread = task.spawn(function()
                local consecutiveNoATM = 0
                local lastATMState = true
                
                while atmActive do
                
                    local foundATM, atmCount = checkATMStatus()
                    
                    if foundATM then
                    
                        zdatmFunction()
                        consecutiveNoATM = 0
                        if not lastATMState then
                            print("🎯 发现 " .. atmCount .. " 个ATM，开始攻击...")
                            lastATMState = true
                        end
                    else
                   
                        consecutiveNoATM = consecutiveNoATM + 1
                        if lastATMState then
                            print("❌ 未找到可攻击的ATM")
                            lastATMState = false
                        end
                        
                      
                        if consecutiveNoATM >= 3 then
                            print("🔙 长时间未找到ATM，传送回安全位置...")
                            teleportBack()
                            consecutiveNoATM = 0
                            task.wait(3) -- 回传后等待3秒再继续检测
                        else
                            -- 短暂等待后继续检测
                            task.wait(1)
                        end
                    end
                    
                    task.wait(0.5) -- 检测间隔
                end
            end)
        else
            atmActive = false
            if atmThread then
                task.cancel(atmThread)
                atmThread = nil
                
                -- 关闭功能时回传
                local Players = game:GetService("Players")
                local localPlayer = Players.LocalPlayer
                if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    local rootPart = localPlayer.Character.HumanoidRootPart
                    -- 可以在这里添加关闭时的特定位置回传
                    print("❌ ATM功能已关闭，角色保持在当前位置")
                end
            end
        end
    end
})
local lastATM = nil

local function getCharacterSafely()
    local character = LocalPlayer.Character
    if not character then return nil, nil end
    
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    local humanoid = character:FindFirstChild("Humanoid")
    
    return character, humanoidRootPart, humanoid
end


Tabs.Auto:Toggle({
    Title = "自动抢银行", 
    Value = false,
    Callback = function(isEnabled)
        ZDYH = isEnabled
        if isEnabled then
            task.spawn(function()
                while ZDYH do
                    local character, humanoidRootPart, humanoid = getCharacterSafely()
                    if character and humanoidRootPart and humanoid then
                        local BankDoor = workspace:FindFirstChild("BankRobbery")
                        if BankDoor then
                            BankDoor = BankDoor:FindFirstChild("VaultDoor")
                            local BankCashs = workspace:FindFirstChild("BankRobbery")
                            if BankCashs then
                                BankCashs = BankCashs:FindFirstChild("BankCash")
                                
                                if BankDoor and BankDoor.Door.Attachment.ProximityPrompt.Enabled then
                                    BankDoor.Door.Attachment.ProximityPrompt.HoldDuration = 0
                                    BankDoor.Door.Attachment.ProximityPrompt.MaxActivationDistance = 20
                                    
                                    local epoh1 = CFrame.new(1071.955810546875, 9, -343.80816650390625)
                                    humanoidRootPart.CFrame = epoh1
                                    task.wait(0.3)
                                    
                                    BankDoor.Door.Attachment.ProximityPrompt:InputHoldBegin()
                                    task.wait(0.3)
                                    BankDoor.Door.Attachment.ProximityPrompt:InputHoldEnd()
                                elseif BankCashs and BankCashs.Cash:FindFirstChild("Bundle") then
                                    humanoidRootPart.CFrame = CFrame.new(1055.94153, 3, -344.58374)
                                    if BankCashs.Main.Attachment then
                                        BankCashs.Main.Attachment.ProximityPrompt.MaxActivationDistance = 20
                                        
                                        for _, obj in ipairs(BankCashs:GetDescendants()) do
                                            if obj:IsA("ProximityPrompt") then
                                                obj.RequiresLineOfSight = false
                                                obj.HoldDuration = 0
                                                fireproximityprompt(obj)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                    task.wait(0.5)
                end
            end)
        end
    end
})
---杀戮功能by轻烟
local autokill = false 
local autostomp = false 
local grabplay = false 
local hitMOD = "meleepunch" 
local qtid
if item and item.inventory and item.inventory.items then
    for i, v in next, item.inventory.items do
        if v.name == 'Fists' then
            qtid = v.guid
            break
        end
    end
end

if not qtid then
    warn("未找到拳头物品")
end

Tabs.Fight:Dropdown({
    Title = "攻击方式",
    Desc = "点一下才会生效",
    Values = {"重拳", "轻拳"},
    Value = "重拳",
    Callback = function(value)
        if value == "重拳" then
            hitMOD = "meleemegapunch"
        elseif value == "轻拳" then
            hitMOD = "meleepunch"
        end
        print("✅ 选择成功:")
        print("   选择的攻击方式:", value)
        print("   设置的hitMOD:", hitMOD)
    end
})

-- 杀戮光环
Tabs.Fight:Toggle({
    Title = "杀戮光环", 
    Value = false,
    Callback = function(isEnabled)
        autokill = isEnabled  
    end
})

-- 踩踏光环
Tabs.Fight:Toggle({
    Title = "踩踏光环", 
    Value = false,
    Callback = function(isEnabled)
        autostomp = isEnabled  
    end
})

-- 抓取光环
Tabs.Fight:Toggle({
    Title = "抓取光环", 
    Value = false,
    Callback = function(isEnabled)
        grabplay = isEnabled  
    end
})

Tabs.Fight:Dropdown({
    Title = "选择护甲",
    Desc = "点一下才会生效",
    Values = {"轻型护甲100", "重型护甲2000", "军用护甲3500", "EOD护甲7500"},
    Value = "轻型护甲100",
    Callback = function(value)
        if value == "轻型护甲100" then
            FDY = "Light Vest"
        elseif value == "重型护甲2000" then
            FDY = "Heavy Vest"
        elseif value == "军用护甲3500" then
            FDY = "Military Vest"
        elseif value == "EOD护甲7500" then
            FDY = "EOD Vest"
        end
        print("✅ 选择成功:")
        print("   选择的护甲类型:", value)
        print("   设置的FDY:", FDY)
    end
})

-- 自动穿甲功能
Tabs.Fight:Toggle({
    Title = "自动穿甲",
    Desc = "自动穿戴选择的护甲",
    Value = false,
    Callback = function(state)
        ZDJ = state
        if ZDJ then
            while ZDJ and wait() do
                -- 尝试购买护甲
                Signal.InvokeServer("attemptPurchase", FDY)
                
                -- 查找并装备护甲
                for i, v in next, item.inventory.items do
                    if v.name == FDY then
                        local light = v.guid
                        local armor = LocalPlayer:GetAttribute('armor')
                        
                        -- 检查是否需要穿甲（没有护甲或护甲值为0）
                        if armor == nil or armor <= 0 then
                            Signal.FireServer("equip", light)
                            Signal.FireServer("useConsumable", light)
                            Signal.FireServer("removeItem", light)
                            break
                        end
                    end
                end
            end
        end
    end
})

-- 自动回血功能
Tabs.Fight:Toggle({
    Title = "自动回血",
    Desc = "使用绷带自动回血",
    Value = false,
    Callback = function(state)
        Bandage = state
        if Bandage then
            while Bandage and wait() do
                -- 尝试购买绷带
                Signal.InvokeServer("attemptPurchase", 'Bandage')
                
                -- 查找并使用绷带
                for i, v in next, item.inventory.items do
                    if v.name == 'Bandage' then
                        local bande = v.guid
                        local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                        local humanoid = character:WaitForChild('Humanoid')
                        
                        -- 检查是否需要回血（血量不满）
                        if humanoid.Health < humanoid.MaxHealth then
                            Signal.FireServer("equip", bande)
                            Signal.FireServer("useConsumable", bande)
                            Signal.FireServer("removeItem", bande)
                            break
                        end
                    end
                end
            end
        end
    end
})

Tabs.Fight:Button({
    Title = "检查护甲状态",
    Desc = "显示当前护甲和血量信息",
    Callback = function()
        local armor = LocalPlayer:GetAttribute('armor') or 0
        local character = LocalPlayer.Character
        local health = 0
        local maxHealth = 0
        
        if character and character:FindFirstChild("Humanoid") then
            health = character.Humanoid.Health
            maxHealth = character.Humanoid.MaxHealth
        end
        
        local statusIcon = "shield"
        local statusColor = Color3.fromRGB(0, 255, 0) 
        
        if armor <= 0 then
            statusIcon = "alert-circle"
            statusColor = Color3.fromRGB(255, 0, 0)    
        elseif armor < 1000 then
            statusIcon = "shield"
            statusColor = Color3.fromRGB(255, 165, 0)  
        end
        
        -- 血量状态判断
        local healthPercent = (health / maxHealth) * 100
        if healthPercent < 30 then
            statusIcon = "heart"
            statusColor = Color3.fromRGB(255, 0, 0)   
        elseif healthPercent < 70 then
            statusIcon = "heart"
            statusColor = Color3.fromRGB(255, 165, 0)  
        end
        
    
        Window:Notify({
            Title = "🛡️ 角色状态检查",
            Desc = string.format("🔸 护甲值: %d\n❤️ 血量: %d/%d\n🎯 护甲类型: %s\n📊 血量百分比: %.1f%%", 
                                armor, math.floor(health), math.floor(maxHealth), 
                                FDY, healthPercent),
            Duration = 10, 
            Callback = function()
                print("✅ 状态信息已显示")
            end
        })
        
      
        if armor <= 0 then
            task.wait(2) 
            Window:Notify({
                Title = "⚠️ 护甲建议",
                Desc = "检测到您没有护甲，建议开启自动穿甲功能！",
                Duration = 6,
                Callback = function()
                    print("🔔 护甲建议已显示")
                end
            })
        end
        
        if healthPercent < 50 then
            task.wait(4)  -- 等待4秒后显示建议
            Window:Notify({
                Title = "💊 血量建议", 
                Desc = "您的血量较低，建议开启自动回血功能！",
                Duration = 6,
                Callback = function()
                    print("🔔 血量建议已显示")
                end
            })
        end
    end
})

RunService.Heartbeat:Connect(function()
    pcall(function()
        local character = LocalPlayer.Character
        if not character then return end
        
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        local humanoid = character:FindFirstChild("Humanoid")
        
        if not rootPart or not humanoid or humanoid.Health <= 0 then
            return
        end

        -- 杀
        if autokill then
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    local targetChar = player.Character
                    local targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
                    local targetHumanoid = targetChar:FindFirstChild("Humanoid")
                    
                    if targetHRP and targetHumanoid and targetHumanoid.Health > 0 then
                        local distance = (rootPart.Position - targetHRP.Position).Magnitude
                        if distance <= 45 then
                            local uid = player.UserId
                            Signal.FireServer("equip", qtid)
                            Signal.FireServer("meleeItemHit", "player", { 
                                hitPlayerId = uid, 
                                meleeType = hitMOD 
                            })
                            break
                        end
                    end
                end
            end
        end

        -- 踩
        if autostomp then
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    local targetChar = player.Character
                    local targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
                    local targetHumanoid = targetChar:FindFirstChild("Humanoid")
                    
                    if targetHRP and targetHumanoid and targetHumanoid.Health < 20 then
                        local distance = (rootPart.Position - targetHRP.Position).Magnitude
                        if distance <= 45 then
                            Signal.FireServer("stomp", player)
                            break
                        end
                    end
                end
            end
        end

        -- 抓
        if grabplay then
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    local targetChar = player.Character
                    local targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
                    local targetHumanoid = targetChar:FindFirstChild("Humanoid")
                    
                    if targetHRP and targetHumanoid and targetHumanoid.Health < 20 then
                        local distance = (rootPart.Position - targetHRP.Position).Magnitude
                        if distance <= 40 then
                            Signal.FireServer("grabPlayer", player)
                            break
                        end
                    end
                end
            end
        end
    end)
end)

----速度
local speed = 1
local tpEnabled = true
local heartbeatConnection = nil
local character, humanoid
local jumpConnection = nil
local teleportLoop = nil
local function isFriend(targetPlayer)
    return LocalPlayer:IsFriendsWith(targetPlayer.UserId)
end
local function teleportBehindTarget(targetPlayer)
    local targetCharacter = targetPlayer.Character
    if not targetCharacter then return end
    if targetCharacter:FindFirstChild('ForceField') or isFriend(targetPlayer) then return end
    
    local targetRoot = targetCharacter:FindFirstChild("HumanoidRootPart")
    local localCharacter = LocalPlayer.Character
    local localRoot = localCharacter and localCharacter:FindFirstChild("HumanoidRootPart")
    
    if targetRoot and localRoot then
        local behindCFrame = targetRoot.CFrame * CFrame.new(0, 0, 3)
        localRoot.CFrame = behindCFrame
    end
end


---传送
local teleportEnabled = false
local originalPosition = nil  -- 保存原始位置

local function startTeleportLoop()
    -- 保存当前位置
    local character = LocalPlayer.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        originalPosition = character.HumanoidRootPart.CFrame
    end
    
    teleportEnabled = true
    if teleportLoop then 
        teleportLoop:Disconnect()
        teleportLoop = nil
    end
    
    teleportLoop = RunService.Heartbeat:Connect(function()
        if not teleportEnabled then 
            teleportLoop:Disconnect()
            teleportLoop = nil
            return 
        end
        
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and teleportEnabled then
                teleportBehindTarget(player)
                task.wait(0.1)
            end
        end
    end)
end

local function stopTeleportLoop()
    teleportEnabled = false
    if teleportLoop then 
        teleportLoop:Disconnect()
        teleportLoop = nil
    end
    
    -- 传送回原始位置
    if originalPosition then
        local character = LocalPlayer.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = originalPosition
            print("已传送回原始位置")
        end
        originalPosition = nil  -- 清除保存的位置
    end
end

-----
local function setupCharacter()
    character = LocalPlayer.Character
    if character then
        humanoid = character:WaitForChild("Humanoid")
        humanoid.Died:Connect(function()
            repeat task.wait() until LocalPlayer.Character ~= nil
            setupCharacter()
            if tpEnabled then 
                startTPWalk()
            end
        end)
    end
end
local function startTPWalk()
    if heartbeatConnection then 
        heartbeatConnection:Disconnect()
    end
    heartbeatConnection = RunService.Heartbeat:Connect(function()
        if not tpEnabled or not character or not humanoid or humanoid.Health <= 0 then 
            return 
        end
        if humanoid.MoveDirection.Magnitude > 0 then
            local currentCFrame = character.PrimaryPart.CFrame
            local newPosition = currentCFrame.Position + (humanoid.MoveDirection * speed)
            character:SetPrimaryPartCFrame(CFrame.new(newPosition) * currentCFrame.Rotation)
        end
    end)
end
local function stopTPWalk()
    if heartbeatConnection then 
        heartbeatConnection:Disconnect()
        heartbeatConnection = nil
    end
end
LocalPlayer.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    setupCharacter()
end)
setupCharacter()


local function enableESP()
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local LocalPlayer = Players.LocalPlayer
    local LocalCharacter = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local LocalHead = LocalCharacter:WaitForChild("Head")
    local playerConnections = {}
    
    -- 可自定义的配置变量
    local ESPConfig = {
        enabled = true,
        showName = true,
        showHealth = true,
        showDistance = true,
        textColor = Color3.new(1, 0, 0),  -- 红色
        fontSize = 8,
        fontStyle = Enum.Font.GothamBold,
        showBackground = false,
        backgroundColor = Color3.new(0, 0, 0),
        backgroundTransparency = 0.5
    }
    
    local function updateNametag(player, textLabel, head)
        if not ESPConfig.enabled then
            textLabel.Visible = false
            return
        end
        
        local character = player.Character
        if not character then return end
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        local targetHead = character:FindFirstChild("Head")
        if humanoid and targetHead and humanoid.Health > 0 then
            local distance = (LocalHead.Position - targetHead.Position).Magnitude
            
            -- 构建显示文本
            local textParts = {}
            if ESPConfig.showName then
                table.insert(textParts, player.Name)
            end
            if ESPConfig.showHealth then
                table.insert(textParts, string.format("血量: %d/%d", math.floor(humanoid.Health), math.floor(humanoid.MaxHealth)))
            end
            if ESPConfig.showDistance then
                table.insert(textParts, string.format("距离: %.1fm", distance))
            end
            
            textLabel.Text = table.concat(textParts, "\n")
            textLabel.Visible = true
        else
            textLabel.Visible = false
        end
    end
   
    local function createNametag(player)
        if player == LocalPlayer then return end
        playerConnections[player] = {}
        
        local function setupCharacter(character)
            local head = character:WaitForChild("Head")
            local billboard = Instance.new("BillboardGui")
            billboard.Name = "PlayerNametag"
            billboard.Adornee = head
            billboard.Size = UDim2.new(0, 200, 0, 80)
            billboard.StudsOffset = Vector3.new(0, 3, 0)
            billboard.AlwaysOnTop = true
            billboard.Parent = head
            
            local textLabel = Instance.new("TextLabel")
            textLabel.Size = UDim2.new(1, 0, 1, 0)
            textLabel.Font = ESPConfig.fontStyle
            textLabel.TextSize = ESPConfig.fontSize
            textLabel.TextColor3 = ESPConfig.textColor
            textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
            textLabel.TextStrokeTransparency = 0.3
            textLabel.BackgroundTransparency = ESPConfig.showBackground and ESPConfig.backgroundTransparency or 1
            textLabel.BackgroundColor3 = ESPConfig.backgroundColor
            textLabel.TextYAlignment = Enum.TextYAlignment.Top
            textLabel.Parent = billboard
            
            local heartbeatConn = RunService.Heartbeat:Connect(function()
                if not character or not character.Parent then
                    heartbeatConn:Disconnect()
                    return
                end
                updateNametag(player, textLabel, head)
            end)
            table.insert(playerConnections[player], heartbeatConn)
            
            local characterRemovedConn
            characterRemovedConn = character.AncestryChanged:Connect(function(_, parent)
                if parent == nil then
                    billboard:Destroy()
                    heartbeatConn:Disconnect()
                    characterRemovedConn:Disconnect()
                end
            end)
            table.insert(playerConnections[player], characterRemovedConn)
        end
        
        if player.Character then
            setupCharacter(player.Character)
        end
        
        local charAddedConn = player.CharacterAdded:Connect(setupCharacter)
        table.insert(playerConnections[player], charAddedConn)
    end
    
    local function removeNametag(player)
        if playerConnections[player] then
            for _, conn in ipairs(playerConnections[player]) do
                conn:Disconnect()
            end
            playerConnections[player] = nil
        end
        if player.Character then
            local head = player.Character:FindFirstChild("Head")
            if head then
                local nametag = head:FindFirstChild("PlayerNametag")
                if nametag then
                    nametag:Destroy()
                end
            end
        end
    end
    
    local function refreshAllNametags()
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                removeNametag(player)
                createNametag(player)
            end
        end
    end
    
    Players.PlayerAdded:Connect(function(player)
        createNametag(player)
        local leavingConn
        leavingConn = player.AncestryChanged:Connect(function(_, parent)
            if parent == nil then
                removeNametag(player)
                leavingConn:Disconnect()
            end
        end)
    end)
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            createNametag(player)
            local leavingConn
            leavingConn = player.AncestryChanged:Connect(function(_, parent)
                if parent == nil then
                    removeNametag(player)
                    leavingConn:Disconnect()
                end
            end)
        end
    end
   
    LocalPlayer.CharacterAdded:Connect(function(character)
        LocalCharacter = character
        LocalHead = character:WaitForChild("Head")
    end)
    
    -- 返回配置表，用于外部修改
    return ESPConfig, refreshAllNametags
end

-- 使用示例
local ESPConfig, refreshESP = enableESP()

-- 添加控制按钮
Tabs.ESP:Button({
    Title = "开启透视ESP",
    Callback = function()
        enableESP()
    end
})

Tabs.ESP:Toggle({
    Title = "显示玩家名称",
    Default = true,
    Callback = function(value)
        ESPConfig.showName = value
        refreshESP()
    end
})

Tabs.ESP:Toggle({
    Title = "显示血量",
    Default = true,
    Callback = function(value)
        ESPConfig.showHealth = value
        refreshESP()
    end
})

Tabs.ESP:Toggle({
    Title = "显示距离",
    Default = true,
    Callback = function(value)
        ESPConfig.showDistance = value
        refreshESP()
    end
})

Tabs.ESP:Toggle({
    Title = "显示背景",
    Default = false,
    Callback = function(value)
        ESPConfig.showBackground = value
        refreshESP()
    end
})

Tabs.ESP:Dropdown({
    Title = "字体大小",
    Values = {"6", "8", "10", "12", "14", "16"},
    Value = "8",
    Callback = function(value)
        ESPConfig.fontSize = tonumber(value)
        refreshESP()
    end
})

Tabs.ESP:Dropdown({
    Title = "字体样式",
    Values = {"GothamBold", "SourceSansBold", "ArialBold", "Code"},
    Value = "GothamBold",
    Callback = function(value)
        ESPConfig.fontStyle = Enum.Font[value]
        refreshESP()
    end
})

Tabs.ESP:Dropdown({
    Title = "文字颜色",
    Values = {"红色", "绿色", "蓝色", "黄色", "白色", "紫色"},
    Value = "红色",
    Callback = function(value)
        local colors = {
            ["红色"] = Color3.new(1, 0, 0),
            ["绿色"] = Color3.new(0, 1, 0),
            ["蓝色"] = Color3.new(0, 0, 1),
            ["黄色"] = Color3.new(1, 1, 0),
            ["白色"] = Color3.new(1, 1, 1),
            ["紫色"] = Color3.new(1, 0, 1)
        }
        ESPConfig.textColor = colors[value]
        refreshESP()
    end
})

Tabs.ESP:Button({
    Title = "刷新ESP",
    Callback = function()
        refreshESP()
    end
})

Tabs.ESP:Button({
    Title = "关闭ESP",
    Callback = function()
        ESPConfig.enabled = false
        refreshESP()
    end
})

Tabs.ESP:Button({
    Title = "开启ESP",
    Callback = function()
        ESPConfig.enabled = true
        refreshESP()
    end
})

Tabs.Player:Input({
    Title = "速度设置",
    Default = "1",
    PlaceholderText = "输入速度 (1-15)",
    Callback = function(value)
        local numValue = tonumber(value)
        if numValue and numValue >= 1 and numValue <= 15 then
            speed = numValue
            print("速度设置为:", speed)
        else
            warn("请输入1-15之间的数字")
        end
    end
})

Tabs.Player:Toggle({
    Title = "速度开关",
    Value = false,
    Callback = function(value)
        tpEnabled = value
        if value then
            startTPWalk()
        else
            stopTPWalk()
        end
    end
})

Tabs.Player:Toggle({
    Title = "连跳",
    Value = false,
    Callback = function(value)
        if value then
            -- 添加安全检查
            if not humanoid then
                local character = LocalPlayer.Character
                if character then
                    humanoid = character:FindFirstChild("Humanoid")
                end
            end
            
            if humanoid then
                jumpConnection = UserInputService.JumpRequest:Connect(function()
                    if humanoid and humanoid.Health > 0 then
                        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                    end
                end)
            else
                warn("未找到Humanoid，无法开启连跳")
            end
        else
            if jumpConnection then
                jumpConnection:Disconnect()
                jumpConnection = nil
            end
        end
    end
})

-- 传送功能变量
local teleportEnabled = false
local selectedPlayer = nil
local originalPosition = nil

-- 获取玩家列表函数
local function getPlayerList()
    local playerList = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            table.insert(playerList, player.Name)
        end
    end
    return playerList
end

-- 传送到特定玩家背后
local function teleportToPlayer(player)
    if not player or not player.Character then return end
    
    local targetCharacter = player.Character
    local targetRoot = targetCharacter:FindFirstChild("HumanoidRootPart")
    local localCharacter = LocalPlayer.Character
    local localRoot = localCharacter and localCharacter:FindFirstChild("HumanoidRootPart")
    
    if targetRoot and localRoot then
        local behindCFrame = targetRoot.CFrame * CFrame.new(0, 0, 3)
        localRoot.CFrame = behindCFrame
        return true
    end
    return false
end

-- 开始传送到选定玩家
local function startSelectedPlayerTeleport()
    if not selectedPlayer then
        Window:Notify({
            Title = "⚠️ 传送失败",
            Desc = "请先选择要传送的玩家！",
            Duration = 5
        })
        return
    end
    
    -- 保存当前位置
    local character = LocalPlayer.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        originalPosition = character.HumanoidRootPart.CFrame
    end
    
    teleportEnabled = true
    if teleportLoop then 
        teleportLoop:Disconnect()
        teleportLoop = nil
    end
    
    teleportLoop = RunService.Heartbeat:Connect(function()
        if not teleportEnabled or not selectedPlayer then 
            if teleportLoop then
                teleportLoop:Disconnect()
                teleportLoop = nil
            end
            return 
        end
        
        local success = teleportToPlayer(selectedPlayer)
        if not success then
            Window:Notify({
                Title = "⚠️ 传送中断",
                Desc = "目标玩家不存在或无法传送",
                Duration = 5
            })
            stopTeleportLoop()
        end
        
        task.wait(0.1)
    end)
    
    Window:Notify({
        Title = "🎯 传送已启动",
        Desc = "正在传送到: " .. selectedPlayer.Name,
        Duration = 5
    })
end

-- 停止传送
local function stopTeleportLoop()
    teleportEnabled = false
    if teleportLoop then 
        teleportLoop:Disconnect()
        teleportLoop = nil
    end
    
    -- 传送回原始位置
    if originalPosition then
        local character = LocalPlayer.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = originalPosition
            Window:Notify({
                Title = "🔙 已返回",
                Desc = "传送回原始位置",
                Duration = 3
            })
        end
        originalPosition = nil
    end
end

-- 玩家选择下拉框
Tabs.Player:Dropdown({
    Title = "选择传送目标",
    Desc = "选择要传送的玩家",
    Values = getPlayerList(),
    Value = "",
    Callback = function(selectedName)
        for _, player in ipairs(Players:GetPlayers()) do
            if player.Name == selectedName then
                selectedPlayer = player
                Window:Notify({
                    Title = "✅ 目标已选择",
                    Desc = "已选择玩家: " .. selectedName,
                    Duration = 3
                })
                break
            end
        end
    end
})

-- 刷新玩家列表按钮
Tabs.Player:Button({
    Title = "刷新玩家列表",
    Desc = "更新在线玩家列表",
    Callback = function()
        local playerList = getPlayerList()
        -- 这里需要根据WindUI的API来更新下拉框
        -- 如果WindUI支持动态更新，可以使用相应的方法
        Window:Notify({
            Title = "🔄 列表已刷新",
            Desc = "玩家列表已更新，当前在线: " .. #playerList .. "人",
            Duration = 3
        })
    end
})

-- 单个玩家传送开关
Tabs.Player:Toggle({
    Title = "传送到选定玩家",
    Desc = "持续传送到选择的玩家背后",
    Value = false,
    Callback = function(value)
        if value then
            startSelectedPlayerTeleport()
        else
            stopTeleportLoop()
        end
    end
})

-- 快速传送到选定玩家（单次）
Tabs.Player:Button({
    Title = "快速传送",
    Desc = "单次传送到选定玩家",
    Callback = function()
        if not selectedPlayer then
            Window:Notify({
                Title = "⚠️ 传送失败",
                Desc = "请先选择要传送的玩家！",
                Duration = 5
            })
            return
        end
        
        local success = teleportToPlayer(selectedPlayer)
        if success then
            Window:Notify({
                Title = "✅ 传送成功",
                Desc = "已传送到: " .. selectedPlayer.Name,
                Duration = 3
            })
        else
            Window:Notify({
                Title = "❌ 传送失败",
                Desc = "无法传送到目标玩家",
                Duration = 5
            })
        end
    end
})

-- 所有玩家循环传送（原功能）
Tabs.Player:Toggle({
    Title = "传送背后循环",
    Desc = "循环传送到所有玩家背后",
    Value = false,
    Callback = function(value)
        if value then
            startTeleportLoop()
        else
            stopTeleportLoop()
        end
    end
})

-- 玩家加入/离开自动更新
Players.PlayerAdded:Connect(function(player)
    Window:Notify({
        Title = "👤 玩家加入",
        Desc = player.Name .. " 加入了游戏",
        Duration = 3
    })
end)

Players.PlayerRemoving:Connect(function(player)
    if player == selectedPlayer then
        selectedPlayer = nil
        if teleportEnabled then
            stopTeleportLoop()
        end
        Window:Notify({
            Title = "🚪 目标玩家离开",
            Desc = player.Name .. " 已离开游戏，传送已停止",
            Duration = 5
        })
    end
end)


local ZDuse = false  -- 自动售卖物品
local autosd = false    -- 自动清理工作垃圾
local autohlod = false  -- 即时互动

-- 自动使用消耗品
Tabs.Auto:Toggle({
    Title = "自动使用消耗品",
    Desc = "幸运方块&材料",
    Value = false,
    Callback = function(state)
        ZDXG = state
        if ZDXG then
            while ZD and wait() do
                for i, v in next, item.inventory.items do
                    if v.name == 'Green Lucky Block' or v.name == 'Orange Lucky Block' or 
                       v.name == 'Purple Lucky Block' or v.name == 'Electronics' or 
                       v.name == 'Weapon Parts' then
                        useid = v.guid
                        Signal.FireServer("equip", useid)
                        Signal.FireServer("useConsumable", useid)
                        Signal.FireServer("removeItem", useid)
                        break
                    end
                end
            end
        end
    end
})

-- 自动售卖物品
Tabs.Auto:Toggle({
    Title = "自动售卖物品",
    Desc = "宝石和贵重物品",
    Value = false,
    Callback = function(state)
        ZDuse = state
        if ZDuse then
            while ZDuse and wait() do
                for i, v in next, item.inventory.items do
                    if v.name == 'Amethyst' or v.name == 'Sapphire' or v.name == 'Emerald' or 
                       v.name == 'Topaz' or v.name == 'Ruby' or v.name == 'Diamond Ring' or 
                       v.name == "Gold Bar" or v.name == "AK-47" or v.name == "AR-15" or 
                       v.name == "Diamond" then
                        sellid = v.guid
                        Signal.FireServer("equip", sellid)
                        Signal.FireServer("sellItem", sellid)
                        break
                    end
                end
            end
        end
    end
})

-- 自动清理背包垃圾
Tabs.Auto:Toggle({
    Title = "自动清理背包垃圾",
    Desc = "",
    Value = false,
    Callback = function(v)
        ZDXG = v
        if ZDXG then
            while ZDXG and wait() do
                for i, v in next, item.inventory.items do
                    if v.name == 'Uzi' or v.name == 'Baseball Bat' or v.name == 'Basketball' or 
                       v.name == 'Bloxaide' or v.name == 'Bloxy Cola' or v.name == 'C4' or 
                       v.name == 'Cake' or v.name == 'Stop Sign' then
                        Signal.FireServer("removeItem", v.guid)
                    end
                end
            end
        end
    end
})

-- 自动清理工作垃圾
Tabs.Auto:Toggle({
    Title = "自动清理工作垃圾",
    Desc = "",
    Value = false,
    Callback = function(v)
        autosd = v
        if autosd then
            while autosd and wait() do  
                local player = game:GetService("Players").LocalPlayer
                local character = player.Character or player.CharacterAdded:Wait()
                for _, v in ipairs(workspace.Game.Local.Rubbish:GetDescendants()) do
                    if v:IsA("ClickDetector") then
                        local parentPart = v.Parent
                        if parentPart:IsA("BasePart") then
                            character:PivotTo(parentPart:GetPivot())
                            task.wait(0.2)
                            fireclickdetector(v)
                        end
                    end
                end
            end
        end
    end
})

-- 即时互动
Tabs.Auto:Toggle({
    Title = "即时互动",
    Desc = "取消等待时间",
    Value = false,
    Callback = function(v)
        autohlod = v
        if autohlod then
            local function modifyPrompt(prompt)
                prompt.HoldDuration = 0 
            end 
            local function isTargetPrompt(prompt)
                local parent = prompt.Parent 
                while parent do 
                    if parent == workspace or parent == workspace.BankRobbery.VaultDoor then 
                        return true 
                    end 
                    parent = parent.Parent 
                end 
                return false 
            end 
            for _, prompt in ipairs(workspace:GetDescendants()) do 
                if prompt:IsA("ProximityPrompt") and isTargetPrompt(prompt) then 
                    modifyPrompt(prompt) 
                end 
            end 
            workspace.DescendantAdded:Connect(function(instance) 
                if instance:IsA("ProximityPrompt") and isTargetPrompt(instance) then 
                    modifyPrompt(instance) 
                end 
            end)
        end
    end
})


-- 金钱光环变量
local mngh = false

-- 金钱光环
Tabs.Collect:Toggle({
    Title = "金钱光环",
    Desc = "自动拾取现金",
    Value = false,
    Callback = function(v)
        mngh = v
        if mngh then
            while mngh and wait() do 
                local Players = game:GetService("Players")
                local localPlayer = Players.LocalPlayer
                if localPlayer.Character then
                    local rootPart = localPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if rootPart then
                        local player = game:GetService("Players").LocalPlayer 
                        local character = player.Character or player.CharacterAdded:Wait()
                        local rootPart = character:WaitForChild("HumanoidRootPart")
                        for _, v in pairs(workspace.Game.Entities.CashBundle:GetDescendants()) do
                            if v:IsA("ClickDetector") then
                                local detectorPos = v.Parent:GetPivot().Position
                                local distance = (rootPart.Position - detectorPos).Magnitude
                                if distance <= 35 then
                                    fireclickdetector(v)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
})


-- 自动收集通用函数
local function autoCollectItems(itemNames, isGemCollection)
    local Players = game:GetService("Players")
    local localPlayer = Players.LocalPlayer
    
    if localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid") then
        local rootPart = localPlayer.Character:FindFirstChild("HumanoidRootPart")
        if rootPart then
            for _, l in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do
                for _, v in pairs(l:GetChildren()) do
                    if v.ClassName == "MeshPart" or v.ClassName == "Part" then
                        for _, e in pairs(v:GetChildren()) do
                            if e.ClassName == "ProximityPrompt" then
                                local shouldCollect = false
                                
                                -- 检查是否匹配目标物品
                                if type(itemNames) == "table" then
                                    for _, name in pairs(itemNames) do
                                        if e.ObjectText == name then
                                            shouldCollect = true
                                            break
                                        end
                                    end
                                else
                                    shouldCollect = e.ObjectText == itemNames
                                end
                                
                                if shouldCollect then
                                    -- 宝石收集时额外处理银行门
                                    if isGemCollection then
                                        for _, obj in ipairs(workspace.BankRobbery.VaultDoor:GetDescendants()) do
                                            if obj:IsA("ProximityPrompt") then
                                                if (obj.Parent.Position - rootPart.Position).Magnitude > 35 then
                                                    obj.RequiresLineOfSight = false
                                                    obj.HoldDuration = 0
                                                    fireproximityprompt(obj)
                                                end
                                            end
                                        end
                                    end
                                    
                                    -- 传送到物品位置并收集
                                    local itemCFrame = v.CFrame
                                    rootPart.CFrame = itemCFrame * CFrame.new(0, 2, 0)
                                    e.RequiresLineOfSight = false
                                    e.HoldDuration = 0
                                    wait(0.1)
                                    -- 多次触发确保收集成功
                                    fireproximityprompt(e)
                                    fireproximityprompt(e)
                                    fireproximityprompt(e)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

-- 1. 自动拾取材料
Tabs.Collect:Toggle({
    Title = "自动拾取材料",
    Desc = "",
    Value = false,
    Callback = function(v)
        ZDSQ = v
        if ZDSQ then
            while ZDSQ and wait() do
                local Players = game:GetService("Players")
                local localPlayer = Players.LocalPlayer
                
                if localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid") then
                    local rootPart = localPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if rootPart then
                        for _, l in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do
                            for _, v in pairs(l:GetChildren()) do
                                if v.ClassName == "MeshPart" or v.ClassName == "Part" then
                                    for _, e in pairs(v:GetChildren()) do
                                        if e.ClassName == "ProximityPrompt" then
                                            if e.ObjectText == "Electronics" or e.ObjectText == "Weapon Parts" then
                                                local itemCFrame = v.CFrame
                                                rootPart.CFrame = itemCFrame * CFrame.new(0, 2, 0)
                                                e.RequiresLineOfSight = false
                                                e.HoldDuration = 0
                                                wait(0.1)
                                                fireproximityprompt(e)
                                                fireproximityprompt(e)
                                                fireproximityprompt(e)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
})

-- 2. 自动拾取宝石
Tabs.Collect:Toggle({
    Title = "自动拾取宝石",
    Desc = "所有宝石",
    Value = false,
    Callback = function(v)
        autobs = v
        if autobs then
            while autobs and wait() do
                autoCollectItems({
                    "Amethyst", "Sapphire", "Emerald", "Topaz", "Ruby", 
                    "Diamond Ring", "Diamond", "Void Gem", "Dark Matter Gem", "Rollie"
                }, true)
            end
        end
    end
})

-- 3. 自动拾取红卡
Tabs.Collect:Toggle({
    Title = "自动拾取红卡",
    Desc = "",
    Value = false,
    Callback = function(v)
        autohk = v
        if autohk then
            while autohk and wait() do
                autoCollectItems("Military Armory Keycard", false)
            end
        end
    end
})

Tabs.Collect:Toggle({
    Title = "自动拾取蓝卡",
    Desc = "",
    Value = false,
    Callback = function(v)
        autolk = v
        if autolk then
            while autohk and wait() do
                autoCollectItems("Police Armory Keycard", false)
            end
        end
    end
})

-- 4. 自动拾取印钞机
Tabs.Collect:Toggle({
    Title = "自动拾取印钞机",
    Desc = "",
    Value = false,
    Callback = function(v)
        automn = v
        if automn then
            while automn and wait() do
                autoCollectItems("Money Printer", false)
            end
        end
    end
})

-- 5. 自动拾取顶级物品
Tabs.Collect:Toggle({
    Title = "自动拾取顶级物品",
    Desc = "",
    Value = false,
    Callback = function(v)
        autodj = v
        if autodj then
            while autodj and wait() do
                autoCollectItems({"Suitcase Nuke", "Nuke Launcher", "Easter Basket"}, false)
            end
        end
    end
})

-- 6. 自动拾取金条
Tabs.Collect:Toggle({
    Title = "自动拾取金条",
    Desc = "",
    Value = false,
    Callback = function(v)
        autojt = v
        if autojt then
            while autojt and wait() do
                local Players = game:GetService("Players")
                local localPlayer = Players.LocalPlayer
                
                if localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid") then
                    local rootPart = localPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if rootPart then
                        for _, l in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do
                            for _, v in pairs(l:GetChildren()) do
                                if v.ClassName == "MeshPart" or v.ClassName == "Part" then
                                    for _, e in pairs(v:GetChildren()) do
                                        if e.ClassName == "ProximityPrompt" and e.ObjectText == "Gold Bar" then
                                            -- 处理银行门
                                            for _, obj in ipairs(workspace.BankRobbery.VaultDoor:GetDescendants()) do
                                                if obj:IsA("ProximityPrompt") then
                                                    if (obj.Parent.Position - rootPart.Position).Magnitude > 35 then
                                                        obj.RequiresLineOfSight = false
                                                        obj.HoldDuration = 0
                                                        fireproximityprompt(obj)
                                                    end
                                                end
                                            end
                                            
                                            local itemCFrame = v.CFrame
                                            rootPart.CFrame = itemCFrame * CFrame.new(0, 2, 0)
                                            e.RequiresLineOfSight = false
                                            e.HoldDuration = 0
                                            wait(0.1)
                                            fireproximityprompt(e)
                                            fireproximityprompt(e)
                                            fireproximityprompt(e)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
})

-- 7. 自动拾取气球
Tabs.Collect:Toggle({
    Title = "自动拾取气球",
    Desc = "所有气球都支持",
    Value = false,
    Callback = function(v)
        autoqq = v
        if autoqq then
            while autoqq and wait() do
                autoCollectItems({
                    "Bunny Balloon", "Ghost Balloon", "Clover Balloon", "Bat Balloon",
                    "Gold Clover Balloon", "Golden Rose", "Black Rose", "Heart Balloon"
                }, false)
            end
        end
    end
})

-- 8. 自动拾取糖果棒
Tabs.Collect:Toggle({
    Title = "自动拾取糖果棒",
    Desc = "红蓝都有",
    Value = false,
    Callback = function(v)
        autoblue = v
        if autoblue then
            while autoblue and wait() do
                autoCollectItems({"Blue Candy Cane", "Red Candy Cane"}, false)
            end
        end
    end
})

-- 9. 自动拾取幸运方块
Tabs.Collect:Toggle({
    Title = "自动拾取幸运方块",
    Desc = "",
    Value = false,
    Callback = function(v)
        autoluck = v
        if autoluck then
            while autoluck and wait() do
                autoCollectItems({"Green Lucky Block", "Orange Lucky Block", "Purple Lucky Block"}, false)
            end
        end
    end
})

-- 10. 查找放下来印钞机
Tabs.Collect:Toggle({
    Title = "查找放下来印钞机",
    Desc = "",
    Value = false,
    Callback = function(v)
        czycj = v
        if czycj then
            while czycj and wait() do
                local Players = game:GetService("Players")
                local localPlayer = Players.LocalPlayer
                local droppables = workspace.Game.Local.droppables
                
                if droppables and droppables:FindFirstChild("Money Printer") then
                    local unusualMoneyPrinter = droppables:FindFirstChild("Money Printer")
                    for _, child in pairs(unusualMoneyPrinter:GetChildren()) do
                        if child:IsA("MeshPart") then
                            local humanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
                            if humanoidRootPart then
                                humanoidRootPart.CFrame = CFrame.new(child.Position)
                            end
                        end
                    end
                end
            end
        end
    end
})

-- 状态防护变量
local antirea = false  -- 反布娃娃状态
local antisit = false  -- 反坐下状态

-- 反布娃娃状态
Tabs.Fight:Toggle({
    Title = "反布娃娃状态",
    Desc = "防止僵直",
    Value = false,
    Callback = function(state)
        antirea = state
        if antirea then
            while antirea and task.wait() do
                Signal.FireServer("setRagdoll", false)
            end
        end
    end
})

-- 反坐下状态
Tabs.Fight:Toggle({
    Title = "反坐下状态",
    Desc = "防止被坐下",
    Value = false,
    Callback = function(state)
        antisit = state
        if antisit then
            while antisit and task.wait() do
                local Players = game:GetService("Players")
                local player = Players.LocalPlayer
                player.CharacterAdded:Connect(function(char)
                    local humanoid = char:WaitForChild("Humanoid")
                    humanoid.Sit = false
                end)
            end
        end
    end
})

