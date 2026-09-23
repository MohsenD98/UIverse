import QtQuick
import UIverse.Core
import "about.mjs" as About
import UIverse.Fonts

StylePack {
    key: "neobrutalism"
    name: "Neo-Brutalism"
    swatch: "#ff90e8"
    about: About.about

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

        fontFamily: Fonts.spaceGrotesk
        displayFamily: Fonts.archivoBlack
        fontSizeXs: 11
        fontSizeSm: 13
        fontSizeMd: 15
        fontSizeLg: 19
        fontSizeXl: 28
        displaySize: 46
        weightBody: Font.Medium
        weightMedium: Font.Bold
        weightDisplay: Font.Normal
        letterSpacingDisplay: -1
        letterSpacingLabel: 0.8
        lineHeight: 1.35
        uppercaseLabels: true

        shadowColor: "#0a0a0a"
        shadowOpacity: 1
        shadowOffsetX: 5
        shadowOffsetY: 5
        durationFast: 90
        durationBase: 160
        easingType: Easing.OutQuad
        layoutMode: "dense"
    }

    pageBackground: Component {
        DotGrid {}
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
            implicitHeight: t.borderWidth
            color: t.border
        }
    }
}
