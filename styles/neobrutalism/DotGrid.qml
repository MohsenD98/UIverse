import QtQuick
import UIverse.Core

Canvas {
    id: grid

    readonly property Tokens tokens: Style.tokens
    readonly property real spacing: tokens.unit * 3
    readonly property real dotSize: 2
    readonly property real dotOpacity: 0.18

    onWidthChanged: requestPaint()
    onHeightChanged: requestPaint()
    onSpacingChanged: requestPaint()

    onPaint: {
        const context = getContext("2d")
        context.reset()
        context.globalAlpha = dotOpacity
        context.fillStyle = tokens.text
        for (let x = spacing / 2; x < width; x += spacing) {
            for (let y = spacing / 2; y < height; y += spacing)
                context.fillRect(x, y, dotSize, dotSize)
        }
    }
}
