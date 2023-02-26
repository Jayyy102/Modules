--made by 0prime
--custom modules by other ppl
--skidded yes i know
--cope harder
loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/CustomModules/6872274481.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/0primeSkidsALot/vape-plus-plus/main/script/keystrokes"))()
local GuiLibrary = shared.GuiLibrary
local players = game:GetService("Players")
local textservice = game:GetService("TextService")
local repstorage = game:GetService("ReplicatedStorage")
local lplr = players.LocalPlayer
local workspace = game:GetService("Workspace")
local lighting = game:GetService("Lighting")
local cam = workspace.CurrentCamera
local targetinfo = shared.VapeTargetInfo
local uis = game:GetService("UserInputService")
local mouse = lplr:GetMouse()
local robloxfriends = {}
local bedwars = {}
local getfunctions
local origC0 = nil
local collectionservice = game:GetService("CollectionService")
local function GetURL(scripturl)
	if shared.VapeDeveloper then
		return readfile("vape/"..scripturl)
	else
		return game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/"..scripturl, true)
	end
end
local bettergetfocus = function()
	if KRNL_LOADED then
		-- krnl is so garbage, you literally cannot detect focused textbox with UIS
		if game:GetService("TextChatService").ChatVersion == "TextChatService" then
			return (game:GetService("CoreGui").ExperienceChat.appLayout.chatInputBar.Background.Container.TextContainer.TextBoxContainer.TextBox:IsFocused())
		elseif game:GetService("TextChatService").ChatVersion == "LegacyChatService" then
			return ((game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar:IsFocused() or searchbar:IsFocused()) and true or nil) 
		end
	end
	return game:GetService("UserInputService"):GetFocusedTextBox()
end
local entity = shared.vapeentity
local WhitelistFunctions = shared.vapewhitelist
local queueteleport = syn and syn.queue_on_teleport or queue_on_teleport or fluxus and fluxus.queue_on_teleport or function() end
local teleportfunc
local betterisfile = function(file)
	local suc, res = pcall(function() return readfile(file) end)
	return suc and res ~= nil
end
local requestfunc = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or request or function(tab)
	if tab.Method == "GET" then
		return {
			Body = game:HttpGet(tab.Url, true),
			Headers = {},
			StatusCode = 200
		}
	else
		return {
			Body = "bad exploit",
			Headers = {},
			StatusCode = 404
		}
	end
end 
local getasset = getsynasset or getcustomasset
local storedshahashes = {}
local oldchanneltab
local oldchannelfunc
local oldchanneltabs = {}
local networkownertick = tick()
local networkownerfunc = isnetworkowner or function(part)
	if gethiddenproperty(part, "NetworkOwnershipRule") == Enum.NetworkOwnership.Manual then 
		sethiddenproperty(part, "NetworkOwnershipRule", Enum.NetworkOwnership.Automatic)
		networkownertick = tick() + 8
	end
	return networkownertick <= tick()
end


local function GetURL(scripturl)
	if shared.VapeDeveloper then
		return readfile("vape/"..scripturl)
	else
		return game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/"..scripturl, true)
	end
end

local function addvectortocframe2(cframe, newylevel)
	local x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22 = cframe:GetComponents()
	return CFrame.new(x, newylevel, z, R00, R01, R02, R10, R11, R12, R20, R21, R22)
end

local function getSpeedMultiplier(reduce)
	local speed = 1
	if lplr.Character then 
		local speedboost = lplr.Character:GetAttribute("SpeedBoost")
		if speedboost and speedboost > 1 then 
			speed = speed + (speedboost - 1)
		end
		if lplr.Character:GetAttribute("GrimReaperChannel") then 
			speed = speed + 0.6
		end
		if lplr.Character:GetAttribute("SpeedPieBuff") then 
			speed = speed + (queueType == "SURVIVAL" and 0.15 or 0.3)
		end
	end
	return reduce and speed ~= 1 and speed * (0.9 - (0.15 * math.floor(speed))) or speed
end

local RunLoops = {RenderStepTable = {}, StepTable = {}, HeartTable = {}}
do
	function RunLoops:BindToRenderStep(name, num, func)
		if RunLoops.RenderStepTable[name] == nil then
			RunLoops.RenderStepTable[name] = game:GetService("RunService").RenderStepped:Connect(func)
		end
	end

	function RunLoops:UnbindFromRenderStep(name)
		if RunLoops.RenderStepTable[name] then
			RunLoops.RenderStepTable[name]:Disconnect()
			RunLoops.RenderStepTable[name] = nil
		end
	end

	function RunLoops:BindToStepped(name, num, func)
		if RunLoops.StepTable[name] == nil then
			RunLoops.StepTable[name] = game:GetService("RunService").Stepped:Connect(func)
		end
	end

	function RunLoops:UnbindFromStepped(name)
		if RunLoops.StepTable[name] then
			RunLoops.StepTable[name]:Disconnect()
			RunLoops.StepTable[name] = nil
		end
	end

	function RunLoops:BindToHeartbeat(name, num, func)
		if RunLoops.HeartTable[name] == nil then
			RunLoops.HeartTable[name] = game:GetService("RunService").Heartbeat:Connect(func)
		end
	end

	function RunLoops:UnbindFromHeartbeat(name)
		if RunLoops.HeartTable[name] then
			RunLoops.HeartTable[name]:Disconnect()
			RunLoops.HeartTable[name] = nil
		end
	end
end

local function runcode(func)
	func()
end

local function betterfind(tab, obj)
	for i,v in pairs(tab) do
		if v == obj or type(v) == "table" and v.hash == obj then
			return v
		end
	end
	return nil
end

local function addvectortocframe(cframe, vec)
	local x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22 = cframe:GetComponents()
	return CFrame.new(x + vec.X, y + vec.Y, z + vec.Z, R00, R01, R02, R10, R11, R12, R20, R21, R22)
end

local function getremote(tab)
	for i,v in pairs(tab) do
		if v == "Client" then
			return tab[i + 1]
		end
	end
	return ""
end

local function getcustomassetfunc(path)
	if not betterisfile(path) then
		task.spawn(function()
			local textlabel = Instance.new("TextLabel")
			textlabel.Size = UDim2.new(1, 0, 0, 36)
			textlabel.Text = "Downloading "..path
			textlabel.BackgroundTransparency = 1
			textlabel.TextStrokeTransparency = 0
			textlabel.TextSize = 30
			textlabel.Font = Enum.Font.SourceSans
			textlabel.TextColor3 = Color3.new(1, 1, 1)
			textlabel.Position = UDim2.new(0, 0, 0, -36)
			textlabel.Parent = GuiLibrary["MainGui"]
			repeat task.wait() until betterisfile(path)
			textlabel:Remove()
		end)
		local req = requestfunc({
			Url = "https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/"..path:gsub("vape/assets", "assets"),
			Method = "GET"
		})
		writefile(path, req.Body)
	end
	return getasset(path) 
end

local function isAlive(plr)
	if plr then
		return plr and plr.Character and plr.Character.Parent ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Head") and plr.Character:FindFirstChild("Humanoid")
	end
	return lplr and lplr.Character and lplr.Character.Parent ~= nil and lplr.Character:FindFirstChild("HumanoidRootPart") and lplr.Character:FindFirstChild("Head") and lplr.Character:FindFirstChild("Humanoid")
end

local function createwarning(title, text, delay)
	local suc, res = pcall(function()
		local frame = GuiLibrary["CreateNotification"](title, text, delay, "assets/WarningNotification.png")
		frame.Frame.Frame.ImageColor3 = Color3.fromRGB(236, 129, 44)
		return frame
	end)
	return (suc and res)
end

--custom modules start here
--snoopy lol
local AntiCrash = {["Enabled"] = false}
	AntiCrash = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
		["Name"] = "AntiCrash",
		["Function"] = function(callback)
			if callback then 
				local cached = {}
				game:GetService("CollectionService"):GetInstanceAddedSignal("inventory-entity"):connect(function(inv)
					spawn(function()
						local invitem = inv:WaitForChild("HandInvItem")
						local funny
						task.wait(0.2)
						for i,v in pairs(getconnections(invitem.Changed)) do 
							funny = v.Function
							v:Disable()
						end
						if funny then
							invitem.Changed:connect(function(item)
								if cached[inv] == nil then cached[inv] = 0 end
								if cached[inv] >= 6 then return end
								cached[inv] = cached[inv] + 1
								task.delay(1, function() cached[inv] = cached[inv] - 1 end)
								funny(item)
							end)
						end
					end)
				end)
				for i2,inv in pairs(game:GetService("CollectionService"):GetTagged("inventory-entity")) do 
					spawn(function()
						local invitem = inv:WaitForChild("HandInvItem")
						local funny
						task.wait(0.2)
						for i,v in pairs(getconnections(invitem.Changed)) do 
							funny = v.Function
							v:Disable()
						end
						if funny then
							invitem.Changed:connect(function(item)
								if cached[inv] == nil then cached[inv] = 0 end
								if cached[inv] >= 6 then return end
								cached[inv] = cached[inv] + 1
								task.delay(1, function() cached[inv] = cached[inv] - 1 end)
								funny(item)
							end)
						end
					end)
				end
			end
		end
	})

local SmallWeapons = {["Enabled"] = false}
SmallWeapons = GuiLibrary["ObjectsThatCanBeSaved"]["WorldWindow"]["Api"].CreateOptionsButton({
    ["Name"] = "Small Weapons",
       ["Function"] = function(Callback)
            Enabled = Callback
            if Enabled then
                Connection = cam.Viewmodel.ChildAdded:Connect(function(v)
                    if v:FindFirstChild("Handle") then
                        pcall(function()
                            v:FindFirstChild("Handle").Size = v:FindFirstChild("Handle").Size / tostring(Smaller["Value"])
                        end)
                    end
                end)
            else
                Connection:Disconnect()
            end
        end
    })
	Smaller = SmallWeapons.CreateSlider({
		["Name"] = "Value",
		["Min"] = 0,
		["Max"] = 10,
		["Function"] = function(val) end,
		["Default"] = 3
	})

	runcode(function()
		local packloaded = false
		local ReTexture = {["Enabled"] = false}
	
		ReTexture = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
			["Name"] = "ReTexture",
			["Function"] = function(callback)
				if callback then
					packloaded = true
					if not game:IsLoaded() then repeat task.wait() until game:IsLoaded() end
	
	local requestfunc = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or request or function(tab)
		if tab.Method == "GET" then
			return {
				Body = game:HttpGet(tab.Url, true),
				Headers = {},
				StatusCode = 200
			}
		else
			return {
				Body = "bad exploit",
				Headers = {},
				StatusCode = 404
			}
		end
	end
	
	local setthreadidentity = syn and syn.set_thread_identity or set_thread_identity or setidentity
	local getthreadidentity = syn and syn.get_thread_identity or get_thread_identity or getidentity
	local getasset = getsynasset or getcustomasset
	local cachedthings2 = {}
	local cachedsizes = {}
	
	local betterisfile = function(file)
		local suc, res = pcall(function() return readfile(file) end)
		return suc and res ~= nil
	end
	
	local function removeTags(str)
		str = str:gsub("<br%s*/>", "\n")
		return (str:gsub("<[^<>]->", ""))
	end
	
	local cachedassets = {}
	local function getcustomassetfunc(path)
		if not betterisfile(path) then
			task.spawn(function()
				local textlabel = Instance.new("TextLabel")
				textlabel.Size = UDim2.new(1, 0, 0, 36)
				textlabel.Text = "Downloading "..path
				textlabel.BackgroundTransparency = 1
				textlabel.TextStrokeTransparency = 0
				textlabel.TextSize = 30
				textlabel.Font = Enum.Font.SourceSans
				textlabel.TextColor3 = Color3.new(1, 1, 1)
				textlabel.Position = UDim2.new(0, 0, 0, -36)
				textlabel.Parent = game:GetService("CoreGui").RobloxGui
				repeat task.wait() until betterisfile(path)
				textlabel:Remove()
			end)
			local req = requestfunc({
				Url = "https://raw.githubusercontent.com/trollfacenan/bedwarstexture/main/"..path,
				Method = "GET"
			})
			writefile(path, req.Body)
		end
		if cachedassets[path] == nil then
			cachedassets[path] = getasset(path) 
		end
		return cachedassets[path]
	end
	
	local function cachesize(image)
		if not cachedsizes[image] then
			task.spawn(function()
				local thing = Instance.new("ImageLabel")
				thing.Image = getcustomassetfunc(image)
				thing.Size = UDim2.new(1, 0, 1, 0)
				thing.ImageTransparency = 0.999
				thing.BackgroundTransparency = 1
				thing.Parent = game:GetService("CoreGui").RobloxGui
				repeat task.wait() until thing.ContentImageSize ~= Vector2.new(0, 0)
				thing:Remove()
				cachedsizes[image] = 1
				cachedsizes[image] = thing.ContentImageSize.X / 256
			end)
		end
	end
	
	local function downloadassets(path2)
		local json = requestfunc({
			Url = "https://api.github.com/repos/trollfacenan/bedwarstexture/contents/"..path2,
			Method = "GET"
		})
		local decodedjson = game:GetService("HttpService"):JSONDecode(json.Body)
		for i2, v2 in pairs(decodedjson) do
			if v2["type"] == "file" then
			   getcustomassetfunc(path2.."/"..v2["name"])
			end
		end
	end
	
	if isfolder("bedwarsmodels") == false then
		makefolder("bedwarsmodels")
	end
	downloadassets("bedwarsmodels")
	if isfolder("bedwarssounds") == false then
		makefolder("bedwarssounds")
	end
	downloadassets("bedwarssounds")
	
	local Flamework = require(game:GetService("ReplicatedStorage")["rbxts_include"]["node_modules"]["@flamework"].core.out).Flamework
	local newupdate = game.Players.LocalPlayer.PlayerScripts.TS:FindFirstChild("ui") and true or false
	repeat task.wait() until Flamework.isInitialized
	local KnitClient = debug.getupvalue(require(game:GetService("Players").LocalPlayer.PlayerScripts.TS.knit).setup, 6)
	local soundslist = require(game:GetService("ReplicatedStorage").TS.sound["game-sound"]).GameSound
	local sounds = (newupdate and require(game:GetService("ReplicatedStorage")["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out).SoundManager or require(game:GetService("ReplicatedStorage").TS.sound["sound-manager"]).SoundManager)
	local footstepsounds = require(game:GetService("ReplicatedStorage").TS.sound["footstep-sounds"])
	local items = require(game:GetService("ReplicatedStorage").TS.item["item-meta"])
	local itemtab = debug.getupvalue(items.getItemMeta, 1)
	local maps = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.game.map["map-meta"]).getMapMeta, 1)
	local defaultremotes = require(game:GetService("ReplicatedStorage").TS.remotes).default
	local battlepassutils = require(game:GetService("ReplicatedStorage").TS["battle-pass"]["battle-pass-utils"]).BattlePassUtils
	local inventoryutil = require(game:GetService("ReplicatedStorage").TS.inventory["inventory-util"]).InventoryUtil
	local inventoryentity = require(game.ReplicatedStorage.TS.entity.entities["inventory-entity"]).InventoryEntity
	local notification = require(game:GetService("ReplicatedStorage")["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out.client.ui.notifications.components["notification-card"]).NotificationCard
	local hotbartile = require(game:GetService("Players").LocalPlayer.PlayerScripts.TS.controllers.global.hotbar.ui["hotbar-tile"]).HotbarTile
	local hotbaropeninventory = require(game:GetService("Players").LocalPlayer.PlayerScripts.TS.controllers.global.hotbar.ui["hotbar-open-inventory"]).HotbarOpenInventory
	local hotbarpartysection = require(game:GetService("Players").LocalPlayer.PlayerScripts.TS.controllers.global.hotbar.ui.party["hotbar-party-section"]).HotbarPartySection
	local hotbarspectatesection = require(game:GetService("Players").LocalPlayer.PlayerScripts.TS.controllers.global.hotbar.ui.spectate["hotbar-spectator-section"]).HotbarSpectatorSection
	local hotbarcustommatchsection = require(game:GetService("Players").LocalPlayer.PlayerScripts.TS.controllers.global.hotbar.ui["custom-match"]["hotbar-custom-match-section"]).HotbarCustomMatchSection
	local respawntimer = require(game:GetService("Players").LocalPlayer.PlayerScripts.TS.controllers.games.bedwars.respawn.ui["respawn-timer"])
	local hotbarhealthbar = require(game:GetService("Players").LocalPlayer.PlayerScripts.TS.controllers.global.hotbar.ui.healthbar["hotbar-healthbar"]).HotbarHealthbar
	local appcontroller = {closeApp = function() end}
	if newupdate then
		appcontroller = require(game:GetService("ReplicatedStorage")["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out.client.controllers["app-controller"]).AppController
	end
	local getQueueMeta = function() end
	if newupdate then
		local queuemeta = require(game:GetService("ReplicatedStorage").TS["game"]["queue-meta"]).QueueMeta
		getQueueMeta = function(type)
			return queuemeta[type]
		end
	else
		getQueueMeta = require(game:GetService("ReplicatedStorage").TS["game"]["queue-meta"]).getQueueMeta
	end
	local hud2
	local hotbarapp = require(game:GetService("Players").LocalPlayer.PlayerScripts.TS.controllers.global.hotbar.ui["hotbar-app"]).HotbarApp
	local hotbarapp2 = require(game:GetService("Players").LocalPlayer.PlayerScripts.TS.controllers.global.hotbar.ui["hotbar-app"])
	local itemshopapp = require(game:GetService("Players").LocalPlayer.PlayerScripts.TS.controllers.games.bedwars.shop.ui["item-shop"]["bedwars-item-shop-app"])[(newupdate and "BedwarsItemShopAppBase" or "BedwarsItemShopApp")]
	local teamshopapp = require(game:GetService("Players").LocalPlayer.PlayerScripts.TS.controllers.games.bedwars["generator-upgrade"].ui["bedwars-team-upgrade-app"]).BedwarsTeamUpgradeApp
	local victorysection = require(game:GetService("Players").LocalPlayer.PlayerScripts.TS.controllers["game"].match.ui["victory-section"]).VictorySection
	local battlepasssection = require(game:GetService("Players").LocalPlayer.PlayerScripts.TS.controllers.games.bedwars["battle-pass-progression"].ui["battle-pass-progession-app"]).BattlePassProgressionApp
	local bedwarsshopitems = require(game:GetService("ReplicatedStorage").TS.games.bedwars.shop["bedwars-shop"]).BedwarsShop
	local bedwarsbows = require(game:GetService("ReplicatedStorage").TS.games.bedwars["bedwars-bows"]).BedwarsBows
	local roact = debug.getupvalue(hotbartile.render, 1)
	local clientstore = (newupdate and require(game:GetService("Players").LocalPlayer.PlayerScripts.TS.ui.store).ClientStore or require(game.Players.LocalPlayer.PlayerScripts.TS.rodux.rodux).ClientStore)
	local client = require(game:GetService("ReplicatedStorage").TS.remotes).default.Client
	local colorutil = debug.getupvalue(hotbartile.render, 2)
	local soundmanager = require(game:GetService("ReplicatedStorage").rbxts_include.node_modules["@easy-games"]["game-core"].out).SoundManager
	local itemviewport = require(game:GetService("Players").LocalPlayer.PlayerScripts.TS.controllers.global.inventory.ui["item-viewport"]).ItemViewport
	local empty = debug.getupvalue(hotbartile.render, 6)
	local tween = debug.getupvalue(hotbartile.tweenPosition, 1)
	local flashing = false
	local realcode = ""
	local oldrendercustommatch = hotbarcustommatchsection.render
	local crosshairref = roact.createRef()
	local beddestroyref = roact.createRef()
	local trapref = roact.createRef()
	local timerref = roact.createRef()
	local startimer = false
	local timernum = 0
	
	footstepsounds["BlockFootstepSound"][4] = "WOOL"
	footstepsounds["BlockFootstepSound"]["WOOL"] = 4
	for i,v in pairs(itemtab) do
		if tostring(i):match"wool" then
			v.footstepSound = footstepsounds["BlockFootstepSound"]["WOOL"]
		end
	end
	
	for i,v in pairs(listfiles("bedwarssounds")) do
		local str = tostring(tostring(v):gsub('bedwarssounds\\', ""):gsub(".mp3", ""))
		local item = soundslist[str]
		if item then
			soundslist[str] = getcustomassetfunc(v)
		end
	end
	for i,v in pairs(listfiles("bedwarsmodels")) do
		if lplr.Character then else repeat task.wait() until lplr.Character end
		local str = tostring(tostring(v):gsub('bedwarsmodels\\', ""):gsub(".png", ""))
		local item = game:GetService("ReplicatedStorage").Items:FindFirstChild(str)
		local item2 = lplr.Character:FindFirstChild(str)
		if item then
			if isfile("bedwarsmodels/"..str..".mesh") then
				item.Handle.MeshId = getcustomassetfunc("bedwarsmodels/"..str..".mesh")
				item.Handle.TextureID = getcustomassetfunc("bedwarsmodels/"..str..".png")
				for i2,v2 in pairs(item.Handle:GetDescendants()) do
					if v2:IsA("MeshPart") then
						v2.Transparency = 1
					end
				end
			else
				for i2,v2 in pairs(item:GetDescendants()) do
					if v2:IsA("Texture") then
						v2.Texture = getcustomassetfunc(v)
					end
				end
			end
		end
		if item2 then
			if isfile("bedwarsmodels/"..str..".mesh") then
				item2.Handle.MeshId = getcustomassetfunc("bedwarsmodels/"..str..".mesh")
				item2.Handle.TextureID = getcustomassetfunc("bedwarsmodels/"..str..".png")
				for i2,v2 in pairs(item.Handle:GetDescendants()) do
					if v2:IsA("MeshPart") then
						v2.Transparency = 1
					end
				end
			else
				for i2,v2 in pairs(item2:GetDescendants()) do
					if v2:IsA("Texture") then
						v2.Texture = getcustomassetfunc(v)
					end
				end
			end
		end
		childaddedcon = lplr.Character.ChildAdded:Connect(function(iteme)
			if item2 then
				if isfile("bedwarsmodels/"..str..".mesh") then
					if not item2:FindFirstChild("Handle") then repeat task.wait() until item2:FindFirstChild("Handle") end
					item2.Handle.MeshId = getcustomassetfunc("bedwarsmodels/"..str..".mesh")
					item2.Handle.TextureID = getcustomassetfunc("bedwarsmodels/"..str..".png")
					for i2,v2 in pairs(item2.Handle:GetDescendants()) do
						if v2:IsA("MeshPart") then
							v2.Transparency = 1
						end
					end
				else
					for i2,v2 in pairs(item2:GetDescendants()) do
						if v2:IsA("Texture") then
							v2.Texture = getcustomassetfunc(v)
						end
					end
				end
			end
		end)
		charaddedcon = lplr.CharacterAdded:Connect(function()
			childadded:Disconnect()
			item2 = lplr.Character:FindFirstChild(str)
			if item2 then
				if isfile("bedwarsmodels/"..str..".mesh") then
					if not item2:FindFirstChild("Handle") then repeat task.wait() until item2:FindFirstChild("Handle") end
					item2.Handle.MeshId = getcustomassetfunc("bedwarsmodels/"..str..".mesh")
					item2.Handle.TextureID = getcustomassetfunc("bedwarsmodels/"..str..".png")
					for i2,v2 in pairs(item2.Handle:GetDescendants()) do
						if v2:IsA("MeshPart") then
							v2.Transparency = 1
						end
					end
				else
					for i2,v2 in pairs(item2:GetDescendants()) do
						if v2:IsA("Texture") then
							v2.Texture = getcustomassetfunc(v)
						end
					end
				end
			end
			childaddedcon = lplr.Character.ChildAdded:Connect(function(iteme)
				if item2 then
					if isfile("bedwarsmodels/"..str..".mesh") then
						if not item2:FindFirstChild("Handle") then repeat task.wait() until item2:FindFirstChild("Handle") end
						item2.Handle.MeshId = getcustomassetfunc("bedwarsmodels/"..str..".mesh")
						item2.Handle.TextureID = getcustomassetfunc("bedwarsmodels/"..str..".png")
						for i2,v2 in pairs(item2.Handle:GetDescendants()) do
							if v2:IsA("MeshPart") then
								v2.Transparency = 1
							end
						end
					else
						for i2,v2 in pairs(item2:GetDescendants()) do
							if v2:IsA("Texture") then
								v2.Texture = getcustomassetfunc(v)
							end
						end
					end
				end
			end)
		end)
	end
	for i,v in pairs(getgc(true)) do
		if type(v) == "table" and rawget(v, "wool_blue") and type(v["wool_blue"]) == "table" then
			for i2,v2 in pairs(v) do
				if isfile("bedwarsmodels/"..i2..".png") then
					if rawget(v2, "block") and rawget(v2["block"], "greedyMesh") then
						if #v2["block"]["greedyMesh"]["textures"] > 1 and isfile("bedwarsmodels/"..i2.."_side_1.png") then
							for i3,v3 in pairs(v2["block"]["greedyMesh"]["textures"]) do
								v2["block"]["greedyMesh"]["textures"][i3] = getcustomassetfunc("bedwarsmodels/"..i2.."_side_"..i3..".png")
							end
						else
						 v2["block"]["greedyMesh"]["textures"] = {
								[1] = getcustomassetfunc("bedwarsmodels/"..i2..".png")
						 }
						end
						if isfile("bedwars/"..i2.."_image.png") then
							v2["image"] = getcustomassetfunc("bedwarsmodels/"..i2.."_image.png")
						end
					else
						v2["image"] = getcustomassetfunc("bedwarsmodels/"..i2..".png")
					end
				end
			end
		end
	end
	for a, e in pairs(workspace.Map:GetChildren()) do
		if e.Name == "Blocks" and e:IsA("Folder") or e:IsA("Model") then
			for i, v in pairs(e:GetDescendants()) do
				if isfile("bedwarsmodels/"..v.Name..".png") then
					for i2,v2 in pairs(v:GetDescendants()) do
						if v2:IsA("Texture") then
							v2.Texture = getcustomassetfunc("bedwarsmodels/"..v.Name..".png")
						end
					end
				end
			end
		end
	end
	
	workspace.DescendantAdded:Connect(function(v)
		for a,e in pairs(workspace.Map:GetChildren()) do
			if e.Name == "Blocks" and e:IsA("Folder") then
				if v.Parent and isfile("bedwarsmodels/"..v.Name..".png") then
					for i2,v2 in pairs(e:GetDescendants()) do
						if v2:IsA("Texture") then
							v2.Texture = getcustomassetfunc("bedwarsmodels/"..v2.Name..".png")
						end
					end
					e.DescendantAdded:connect(function(v3)
						if v3:IsA("Texture") then
							v3.Texture = getcustomassetfunc("bedwarsmodels/"..v3.Name..".png")
						end
					end)
				end
				if v:IsA("Accessory") and isfile("bedwarsmodels/"..v.Name..".mesh") then
					task.spawn(function()
						local handle = v:WaitForChild("Handle")
						handle.MeshId = getcustomassetfunc("bedwarsmodels/"..v.Name..".mesh")
						handle.TextureID = getcustomassetfunc("bedwarsmodels/"..v.Name..".png")
						for i2,v2 in pairs(handle:GetDescendants()) do
							if v2:IsA("MeshPart") then
								v2.Transparency = 1
							end
						end
					end)
				end
			end
		end
	end)
				else
					createwarning("ReTexture", "Disabled Next Game", 10)
				end
			end
		})
	end)

runcode(function()
local infJumpConnection
local infjump = {["Enabled"] = false}
infjump = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
    ["Name"] = "InfiniteJump",
    ["HoverText"] = "Jump without touching ground",
    ["Function"] = function(callback) 
        if callback then    
            infJumpConnection = uis.InputBegan:Connect(function(input)
                if input.KeyCode == Enum.KeyCode.Space and not uis:GetFocusedTextBox() then
                    if InfHold.Enabled and entity.isAlive then 
                        repeat 
                        lplr.Character:WaitForChild("Humanoid"):ChangeState("Jumping")
                        task.wait()
                        until not uis:IsKeyDown(Enum.KeyCode.Space) or not infjump.Enabled or not InfHold.Enabled or uis:GetFocusedTextBox()
                    else 
                        if entity.isAlive then 
                                lplr.Character:WaitForChild("Humanoid"):ChangeState("Jumping")
                            end 
                        end 
                    end
                end)
            else
                if infJumpConnection then
                    infJumpConnection:Disconnect()
                end
            end
        end
    })
    InfHold = infjump.CreateToggle({
        ["Name"] = "Hold",
        ["HoverText"] = "Hold down space to jump?",
        ["Function"] = function() end
    })
end)

--pistonware

runcode(function()
	local PurpleAntivoid = {["Enabled"] = false}
	PurpleAntivoid = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
			["Name"] = "Purple Antivoid",
			["HoverText"] = "Purple Antivoid",
			["Function"] = function(callback)
				if callback then
		local part = Instance.new("Part", Workspace)
				part.Name = "AntiVoid"
				part.Size = Vector3.new(2100, 0.5, 2000)
				part.Position = Vector3.new(160.5, 25, 247.5)
				part.Transparency = 0.4
				part.Anchored = true
			part.Color = Color3.fromRGB(111, 43, 150)
				else               
			game.Workspace.AntiVoid:Destroy()
				end
			end
		})
	end)

local PistonwareAmbience = {["Enabled"] = false}
PistonwareAmbience = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
	["Name"] = "PurpleWareAmbience",
	["Function"] = function(callback)
		if callback then
			local Lighting = game:GetService("Lighting")
Lighting.Ambient = Color3.fromRGB(111, 43, 150)
Lighting.ColorShift_Bottom = Color3.fromRGB(111, 43, 150)
Lighting.ColorShift_Top = Color3.fromRGB(111, 43, 150)
Lighting.OutdoorAmbient = Color3.fromRGB(111, 43, 150)
Lighting.ColorShift_Bottom = Color3.fromRGB(111, 43, 150)
Lighting.ColorShift_Top = Color3.fromRGB(111, 43, 150)

local s = Instance.new("Sky")
s.Name = "loltroll"
s.SkyboxBk = "http://www.roblox.com/asset/?id=1045964490"
s.SkyboxDn = "http://www.roblox.com/asset/?id=1045964368"
s.SkyboxFt = "http://www.roblox.com/asset/?id=1045964655"
s.SkyboxLf = "http://www.roblox.com/asset/?id=1045964655"
s.SkyboxRt = "http://www.roblox.com/asset/?id=1045964655"
s.SkyboxUp = "http://www.roblox.com/asset/?id=1045962969"
s.Parent = Lighting
			else
		createwarning("PurpleWare", "Join A New Match To Reset Skybox And Ambience.", 3)
		end
	end
})
runcode(function()
    local HeatseekerSpeed = {["Enabled"] = false}
    HeatseekerSpeed = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
        ["Name"] = "Heatseeker",
        ["HoverText"] = "Turn Off Vape Speed",
        ["Function"] = function(v)
	speedlol = v
        if speedlol then
	task.wait(2.4)
	spawn(function()           
	repeat
        if (not speedlol and not onground) then return end
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 20
        createwarning("PurpleWare", "boost", 10.7)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 80
	task.wait(0.07)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 20
	task.wait(1)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 55
	task.wait(0.05)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 20
	task.wait(10)
        until (not speedlol) 
            end)
        else
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 20
      	end
      end
    })
    end)

	runcode(function()
    local Chat = {["Enabled"] = false}
    Chat = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
        ["Name"] = "Chat",
        ["HoverText"] = "Moves the Chat",
        ["Function"] = function(callback)
            if callback then
                game:GetService("StarterGui"):SetCore('ChatWindowPosition', UDim2.new(0, 0, 0.7, 0))
            else
                game:GetService("StarterGui"):SetCore('ChatWindowPosition', UDim2.new(0, 0, 0, 0))
            end
        end
    })
end)
	
	local KillFeed = {["Enabled"] = false}
	KillFeed = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
		["Name"] = "KillFeed",
		["HoverText"] = "Destroys the KillFeed",
		["Function"] = function(callback)
			if callback then
				game:GetService("Players").LocalPlayer.PlayerGui.KillFeedGui.KillFeedContainer.Visible = false
				else
				game:GetService("Players").LocalPlayer.PlayerGui.KillFeedGui.KillFeedContainer.Visible = true
			end
		end
	})
	
	local HumanoidRootPart = {["Enabled"] = false}
	HumanoidRootPart = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
		["Name"] = "HumanoidRootPart",
		["HoverText"] = "Destroys your HumanoidRootPart",
		["Function"] = function(callback)
			if callback then
			repeat task.wait() until game:IsLoaded()
			repeat task.wait() until game:GetService("ReplicatedStorage"):FindFirstChild("Inventories"):FindFirstChild(game.Players.LocalPlayer.Name):FindFirstChild("wood_sword");
			local plr = game.Players.LocalPlayer
					local chr = plr.Character
					local hrp = chr.HumanoidRootPart
						hrp.Parent = nil
						   chr:MoveTo(chr:GetPivot().p)
								task.wait()
								hrp.Parent = chr
				else
				createwarning("PurpleWare", "Reset to disable", 3)
			end
		end
	})
	
	local CFrameHighJump = {["Enabled"] = false}
	CFrameHighJump = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
		["Name"] = "CFrameHighJump",
		["HoverText"] = "DISABLE GRAVITY",
		["Function"] = function(v)
		verticalflylol = v
		if verticalflylol then
		Workspace.Gravity = 0
		lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame + Vector3.new(0, -2, 0)
		spawn(function()
					repeat
		if (not verticalflylol) then return end
		Workspace.Gravity = 0
		lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0)
		task.wait(0.05)
		lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
		until (not verticalflylol) 
			end)	
		else
		Workspace.Gravity = 196.2
		end
		end
	})
	
	runcode(function()
	local NameHider = {["Enabled"] = true}
	NameHider = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
		["Name"] = "NameHider",
		["HoverText"] = "Disable TargetHud",
		["Function"] = function(callback)
			if callback then
			repeat task.wait() until game:IsLoaded()
	
	local fakeplr = {["Name"] = "0prime", ["UserId"] = "239702688"}
	local otherfakeplayers = {["Name"] = "0prime", ["UserId"] = "1"}
	local lplr = game:GetService("Players").LocalPlayer
	
	local function plrthing(obj, property)
		for i,v in pairs(game:GetService("Players"):GetChildren()) do
			if v ~= lplr then
				obj[property] = obj[property]:gsub(v.Name, otherfakeplayers["Name"])
				obj[property] = obj[property]:gsub(v.DisplayName, otherfakeplayers["Name"])
				obj[property] = obj[property]:gsub(v.UserId, otherfakeplayers["UserId"])
			else
				obj[property] = obj[property]:gsub(v.Name, fakeplr["Name"])
				obj[property] = obj[property]:gsub(v.DisplayName, fakeplr["Name"])
				obj[property] = obj[property]:gsub(v.UserId, fakeplr["UserId"])
			end
		end
	end
	
	local function newobj(v)
		if v:IsA("TextLabel") or v:IsA("TextButton") then
			plrthing(v, "Text")
			v:GetPropertyChangedSignal("Text"):connect(function()
				plrthing(v, "Text")
			end)
		end
		if v:IsA("ImageLabel") then
			plrthing(v, "Image")
			v:GetPropertyChangedSignal("Image"):connect(function()
				plrthing(v, "Image")
			end)
		end
	end
	
	for i,v in pairs(game:GetDescendants()) do
		newobj(v)
	end
	game.DescendantAdded:connect(newobj)
		else
				createwarning("PurpleWare", "Join A New Match To Reset Your Name And Other Names.", 3)
			end
		end
	})
	end)
	
	runcode(function()
	local PistonwareLongJump = {["Enabled"] = false}
	PistonwareLongJump = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
		["Name"] = "Old LongJump",
		["HoverText"] = "LongJump Before Vape Christmas Update",
		["Function"] = function(callback)
			if callback then
			Workspace.Gravity = 10
			lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
			lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
				else
				Workspace.Gravity = 196.2
			end
		end
	})
	end)

-- Explosion Exploit
local ExplosionExploit = {["Enabled"] = false}
ExplosionExploit = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
		["Name"] = "ExplosionExploit",
		["HoverText"] = "Enable When a TNT Explodes Near You (Use For 0.01 Seconds, Doesn't Work With Speed)",
		["Function"] = function(callback)
			if callback then
				getgenv().WalkSpeedValue = 90;
				local Player = game:service'Players'.LocalPlayer;
				Player.Character.Humanoid:GetPropertyChangedSignal'WalkSpeed':Connect(function()
				Player.Character.Humanoid.WalkSpeed = getgenv().WalkSpeedValue;
				end)
				Player.Character.Humanoid.WalkSpeed = getgenv().WalkSpeedValue;
			else
				getgenv().WalkSpeedValue = 20;
				local Player = game:service'Players'.LocalPlayer;
				Player.Character.Humanoid:GetPropertyChangedSignal'WalkSpeed':Connect(function()
				Player.Character.Humanoid.WalkSpeed = getgenv().WalkSpeedValue;
				end)
				Player.Character.Humanoid.WalkSpeed = getgenv().WalkSpeedValue;
			end
		end 
    })

-- AntiAFK
runcode(function()
	local AntiAFK = {["Enabled"] = false}
    AntiAFK = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
        ["Name"] = "AntiAFK",
		["HoverText"] = "Prevents from being kicked when afk",
        ["Function"] = function(callback)
            if callback then
				getgenv().AntiAFK = true;
				if getgenv().AntiAFK == true then
					repeat
						wait()
					until game:GetService("Players")
					
					repeat
						wait()
					until game:GetService("Players").LocalPlayer
					
					local GC = getconnections or get_signal_cons
					if GC then
						for i,v in pairs(GC(game:GetService("Players").LocalPlayer.Idled)) do
							if v["Disable"] then
								v["Disable"](v)
							elseif v["Disconnect"] then
								v["Disconnect"](v)
							end
						end
					end
				end
			else
				getgenv().AntiAFK = false;
			end
		end
	})
end)

--grass private
--no logger LMAO
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local yes = Players.LocalPlayer.Name
local ChatTag = {}
ChatTag[yes] =
	{
        TagText = "PurpleWare User",
        TagColor = Color3.new(61,0,113,1),
    }



    local oldchanneltab
    local oldchannelfunc
    local oldchanneltabs = {}

--// Chat Listener
for i, v in pairs(getconnections(ReplicatedStorage.DefaultChatSystemChatEvents.OnNewMessage.OnClientEvent)) do
	if
		v.Function
		and #debug.getupvalues(v.Function) > 0
		and type(debug.getupvalues(v.Function)[1]) == "table"
		and getmetatable(debug.getupvalues(v.Function)[1])
		and getmetatable(debug.getupvalues(v.Function)[1]).GetChannel
	then
		oldchanneltab = getmetatable(debug.getupvalues(v.Function)[1])
		oldchannelfunc = getmetatable(debug.getupvalues(v.Function)[1]).GetChannel
		getmetatable(debug.getupvalues(v.Function)[1]).GetChannel = function(Self, Name)
			local tab = oldchannelfunc(Self, Name)
			if tab and tab.AddMessageToChannel then
				local addmessage = tab.AddMessageToChannel
				if oldchanneltabs[tab] == nil then
					oldchanneltabs[tab] = tab.AddMessageToChannel
				end
				tab.AddMessageToChannel = function(Self2, MessageData)
					if MessageData.FromSpeaker and Players[MessageData.FromSpeaker] then
						if ChatTag[Players[MessageData.FromSpeaker].Name] then
							MessageData.ExtraData = {
								NameColor = Players[MessageData.FromSpeaker].Team == nil and Color3.new(135,206,235)
									or Players[MessageData.FromSpeaker].TeamColor.Color,
								Tags = {
									table.unpack(MessageData.ExtraData.Tags),
									{
										TagColor = ChatTag[Players[MessageData.FromSpeaker].Name].TagColor,
										TagText = ChatTag[Players[MessageData.FromSpeaker].Name].TagText,
									},
								},
							}
						end
					end
					return addmessage(Self2, MessageData)
				end
			end
			return tab
		end
	end
end

runcode(function()
	local anticheat222 = {["Enabled"] = false}
	anticheat222 = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
		["Name"] = "/DIE",
		["HoverText"] = "/die real command",
		["Function"] = function(callback)
			if callback then
				wait(0.001)
				local x = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x
local y = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y 
local z = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.z
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x,y-10,z)
			else
				print ("rip lol")
			end
		end 
	})
end)

	
	local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart	
	


	local lplr = game:GetService("Players").LocalPlayer
local KnitClient = debug.getupvalue(require(lplr.PlayerScripts.TS.knit).setup, 6)
local Client = require(game:GetService("ReplicatedStorage").TS.remotes).default.Client


local notifications = {["Enabled"] = false}

Client:WaitFor("BedwarsBedBreak"):andThen(function(p13)
	p13:Connect(function(p14)
		if notifications["Enabled"] then
			local team = p14.brokenBedTeam.displayName
			if team == lplr.Team.Name then
				createwarning("Bed broken!", "Your bed got broken LOL", 7)
			end
		end
	end)
end)


Client:WaitFor("BedwarsBedBreak"):andThen(function(p13)
	p13:Connect(function(p14)
		if notifications["Enabled"] then
			if p14.player.Name == lplr.Name then
				createwarning("Broken bed!", "you broke a bed", 7)
			end
		end
	end)
end)

Client:WaitFor("EntityDeathEvent"):andThen(function(p13)
	p13:Connect(function(p14)
		if notifications["Enabled"] then
			if p14.player.Name == lplr.Name then
				createwarning("LOL!", "oof lol", 7)
			end
		end
	end)
end)



Client:WaitFor("EntityDeathEvent"):andThen(function(p6)
	p6:Connect(function(p7)
		if notifications["Enabled"] then
			if p7.fromEntity and p7.fromEntity == lplr.Character then
				local plr = players:GetPlayerFromCharacter(p7.entityInstance)
				createwarning("you killed", plr.Name.."ez", 7)
			end
		end
	end)
end)

local notifications = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
	["Name"] = "Notifications",
	["Function"]= function(callback) notifications["Enabled"] = callback end,
	["HoverText"] = "Sends you a notification when certain actions happen (bed brake,kill,ect)"
})

youtubedetector = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
	["Name"] = "Youtube detector/star detector", 
	["Function"] = function(callback)
		if callback then
			for i, plr in pairs(players:GetChildren()) do
				if plr:IsInGroup(4199740) and plr:GetRankInGroup(4199740) >= 1 then
					createwarning("Vape", "Youtuber found " .. plr.Name .. "(" .. plr.DisplayName .. ")", 20)
					end
				end
			end
		end
})

--heee
--OFFICAL APE SRC CODE
--purple Skybox
  local skybox11 = {["Enabled"] = false}
  skybox11 = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
      ["Name"] = "PurpleSkybox",
      ["Function"] = function(callback)
          if callback then
              local sky = Instance.new("Sky",game.Lighting)
              sky.MoonAngularSize = "0"
              sky.MoonTextureId = "rbxassetid://6444320592"
              sky.SkyboxBk = "rbxassetid://8107841671"
              sky.SkyboxDn = "rbxassetid://6444884785"
              sky.SkyboxFt = "rbxassetid://8107841671"
              sky.SkyboxLf = "rbxassetid://8107841671"
              sky.SkyboxRt = "rbxassetid://8107841671"
              sky.SkyboxUp = "rbxassetid://8107849791"
              sky.SunTextureId = "rbxassetid://6196665106"

          else
              local sky2 = Instance.new("Sky",game.Lighting)
              sky2.MoonAngularSize = "11"
              sky2.MoonTextureId = "rbxasset://sky/moon.jpg"
              sky2.SkyboxBk = "rbxassetid://7018684000"
              sky2.SkyboxDn = "rbxassetid://6334928194"
              sky2.SkyboxFt = "rbxassetid://7018684000"
              sky2.SkyboxLf = "rbxassetid://7018684000"
              sky2.SkyboxRt = "rbxassetid://7018684000"
              sky2.SkyboxUp = "rbxassetid://7018689553"
              sky2.SunTextureId = "rbxasset://sky/sun.jpg"
              sky2.SunAngularSize = "21"
          end
      end
  })

      --purple Ambience
  local Ambience1 = {["Enabled"] = false}
  Ambience1 = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
      ["Name"] = "PurpleAmbience",
      ["Function"] = function(callback)
          if callback then
              game.Lighting.ColorCorrection.TintColor = Color3.fromRGB(170, 170, 255)
              game.Lighting.Ambient = Color3.fromRGB(170, 170, 255)
              game.Lighting.OutdoorAmbient = Color3.fromRGB(170, 170, 255)
          else
              game.Lighting.ColorCorrection.TintColor = Color3.fromRGB(255, 255, 255)
              game.Lighting.Ambient = Color3.fromRGB(255, 255, 255)
              game.Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
          end
      end
  })

  local plr1 = game.Players.LocalPlayer
createwarning("PurpleWare", "Logged in as "..(plr1.Name or plr1.DisplayName), 3)
createwarning("PurpleWare ", "Thank You For Using PurpleWare", 3)

runcode(function()
	local SizeChanger = {["Enabled"] = false}
    SizeChanger = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
        ["Name"] = "SizeChanger",
		["HoverText"] = "Changes The Size Of a Item",
        ["Function"] = function(callback)
            if callback then
				RunLoops:BindToHeartbeat("SizeThing", 1, function()
					for i, v in pairs(game:GetService("Workspace").Camera.Viewmodel:GetChildren()) do
						if (v:IsA("Accessory")) then
							if v:FindFirstChild("Handle").Anchored == true then
								break
							else
								if v:FindFirstChild("Handle") then
									v.Handle.Size =  v.Handle.Size / 3
									v:FindFirstChild("Handle").Anchored = true
								end
								if v:FindFirstChild("Handle"):FindFirstChild("Neon") then
									v:FindFirstChild("Handle"):FindFirstChild("Neon"):Destroy()
								end
								if v:FindFirstChild("Handle"):FindFirstChild("gem") then
									v:FindFirstChild("Handle"):FindFirstChild("gem"):Destroy()
								end
							end
						end
					end
				end)
			else
				RunLoops:UnbindFromHeartbeat("SizeThing")
				createwarning("PurpleWare", "Disabled Next Time You Die", 3)
			end
		end
	})
end)

runcode(function()
	local VelocityHighJump = {["Enabled"] = true}
    VelocityHighJump = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
        ["Name"] = "ShortFly",
		["HoverText"] = "For Short Distances [20 Blocks]",
        ["Function"] = function(callback)
            if callback then
				if YlevelTeller["Enabled"] then
					local Ylevel = Instance.new("TextLabel")
                    Ylevel.Name = "Ylevel"
                    Ylevel.Parent = game.CoreGui.RobloxGui
                    Ylevel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Ylevel.BackgroundTransparency = 1.000
                    Ylevel.Position = UDim2.new(0.885590136, 0, 0.916458845, 0)
                    Ylevel.Size = UDim2.new(0, 200, 0, 50)
                    Ylevel.Font = Enum.Font.SourceSans
                    Ylevel.Text = "Ylevel  = 1"
                    Ylevel.TextColor3 = Color3.fromRGB(0, 0, 0)
                    Ylevel.TextSize = 28.000
					spawn(function()
						repeat
							local YlevelThingy = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y
							YlevelThingy = math.floor(YlevelThingy)
							task.wait(0.1)
							Ylevel.Text = "Ylevel = "..YlevelThingy
						until Ylevel.Text == nil
					end)
				end
				local OriginalPosX = game.Players.LocalPlayer.character.HumanoidRootPart.Position.y 
                local CameraPart = Instance.new("Part", game.workspace)
				CameraPart.Size = Vector3.new(1,1,1)
                CameraPart.Anchored = true
                CameraPart.Transparency = 1
                CameraPart.CanCollide = false
                CameraPart.Name = "CameraPart"
				cam.CameraSubject = game.workspace.CameraPart
				RunLoops:BindToHeartbeat("HumanoidToCamera", 1, function()
					local Pos = game.Players.LocalPlayer.character.HumanoidRootPart.Position
					CameraPart.Position = Vector3.new(Pos.x, OriginalPosX, Pos.z)
				end)
				if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
					iea2 = 0
					while iea2 <= VelocityHighJumpAmmount do
						iea2 = iea2 + 1
						game.Players.LocalPlayer.character.HumanoidRootPart.Velocity = game.Players.LocalPlayer.character.HumanoidRootPart.Velocity + Vector3.new(0,30,0)
					end
					wait(5)
					for i , v in pairs(game.CoreGui.RobloxGui:GetChildren()) do
						if v.Name == "Ylevel" then
							game.CoreGui.RobloxGui.Ylevel:Destroy()
						else
							print("no")
						end
					end
					VelocityHighJump["ToggleButton"](false)
					iea2 = iea2 + 10
					if iea2 > VelocityHighJumpAmmount then
						createwarning("PurpleWare ", "Please Do Not PressKeys", 3)
						RunLoops:UnbindFromHeartbeat("HumanoidToCamera")
						task.wait(1.7)
						cam.CameraSubject = game.Players.LocalPlayer.character.Humanoid
						game.workspace.CameraPart:Destroy()
					end

				else
					VelocityHighJump["ToggleButton"](false)
				end
			end
		end
	})

	
	VelocityHighJumpAmmount = VelocityHighJump.CreateSlider({
		["Name"] = "Amount",
		["Min"] = 5,
		["Max"] = 20,
		["Default"] = 20,
		["Function"] = function(val)
			VelocityHighJumpAmmount = val
		end
	})

	YlevelTeller = VelocityHighJump.CreateToggle({
		["Name"] = "Ylevel",
		["Function"] = function() end, 
		["Default"] = true,
		["HoverText"] = "Ylevel"
	})

end)

GrassDetector1 = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
    ["Name"] = "PurpleWare Owner Detector",
	["HoverText"] = "Sends a Notification when PurpleWare Owner was in the game.", 
    ["Function"] = function(callback)
        if callback then
            for i, plr in pairs(players:GetChildren()) do
                if plr:IsInGroup(17046846) and plr:GetRankInGroup(17046846) >= 255 then
                    createwarning("PurpleWare", "PurpleWare owner main acc " .. plr.Name .. " (" .. plr.DisplayName .. ")", 20)
                    end
                end
            end
        end
})



GrassDetector = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
    ["Name"] = "PurpleWare Staff Detector",
	["HoverText"] = "Sends a Notification when PurpleWare Staff was in the game.", 
    ["Function"] = function(callback)
        if callback then
            for i, plr in pairs(players:GetChildren()) do
                if plr:IsInGroup(17046846) and plr:GetRankInGroup(17046846) >= 254 then
                    createwarning("PurpleWare", "This may be a PurpleWare staff or Jayyy's alt acc " .. plr.Name .. " (" .. plr.DisplayName .. ")", 20)
                    end
                end
            end
        end
})



GrassDetector2 = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
    ["Name"] = "PurpleWare User Detector",
	["HoverText"] = "Sends a Notification when PurpleWare User was in the game.", 
    ["Function"] = function(callback)
        if callback then
            for i, plr in pairs(players:GetChildren()) do
                if plr:IsInGroup(17046846) and plr:GetRankInGroup(17046846) >= 1 then
                    createwarning("PurpleWare", "This guy is using PurpleWare :) " .. plr.Name .. " (" .. plr.DisplayName .. ")", 20)
                    end
                end
            end
        end
})
