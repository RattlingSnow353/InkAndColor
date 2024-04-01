--- STEAMODDED HEADER
--- MOD_NAME: Ink And Color
--- MOD_ID: InkAndColor
--- MOD_AUTHOR: [RattlingSnow353]
--- MOD_DESCRIPTION: This mod is inspired on sixsuits(check them out), Adds two new suits: Ink & Color(Suit art by Grassy), Adds 4 complmentairy jokers, Adds two compenttary blinds, Adds two complmentairy tarot cards, and a Deck for the cards. 

----------------------------------------------
------------MOD CODE -------------------------
local config = {
    -- Decks
    stainedPalette = true,
    -- Jokers
    inkedJoker = true,
    artist = true,
    obsidian = true,
    bismuth = true,
    --monochromeTv = true,
}

local function is_Ink(card)
    local suitI = card:is_suit("Ink")
    return suitI
end

local function is_Color(card)
    local suitC = card:is_suit("Color")
    return suitC 
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

local seals = {
    "Gold",
    "Red",
    "Blue",
    "Purple"
}

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

-- Save attributes
local attributes = {
    mult = {
        key = 'mult_dagonet',
        prev_key = 'prev_mult_dagonet',
        min = 0
    },
    mult_mod = {
        key = 'mult_mod_dagonet',
        prev_key = 'prev_mult_mod_dagonet',
        min = 0
    },
    chips = {
        key = 'chips_dagonet',
        prev_key = 'prev_chips_dagonet',
        min = 0
    },
    chip_mod = {
        key = 'chip_mod_dagonet',
        prev_key = 'prev_chips_mod_dagonet',
        min = 0
    },
    Xmult = {
        key = 'Xmult_dagonet',
        prev_key = 'prev_Xmult_dagonet',
        min = 1
    },
    Xmult_mod = {
        key = 'Xmult_mod_dagonet',
        prev_key = 'prev_Xmult_mod_dagonet',
        min = 0
    },
    x_mult = {
        key = 'x_mult_dagonet',
        prev_key = 'prev_x_mult_dagonet',
        min = 1
    },
    t_mult = {
        key = 't_mult_dagonet',
        prev_key = 'prev_t_mult_dagonet',
        min = 0
    },
    t_chips = {
        key = 't_chips_dagonet',
        prev_key = 'prev_t_chips_dagonet',
        min = 0
    },
    s_mult = {
        key = 's_mult_dagonet',
        prev_key = 'prev_s_mult_dagonet',
        min = 0
    },
    dollars = {
        key = 'dollars_dagonet',
        prev_key = 'prev_dollars_dagonet',
        min = 0
    },
    hand_add = {
        key = 'hand_add_dagonet',
        prev_key = 'prev_hand_add_dagonet',
        min = 0
    },
    discard_sub = {
        key = 'discard_sub_dagonet',
        prev_key = 'prev_discard_sub_dagonet',
        min = 0
    },
    odds = {
        key = 'odds_dagonet',
        prev_key = 'prev_odds_dagonet',
        min = 0
    },
    faces = {
        key = 'faces_dagonet',
        prev_key = 'prev_faces_dagonet',
        min = 0
    },
    max = {
        key = 'max_dagonet',
        prev_key = 'prev_max_dagonet',
        min = 0
    },
    min = {
        key = 'min_dagonet',
        prev_key = 'prev_min_dagonet',
        min = 0
    },
    every = {
        key = 'every_dagonet',
        prev_key = 'prev_every_dagonet',
        min = 0
    },
    increase = {
        key = 'increase_dagonet',
        prev_key = 'prev_increase_dagonet',
        min = 0
    },
    d_size = {
        key = 'd_size_dagonet',
        prev_key = 'prev_d_size_dagonet',
        min = 0
    },
    h_mod = {
        key = 'h_mod_dagonet',
        prev_key = 'prev_h_mod_dagonet',
        min = 0
    },
    h_plays = {
        key = 'h_plays_dagonet',
        prev_key = 'prev_h_plays_dagonet',
        min = 0
    },
    discards = {
        key = 'discards_dagonet',
        prev_key = 'prev_discards_dagonet',
        min = 0
    },
    req = {
        key = 'req_dagonet',
        prev_key = 'prev_req_dagonet',
        min = 0
    },
    percentage = {
        key = 'percentage_dagonet',
        prev_key = 'prev_percentage_dagonet',
        min = 0
    },
    base = {
        key = 'base_dagonet',
        prev_key = 'prev_base_dagonet',
        min = 0
    },
    repetitions = {
        key = 'repetitions_dagonet',
        prev_key = 'prev_repetitions_dagonet',
        min = 0
    },
    dollar_gain_one = {
        key = 'dollar_gain_one_dagonet',
        prev_key = 'prev_dollar_gain_one_dagonet',
        min = 0
    },
    dollar_gain_two = {
        key = 'dollar_gain_two_dagonet',
        prev_key = 'prev_dollar_gain_two_dagonet',
        min = 0
    },
    dollar_gain_three = {
        key = 'dollar_gain_three_dagonet',
        prev_key = 'prev_dollar_gain_three_dagonet',
        min = 0
    },
    dollar_gain_four = {
        key = 'dollar_gain_four_dagonet',
        prev_key = 'prev_dollar_gain_four_dagonet',
        min = 0
    },
    dollar_gain_five = {
        key = 'dollar_gain_five_dagonet',
        prev_key = 'prev_dollar_gain_five_dagonet',
        min = 0
    },
    extra = {
        key = 'extra_dagonet',
        prev_key = 'prev_extra_dagonet',
        min = 0
    }
}

-- Increase base attributes
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
        if place[attr.prev_key] == nil then
            place[attr.prev_key] = multiplier
        end
        if place[attr.key] == nil then
            -- Save base value
            place[attr.key] = v
        else
            if not (v / multiplier == place[attr.key] and place[attr.prev_key] == multiplier) then
                if not (v / multiplier == place[attr.key] or v / place[attr.prev_key] == place[attr.key]) then
                    if v / multiplier ~= place[attr.key] and place[attr.prev_key] == multiplier then
                        -- Update base based on current multiplier
                        local increase = (v / multiplier - place[attr.key]) * multiplier
                        place[attr.key] = place[attr.key] + increase
                    else
                        -- Update base based on previous multiplier
                        local increase = (v / place[attr.prev_key] - place[attr.key]) * place[attr.prev_key]
                        place[attr.key] = place[attr.key] + increase
                    end
                end
            end
        end
        -- Multiply attribute
        place[k] = place[attr.key] * multiplier
        place[attr.prev_key] = multiplier
    end
end

local function not_in_table(table, value)
    for _, v in ipairs(table) do
        if v == value then
            return false
        end
    end
    return true
end

-- Create Decks
local decks = {
    stainedPalette = {
        loc = {
            name = "Stained Palette",
            text = {
                "Start run with only",
                "{C:black,E:1,S:1.1}Ink{} and {C:purple,E:1,S:1.1}Color{}",
                "cards."
            }
        },
        name = "Stained Palette",
        config = {
            ink_and_color_deck = true
        },
        sprite = {
            x = 7,
            y = 5
        }
    },
}

-- Initialize deck effect
local Backapply_to_runRef = Back.apply_to_run
function Back.apply_to_run(arg_56_0)
    Backapply_to_runRef(arg_56_0)

    if arg_56_0.effect.config.ink_and_color_deck then
        G.E_MANAGER:add_event(Event({
            func = function()
                -- Loop over all cards
                for i = #G.playing_cards, 1, -1 do
                    -- Remove odd cards
                    if not is_Ink(G.playing_cards[i]) and not is_Color(G.playing_cards[i]) then
                        G.playing_cards[i]:start_dissolve(nil, true)
                    end
                end

                -- Return
                G.GAME.starting_deck_size = 26
                return true
            end
        }))
    end
end


    --monochromeTv = {
      --  name = "Monochrome TV",
        --text = {
          --  "{C:black,E:1,S:1.1}Ink{} suit will be considered as no suit.",
            --"If there are any inks scored with other suited cards,",
   --         "they will be converted into the {C:black,E:1,S:1.1}Ink{} Suit.",
     --   }
    --}

    --monochromeTv = {
        --ability_name = "monochromeTv",
        --slug = "monochrome_tv",
        --ability = { extra = {} },
        --rarity = 2,
        --cost = 6,
       -- unlocked = true,
       -- discovered = true,
       -- blueprint_compat = true,
       -- eternal_compat = true,
  --  }

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
    --Art For Suits By Grassy
    G.ink_and_color = false

    -- Initialize Decks
    for k, v in pairs(decks) do
        if config[k] then
            local newDeck = SMODS.Deck:new(v.name, k, v.config, v.sprite, v.loc)
            local sprite_centers = SMODS.Sprite:new("centers", ink_and_color_mod.path, "NewEnhancer.png", 71, 95, "asset_atli")
            sprite_centers:register()
            newDeck:register()
        end
    end

    --SMODS.Tarot:new = (name = "", slug = "", config = {}, pos = {}, loc_txt = {}, cost = 3, cost_mult = 1.0, effect = "", discovered = false, consumeable = true)

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
    SMODS.Sprite:new("c_blob_tarot", ink_and_color_mod.path, "Tarots/c_blob_tarot.png", 71, 95, "asset_atli"):register();

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
    SMODS.Sprite:new("c_color_tarot", ink_and_color_mod.path, "Tarots/c_color_tarot.png", 71, 95, "asset_atli"):register();
    
    color_tarot:register()
    blob_tarot:register()

    -- SMODS.Blind = {name = "", slug = "", loc_txt = {}, dollars = 5, mult = 2, vars = {}, debuff = {}, pos = {x=0, y=0}, boss = {}, boss_colour = HEX('FFFFFF'), defeated = false}

    --- Bleach Blind
    local Bleach_blind_def = {
        ["name"]="The Bleach",
        ["text"]={
            [1]="All Ink cards",
            [2]="are debuffed"
        },
    }
    local Bleach_blind = SMODS.Blind:new("The Bleach", "bleach", Bleach_blind_def, 5, 2, {}, {suit = 'Ink'}, {x=0, y=0}, {min = 1, max = 10}, HEX('CCCCCC'), true, 'InkAndColor' .. "blinds")
    SMODS.Sprite:new('InkAndColor' .. "blinds", ink_and_color_mod.path, 'BlindChips.png', 34, 34, 'animation_atli', 21):register()

    --- Drain Blind
    local Drain_blind_def = {
        ["name"]="The Drain",
        ["text"]={
            [1]="All Color cards",
            [2]="are debuffed"
        },
    }
    local Drain_blind = SMODS.Blind:new("The Drain", "drain", Drain_blind_def, 5, 2, {}, {suit = 'Color'}, {x=0, y=1}, {min = 1, max = 10}, HEX('A9A9A9'), true, 'InkAndColor' .. "blinds")
    SMODS.Sprite:new('InkAndColor' .. "blinds", ink_and_color_mod.path, 'BlindChips.png', 34, 34, 'animation_atli', 21):register()

    Bleach_blind:register()
    Drain_blind:register()

    if config.inkedJoker then
        -- Create Joker
        local inked = {
            loc = {
                name = "Inked Joker",
                text = {
                    "Played cards with",
                    "{C:black,E:1,S:1.1}Ink{} suit gives",
                    "{C:mult}+4{} Mult when scored"
                }
            },
            ability_name = "inkedJoker",
            slug = "inked_joker",
            ability = {
                extra = {
                    mult = 4
                }
            },
            rarity = 1,
            cost = 4,
            unlocked = true,
            discovered = true,
            blueprint_compat = true,
            eternal_compat = true
        }

        -- Initialize Joker
        local joker = SMODS.Joker:new(
            inked.ability_name,
            inked.slug,
            inked.ability,
            { x = 0, y = 0 },
            inked.loc,
            inked.rarity,
            inked.cost,
            inked.unlocked,
            inked.discovered,
            inked.blueprint_compat,
            inked.eternal_compat
        )
        joker:register()

        -- Initialize Sprite
        local sprite = SMODS.Sprite:new(
            "j_" .. inked.slug,
            ink_and_color_mod.path,
            "j_" .. inked.slug .. ".png",
            71,
            95,
            "asset_atli"
        )
        sprite:register()

        -- Set local variables
        function SMODS.Jokers.j_inked_joker.loc_def(card)
            return { card.ability.extra.mult }
        end

        function SMODS.Jokers.j_inked_joker.set_badges(card, badges)
            badges[#badges+1] = create_badge("Mod:Ink & Color Suits", G.C.SUITS.Ink)
            return badges
        end

        -- Calculate
        SMODS.Jokers.j_inked_joker.calculate = function(self, context)
            if context.individual and context.cardarea == G.play and context.other_card:is_suit('Ink') then
            -- Add mult if ink suit
                return {
                    message = localize {
                        type = 'variable',
                        key = 'a_mult',
                        vars = { self.ability.extra.mult }
                    },
                    mult = self.ability.extra.mult,
                    card = self,
                }
            end
        end
    end
    if config.artist then
        -- Create Joker
        local art = {
            loc = {
                name = "Artist",
                text = {
                    "Played cards with",
                    "{C:purple,E:1,S:1.1}Color{} suit gives",
                    "{C:mult}+4{} Mult when scored"
                }
            },
            ability_name = "artist",
            slug = "artist",
            ability = {
                extra = {
                    mult = 4
                }
            },
            rarity = 1,
            cost = 4,
            unlocked = true,
            discovered = true,
            blueprint_compat = true,
            eternal_compat = true
        }

        -- Initialize Joker
        local joker = SMODS.Joker:new(
            art.ability_name,
            art.slug,
            art.ability,
            { x = 0, y = 0 },
            art.loc,
            art.rarity,
            art.cost,
            art.unlocked,
            art.discovered,
            art.blueprint_compat,
            art.eternal_compat
        )
        joker:register()

        -- Initialize Sprite
        local sprite = SMODS.Sprite:new(
            "j_" .. art.slug,
            ink_and_color_mod.path,
            "j_" .. art.slug .. ".png",
            71,
            95,
            "asset_atli"
        )
        sprite:register()

        -- Set local variables
        function SMODS.Jokers.j_artist.loc_def(card)
            return { card.ability.extra.mult }
        end

        function SMODS.Jokers.j_artist.set_badges(card, badges)
            badges[#badges+1] = create_badge("Mod:Ink & Color Suits", G.C.SUITS.Ink)
            return badges
        end

        -- Calculate
        SMODS.Jokers.j_artist.calculate = function(self, context)
            if context.individual and context.cardarea == G.play and context.other_card:is_suit('Color') then
            -- Add mult if color suit
                return {
                    message = localize {
                        type = 'variable',
                        key = 'a_mult',
                        vars = { self.ability.extra.mult }
                    },
                    mult = self.ability.extra.mult,
                    card = self
                }
            end
        end
    end
    if config.obsidian then
        -- Create Joker
        local obs = {
            loc = {
                name = "Obsidian",
                text = {
                    "Gains {C:chips}+1{} Chips for every card with an {C:black,E:1,S:1.1}Ink{}",
                    "suit is scored. (Appliys bonus every time a", 
                    "card with {C:black,E:1,S:1.1}Ink{} is suit scored)",
                    "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)",
                    "{C:inactive}Art by {C:green,E:1,S:1.1}Grassy"
                }
            },
            ability_name = "obsidian",
            slug = "obsidian",
            ability = {
                extra = {
                    current_chips = 1,
                    chip_mod = 1,
                    base = 1
                }
            },
            rarity = 2,
            cost = 6,
            unlocked = true,
            discovered = true,
            blueprint_compat = true,
            eternal_compat = true
        }

        -- Initialize Joker
        local joker = SMODS.Joker:new(
            obs.ability_name,
            obs.slug,
            obs.ability,
            { x = 0, y = 0 },
            obs.loc,
            obs.rarity,
            obs.cost,
            obs.unlocked,
            obs.discovered,
            obs.blueprint_compat,
            obs.eternal_compat
        )
        joker:register()

        -- Initialize Sprite
        local sprite = SMODS.Sprite:new(
            "j_" .. obs.slug,
            ink_and_color_mod.path,
            "j_" .. obs.slug .. ".png",
            71,
            95,
            "asset_atli"
        )
        sprite:register()

        -- Set local variables
        function SMODS.Jokers.j_obsidian.loc_def(card)
            return { card.ability.extra.current_chips, card.ability.extra.chip_mod }
        end

        function SMODS.Jokers.j_obsidian.set_badges(card, badges)
            badges[#badges+1] = create_badge("Mod:Ink & Color Suits", G.C.SUITS.Ink)
            return badges
        end

        -- Calculate
        SMODS.Jokers.j_obsidian.calculate = function(self, context)
            if context.individual and context.cardarea == G.play and context.other_card:is_suit('Ink') then
            -- Adds Chips to joker if Ink suit
                self.ability.extra.current_chips = self.ability.extra.current_chips + self.ability.extra.chip_mod
                return {
                    message = localize {
                        type = 'variable',
                        key = 'a_current_chips',
                        vars = { self.ability.extra.current_chips }
                    },
                    chips = self.ability.extra.current_chips,
                    card = self
                }
            end
        end
    end
    if config.bismuth then
        -- Create Joker
        local bis = {
            loc = {
                name = "Bismuth",
                text = {
                    "{C:green}#2# in #1#{} chance to",
                    "convert scored cards into the {C:purple,E:1,S:1.1}Color{} suit.", 
                    "{C:inactive}Art by {C:green,E:1,S:1.1}Grassy"
                }
            },
            ability_name = "bismuth",
            slug = "bismuth",
            ability = {
                extra = {
                    odds = 10,
                }
            },
            rarity = 2,
            cost = 6,
            unlocked = true,
            discovered = true,
            blueprint_compat = true,
            eternal_compat = true
        }

        -- Initialize Joker
        local joker = SMODS.Joker:new(
            bis.ability_name,
            bis.slug,
            bis.ability,
            { x = 0, y = 0 },
            bis.loc,
            bis.rarity,
            bis.cost,
            bis.unlocked,
            bis.discovered,
            bis.blueprint_compat,
            bis.eternal_compat
        )
        joker:register()

        -- Initialize Sprite
        local sprite = SMODS.Sprite:new(
            "j_" .. bis.slug,
            ink_and_color_mod.path,
            "j_" .. bis.slug .. ".png",
            71,
            95,
            "asset_atli"
        )
        sprite:register()

        -- Set local variables
        function SMODS.Jokers.j_bismuth.loc_def(card)
            return { card.ability.extra.odds, '' .. (G.GAME and G.GAME.probabilities.normal or 1)}
        end

        function SMODS.Jokers.j_bismuth.set_badges(card, badges)
            badges[#badges+1] = create_badge("Mod:Ink & Color Suits", G.C.SUITS.Ink)
            return badges
        end

        -- Calculate
        SMODS.Jokers.j_bismuth.calculate = function(self, context)
            if pseudorandom('lucky_money') < G.GAME.probabilities.normal / self.ability.extra.odds then
                if context.cardarea == G.play and not context.repetition and not context.other_card:is_suit('Color') then
                    local original_value = context.other_card.base.value

                    -- Flip the card for a smooth transition
                    context.other_card:flip()

                    -- Remove the current card
                    context.other_card:remove_from_deck()

                    -- Choose a new suit (e.g., 'Hearts')
                    local new_suit = 'Color'

                    -- Add a new card with the same value but the chosen suit
                    context.other_card:change_suit(new_suit)

                    -- Flip the card for a smooth transition
                    context.other_card:flip()

                    -- Notify about the suit change
                    return {
                        message = localize {
                            type = 'variable',
                            key = 'suit_changed',
                            vars = { new_suit }
                        },
                        card = context.other_card
                    }
                end
            end
        end
    end

    --if config.monochromeTv then
      --  SMODS.Jokers.j_monochrome_tv.calculate = function(self, context)
        --    if context.cardarea == G.play and not context.repetition then
          --      if context.other_card:is_suit('Ink') then
            --        return {
              --      card = self
    --            }
      --          else
        --            context.other_card.base.suit = "Ink"
          --      end
            --    return {
              --      card = self
    --            }
      --      end
       -- end
    --end



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

--function Card:is_ink_suit(suit, bypass_debuff, flush_calc)
    --if flush_calc then
        --if self.ability.effect == 'Ink' then
            --return false
        --end
    --else
        --if self.debuff and not bypass_debuff then return end
        --if self.ability.effect == 'Ink' then
            --return false
        --end
    --end
--end

-- Calculate Chips
local evaluate_playref = G.FUNCS.evaluate_play
function G.FUNCS.evaluate_play(self, e)
    evaluate_playref(self, e)

    for i = 1, #G.jokers.cards do
        local effects = eval_card(G.jokers.cards[i], {
            card = G.consumeables,
            after = true,
            mmc_scored_chips = hand_chips * mult
        })
        if effects.jokers then
            card_eval_status_text(G.jokers.cards[i], 'jokers', nil, 0.3, nil, effects.jokers)
        end
    end
end

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

function SMODS.Blind:new(name, slug, loc_txt, dollars, mult, vars, debuff, pos, boss, boss_colour, defeated, atlas)
	o = {}
	setmetatable(o, self)
	self.__index = self

    o.loc_txt = loc_txt
    o.name = name
	o.slug = "bl_" .. slug
	o.dollars = dollars or 5
	o.mult = mult or 2
	o.vars = vars or {}
	o.debuff = debuff or {}
	o.pos = pos or {x = 0, y = 0}
	o.boss = boss or {}
	o.boss_colour = boss_colour or HEX('FFFFFF')
	o.discovered = defeated or false
	o.atlas = atlas or "BlindChips"

	return o
end

function SMODS.Blind:register()
    local minId = table_length(G.P_BLINDS) + 1
    local id = 0
    local i = 0

    i = i + 1
    -- Prepare some Datas
    id = i + minId

    local blind_obj = {
        key = self.slug,
        order = id,
        name = self.name,
        dollars = self.dollars,
        mult = self.mult,
        vars = self.vars,
        debuff = self.debuff,
        pos = self.pos,
        boss = self.boss,
        boss_colour = self.boss_colour,
        discovered = self.discovered,
        atlas = self.atlas
    }
    -- Now we replace the others
    G.P_BLINDS[self.slug] = blind_obj

    -- Setup Localize text
    G.localization.descriptions["Blind"][self.slug] = self.loc_txt

    -- Load it
    for g_k, group in pairs(G.localization) do
        if g_k == 'descriptions' then
          for _, set in pairs(group) do
            for _, center in pairs(set) do
              center.text_parsed = {}
              for _, line in ipairs(center.text) do
                center.text_parsed[#center.text_parsed+1] = loc_parse_string(line)
              end
              center.name_parsed = {}
              for _, line in ipairs(type(center.name) == 'table' and center.name or {center.name}) do
                center.name_parsed[#center.name_parsed+1] = loc_parse_string(line)
              end
              if center.unlock then
                center.unlock_parsed = {}
                for _, line in ipairs(center.unlock) do
                  center.unlock_parsed[#center.unlock_parsed+1] = loc_parse_string(line)
                end
              end
            end
          end
        end
      end

    sendDebugMessage("The Blind named " .. self.name .. " with the slug " .. self.slug .. " have been registered at the id " .. id .. ".")
end

local set_blindref = Blind.set_blind;
function Blind:set_blind(blind, reset, silent)
    if not reset then
        local prev_anim = self.children.animatedSprite
        self.config.blind = blind or {}
        local blind_atlas = 'blind_chips'
        if self.config.blind.config and self.config.blind.config.atlas then
            blind_atlas = self.config.blind.config.atlas
        end
        self.children.animatedSprite = AnimatedSprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ANIMATION_ATLAS[blind_atlas], G.P_BLINDS.bl_small.pos)
        self.children.animatedSprite.states = prev_anim.states
        self.children.animatedSprite.states.visible = prev_anim.states.visible
        self.children.animatedSprite.states.drag.can = prev_anim.states.drag.can
    end
    return set_blindref(self, blind, reset, silent)
end

function create_UIBox_blind_choice(type, run_info)
    if not G.GAME.blind_on_deck then
      G.GAME.blind_on_deck = 'Small'
    end
    if not run_info then G.GAME.round_resets.blind_states[G.GAME.blind_on_deck] = 'Select' end
  
    local disabled = false
    type = type or 'Small'
  
    local blind_choice = {
      config = G.P_BLINDS[G.GAME.round_resets.blind_choices[type]],
    }
    
    local blind_atlas = 'blind_chips'
    if blind_choice.config and blind_choice.config.atlas then
        blind_atlas = blind_choice.config.atlas
    end
    blind_choice.animation = AnimatedSprite(0,0, 1.4, 1.4, G.ANIMATION_ATLAS[blind_atlas],  blind_choice.config.pos)
    blind_choice.animation:define_draw_steps({
      {shader = 'dissolve', shadow_height = 0.05},
      {shader = 'dissolve'}
    })
    local extras = nil
    local stake_sprite = get_stake_sprite(G.GAME.stake or 1, 0.5)
  
    G.GAME.orbital_choices = G.GAME.orbital_choices or {}
    G.GAME.orbital_choices[G.GAME.round_resets.ante] = G.GAME.orbital_choices[G.GAME.round_resets.ante] or {}
  
    if not G.GAME.orbital_choices[G.GAME.round_resets.ante][type] then 
      local _poker_hands = {}
      for k, v in pairs(G.GAME.hands) do
          if v.visible then _poker_hands[#_poker_hands+1] = k end
      end
  
      G.GAME.orbital_choices[G.GAME.round_resets.ante][type] = pseudorandom_element(_poker_hands, pseudoseed('orbital'))
    end
  
  
  
    if type == 'Small' then
      extras = create_UIBox_blind_tag(type, run_info)
    elseif type == 'Big' then
      extras = create_UIBox_blind_tag(type, run_info)
    elseif not run_info then
      local dt1 = DynaText({string = {{string = localize('ph_up_ante_1'), colour = G.C.FILTER}}, colours = {G.C.BLACK}, scale = 0.55, silent = true, pop_delay = 4.5, shadow = true, bump = true, maxw = 3})
      local dt2 = DynaText({string = {{string = localize('ph_up_ante_2'), colour = G.C.WHITE}},colours = {G.C.CHANCE}, scale = 0.35, silent = true, pop_delay = 4.5, shadow = true, maxw = 3})
      local dt3 = DynaText({string = {{string = localize('ph_up_ante_3'), colour = G.C.WHITE}},colours = {G.C.CHANCE}, scale = 0.35, silent = true, pop_delay = 4.5, shadow = true, maxw = 3})
      extras = 
      {n=G.UIT.R, config={align = "cm"}, nodes={
          {n=G.UIT.R, config={align = "cm", padding = 0.07, r = 0.1, colour = {0,0,0,0.12}, minw = 2.9}, nodes={
            {n=G.UIT.R, config={align = "cm"}, nodes={
              {n=G.UIT.O, config={object = dt1}},
            }},
            {n=G.UIT.R, config={align = "cm"}, nodes={
              {n=G.UIT.O, config={object = dt2}},
            }},
            {n=G.UIT.R, config={align = "cm"}, nodes={
              {n=G.UIT.O, config={object = dt3}},
            }},
          }},
        }}
    end
    G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
    local loc_target = localize{type = 'raw_descriptions', key = blind_choice.config.key, set = 'Blind', vars = {localize(G.GAME.current_round.most_played_poker_hand, 'poker_hands')}}
    local loc_name = localize{type = 'name_text', key = blind_choice.config.key, set = 'Blind'}
    local text_table = loc_target
    local blind_col = get_blind_main_colour(type)
    local blind_amt = get_blind_amount(G.GAME.round_resets.blind_ante)*blind_choice.config.mult*G.GAME.starting_params.ante_scaling
  
    local blind_state = G.GAME.round_resets.blind_states[type]
    local _reward = true
    if G.GAME.modifiers.no_blind_reward and G.GAME.modifiers.no_blind_reward[type] then _reward = nil end
    if blind_state == 'Select' then blind_state = 'Current' end
    local run_info_colour = run_info and (blind_state == 'Defeated' and G.C.GREY or blind_state == 'Skipped' and G.C.BLUE or blind_state == 'Upcoming' and G.C.ORANGE or blind_state == 'Current' and G.C.RED or G.C.GOLD)
    local t = 
    {n=G.UIT.R, config={id = type, align = "tm", func = 'blind_choice_handler', minh = not run_info and 10 or nil, ref_table = {deck = nil, run_info = run_info}, r = 0.1, padding = 0.05}, nodes={
      {n=G.UIT.R, config={align = "cm", colour = mix_colours(G.C.BLACK, G.C.L_BLACK, 0.5), r = 0.1, outline = 1, outline_colour = G.C.L_BLACK}, nodes={  
        {n=G.UIT.R, config={align = "cm", padding = 0.2}, nodes={
            not run_info and {n=G.UIT.R, config={id = 'select_blind_button', align = "cm", ref_table = blind_choice.config, colour = disabled and G.C.UI.BACKGROUND_INACTIVE or G.C.ORANGE, minh = 0.6, minw = 2.7, padding = 0.07, r = 0.1, shadow = true, hover = true, one_press = true, button = 'select_blind'}, nodes={
              {n=G.UIT.T, config={ref_table = G.GAME.round_resets.loc_blind_states, ref_value = type, scale = 0.45, colour = disabled and G.C.UI.TEXT_INACTIVE or G.C.UI.TEXT_LIGHT, shadow = not disabled}}
            }} or 
            {n=G.UIT.R, config={id = 'select_blind_button', align = "cm", ref_table = blind_choice.config, colour = run_info_colour, minh = 0.6, minw = 2.7, padding = 0.07, r = 0.1, emboss = 0.08}, nodes={
              {n=G.UIT.T, config={text = localize(blind_state, 'blind_states'), scale = 0.45, colour = G.C.UI.TEXT_LIGHT, shadow = true}}
            }}
          }},
          {n=G.UIT.R, config={id = 'blind_name',align = "cm", padding = 0.07}, nodes={
            {n=G.UIT.R, config={align = "cm", r = 0.1, outline = 1, outline_colour = blind_col, colour = darken(blind_col, 0.3), minw = 2.9, emboss = 0.1, padding = 0.07, line_emboss = 1}, nodes={
              {n=G.UIT.O, config={object = DynaText({string = loc_name, colours = {disabled and G.C.UI.TEXT_INACTIVE or G.C.WHITE}, shadow = not disabled, float = not disabled, y_offset = -4, scale = 0.45, maxw =2.8})}},
            }},
          }},
          {n=G.UIT.R, config={align = "cm", padding = 0.05}, nodes={
            {n=G.UIT.R, config={id = 'blind_desc', align = "cm", padding = 0.05}, nodes={
              {n=G.UIT.R, config={align = "cm"}, nodes={
                {n=G.UIT.R, config={align = "cm", minh = 1.5}, nodes={
                  {n=G.UIT.O, config={object = blind_choice.animation}},
                }},
                text_table[1] and {n=G.UIT.R, config={align = "cm", minh = 0.7, padding = 0.05, minw = 2.9}, nodes={
                  text_table[1] and {n=G.UIT.R, config={align = "cm", maxw = 2.8}, nodes={
                    {n=G.UIT.T, config={id = blind_choice.config.key, ref_table = {val = ''}, ref_value = 'val', scale = 0.32, colour = disabled and G.C.UI.TEXT_INACTIVE or G.C.WHITE, shadow = not disabled, func = 'HUD_blind_debuff_prefix'}},
                    {n=G.UIT.T, config={text = text_table[1] or '-', scale = 0.32, colour = disabled and G.C.UI.TEXT_INACTIVE or G.C.WHITE, shadow = not disabled}}
                  }} or nil,
                  text_table[2] and {n=G.UIT.R, config={align = "cm", maxw = 2.8}, nodes={
                    {n=G.UIT.T, config={text = text_table[2] or '-', scale = 0.32, colour = disabled and G.C.UI.TEXT_INACTIVE or G.C.WHITE, shadow = not disabled}}
                  }} or nil,
                }} or nil,
              }},
              {n=G.UIT.R, config={align = "cm",r = 0.1, padding = 0.05, minw = 3.1, colour = G.C.BLACK, emboss = 0.05}, nodes={
                {n=G.UIT.R, config={align = "cm", maxw = 3}, nodes={
                  {n=G.UIT.T, config={text = localize('ph_blind_score_at_least'), scale = 0.3, colour = disabled and G.C.UI.TEXT_INACTIVE or G.C.WHITE, shadow = not disabled}}
                }},
                {n=G.UIT.R, config={align = "cm", minh = 0.6}, nodes={
                  {n=G.UIT.O, config={w=0.5,h=0.5, colour = G.C.BLUE, object = stake_sprite, hover = true, can_collide = false}},
                  {n=G.UIT.B, config={h=0.1,w=0.1}},
                  {n=G.UIT.T, config={text = number_format(blind_amt), scale = score_number_scale(0.9, blind_amt), colour = disabled and G.C.UI.TEXT_INACTIVE or G.C.RED, shadow =  not disabled}}
                }},
                _reward and {n=G.UIT.R, config={align = "cm"}, nodes={
                  {n=G.UIT.T, config={text = localize('ph_blind_reward'), scale = 0.35, colour = disabled and G.C.UI.TEXT_INACTIVE or G.C.WHITE, shadow = not disabled}},
                  {n=G.UIT.T, config={text = string.rep(localize("$"), blind_choice.config.dollars)..'+', scale = 0.35, colour = disabled and G.C.UI.TEXT_INACTIVE or G.C.MONEY, shadow = not disabled}}
                }} or nil,
              }},
            }},
          }},
        }},
          {n=G.UIT.R, config={id = 'blind_extras', align = "cm"}, nodes={
            extras,
          }}
  
      }}
    return t
end

function create_UIBox_your_collection_blinds(exit)
    local blind_matrix = {
      {},{},{}, {}, {}, {}
    }
    local blind_tab = {}
    for k, v in pairs(G.P_BLINDS) do
      blind_tab[#blind_tab+1] = v
    end
  
    local blinds_per_row = math.ceil(#blind_tab/6)
    sendDebugMessage("Blinds per row:" .. tostring(blinds_per_row))

    table.sort(blind_tab, function (a, b) return a.order < b.order end)
  
    local blinds_to_be_alerted = {}
    for k, v in ipairs(blind_tab) do
      local discovered = v.discovered
      local atlas = 'blind_chips'
      if v.atlas then
        atlas = v.atlas
      end
      local temp_blind = AnimatedSprite(0,0,1.3,1.3, G.ANIMATION_ATLAS[atlas], discovered and v.pos or G.b_undiscovered.pos)
      temp_blind:define_draw_steps({
        {shader = 'dissolve', shadow_height = 0.05},
        {shader = 'dissolve'}
      })
      if k == 1 then 
        G.E_MANAGER:add_event(Event({
          trigger = 'immediate',
          func = (function()
            G.CONTROLLER:snap_to{node = temp_blind}
              return true
          end)
        }))
      end
      temp_blind.float = true
      temp_blind.states.hover.can = true
      temp_blind.states.drag.can = false
      temp_blind.states.collide.can = true
      temp_blind.config = {blind = v, force_focus = true}
      if discovered and not v.alerted then 
        blinds_to_be_alerted[#blinds_to_be_alerted+1] = temp_blind
      end
      temp_blind.hover = function()
        if not G.CONTROLLER.dragging.target or G.CONTROLLER.using_touch then 
            if not temp_blind.hovering and temp_blind.states.visible then
              temp_blind.hovering = true
              temp_blind.hover_tilt = 3
              temp_blind:juice_up(0.05, 0.02)
              play_sound('chips1', math.random()*0.1 + 0.55, 0.12)
              temp_blind.config.h_popup = create_UIBox_blind_popup(v, discovered)
              temp_blind.config.h_popup_config ={align = 'cl', offset = {x=-0.1,y=0},parent = temp_blind}
              Node.hover(temp_blind)
              if temp_blind.children.alert then 
                temp_blind.children.alert:remove()
                temp_blind.children.alert = nil
                temp_blind.config.blind.alerted = true
                G:save_progress()
              end
            end
        end
      temp_blind.stop_hover = function() temp_blind.hovering = false; Node.stop_hover(temp_blind); temp_blind.hover_tilt = 0 end
    end
    local row = math.ceil((k-1)/blinds_per_row+0.001)
    sendDebugMessage("Y:" .. tostring(row) .. " X:" .. tostring(1+((k-1)%6)))
      table.insert(blind_matrix[row], {n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
        ((k - blinds_per_row) % (2 * blinds_per_row) == 1) and {n=G.UIT.B, config={h=0.2,w=0.5}} or nil,
        {n=G.UIT.O, config={object = temp_blind, focus_with_object = true}},
        ((k - blinds_per_row) % (2 * blinds_per_row) == 0) and {n=G.UIT.B, config={h=0.2,w=0.5}} or nil,
      }})
    end
  
    G.E_MANAGER:add_event(Event({
      trigger = 'immediate',
      func = (function()
          for _, v in ipairs(blinds_to_be_alerted) do
            v.children.alert = UIBox{
              definition = create_UIBox_card_alert(), 
              config = { align="tri", offset = {x = 0.1, y = 0.1}, parent = v}
            }
            v.children.alert.states.collide.can = false
          end
          return true
      end)
    }))
  
    local ante_amounts = {}
    for i = 1, math.min(16, math.max(16, G.PROFILES[G.SETTINGS.profile].high_scores.furthest_ante.amt)) do 
      local spacing = 1 - math.min(20, math.max(15, G.PROFILES[G.SETTINGS.profile].high_scores.furthest_ante.amt))*0.06
      if spacing > 0 and i > 1 then 
        ante_amounts[#ante_amounts+1] = {n=G.UIT.R, config={minh = spacing}, nodes={}}
      end
      local blind_chip = Sprite(0,0,0.2,0.2,G.ASSET_ATLAS["ui_"..(G.SETTINGS.colourblind_option and 2 or 1)], {x=0, y=0})
        blind_chip.states.drag.can = false
        ante_amounts[#ante_amounts+1] = {n=G.UIT.R, config={align = "cm", padding = 0.03}, nodes={
          {n=G.UIT.C, config={align = "cm", minw = 0.7}, nodes={
            {n=G.UIT.T, config={text = i, scale = 0.4, colour = G.C.FILTER, shadow = true}},
          }},
          {n=G.UIT.C, config={align = "cr", minw = 2.8}, nodes={
            {n=G.UIT.O, config={object = blind_chip}},
            {n=G.UIT.C, config={align = "cm", minw = 0.03, minh = 0.01}, nodes={}},
            {n=G.UIT.T, config={text =number_format(get_blind_amount(i)), scale = 0.4, colour = i <= G.PROFILES[G.SETTINGS.profile].high_scores.furthest_ante.amt and G.C.RED or G.C.JOKER_GREY, shadow = true}},
          }}
        }}
    end
    
    local extras = nil
    local t = create_UIBox_generic_options({ back_func = exit or 'your_collection', contents = {
      {n=G.UIT.C, config={align = "cm", r = 0.1, colour = G.C.BLACK, padding = 0.1, emboss = 0.05}, nodes={
        {n=G.UIT.C, config={align = "cm", r = 0.1, colour = G.C.L_BLACK, padding = 0.1, force_focus = true, focus_args = {nav = 'tall'}}, nodes={
          {n=G.UIT.R, config={align = "cm", padding = 0.05}, nodes={
            {n=G.UIT.C, config={align = "cm", minw = 0.7}, nodes={
              {n=G.UIT.T, config={text = localize('k_ante_cap'), scale = 0.4, colour = lighten(G.C.FILTER, 0.2), shadow = true}},
            }},
            {n=G.UIT.C, config={align = "cr", minw = 2.8}, nodes={
              {n=G.UIT.T, config={text = localize('k_base_cap'), scale = 0.4, colour = lighten(G.C.RED, 0.2), shadow = true}},
            }}
          }},
          {n=G.UIT.R, config={align = "cm"}, nodes=ante_amounts}
      }},
      {n=G.UIT.C, config={align = "cm"}, nodes={
        {n=G.UIT.R, config={align = "cm"}, nodes={
          {n=G.UIT.R, config={align = "cm"}, nodes=blind_matrix[1]},
          {n=G.UIT.R, config={align = "cm"}, nodes=blind_matrix[2]},
          {n=G.UIT.R, config={align = "cm"}, nodes=blind_matrix[3]},
          {n=G.UIT.R, config={align = "cm"}, nodes=blind_matrix[4]},
          {n=G.UIT.R, config={align = "cm"}, nodes=blind_matrix[5]},
          {n=G.UIT.R, config={align = "cm"}, nodes=blind_matrix[6]},
        }}
      }} 
    }}  
    }})
    return t
end

function create_UIBox_round_scores_row(score, text_colour)
    local label = G.GAME.round_scores[score] and localize('ph_score_'..score) or ''
    local check_high_score = false
    local score_tab = {}
    local label_w, score_w, h = ({hand=true,poker_hand=true})[score] and 3.5 or 2.9, ({hand=true,poker_hand=true})[score] and 3.5 or 1, 0.5
  
    if score == 'furthest_ante' then
      label_w = 1.9
      check_high_score = true
      label = localize('k_ante')
      score_tab = {
        {n=G.UIT.O, config={object = DynaText({string = {number_format(G.GAME.round_resets.ante)}, colours = {text_colour or G.C.FILTER},shadow = true, float = true, scale = 0.45})}},
      }
    end
    if score == 'furthest_round' then 
      label_w = 1.9
      check_high_score = true
      label = localize('k_round')
      score_tab = {
        {n=G.UIT.O, config={object = DynaText({string = {number_format(G.GAME.round)}, colours = {text_colour or G.C.FILTER},shadow = true, float = true, scale = 0.45})}},
      }
    end
    if score == 'seed' then 
      label_w = 1.9
      score_w = 1.9
      label = localize('k_seed')
      score_tab = {
        {n=G.UIT.O, config={object = DynaText({string = {G.GAME.pseudorandom.seed}, colours = {text_colour or G.C.WHITE},shadow = true, float = true, scale = 0.45})}},
      }
    end
    if score == 'defeated_by' then 
      label = localize('k_defeated_by')
      local blind_choice = {config = G.GAME.blind.config.blind or G.P_BLINDS.bl_small}
      local atlas = 'blind_chips'
      if blind_choice.config.atlas then
        atlas = blind_choice.config.atlas
      end
      blind_choice.animation = AnimatedSprite(0,0, 1.4, 1.4, G.ANIMATION_ATLAS[atlas],  blind_choice.config.pos)
      blind_choice.animation:define_draw_steps({
        {shader = 'dissolve', shadow_height = 0.05},
        {shader = 'dissolve'}
      })
      
      score_tab = {
        {n=G.UIT.R, config={align = "cm", minh = 0.6}, nodes={
          {n=G.UIT.O, config={object = DynaText({string = localize{type ='name_text', key = blind_choice.config.key, set = 'Blind'}, colours = {G.C.WHITE},shadow = true, float = true,maxw = 2.2, scale = 0.45})}}
        }},
        {n=G.UIT.R, config={align = "cm", padding = 0.1}, nodes={
          {n=G.UIT.O, config={object = blind_choice.animation}}
        }},
      }
    end
  
    local label_scale = 0.5
  
    if score == 'poker_hand' then 
      local handname, amount = localize('k_none'), 0
      for k, v in pairs(G.GAME.hand_usage) do if v.count > amount then handname = v.order; amount = v.count end end
      score_tab = {
        {n=G.UIT.O, config={object = DynaText({string = {amount <1 and handname or localize(handname,'poker_hands')}, colours = {text_colour or G.C.WHITE},shadow = true, float = true, scale = 0.45, maxw = 2.5})}},
        {n=G.UIT.T, config={text = " ("..amount..")", scale = 0.35, colour = G.C.JOKER_GREY}}
      }
    elseif score == 'hand' then
      check_high_score = true
      local chip_sprite = Sprite(0,0,0.3,0.3,G.ASSET_ATLAS["ui_"..(G.SETTINGS.colourblind_option and 2 or 1)], {x=0, y=0})
      chip_sprite.states.drag.can = false
      score_tab = {
        {n=G.UIT.C, config={align = "cm"}, nodes={
          {n=G.UIT.O, config={w=0.3,h=0.3 , object = chip_sprite}}
        }},
        {n=G.UIT.C, config={align = "cm"}, nodes={
          {n=G.UIT.O, config={object = DynaText({string = {number_format(G.GAME.round_scores[score].amt)}, colours = {text_colour or G.C.RED},shadow = true, float = true, scale = math.min(0.6, score_number_scale(1.2, G.GAME.round_scores[score].amt))})}},
        }},
      }
    elseif G.GAME.round_scores[score] and not score_tab[1] then 
      score_tab = {
        {n=G.UIT.O, config={object = DynaText({string = {number_format(G.GAME.round_scores[score].amt)}, colours = {text_colour or G.C.FILTER},shadow = true, float = true, scale = score_number_scale(0.6, G.GAME.round_scores[score].amt)})}},
      }
    end
    return {n=G.UIT.R, config={align = "cm", padding = 0.05, r = 0.1, colour = darken(G.C.JOKER_GREY, 0.1), emboss = 0.05, func = check_high_score and 'high_score_alert' or nil, id = score}, nodes={
      {n=score=='defeated_by' and G.UIT.R or G.UIT.C, config={align = "cm", padding = 0.02, minw = label_w, maxw = label_w}, nodes={
          {n=G.UIT.T, config={text = label, scale = label_scale, colour = G.C.UI.TEXT_LIGHT, shadow = true}},
      }},
      {n=score=='defeated_by' and G.UIT.R or G.UIT.C, config={align = "cr"}, nodes={
        {n=G.UIT.C, config={align = "cm", minh = h, r = 0.1, minw = score=='defeated_by' and label_w or score_w, colour = (score == 'seed' and G.GAME.seeded) and G.C.RED or G.C.BLACK, emboss = 0.05}, nodes={
          {n=G.UIT.C, config={align = "cm", padding = 0.05, r = 0.1, minw = score_w}, nodes=score_tab},
        }}
      }},
    }}
end

function add_round_eval_row(config)
    local config = config or {}
    local width = G.round_eval.T.w - 0.51
    local num_dollars = config.dollars or 1
    local scale = 0.9

    if config.name ~= 'bottom' then
        if config.name ~= 'blind1' then
            if not G.round_eval.divider_added then 
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',delay = 0.25,
                    func = function() 
                        local spacer = {n=G.UIT.R, config={align = "cm", minw = width}, nodes={
                            {n=G.UIT.O, config={object = DynaText({string = {'......................................'}, colours = {G.C.WHITE},shadow = true, float = true, y_offset = -30, scale = 0.45, spacing = 13.5, font = G.LANGUAGES['en-us'].font, pop_in = 0})}}
                        }}
                        G.round_eval:add_child(spacer,G.round_eval:get_UIE_by_ID(config.bonus and 'bonus_round_eval' or 'base_round_eval'))
                        return true
                    end
                }))
                delay(0.6)
                G.round_eval.divider_added = true
            end
        else
            delay(0.2)
        end

        delay(0.2)

        G.E_MANAGER:add_event(Event({
            trigger = 'before',delay = 0.5,
            func = function()
                --Add the far left text and context first:
                local left_text = {}
                if config.name == 'blind1' then
                    local stake_sprite = get_stake_sprite(G.GAME.stake or 1, 0.5)
                    local atlas = 'blind_chips'
                    if G.GAME.blind.config.blind.atlas then
                        atlas = G.GAME.blind.config.blind.atlas
                    end
                    local blind_sprite = AnimatedSprite(0, 0, 1.2,1.2, G.ANIMATION_ATLAS[atlas], copy_table(G.GAME.blind.pos))
                    blind_sprite:define_draw_steps({
                        {shader = 'dissolve', shadow_height = 0.05},
                        {shader = 'dissolve'}
                    })
                    table.insert(left_text, {n=G.UIT.O, config={w=1.2,h=1.2 , object = blind_sprite, hover = true, can_collide = false}})
  
                    table.insert(left_text,                  
                    config.saved and 
                    {n=G.UIT.C, config={padding = 0.05, align = 'cm'}, nodes={
                        {n=G.UIT.R, config={align = 'cm'}, nodes={
                            {n=G.UIT.O, config={object = DynaText({string = {' '..localize('ph_mr_bones')..' '}, colours = {G.C.FILTER}, shadow = true, pop_in = 0, scale = 0.5*scale, silent = true})}}
                        }}
                    }}
                    or {n=G.UIT.C, config={padding = 0.05, align = 'cm'}, nodes={
                        {n=G.UIT.R, config={align = 'cm'}, nodes={
                            {n=G.UIT.O, config={object = DynaText({string = {' '..localize('ph_score_at_least')..' '}, colours = {G.C.UI.TEXT_LIGHT}, shadow = true, pop_in = 0, scale = 0.4*scale, silent = true})}}
                        }},
                        {n=G.UIT.R, config={align = 'cm', minh = 0.8}, nodes={
                            {n=G.UIT.O, config={w=0.5,h=0.5 , object = stake_sprite, hover = true, can_collide = false}},
                            {n=G.UIT.T, config={text = G.GAME.blind.chip_text, scale = scale_number(G.GAME.blind.chips, scale, 100000), colour = G.C.RED, shadow = true}}
                        }}
                    }}) 
                elseif string.find(config.name, 'tag') then
                    local blind_sprite = Sprite(0, 0, 0.7,0.7, G.ASSET_ATLAS['tags'], copy_table(config.pos))
                    blind_sprite:define_draw_steps({
                        {shader = 'dissolve', shadow_height = 0.05},
                        {shader = 'dissolve'}
                    })
                    blind_sprite:juice_up()
                    table.insert(left_text, {n=G.UIT.O, config={w=0.7,h=0.7 , object = blind_sprite, hover = true, can_collide = false}})
                    table.insert(left_text, {n=G.UIT.O, config={object = DynaText({string = {config.condition}, colours = {G.C.UI.TEXT_LIGHT}, shadow = true, pop_in = 0, scale = 0.4*scale, silent = true})}})                   
                elseif config.name == 'hands' then
                    table.insert(left_text, {n=G.UIT.T, config={text = config.disp or config.dollars, scale = 0.8*scale, colour = G.C.BLUE, shadow = true, juice = true}})
                    table.insert(left_text, {n=G.UIT.O, config={object = DynaText({string = {" "..localize{type = 'variable', key = 'remaining_hand_money', vars = {G.GAME.modifiers.money_per_hand or 1}}}, colours = {G.C.UI.TEXT_LIGHT}, shadow = true, pop_in = 0, scale = 0.4*scale, silent = true})}})
                elseif config.name == 'discards' then
                    table.insert(left_text, {n=G.UIT.T, config={text = config.disp or config.dollars, scale = 0.8*scale, colour = G.C.RED, shadow = true, juice = true}})
                    table.insert(left_text, {n=G.UIT.O, config={object = DynaText({string = {" "..localize{type = 'variable', key = 'remaining_discard_money', vars = {G.GAME.modifiers.money_per_discard or 0}}}, colours = {G.C.UI.TEXT_LIGHT}, shadow = true, pop_in = 0, scale = 0.4*scale, silent = true})}})
                elseif string.find(config.name, 'joker') then
                    table.insert(left_text, {n=G.UIT.O, config={object = DynaText({string = localize{type = 'name_text', set = config.card.config.center.set, key = config.card.config.center.key}, colours = {G.C.FILTER}, shadow = true, pop_in = 0, scale = 0.6*scale, silent = true})}})
                elseif config.name == 'interest' then
                    table.insert(left_text, {n=G.UIT.T, config={text = num_dollars, scale = 0.8*scale, colour = G.C.MONEY, shadow = true, juice = true}})
                    table.insert(left_text,{n=G.UIT.O, config={object = DynaText({string = {" "..localize{type = 'variable', key = 'interest', vars = {G.GAME.interest_amount, 5, G.GAME.interest_amount*G.GAME.interest_cap/5}}}, colours = {G.C.UI.TEXT_LIGHT}, shadow = true, pop_in = 0, scale = 0.4*scale, silent = true})}})
                end
                local full_row = {n=G.UIT.R, config={align = "cm", minw = 5}, nodes={
                    {n=G.UIT.C, config={padding = 0.05, minw = width*0.55, minh = 0.61, align = "cl"}, nodes=left_text},
                    {n=G.UIT.C, config={padding = 0.05,minw = width*0.45, align = "cr"}, nodes={{n=G.UIT.C, config={align = "cm", id = 'dollar_'..config.name},nodes={}}}}
                }}
        
                if config.name == 'blind1' then
                    G.GAME.blind:juice_up()
                end
                G.round_eval:add_child(full_row,G.round_eval:get_UIE_by_ID(config.bonus and 'bonus_round_eval' or 'base_round_eval'))
                play_sound('cancel', config.pitch or 1)
                play_sound('highlight1',( 1.5*config.pitch) or 1, 0.2)
                if config.card then config.card:juice_up(0.7, 0.46) end
                return true
            end
        }))
        local dollar_row = 0
        if num_dollars > 60 then 
            local dollar_string = localize('$')..num_dollars
            G.E_MANAGER:add_event(Event({
                trigger = 'before',delay = 0.38,
                func = function()
                    G.round_eval:add_child(
                            {n=G.UIT.R, config={align = "cm", id = 'dollar_row_'..(dollar_row+1)..'_'..config.name}, nodes={
                                {n=G.UIT.O, config={object = DynaText({string = {localize('$')..num_dollars}, colours = {G.C.MONEY}, shadow = true, pop_in = 0, scale = 0.65, float = true})}}
                            }},
                            G.round_eval:get_UIE_by_ID('dollar_'..config.name))

                    play_sound('coin3', 0.9+0.2*math.random(), 0.7)
                    play_sound('coin6', 1.3, 0.8)
                    return true
                end
            }))
        else
            for i = 1, num_dollars or 1 do
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',delay = 0.18 - ((num_dollars > 20 and 0.13) or (num_dollars > 9 and 0.1) or 0),
                    func = function()
                        if i%30 == 1 then 
                            G.round_eval:add_child(
                                {n=G.UIT.R, config={align = "cm", id = 'dollar_row_'..(dollar_row+1)..'_'..config.name}, nodes={}},
                                G.round_eval:get_UIE_by_ID('dollar_'..config.name))
                                dollar_row = dollar_row+1
                        end

                        local r = {n=G.UIT.T, config={text = localize('$'), colour = G.C.MONEY, scale = ((num_dollars > 20 and 0.28) or (num_dollars > 9 and 0.43) or 0.58), shadow = true, hover = true, can_collide = false, juice = true}}
                        play_sound('coin3', 0.9+0.2*math.random(), 0.7 - (num_dollars > 20 and 0.2 or 0))
                        
                        if config.name == 'blind1' then 
                            G.GAME.current_round.dollars_to_be_earned = G.GAME.current_round.dollars_to_be_earned:sub(2)
                        end

                        G.round_eval:add_child(r,G.round_eval:get_UIE_by_ID('dollar_row_'..(dollar_row)..'_'..config.name))
                        G.VIBRATION = G.VIBRATION + 0.4
                        return true
                    end
                }))
            end
        end
    else
        delay(0.4)
        G.E_MANAGER:add_event(Event({
            trigger = 'before',delay = 0.5,
            func = function()
                UIBox{
                    definition = {n=G.UIT.ROOT, config={align = 'cm', colour = G.C.CLEAR}, nodes={
                        {n=G.UIT.R, config={id = 'cash_out_button', align = "cm", padding = 0.1, minw = 7, r = 0.15, colour = G.C.ORANGE, shadow = true, hover = true, one_press = true, button = 'cash_out', focus_args = {snap_to = true}}, nodes={
                            {n=G.UIT.T, config={text = localize('b_cash_out')..": ", scale = 1, colour = G.C.UI.TEXT_LIGHT, shadow = true}},
                            {n=G.UIT.T, config={text = localize('$')..config.dollars, scale = 1.2*scale, colour = G.C.WHITE, shadow = true, juice = true}}
                    }},}},
                    config = {
                      align = 'tmi',
                      offset ={x=0,y=0.4},
                      major = G.round_eval}
                }

                G.GAME.current_round.dollars = config.dollars
                
                play_sound('coin6', config.pitch or 1)
                G.VIBRATION = G.VIBRATION + 1
                return true
            end
        }))
    end
end

local blind_loadref = Blind.load
function Blind.load(self, blindTable)
    self.config.blind = G.P_BLINDS[blindTable.config_blind] or {}
    if self.config.blind.atlas then
        self.children.animatedSprite.atlas = G.ANIMATION_ATLAS[self.config.blind.atlas]
    end
    blind_loadref(self, blindTable)
 end

----------------------------------------------
------------MOD CODE END---------------------