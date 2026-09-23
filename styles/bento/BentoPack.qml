import QtQuick
import UIverse.Core
import "about.mjs" as About

StylePack {
    key: "bento"
    name: "Bento"
    swatch: "#0071e3"
    about: About.about

    tokens: Tokens {
        background: "#f5f5f7"
        backgroundAlt: "#ebebf0"
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

        shadowColor: "#000000"
        shadowOpacity: 0.07
        shadowBlur: 28
        shadowOffsetY: 6
        durationFast: 160
        durationBase: 300
        easingType: Easing.OutQuint
        layoutMode: "bento"
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
        FieldBackground {}
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
}
