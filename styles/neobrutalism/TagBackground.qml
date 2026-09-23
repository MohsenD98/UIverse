import QtQuick
import UIverse.Core

SlotRect {
    readonly property color tone: tokens.statusColor(variant, tokens.surface)

    radius: tokens.radiusSm
    color: variant === "neutral" || variant === "default" ? tokens.surface : Qt.tint(tokens.surface, Qt.alpha(tone, 0.28))
    border.width: 2
    border.color: tokens.border
}
