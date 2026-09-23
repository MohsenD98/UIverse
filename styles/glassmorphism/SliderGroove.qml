import QtQuick
import UIverse.Core

FillTrack {
    id: track

    implicitHeight: 6
    radius: height / 2
    color: Qt.alpha(tokens.text, 0.14)
    fill.gradient: Gradient {
        orientation: Gradient.Horizontal

        GradientStop {
            position: 0
            color: track.tokens.palette[0]
        }
        GradientStop {
            position: 1
            color: track.tokens.accent
        }
    }
}
