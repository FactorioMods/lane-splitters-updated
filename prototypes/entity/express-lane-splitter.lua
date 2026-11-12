-- local fast_belt_animation_set = data.raw["transport-belt"]["fast-transport-belt"].belt_animation_set
local express_belt_animation_set = data.raw["transport-belt"]["express-transport-belt"].belt_animation_set
-- local turbo_belt_animation_set = data.raw["transport-belt"]["turbo-transport-belt"].belt_animation_set

local express_lane_splitter = make_tier({
  name = "express-lane-splitter",
  base_belt = "express-transport-belt",
  base_splitter = "express-splitter",
  health = 190,
})

if mods["space-age"] then express_lane_splitter.next_upgrade = "turbo-lane-splitter" end

data:extend({
  express_lane_splitter.prototype,
  express_lane_splitter.item,
  express_lane_splitter.recipe,
})

table.insert(data.raw["technology"]["logistics-3"].effects, {
  type = "unlock-recipe",
  recipe = "express-lane-splitter"
})