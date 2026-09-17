import QtQuick
import UIverse.Core

SlotRect {
    id: surface

    color: variant === "accent" ? t.accent : variant === "quiet" ? "transparent" : t.surface
    radius: t.radiusMd
    border.width: variant === "quiet" || variant === "accent" ? 0 : t.borderWidth
    border.color: t.border

    Behavior on color {
        ColorAnimation {
            duration: surface.t.durationBase
        }
    }
}
