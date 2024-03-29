--- STEAMODDED HEADER
--- MOD_NAME: Feder API - Custom Deck Texture
--- MOD_ID: FederAPI_CustomDeckTexture
--- MOD_AUTHOR: [itayfeder]
--- MOD_DESCRIPTION: Part of the Feder API. Add the ability to add custom textures for deck backs.

----------------------------------------------
------------MOD CODE -------------------------

local back_initref = Back.init;
function Back:init(selected_back)
	back_initref(self, selected_back)
    if selected_back then
        self.atlas = "centers"
        if selected_back.config.atlas then
            self.atlas = selected_back.config.atlas
        end
    end
end

local back_changetoref = Back.change_to;
function Back:change_to(new_back)
	back_changetoref(self, new_back)
    if new_back then
        self.atlas = "centers"
        if new_back.config.atlas then
            self.atlas = new_back.config.atlas
        end
    end
end

local change_viewed_backref = G.FUNCS.change_viewed_back
G.FUNCS.change_viewed_back = function(args)
	change_viewed_backref(args)
	
	for key, val in pairs(G.sticker_card.area.cards) do
		val.children.back = false
		val:set_ability(val.config.center, true)
	  end
end

local set_spritesref = Card.set_sprites;
function Card:set_sprites(_center, _front)
	if _center then 
		if not self.children.back then
            local atlas_id = "centers"

			if G.GAME.selected_back then
                if G.GAME.selected_back.atlas then
                    atlas_id = G.GAME.selected_back.atlas
                end
            end

            if G.GAME.viewed_back and G.GAME.viewed_back ~= G.GAME.selected_back then
                if G.GAME.viewed_back.atlas then
                    atlas_id = G.GAME.viewed_back.atlas
                end
                
            end
			
            self.children.back = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ASSET_ATLAS[atlas_id], self.params.bypass_back or (self.playing_card and G.GAME[self.back].pos or G.P_CENTERS['b_red'].pos))
            atlas_id = "centers"
            self.children.back.states.hover = self.states.hover
            self.children.back.states.click = self.states.click
            self.children.back.states.drag = self.states.drag
            self.children.back.states.collide.can = false
            self.children.back:set_role({major = self, role_type = 'Glued', draw_major = self})
        end
	end

	set_spritesref(self, _center, _front);
end

----------------------------------------------
------------MOD CODE END----------------------

