# 🤝 Contributing

Thanks for your interest in contributing! Here's how to get involved.

---

## Reporting Bugs

Open a [GitHub Issue](../../issues/new) and include:
- What you expected to happen
- What actually happened
- Steps to reproduce
- Any relevant Output / console errors

---

## Suggesting Features

Open an Issue with the `enhancement` label and describe:
- The feature you'd like
- Why it would improve the game
- Any implementation ideas you have

---

## Submitting Code

1. **Fork** this repository.
2. **Clone** your fork locally.
3. Create a **feature branch**:
   ```bash
   git checkout -b feature/my-cool-feature
   ```
4. Make your changes. Follow the style guidelines below.
5. **Test** your changes in Roblox Studio (F5 playtesting).
6. **Commit** with a clear message:
   ```bash
   git commit -m "feat: add double-jump powerup"
   ```
7. **Push** and open a Pull Request against `main`.

---

## Code Style

- Use `local` variables wherever possible.
- Wrap all DataStore / external service calls in `pcall`.
- Print debug info with a `[ModuleName]` prefix, e.g. `print("[StageManager] Player reached stage 2")`.
- Use `task.wait()` instead of `wait()` (deprecated).
- Add a brief comment above any non-obvious logic.

---

## Commit Message Convention

We loosely follow [Conventional Commits](https://www.conventionalcommits.org/):

| Prefix | Use for |
|---|---|
| `feat:` | New feature |
| `fix:` | Bug fix |
| `docs:` | Documentation only |
| `refactor:` | Code change that isn't a fix or feature |
| `chore:` | Maintenance tasks |
