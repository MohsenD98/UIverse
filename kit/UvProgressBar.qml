import QtQuick
import QtQuick.Templates as T
import UIverse.Core

T.ProgressBar {
    id: bar

    property var hints: ({})

    readonly property Tokens tokens: Style.tokens

    implicitWidth: tokens.controlWidth
    implicitHeight: contentItem ? contentItem.implicitHeight : tokens.unit

    contentItem: StyleSlot {
        control: bar
        part: "progressTrack"
    }
}
