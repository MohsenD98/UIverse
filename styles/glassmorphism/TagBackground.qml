import QtQuick
import UIverse.Core

SlotRect {
    readonly property color tone: tokens.statusColor(variant, tokens.text)

    radius: height / 2
    color: Qt.alpha(tone, variant === "accent" ? 0.7 : 0.14)
    border.width: tokens.borderWidth
    border.color: Qt.alpha(tone, 0.35)
}
