import QtQuick

HardBox {
    readonly property bool tinted: hints && hints.tint !== undefined

    faceColor: variant === "accent" ? tokens.accent : variant === "quiet" ? tokens.surfaceAlt : tinted ? tokens.palette[hints.tint % tokens.palette.length] : tokens.surface
    lift: variant === "quiet" ? 0 : tokens.shadowOffsetX
    corner: tokens.radiusMd
}
