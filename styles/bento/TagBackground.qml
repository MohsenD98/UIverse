import QtQuick
import UIverse.Core

SlotRect {
    readonly property color tone: variant === "accent" ? tokens.accent : variant === "success" ? tokens.success : variant === "warning" ? tokens.warning : variant === "danger" ? tokens.danger : tokens.text

    radius: height / 2
    color: Qt.alpha(tone, variant === "accent" ? 1 : 0.1)
}
