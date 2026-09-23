# UIverse — Working Agreement

A QML **UI Style Lab**: one design system contract, many design languages
implemented against it, each shown through a real mini-app rather than a row of
sample buttons.

This file is the durable contract. It travels with the repo, so it holds across
sessions and machines. Read it before writing code here.

---

## 1. Product direction (decided)

**Hybrid**, not a pure gallery and not a single re-skinnable app:

| Layer | What it is |
|---|---|
| Gallery shell | Entry point. One card per design language. |
| Per-style mini-app | Each style gets a real app that suits it (glassmorphism → music player, neo-brutalism → task board, bento → analytics dashboard, editorial → article reader, …). |
| Reference App | One fixed small dashboard implemented in **every** style, with a live switcher. This is where styles can be compared honestly. |
| Rules panel | Per-style teaching content, in a drawer — never the main surface. |

Reason for the hybrid: these are **design languages, not themes**. They differ in
layout, density and hierarchy, not only in colour and radius. Forcing all of them
into one fixed screen would flatten them into skins. The Reference App is the
deliberate exception, and is understood to be a distilled comparison.

**Phase 1 styles:** Minimalism, Neo-Brutalism, Glassmorphism, Bento UI.
Chosen so the architecture is proven against a baseline, a maximal-contrast
style, a rendering-heavy style, and a layout-driven style before scaling out.

**Backlog:** maximalism, neumorphism, claymorphism, skeuomorphism, flat design,
material design, Y2K, retro, cyberpunk, editorial, brutalism (classic).

---

## 2. Hard rules

These are not preferences. Code that breaks them gets fixed, not merged.

### Repository
1. **No AI attribution anywhere.** No `Co-Authored-By` trailers, no generated-with
   footers, no mention of AI in commits, PRs, code or docs.
2. **Commit titles are short summaries.** Imperative mood, capitalised, no
   trailing period, aim for 50 characters, hard limit 60. No body unless it
   genuinely adds something. Example: `Add bento style pack`.
3. **One commit = one meaningful unit.** One style, one component, one fix.
   Never `update files`.
4. **Code, comments, commits and docs are English.** Conversation is Persian.

### Code
5. **No comments.** At most a single line, only where the code genuinely cannot
   explain itself. Explanatory prose belongs in declarative data (see the
   `StylePack` teaching fields) or in this file — not scattered through QML.
6. **No file over ~150 lines.** Hard ceiling 800. If a style pack grows, split it
   into one file per slot.
7. **No hardcoded colours or magic numbers outside `Tokens`.** A literal `#ff0000`
   or `radius: 12` in the Kit, the shell or an app is a bug. Colours always come
   from a `Tokens` block. Inside a style pack, slot files may carry that style's
   own local geometry (a knob size, a focus-ring offset) — values no other style
   would ever need to answer for. Anything shared across styles is a token.
8. **The Kit never paints.** Every pixel comes from the active pack through a
   `StyleSlot`. A Kit component that sets its own colour has broken the
   abstraction. The only exception is a neutral fallback shown when a pack leaves
   a slot empty.
9. **UI imports `QtQuick.Templates`, never `QtQuick.Controls`.** Otherwise Qt's
   default style leaks into the design.
10. **No style imports another style.** Duplicating five lines beats coupling two
    design languages.

---

## 3. Architecture

One-way dependency, no cycles:

```
UIverse.Core  ←  UIverse.Kit
      ↑                ↑
      └── UIverse.Styles.<Name>  ←  UIverse.Styles (registry)  ←  UIverse (app)
```

### Core — the contract
- `Tokens.qml` — the complete design vocabulary. Colour roles, geometry,
  typography, surface treatment, motion, **and layout personality**. Styles fill
  it in; they never invent tokens locally. A token a style needs belongs in this
  file so every other style has to answer for it too.
- `StylePack.qml` — identity, teaching content, tokens, and one `Component` per
  render slot.
- `StyleSlot.qml` — a `Loader` that mounts a pack's component and passes the
  control down as `ctl`, plus `variant` and `spec`.
- `SlotRect.qml` / `SlotText.qml` — bases that expose `ctl`, `variant`, `spec`,
  `t` (tokens) and the interaction flags, so slot files stay a few lines long.
- `Style.qml` — singleton holding the active pack. Swapping `Style.pack`
  re-renders the running app, because every slot is bound to it.
- `BackdropSample.qml` — per-surface blurred sample of the page backdrop, for
  real glassmorphism rather than a painted approximation.

### Why not `QQuickStyle::setStyle()`
Qt's custom-style mechanism must be configured before the first QML that imports
Qt Quick Controls is loaded, and cannot be switched at runtime. Live switching is
a core requirement here, so the pack/slot layer replaces it.

### Slot authoring convention
A pack `Component` carries the scope of the file it was written in, so the
control it styles is not visible by name. `SlotRect` / `SlotText` reach it via
`parent as StyleSlot` and expose typed flags (`isDown`, `isPressed`,
`isHovered`, `isFocused`, `hasActiveFocus`, `isChecked`, `isEnabled`,
`position`). Slot files read those flags, never `ctl` directly, and qualify
every reference from a child element with the root `id`.

---

## 4. UX laws layer (agreed)

The twenty classic UX laws sit **beneath** style and are invariant across it. A
style may change everything about how something looks; it may not break how it
works. Three layers:

**Layer 1 — enforced by the Kit.** Packs cannot opt out.
- *Fitts's law* → `minTargetSize` token; the Kit floors every interactive hit
  area at it, however small a pack draws the control.
- *Doherty threshold* → animation durations clamped below 400 ms.
- *Law of proximity* → all spacing derives from `unit`.

**Layer 2 — data.** A laws module carries the twenty laws; each pack declares
which laws it is **in tension** with. That tension is the teaching content:

| Style | Tension |
|---|---|
| Glassmorphism | Prägnanz, WCAG contrast |
| Neo-Brutalism | Jakob's law — deliberately defies expectation |
| Minimalism | Von Restorff, discoverability |
| Bento UI | Serial position — every tile reads as equally important |
| Maximalism | Hick's law, Miller's law |
| Skeuomorphism | Occam's razor, but reinforces Jakob's law |

**Layer 3 — live contrast audit.** WCAG contrast ratios computed from each pack's
tokens and shown pass/fail, so the project critiques itself.

Note on the source list: items 16 and 17 were both "Postel's law" (duplicate),
12 is *Prägnanz*, and 14 is *Law of Uniform Connectedness*.

---

## 5. Layout

```
core/                  UIverse.Core        contract, slots, singleton
kit/                   UIverse.Kit         Uv* controls — behaviour only
styles/<name>/         UIverse.Styles.<Name>   one module per design language
styles/registry/       UIverse.Styles      list of packs, active selection
apps/                  reference dashboard and the per-style mini-apps
shell/                 gallery, workbench, rules panel, style picker
```

Naming: Kit components are `Uv*`. A style module's entry type is `<Name>Pack`.
Slot files use plain names (`Surface`, `ButtonBackground`) and are reached
through qualified imports, so names never collide across styles.

---

## 6. Build

Qt 6.11.1, MinGW 64-bit locally; MSVC, GCC and Clang in CI. CMake + Ninja.

```
cmake -S . -B build -G Ninja -DCMAKE_PREFIX_PATH=C:/Qt/6.11.1/mingw_64
cmake --build build
scripts/check-format.sh [--fix]   # QMLFORMAT=<path> if not on PATH
scripts/lint.sh build             # fails on any qmllint finding
scripts/snapshots.sh build        # PNG per style into snapshots/
cmake --install build --prefix "$PWD/dist"   # absolute prefix required by Qt deploy
```

Formatting is `qmlformat` with `.qmlformat.ini`; it is not a matter of taste.

### Hooks (mandatory)

```
pip install pre-commit
pre-commit install          # installs pre-commit and commit-msg hooks
pre-commit run --all-files
```

- `qmlformat` — formats staged QML; finds Qt via `QMLFORMAT`, `PATH`,
  `QT_ROOT_DIR` or `C:/Qt`.
- `architecture` — `scripts/check-architecture.sh`: rules 5, 6 (800-line
  ceiling), 7 (hex colours in `kit/`, `apps/`, `shell/` outside `ShellTheme`),
  9 and 10.
- `commit-message` — `scripts/check-commit-msg.sh`: rules 1 and 2.

CI runs the same hooks and checks every pushed commit message, so skipping them
locally only moves the failure to CI.

### Releasing

Bump `project(... VERSION x.y.z)` in `CMakeLists.txt`, commit, wait for green
CI on `main`, then:

```
git tag vX.Y.Z
git push origin vX.Y.Z
```

`release.yml` builds and publishes the Windows zip, macOS dmg, Linux tar.gz
and WASM zip to the GitHub release. CI packages on every push, so a tag only
repeats a path that is already green.

---

## 7. Current state

Phase 1 is complete and verified visually. Builds green on Qt 6.11.1 / MinGW /
Ninja; the app runs with no QML warnings; `qmllint` and `qmlformat` are clean.

- Core contract, Kit (10 controls), shell (gallery, workbench, style picker,
  rules drawer with keyboard: ←/→ switch style, R rules, Esc back).
- Reference dashboard in `apps/reference/`, laid out per `layoutMode`
  (`stack`, `bento`, and a two-column compact fallback).
- Packs: Minimalism, Neo-Brutalism, Glassmorphism (real backdrop blur),
  Bento UI.
- `uiverse-snapshot` renders any pack to PNG without showing a window.
- Fonts are bundled in `UIverse.Fonts` (OFL: Inter, Archivo Black, Space
  Grotesk, JetBrains Mono), so every platform and the web render identically.
  Packs name fonts only through `Fonts.*`, never by family string. Licence
  texts in `fonts/` are kept verbatim and excluded from whitespace hooks.
- README screenshots in `docs/images/` come from `scripts/docs-images.sh`;
  re-run it whenever a pack changes visibly.

The shell keeps its own `ShellTheme` tokens, so the lab chrome does not change
while browsing styles.

Dashboard areas pass a neutral `spec.tile` index. Packs may colour tiles by it
(Bento does) or ignore it. Apps never name a style.

### Hard-won notes
- Token names must not start with `on` + capital (`onAccent`): QML parses them as
  signal handlers. Use `textOnAccent`.
- An `Item` with `visible: false` is not rendered into a texture. Effect sources
  must be wrapped in `ShaderEffectSource { hideSource: true }`; only `Image` works
  hidden on its own.
- `-platform offscreen` on Windows falls back to the software scene graph, which
  silently drops every shader effect. The snapshot tool therefore uses the real
  platform with an off-screen, input-transparent tool window.
- `QGuiApplication` consumes `-style`, so tool options must not be named `style`.
- `MultiEffect` blur caps at 64px; large soft backdrops are blurred at reduced
  size and scaled up.
- Snapshots on Windows need no extra setup; under `offscreen` elsewhere, set
  `QT_QPA_FONTDIR`.

## 8. CI/CD

Green on GitHub for every job. First release: v0.0.1
(https://github.com/MohsenD98/UIverse/releases/tag/v0.0.1). Default branch is `main`; Pages source is
GitHub Actions. Live demo: https://mohsend98.github.io/UIverse/

- `.github/actions/setup-qt` — the only place Qt, CMake, Ninja and MSVC are set
  up. Qt version lives here once.
- `ci.yml` — `format` and `lint` gate everything; then desktop matrix
  (`build.yml`), WASM (`wasm.yml`), snapshots on Windows (real Segoe UI and
  D3D11), and on `main` the WASM build is deployed to GitHub Pages.
- `release.yml` — on `v*` tags: Windows zip, macOS dmg, Linux tar.gz, WASM zip.
  Linux ships as tar.gz, not AppImage, until someone needs AppImage.
- The emsdk version is read from the installed Qt, never hardcoded.
- **aqt is pinned to a development commit.** Qt 6.11 split its Windows online
  repository into one folder per compiler (`qt6_6111/qt6_6111_msvc2022_64/`),
  and aqtinstall 3.3.0 cannot read it. Move `aqtsource` back to a released
  `aqtversion` as soon as aqtinstall ships a release that lists
  `aqt list-qt windows desktop --arch 6.11.1` correctly.
- Qt's WebAssembly archives unpack their tools without the executable bit;
  `setup-qt` restores it.
- Job logs need authentication; check-run annotations
  (`/repos/<owner>/<repo>/check-runs/<job id>/annotations`) are public and
  usually enough to diagnose a failure.

Improvements over MMaterial-Tester: no duplicated Qt setup, reusable workflows
shared by CI and release, lint and format gates, emsdk derived from Qt, no
Qt-from-source WASM build, no dead commented-out steps.

## 9. Next steps, in order

1. Choose and add a LICENSE (the repository has none, so no one may legally
   reuse the code yet).
2. UX laws layers 1–3 (section 4).
3. Ship the MSVC runtime (`vcruntime140.dll`, `msvcp140.dll`) in the Windows
   zip. v0.0.1 runs only where the Visual C++ Redistributable is installed.
4. Trim the deployed runtime (it currently ships Controls, Pdf, Lottie and
   VirtualKeyboard pulled in transitively; about 120 MB).
5. Per-style mini-apps (section 1), starting with the glassmorphism music player.
6. Replace the default Qt WebAssembly HTML shell (title reads `appUIverse`).
7. Backlog styles.

Reference repos reviewed for CI: MMaterial-Tester (good matrix and Pages deploy,
but duplicated Qt setup, leftovers from another project, a broken
`${{matrix.BUILD_TYPE}}` reference, and no linting) and QField (pre-commit with
qmlformat, static-check jobs).
