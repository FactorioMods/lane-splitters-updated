local fast_belt_animation_set = data.raw["transport-belt"]["fast-transport-belt"].belt_animation_set
-- local express_belt_animation_set = data.raw["transport-belt"]["express-transport-belt"].belt_animation_set
-- local turbo_belt_animation_set = data.raw["transport-belt"]["turbo-transport-belt"].belt_animation_set

local fast_lane_splitter = make_tier({
  name = "fast-lane-splitter",
  base_belt = "fast-transport-belt",
  base_splitter = "fast-splitter",
  health = 180,
  next_upgrade = "express-lane-splitter",
})

data:extend({
  fast_lane_splitter.prototype,
  fast_lane_splitter.item,
  fast_lane_splitter.recipe,
})

table.insert(data.raw["technology"]["logistics-2"].effects, {
  type = "unlock-recipe",
  recipe = "fast-lane-splitter"
})