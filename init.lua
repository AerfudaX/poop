local modname = "poop_mod"
local modpath = minetest.get_modpath(modname)
local mg_name = minetest.get_mapgen_setting("mg_name")
local S = minetest.get_translator(minetest.get_current_modname())

-- the item config

minetest.register_craftitem("poop_mod:poop",{
    description = S("Poop"),
	inventory_image = "poopitem.png",
	groups = {poop = 1, flammable = 1},
	on_use = minetest.item_eat(-9, "poop_mod:poop"),
})

minetest.register_node("poop_mod:poopblocque",{
    description = S("Poop Block"),
	tiles = {"poopblocque.png"},
	inventory_image = "poopblocque.png",
	wield_image = "poopblocque.png",
	paramtype = "light",
	sunlight_propagates = false,
	groups = {poop = 1, flammable = 1, oddly_breakable_by_hand = 3,},
	on_use = minetest.item_eat(-19, "poop_mod:poop"),
	sounds = default.node_sound_dirt_defaults(),
})

-- poop finding

minetest.register_decoration({
	name = "poop_mod:poop_hill",
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass"},
	sidelen = 16,
	noise_params = {
		offset = 0.001,
		scale = 0.02,
		spread = {x = 170, y = 170, z = 170},
		seed = 3462,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"deciduous_forest","savanna","grassland","desert","coniferous_forest","rainforest","bamboo","sakura","taiga"},
	y_min = -5,
	y_max = 20,
	schematic = modpath.."/schematics/poophill.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

-- poop crafting

minetest.register_craft({
    type = "shapeless",
	output = "poop_mod:poop 4",
	recipe = {
	    "poop_mod:poopblocque",
	},
})

minetest.register_craft({
    type = "shapeless",
	output = "poop_mod:poopblocque",
	recipe = {
	    "poop_mod:poop",
		"poop_mod:poop",
		"poop_mod:poop",
		"poop_mod:poop",
	},
})

minetest.register_craft({
    type = "shapeless",
	output = "bonemeal:bonemeal 2",
	recipe = {
	    "poop_mod:poop",
		"poop_mod:poop",
	},
})

minetest.register_craft({
    type = "shapeless",
	output = "bonemeal:fertiliser 6",
	recipe = {
	    "poop_mod:poopblocque",
		"poop_mod:poopblocque",
	},
})