import QtQuick
import UIverse.Core

SlotRect {
    radius: tokens.radiusSm
    color: "transparent"
    border.width: tokens.borderWidth
    border.color: variant === "accent" ? tokens.accent : variant === "success" ? tokens.success : variant === "warning" ? tokens.warning : variant === "danger" ? tokens.danger : tokens.border
}
