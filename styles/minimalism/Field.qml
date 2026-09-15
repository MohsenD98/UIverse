import QtQuick
import UIverse.Core

SlotRect {
    implicitHeight: t.controlHeight
    color: t.surface
    radius: t.radiusMd
    border.width: t.borderWidth
    border.color: ctl && ctl.activeFocus ? t.accent : isHovered ? t.textMuted : t.border

    Behavior on border.color { ColorAnimation { duration: t.durationFast } }
}
