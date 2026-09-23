import QtQuick
import UIverse.Core
import "about.mjs" as About

StylePack {
    key: "minimalism"
    name: "Minimalism"
    swatch: "#18181b"
    about: About.about

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

        shadowOpacity: 0
        durationFast: 110
        durationBase: 200
        layoutMode: "stack"
    }

    pageBackground: null
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
