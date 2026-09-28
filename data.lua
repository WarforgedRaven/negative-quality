local new_qualities = {
	-- quality -1
	budget = {
		type = "quality",
		name = "budget",
		level = 0.75,
        default_multiplier = 0.75,
		order = "d",
		color = { [1] = 255, [2] = 0, [3] = 0 },
		next = "normal",
		next_probability = 1,
		subgroup = "qualities",
		icon = "__negative-quality__/graphics/icons/quality-budget.png",
	},
	-- quality -2
	cheap = {
		type = "quality",
		name = "cheap",
		level = 0.5,
        default_multiplier = 0.5,
		order = "c",
		color = { [1] = 255, [2] = 0, [3] = 0 },
		next = "budget",
		next_probability = 1,
		subgroup = "qualities",
		icon = "__negative-quality__/graphics/icons/quality-cheap.png",
	},
	-- quality -3
	knockoff = {
		type = "quality",
		name = "knockoff",
		level = 0.25,
        default_multiplier = 0.25,
		order = "b",
		color = { [1] = 255, [2] = 0, [3] = 0 },
		next = "cheap",
		next_probability = 1,
		subgroup = "qualities",
		icon = "__negative-quality__/graphics/icons/quality-knockoff.png",
	},
	-- quality -4
	trash = {
		type = "quality",
		name = "trash",
		level = 0.11,
        default_multiplier = 0.11,
		order = "a",
		color = { [1] = 255, [2] = 0, [3] = 0 },
		next = "knockoff",
		next_probability = 1,
		subgroup = "qualities",
		icon = "__negative-quality__/graphics/icons/quality-trash.png",
	},
}

-- Re order existing
local normal = table.deepcopy(data.raw["quality"]["normal"])
normal.order = "e"

local uncommon = table.deepcopy(data.raw["quality"]["uncommon"])
uncommon.order = "f"

local rare = table.deepcopy(data.raw["quality"]["rare"])
rare.order = "g"

local epic = table.deepcopy(data.raw["quality"]["epic"])
epic.order = "h"

local legendary = table.deepcopy(data.raw["quality"]["legendary"])
legendary.order = "i"

data.extend({ normal })
data.extend({ uncommon })
data.extend({ rare })
data.extend({ epic })
data.extend({ legendary })
data.extend({ new_qualities.budget })
data.extend({ new_qualities.cheap })
data.extend({ new_qualities.knockoff })
data.extend({ new_qualities.trash })

local QUALITY_LIMITS_VALUE = { low = -1000, high = 1000 }
local CRAFTING_PROTOTYPES_NAMES = {
	"assembling-machine",
	"furnace",
	"rocket-silo",
	"agricultural-tower",
	"mining-drill",
}

for _, crafting_prototypes in pairs(CRAFTING_PROTOTYPES_NAMES) do
	local general_crafting_prototypes = table.deepcopy(data.raw[crafting_prototypes])

	if general_crafting_prototypes ~= nil then
		for _, specific_crafting_machine in pairs(general_crafting_prototypes) do
			if specific_crafting_machine.effect_receiver ~= nil then
				specific_crafting_machine.effect_receiver.quality_limits = QUALITY_LIMITS_VALUE
			else
				specific_crafting_machine.effect_receiver = { quality_limits = QUALITY_LIMITS_VALUE }
			end

			data.extend({ specific_crafting_machine })
		end
	end
end

local qualities = {}
local qualities_names = {
	"trash",
	"knockoff",
	"cheap",
	"budget",
	"common",
	"uncommon",
	"rare",
	"epic",
	"legendary",
}

for _, q in pairs(qualities_names) do
	table.insert(qualities, data.raw["quality"][q])
end

for i, q in ipairs(qualities) do
	if q.name ~= "quality-unknown" and q.name ~= "trash" then
		q.previous_probability = (qualities[i - 1].next_probability or 0)
		q.previous_chain_probability = (qualities[i - 1].chain_probability or 0)
	end
end
