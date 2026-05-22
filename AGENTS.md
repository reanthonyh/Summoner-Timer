# AGENTS.md – Quick reference for OpenCode

**Project type**: Flutter mobile app (clean‑architecture layout).

---

## Core commands (do not assume defaults)
- **Get dependencies**: `flutter pub get`
- **Run code generation** (freezed, json_serializable, etc.):
  ```bash
  dart run build_runner build --delete-conflicting-outputs
  ```
- **Launch app**: `flutter run`
- **Static analysis**: `flutter analyze` (or `dart analyze`)
- **Run tests**: `flutter test` – *currently no test files, add them under `test/`*.
- **Format code**: `dart format .` respects `analysis_options.yaml` (page width 90, trailing commas automated).

---

## Architecture snapshot
- **Entry point**: `lib/presentation/root.dart` → `RootApp` (MaterialApp with routes).
- **Feature modules** live under `lib/presentation/<feature>/` with sub‑folders:
  - `bloc/` – BLoC/Cubit state management.
  - `pages/` – Screen widgets (e.g., `game_page.dart`).
  - `widgets/` – Feature‑specific UI components.
- **Layers** (clean‑architecture):
  - `core/` – constants, DI, utils, networking.
  - `data/` – datasources, models, repositories.
  - `domain/` – entities, repository contracts, use‑cases.
  - `presentation/` – UI & BLoC.

---

## Feature‑specific notes (Game page)
- `GamePage` (`lib/presentation/features/game/page/game_page.dart`) provides a `BlocProvider` for `GameBloc` and shows `_GameView`.
- `_GameContent` builds the enemy/ally lists; see `widgets.dart` for the widget tree.
- **Responsive handling**: orientation is read via `MediaQuery.of(context).orientation`. Landscape layout uses a side‑by‑side `Row` of two `SingleChildScrollView`s; portrait falls back to a single `ListView`.
- Enemy participants are reorderable (`ReorderableListView.builder`).
- Ally participants are static rows.
- Spell timers are interactive (`InkWell` with tap/long‑press events sending `GameEvent.startSpellTimer` / `prepareSpellTimer`).

---

## Dependency quirks
- **Freezed**: requires generated `*.freezed.dart` files – always run the build_runner command after adding/modifying freezed classes.
- **JSON serialization**: same build runner step produces `*.g.dart` files.
- **Wakelock**: enabled in `_GameContentState.initState`, disabled on dispose – ensure the device does not sleep during a game.

---

## Lint / formatting conventions
- `analysis_options.yaml` sets:
  - `page_width: 90`
  - `trailing_commas: automate`
  - `prefer_const_constructors: true`
  - `prefer_single_quotes: true`
  - `use_key_in_widget_constructors: true`
- `avoid_print` is disabled (printing is allowed).

---

## CI / Git workflow (implicit)
- No CI files are present; typical workflow is:
  1. `flutter pub get`
  2. `dart run build_runner build`
  3. `flutter analyze`
  4. `flutter test` (if tests added)
  5. `flutter run` for manual verification.

---

*This file is deliberately minimal – it contains only the facts an agent would otherwise miss without guidance.*