---@diagnostic disable-next-line lowercase-global
is_debug_mode = false
---@diagnostic disable-next-line lowercase-global
debug_log = is_debug_mode and log or function(_) end

require("prototypes.entity.entities")