import QtQuick
import UIverse.Core

SlotRect {
    readonly property color tone: tokens.statusColor(variant, tokens.text)

    radius: height / 2
    color: Qt.alpha(tone, variant === "accent" ? 1 : 0.1)
}
