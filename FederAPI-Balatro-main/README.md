
# FederAPI-Balatro

An API mod for most of Feder's Balatro mods

This mod adds a ton of useful features to the Balatro modloader, which allow users to more easily add a variaty of elements to the game.

The mod is seperated into separate files, with each adding new functionality to the API.

### Custom Blinds
You can now create custom blinds!

You can add a new blind using `<your_blind> = SMODS.Blind:new()`, and register it using `<your_blind>:register()`.

Blinds can also have customized sprites. The sprites can be specified in the blind definition.

### Custom Vouchers
You can now create custom vouchers!

You can add a new voucher using `<your_voucher> = SMODS.Voucher:new()`, and register it using `<your_voucher>:register()`.

Vouchers can also have customized sprites. The sprite's name should follow this format: `v_<voucher_id>`.

### Custom Tarots
You can now create custom Tarots!

You can add a new tarot using `<your_tarot> = SMODS.Tarot:new()`, and register it using `<your_tarot>:register()`.

Vouchers can also have customized sprites. The sprite's name should follow this format: `v_<voucher_id>`.

### Custom Sound Player
You can now register and play custom sounds!

To register your own sound, use the `register_sound` method. To play the sound you registered, use the `modded_play_sound` function.

### Custom Deck Textures
You are give your decks custom back textures!

To change your back's atlas, add an 'atlas' field to your config in the deck's registration. The field's value should be your atlas' name.

### Joker Attribute Fixer
Jokers can now store more values.

This patch fixes the following variables:
- blueprint_compat
- eternal_compat
- effect
  
To add their patch, set these values in the joker's config.

