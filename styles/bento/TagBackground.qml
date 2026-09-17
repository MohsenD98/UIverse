import QtQuick
import UIverse.Core

SlotRect {
    readonly property color tone: variant === "accent" ? t.accent : variant === "success" ? t.success : variant === "warning" ? t.warning : variant === "danger" ? t.danger : t.text

    radius: height / 2
    color: Qt.alpha(tone, variant === "accent" ? 1 : 0.1)
}
