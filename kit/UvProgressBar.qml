import QtQuick
import QtQuick.Templates as T
import UIverse.Core

T.ProgressBar {
    id: control

    property var spec: ({})
    readonly property Tokens t: Style.t

    implicitWidth: 180
    implicitHeight: contentItem ? contentItem.implicitHeight : t.unit

    contentItem: StyleSlot {
        ctl: control
        spec: control.spec
        sourceComponent: Style.pack ? Style.pack.progressTrack : null
    }
}
