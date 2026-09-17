import QtQuick
import UIverse.Core

StylePack {
    key: "minimalism"
    name: "Minimalism"
    tagline: "Remove until it breaks, then put one thing back."
    era: "Swiss school → Dieter Rams → 2010s digital"
    swatch: "#18181b"

    summary: "Minimalism is not 'fewer pixels'. It is a hierarchy so clear that " +
             "decoration has no work left to do. Space carries the grouping that " +
             "borders and fills carry elsewhere, so the spacing scale has to be obeyed " +
             "exactly: an off-rhythm gap is the one thing that reads as a mistake " +
             "rather than as restraint."

    rules: [
        "One accent colour. Everything else is a step on a neutral ramp.",
        "Group with space, not with borders or background fills.",
        "The type scale carries the hierarchy: size and weight, rarely colour.",
        "Generous page padding. Content should not touch the frame.",
        "Every border is a hairline. If it needs to be thicker, it should not be there."
    ]

    antiRules: [
        "No shadows for depth. Minimalism has no z-axis.",
        "Do not fill a surface just to prove it exists.",
        "Do not centre body text; ragged-right reads faster.",
        "No icon that merely repeats the label beside it."
    ]

    reading: [
        { "label": "Dieter Rams — Ten Principles for Good Design",
          "url": "https://www.vitsoe.com/gb/about/good-design" },
        { "label": "Müller-Brockmann — Grid Systems in Graphic Design",
          "url": "https://en.wikipedia.org/wiki/Grid_Systems_in_Graphic_Design" }
    ]

    tokens: Tokens {
        bg: "#ffffff"
        bgAlt: "#fafafa"
        surface: "#ffffff"
        surfaceAlt: "#fafafa"
        text: "#18181b"
        textMuted: "#a1a1aa"
        accent: "#18181b"
        textOnAccent: "#ffffff"
        border: "#ebebed"
        success: "#16a34a"
        warning: "#ca8a04"
        danger: "#dc2626"
        palette: ["#18181b", "#52525b", "#a1a1aa", "#d4d4d8"]

        radiusSm: 4
        radiusMd: 6
        radiusLg: 8
        borderWidth: 1
        unit: 8
        controlHeight: 36
        pagePadding: 48
        gridGap: 24

        fontSizeXs: 11
        fontSizeSm: 13
        fontSizeMd: 14
        fontSizeLg: 17
        fontSizeXl: 21
        displaySize: 34
        weightBody: Font.Normal
        weightMedium: Font.Medium
        weightDisplay: Font.DemiBold
        letterSpacingDisplay: -0.4
        letterSpacingLabel: 0.2
        lineHeight: 1.55

        surfaceMode: "flat"
        shadowOpacity: 0
        durationFast: 110
        durationBase: 200
        layoutMode: "stack"
        decorative: false
    }

    pageBackground: null
    surface: Component { Surface {} }
    buttonBackground: Component { ButtonBackground {} }
    buttonContent: Component { ButtonContent {} }
    fieldBackground: Component { Field {} }
    switchIndicator: Component { SwitchIndicator {} }
    sliderGroove: Component { SliderGroove {} }
    sliderHandle: Component { SliderHandle {} }
    progressTrack: Component { ProgressTrack {} }
    tagBackground: Component { TagBackground {} }
    divider: Component { SlotRect { color: t.border } }
}
