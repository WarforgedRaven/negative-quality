-- Changing quality -1
local budget = table.deepcopy(data.raw["quality"]["uncommon"])
budget.name = "budget"
budget.level = 4
budget.next = "cheap"
budget.order = "d"
budget.color = { [1] = 212, [2] = 90, [3] = 194 }
budget.default_multiplier = 0.75
budget.beacon_power_usage_multiplier = 2 * budget.beacon_power_usage_multiplier
budget.mining_drill_resource_drain_multiplier = 1
budget.science_pack_drain_multiplier = 1
budget.cargo_wagon_inventory_size_multiplier = 1
budget.locomotive_power_multiplier = 1

-- Changing quality -2
local cheap = table.deepcopy(data.raw["quality"]["rare"])
cheap.name = "cheap"
cheap.level = 3
cheap.next = "knockoff"
cheap.order = "c"
cheap.color = { [1] = 230, [2] = 151, [3] = 77 }
cheap.default_multiplier = 0.5
cheap.beacon_power_usage_multiplier = 2 * cheap.beacon_power_usage_multiplier
cheap.mining_drill_resource_drain_multiplier = 1
cheap.science_pack_drain_multiplier = 1
cheap.cargo_wagon_inventory_size_multiplier = 1
cheap.locomotive_power_multiplier = 1

-- Changing quality -3
local knockoff = table.deepcopy(data.raw["quality"]["epic"])
knockoff.name = "knockoff"
knockoff.level = 2
knockoff.next = "trash"
knockoff.order = "b"
knockoff.color = { [1] = 118, [2] = 255, [3] = 77 }
knockoff.default_multiplier = 0.25
knockoff.beacon_power_usage_multiplier = 2 * knockoff.beacon_power_usage_multiplier
knockoff.mining_drill_resource_drain_multiplier = 1
knockoff.science_pack_drain_multiplier = 1
knockoff.cargo_wagon_inventory_size_multiplier = 1
knockoff.locomotive_power_multiplier = 1

-- Changing quality -4
local trash = table.deepcopy(data.raw["quality"]["legendary"])
trash.name = "trash"
trash.level = 1
trash.order = "a"
trash.color = { [1] = 77, [2] = 151, [3] = 255 }
trash.default_multiplier = 0.011
trash.beacon_power_usage_multiplier = 2 * trash.beacon_power_usage_multiplier
trash.mining_drill_resource_drain_multiplier = 1
trash.science_pack_drain_multiplier = 1
trash.cargo_wagon_inventory_size_multiplier = 1
trash.locomotive_power_multiplier = 1

data.extend({ budget })
data.extend({ cheap })
data.extend({ knockoff })
data.extend({ trash })

-- Re order existing
local normal = table.deepcopy(data.raw["quality"]["normal"])
normal.level = 5
normal.default_multiplier = 1 + 0.3 * 0
local uncommon = table.deepcopy(data.raw["quality"]["uncommon"])
uncommon.level = 6
uncommon.default_multiplier = 1 + 0.3 * 1
local rare = table.deepcopy(data.raw["quality"]["rare"])
rare.level = 7
rare.default_multiplier = 1 + 0.3 * 2
local epic = table.deepcopy(data.raw["quality"]["epic"])
epic.level = 8
epic.default_multiplier = 1 + 0.3 * 3
local legendary = table.deepcopy(data.raw["quality"]["legendary"])
legendary.level = 9
legendary.default_multiplier = 1 + 0.3 * 5

data.extend({ normal })
data.extend({ uncommon })
data.extend({ rare })
data.extend({ epic })
data.extend({ legendary })