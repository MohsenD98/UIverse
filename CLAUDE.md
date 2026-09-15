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
2. **Commit titles are short summaries.** Imperative mood, under ~50 characters,
   no body unless it genuinely adds something. Example: `Add bento style pack`.
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
   or `radius: 12` in the Kit, the shell or an app is a bug. Only a pack's own
   `Tokens { }` block may carry raw values.
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
control it styles is not visible by name. `SlotRect` / `SlotText` resolve it via
`parent.ctl`. Always extend those bases rather than reaching for `parent`.

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

Qt 6.11.1, MinGW 64-bit, CMake + Ninja.

```
cmake -S . -B build -G Ninja -DCMAKE_PREFIX_PATH=C:/Qt/6.11.1/mingw_64
cmake --build build
```
