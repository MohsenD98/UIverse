import QtQuick
import UIverse.Core

FillTrack {
    implicitHeight: 6
    radius: height / 2
    animated: true
    color: Qt.alpha(tokens.text, 0.08)
    fill.color: tokens.accent
}
