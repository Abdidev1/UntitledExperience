# 🏆 UntitledExperience

> A classic Roblox obstacle course with progressive stages, lava hazards, checkpoints, a group-join system, and a winner's trophy.

---

## 📋 Table of Contents

- [About](#about)
- [Features](#features)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
- [Scripts Overview](#scripts-overview)
- [Contributing](#contributing)
- [License](#license)

---

## About

This is a Roblox obby (obstacle course) game built in Roblox Studio. Players navigate through multiple stages, avoid lava, reach checkpoints, and ultimately claim the **You Win! Trophy** at the end.

The game features:
- A group-join reward system
- Lava kill/respawn logic
- Stage-based progression with checkpoint saving
- A custom UI with group join prompts

---

## ✨ Features

| Feature | Description |
|---|---|
| 🌋 Lava Hazards | Touch lava → instant death & respawn at last checkpoint |
| 🏁 Stage Checkpoints | Progress is saved per-stage so players don't restart from scratch |
| 🏆 Winner's Trophy | End-of-game reward object with win detection |
| 👥 Group Join System | Prompts players to join the Roblox group via in-game UI |
| 💾 DataStore | Persistent player progress saved between sessions |
| 🎨 Atmosphere & Lighting | Bloom, Sun Rays, and Depth of Field for visual polish |
| 🔊 Sound | SoundService integration for ambient and event sounds |

---

## 📁 Project Structure

```
roblox-obby-repo/
├── s.rbxl                          # Roblox Studio place file (open in Studio)
├── src/
│   ├── server/
│   │   ├── StageManager.server.lua     # Handles stage logic and checkpoints
│   │   ├── DataStore.server.lua        # Saves/loads player progress
│   │   └── KillBrick.server.lua        # Lava kill & respawn handler
│   ├── client/
│   │   ├── GroupJoinUI.client.lua      # Group join button prompt
│   │   └── WinScreen.client.lua        # Win screen / trophy UI
│   └── shared/
│       └── Config.lua                  # Shared game configuration (IDs, settings)
├── assets/
│   └── thumbnails/                     # Game screenshots / thumbnails
├── docs/
│   ├── SETUP.md                        # Studio setup guide
│   └── GAMEPLAY.md                     # Gameplay mechanics documentation
├── .github/
│   └── workflows/
│       └── lint.yml                    # Luau lint check via Roblox LSP
├── .gitignore
├── CONTRIBUTING.md
└── README.md
```

---

## 🚀 Getting Started

### Prerequisites

- [Roblox Studio](https://www.roblox.com/create) (free)
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/YOUR_USERNAME/roblox-obby.git
   cd roblox-obby
   ```

2. **Open the place file in Roblox Studio**
   ```
   File → Open from File → select s.rbxl
   ```

3. **Configure your IDs** in `src/shared/Config.lua`:
   ```lua
   Config.GROUP_ID      = 0        -- Your Roblox Group ID
   Config.BADGE_ID      = 0        -- Win badge ID (0 = disabled)
   Config.DATASTORE_KEY = "PlayerProgress_v1"
   ```

4. **Publish to Roblox** via `File → Publish to Roblox`

---

## 🧩 Scripts Overview

### `StageManager.server.lua`
Tracks which stage each player is on. Fires remote events when a player reaches a new stage part and saves the checkpoint. Also handles the "You Win!" trophy touch.

### `DataStore.server.lua`
Loads player stage progress on join and saves it on leave. Uses `pcall` for safe DataStore calls.

### `KillBrick.server.lua`
Runs on all parts tagged as `Lava`. On touch, sets the touching character's health to 0, triggering a respawn at their last saved checkpoint.

### `GroupJoinUI.client.lua`
Detects if the local player is not in the group and shows a `TextButton` prompt. On click, triggers the official Roblox group join dialog via `GroupService`.

### `WinScreen.client.lua`
Listens for the `PlayerWon` remote event and displays a win screen with the trophy animation.

### `Config.lua` (Shared)
Single source of truth for all configurable values — group ID, badge ID, DataStore keys, stage count, respawn time, etc.

---

## 🤝 Contributing

Contributions, bug reports, and suggestions are welcome! See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

1. Fork the repo
2. Create a feature branch: `git checkout -b feature/my-feature`
3. Commit your changes: `git commit -m "Add my feature"`
4. Push to the branch: `git push origin feature/my-feature`
5. Open a Pull Request

---

## 📄 License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.
