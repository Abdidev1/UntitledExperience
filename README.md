# stage obby

a roblox obby i've been working on. lava floors, checkpoints, group join prompt, win trophy at the end. nothing crazy but it works well.

open `s.rbxl` in studio and you're good to go. before publishing, fill in your IDs in `src/shared/Config.lua` — group ID, badge ID, that's pretty much it.

scripts live in `src/`. server stuff handles the stage logic, datastore saves, and kill bricks. client side is just the group join button and the win screen. everything's tagged with CollectionService so adding more lava/checkpoints is just tagging parts, no code changes needed.

pull requests are fine, just test it in studio first.
