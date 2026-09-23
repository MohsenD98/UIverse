import QtQuick
import UIverse.Core

SlotText {
    id: label

    readonly property real press: isDown && variant !== "ghost" ? tokens.shadowOffsetX : 0

    color: tokens.text
    font.family: tokens.displayFamily
    font.pixelSize: tokens.fontSizeSm
    font.weight: Font.Normal
    font.letterSpacing: tokens.letterSpacingLabel
    font.capitalization: Font.AllUppercase
    transform: Translate {
        x: label.press
        y: label.press
    }
}
