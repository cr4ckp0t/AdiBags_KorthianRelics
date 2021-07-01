-------------------------------------------------------------------------------
-- AdiBags - Korthian Relics By Crackpot (US, Arthas)
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

local relicFilter = AdiBags:RegisterFilter("Korthian Relics", 98, "ABEvent-1.0")
relicFilter.uiName = L["Korthian Relics"]
relicFilter.uiDesc = L["Korthian Relics for new the new reputation added in 9.1."]

local itemFilter = AdiBags:RegisterFilter("Korthian Items", 98, "ABEvent-1.0")
itemFilter.uiName = L["Korthian Items"]
itemFilter.uiname = L["Random items from Korthia."]

function relicFilter:OnInitialize()
	self.relics = {
		-- From: https://www.wowhead.com/guides/archivists-codex-reputation-guide#one-time-korthian-relic-quests
		-- If I missed any, open a ticket: https://github.com/cr4ckp0t/AdiBags_KorthianRelics/issues

		-- worth 1 point
		[186685] = true, -- Relic Fragment
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
		-- worth 100 research
		[187336] = true, -- Forbidden Weapon Schematics
		[187466] = true, -- Korthian Cypher Book
		[187332] = true, -- Recovered Page of Voices
		[187328] = true, -- Ripped Cosmology Chart
		[187334] = true, -- Shattered Void Tablet
		-- worth 150 research
		[187330] = true, -- Naaru Shard Fragment
		[187329] = true, -- Old God Specimen Jar
		[187467] = true, -- Perplexing Rune-Cube
		[187331] = true, -- Tattered Fae Designs
		-- worth 300 research
		[187311] = true, -- Azgoth's Tattered Maps
		[187333] = true, -- Core of an Unknown Titan
		[187350] = true, -- Displaced Relic
		[187335] = true, -- Maldraxxus Larva Shell
		-- rank 1
		[185914] = true, -- Damaged Talisman
		[187200] = true, -- Singing Steel Ingot
		[187206] = true, -- Book of Binding: The Mad Witch
		[187201] = true, -- Celestial Shadowlands Chart
		[187055] = true, -- Pouch of Rune Chits
		-- rank 2
		[187052] = true, -- The Netherstar
		[187150] = true, -- Gorak Claw Fetish
		[187047] = true, -- Gulse of the Changeling
		[187119] = true, -- Ring of Self-Reflection
		-- rank 3
		[187204] = true, -- Drum of the Death Loa
		[187103] = true, -- Everliving Statuette
		[187205] = true, -- Sack of Strange Soil
		[187104] = true, -- Obelisk of Dark Tidings
		-- rank 4
		[187210] = true, -- Book of Binding: The Tormented Sorcerer
		[187202] = true, -- Unstable Explosive Orb
		[187207] = true, -- Enigmatic Decrypting Device
		[187203] = true, -- Cipher of Understanding
		-- rank 5
		[187208] = true, -- Shadow Slicing Shortsword
		[187209] = true, -- Lang Family Wood-Carving
		[186014] = true -- Bulwark of Divine Intent
	}
end

function itemFilter:OnInitialize()
	self.items = {
		-- rank 2 keys
		[187612] = true, -- Key of Flowing Waters
		[187614] = true, -- Key of Many Thoughts
		[186984] = true, -- Korthite Crystal Key
		[187613] = true, -- Key of the Inner Chambers
		-- socket/conduit
		[187134] = true, -- Alloy-Warping Facetor
		[187148] = true, -- Death-Bound Shard
		[187216] = true, -- Soultwining Crescent
		-- random items
		[187187] = true, -- Korthian Armaments
		[185636] = true, -- The Archivists' Codex
		[185972] = true, -- Tormentor's Cache
		[186718] = true, -- Teleporter Repair Kit
		[187431] = true, -- Sleeping Armament
		[186731] = true -- Repaired Riftkey
	}
end

function relicFilter:Update()
	self:SendMessage("AdiBags_FiltersChanged")
end

function itemFilter:Update()
	self:SendMessage("AdiBags_FiltersChanged")
end

function relicFilter:OnEnable()
	AdiBags:UpdateFilters()
end

function itemFilter:OnEnable()
	AdiBags:UpdateFilters()
end

function relicFilter:OnDisable()
	AdiBags:UpdateFilters()
end

function itemFilter:OnDisable()
	AdiBags:UpdateFilters()
end

function relicFilter:Filter(slotData)
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

function itemFilter:Filter(slotData)
	if self.items[tonumber(slotData.itemId)] then
		return L["Korthian Items"]
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
