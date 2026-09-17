import QtQuick
import QtQuick.Effects
import UIverse.Core

SlotRect {
    id: tile

    readonly property bool isTile: spec && spec.tile !== undefined
    readonly property bool isHero: variant === "accent"

    radius: isTile ? t.radiusLg : t.radiusSm
    color: isHero ? t.accent
         : variant === "quiet" ? t.surfaceAlt
         : isTile ? t.palette[spec.tile % t.palette.length]
         : t.surface

    Behavior on color { ColorAnimation { duration: tile.t.durationBase } }

    RectangularShadow {
        z: -1
        anchors.fill: parent
        visible: tile.isTile
        radius: tile.radius
        offset.y: tile.t.shadowOffsetY
        blur: tile.t.shadowBlur
        spread: -tile.t.unit
        color: Qt.alpha(tile.t.shadowColor, tile.t.shadowOpacity)
    }
}
