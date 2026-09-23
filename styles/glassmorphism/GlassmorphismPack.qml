import QtQuick
import UIverse.Core
import "about.mjs" as About

StylePack {
    key: "glassmorphism"
    name: "Glassmorphism"
    swatch: "#8b9dff"
    about: About.about

    tokens: Tokens {
        bg: "#0d0f2b"
        bgAlt: "#1a0f33"
        surface: "#1affffff"
        surfaceAlt: "#29ffffff"
        text: "#f5f7ff"
        textMuted: "#b4bade"
        accent: "#8b9dff"
        textOnAccent: "#0b0d24"
        border: "#38ffffff"
        success: "#6ee7b7"
        warning: "#fcd34d"
        danger: "#fca5a5"
        palette: ["#7c3aed", "#2563eb", "#db2777", "#0891b2"]

        radiusSm: 10
        radiusMd: 14
        radiusLg: 22
        borderWidth: 1
        unit: 8
        controlHeight: 40
        pagePadding: 40
        gridGap: 20

        fontSizeXs: 11
        fontSizeSm: 13
        fontSizeMd: 15
        fontSizeLg: 18
        fontSizeXl: 28
        displaySize: 44
        weightBody: Font.Normal
        weightMedium: Font.DemiBold
        weightDisplay: Font.DemiBold
        letterSpacingDisplay: -0.6
        letterSpacingLabel: 0.3
        lineHeight: 1.45

        surfaceMode: "glass"
        blurAmount: 48
        shadowColor: "#05061a"
        shadowOpacity: 0.45
        shadowBlur: 36
        shadowOffsetY: 14
        durationFast: 160
        durationBase: 280
        easingType: Easing.OutCubic
        layoutMode: "stack"
        decorative: true
    }

    pageBackground: Component {
        Aurora {}
    }
    surface: Component {
        Surface {}
    }
    buttonBackground: Component {
        ButtonBackground {}
    }
    buttonContent: Component {
        ButtonContent {}
    }
    fieldBackground: Component {
        Field {}
    }
    switchIndicator: Component {
        SwitchIndicator {}
    }
    sliderGroove: Component {
        SliderGroove {}
    }
    sliderHandle: Component {
        SliderHandle {}
    }
    progressTrack: Component {
        ProgressTrack {}
    }
    tagBackground: Component {
        TagBackground {}
    }
    divider: Component {
        SlotRect {
            color: t.border
        }
    }
}
