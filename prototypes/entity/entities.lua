local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")

local base_graphics_path = "__base__/graphics/entity"
local space_age_graphics_path = "__space-age__/graphics/entity"

---@diagnostic disable-next-line lowercase-global
function make_base_structure(splitter_name)
  return {
    north =
    {
      filename = base_graphics_path.."/"..splitter_name.."/"..splitter_name.."-north.png",
      frame_count = 32,
      line_length = 8,
      priority = "extra-high",
      width = 160,
      height = 70,
      shift = util.by_pixel(3.5, 0),
      scale = 0.25
    },
    east =
    {
      filename = base_graphics_path.."/"..splitter_name.."/"..splitter_name.."-east.png",
      frame_count = 32,
      line_length = 8,
      priority = "extra-high",
      width = 90,
      height = 84,
      shift = util.by_pixel(2, 7.5),
      scale = 0.25
    },
    south =
    {
      filename = base_graphics_path.."/"..splitter_name.."/"..splitter_name.."-south.png",
      frame_count = 32,
      line_length = 8,
      priority = "extra-high",
      width = 164,
      height = 64,
      shift = util.by_pixel(2, 0),
      scale = 0.25
    },
    west =
    {
      filename = base_graphics_path.."/"..splitter_name.."/"..splitter_name.."-west.png",
      frame_count = 32,
      line_length = 8,
      priority = "extra-high",
      width = splitter_name == "express-splitter" and 94 or 90,
      height = 86,
      shift = util.by_pixel(3, 6),
      scale = 0.25
    }
  }
end

---@diagnostic disable-next-line lowercase-global
function make_base_structure_patch(splitter_name)
  return {
    north = util.empty_sprite(),
    east =
    {
      filename = base_graphics_path.."/"..splitter_name.."/"..splitter_name.."-east-top_patch.png",
      frame_count = 32,
      line_length = 8,
      priority = "extra-high",
      width = 90,
      height = 104,
      shift = util.by_pixel(2, -10),
      scale = 0.25
    },
    south = util.empty_sprite(),
    west =
    {
      filename = base_graphics_path.."/"..splitter_name.."/"..splitter_name.."-west-top_patch.png",
      frame_count = 32,
      line_length = 8,
      priority = "extra-high",
      width = splitter_name == "express-splitter" and 94 or 90,
      height = 96,
      shift = util.by_pixel(3, -9),
      scale = 0.25
    }

  }
end

---@diagnostic disable-next-line lowercase-global
function make_space_age_structure(splitter_name)
  return {
    north =
    util.sprite_load(space_age_graphics_path.."/"..splitter_name.."/"..splitter_name.."-north",
      {
        frame_count = 32,
        priority = "extra-high",
        shift = util.by_pixel(-4, 0),
        scale = 0.25
      }
    ),
    east =
    util.sprite_load(space_age_graphics_path.."/"..splitter_name.."/"..splitter_name.."-east",
      {
        frame_count = 32,
        priority = "extra-high",
        shift = util.by_pixel(-2, -5.5),
        scale = 0.25
      }
    ),
    south =
    util.sprite_load(space_age_graphics_path.."/"..splitter_name.."/"..splitter_name.."-south",
      {
        frame_count = 32,
        priority = "extra-high",
        shift = util.by_pixel(-2, 0),
        scale = 0.25
      }
    ),
    west =
    util.sprite_load(space_age_graphics_path.."/"..splitter_name.."/"..splitter_name.."-west",
      {
        frame_count = 32,
        priority = "extra-high",
        shift = util.by_pixel(-3, -6),
        scale = 0.25
      }
    ),
  }
end

---@diagnostic disable-next-line lowercase-global
function make_space_age_structure_patch(splitter_name)
  return {
    north = util.empty_sprite(),
    east =
    util.sprite_load(space_age_graphics_path.."/"..splitter_name.."/"..splitter_name.."-east-top_patch",
      {
        frame_count = 32,
        priority = "extra-high",
        shift = util.by_pixel(-1.5, 9.5),
        scale = 0.25
      }
    ),
    south = util.empty_sprite(),
    west =
    util.sprite_load(space_age_graphics_path.."/"..splitter_name.."/"..splitter_name.."-west-top_patch",
      {
        frame_count = 32,
        priority = "extra-high",
        shift = util.by_pixel(-3, 8.5),
        scale = 0.25
      }
    )
  }
end

---@diagnostic disable-next-line lowercase-global
function make_tier(config)
  local animation_set = data.raw["splitter"][config.base_splitter].belt_animation_set

  local is_space_age = config.name == "turbo-lane-splitter"
  local structure = is_space_age and make_space_age_structure(config.base_splitter) or make_base_structure(config.base_splitter)
  local structure_patch = is_space_age and make_space_age_structure_patch(config.base_splitter) or make_base_structure_patch(config.base_splitter)

  local prototype = {
    name = config.name,
    type = "lane-splitter",
    icon = "__lane-splitters__/graphics/icons/"..config.name..".png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = config.name},
    max_health = config.health or 170,
    corpse = config.base_splitter.."-remnants",
    dying_explosion = config.base_splitter.."-explosion",
    icon_draw_specification = {scale = 0.35},
    resistances = {
      {
        type = "fire",
        percent = 60
      }
    },
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    animation_speed_coefficient = 32,
    structure_animation_speed_coefficient = 0.7,
    structure_animation_movement_cooldown = 10,
    fast_replaceable_group = "transport-belt",
    next_upgrade = config.next_upgrade or nil,
    speed = config.speed or data.raw["transport-belt"][config.base_belt].speed or 0.03125,
    belt_animation_set = animation_set,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound = sounds.splitter,
    structure = structure,
    structure_patch = structure_patch,
  }

  local order_sub = (
    config.name == "lane-splitter" and "a" or
    config.name == "fast-lane-splitter" and "b" or
    config.name == "express-lane-splitter" and "c" or
    "d"
  )

  local item = {
    type = "item",
    name = config.name,
    icon = "__lane-splitters__/graphics/icons/"..config.name..".png",
    hidden = false,
    subgroup = "belt",
    order = "d[lane-splitter]-"..order_sub.."["..config.name.."]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = config.name,
    stack_size = 50,
    weight = 10000
  }

  local recipe = {
    type = "recipe",
    name = config.name,
    enabled = false,
    energy_required = 1,
    category = data.raw["recipe"][config.base_splitter].category,
    ingredients = data.raw["recipe"][config.base_splitter].ingredients,
    results = {{type="item", name=config.name, amount=1}}
  }

  return {
    prototype = prototype,
    item = item,
    recipe = recipe,
  }
end

require("lane-splitter")
require("fast-lane-splitter")
require("express-lane-splitter")
if mods["space-age"] then
  require("turbo-lane-splitter")
end
