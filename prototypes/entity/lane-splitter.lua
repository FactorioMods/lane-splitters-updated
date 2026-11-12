local basic_belt_animation_set = data.raw["transport-belt"]["transport-belt"].belt_animation_set
-- local fast_belt_animation_set = data.raw["transport-belt"]["fast-transport-belt"].belt_animation_set
-- local express_belt_animation_set = data.raw["transport-belt"]["express-transport-belt"].belt_animation_set
-- local turbo_belt_animation_set = data.raw["transport-belt"]["turbo-transport-belt"].belt_animation_set

-- Unhide vanilla lane splitter for use
data.raw["lane-splitter"]["lane-splitter"].hidden = false
data.raw["item"]["lane-splitter"].hidden = false
data.raw["item"]["lane-splitter"].subgroup = "belt"
data.raw["item"]["lane-splitter"].order = "d[lane-splitter]-a[lane-splitter]"
data.raw["item"]["lane-splitter"].next_upgrade = "fast-lane-splitter"

-- Override the vanilla icons
data.raw["lane-splitter"]["lane-splitter"].icons = {
  {
    icon = "__lane-splitters-updated__/graphics/icons/lane-splitter.png",
    icon_size = 64,
    icon_mipmaps = 4,
    tint = { r = 1.0, g = 1.0, b = 1.0 }
  }
}

data.raw["item"]["lane-splitter"].icons = {
  {
    icon = "__lane-splitters-updated__/graphics/icons/lane-splitter.png",
    icon_size = 64,
    icon_mipmaps = 4,
    tint = { r = 1.0, g = 1.0, b = 1.0 }
  }
}

data:extend({
  {
    type = "recipe",
    name = "lane-splitter",
    enabled = false,
    energy_required = 1,
    ingredients = data.raw["recipe"]["splitter"].ingredients,
    results = {{type="item", name="lane-splitter", amount=1}}
  },
})

table.insert(data.raw["technology"]["logistics"].effects, {
  type = "unlock-recipe",
  recipe = "lane-splitter"
})