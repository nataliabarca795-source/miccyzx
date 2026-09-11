--// Custom Rayfield Hub
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "My Script Hub",
    Icon = 0,
    LoadingTitle = "My Script Hub",
    LoadingSubtitle = "Rayfield",
    Theme = "Default",
    ToggleUIKeybind = "K",
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "MyScriptHub",
        FileName = "Config"
    }
})

local function RunScript(title, source)
    local ok, err = pcall(function()
        local fn, compileErr = loadstring(source)
        if not fn then error(compileErr) end
        fn()
    end)

    Rayfield:Notify({
        Title = title,
        Content = ok and "script executado." or "erro ao executar; veja o console.",
        Duration = ok and 3 or 5
    })

    if not ok then
        warn("[My Script Hub] " .. title .. ": " .. tostring(err))
    end
end

local UITab = Window:CreateTab("UI", 4483362458)

UITab:CreateButton({
    Name = "Overhead Voice Indicator",
    Callback = function()
        RunScript("Overhead Voice Indicator", [[
-- Execute via Xeno Executor




local Players = game:GetService("Players")


local localPlayer = Players.LocalPlayer




-- Custom Asset ID


local RAW_ASSET_ID = "97664450574335"


local IMAGE_URI = "rbxthumb://type=Asset&id=" .. RAW_ASSET_ID .. "&w=420&h=420"




-- Setup cleanup to prevent duplicates on re-execution


if _G.VoiceIconCleanup then pcall(_G.VoiceIconCleanup) end


local eventConnections = {}


_G.VoiceIconCleanup = function()


    
for _, conn in ipairs(eventConnections) do


        
if conn and conn.Connected then conn:Disconnect() end


    
end


    
table.clear(eventConnections)


end




-- Create overhead voice UI


local function createOverheadUI(char)


    
local head = char:WaitForChild("Head", 5)


    
if not head then return end




    
local existing = head:FindFirstChild("CustomVoiceBubble")


    
if existing then existing:Destroy() end




    
-- BillboardGui directly attached above avatar head


    
local billboard = Instance.new("BillboardGui")


    
billboard.Name = "CustomVoiceBubble"


    
billboard.Size = UDim2.new(0, 30, 0, 30)


    
billboard.StudsOffset = Vector3.new(0, 2.2, 0)


    
billboard.AlwaysOnTop = true


    
billboard.Active = true


    
billboard.Adornee = head


    
billboard.Parent = head




    
-- Clickable Container Frame


    
local button = Instance.new("TextButton")


    
button.Name = "BubbleButton"


    
button.Size = UDim2.new(1, 0, 1, 0)


    
button.BackgroundColor3 = Color3.fromRGB(240, 240, 240)


    
button.BorderSizePixel = 0


    
button.Text = ""


    
button.AutoButtonColor = true


    
button.Active = true


    
button.Selectable = true


    
button.ClipsDescendants = false


    
button.Parent = billboard




    
local corner = Instance.new("UICorner")


    
corner.CornerRadius = UDim.new(0, 8)


    
corner.Parent = button




    
-- Solid Upside-Down Pyramid Tail


    
local tailHolder = Instance.new("Frame")


    
tailHolder.Name = "TailHolder"


    
tailHolder.Size = UDim2.new(0, 12, 0, 8)


    
tailHolder.Position = UDim2.new(0.5, -6, 1, -1)


    
tailHolder.BackgroundTransparency = 1


    
tailHolder.ClipsDescendants = true


    
tailHolder.Parent = button




    
local rotatedSquare = Instance.new("Frame")


    
rotatedSquare.Name = "PyramidTail"


    
rotatedSquare.Size = UDim2.new(0, 8, 0, 8)


    
rotatedSquare.Position = UDim2.new(0.5, -4, 0, -4)


    
rotatedSquare.Rotation = 45


    
rotatedSquare.BackgroundColor3 = Color3.fromRGB(240, 240, 240)


    
rotatedSquare.BorderSizePixel = 0


    
rotatedSquare.Parent = tailHolder




    
-- Base Microphone Decal


    
local micIcon = Instance.new("ImageLabel")


    
micIcon.Name = "MicIcon"


    
micIcon.Size = UDim2.new(0, 18, 0, 18)


    
micIcon.Position = UDim2.new(0.5, 0, 0.5, 0)


    
micIcon.AnchorPoint = Vector2.new(0.5, 0.5)


    
micIcon.BackgroundTransparency = 1


    
micIcon.Image = IMAGE_URI


    
micIcon.ScaleType = Enum.ScaleType.Fit


    
micIcon.Parent = button




    
-- Red Diagonal Mute Slash (-45 Degrees)


    
local redSlash = Instance.new("Frame")


    
redSlash.Name = "RedMuteSlash"


    
redSlash.Size = UDim2.new(0, 18, 0, 2.5)


    
redSlash.Position = UDim2.new(0.5, 0, 0.5, 0)


    
redSlash.AnchorPoint = Vector2.new(0.5, 0.5)


    
redSlash.Rotation = -45


    
redSlash.BackgroundColor3 = Color3.fromRGB(215, 65, 65)


    
redSlash.BorderSizePixel = 0


    
redSlash.Visible = true -- Starts muted


    
redSlash.Parent = button




    
local lineCorner = Instance.new("UICorner")


    
lineCorner.CornerRadius = UDim.new(1, 0)


    
lineCorner.Parent = redSlash




    
-- Manual Visual Toggle


    
local isMuted = true


    
local function toggleVisualState()


        
isMuted = not isMuted




        
-- Visual state changes


        
redSlash.Visible = isMuted


        
if isMuted then


            
micIcon.ImageColor3 = Color3.fromRGB(255, 255, 255) -- Standard decal color


        
else


            
micIcon.ImageColor3 = Color3.fromRGB(45, 180, 105) -- Classic Green Unmuted tint


        
end


    
end




    
table.insert(eventConnections, button.MouseButton1Click:Connect(toggleVisualState))


    
table.insert(eventConnections, button.TouchTap:Connect(toggleVisualState))


end




if localPlayer.Character then task.spawn(createOverheadUI, localPlayer.Character) end


table.insert(eventConnections, localPlayer.CharacterAdded:Connect(createOverheadUI))




print("[Xeno] Classic Overhead Voice Indicator Loaded!")
]])
    end,
})

UITab:CreateButton({
    Name = "Tiny Hotbar",
    Callback = function()
        RunScript("Tiny Hotbar", [[
-- Universal Cross-Platform Hotbar Number Adjuster (Mobile & PC Fixed)




local Players = game:GetService("Players")


local player = Players.LocalPlayer




-- Clean up existing connections if re-executed


if _G.TinyHotbarCleanup then


    
pcall(_G.TinyHotbarCleanup)


end




local SMALL_TEXT_SIZE = 12


local TARGET_POSITION = UDim2.new(0, -1, 0, -4)


local TARGET_SIZE = UDim2.new(0, 14, 0, 14)


local LABEL_NAME = "TinyHotbarSlotNumber"




local connections = {}




-- Enhanced filter to safely catch mobile UI frames, touch toolbars, and PC hotbars


local function isHotbarContainer(obj)


    
local current = obj


    
local depth = 0


    
while current and current ~= game and depth < 7 do


        
depth += 1


        
local name = current.Name:lower()


        


        
-- Blacklist heavy menus to prevent lagging or styling random UI


        
if name:find("shop") or name:find("trade") or name:find("profile") or
 


           
name:find("leaderboard") or name:find("crafting") or name:find("menu") or


           
name:find("chat") or name:find("playerlist") then


            
return false


        
end


        


        
-- Whitelist common PC and Mobile hotbar / inventory containers


        
if name:find("hotbar") or name:find("backpack") or name:find("toolbar") or
 


           
name:find("inventory") or name:find("container") or name:find("mainbar") or


           
name:find("touch") or name:find("mobile") then


            
return true


        
end


        
current = current.Parent


    
end


    
return false


end




local function applyStyle(label)


    
if not label or not label.Parent then return end


    
label.TextScaled = false


    
label.TextSize = SMALL_TEXT_SIZE


    
label.AnchorPoint = Vector2.new(0, 0)


    
label.Position = TARGET_POSITION


    
label.Size = TARGET_SIZE


    
label.TextXAlignment = Enum.TextXAlignment.Left


    
label.TextYAlignment = Enum.TextYAlignment.Top


    
label.Visible = true


    


    
-- Crucial for Mobile/Touch: allows touches to pass through to the slot button


    
label.Active = false


    
pcall(function() label.Interactable = false end)


end




local function processElement(obj)


    
if not obj or not obj.Parent then return end




    
-- Check if it's a valid GUI object inside a hotbar container


    
if obj:IsA("GuiObject") and isHotbarContainer(obj) then


        
local name = obj.Name:lower()


        


        
-- Match mobile buttons or slot elements containing numbers (e.g., "Slot1", "1", "ItemSlot1")


        
local slotNum = tonumber(name:match("%d+"))


        


        
if obj:IsA("TextLabel") then


            
local rawText = obj.Text:gsub("[%s%.]+", "")


            
local num = tonumber(rawText)


            
if num and num >= 0 and num <= 10 then


                
slotNum = num


            
end


        
end




        
if slotNum and slotNum >= 0 and slotNum <= 10 then


            
-- Map 10 to 0 if needed, or keep standard 1-10 numbering


            
local displayNum = (slotNum == 10) and 0 or slotNum


            
if slotNum == 0 then displayNum = 0 end




            
local label = obj:FindFirstChild(LABEL_NAME)


            
if not label and obj:IsA("TextLabel") then


                
label = obj


            
elseif not label then


                
label = Instance.new("TextLabel")


                
label.Name = LABEL_NAME


                
label.BackgroundTransparency = 1


                
label.TextColor3 = Color3.fromRGB(255, 255, 255)


                
label.TextStrokeTransparency = 0.2


                
label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)


                
label.Font = Enum.Font.SourceSansBold


                
label.Text = tostring(displayNum)


                
label.ZIndex = obj.ZIndex + 10


                
label.Parent = obj


            
end


            


            
applyStyle(label)


            
if label:IsA("TextLabel") and label.Text == "" then


                
label.Text = tostring(displayNum)


            
end


        
end


    
end


end




local function setup()


    
local pGui = player:WaitForChild("PlayerGui", 5)


    
if not pGui then return end




    
-- Initial scan of loaded UI elements


    
task.spawn(function()


        
for _, desc in ipairs(pGui:GetDescendants()) do


            
processElement(desc)


        
end


    
end)




    
-- Continuous listener for dynamically loaded mobile UI components


    
local conn = pGui.DescendantAdded:Connect(function(desc)


        
task.defer(function()


            
processElement(desc)


        
end)


    
end)


    
table.insert(connections, conn)


end




-- Re-run setup safely on character respawn/reset


local charConn = player.CharacterAdded:Connect(function()


    
task.wait(1)


    
setup()


end)


table.insert(connections, charConn)




_G.TinyHotbarCleanup = function()


    
for _, c in ipairs(connections) do


        
if c and c.Connected then c:Disconnect() end


    
end


    
table.clear(connections)


end




setup()


print("[Hotbar] Mobile & PC Universal Hotbar Loaded!")
]])
    end,
})

local HUDTab = Window:CreateTab("HUD", 4483362458)

HUDTab:CreateButton({
    Name = "MM2 HUD / Timer",
    Callback = function()
        RunScript("MM2 HUD / Timer", [[
local Players = game:GetService("Players")


local player = Players.LocalPlayer




local function cleanupPrevious()


    
if _G.MM2Connections then


        
for _, conn in ipairs(_G.MM2Connections) do


            
if typeof(conn) == "RBXScriptConnection" then


                
pcall(function() conn:Disconnect() end)


            
end


        
end


    
end


    
_G.MM2Connections = {}




    
if _G.TimerThread then


        
task.cancel(_G.TimerThread)


        
_G.TimerThread = nil


    
end


end


cleanupPrevious()




_G.hasUnlockedTimerThisRound = false


_G.isRoundEnded = false


_G.isInnocentMode = false


_G.roundEndTime = nil




local isUpdating = false


local WHITE_COLOR = Color3.fromRGB(255, 255, 255)


local ORANGE_COLOR = Color3.fromRGB(255, 165, 0)


local RED_COLOR = Color3.fromRGB(255, 0, 0)




local scoreLabel = nil


local headerLabel = nil




local function isHoldingWeaponInHands()


    
local char = player.Character


    
if not char then return false end


    


    
for _, tool in ipairs(char:GetChildren()) do


        
if tool:IsA("Tool") then


            
local name = tool.Name:lower()


            
if not name:find("toy") and not name:find("radio") and not name:find("emote") then


                
if name:find("gun") or name:find("revolver") or name:find("hero") or name:find("knife") then


                    
return true


                
end


            
end


        
end


    
end


    
return false


end




local function survivalXpToSeconds(txt)


    
local rawNum = tonumber(txt:match("%d+"))


    
if rawNum then


        
local elapsedSecs = rawNum / 5


        
local remaining = math.clamp(180 - elapsedSecs, 0, 180)


        
return math.floor(remaining)


    
end


    
return nil


end




local function parseTextToSeconds(txt)


    
local rawNum = tonumber(txt:match("%d+"))


    
if rawNum and rawNum > 5 and not txt:lower():find("m") and not txt:lower():find("s") then


        
local converted = survivalXpToSeconds(txt)


        
if converted then return converted end


    
end




    
txt = txt:lower()


    
local mins = tonumber(txt:match("(%d+)%s*m")) or 0


    
local secs = tonumber(txt:match("(%d+)%s*s")) or tonumber(txt:match("%d+")) or 0


    
if mins > 0 or txt:find("s") then


        
return (mins * 60) + secs


    
end


    
if rawNum and rawNum > 0 and rawNum <= 180 then


        
return rawNum


    
end


    
return nil


end




local function isMainHUDLabel(obj)


    
if not obj:IsA("TextLabel") then return false end


    
local name = obj.Name:lower()


    


    
local p = obj.Parent


    
local playerGui = player:FindFirstChild("PlayerGui")


    
while p and p ~= playerGui and p ~= game do


        
local pName = p.Name:lower()


        
if pName:find("inventory") or pName:find("profile") or pName:find("trade") or
 


           
pName:find("shop") or pName:find("menu") or pName:find("container") or
 


           
pName:find("crafting") or pName:find("leaderboard") then


            
return false


        
end


        
p = p.Parent


    
end




    
if name:find("level") or name:find("amount") or name:find("title") or name:find("slot") or name:find("key") then


        
return false


    
end




    
local absPos = obj.AbsolutePosition


    
local camera = workspace.CurrentCamera


    
if not camera then return false end


    
local vp = camera.ViewportSize


    


    
if absPos.Y > 180 or absPos.X > (vp.X * 0.7) or absPos.X < (vp.X * 0.3) then


        
return false


    
end


    
return true


end




local function secondsToFormattedText(sec)


    
if sec <= 0 then return "0s" end


    
local m = math.floor(sec / 60)


    
local s = sec % 60


    
if m > 0 then


        
return string.format("%dm %ds", m, s)


    
else


        
return string.format("%ds", s)


    
end


end




local function cacheHUDLabels()


    
local pGui = player:FindFirstChild("PlayerGui")


    
if not pGui then return end




    
for _, v in ipairs(pGui:GetDescendants()) do


        
if isMainHUDLabel(v) then


            
local txt = v.Text:lower()


            
if txt:find("survival") or txt:find("xp") or v.Name:lower():find("header") then


                
headerLabel = v


                
_G.isInnocentMode = true


            
elseif string.match(txt, "%d+") or txt:find("m") or txt:find("s") then


                
scoreLabel = v


            
end


        
end


    
end


end




local function updateRealtimeDisplay()


    
if not _G.isInnocentMode or _G.isRoundEnded or not _G.hasUnlockedTimerThisRound or not _G.roundEndTime then


        
return


    
end




    
local remaining = math.max(0, math.ceil(_G.roundEndTime - os.time()))




    
if scoreLabel and scoreLabel.Parent then


        
isUpdating = true


        
scoreLabel.Visible = true




        
if remaining <= 0 then


            
scoreLabel.Text = "Game Over!"


            
scoreLabel.TextColor3 = RED_COLOR


            
_G.isRoundEnded = true


        
else


            
scoreLabel.Text = secondsToFormattedText(remaining)


            
scoreLabel.TextColor3 = (remaining <= 30) and RED_COLOR or WHITE_COLOR


        
end


        


        
scoreLabel.TextStrokeTransparency = 0


        
scoreLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)


        
isUpdating = false


    
end




    
if headerLabel and headerLabel.Parent then


        
isUpdating = true


        
headerLabel.Visible = false


        
isUpdating = false


    
end


end




_G.TimerThread = task.spawn(function()


    
while true do


        
task.wait(0.2)


        
if _G.isInnocentMode and not _G.isRoundEnded then


            
if _G.hasUnlockedTimerThisRound then


                
updateRealtimeDisplay()


            
end


        
end


    
end


end)




local function unlockRealtimeTimer(currentText)


    
if _G.hasUnlockedTimerThisRound then return end




    
local currentSecs = parseTextToSeconds(currentText) or 180


    
_G.roundEndTime = os.time() + currentSecs


    
_G.hasUnlockedTimerThisRound = true


    
updateRealtimeDisplay()


end




local function applyMM2Formatting(obj)


    
if not isMainHUDLabel(obj) then return end




    
local function atualizar()


        
if isUpdating then return end


        
local rawTxt = obj.Text


        
local lowerTxt = rawTxt:lower()




        
if string.find(lowerTxt, "survival") or string.find(lowerTxt, "xp") or obj.Name:lower():find("header") then


            
headerLabel = obj


            
_G.isInnocentMode = true




            
isUpdating = true


            
obj.Visible = not _G.hasUnlockedTimerThisRound and not _G.isRoundEnded


            
obj.TextColor3 = WHITE_COLOR


            
obj.TextStrokeTransparency = 0


            
obj.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)


            
isUpdating = false


            
return


        
end




        
if _G.isRoundEnded or obj.TextColor3 == Color3.fromRGB(0, 255, 0) or lowerTxt:find("victory") or lowerTxt:find("defeat") or lowerTxt:find("won") or lowerTxt:find("hero") or lowerTxt:find("murderer") or lowerTxt:find("sheriff") or rawTxt == "0s" then


            
_G.isRoundEnded = true


            
isUpdating = true


            
obj.Visible = false


            
if headerLabel then headerLabel.Visible = false end


            
if scoreLabel then scoreLabel.Visible = false end


            
isUpdating = false


            
return


        
end




        
if isHoldingWeaponInHands() and _G.isInnocentMode then


            
unlockRealtimeTimer(rawTxt)


        
end




        
local numVal = tonumber(rawTxt:match("%d+"))


        
if (numVal or lowerTxt:find("s")) and not _G.isRoundEnded then


            
scoreLabel = obj




            
if _G.hasUnlockedTimerThisRound and _G.isInnocentMode then


                
updateRealtimeDisplay()


            
else


                
isUpdating = true


                
obj.Visible = not _G.isRoundEnded


                


                
-- IF ALREADY IN Xm Ys / Xs FORMAT, MAKE IT WHITE. ONLY XP (NUMBERS ONLY) STAYS ORANGE


                
if lowerTxt:find("m") or lowerTxt:find("s") then


                    
obj.TextColor3 = WHITE_COLOR


                
else


                    
obj.TextColor3 = ORANGE_COLOR


                
end




                
obj.TextStrokeTransparency = 0


                
obj.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)


                
if headerLabel then


                    
headerLabel.Visible = not _G.isRoundEnded


                    
headerLabel.TextColor3 = WHITE_COLOR


                    
headerLabel.TextStrokeTransparency = 0


                    
headerLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)


                
end


                
isUpdating = false


            
end


        
end


    
end




    
local conn = obj:GetPropertyChangedSignal("Text"):Connect(function()


        
if not isUpdating then


            
atualizar()


        
end


    
end)


    


    
table.insert(_G.MM2Connections, conn)


    
atualizar()


end




local function monitorCharacter(char)


    
local function checkEquipment()


        
if not _G.isInnocentMode or _G.isRoundEnded then return end


        
if isHoldingWeaponInHands() then


            
local currentTxt = scoreLabel and scoreLabel.Text or "180"


            
unlockRealtimeTimer(currentTxt)


        
end


    
end




    
local c1 = char.ChildAdded:Connect(checkEquipment)


    
local c2 = char.ChildRemoved:Connect(checkEquipment)


    
table.insert(_G.MM2Connections, c1)


    
table.insert(_G.MM2Connections, c2)




    
local humanoid = char:FindFirstChildOfClass("Humanoid")


    
if humanoid then


        
local diedConn = humanoid.Died:Connect(function()


            
if _G.isInnocentMode then


                
_G.isRoundEnded = true


                
if scoreLabel and scoreLabel.Parent then scoreLabel.Visible = false end


                
if headerLabel and headerLabel.Parent then headerLabel.Visible = false end


            
end


        
end)


        
table.insert(_G.MM2Connections, diedConn)


    
end


end




if player.Character then monitorCharacter(player.Character) end




local charConn = player.CharacterAdded:Connect(function(char)


    
_G.hasUnlockedTimerThisRound = false


    
_G.isRoundEnded = false


    
_G.isInnocentMode = false


    
_G.roundEndTime = nil


    
scoreLabel = nil


    
headerLabel = nil


    
task.wait(0.4)


    


    
cacheHUDLabels()


    
monitorCharacter(char)


end)


table.insert(_G.MM2Connections, charConn)




local pGui = player:WaitForChild("PlayerGui", 5)


if pGui then


    
for _, v in ipairs(pGui:GetDescendants()) do


        
if isMainHUDLabel(v) then applyMM2Formatting(v) end


    
end




    
local descConn = pGui.DescendantAdded:Connect(function(v)


        
if isMainHUDLabel(v) then applyMM2Formatting(v) end


    
end)


    
table.insert(_G.MM2Connections, descConn)


end
]])
    end,
})

HUDTab:CreateButton({
    Name = "XP / Timer Position",
    Callback = function()
        RunScript("XP / Timer Position", [[
local Players = game:GetService("Players")


local player = Players.LocalPlayer




local movidosPais = {}


local movidosLabels = {}




local function configurar(obj)


	
if not obj:IsA("TextLabel") then


	
	
return


	
end




	
local function atualizar()


	
	
-- Verifica texto contendo "xp"


	
	
if string.find(obj.Text:lower(), "xp") then


	
	
	
local pai = obj.Parent




	
	
	
if pai and pai:IsA("GuiObject") and not movidosPais[pai] then


	
	
	
	
movidosPais[pai] = true


	
	
	
	
pai.Position = pai.Position + UDim2.new(0, 0, 0, 20)


	
	
	
end


	
	
end




	
	
-- Verifica texto no formato "Xm Ys"


	
	
if string.match(obj.Text, "%dm%s*%d+s") and not movidosLabels[obj] then


	
	
	
movidosLabels[obj] = true


	
	
	
obj.Position = obj.Position + UDim2.new(0, 0, 0, 35)


	
	
end


	
end




	
obj:GetPropertyChangedSignal("Text"):Connect(atualizar)


	
atualizar()


end




for _, v in ipairs(player.PlayerGui:GetDescendants()) do


	
configurar(v)


end




player.PlayerGui.DescendantAdded:Connect(configurar)
]])
    end,
})

local ToolsTab = Window:CreateTab("Tools", 4483362458)

--// SCRIPT 1 - XP / TIMER POSITION
local Script1Enabled = false
local Script1Connections = {}
local Script1MovedParents = {}
local Script1MovedLabels = {}

local function Script1Restore()
    for obj, pos in pairs(Script1MovedParents) do
        if obj and obj.Parent then
            obj.Position = pos
        end
    end

    for obj, pos in pairs(Script1MovedLabels) do
        if obj and obj.Parent then
            obj.Position = pos
        end
    end

    table.clear(Script1MovedParents)
    table.clear(Script1MovedLabels)
end

local function Script1Configure(obj)
    if not Script1Enabled or not obj:IsA("TextLabel") then
        return
    end

    local function update()
        if not Script1Enabled or not obj.Parent then
            return
        end

        local text = obj.Text or ""

        if string.find(text:lower(), "xp") then
            local parent = obj.Parent
            if parent and parent:IsA("GuiObject") and not Script1MovedParents[parent] then
                Script1MovedParents[parent] = parent.Position
                parent.Position = parent.Position + UDim2.new(0, 0, 0, 20)
            end
        end

        if string.match(text, "%dm%s*%d+s") and not Script1MovedLabels[obj] then
            Script1MovedLabels[obj] = obj.Position
            obj.Position = obj.Position + UDim2.new(0, 0, 0, 20)
        end
    end

    table.insert(Script1Connections, obj:GetPropertyChangedSignal("Text"):Connect(update))
    update()
end

local function Script1Start()
    if Script1Enabled then return end
    Script1Enabled = true

    local playerGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

    for _, obj in ipairs(playerGui:GetDescendants()) do
        Script1Configure(obj)
    end

    table.insert(Script1Connections, playerGui.DescendantAdded:Connect(function(obj)
        Script1Configure(obj)
    end))
end

local function Script1Stop()
    Script1Enabled = false

    for _, connection in ipairs(Script1Connections) do
        if connection and connection.Connected then
            connection:Disconnect()
        end
    end

    table.clear(Script1Connections)
    Script1Restore()
end

ToolsTab:CreateToggle({
    Name = "XP / Timer Position",
    CurrentValue = false,
    Flag = "XP_Timer_Position",
    Callback = function(Value)
        if Value then
            Script1Start()
            Rayfield:Notify({
                Title = "XP / Timer Position",
                Content = "ativado — movendo 20 pixels para baixo.",
                Duration = 3
            })
        else
            Script1Stop()
            Rayfield:Notify({
                Title = "XP / Timer Position",
                Content = "desativado — posição restaurada.",
                Duration = 3
            })
        end
    end,
})


--// SOUND GUN
local SoundGunEnabled = false
local SoundGunConnections = {}
local SoundGunSound

local function SoundGunDisconnect()
    for _, connection in ipairs(SoundGunConnections) do
        if connection and connection.Connected then
            connection:Disconnect()
        end
    end
    table.clear(SoundGunConnections)

    if SoundGunSound then
        pcall(function()
            SoundGunSound:Stop()
            SoundGunSound:Destroy()
        end)
        SoundGunSound = nil
    end
end

local function SoundGunStart()
    if SoundGunEnabled then return end
    SoundGunEnabled = true

    local Players = game:GetService("Players")
    local SoundService = game:GetService("SoundService")
    local player = Players.LocalPlayer

    local SOUND_ID = "rbxassetid://6968135315"
    local TARGET_TOOL_NAME = "Gun"
    local COOLDOWN_DURATION = 5

    SoundGunSound = Instance.new("Sound")
    SoundGunSound.SoundId = SOUND_ID
    SoundGunSound.Volume = 2.5
    SoundGunSound.Parent = SoundService

    local function setupGunSystem(character)
        if not SoundGunEnabled or not character then return end

        local humanoid = character:WaitForChild("Humanoid", 10)
        local animator = humanoid and humanoid:WaitForChild("Animator", 10)
        if not SoundGunEnabled then return end

        local lastUnequippedTime = 0

        if animator then
            table.insert(SoundGunConnections, animator.AnimationPlayed:Connect(function(track)
                if not SoundGunEnabled then return end

                local tool = character:FindFirstChildOfClass("Tool")
                local isHoldingGun = tool and tool.Name == TARGET_TOOL_NAME
                local timeSinceUnequip = tick() - lastUnequippedTime
                local withinCooldown = timeSinceUnequip <= COOLDOWN_DURATION

                if (isHoldingGun or withinCooldown)
                    and track.Priority == Enum.AnimationPriority.Action then
                    track:Stop()
                end
            end))
        end

        table.insert(SoundGunConnections, character.ChildAdded:Connect(function(child)
            if SoundGunEnabled and child:IsA("Tool") and child.Name == TARGET_TOOL_NAME then
                if SoundGunSound then SoundGunSound:Play() end
            end
        end))

        table.insert(SoundGunConnections, character.ChildRemoved:Connect(function(child)
            if SoundGunEnabled and child:IsA("Tool") and child.Name == TARGET_TOOL_NAME then
                if SoundGunSound then SoundGunSound:Play() end
                lastUnequippedTime = tick()
            end
        end))
    end

    if player.Character then
        task.spawn(setupGunSystem, player.Character)
    end

    table.insert(SoundGunConnections, player.CharacterAdded:Connect(function(character)
        task.spawn(setupGunSystem, character)
    end))
end

local function SoundGunStop()
    SoundGunEnabled = false
    SoundGunDisconnect()
end

ToolsTab:CreateToggle({
    Name = "sound gun",
    CurrentValue = false,
    Flag = "Sound_Gun",
    Callback = function(Value)
        if Value then
            SoundGunStart()
            Rayfield:Notify({
                Title = "sound gun",
                Content = "ativado.",
                Duration = 3
            })
        else
            SoundGunStop()
            Rayfield:Notify({
                Title = "sound gun",
                Content = "desativado.",
                Duration = 3
            })
        end
    end,
})


--// SPEED GLITCH
local SpeedGlitchEnabled = false
local SpeedGlitchConnections = {}
local SpeedGlitchHeartbeat

local function SpeedGlitchDisconnect()
    for _, connection in ipairs(SpeedGlitchConnections) do
        if connection and connection.Connected then
            connection:Disconnect()
        end
    end
    table.clear(SpeedGlitchConnections)

    if SpeedGlitchHeartbeat then
        SpeedGlitchHeartbeat:Disconnect()
        SpeedGlitchHeartbeat = nil
    end

    local player = game:GetService("Players").LocalPlayer
    local char = player.Character
    if char then
        local ghost = char:FindFirstChild("Skibidi_Ghost_Active")
        if ghost then ghost:Destroy() end
    end
end

local function SpeedGlitchStart()
    if SpeedGlitchEnabled then return end
    SpeedGlitchEnabled = true

    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local player = Players.LocalPlayer

    local currentOffset = CFrame.new(0, 0, 0)
    local activeGhost, activeWeld = nil, nil
    local cachedRoot, cachedTorso = nil, nil

    local function isGlitchTarget(child)
        if child:IsA("Tool") then return true end
        return string.find(string.lower(child.Name), "radio") ~= nil
    end

    local function deployGhostGlitch()
        if not SpeedGlitchEnabled then return end

        local char = player.Character
        if not char then return end

        cachedRoot = char:FindFirstChild("HumanoidRootPart")
        cachedTorso = char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
        if not cachedTorso or not cachedRoot then return end

        local rawCF = cachedRoot.CFrame:ToObjectSpace(cachedTorso.CFrame)
        currentOffset = CFrame.new(rawCF.Position * 1.9) * rawCF.Rotation

        local oldGhost = char:FindFirstChild("Skibidi_Ghost_Active")
        if oldGhost then oldGhost:Destroy() end

        local newGhost = Instance.new("Part")
        newGhost.Name = "Skibidi_Ghost_Active"
        newGhost.Size = Vector3.new(1, 1, 1)

        local targetMass = 16
        local volume = newGhost.Size.X * newGhost.Size.Y * newGhost.Size.Z
        local requiredDensity = targetMass / volume

        newGhost.CustomPhysicalProperties = PhysicalProperties.new(
            requiredDensity, 0.7, 0.3, 1, 1
        )
        newGhost.CFrame = cachedTorso.CFrame
        newGhost.Transparency = 1
        newGhost.CanCollide = false
        newGhost.Parent = char

        activeWeld = Instance.new("Weld")
        activeWeld.Part0 = cachedTorso
        activeWeld.Part1 = newGhost
        activeWeld.C0 = currentOffset
        activeWeld.Parent = newGhost

        activeGhost = newGhost
    end

    local function setupListeners(char)
        if not SpeedGlitchEnabled or not char then return end

        local humanoid = char:FindFirstChild("Humanoid")
        if humanoid then
            table.insert(SpeedGlitchConnections, humanoid.Died:Connect(function()
                activeGhost = nil
                activeWeld = nil
                cachedRoot = nil
                cachedTorso = nil
            end))
        end

        task.defer(deployGhostGlitch)

        table.insert(SpeedGlitchConnections, char.ChildAdded:Connect(function(child)
            if not SpeedGlitchEnabled then return end

            if isGlitchTarget(child) then
                for _, part in ipairs(child:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.Massless = true
                    end
                end
                deployGhostGlitch()
            end
        end))

        table.insert(SpeedGlitchConnections, char.ChildRemoved:Connect(function(child)
            if SpeedGlitchEnabled and isGlitchTarget(child) then
                deployGhostGlitch()
            end
        end))
    end

    if player.Character then
        setupListeners(player.Character)
    end

    table.insert(SpeedGlitchConnections, player.CharacterAdded:Connect(function(char)
        activeGhost, activeWeld = nil, nil
        cachedRoot, cachedTorso = nil, nil
        task.wait()
        setupListeners(char)
    end))

    SpeedGlitchHeartbeat = RunService.Heartbeat:Connect(function()
        if not SpeedGlitchEnabled then return end

        if activeWeld then
            activeWeld.C0 = currentOffset
        elseif player.Character and
            (not activeGhost or activeGhost.Parent ~= player.Character) then
            deployGhostGlitch()
        end
    end)
end

local function SpeedGlitchStop()
    SpeedGlitchEnabled = false
    SpeedGlitchDisconnect()
end

ToolsTab:CreateToggle({
    Name = "speed glitch",
    CurrentValue = false,
    Flag = "Speed_Glitch",
    Callback = function(Value)
        if Value then
            SpeedGlitchStart()
            Rayfield:Notify({
                Title = "speed glitch",
                Content = "ativado.",
                Duration = 3
            })
        else
            SpeedGlitchStop()
            Rayfield:Notify({
                Title = "speed glitch",
                Content = "desativado.",
                Duration = 3
            })
        end
    end,
})


--// BARRA DE EMOTE
local EmoteBarEnabled = false
local EmoteBarConnections = {}
local EmoteBarInputConnection

local function EmoteBarDisconnect()
    for _, connection in ipairs(EmoteBarConnections) do
        if connection and connection.Connected then
            connection:Disconnect()
        end
    end
    table.clear(EmoteBarConnections)

    if EmoteBarInputConnection and EmoteBarInputConnection.Connected then
        EmoteBarInputConnection:Disconnect()
    end
    EmoteBarInputConnection = nil

    local player = game:GetService("Players").LocalPlayer
    local backpack = player:FindFirstChild("Backpack")
    local character = player.Character

    for _, container in ipairs({backpack, character}) do
        if container then
            local tool = container:FindFirstChild("Emotes")
            if tool then tool:Destroy() end
        end
    end
end

local function EmoteBarCreate()
    if not EmoteBarEnabled then return end

    local Players = game:GetService("Players")
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local UserInputService = game:GetService("UserInputService")
    local LocalPlayer = Players.LocalPlayer

    local backpack = LocalPlayer:WaitForChild("Backpack", 10)
    if not backpack then return end

    local existing = backpack:FindFirstChild("Emotes")
        or (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Emotes"))
    if existing then existing:Destroy() end

    local function pressT()
        if not EmoteBarEnabled then return end
        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.T, false, game)
        task.wait(0.01)
        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.T, false, game)
    end

    local tool = Instance.new("Tool")
    tool.Name = "Emotes"
    tool.RequiresHandle = false
    tool.CanBeDropped = false

    local isEquipped = false

    table.insert(EmoteBarConnections, tool.Equipped:Connect(function()
        if not EmoteBarEnabled then return end
        isEquipped = true
        pressT()
    end))

    table.insert(EmoteBarConnections, tool.Unequipped:Connect(function()
        isEquipped = false
    end))

    EmoteBarInputConnection = UserInputService.InputBegan:Connect(function(input)
        if not EmoteBarEnabled or input.KeyCode ~= Enum.KeyCode.Two or not isEquipped then
            return
        end

        local character = LocalPlayer.Character
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid:UnequipTools()
        end
    end)

    tool.Parent = backpack

    task.wait(0.2)
    if not EmoteBarEnabled or not tool.Parent then return end

    for _, t in ipairs(backpack:GetChildren()) do
        if t:IsA("Tool") and t.Name ~= "Emotes" then
            t.Parent = nil
            t.Parent = backpack
        end
    end
end

local function EmoteBarStart()
    if EmoteBarEnabled then return end
    EmoteBarEnabled = true

    local player = game:GetService("Players").LocalPlayer

    if player.Character then
        task.spawn(EmoteBarCreate)
    end

    table.insert(EmoteBarConnections, player.CharacterAdded:Connect(function()
        if not EmoteBarEnabled then return end
        task.wait(2)
        EmoteBarCreate()
    end))
end

local function EmoteBarStop()
    EmoteBarEnabled = false
    EmoteBarDisconnect()
end

ToolsTab:CreateToggle({
    Name = "barra de emote",
    CurrentValue = false,
    Flag = "Barra_Emote",
    Callback = function(Value)
        if Value then
            EmoteBarStart()
            Rayfield:Notify({
                Title = "barra de emote",
                Content = "ativado.",
                Duration = 3
            })
        else
            EmoteBarStop()
            Rayfield:Notify({
                Title = "barra de emote",
                Content = "desativado — ferramenta removida.",
                Duration = 3
            })
        end
    end,
})


--// OLD ANIMATION
ToolsTab:CreateButton({
    Name = "old animation",
    Callback = function()
        RunScript("old animation", [[
game.Workspace.Retargeting = Enum.AnimatorRetargetingMode.Disabled
]])
    end,
})

-- Configuration loading disabled so Tools never auto-enable on startup.
-- Rayfield:LoadConfiguration()
