import QtQuick
import UIverse.Core

SlotRect {
    readonly property color tone: variant === "accent" ? t.accent : variant === "success" ? t.success : variant === "warning" ? t.warning : variant === "danger" ? t.danger : t.surface

    radius: t.radiusSm
    color: variant === "neutral" || variant === "default" ? t.surface : Qt.tint(t.surface, Qt.alpha(tone, 0.28))
    border.width: 2
    border.color: t.border
}
