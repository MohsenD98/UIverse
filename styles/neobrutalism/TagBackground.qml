import QtQuick
import UIverse.Core

SlotRect {
    readonly property color tone: variant === "accent" ? tokens.accent : variant === "success" ? tokens.success : variant === "warning" ? tokens.warning : variant === "danger" ? tokens.danger : tokens.surface

    radius: tokens.radiusSm
    color: variant === "neutral" || variant === "default" ? tokens.surface : Qt.tint(tokens.surface, Qt.alpha(tone, 0.28))
    border.width: 2
    border.color: tokens.border
}
