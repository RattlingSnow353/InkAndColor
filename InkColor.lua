--- STEAMODDED HEADER
--- MOD_NAME: Ink And Color
--- MOD_ID: InkAndColor
--- MOD_AUTHOR: [RattlingSnow353]
--- MOD_DESCRIPTION: This mod is inspired on sixsuits(check them out), Adds two new suits: Ink & Color(Suit art by Grassy), Adds 4 complmentairy jokers, Adds two compenttary blinds, Adds two complmentairy tarot cards, and a Deck for the cards. 
--- BADGE_COLOUR: DF509F
--- DISPLAY_NAME: Ink And Color
--- VERSION: 1.0.0
--- PREFIX: ink

----------------------------------------------
------------MOD CODE -------------------------

function Card:get_suit()
    if self.ability.effect == 'Stone Card' and not self.vampired then
        return -math.random(100, 1000000)
    end
    return self.base.suit
end

local function is_face(card)
    local id = card:get_id()
    return id == 11 or id == 12 or id == 13
end

function shakecard(self)
    G.E_MANAGER:add_event(Event({
        func = function()
            self:juice_up(5, 3)
            return true
        end
    }))
end

local function create_consumable(card_type,tag,message,extra)
    extra=extra or {}
    
    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
    G.E_MANAGER:add_event(Event({
        trigger = 'before',
        delay = 0.0,
        func = (function()
                local card = create_card(card_type,G.consumeables, nil, nil, nil, nil, extra.forced_key or nil, tag)
                card:add_to_deck()
                if extra.edition~=nil then
                    card:set_edition(extra.edition,true,false)
                end
                if extra.eternal~=nil then
                    card.ability.eternal=extra.eternal
                end
                if extra.perishable~=nil then
                    card.ability.perishable = extra.perishable
                    if tag=='v_epilogue' then
                        card.ability.perish_tally=get_voucher('epilogue').config.extra
                    else card.ability.perish_tally = G.GAME.perishable_rounds
                    end
                end
                if extra.extra_ability~=nil then
                    card.ability[extra.extra_ability]=true
                end
                G.consumeables:emplace(card)
                G.GAME.consumeable_buffer = 0
                if message~=nil then
                    card_eval_status_text(card,'extra',nil,nil,nil,{message=message})
                end
        return true
    end)}))
end

local function create_joker(card_type,tag,message,extra)
    extra=extra or {}
    
    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
    G.E_MANAGER:add_event(Event({
        trigger = 'before',
        delay = 0.0,
        func = (function()
                local card = create_card(card_type, G.joker, nil, nil, nil, nil, extra.forced_key or nil, tag)
                card:add_to_deck()
                if extra.edition~=nil then
                    card:set_edition(extra.edition,true,false)
                end
                if extra.eternal~=nil then
                    card.ability.eternal=extra.eternal
                end
                if extra.perishable~=nil then
                    card.ability.perishable = extra.perishable
                    if tag=='v_epilogue' then
                        card.ability.perish_tally=get_voucher('epilogue').config.extra
                    else card.ability.perish_tally = G.GAME.perishable_rounds
                    end
                end
                if extra.extra_ability~=nil then
                    card.ability[extra.extra_ability]=true
                end
                G.jokers:emplace(card)
                G.GAME.joker_buffer = 0
                if message~=nil then
                    card_eval_status_text(card,'extra',nil,nil,nil,{message=message})
                end
        return true
    end)}))
end

local BackApply_to_run_ref = Back.apply_to_run
function Back.apply_to_run(self)
    BackApply_to_run_ref(self)

    if self.effect.config.stained_paletted then
        G.E_MANAGER:add_event(Event({
            func = function()

                for i = #G.playing_cards, 1, -1 do
                    if i <= 13 then
                        G.playing_cards[i]:change_suit("ink_Inks")
                    elseif i >= 14 and i <= 26 then
                        G.playing_cards[i]:change_suit("ink_Colors")
                    elseif i >= 27 and i <= 39 then
                        G.playing_cards[i]:start_dissolve(nil, true)
                    elseif i >= 40 and i <= 52 then
                        G.playing_cards[i]:start_dissolve(nil, true)
                    end
                end

                G.GAME.starting_params.stained_paletted = true
                return true
            end
        }))
    end
end

--- Sprites
SMODS.Atlas { key = 'lc_cards', path = '8BitDeck.png', px = 71, py = 95 }
SMODS.Atlas { key = 'lc_ui', path = 'ui_assets.png', px = 18, py = 18 }
SMODS.Atlas { key = 'Joker', path = 'Jokers.png', px = 71, py = 95 }
SMODS.Atlas { key = 'Consumables', path = 'Consumables.png', px = 71, py = 95 }
SMODS.Atlas { key = 'Decks', path = 'Decks.png', px = 71, py = 95 }
SMODS.Atlas { key = 'Blind', path = 'BlindChips.png', px = 34, py = 34, frames = 21, atlas_table = 'ANIMATION_ATLAS' }
SMODS.Atlas { key = 'modicon', path = 'ModIcon.png', px = 18, py = 18 }

-- Suits
SMODS.Suit {

    key = 'Inks',
    card_key = 'Cink',

    lc_atlas = 'lc_cards',
    lc_ui_atlas = 'lc_ui',

    pos = { y = 0 },
    ui_pos = { x = 0, y = 0 },

    lc_colour = HEX('000000'),

    loc_txt = {
        ['en-us'] = {
            singular = 'Ink',
            plural = 'Inks',
        }
    },
}
SMODS.Suit {

    key = 'Colors',
    card_key = 'Ccolor',

    lc_atlas = 'lc_cards',
    lc_ui_atlas = 'lc_ui',

    pos = { y = 1 },
    ui_pos = { x = 1, y = 0 },

    lc_colour = HEX('000000'),

    loc_txt = {
        ['en-us'] = {
            singular = 'Color',
            plural = 'Colors',
        }
    },
}

-- Blinds
SMODS.Blind {
    key = "the_bleach",
    boss = { min = 1, max = 10 },
    boss_colour = HEX('CCCCCC'),
    debuff = { suit = 'ink_Inks' },
    atlas = 'Blind',
    pos = { x = 0, y = 0 },
    loc_txt = {
        ['en-us'] = {
            name = "The Bleach",
            text = {
                'All Ink cards',
                'are debuffed',
            }
        }
    }
}
SMODS.Blind {
    key = "the_drain",
    boss = { min = 1, max = 10 },
    boss_colour = HEX('A9A9A9'),
    debuff = { suit = 'ink_Colors' },
    atlas = 'Blind',
    pos = { x = 0, y = 1 },
    loc_txt = {
        ['en-us'] = {
            name = "The Drain",
            text = {
                'All Color cards',
                'are debuffed',
            }
        }
    }
}

-- Decks
SMODS.Back {
    key = "stained_palette",
    loc_txt = {
        ['en-us'] = {
            name = "Stained Palette",
            text = {
                'Start the run with only',
                '{C:black,E:1,S:1.1}Ink{} and {C:purple,E:1,S:1.1}Color{} suits.',
            }
        }
    },
    atlas = 'Decks',
    pos = { x = 1, y = 0 },
    config = {stained_paletted = true},
}

-- Consumables
SMODS.Consumable {
    set = 'Tarot',
    key = "the_blob",
    config = { suit_conv = 'ink_Inks', max_highlighted = 3 },
    atlas = 'Consumables',
    pos = { x = 1, y = 0 },
    loc_txt = {
        ['en-us'] = {
            name = "The Blob",
            text = {
                'Converts up to',
                '{C:attention}#1#{} selected cards',
                'to Inks',
            }
        }
    },
    loc_vars = function(self) return {vars = {self.config.max_highlighted}} end,
    use = function(self)
        for i=1, #G.hand.highlighted do
            local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.15, func = function()
                G.hand.highlighted[i]:flip();play_sound('card1', percent);G.hand.highlighted[i]:juice_up(0.3, 0.3);
            return true end })
        end
        delay(0.2)
        for i=1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.1, func = function()
                G.hand.highlighted[i]:change_suit(self.config.suit_conv);
            return true end })
        end
        for i=1, #G.hand.highlighted do
            local percent = 0.85 + ( i - 0.999 ) / ( #G.hand.highlighted - 0.998 ) * 0.3
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.15, func = function()
                G.hand.highlighted[i]:flip(); play_sound('tarot2', percent, 0.6); G.hand.highlighted[i]:juice_up(0.3, 0.3);
            return true end })
        end
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
            G.hand:unhighlight_all();
        return true end })
        delay(0.5)
    end,
}
SMODS.Consumable {
    set = 'Tarot',
    key = "the_paint",
    config = { suit_conv = 'ink_Colors', max_highlighted = 3 },
    atlas = 'Consumables',
    pos = { x = 0, y = 0 },
    loc_txt = {
        ['en-us'] = {
            name = "The Paint",
            text = {
                'Converts up to',
                '{C:attention}#1#{} selected cards',
                'to Colors',
            }
        }
    },
    loc_vars = function(self) return {vars = {self.config.max_highlighted}} end,
    use = function(self)
        for i=1, #G.hand.highlighted do
            local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.15, func = function()
                G.hand.highlighted[i]:flip();play_sound('card1', percent);G.hand.highlighted[i]:juice_up(0.3, 0.3);
            return true end })
        end
        delay(0.2)
        for i=1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.1, func = function()
                G.hand.highlighted[i]:change_suit(self.config.suit_conv);
            return true end })
        end
        for i=1, #G.hand.highlighted do
            local percent = 0.85 + ( i - 0.999 ) / ( #G.hand.highlighted - 0.998 ) * 0.3
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.15, func = function()
                G.hand.highlighted[i]:flip(); play_sound('tarot2', percent, 0.6); G.hand.highlighted[i]:juice_up(0.3, 0.3);
            return true end })
        end
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
            G.hand:unhighlight_all();
        return true end })
        delay(0.5)
    end,
}

-- Jokers
SMODS.Joker {
    key = 'gloomy_joker',
    config = {
        extra = {
            mult = 3,
            suit = "ink_Inks"
        }
    },
    atlas = 'Joker',
    pos = { x = 1, y = 0 },
    loc_txt = {
        ['en-us'] = {
            name = 'Gloomy Joker',
            text = {
                'Played cards with',
                '{C:%s}#2#{} suit give',
                '{C:mult}+#1#{} Mult when scored',
            }
        }
    },
    rarity = 1,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.mult, localize(card.ability.extra.suit, 'suits_singular') }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_suit('ink_Inks') then
            return {
                message = localize {
                    type = 'variable',
                    key = 'a_mult',
                    vars = { card.ability.extra.mult }
                },
                mult = card.ability.extra.mult,
                card = card,
            }
        end
    end
}
SMODS.Joker {
    key = 'cheerful_joker',
    config = {
        extra = {
            mult = 3,
            suit = "ink_Colors"
        }
    },
    atlas = 'Joker',
    pos = { x = 0, y = 0 },
    loc_txt = {
        ['en-us'] = {
            name = 'Cheerful Joker',
            text = {
                'Played cards with',
                '{C:purple}#2#{} suit give',
                '{C:mult}+#1#{} Mult when scored',
            }
        }
    },
    rarity = 1,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.mult, localize(card.ability.extra.suit, 'suits_singular') }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_suit('ink_Colors') then
            return {
                message = localize {
                    type = 'variable',
                    key = 'a_mult',
                    vars = { card.ability.extra.mult }
                },
                mult = card.ability.extra.mult,
                card = card,
            }
        end
    end
}
SMODS.Joker {
    key = 'obsidian',
    config = {
        extra = {
            current_chips = 1,
            chip_mod = 1,
            base = 1
        }
    },
    atlas = 'Joker',
    pos = { x = 3, y = 0 },
    loc_txt = {
        ['en-us'] = {
            name = 'Obsidian',
            text = {
                "Gains {C:chips}+#2#{} Chips for every card with an {C:black,E:1,S:1.1}Ink{}",
                "suit is scored. (Appliys bonus every time a", 
                "card with {C:black,E:1,S:1.1}Ink{} is suit scored)",
                "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)",
                "{C:inactive}Art by {C:green,E:1,S:1.1}Grassy"
            }
        }
    },
    rarity = 2,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.current_chips, card.ability.extra.chip_mod }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_suit('ink_Inks') then
            card.ability.extra.current_chips = card.ability.extra.current_chips + card.ability.extra.chip_mod
            return {
                message = localize {
                    type = 'variable',
                    key = 'a_current_chips',
                    vars = { card.ability.extra.current_chips }
                },
                chips = card.ability.extra.current_chips,
                card = card
            }
        end
    end
}
SMODS.Joker {
    key = 'bismuth',
    config = {
        extra = {
            odds = 10,
        }
    },
    atlas = 'Joker',
    pos = { x = 2, y = 0 },
    loc_txt = {
        ['en-us'] = {
            name = 'Bismuth',
            text = {
                "{C:green}#2# in #1#{} chance to",
                "convert scored cards into the {C:purple,E:1,S:1.1}Color{} suit.", 
                "{C:inactive}Art by {C:green,E:1,S:1.1}Grassy"
            }
        }
    },
    rarity = 2,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.odds, '' .. (G.GAME and G.GAME.probabilities.normal or 1) }
        }
    end,
    calculate = function(self, card, context)
        if pseudorandom('lucky_money') < G.GAME.probabilities.normal / card.ability.extra.odds then
            if context.cardarea == G.play and not context.repetition and not context.other_card:is_suit('ink_Colors') then
                context.other_card:flip()
                context.other_card:remove_from_deck()

                local new_suit = 'ink_Colors'

                context.other_card:change_suit(new_suit)
                context.other_card:flip()

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
}
SMODS.Joker {
    key = 'elder_berry',
    config = {
        extra = {
            odds = 2,
        }
    },
    atlas = 'Joker',
    pos = { x = 5, y = 0 },
    loc_txt = {
        ['en-us'] = {
            name = 'Elder Berry',
            text = {
                "{C:green}#2# in #1#{} chance to",
                "{C:attention}retrigger{} all scored",
                "{C:black,E:1,S:1.1}Ink{} cards",
            }
        }
    },
    rarity = 2,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.odds, '' .. (G.GAME and G.GAME.probabilities.normal or 1) }
        }
    end,
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and context.other_card:is_suit('ink_Inks') then
            if pseudorandom('lucky_money') < G.GAME.probabilities.normal / card.ability.extra.odds then
                return
            end
            return {
                message = localize('k_again_ex'),
                repetitions = 1,
                card = card
            }
        end
    end
}
SMODS.Joker {
    key = 'snow_berry',
    config = {
        extra = {
            odds = 4, money = 1
        }
    },
    atlas = 'Joker',
    pos = { x = 4, y = 0 },
    loc_txt = {
        ['en-us'] = {
            name = 'Snow Berry',
            text = {
                "{C:green}#2# in #1#{} chance to lose {C:money}$#3#{},",
                "{C:attention}retriggers{} all scored",
                "{C:purple,E:1,S:1.1}Color{} cards",
            }
        }
    },
    rarity = 2,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.odds, '' .. (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.money }
        }
    end,
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and context.other_card:is_suit('ink_Colors') then
            if pseudorandom('lucky_money') < G.GAME.probabilities.normal / card.ability.extra.odds then
                ease_dollars(card.ability.extra.money*-1)
            end
            return {
                message = localize('k_again_ex'),
                repetitions = 1,
                money = -1,
                card = card
            }
        end
    end
}
SMODS.Joker {
    key = 'the_ink_machine',
    config = {
        extra = {},
    },
    atlas = 'Joker',
    pos = { x = 6, y = 0 },
    loc_txt = {
        ['en-us'] = {
            name = 'The Ink Machine',
            text = {
                "If played hand contains at least one", 
                "scoring card with Ink suit, convert",
                "all cards in played hand to Ink suit",
            }
        }
    },
    rarity = 2,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    calculate = function(self, card, context)
        local basaltbeta = 0
        if context.cardarea == G.play and not context.repetition and context.individual then
            if not context.other_card:is_suit('ink_Inks') then
                for k, v in ipairs(context.full_hand) do 
                    if v:get_suit() == 'ink_Inks' then 
                        basaltbeta = 1
                    end
                end
                if basaltbeta == 1 then
                    for k, v in ipairs(context.full_hand) do 
                        v:flip()
                        v:remove_from_deck()
                        v:change_suit('ink_Inks')
                        v:flip()
                    end 
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
}

----------------------------------------------
------------MOD CODE END---------------------