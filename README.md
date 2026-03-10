# Zombie Piglins Don't Drop Swords
A tiny datapack for Minecraft that prevents zombified piglins from dropping their held weapons on death.

This fork exists specifically to restore the pack's functionality on Minecraft Java Edition 1.21.11. It is not trying to redesign the original project, but more compatibility updates may come later if they are needed.

Original project:
- https://github.com/Glowing0v3rlord/Zombie-Piglins-Dont-Drop-Swords

## What changed in this fork
The original 1.18.2 logic was still conceptually correct, but the datapack needed a technical port for modern versions:
- datapack paths changed from plural directories like `functions` and `tags/functions` to singular `function` and `tags/function`
- entity equipment data changed in 1.21.5, so `HandDropChances` became `drop_chances.mainhand`
- negative drop-chance values are no longer accepted, so `0.0f` is now the correct "never drop" value
- modern `pack.mcmeta` files use `min_format` and `max_format`

This pack still targets vanilla zombified piglin equipment data, which means it also blocks other vanilla-style main-hand drops that piglins may roll in modpacks, such as spears that reuse the same equipment-drop path.

## Installation
Copy the datapack folder into your world's `datapacks` directory so that `pack.mcmeta` and `data` sit directly inside that folder.

After copying it in, run:

```mcfunction
/reload
```

## Debugging
Use:

```mcfunction
/datapack list enabled
/function zpdds:debug_nearest
```

`/datapack list available` only shows disabled datapacks, so it can be empty even when this pack is loaded.

The debug function prints the nearest loaded `minecraft:zombified_piglin` entity's main-hand item id and `drop_chances.mainhand` multiplied by 1000.

Expected result for a working pack:
- mainhand item is usually `minecraft:golden_sword`
- `drop_chances.mainhand x1000 = 0`

If a weapon still drops while the value is `0`, another mod, datapack, or loot hook is adding a separate drop after vanilla equipment-drop logic.
