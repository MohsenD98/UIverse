import QtQuick
import UIverse.Core

SlotText {
    readonly property bool solid: variant === "primary" || variant === "danger"

    color: solid ? t.textOnAccent : variant === "ghost" ? t.accent : t.text
    font.family: t.fontFamily
    font.pixelSize: t.fontSizeSm
    font.weight: t.weightMedium
}
