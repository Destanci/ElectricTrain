
local train_scale = 0.425
local fluid_wagon_scale = 0.375
local cargo_wagon_scale = 0.4
local wagon_vertical_shift = -0.8
local connection_length = 3
local train_speed = 2.4
local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")

space_train_wheels = {
    priority = "very-low",
    width = 250,
    height = 150,
    direction_count = 256,
    filenames = {"__ElectricTrain__/graphics/space-trains/maglev_cushions_1.png",
                 "__ElectricTrain__/graphics/space-trains/maglev_cushions_2.png"},
    line_length = 8,
    lines_per_file = 16,
    scale = 1.4 / 2,
    hr_version = {
        priority = "very-low",
        width = 500,
        height = 300,
        direction_count = 256,
        filenames = {"__ElectricTrain__/graphics/space-trains/hr_maglev_cushions_1.png",
                     "__ElectricTrain__/graphics/space-trains/hr_maglev_cushions_2.png",
                     "__ElectricTrain__/graphics/space-trains/hr_maglev_cushions_3.png",
                     "__ElectricTrain__/graphics/space-trains/hr_maglev_cushions_4.png",
                     "__ElectricTrain__/graphics/space-trains/hr_maglev_cushions_5.png",
                     "__ElectricTrain__/graphics/space-trains/hr_maglev_cushions_6.png",
                     "__ElectricTrain__/graphics/space-trains/hr_maglev_cushions_7.png",
                     "__ElectricTrain__/graphics/space-trains/hr_maglev_cushions_8.png"},
        line_length = 4,
        lines_per_file = 8,
        shift = {0, 0.1}, -- original shifting from spritesheeter (likely needs doubling or halving)
        scale = 0.775 / 2
    }
}

local electric_locomotive_1 = table.deepcopy(data.raw['locomotive']['locomotive'])
electric_locomotive_1.name = "et-electric-locomotive-1"
electric_locomotive_1.icon = "__ElectricTrain__/graphics/loc1.png"
electric_locomotive_1.minable.result = "et-electric-locomotive-1"
electric_locomotive_1.burner = {fuel_inventory_size = 0}
electric_locomotive_1.max_health = 1350
electric_locomotive_1.max_speed = 1.8		--216*1.8 = 388.8
electric_locomotive_1.max_power = "900kW"
electric_locomotive_1.reversing_power_modifier = 0.8
electric_locomotive_1.braking_force = 15
electric_locomotive_1.friction_force = 0.375
electric_locomotive_1.air_resistance = 0.005625
electric_locomotive_1.icon_size = 32
electric_locomotive_1.icon_mipmaps = nil

local electric_locomotive_2 = table.deepcopy(data.raw['locomotive']['locomotive'])
electric_locomotive_2.name = "et-electric-locomotive-2"
electric_locomotive_2.icon = "__ElectricTrain__/graphics/loc2.png"
electric_locomotive_2.minable.result = "et-electric-locomotive-2"
electric_locomotive_2.burner = {fuel_inventory_size = 0}
electric_locomotive_2.max_health = 1500
electric_locomotive_2.max_speed = 2
electric_locomotive_2.max_power = "1200kW"
electric_locomotive_2.reversing_power_modifier = 0.9
electric_locomotive_2.braking_force = 20
electric_locomotive_2.friction_force = 0.25
electric_locomotive_2.air_resistance = 0.00375
electric_locomotive_2.icon_size = 32
electric_locomotive_2.icon_mipmaps = nil

local electric_locomotive_3 = table.deepcopy(data.raw['locomotive']['locomotive'])
electric_locomotive_3.name = "et-electric-locomotive-3"
electric_locomotive_3.icon = "__ElectricTrain__/graphics/loc3.png"
electric_locomotive_3.minable.result = "et-electric-locomotive-3"
electric_locomotive_3.burner = {fuel_inventory_size = 0}
electric_locomotive_3.max_health = 1700
electric_locomotive_3.max_speed = 2.4		--216*2.4 = 518.4
electric_locomotive_3.max_power = "1500kW"
electric_locomotive_3.reversing_power_modifier = 1
electric_locomotive_3.braking_force = 23
electric_locomotive_3.friction_force = 0.20
electric_locomotive_3.air_resistance = 0.00300
electric_locomotive_3.icon_size = 32
electric_locomotive_3.icon_mipmaps = nil


local electric_locomotive_4 = table.deepcopy(data.raw['locomotive']['locomotive'])
electric_locomotive_4.name = "et-electric-locomotive-4"
electric_locomotive_4.icon = "__ElectricTrain__/graphics/icons/space-locomotive.png"
electric_locomotive_4.icon_size = 32
electric_locomotive_4.flags = {"placeable-neutral", "player-creation", "placeable-off-grid"}
electric_locomotive_4.minable.result = "et-electric-locomotive-4"
electric_locomotive_4.max_health = 2000
electric_locomotive_4.collision_box = {{-0.6, -2.6}, {0.6, 2.6}}
electric_locomotive_4.selection_box = {{-1, -3}, {1, 3}}
electric_locomotive_4.drawing_box = {{-1, -4}, {1, 3}}
electric_locomotive_4.alert_icon_shift = util.by_pixel(0, -24)
electric_locomotive_4.damaged_trigger_effect = hit_effects.entity()
electric_locomotive_4.max_speed = 3
electric_locomotive_4.max_power = "2250kW"
electric_locomotive_4.reversing_power_modifier = 1.0
electric_locomotive_4.braking_force = 25
electric_locomotive_4.friction_force = 0.18
electric_locomotive_4.vertical_selection_shift = -0.5
electric_locomotive_4.air_resistance = 0.0025
electric_locomotive_4.connection_distance = connection_length
electric_locomotive_4.joint_distance = 4
electric_locomotive_4.energy_per_hit_point = 5
electric_locomotive_4.resistances = {{
        type = "fire",
        decrease = 20,
        percent = 75 }, {
        type = "physical",
        decrease = 15,
        percent = 30 }, {
        type = "impact",
        decrease = 50,
        percent = 75 }, {
        type = "explosion",
        decrease = 15,
        percent = 30 }, {
        type = "acid",
        decrease = 5,
        percent = 25 }}
electric_locomotive_4.burner = {fuel_inventory_size = 0}
electric_locomotive_4.front_light = {{
        type = "oriented",
        minimum_darkness = 0.3,
        picture = {
            filename = "__core__/graphics/light-cone.png",
            priority = "extra-high",
            flags = {"light"},
            scale = 2,
            width = 200,
            height = 200
        },
        shift = {-0.6, -16},
        size = 2,
        intensity = 0.8,
        color = space_train_light_color }, {
        type = "oriented",
        minimum_darkness = 0.3,
        picture = {
            filename = "__core__/graphics/light-cone.png",
            priority = "extra-high",
            flags = {"light"},
            scale = 2,
            width = 200,
            height = 200
        },
        shift = {0.6, -16},
        size = 2,
        intensity = 0.8,
        color = space_train_light_color }}
electric_locomotive_4.back_light = rolling_stock_back_light()
electric_locomotive_4.stand_by_light = rolling_stock_stand_by_light()
electric_locomotive_4.color = {
        r = 0.92,
        g = 0.07,
        b = 0,
        a = 0.5 }
electric_locomotive_4.pictures = {
        layers = {{
            dice = 4,
            priority = "very-low",
            width = 500,
            height = 300,
            direction_count = 256,
            allow_low_quality_rotation = true,
            filenames = {"__ElectricTrain__/graphics/space-trains/space_locomotive_1.png",
                         "__ElectricTrain__/graphics/space-trains/space_locomotive_2.png",
                         "__ElectricTrain__/graphics/space-trains/space_locomotive_3.png",
                         "__ElectricTrain__/graphics/space-trains/space_locomotive_4.png",
                         "__ElectricTrain__/graphics/space-trains/space_locomotive_5.png",
                         "__ElectricTrain__/graphics/space-trains/space_locomotive_6.png",
                         "__ElectricTrain__/graphics/space-trains/space_locomotive_7.png",
                         "__ElectricTrain__/graphics/space-trains/space_locomotive_8.png"},
            line_length = 4,
            lines_per_file = 8,
            shift = {0, wagon_vertical_shift},
            scale = train_scale * 2,
            hr_version = {
                priority = "very-low",
                dice = 4,
                width = 1000,
                height = 600,
                direction_count = 256,
                allow_low_quality_rotation = true,
                filenames = {"__ElectricTrain__/graphics/space-trains/hr_space_locomotive_1.png",
                             "__ElectricTrain__/graphics/space-trains/hr_space_locomotive_2.png",
                             "__ElectricTrain__/graphics/space-trains/hr_space_locomotive_3.png",
                             "__ElectricTrain__/graphics/space-trains/hr_space_locomotive_4.png",
                             "__ElectricTrain__/graphics/space-trains/hr_space_locomotive_5.png",
                             "__ElectricTrain__/graphics/space-trains/hr_space_locomotive_6.png",
                             "__ElectricTrain__/graphics/space-trains/hr_space_locomotive_7.png",
                             "__ElectricTrain__/graphics/space-trains/hr_space_locomotive_8.png"},
                line_length = 4,
                lines_per_file = 8,
                shift = {0, wagon_vertical_shift},
                scale = train_scale
            }
        }, {
            priority = "very-low",
            flags = {"mask"},
            dice = 4,
            width = 500,
            height = 300,
            direction_count = 256,
            allow_low_quality_rotation = true,
            filenames = {"__ElectricTrain__/graphics/space-trains/space_locomotive_mask_1.png",
                         "__ElectricTrain__/graphics/space-trains/space_locomotive_mask_2.png",
                         "__ElectricTrain__/graphics/space-trains/space_locomotive_mask_3.png",
                         "__ElectricTrain__/graphics/space-trains/space_locomotive_mask_4.png",
                         "__ElectricTrain__/graphics/space-trains/space_locomotive_mask_5.png",
                         "__ElectricTrain__/graphics/space-trains/space_locomotive_mask_6.png",
                         "__ElectricTrain__/graphics/space-trains/space_locomotive_mask_7.png",
                         "__ElectricTrain__/graphics/space-trains/space_locomotive_mask_8.png"},
            line_length = 4,
            lines_per_file = 8,
            shift = {0, wagon_vertical_shift},
            apply_runtime_tint = true,
            scale = train_scale * 2,
            hr_version = {
                priority = "very-low",
                flags = {"mask"},
                dice = 4,
                width = 1000,
                height = 600,
                direction_count = 256,
                allow_low_quality_rotation = true,
                filenames = {"__ElectricTrain__/graphics/space-trains/hr_space_locomotive_mask_1.png",
                             "__ElectricTrain__/graphics/space-trains/hr_space_locomotive_mask_2.png",
                             "__ElectricTrain__/graphics/space-trains/hr_space_locomotive_mask_3.png",
                             "__ElectricTrain__/graphics/space-trains/hr_space_locomotive_mask_4.png",
                             "__ElectricTrain__/graphics/space-trains/hr_space_locomotive_mask_5.png",
                             "__ElectricTrain__/graphics/space-trains/hr_space_locomotive_mask_6.png",
                             "__ElectricTrain__/graphics/space-trains/hr_space_locomotive_mask_7.png",
                             "__ElectricTrain__/graphics/space-trains/hr_space_locomotive_mask_8.png"},
                line_length = 4,
                lines_per_file = 8,
                shift = {0, wagon_vertical_shift},
                apply_runtime_tint = true,
                scale = train_scale
            }
        }, {
            priority = "very-low",
            dice = 4,
            flags = {"shadow"},
            width = 500,
            height = 300,
            direction_count = 256,
            draw_as_shadow = true,
            allow_low_quality_rotation = true,
            filenames = {"__ElectricTrain__/graphics/space-trains/space_locomotive_shadows_1.png",
                         "__ElectricTrain__/graphics/space-trains/space_locomotive_shadows_2.png",
                         "__ElectricTrain__/graphics/space-trains/space_locomotive_shadows_3.png",
                         "__ElectricTrain__/graphics/space-trains/space_locomotive_shadows_4.png",
                         "__ElectricTrain__/graphics/space-trains/space_locomotive_shadows_5.png",
                         "__ElectricTrain__/graphics/space-trains/space_locomotive_shadows_6.png",
                         "__ElectricTrain__/graphics/space-trains/space_locomotive_shadows_7.png",
                         "__ElectricTrain__/graphics/space-trains/space_locomotive_shadows_8.png"},
            line_length = 4,
            lines_per_file = 8,
            shift = {0, wagon_vertical_shift},
            scale = train_scale * 2,
            hr_version = {
                priority = "very-low",
                flags = {"shadow"},
                width = 1000,
                height = 600,
                direction_count = 256,
                draw_as_shadow = true,
                allow_low_quality_rotation = true,
                filenames = {"__ElectricTrain__/graphics/space-trains/hr_space_locomotive_shadows_1.png",
                             "__ElectricTrain__/graphics/space-trains/hr_space_locomotive_shadows_2.png",
                             "__ElectricTrain__/graphics/space-trains/hr_space_locomotive_shadows_3.png",
                             "__ElectricTrain__/graphics/space-trains/hr_space_locomotive_shadows_4.png",
                             "__ElectricTrain__/graphics/space-trains/hr_space_locomotive_shadows_5.png",
                             "__ElectricTrain__/graphics/space-trains/hr_space_locomotive_shadows_6.png",
                             "__ElectricTrain__/graphics/space-trains/hr_space_locomotive_shadows_7.png",
                             "__ElectricTrain__/graphics/space-trains/hr_space_locomotive_shadows_8.png"},
                line_length = 4,
                lines_per_file = 8,
                shift = {0, wagon_vertical_shift},
                scale = train_scale
            }
        }} }
electric_locomotive_4.front_light_pictures = {
        layers = {{
            priority = "very-low",
            blend_mode = "additive",
            draw_as_light = true,
            tint = {
                r = 1.0,
                g = 1.0,
                b = 1.0,
                a = 0.25
            },
            width = 500,
            height = 300,
            direction_count = 256,
            allow_low_quality_rotation = true,
            filenames = {"__ElectricTrain__/graphics/space-trains/space_locomotive_lights_front_1.png",
                        "__ElectricTrain__/graphics/space-trains/space_locomotive_lights_front_2.png",
                        "__ElectricTrain__/graphics/space-trains/space_locomotive_lights_front_3.png",
                        "__ElectricTrain__/graphics/space-trains/space_locomotive_lights_front_4.png",
                        "__ElectricTrain__/graphics/space-trains/space_locomotive_lights_front_5.png",
                        "__ElectricTrain__/graphics/space-trains/space_locomotive_lights_front_6.png",
                        "__ElectricTrain__/graphics/space-trains/space_locomotive_lights_front_7.png",
                        "__ElectricTrain__/graphics/space-trains/space_locomotive_lights_front_8.png"},
            line_length = 4,
            lines_per_file = 8,
            shift = {0, wagon_vertical_shift},
            scale = train_scale * 2,
            hr_version = {
                priority = "very-low",
                blend_mode = "additive",
                draw_as_light = true,
                tint = {
                    r = 1.0,
                    g = 1.0,
                    b = 1.0,
                    a = 0.25
                },
                width = 1000,
                height = 600,
                direction_count = 256,
                allow_low_quality_rotation = true,
                filenames = {"__ElectricTrain__/graphics/space-trains/hr_space_locomotive_lights_front_1.png",
                            "__ElectricTrain__/graphics/space-trains/hr_space_locomotive_lights_front_2.png",
                            "__ElectricTrain__/graphics/space-trains/hr_space_locomotive_lights_front_3.png",
                            "__ElectricTrain__/graphics/space-trains/hr_space_locomotive_lights_front_4.png",
                            "__ElectricTrain__/graphics/space-trains/hr_space_locomotive_lights_front_5.png",
                            "__ElectricTrain__/graphics/space-trains/hr_space_locomotive_lights_front_6.png",
                            "__ElectricTrain__/graphics/space-trains/hr_space_locomotive_lights_front_7.png",
                            "__ElectricTrain__/graphics/space-trains/hr_space_locomotive_lights_front_8.png"},
                line_length = 4,
                lines_per_file = 8,
                shift = {0, wagon_vertical_shift},
                scale = train_scale
            }
        }} }
electric_locomotive_4.selected_minimap_representation = {
        filename = "__ElectricTrain__/graphics/space-trains/space-locomotive-selected-minimap-representation.png",
        flags = {"icon"},
        size = {20, 40},
        scale = 0.5 }
electric_locomotive_4.wheels = space_train_wheels
electric_locomotive_4.stop_trigger = {
        {
            type = "create-trivial-smoke",
            repeat_count = 125,
            smoke_name = "smoke-train-stop",
            initial_height = 0,
            -- smoke goes to the left
            speed = {-0.03, 0},
            speed_multiplier = 0.75,
            speed_multiplier_deviation = 1.1,
            offset_deviation = {{-0.75, -2.7}, {-0.3, 2.7}} }, 
        {
            type = "create-trivial-smoke",
            repeat_count = 125,
            smoke_name = "smoke-train-stop",
            initial_height = 0,
            -- smoke goes to the right
            speed = {0.03, 0},
            speed_multiplier = 0.75,
            speed_multiplier_deviation = 1.1,
            offset_deviation = {{0.3, -2.7}, {0.75, 2.7}} }, {
            type = "play-sound",
            sound = sounds.train_brakes } }
electric_locomotive_4.working_sound = {
        sound = {
            filename = "__ElectricTrain__/sound/space-train-engine.ogg",
            volume = 0.4
        },
        match_speed_to_activity = true,
        max_sounds_per_type = 2 }
electric_locomotive_4.water_reflection = locomotive_reflection()
electric_locomotive_4.sound_minimum_speed = 0.5
electric_locomotive_4.close_sound = {
        filename = "__base__/sound/train-door-close.ogg",
        volume = 0.4 }
electric_locomotive_4.open_sound = {
        filename = "__base__/sound/train-door-open.ogg",
        volume = 0.5 }

data:extend({electric_locomotive_1,electric_locomotive_2,electric_locomotive_3,electric_locomotive_4})


data:extend
({
	{
		type = "electric-energy-interface",
		name = "et-control-station-1",
		icon = "__ElectricTrain__/graphics/relais-icon-1.png",
		icon_size = 32,
		flags = {"placeable-neutral", "player-creation"},
		minable = {mining_time = 1, result = "et-control-station-1"},
		max_health = 100,
		corpse = "small-remnants",
		collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
		selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
		fast_replaceable_group = "electric-energy-interface",
		vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		energy_source =
		{
			type = "electric",
			buffer_capacity = "200KW",
			usage_priority = "secondary-input",
		},
		energy_usage = "100KW",
		picture =
		{
			filename = "__ElectricTrain__/graphics/relais-1.png",
			priority = "low",
			width = 196,
			height = 254,
			shift = util.by_pixel(1, -16),
			scale = 0.5			
		}
	}
})


local cargo_wagon_2 = table.deepcopy(data.raw['cargo-wagon']['cargo-wagon'])
cargo_wagon_2.name = "et-cargo-wagon-2"
cargo_wagon_2.icon = "__ElectricTrain__/graphics/cargo2.png"
cargo_wagon_2.inventory_size = 60
cargo_wagon_2.minable.result = "et-cargo-wagon-2"
cargo_wagon_2.max_health = 800
cargo_wagon_2.weight = 1500
cargo_wagon_2.max_speed = 1.8
cargo_wagon_2.braking_force = 4
cargo_wagon_2.friction_force = 0.375
cargo_wagon_2.air_resistance = 0.003
cargo_wagon_2.icon_size = 32
cargo_wagon_2.icon_mipmaps = nil

local cargo_wagon_3 = table.deepcopy(data.raw['cargo-wagon']['cargo-wagon'])
cargo_wagon_3.name = "et-cargo-wagon-3"
cargo_wagon_3.icon = "__ElectricTrain__/graphics/cargo3.png"
cargo_wagon_3.inventory_size = 80
cargo_wagon_3.minable.result = "et-cargo-wagon-3"
cargo_wagon_3.max_health = 1000
cargo_wagon_3.weight = 2000
cargo_wagon_3.max_speed = 2.4
cargo_wagon_3.braking_force = 5
cargo_wagon_3.friction_force = 0.25
cargo_wagon_3.air_resistance = 0.002
cargo_wagon_3.icon_size = 32
cargo_wagon_3.icon_mipmaps = nil


local cargo_wagon_4 = table.deepcopy(data.raw['cargo-wagon']['cargo-wagon'])
cargo_wagon_4.name = "et-cargo-wagon-4"
cargo_wagon_4.icon = "__ElectricTrain__/graphics/icons/space-cargo-wagon.png"
cargo_wagon_4.icon_size = 64
cargo_wagon_4.icon_mipmaps = 4
cargo_wagon_4.flags = {"placeable-neutral", "player-creation", "placeable-off-grid"}
cargo_wagon_4.inventory_size = 80
cargo_wagon_4.minable.result = "et-cargo-wagon-4"
cargo_wagon_4.mined_sound = {
        filename = "__core__/sound/deconstruct-large.ogg",
        volume = 0.8 }
cargo_wagon_4.max_health = 600
cargo_wagon_4.collision_box = {{-0.6, -2.4}, {0.6, 2.4}}
cargo_wagon_4.selection_box = {{-1, -2.703125}, {1, 3.296875}}
cargo_wagon_4.damaged_trigger_effect = hit_effects.entity()
cargo_wagon_4.vertical_selection_shift = -0.796875
cargo_wagon_4.weight = 1500
cargo_wagon_4.max_speed = 3
cargo_wagon_4.braking_force = 10
cargo_wagon_4.friction_force = 0.20
cargo_wagon_4.air_resistance = 0.0150
cargo_wagon_4.connection_distance = connection_length
cargo_wagon_4.joint_distance = 4
cargo_wagon_4.energy_per_hit_point = 5
cargo_wagon_4.resistances = {{
        type = "fire",
        decrease = 15,
        percent = 50 }, {
        type = "physical",
        decrease = 15,
        percent = 30 }, {
        type = "impact",
        decrease = 50,
        percent = 60 }, {
        type = "explosion",
        decrease = 15,
        percent = 30 }, {
        type = "acid",
        decrease = 3,
        percent = 20 }}
cargo_wagon_4.back_light = rolling_stock_back_light()
cargo_wagon_4.stand_by_light = rolling_stock_stand_by_light()
cargo_wagon_4.color = {
        r = 0.43,
        g = 0.23,
        b = 0,
        a = 0.5 }
cargo_wagon_4.pictures = {
        layers = {{
            priority = "very-low",
            dice = 4,
            width = 500,
            height = 300,
            back_equals_front = true,
            direction_count = 128,
            allow_low_quality_rotation = true,
            filenames = {"__ElectricTrain__/graphics/space-trains/space_cargo_wagon_1.png",
                         "__ElectricTrain__/graphics/space-trains/space_cargo_wagon_2.png",
                         "__ElectricTrain__/graphics/space-trains/space_cargo_wagon_3.png",
                         "__ElectricTrain__/graphics/space-trains/space_cargo_wagon_4.png"},
            line_length = 4,
            lines_per_file = 8,
            shift = {0, wagon_vertical_shift},
            scale = cargo_wagon_scale * 2,
            hr_version = {
                priority = "very-low",
                dice = 4,
                width = 1000,
                height = 600,
                back_equals_front = true,
                direction_count = 128,
                allow_low_quality_rotation = true,
                filenames = {"__ElectricTrain__/graphics/space-trains/hr_space_cargo_wagon_1.png",
                             "__ElectricTrain__/graphics/space-trains/hr_space_cargo_wagon_2.png",
                             "__ElectricTrain__/graphics/space-trains/hr_space_cargo_wagon_3.png",
                             "__ElectricTrain__/graphics/space-trains/hr_space_cargo_wagon_4.png"},
                line_length = 4,
                lines_per_file = 8,
                shift = {0, wagon_vertical_shift},
                scale = cargo_wagon_scale
            }
        }, {
            flags = {"mask"},
            priority = "very-low",
            dice = 4,
            width = 500,
            height = 300,
            direction_count = 128,
            allow_low_quality_rotation = true,
            back_equals_front = true,
            apply_runtime_tint = true,
            shift = {0, wagon_vertical_shift},
            filenames = {"__ElectricTrain__/graphics/space-trains/space_cargo_wagon_mask_1.png",
                         "__ElectricTrain__/graphics/space-trains/space_cargo_wagon_mask_2.png",
                         "__ElectricTrain__/graphics/space-trains/space_cargo_wagon_mask_3.png",
                         "__ElectricTrain__/graphics/space-trains/space_cargo_wagon_mask_4.png"},
            line_length = 4,
            lines_per_file = 8,
            scale = cargo_wagon_scale * 2,
            hr_version = {
                flags = {"mask"},
                priority = "very-low",
                dice = 4,
                width = 1000,
                height = 600,
                direction_count = 128,
                allow_low_quality_rotation = true,
                back_equals_front = true,
                apply_runtime_tint = true,
                shift = {0, wagon_vertical_shift},
                filenames = {"__ElectricTrain__/graphics/space-trains/hr_space_cargo_wagon_mask_1.png",
                             "__ElectricTrain__/graphics/space-trains/hr_space_cargo_wagon_mask_2.png",
                             "__ElectricTrain__/graphics/space-trains/hr_space_cargo_wagon_mask_3.png",
                             "__ElectricTrain__/graphics/space-trains/hr_space_cargo_wagon_mask_4.png"},
                line_length = 4,
                lines_per_file = 8,
                scale = cargo_wagon_scale
            }
        }, {
            flags = {"shadow"},
            priority = "very-low",
            dice = 4,
            width = 500,
            height = 300,
            back_equals_front = true,
            draw_as_shadow = true,
            direction_count = 128,
            allow_low_quality_rotation = true,
            filenames = {"__ElectricTrain__/graphics/space-trains/space_cargo_wagon_shadows_1.png",
                         "__ElectricTrain__/graphics/space-trains/space_cargo_wagon_shadows_2.png",
                         "__ElectricTrain__/graphics/space-trains/space_cargo_wagon_shadows_3.png",
                         "__ElectricTrain__/graphics/space-trains/space_cargo_wagon_shadows_4.png"},
            line_length = 4,
            lines_per_file = 8,
            shift = {0.8, wagon_vertical_shift},
            scale = cargo_wagon_scale * 2,
            hr_version = {
                flags = {"shadow"},
                priority = "very-low",
                dice = 4,
                width = 1000,
                height = 600,
                back_equals_front = true,
                draw_as_shadow = true,
                direction_count = 128,
                allow_low_quality_rotation = true,
                filenames = {"__ElectricTrain__/graphics/space-trains/hr_space_cargo_wagon_shadows_1.png",
                             "__ElectricTrain__/graphics/space-trains/hr_space_cargo_wagon_shadows_2.png",
                             "__ElectricTrain__/graphics/space-trains/hr_space_cargo_wagon_shadows_3.png",
                             "__ElectricTrain__/graphics/space-trains/hr_space_cargo_wagon_shadows_4.png"},
                line_length = 4,
                lines_per_file = 8,
                shift = {0.8, wagon_vertical_shift},
                scale = cargo_wagon_scale
            }
        }} },
cargo_wagon_4.wheels = space_train_wheels
cargo_wagon_4.crash_trigger = crash_trigger()
cargo_wagon_4.water_reflection = locomotive_reflection()

data:extend({cargo_wagon_2,cargo_wagon_3,cargo_wagon_4})


local fluid_wagon_2 = table.deepcopy(data.raw['fluid-wagon']['fluid-wagon'])
fluid_wagon_2.name = "et-fluid-wagon-2"
fluid_wagon_2.icon = "__ElectricTrain__/graphics/fluid2.png"
fluid_wagon_2.capacity = 25000 * 1.5
fluid_wagon_2.minable.result = "et-fluid-wagon-2"
fluid_wagon_2.max_health = 800
fluid_wagon_2.weight = 1500
fluid_wagon_2.max_speed = 1.8
fluid_wagon_2.braking_force = 4
fluid_wagon_2.friction_force = 0.375
fluid_wagon_2.air_resistance = 0.003
fluid_wagon_2.icon_size = 32
fluid_wagon_2.icon_mipmaps = nil

local fluid_wagon_3 = table.deepcopy(data.raw['fluid-wagon']['fluid-wagon'])
fluid_wagon_3.name = "et-fluid-wagon-3"
fluid_wagon_3.icon = "__ElectricTrain__/graphics/fluid3.png"
fluid_wagon_3.capacity = 25000 * 2
fluid_wagon_3.minable.result = "et-fluid-wagon-3"
fluid_wagon_3.max_health = 1000
fluid_wagon_3.weight = 2000
fluid_wagon_3.max_speed = 2.4
fluid_wagon_3.braking_force = 5
fluid_wagon_3.friction_force = 0.25
fluid_wagon_3.air_resistance = 0.002
fluid_wagon_3.icon_size = 32
fluid_wagon_3.icon_mipmaps = nil

local fluid_wagon_4 = table.deepcopy(data.raw['fluid-wagon']['fluid-wagon'])
fluid_wagon_4.name = "et-fluid-wagon-4"
fluid_wagon_4.icon = "__ElectricTrain__/graphics/icons/space-fluid-wagon.png"
fluid_wagon_4.icon_size = 64
fluid_wagon_4.icon_mipmaps = 4
fluid_wagon_4.flags = {"placeable-neutral", "player-creation", "placeable-off-grid"}
fluid_wagon_4.minable = {
        mining_time = 0.5,
        result = "et-fluid-wagon-4" }
fluid_wagon_4.max_health = 1200
fluid_wagon_4.capacity = 50000
fluid_wagon_4.corpse = "fluid-wagon-remnants"
fluid_wagon_4.dying_explosion = "fluid-wagon-explosion"
fluid_wagon_4.collision_box = {{-0.6, -2.4}, {0.6, 2.4}}
fluid_wagon_4.selection_box = {{-1, -2.703125}, {1, 3.296875}}
fluid_wagon_4.damaged_trigger_effect = hit_effects.entity()
fluid_wagon_4.vertical_selection_shift = -0.796875
fluid_wagon_4.weight = 1500
fluid_wagon_4.max_speed = 3
fluid_wagon_4.braking_force = 10
fluid_wagon_4.friction_force = 0.20
fluid_wagon_4.connection_distance = connection_length
fluid_wagon_4.joint_distance = 4
fluid_wagon_4.energy_per_hit_point = 6
fluid_wagon_4.resistances = {{
        type = "fire",
        decrease = 15,
        percent = 50 }, {
        type = "physical",
        decrease = 15,
        percent = 30 }, {
        type = "impact",
        decrease = 50,
        percent = 60 }, {
        type = "explosion",
        decrease = 15,
        percent = 30 }, {
        type = "acid",
        decrease = 3,
        percent = 20 }},
fluid_wagon_4.back_light = rolling_stock_back_light()
fluid_wagon_4.stand_by_light = rolling_stock_stand_by_light()
fluid_wagon_4.color = {
        r = 0.43,
        g = 0.23,
        b = 0,
        a = 0.5 },
fluid_wagon_4.pictures = {
        layers = {{
            priority = "very-low",
            dice = 4,
            width = 500,
            height = 300,
            back_equals_front = true,
            direction_count = 128,
            allow_low_quality_rotation = true,
            filenames = {"__ElectricTrain__/graphics/space-trains/space_fluid_wagon_1.png",
                         "__ElectricTrain__/graphics/space-trains/space_fluid_wagon_2.png",
                         "__ElectricTrain__/graphics/space-trains/space_fluid_wagon_3.png",
                         "__ElectricTrain__/graphics/space-trains/space_fluid_wagon_4.png"},
            line_length = 4,
            lines_per_file = 8,
            shift = {0, -0.7},
            scale = train_scale * 2,
            hr_version = {
                priority = "very-low",
                dice = 4,
                width = 1000,
                height = 600,
                back_equals_front = true,
                direction_count = 128,
                allow_low_quality_rotation = true,
                filenames = {"__ElectricTrain__/graphics/space-trains/hr_space_fluid_wagon_1.png",
                             "__ElectricTrain__/graphics/space-trains/hr_space_fluid_wagon_2.png",
                             "__ElectricTrain__/graphics/space-trains/hr_space_fluid_wagon_3.png",
                             "__ElectricTrain__/graphics/space-trains/hr_space_fluid_wagon_4.png"},
                line_length = 4,
                lines_per_file = 8,
                shift = {0, -0.7},
                scale = fluid_wagon_scale
            }
        }, {
            flags = {"shadow"},
            priority = "very-low",
            dice = 4,
            width = 500,
            height = 300,
            back_equals_front = true,
            draw_as_shadow = true,
            direction_count = 128,
            allow_low_quality_rotation = true,
            filenames = {"__ElectricTrain__/graphics/space-trains/space_fluid_wagon_shadows_1.png",
                         "__ElectricTrain__/graphics/space-trains/space_fluid_wagon_shadows_2.png",
                         "__ElectricTrain__/graphics/space-trains/space_fluid_wagon_shadows_3.png",
                         "__ElectricTrain__/graphics/space-trains/space_fluid_wagon_shadows_4.png"},
            line_length = 4,
            lines_per_file = 8,
            shift = {0, -0.7},
            scale = train_scale * 2,
            hr_version = {
                flags = {"shadow"},
                priority = "very-low",
                dice = 4,
                width = 1000,
                height = 600,
                back_equals_front = true,
                draw_as_shadow = true,
                direction_count = 128,
                allow_low_quality_rotation = true,
                filenames = {"__ElectricTrain__/graphics/space-trains/hr_space_fluid_wagon_shadows_1.png",
                             "__ElectricTrain__/graphics/space-trains/hr_space_fluid_wagon_shadows_2.png",
                             "__ElectricTrain__/graphics/space-trains/hr_space_fluid_wagon_shadows_3.png",
                             "__ElectricTrain__/graphics/space-trains/hr_space_fluid_wagon_shadows_4.png"},
                line_length = 4,
                lines_per_file = 8,
                shift = {0, -0.7},
                scale = fluid_wagon_scale
            }
        }} }
fluid_wagon_4.minimap_representation = {
        filename = "__base__/graphics/entity/fluid-wagon/fluid-wagon-minimap-representation.png",
        flags = {"icon"},
        size = {20, 40},
        scale = 0.5 }
fluid_wagon_4.selected_minimap_representation = {
        filename = "__base__/graphics/entity/fluid-wagon/fluid-wagon-selected-minimap-representation.png",
        flags = {"icon"},
        size = {20, 40},
        scale = 0.5 }
fluid_wagon_4.wheels = space_train_wheels
fluid_wagon_4.crash_trigger = crash_trigger()
fluid_wagon_4.sound_minimum_speed = 0.1
fluid_wagon_4.vehicle_impact_sound = sounds.generic_impact
fluid_wagon_4.water_reflection = locomotive_reflection()

data:extend({fluid_wagon_2,fluid_wagon_3,fluid_wagon_4})


function format_number(number_string)
	local number = number_string:match('%d+%.?%d+')
	local append_suffix = number_string:match('%a+')
	
	local pre = ""
	local typ = ""
	
	if append_suffix:len() == 2 then
		pre =  append_suffix:sub(1, 1):upper()
		typ =  append_suffix:sub(2):upper()
	elseif append_suffix:len() == 1 then
		typ = append_suffix:upper()
	end

	
	if pre == "K" then
		number = number * 1000
	elseif pre == "M" then
		number = number * 1000000
	end
		
	if typ == "W" then
		number = number / 60
	end
	return number
end

function CreateTrainInterface(train)	
	local power = format_number(train.max_power)	
	local energy = power * 1.1

	data:extend(
	{
		{
			type = "electric-energy-interface",
			name = train.name .. "-power",
			icon = train.icon,
			icon_size = 32,
			localised_name = {"entity-name." .. train.name},
			collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
			selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
			collision_mask = {"ground-tile"},
			selectable_in_game = false,
			energy_source =
			{
				type = "electric",
				buffer_capacity = (energy * 2) .. "J",
				usage_priority = "secondary-input",
				input_flow_limit = energy .. "J" ,
				drain = power / 10 .. "J" ,
				render_no_network_icon = false,
				render_no_power_icon = false
			},
			picture =
			{
				filename = "__core__/graphics/empty.png",
				priority = "extra-high",
				width = 1,
				height = 1
			},
			order = "z"
		}
	})
end

CreateTrainInterface(data.raw['locomotive']['et-electric-locomotive-1'])	
CreateTrainInterface(data.raw['locomotive']['et-electric-locomotive-2'])
CreateTrainInterface(data.raw['locomotive']['et-electric-locomotive-3'])
CreateTrainInterface(data.raw['locomotive']['et-electric-locomotive-4'])

function InsertMUControl(name)
	data:extend(
	{
		{
			type = "electric-energy-interface",
			name = name .. "-power",
			icon = "__core__/graphics/empty.png",
			icon_size = 32,
			collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
			selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
			collision_mask = {"ground-tile"},
			selectable_in_game = false,
			energy_source =
			{
				type = "void"
			},
			picture =
			{
				filename = "__core__/graphics/empty.png",
				priority = "extra-high",
				width = 1,
				height = 1
			},
			order = "z"
		}
	})
end

if mods['MultipleUnitTrainControl'] then
	InsertMUControl("et-electric-locomotive-1-mu")
	InsertMUControl("et-electric-locomotive-2-mu")
	InsertMUControl("et-electric-locomotive-3-mu")
	InsertMUControl("et-electric-locomotive-4-mu")
end