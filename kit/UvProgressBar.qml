import QtQuick
import QtQuick.Templates as T
import UIverse.Core

T.ProgressBar {
    id: bar

    property var hints: ({})
    readonly property Tokens tokens: Style.tokens

    implicitWidth: 180
    implicitHeight: contentItem ? contentItem.implicitHeight : tokens.unit

    contentItem: StyleSlot {
        control: bar
        hints: bar.hints
        sourceComponent: Style.pack ? Style.pack.progressTrack : null
    }
}
