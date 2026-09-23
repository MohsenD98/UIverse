import QtQuick
import UIverse.Core

Canvas {
    id: grid

    readonly property Tokens tokens: Style.tokens
    readonly property real step: tokens.unit * 3

    onWidthChanged: requestPaint()
    onHeightChanged: requestPaint()
    onStepChanged: requestPaint()

    onPaint: {
        const ctx = getContext("2d")
        ctx.reset()
        ctx.globalAlpha = 0.18
        ctx.fillStyle = tokens.text
        for (let x = step / 2; x < width; x += step) {
            for (let y = step / 2; y < height; y += step)
                ctx.fillRect(x, y, 2, 2)
        }
    }
}
