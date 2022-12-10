-------------------------------------------------------------------------------
-- AdiBags - Korthian Relics By Crackpot (US, Illidan)
-------------------------------------------------------------------------------

local addonName, addon = ...
local AdiBags = LibStub("AceAddon-3.0"):GetAddon("AdiBags")

local L = addon.L

local relicFilter = AdiBags:RegisterFilter("Korthian Relics", 98, "ABEvent-1.0")
relicFilter.uiName = L["Korthian Relics"]
relicFilter.uiDesc = L["Korthian Relics for new the new reputation added in 9.1."]

local itemFilter = AdiBags:RegisterFilter("Korthian Items", 98, "ABEvent-1.0")
itemFilter.uiName = L["Korthian Items"]
itemFilter.uiDesc = L["Random items from Korthia."]

local consumableFilter = AdiBags:RegisterFilter("Kothrian Consumables", 98, "ABEvent-1.0")
consumableFilter.uiName = L["Kothrian Consumables"]
consumableFilter.uiDesc = L["Consumables added from Kothria in 9.1."]

function relicFilter:OnInitialize()
	self.relics = {
		-- From: https://www.wowhead.com/guides/archivists-codex-reputation-guide#one-time-korthian-relic-quests
		-- If I missed any, open a ticket: https://github.com/cr4ckp0t/AdiBags_KorthianRelics/issues

		-- Worth 1 Research
		[186685] = true, -- Relic Fragment
		-- Worth 8 Research
		[187322] = true, -- Crumbling Stone Tablet
		[187457] = true, -- Engraved Glass Pane
		[187324] = true, -- Gnawed Ancient Idol
		[187323] = true, -- Runic Diagram
		[187460] = true, -- Strangely Intricate Key
		[187458] = true, -- Unearthed Teleporter Sigil
		[187459] = true, -- Vial of Mysterious Liquid
		-- Worth 48 Research
		[187465] = true, -- Complicated Organism Harmonizer
		[187327] = true, -- Encrypted Korthian Journal
		[187463] = true, -- Enigmatic Map Fragments
		[187325] = true, -- Faded Razorwing Anatomy Illustration
		[187326] = true, -- Half-Completed Runeforge Pattern
		[187462] = true, -- Scroll of Shadowlands Fables
		[187478] = true, -- White Razorwing Talon
		-- Worth 100 Research
		[187336] = true, -- Forbidden Weapon Schematics
		[187466] = true, -- Korthian Cypher Book
		[187332] = true, -- Recovered Page of Voices
		[187328] = true, -- Ripped Cosmology Chart
		[187334] = true, -- Shattered Void Tablet
		-- Worth 150 Research
		[187330] = true, -- Naaru Shard Fragment
		[187329] = true, -- Old God Specimen Jar
		[187467] = true, -- Perplexing Rune-Cube
		[187331] = true, -- Tattered Fae Designs
		-- Worth 300 Research
		[187311] = true, -- Azgoth's Tattered Maps
		[187333] = true, -- Core of an Unknown Titan
		[187350] = true, -- Displaced Relic
		[187335] = true, -- Maldraxxus Larva Shell
		-- Rank 1
		[185914] = true, -- Damaged Talisman
		[187200] = true, -- Singing Steel Ingot
		[187206] = true, -- Book of Binding: The Mad Witch
		[187201] = true, -- Celestial Shadowlands Chart
		[187055] = true, -- Pouch of Rune Chits
		-- Rank 2
		[187052] = true, -- The Netherstar
		[187150] = true, -- Gorak Claw Fetish
		[187047] = true, -- Gulse of the Changeling
		[187119] = true, -- Ring of Self-Reflection
		-- Rank 3
		[187204] = true, -- Drum of the Death Loa
		[187103] = true, -- Everliving Statuette
		[187205] = true, -- Sack of Strange Soil
		[187104] = true, -- Obelisk of Dark Tidings
		-- Rank 4
		[187210] = true, -- Book of Binding: The Tormented Sorcerer
		[187202] = true, -- Unstable Explosive Orb
		[187207] = true, -- Enigmatic Decrypting Device
		[187203] = true, -- Cipher of Understanding
		-- Rank 5
		[187208] = true, -- Shadow Slicing Shortsword
		[187209] = true, -- Lang Family Wood-Carving
		[186014] = true -- Bulwark of Divine Intent
	}
end

function itemFilter:OnInitialize()
	self.items = {
		-- Rank 2 Keys
		[187612] = true, -- Key of Flowing Waters
		[187614] = true, -- Key of Many Thoughts
		[186984] = true, -- Korthite Crystal Key
		[187613] = true, -- Key of the Inner Chambers
		-- Sockets & Conduits
		[187134] = true, -- Alloy-Warping Facetor
		[187148] = true, -- Death-Bound Shard
		[187216] = true, -- Soultwining Crescent
		-- Random Items
		[187187] = true, -- Korthian Armaments
		[185636] = true, -- The Archivists' Codex
		[185972] = true, -- Tormentor's Cache
		[186718] = true, -- Teleporter Repair Kit
		[187431] = true, -- Sleeping Armament
		[187236] = true, -- Collapsing Riftstone
		[186731] = true, -- Repaired Riftkey
		[187508] = true, -- Trained Gromit Carrier
		[187054] = true -- Lost Razorwing Egg
	}
end

function consumableFilter:OnInitialize()
	self.consumables = {
		[187418] = true, -- Evolving Mawshroom
		[187244] = true, -- Questionable Mawshroom
		[187153] = true, -- Tasty Mawshroom
		[187421] = true, -- Ashen Liniment
		[187236] = true -- Zovaal's Dark Carafe
	}
end

function relicFilter:Update()
	self:SendMessage("AdiBags_FiltersChanged")
end

function itemFilter:Update()
	self:SendMessage("AdiBags_FiltersChanged")
end

function consumableFilter:Update()
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
end

function itemFilter:Filter(slotData)
	if self.items[tonumber(slotData.itemId)] then
		return L["Korthian Items"]
	end
end

function consumableFilter:Filter(slotData)
	if self.consumables[tonumber(slotData.itemId)] then
		return L["Kothrian Consumables"]
	end
end
