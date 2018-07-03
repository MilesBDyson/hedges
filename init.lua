
local hedges = {}

function hedges.register_hedge(name, def)

	-- register node
	minetest.register_node(name, {
		description = def.description or "Hedge",
		drawtype = "nodebox",
		paramtype = "light",
		tiles = {def.texture},
		groups = def.groups,
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
		sounds = default.node_sound_leaves_defaults()
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



-- register hedges
hedges.register_hedge("hedges:apple_hedge", {
	description = "Apple Hedge",
	texture = "default_leaves.png",
	groups = {snappy = 3, flammable = 2, leaves = 1, hedge = 1},
	material = "default:leaves",
})

hedges.register_hedge("hedges:jungle_hedge", {
	description = "Jungle Hedge",
	texture = "default_jungleleaves.png",
	groups = {snappy = 3, flammable = 2, leaves = 1, hedge = 1},
	material = "default:jungleleaves",
})

hedges.register_hedge("hedges:pine_hedge", {
	description = "Pine Hedge",
	texture = "default_pine_needles.png",
	groups = {snappy = 3, flammable = 2, leaves = 1, hedge = 1},
	material = "default:pine_needles",
})

hedges.register_hedge("hedges:acacia_hedge", {
	description = "Acacia Hedge",
	texture = "default_acacia_leaves.png",
	groups = {snappy = 3, flammable = 2, leaves = 1, hedge = 1},
	material = "default:acacia_leaves",
})

hedges.register_hedge("hedges:aspen_hedge", {
	description = "Aspen Hedge",
	texture = "default_aspen_leaves.png",
	groups = {snappy = 3, flammable = 2, leaves = 1, hedge = 1},
	material = "default:aspen_leaves",
})


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