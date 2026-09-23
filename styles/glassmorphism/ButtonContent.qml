import QtQuick
import UIverse.Core

SlotText {
    readonly property bool solid: variant === "primary" || variant === "danger"

    color: solid ? tokens.textOnAccent : tokens.text
    font.family: tokens.fontFamily
    font.pixelSize: tokens.fontSizeSm
    font.weight: tokens.weightMedium
    font.letterSpacing: tokens.letterSpacingLabel
}
