import QtQuick
import UIverse.Core

SlotText {
    id: label

    readonly property real press: isDown && variant !== "ghost" ? t.shadowOffsetX : 0

    color: t.text
    font.family: t.fontFamily
    font.pixelSize: t.fontSizeSm
    font.weight: Font.Black
    font.letterSpacing: t.letterSpacingLabel
    font.capitalization: Font.AllUppercase
    transform: Translate { x: label.press; y: label.press }
}
