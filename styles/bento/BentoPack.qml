import QtQuick
import UIverse.Core

StylePack {
    key: "bento"
    name: "Bento UI"
    tagline: "One idea per box, sized by how much it matters."
    era: "Bento boxes → Windows Metro tiles → Apple keynote grids 2020s"
    swatch: "#0071e3"

    summary: "Bento layouts pack a screen into a grid of rounded tiles of different " +
             "sizes. Each tile holds one idea, and its size is the hierarchy: the most " +
             "important thing gets the biggest box. The style lives almost entirely in " +
             "layout, which is why it is in the first phase of this lab: the same " +
             "components, rearranged, are what make it bento."

    rules: [
        "One idea per tile. A tile that needs a scrollbar is two tiles.",
        "Size encodes importance; the hero tile must be visibly larger.",
        "Gaps are tight and identical everywhere. The grid is the ornament.",
        "One generous corner radius for tiles; nested elements use a smaller one.",
        "Lead each tile with one large number or visual, then a quiet label."
    ]

    antiRules: [
        "Do not make every tile the same size. That is a card grid, not bento.",
        "No borders. Tiles separate by fill and gap.",
        "Never mix tile radii.",
        "Do not let tile order fight reading order; the eye still starts top-left."
    ]

    reading: [
        { "label": "Bento Grids — a curated gallery", "url": "https://bentogrids.com/" },
        { "label": "Metro design language", "url": "https://en.wikipedia.org/wiki/Metro_(design_language)" }
    ]

    tokens: Tokens {
        bg: "#f5f5f7"
        bgAlt: "#ebebf0"
        surface: "#ffffff"
        surfaceAlt: "#e8e8ed"
        text: "#1d1d1f"
        textMuted: "#6e6e73"
        accent: "#0071e3"
        textOnAccent: "#ffffff"
        border: "#e5e5ea"
        success: "#1f9d55"
        warning: "#b86e00"
        danger: "#d93025"
        palette: ["#ffffff", "#e3eeff", "#fff0dc", "#e3f6ea", "#efe8ff", "#ffe6ec", "#eaf6fb"]

        radiusSm: 10
        radiusMd: 16
        radiusLg: 28
        borderWidth: 1
        unit: 8
        controlHeight: 40
        pagePadding: 36
        gridGap: 14

        fontSizeXs: 12
        fontSizeSm: 13
        fontSizeMd: 15
        fontSizeLg: 19
        fontSizeXl: 34
        displaySize: 50
        weightBody: Font.Normal
        weightMedium: Font.DemiBold
        weightDisplay: Font.Bold
        letterSpacingDisplay: -1.4
        letterSpacingLabel: 0
        lineHeight: 1.35

        surfaceMode: "soft"
        shadowColor: "#000000"
        shadowOpacity: 0.07
        shadowBlur: 28
        shadowOffsetY: 6
        durationFast: 160
        durationBase: 300
        easingType: Easing.OutQuint
        layoutMode: "bento"
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
