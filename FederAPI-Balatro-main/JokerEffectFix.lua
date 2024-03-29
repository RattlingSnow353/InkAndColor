--- STEAMODDED HEADER
--- MOD_NAME: Feder API - Joker Effect Fix
--- MOD_ID: FederAPI_JokerEffectFix
--- MOD_AUTHOR: [itayfeder]
--- MOD_DESCRIPTION: Part of the Feder API. Fixes joker's effect not being set.

----------------------------------------------
------------MOD CODE -------------------------

local inject_jokersref = SMODS.injectJokers
function SMODS:injectJokers()
	inject_jokersref(self)
	for k, joker in pairs(SMODS.Jokers) do
        if joker.config.effect then
            G.P_CENTERS[joker.slug].effect = joker.config.effect
        end
        if joker.config.blueprint_compat then
            G.P_CENTERS[joker.slug].blueprint_compat = joker.config.blueprint_compat
        end
        if joker.config.eternal_compat then
            G.P_CENTERS[joker.slug].eternal_compat = joker.config.eternal_compat
        end
        if joker.config.unlock_condition then
            G.P_CENTERS[joker.slug].unlock_condition = joker.config.unlock_condition
        end
    end
end

----------------------------------------------
------------MOD CODE END----------------------
