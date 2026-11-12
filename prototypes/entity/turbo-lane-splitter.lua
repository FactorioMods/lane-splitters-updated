-- local fast_belt_animation_set = data.raw["transport-belt"]["fast-transport-belt"].belt_animation_set
-- local express_belt_animation_set = data.raw["transport-belt"]["express-transport-belt"].belt_animation_set
local turbo_belt_animation_set = data.raw["transport-belt"]["turbo-transport-belt"].belt_animation_set

local turbo_lane_splitter = make_tier({
  name = "turbo-lane-splitter",
  base_belt = "turbo-transport-belt",
  base_splitter = "turbo-splitter",
  health = 190,
})

data:extend({
  turbo_lane_splitter.prototype,
  turbo_lane_splitter.item,
  turbo_lane_splitter.recipe,
})

table.insert(data.raw["technology"]["turbo-transport-belt"].effects, {
  type = "unlock-recipe",
  recipe = "turbo-lane-splitter"
})