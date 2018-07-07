
local hedges = {}

function hedges.register_hedge(name, def)

	-- register node
	minetest.register_node(name, {
		description = def.description or "Hedge",
		drawtype = "nodebox",
		paramtype = "light",
		tiles = {def.texture},
		groups = def.groups or
			{snappy = 3, flammable = 2, leaves = 1, hedge = 1},
		waving = 1,
		node_box = {
			type = "connected",
			fixed = {{-0.3, -0.5, -0.3, 0.3, 0.4, 0.3}},
			connect_left = {{-0.5, -0.5, -0.3, -0.3, 0.4, 0.3}},
			connect_right = {{0.3, -0.5, -0.3, 0.5, 0.4, 0.3}},
			connect_front = {{-0.3, -0.5, -0.5, 0.3, 0.4, -0.3}},
			connect_back = {{-0.3, -0.5, 0.3, 0.3, 0.4, 0.5}},
		},
		connects_to = {"group:fence", "group:wood", "group:tree", "group:hedge"},
		light_source = def.light_source or 0,
		sounds = def.sounds or default.node_sound_leaves_defaults(),
	})

	-- register crafting recipe
	minetest.register_craft({
		output = name .. " 4",
		recipe = {
			{def.material, def.material, def.material},
			{def.material, def.material, def.material},
		}
	})
end


-- register hedges if default mod found
if minetest.get_modpath("default") then

	hedges.register_hedge("hedges:apple_hedge", {
		description = "Apple Hedge",
		texture = "default_leaves.png",
		material = "default:leaves",
	})

	hedges.register_hedge("hedges:jungle_hedge", {
		description = "Jungle Hedge",
		texture = "default_jungleleaves.png",
		material = "default:jungleleaves",
	})

	hedges.register_hedge("hedges:pine_hedge", {
		description = "Pine Hedge",
		texture = "default_pine_needles.png",
		material = "default:pine_needles",
	})

	hedges.register_hedge("hedges:acacia_hedge", {
		description = "Acacia Hedge",
		texture = "default_acacia_leaves.png",
		material = "default:acacia_leaves",
	})

	hedges.register_hedge("hedges:aspen_hedge", {
		description = "Aspen Hedge",
		texture = "default_aspen_leaves.png",
		material = "default:aspen_leaves",
	})

end

-- alternative recipes using bush leaves
	minetest.register_craft({
		output = "hedges:apple_hedge 4",
		recipe = {
			{"default:bush_leaves", "default:bush_leaves", "default:bush_leaves"},
			{"default:bush_leaves", "default:bush_leaves", "default:bush_leaves"},
		}
	})

		minetest.register_craft({
		output = "hedges:acacia_hedge 4",
		recipe = {
			{"default:acacia_bush_leaves", "default:acacia_bush_leaves", "default:acacia_bush_leaves"},
			{"default:acacia_bush_leaves", "default:acacia_bush_leaves", "default:acacia_bush_leaves"},
		}
	})