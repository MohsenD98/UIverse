import QtQuick
import UIverse.Core

StylePack {
    key: "neobrutalism"
    name: "Neo-Brutalism"
    tagline: "Show the structure, then make it loud."
    era: "Web brutalism 2014 → Gumroad & indie tools 2021+"
    swatch: "#ff90e8"

    summary: "Neo-brutalism keeps brutalism's refusal to hide structure and makes it " +
             "friendly: flat saturated colour, thick black outlines and hard offset " +
             "shadows that look cut from paper. Depth is a graphic device rather than " +
             "simulated light, so every shadow shares one angle and none of them blur."

    rules: [
        "Every grouped or interactive element wears the same thick outline.",
        "Shadows are solid, offset, unblurred, and all point the same way.",
        "A few loud flat colours; black does the separating.",
        "Pressing pushes the element into its own shadow. The shadow is the affordance.",
        "Type is heavy and confident. Labels may shout in uppercase."
    ]

    antiRules: [
        "No gradients, blur or soft shadows. They belong to a different style.",
        "Never mix outline weights.",
        "Colour must not carry meaning alone; it has to survive greyscale.",
        "No thin or light type. It vanishes next to a 3px border."
    ]

    reading: [
        { "label": "NN/g — Neobrutalism: Definition and Best Practices",
          "url": "https://www.nngroup.com/articles/neobrutalism/" },
        { "label": "Brutalist Websites",
          "url": "https://brutalistwebsites.com/" }
    ]

    tokens: Tokens {
        bg: "#fef6e4"
        bgAlt: "#fde8c8"
        surface: "#ffffff"
        surfaceAlt: "#fff4b8"
        text: "#0a0a0a"
        textMuted: "#4a4a4a"
        accent: "#ff90e8"
        textOnAccent: "#0a0a0a"
        border: "#0a0a0a"
        success: "#0b7a5a"
        warning: "#a15c00"
        danger: "#ff4d4d"
        palette: ["#ff90e8", "#ffc900", "#23a094", "#90a8ed", "#ff6b35"]

        radiusSm: 4
        radiusMd: 6
        radiusLg: 10
        borderWidth: 3
        unit: 8
        controlHeight: 42
        pagePadding: 32
        gridGap: 24

        fontFamily: "Segoe UI"
        displayFamily: "Arial Black"
        fontSizeXs: 11
        fontSizeSm: 13
        fontSizeMd: 15
        fontSizeLg: 19
        fontSizeXl: 28
        displaySize: 46
        weightBody: Font.Medium
        weightMedium: Font.Bold
        weightDisplay: Font.Black
        letterSpacingDisplay: -1
        letterSpacingLabel: 0.8
        lineHeight: 1.35
        uppercaseLabels: true

        surfaceMode: "hard"
        shadowColor: "#0a0a0a"
        shadowOpacity: 1
        shadowOffsetX: 5
        shadowOffsetY: 5
        durationFast: 90
        durationBase: 160
        easingType: Easing.OutQuad
        layoutMode: "dense"
        decorative: true
    }

    pageBackground: Component { DotGrid {} }
    surface: Component { Surface {} }
    buttonBackground: Component { ButtonBackground {} }
    buttonContent: Component { ButtonContent {} }
    fieldBackground: Component { Field {} }
    switchIndicator: Component { SwitchIndicator {} }
    sliderGroove: Component { SliderGroove {} }
    sliderHandle: Component { SliderHandle {} }
    progressTrack: Component { ProgressTrack {} }
    tagBackground: Component { TagBackground {} }
    divider: Component { SlotRect { implicitHeight: t.borderWidth; color: t.border } }
}
