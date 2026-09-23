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
   `about.mjs` of each pack) or in this file — not scattered through QML.
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
- `StylePack.qml` — identity, tokens, one `Component` per render slot, and the
  pack's description loaded from its `about.mjs`.
- `StyleSlot.qml` — a `Loader` that mounts a pack's component and passes the
  control down as `control`, plus `variant` and `hints`.
- `SlotRect.qml` / `SlotText.qml` — bases that expose `control`, `variant`,
  `hints`, `tokens` and the interaction flags, so slot files stay a few lines long.
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
`position`). Slot files read those flags, never `control` directly, and qualify
every reference from a child element with the root `id`.

---

## 4. UX laws layer (agreed)

The twenty classic UX laws sit **beneath** style and are invariant across it. A
style may change everything about how something looks; it may not break how it
works. Three layers:

**Layer 1 — enforced, packs cannot opt out.** Done.
- *Fitts's law* → `Style.minimumTargetSize` (44 px). Every interactive Kit
  control is at least that tall; its background is drawn at the pack's own
  size inside it through insets. Covered by `tests/tst_targets.qml`.
- *Doherty threshold* → the architecture hook rejects any `durationFast` or
  `durationBase` above 400 ms.
- *Law of proximity* → all spacing derives from `unit`.

**Layer 2 — relations.** Done. `core/uxLaws.mjs` lists twenty laws (`UxLaws`
singleton). Each pack's `about.mjs` names the laws it works with and against,
with one sentence each, shown in the rules panel. The tests reject unknown law
keys.

**Layer 3 — contrast audit.** Done. `ContrastAudit` computes WCAG ratios from a
pack's tokens: text and muted text on the page and on a card at 4.5:1, the
button label at 4.5:1, and the accent (or, for outlined styles with borders of
2 px or more, the outline) against the page at 3:1. Every pack must pass;
`tests/tst_contrast.qml` enforces it. The audit uses the plain page colour, so
the rules panel adds a warning for packs with a decorated page background.

Changes from the original list of twenty: the duplicate "Postel's law" became
the aesthetic-usability effect, and "minimize target distance", which is part
of Fitts's law, became the law of common region.

---

## 5. Layout

```
fonts/                 UIverse.Fonts           bundled OFL typefaces
core/                  UIverse.Core            contract, slots, Style singleton
kit/                   UIverse.Kit             Uv* controls, behaviour only
styles/<key>/          UIverse.Styles.<Name>   one module per design language
styles/registry/       UIverse.Styles          list of packs, active selection
apps/                  UIverse.Apps            reference dashboard, later mini-apps
shell/                 UIverse.Shell           gallery, workbench, rules panel
tests/                 tst_uiverse             QML tests, run by ctest and CI
tools/snapshot/        uiverse-snapshot        renders any screen to PNG
scripts/                                       hooks, lint, snapshots, commit checks
```

Naming: Kit components are `Uv*`. A style module's entry type is `<Name>Pack`.
Slot files use plain names (`Surface`, `ButtonBackground`) and are reached
through qualified imports, so names never collide across styles.

### Adding a style

1. `styles/<key>/` with `<Name>Pack.qml` (`key: "<key>"`, checked by the
   architecture hook), `about.mjs` (description, dos, don'ts, reading, and the
   UX laws it works with and against), one file per slot it overrides, and a
   `CMakeLists.txt` with URI `UIverse.Styles.<Name>`. Its tokens must pass the
   contrast audit.
2. `add_subdirectory(<key>)` in `styles/CMakeLists.txt`.
3. Link its plugin and add it to `packs` in `styles/registry/`.

The tests, snapshots and README images pick it up from there. Run
`scripts/docs-images.sh build` and add a row to the README table.


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

Licensed MIT (`LICENSE`); bundled fonts stay under their own OFL.

Phase 1 is complete and every file has been reviewed against section 10.
Builds green on Qt 6.11.1; the app runs with no QML warnings; `qmllint` and
`qmlformat` are clean; `tests/` (`tst_uiverse`) runs in CI on all three
desktop platforms.

- Core contract, Kit (10 controls), shell (gallery, workbench, style picker,
  rules drawer with keyboard: ←/→ switch style, R rules, Esc back).
- Reference dashboard in `apps/reference/`, laid out per `layoutMode`
  (`stack`, `bento`, and a two-column compact fallback).
- Packs: Minimalism, Neo-Brutalism, Glassmorphism (real backdrop blur),
  Bento.
- `uiverse-snapshot` renders any pack to PNG without showing a window
  (`--rules` opens the rules panel first).
- Fonts are bundled in `UIverse.Fonts` (OFL: Inter, Archivo Black, Space
  Grotesk, JetBrains Mono), so every platform and the web render identically.
  Packs name fonts only through `Fonts.*`, never by family string. Licence
  texts in `fonts/` are kept verbatim and excluded from whitespace hooks.
- README screenshots in `docs/images/` come from `scripts/docs-images.sh`;
  re-run it whenever a pack changes visibly.

The shell keeps its own `ShellTheme` tokens, so the lab chrome does not change
while browsing styles.

Dashboard areas pass a neutral `hints.tile` index. Packs may colour tiles by it
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
- `containmentMask` can only shrink an item's hit area. Qt delivers pointer
  events by bounding rect first, so a mask reaching outside the item is never
  asked. Enlarge a touch target by making the control bigger and drawing its
  background smaller with insets.
- `TextField` is a `TextInput`, not a `Control`: it has `leftPadding` and
  `rightPadding` but no `horizontalPadding`. Such mistakes only surface when the
  object is created, which is what `tests/tst_packs.qml` does for every pack.
- Under Git Bash on Windows, `tst_uiverse` prints nothing to a redirected
  stdout. Ask QtTest for a file instead: `tst_uiverse -o result.txt,txt`.
- `qmlformat` (6.11) squeezes every string array in a QML file onto one line,
  and `XMLHttpRequest` refuses local files by default. That is why style
  descriptions live in `about.mjs`, imported synchronously.
- Rendering is deterministic except the glass backdrop, which dithers by up
  to 1 colour level between runs.

## 8. CI/CD

Green on GitHub for every job. First release: v0.0.1
(https://github.com/MohsenD98/UIverse/releases/tag/v0.0.1). Default branch is `main`; Pages source is
GitHub Actions. Live demo: https://mohsend98.github.io/UIverse/

- `.github/actions/setup-qt` — the only place Qt, CMake, Ninja and MSVC are set
  up. Qt version lives here once.
- `ci.yml` — `hooks` (pre-commit plus commit-message checks) and `lint` gate
  everything; then the desktop matrix (`build.yml`: build, test, package),
  WASM (`wasm.yml`), screenshots on Windows (D3D11), and on `main` the WASM
  build is deployed to GitHub Pages.
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

1. Ship the MSVC runtime (`vcruntime140.dll`, `msvcp140.dll`) in the Windows
   zip. v0.0.1 runs only where the Visual C++ Redistributable is installed.
2. Trim the deployed runtime (it currently ships Controls, Pdf, Lottie and
   VirtualKeyboard pulled in transitively; about 120 MB).
3. Per-style mini-apps (section 1), starting with the glassmorphism music player.
4. Replace the default Qt WebAssembly HTML shell (title reads `appUIverse`).
5. Backlog styles.

Reference repos reviewed for CI: MMaterial-Tester (good matrix and Pages deploy,
but duplicated Qt setup, leftovers from another project, a broken
`${{matrix.BUILD_TYPE}}` reference, and no linting) and QField (pre-commit with
qmlformat, static-check jobs).

---

## 10. Conventions

General rules that came out of reviewing every file. They apply to all new code.

### Naming
- Use whole words. No single letters, no abbreviations (`tokens`, `control`,
  `background`). The only accepted shorthand is the size scale `Xs Sm Md Lg Xl`.
- A name says what a thing is or does, not how it happens to be implemented.
- A root `id` names the thing itself (`button`, `field`). Never reuse a
  property name as an `id`: `control: control` binds to itself.
- A file is named after the role it plays. Slot files carry their slot's name;
  helpers are named after what they draw.
- Imports come in three groups, in this order: Qt, project, local files.

### Structure
- One fact, one place. A value, list, threshold or mapping that appears twice
  gets one owner, and everything else reads it from there. This holds for QML,
  CMake and scripts alike.
- A default belongs in the contract, not in every consumer. If every caller
  overrides a value, the default is wrong.
- Two components that differ only in data share one implementation and take
  the data as a property.
- Delete what nothing reads: unused properties, tokens, settings and branches.
- Don't restate framework defaults.
- Positional data gets names. Prefer `place.rowSpan` to `place[2]`.
- One condition per line. Nested `?:` becomes an `if` or `switch` block.
- No side effects inside expressions.
- Text that can grow gets a width and a wrap mode.

### Data and prose
- Prose shown to users is data, not code. Keep it in its own file next to the
  code that uses it.
- Write it for people: plain words, short sentences. No em dashes, no
  "not X, but Y", no slogans, no bold-led bullet lists, no emoji in prose. Say
  what the thing does.

### Testing
- Anything that can only fail at runtime has a test that creates it.
- A quality bar that matters is enforced by a test, not left to review.
  Accessibility is the example: contrast is computed and checked for every
  pack.
- Test behaviour through real input, not through the code path you expect to
  run.
- Every registered pack is exercised by the tests automatically.
- Data-driven test rows get readable tags.
- Look at every screen at more than one size. If a screen can't be captured,
  extend the capture tool first.

### Changing code safely
- A refactor changes no pixels. Capture with `scripts/snapshots.sh` before and
  after, compare with `scripts/compare-snapshots.py`. Differences up to 2
  colour levels are rendering noise.
- A deliberate visual change is looked at, not just measured.
- After any scripted edit, read the result before trusting it.

### Committing
- One unit per commit. Stage it, check `git diff --cached --stat`, then
  commit; `git commit` takes the whole index.
- Every commit builds and passes the tests on its own. Order split changes so
  each stands alone, and prove it with `scripts/check-commits.sh <base>`.
