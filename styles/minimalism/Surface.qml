import QtQuick
import UIverse.Core

SlotRect {
    id: surface

    color: variant === "accent" ? tokens.accent : variant === "quiet" ? "transparent" : tokens.surface
    radius: tokens.radiusMd
    border.width: variant === "quiet" || variant === "accent" ? 0 : tokens.borderWidth
    border.color: tokens.border

    Behavior on color {
        ColorAnimation {
            duration: surface.tokens.durationBase
        }
    }
}
