# UntitledExperience

a roblox guess the game i've been working on.checkpoints, group join prompt, win trophy at the end. nothing crazy but it works well.

open `UntitledExperience.rbxl` in studio and you're good to go. before publishing, fill in your IDs in `src/shared/Config.lua` — group ID, badge ID, that's pretty much it.

scripts live in `src/`. server stuff handles the stage logic, datastore saves, and kill bricks. client side is just the group join button and the win screen. everything's tagged with CollectionService so adding more lava/checkpoints is just tagging parts, no code changes needed.

pull requests are fine, just test it in studio first.
DEMO VIDEO LINK : https://youtu.be/gz5vW-QIe2k?si=JS4CMIVcmIEKO1FA
