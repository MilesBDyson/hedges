
local hedges = {}

function hedges.register_hedge(name, def)

	-- register nodes
	if minetest.get_modpath("default") then
		def.sounds = def.sounds or default.node_sound_leaves_defaults()
	end

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
		sounds = def.sounds,
		after_place_node = function(pos, placer, itemstack, pointed_thing)
			local pos_under = {x = pos.x, y = pos.y - 1, z = pos.z}
			local pos_above = {x = pos.x, y = pos.y + 1, z = pos.z}
			if minetest.get_node(pos_under).name == name then
				minetest.set_node(pos_under, {name = name .. "_full"})
			end
			if minetest.get_node(pos_above).name == name or 
					minetest.get_node(pos_above).name == name .. "_full" then
				minetest.set_node(pos, {name = name .. "_full"})
			end
		end,
		after_dig_node = function(pos, oldnode, oldmetadata, digger)
			local pos_under = {x = pos.x, y = pos.y - 1, z = pos.z}
			if minetest.get_node(pos_under).name == name .. "_full" and
					digger and digger:is_player() then
				minetest.set_node(pos_under, {name = name})
			end
		end,
	})

	minetest.register_node(name .. "_full", {
		description = def.description or "Hedge",
		drawtype = "nodebox",
		paramtype = "light",
		tiles = {def.texture},
		groups = def.groups or
			{snappy = 3, flammable = 2, leaves = 1, hedge = 1,
			not_in_creative_inventory = 1},
		waving = 1,
		node_box = {
			type = "connected",
			fixed = {{-0.3, -0.5, -0.3, 0.3, 0.5, 0.3}},
			connect_left = {{-0.5, -0.5, -0.3, -0.3, 0.5, 0.3}},
			connect_right = {{0.3, -0.5, -0.3, 0.5, 0.5, 0.3}},
			connect_front = {{-0.3, -0.5, -0.5, 0.3, 0.5, -0.3}},
			connect_back = {{-0.3, -0.5, 0.3, 0.3, 0.5, 0.5}},
		},
		connects_to = {"group:fence", "group:wood", "group:tree", "group:hedge"},
		light_source = def.light_source or 0,
		sounds = def.sounds,
		drop = name,
		after_place_node = function(pos, placer, itemstack, pointed_thing)
			local pos_under = {x = pos.x, y = pos.y - 1, z = pos.z}
			if minetest.get_node(pos_under).name == name then
				minetest.set_node(pos_under, {name = name .. "_full"})
			end
		end,
		after_dig_node = function(pos, oldnode, oldmetadata, digger)
			local pos_under = {x = pos.x, y = pos.y - 1, z = pos.z}
			if minetest.get_node(pos_under).name == name .. "_full" and
					digger and digger:is_player() then
				minetest.set_node(pos_under, {name = name})
			end
		end,
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