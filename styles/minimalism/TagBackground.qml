import QtQuick
import UIverse.Core

SlotRect {
    radius: t.radiusSm
    color: "transparent"
    border.width: t.borderWidth
    border.color: variant === "accent" ? t.accent
                : variant === "success" ? t.success
                : variant === "warning" ? t.warning
                : variant === "danger" ? t.danger
                : t.border
}
