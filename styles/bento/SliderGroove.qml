import QtQuick
import UIverse.Core

FillTrack {
    implicitHeight: 4
    radius: height / 2
    color: Qt.alpha(tokens.text, 0.1)
    fill.color: tokens.accent
}
