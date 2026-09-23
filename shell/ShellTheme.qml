pragma Singleton
import QtQuick
import UIverse.Core

QtObject {
    readonly property Tokens tokens: Tokens {
        background: "#0b0b0e"
        backgroundAlt: "#131318"
        surface: "#16161c"
        surfaceAlt: "#1d1d25"
        text: "#f4f4f5"
        textMuted: "#8b8b96"
        accent: "#6d8bff"
        textOnAccent: "#0b0b0e"
        border: "#26262f"

        radiusMd: 10
        radiusLg: 16
        unit: 8
        controlHeight: 34
        pagePadding: 40
        gridGap: 20

        fontSizeSm: 12
        fontSizeMd: 14
        fontSizeLg: 18
        fontSizeXl: 24
        displaySize: 32
        letterSpacingDisplay: -0.5
        letterSpacingLabel: 0.6
        uppercaseLabels: true
    }
}
