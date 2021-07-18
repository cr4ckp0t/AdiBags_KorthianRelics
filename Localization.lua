-------------------------------------------------------------------------------
-- AdiBags - Korthian Relics By Crackpot (US, Arthas)
-------------------------------------------------------------------------------
local addonName, addon = ...

local L =
	setmetatable(
	{},
	{
		__index = function(self, key)
			if key then
				rawset(self, key, tostring(key))
			end
			return tostring(key)
		end
	}
)
addon.L = L

local locale = GetLocale()

if locale == "deDE" then
	--Translation missing
elseif locale == "enUS" then
	L["Korthian Relics"] = true
	L["Korthian Relics for new the new reputation added in 9.1."] = true
	L["Korthian Items"] = true
	L["Random items from Korthia."] = true
	L["Kothrian Consumables"] = true
	L["Consumables added from Kothria in 9.1."] = true
elseif locale == "esES" then
	--Translation missing
elseif locale == "esMX" then
	--Translation missing
elseif locale == "frFR" then
	L["Reliques Korthiennes"] = true
	L["Reliques Korthiennes ajoutées à la 9.1."] = true
	L["Objets Korthiens"] = true
	L["Objets aléatoires de Korthia."] = true
	L["Consommables Korthiens"] = true
	L["Consommables de Korthia ajoutés à la 9.1."] = true
elseif locale == "itIT" then
	--Translation missing
elseif locale == "koKR" then
	--Translation missing
elseif locale == "ptBR" then
	--Translation missing
elseif locale == "ruRU" then
	--Translation missing
elseif locale == "zhCN" then
	--Translation missing
elseif locale == "zhTW" then
--Translation missing
end

-- values by their key
for k, v in pairs(L) do
	if v == true then
		L[k] = k
	end
end
