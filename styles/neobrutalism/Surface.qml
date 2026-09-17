import QtQuick
import UIverse.Core

HardBox {
    readonly property bool tinted: spec && spec.tint !== undefined

    faceColor: variant === "accent" ? t.accent
             : variant === "quiet" ? t.surfaceAlt
             : tinted ? t.palette[spec.tint % t.palette.length]
             : t.surface
    lift: variant === "quiet" ? 0 : t.shadowOffsetX
    corner: t.radiusMd
}
