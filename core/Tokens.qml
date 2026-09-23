import QtQuick
import UIverse.Fonts

QtObject {
    property color bg: "#ffffff"
    property color bgAlt: "#f4f4f5"
    property color surface: "#ffffff"
    property color surfaceAlt: "#fafafa"
    property color text: "#111113"
    property color textMuted: "#71717a"
    property color accent: "#2563eb"
    property color textOnAccent: "#ffffff"
    property color border: "#e4e4e7"
    property color success: "#16a34a"
    property color warning: "#d97706"
    property color danger: "#dc2626"
    property var palette: ["#2563eb", "#16a34a", "#d97706", "#dc2626", "#7c3aed", "#0891b2"]

    property real radiusSm: 4
    property real radiusMd: 8
    property real radiusLg: 14
    property real borderWidth: 1
    property real unit: 8
    property real controlHeight: 38
    property real pagePadding: 32
    property real gridGap: 16

    property string fontFamily: Fonts.inter
    property string monoFamily: Fonts.jetBrainsMono
    property string displayFamily: Fonts.inter
    property real fontSizeXs: 11
    property real fontSizeSm: 13
    property real fontSizeMd: 15
    property real fontSizeLg: 19
    property real fontSizeXl: 26
    property real displaySize: 42
    property int weightBody: Font.Normal
    property int weightMedium: Font.DemiBold
    property int weightDisplay: Font.Bold
    property real letterSpacingBody: 0
    property real letterSpacingDisplay: 0
    property real letterSpacingLabel: 0
    property real lineHeight: 1.45
    property bool uppercaseLabels: false

    property real blurAmount: 0
    property color shadowColor: "#000000"
    property real shadowOpacity: 0
    property real shadowBlur: 0
    property real shadowOffsetX: 0
    property real shadowOffsetY: 0

    property int durationFast: 120
    property int durationBase: 220
    property int easingType: Easing.OutCubic

    property string layoutMode: "stack"
}
