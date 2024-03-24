--- STEAMODDED HEADER
--- MOD_NAME: Ink And Color
--- MOD_ID: InkAndColor
--- MOD_AUTHOR: [RattlingSnow353]
--- MOD_DESCRIPTION: This mod is based on sixsuits(check them out), Adds two new suits: Ink & Color. 

----------------------------------------------
------------MOD CODE -------------------------
local config = {
    -- Decks
    
    -- Jokers
    inkedJoker = true,
    artist = true,
}

local function is_even(card)
    local id = card:get_id()
    return id <= 10 and id % 2 == 0
end

local function is_odd(card)
    local id = card:get_id()
    return (id % 2 ~= 0 and id < 10) or id == 14
end

local function is_fibo(card)
    local id = card:get_id()
    return id == 2 or id == 3 or id == 5 or id == 8 or id == 14
end

local function is_prime(card)
    local id = card:get_id()
    return id == 2 or id == 3 or id == 5 or id == 7 or id == 14
end

local function is_face(card)
    local id = card:get_id()
    return id == 11 or id == 12 or id == 13
end

local function get_random_letter(letter)
    -- 'A' to 'Z' is 65 to 95
    local random_ascii = math.random(65, 90)
    local new_letter = string.char(random_ascii)
    if letter ~= new_letter then
        return new_letter
    else
        return get_random_letter(letter)
    end
end

local function remove_prefix(name, prefix)
    local start_pos, end_pos = string.find(name, prefix)
    if start_pos == 1 then
        return string.sub(name, end_pos + 1)
    else
        return name
    end
end

local function count_letters(str, letter)
    local count = 0
    for i in str:gmatch(letter) do
        count = count + 1
    end
    return count
end

local enhancements = {
    G.P_CENTERS.m_bonus,
    G.P_CENTERS.m_mult,
    G.P_CENTERS.m_wild,
    G.P_CENTERS.m_glass,
    G.P_CENTERS.m_steel,
    G.P_CENTERS.m_stone,
    G.P_CENTERS.m_gold,
    G.P_CENTERS.m_lucky
}

local card_editions = {
    { foil = true },
    { holo = true },
    { polychrome = true }
}

local seals = {
    "Gold",
    "Red",
    "Blue",
    "Purple"
}

local function get_random_in_table(table)
    local index = math.random(1, #table)
    return table[index]
end

local function tables_equal(a, b)
    return table.concat(a) == table.concat(b)
end

local function tables_copy(t)
    local t2 = {}
    for k, v in pairs(t) do
        t2[k] = v
    end
    return t2
end

local attributes = {
    mult = { key = 'mult_dagonet', min = 0 },
    mult_mod = { key = 'mult_mod_dagonet', min = 0 },
    chips = { key = 'chips_dagonet', min = 0 },
    chip_mod = { key = 'chip_mod_dagonet', min = 0 },
    Xmult = { key = 'Xmult_dagonet', min = 1 },
    Xmult_mod = { key = 'Xmult_mod_dagonet', min = 0 },
    x_mult = { key = 'x_mult_dagonet', min = 1 },
    t_mult = { key = 't_mult_dagonet', min = 0 },
    t_chips = { key = 't_chips_dagonet', min = 0 },
    s_mult = { key = 's_mult_dagonet', min = 0 },
    dollars = { key = 'dollars_dagonet', min = 0 },
    hand_add = { key = 'hand_add_dagonet', min = 0 },
    discard_sub = { key = 'discard_sub_dagonet', min = 0 },
    odds = { key = 'odds_dagonet', min = 0 },
    faces = { key = 'faces_dagonet', min = 0 },
    max = { key = 'max_dagonet', min = 0 },
    min = { key = 'min_dagonet', min = 0 },
    every = { key = 'every_dagonet', min = 0 },
    increase = { key = 'increase_dagonet', min = 0 },
    h_size = { key = 'h_size_dagonet', min = 0 },
    d_size = { key = 'd_size_dagonet', min = 0 },
    h_mod = { key = 'h_mod_dagonet', min = 0 },
    h_plays = { key = 'h_plays_dagonet', min = 0 },
    discards = { key = 'discards_dagonet', min = 0 },
    req = { key = 'req_dagonet', min = 0 },
    percentage = { key = 'percentage_dagonet', min = 0 },
    base = { key = 'base_dagonet', min = 0 },
    dollar_gain_one = { key = 'dollar_gain_one_dagonet', min = 0 },
    dollar_gain_two = { key = 'dollar_gain_two_dagonet', min = 0 },
    dollar_gain_three = { key = 'dollar_gain_three_dagonet', min = 0 },
    dollar_gain_four = { key = 'dollar_gain_four_dagonet', min = 0 },
    dollar_gain_five = { key = 'dollar_gain_five_dagonet', min = 0 },
    extra = { key = 'extra_dagonet', min = 0 }
}

local function increase_attributes(k, v, place, multiplier)
    local attr = attributes[k]

    if not attr or type(v) == "string" then
        return
    end

    -- Handle extra seperately
    if type(v) == "table" then
        for k2, v2 in pairs(place.extra) do
            increase_attributes(k2, v2, place.extra, multiplier)
        end
    elseif v > attr.min then
        if place[attr.key] == nil then
            place[attr.key] = v
        else
            v = v - place[attr.key]
            place[attr.key] = v
        end
        place[k] = v * multiplier
    elseif v == attr.min and place[attr.key] ~= nil then
        place[attr.key] = 0
    end
end

local locs = {
    -- Decks
    
    -- Jokers
    inkedJoker = {
        name = "Inked Joker",
        text = {
            "Played cards with",
            "{C:000000}Ink{} suit give",
            "{C:mult}+4{} Mult when scored"
        }
    },
    artist = {
        name = "Artist",
        text = {
            "Played cards with",
            "{C:Purple}Color{} suit give",
            "{C:mult}+4{} Mult when scored"
        }
    }
}

local jokers = {
    inkedJoker = {
        ability_name = "inkedJoker",
        slug = "inked_joker",
        ability = { extra = { mult = 4 } },
        rarity = 1,
        cost = 4,
        unlocked = true,
        discovered = true,
        blueprint_compat = true,
        eternal_compat = true
    },
    artist = {
        ability_name = "artist",
        slug = "artist",
        ability = { extra = { mult = 4 } },
        rarity = 1,
        cost = 4,
        unlocked = true,
        discovered = true,
        blueprint_compat = true,
        eternal_compat = true
    }
}

function SMODS.INIT.InkAndColor()

    init_localization()

    local ink_and_color_mod = SMODS.findModByID('InkAndColor')
    local sprite_cards_1 = SMODS.Sprite:new('ink_&_color_1', ink_and_color_mod.path, '8BitDeck.png', 71, 95, 'asset_atli')
    local sprite_cards_2 = SMODS.Sprite:new('ink_&_color_2', ink_and_color_mod.path, '8BitDeck_opt2.png', 71, 95, 'asset_atli')
    local sprite_ui_1 = SMODS.Sprite:new('ink_&_color_ui_2', ink_and_color_mod.path, 'ui_assets.png', 18, 18, 'asset_atli')
    local sprite_ui_2 = SMODS.Sprite:new('ink_&_color_ui_1', ink_and_color_mod.path, 'ui_assets_opt2.png', 18, 18, 'asset_atli')
    sprite_cards_1:register()
    sprite_cards_2:register()
    sprite_ui_1:register()
    sprite_ui_2:register()
    -- function SMODS.Card:new_suit(name, card_atlas_low_contrast, card_atlas_high_contrast, card_pos, ui_atlas_low_contrast, ui_atlas_high_contrast, ui_pos, colour_low_contrast, colour_high_contrast)
    SMODS.Card:new_suit('Color', 'ink_&_color_1', 'ink_&_color_2', { y = 1 }, 'ink_&_color_ui_1', 'ink_&_color_ui_2',
        { x = 1, y = 0 }, '136056', '295270')
    SMODS.Card:new_suit('Ink', 'ink_&_color_1', 'ink_&_color_2', { y = 0 }, 'ink_&_color_ui_1', 'ink_&_color_ui_2',
        { x = 0, y = 0 }, '000000', '000000')
   
    G.ink_and_color = false

    -- Initialize Jokers
    for k, v in pairs(jokers) do
        if config[k] then
            local joker = SMODS.Joker:new(v.ability_name, v.slug, v.ability, { x = 0, y = 0 }, locs[k],
                v.rarity, v.cost, v.unlocked, v.discovered, v.blueprint_compat, v.eternal_compat)
            joker:register()
            local sprite = SMODS.Sprite:new("j_" .. v.slug, SMODS.findModByID('InkAndColor').path,
                "j_" .. v.slug .. ".png", 71, 95, "asset_atli")
            sprite:register()
        end
    end

    -- Blob Tarot
    local blob_tarot_def = {
        name = "The Blob",
        text = {
            "Converts up to",
            "{C:attention}3{} selected cards",
            "to {C:Black}Ink{}"
        }
    }
    
    local blob_tarot = SMODS.Tarot:new("The Blob", "blob_tarot", {suit_conv = 'Ink', max_highlighted = 3}, { x = 0, y = 0 }, blob_tarot_def, 3, 1.0, "Suit Conversion", true, true)
    SMODS.Sprite:new("c_blob_tarot", ink_and_color_mod.path, "c_blob_tarot.png", 71, 95, "asset_atli"):register();
    blob_tarot:register()

    -- Color Tarot
    local color_tarot_def = {
        name = "The Color",
        text = {
            "Converts up to",
            "{C:attention}3{} selected cards",
            "to {C:Purple}Color{}"
        }
    }
    
    local color_tarot = SMODS.Tarot:new("The Color", "color_tarot", {suit_conv = 'Color', max_highlighted = 3}, { x = 0, y = 0 }, color_tarot_def, 3, 1.0, "Suit Conversion", true, true)
    SMODS.Sprite:new("c_color_tarot", ink_and_color_mod.path, "c_color_tarot.png", 71, 95, "asset_atli"):register();
    color_tarot:register()


    if config.inkedJoker then
        SMODS.Jokers.j_inked_joker.calculate = function(self, context)
            if context.cardarea == G.play and not context.repetition then
                if context.other_card:is_suit('Ink') then
                    -- Add mult if ink suit
                    return {
                        message = localize { type = 'variable', key = 'a_mult', vars = { self.ability.extra.mult } },
                        mult = self.ability.extra.mult,
                        card = self
                    }
                end
            end
        end
    end
    if config.artist then
        SMODS.Jokers.j_artist.calculate = function(self, context)
            if context.cardarea == G.play and not context.repetition then
                if context.other_card:is_suit('Color') then
                    -- Add mult if color suit
                    return {
                        message = localize { type = 'variable', key = 'a_mult', vars = { self.ability.extra.mult } },
                        mult = self.ability.extra.mult,
                        card = self
                    }
                end
            end
        end
    end



    --! DO NOT MODIFY | handles hands added to G.handlist
    function create_UIBox_current_hands(simple)
        local hands = {}
        for _, v in ipairs(G.handlist) do
            hands[#hands + 1] = create_UIBox_current_hand_row(v, simple)
        end
        local t = {
            n = G.UIT.ROOT,
            config = { align = "cm", minw = 3, padding = 0.1, r = 0.1, colour = G.C.CLEAR },
            nodes = {
                {
                    n = G.UIT.R,
                    config = { align = "cm", padding = 0.04 },
                    nodes =
                        hands
                },
            }
        }
        return t
    end
end

local generate_UIBox_ability_tableref = Card.generate_UIBox_ability_table
function Card.generate_UIBox_ability_table(self)
    local card_type, hide_desc = self.ability.set or "None", nil
    local loc_vars = nil
    local main_start, main_end = nil, nil
    local no_badge = nil

    if self.config.center.unlocked == false and not self.bypass_lock then    -- For everyting that is locked
    elseif card_type == 'Undiscovered' and not self.bypass_discovery_ui then -- Any Joker or tarot/planet/voucher that is not yet discovered
    elseif self.debuff then
    elseif card_type == 'Default' or card_type == 'Enhanced' then
    elseif self.ability.set == 'Joker' then
        local customJoker = true

        if self.ability.name == 'inkedJoker' then
            loc_vars = { self.ability.extra.mult }
        elseif self.ability.name == 'artist' then
            loc_vars = { self.ability.extra.mult }
        else
            customJoker = false
        end

        if customJoker then
            local badges = {}
            if (card_type ~= 'Locked' and card_type ~= 'Undiscovered' and card_type ~= 'Default') or self.debuff then
                badges.card_type = card_type
            end
            if self.ability.set == 'Joker' and self.bypass_discovery_ui and (not no_badge) then
                badges.force_rarity = true
            end
            if self.edition then
                if self.edition.type == 'negative' and self.ability.consumeable then
                    badges[#badges + 1] = 'negative_consumable'
                else
                    badges[#badges + 1] = (self.edition.type == 'holo' and 'holographic' or self.edition.type)
                end
            end
            if self.seal then
                badges[#badges + 1] = string.lower(self.seal) .. '_seal'
            end
            if self.ability.eternal then
                badges[#badges + 1] = 'eternal'
            end
            if self.pinned then
                badges[#badges + 1] = 'pinned_left'
            end

            if self.sticker then
                loc_vars = loc_vars or {};
                loc_vars.sticker = self.sticker
            end

            return generate_card_ui(self.config.center, nil, loc_vars, card_type, badges, hide_desc, main_start,
                main_end)
        end
    end

    return generate_UIBox_ability_tableref(self)
end

local evaluate_playref = G.FUNCS.evaluate_play
function G.FUNCS.evaluate_play(self, e)
    evaluate_playref(self, e)

    for i = 1, #G.jokers.cards do
        local effects = eval_card(G.jokers.cards[i],
            { card = G.consumeables, after = true, mmc_scored_chips = hand_chips * mult })
        if effects.jokers then
            card_eval_status_text(G.jokers.cards[i], 'jokers', nil, 0.3, nil, effects.jokers)
        end
    end
end

SMODS.Tarot = {
  	name = "",
  	slug = "",
	cost = 3,
	config = {},
  	pos = {},
	loc_txt = {},
	discovered = false, 
	consumeable = true,
	effect = "",
	cost_mult = 1.0
}

function SMODS.Tarot:new(name, slug, config, pos, loc_txt, cost, cost_mult, effect, consumeable, discovered)
    o = {}
    setmetatable(o, self)
    self.__index = self

    o.loc_txt = loc_txt
    o.name = name
    o.slug = "c_" .. slug
    o.config = config or {}
    o.pos = pos or {
        x = 0,
        y = 0
    }
    o.cost = cost
    o.discovered = discovered or false
    o.consumeable = consumeable or true
	o.effect = effect or ""
	o.cost_mult = cost_mult or 0.0
	return o
end

function SMODS.Tarot:register()
	SMODS.Tarots[self.slug] = self

	local minId = table_length(G.P_CENTER_POOLS['Tarot']) + 1
    local id = 0
    local i = 0
	i = i + 1
	-- Prepare some Datas
	id = i + minId

	local tarot_obj = {
		discovered = self.discovered,
		consumeable = self.consumeable,
		name = self.name,
		set = "Tarot",
		order = id,
		key = self.slug,
		pos = self.pos,
		config = self.config,
		effect = self.effect,
		cost_mult = self.cost_mult
	}

	for _i, sprite in ipairs(SMODS.Sprites) do
		sendDebugMessage(sprite.name)
		sendDebugMessage(tarot_obj.key)
		if sprite.name == tarot_obj.key then
			tarot_obj.atlas = sprite.name
		end
	end

	-- Now we replace the others
	G.P_CENTERS[self.slug] = tarot_obj
	table.insert(G.P_CENTER_POOLS['Tarot'], tarot_obj)

	-- Setup Localize text
	G.localization.descriptions["Tarot"][self.slug] = self.loc_txt

	-- Load it
	for g_k, group in pairs(G.localization) do
		if g_k == 'descriptions' then
			for _, set in pairs(group) do
				for _, center in pairs(set) do
					center.text_parsed = {}
					for _, line in ipairs(center.text) do
						center.text_parsed[#center.text_parsed + 1] = loc_parse_string(line)
					end
					center.name_parsed = {}
					for _, line in ipairs(type(center.name) == 'table' and center.name or {center.name}) do
						center.name_parsed[#center.name_parsed + 1] = loc_parse_string(line)
					end
					if center.unlock then
						center.unlock_parsed = {}
						for _, line in ipairs(center.unlock) do
							center.unlock_parsed[#center.unlock_parsed + 1] = loc_parse_string(line)
						end
					end
				end
			end
		end
	end

	sendDebugMessage("The Tarot named " .. self.name .. " with the slug " .. self.slug ..
						 " have been registered at the id " .. id .. ".")
end


function create_UIBox_your_collection_tarots()
	local deck_tables = {}
  
	G.your_collection = {}
	for j = 1, 2 do
	  G.your_collection[j] = CardArea(
		G.ROOM.T.x + 0.2*G.ROOM.T.w/2,G.ROOM.T.h,
		(4.25+j)*G.CARD_W,
		1*G.CARD_H, 
		{card_limit = 4 + j, type = 'title', highlight_limit = 0, collection = true})
	  table.insert(deck_tables, 
	  {n=G.UIT.R, config={align = "cm", padding = 0, no_fill = true}, nodes={
		{n=G.UIT.O, config={object = G.your_collection[j]}}
	  }}
	  )
	end
  
	local tarot_options = {}
	for i = 1, math.ceil(#G.P_CENTER_POOLS.Tarot/11) do
	  table.insert(tarot_options, localize('k_page')..' '..tostring(i)..'/'..tostring(math.floor(#G.P_CENTER_POOLS.Tarot/11)))
	end
  
	  for j = 1, #G.your_collection do
		for i = 1, 4+j do
		local center = G.P_CENTER_POOLS["Tarot"][i+(j-1)*(5)]
		local card = Card(G.your_collection[j].T.x + G.your_collection[j].T.w/2, G.your_collection[j].T.y, G.CARD_W, G.CARD_H, nil, center)
		card:start_materialize(nil, i>1 or j>1)
		G.your_collection[j]:emplace(card)
	  end
	end
  
	INIT_COLLECTION_CARD_ALERTS()
	
	local t = create_UIBox_generic_options({ back_func = 'your_collection', contents = {
			  {n=G.UIT.R, config={align = "cm", minw = 2.5, padding = 0.1, r = 0.1, colour = G.C.BLACK, emboss = 0.05}, nodes=deck_tables},
					{n=G.UIT.R, config={align = "cm"}, nodes={
					  create_option_cycle({options = tarot_options, w = 4.5, cycle_shoulders = true, opt_callback = 'your_collection_tarot_page', focus_args = {snap_to = true, nav = 'wide'},current_option = 1, colour = G.C.RED, no_pips = true})
					}}
			}})
	return t
  end
----------------------------------------------
------------MOD CODE END---------------------