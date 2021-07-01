-------------------------------------------------------------------------------
-- AdiBags Relics By Crackpot (US, Arthas)
-------------------------------------------------------------------------------

local addonName, addon = ...
local AdiBags = LibStub("AceAddon-3.0"):GetAddon("AdiBags")

local L = addon.L
local tooltip

local function tooltipInit()
	local tip, leftside = CreateFrame("GameTooltip"), {}
	for i = 1, 6 do
		local left, right = tip:CreateFontString(), tip:CreateFontString()
		left:SetFontObject(GameFontNormal)
		right:SetFontObject(GameFontNormal)
		tip:AddFontStrings(left, right)
		leftside[i] = left
	end
	tip.leftside = leftside
	return tip
end

local setFilter = AdiBags:RegisterFilter("Korthian Relics", 98, "ABEvent-1.0")
setFilter.uiName = L["Korthian Relics"]
setFilter.uiDesc = L["Korthian Relics for new the new reputation added in 9.1."]

function setFilter:OnInitialize()
	self.relics = {
		-- From: https://www.wowhead.com/guides/archivists-codex-reputation-guide#one-time-korthian-relic-quests

		-- worth 8 research
		[187322] = true, -- Crumbling Stone Tablet
		[187457] = true, -- Engraved Glass Pane
		[187324] = true, -- Gnawed Ancient Idol
		[187323] = true, -- Runic Diagram
		[187460] = true, -- Strangely Intricate Key
		[187458] = true, -- Unearthed Teleporter Sigil
		[187459] = true, -- Vial of Mysterious Liquid
		-- worth 48 research
		[187465] = true, -- Complicated Organism Harmonizer
		[187327] = true, -- Encrypted Korthian Journal
		[187463] = true, -- Enigmatic Map Fragments
		[187325] = true, -- Faded Razorwing Anatomy Illustration
		[187326] = true, -- Half-Completed Runeforge Pattern
		[187462] = true, -- Scroll of Shadowlands Fables
		[187478] = true, -- White Razorwing Talon
		[187336] = true, -- Forbidden Weapon Schematics
		[187466] = true, -- Korthian Cypher Book
		[187332] = true, -- Recovered Page of Voices
		[187328] = true, -- Ripped Cosmology Chart
		[187334] = true -- Shattered Void Tablet
	}
end

function setFilter:Update()
	self:SendMessage("AdiBags_FiltersChanged")
end

function setFilter:OnEnable()
	AdiBags:UpdateFilters()
end

function setFilter:OnDisable()
	AdiBags:UpdateFilters()
end

function setFilter:Filter(slotData)
	if self.relics[tonumber(slotData.itemId)] then
		return L["Korthian Relics"]
	end

	tooltip = tooltip or tooltipInit()
	tooltip:SetOwner(UIParent, "ANCHOR_NONE")
	tooltip:ClearLines()

	if slotData.bag == BANK_CONTAINER then
		tooltip:SetInventoryItem("player", BankButtonIDToInvSlotID(slotData.slot, nil))
	else
		tooltip:SetBagItem(slotData.bag, slotData.slot)
	end

	tooltip:Hide()
end
