import QtQuick
import QtQuick.Effects
import UIverse.Core

SlotRect {
    id: tile

    readonly property bool isTile: hints && hints.tile !== undefined
    readonly property bool isHero: variant === "accent"

    radius: isTile ? tokens.radiusLg : tokens.radiusSm
    color: {
        if (isHero)
            return tokens.accent
        if (variant === "quiet")
            return tokens.surfaceAlt
        if (isTile)
            return tokens.palette[hints.tile % tokens.palette.length]
        return tokens.surface
    }

    Behavior on color {
        ColorAnimation {
            duration: tile.tokens.durationBase
        }
    }

    RectangularShadow {
        z: -1
        anchors.fill: parent
        visible: tile.isTile
        radius: tile.radius
        offset.y: tile.tokens.shadowOffsetY
        blur: tile.tokens.shadowBlur
        spread: -tile.tokens.unit
        color: Qt.alpha(tile.tokens.shadowColor, tile.tokens.shadowOpacity)
    }
}
