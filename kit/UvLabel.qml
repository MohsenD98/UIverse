import QtQuick
import UIverse.Core

Text {
    id: label

    property string role: "body"
    property bool muted: false

    readonly property Tokens t: Style.t
    readonly property bool isDisplay: role === "display" || role === "title"
    readonly property bool isMinor: role === "label" || role === "caption"

    color: muted ? t.textMuted : t.text
    renderType: Text.NativeRendering
    textFormat: Text.PlainText
    wrapMode: Text.WordWrap

    font.family: role === "mono" ? t.monoFamily : isDisplay ? t.displayFamily : t.fontFamily
    font.pixelSize: {
        switch (role) {
        case "display": return t.displaySize
        case "title": return t.fontSizeXl
        case "heading": return t.fontSizeLg
        case "label": return t.fontSizeSm
        case "caption": return t.fontSizeXs
        case "mono": return t.fontSizeSm
        default: return t.fontSizeMd
        }
    }
    font.weight: isDisplay ? t.weightDisplay
                           : (role === "heading" || role === "label") ? t.weightMedium
                                                                      : t.weightBody
    font.letterSpacing: isDisplay ? t.letterSpacingDisplay
                                  : isMinor ? t.letterSpacingLabel
                                            : t.letterSpacingBody
    font.capitalization: t.uppercaseLabels && role === "label" ? Font.AllUppercase : Font.MixedCase
    lineHeight: t.lineHeight
    lineHeightMode: Text.ProportionalHeight

    Behavior on color { ColorAnimation { duration: label.t.durationFast } }
}
