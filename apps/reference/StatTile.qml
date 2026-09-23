import QtQuick
import QtQuick.Layouts
import UIverse.Kit

UvSurface {
    id: tile

    property string label
    property string value
    property string delta
    property bool positive: true
    property real progress: 0

    padding: tokens.unit * 2.5

    ColumnLayout {
        anchors.fill: parent
        spacing: tile.tokens.unit

        UvLabel {
            Layout.fillWidth: true
            role: "label"
            muted: true
            text: tile.label
        }

        UvLabel {
            Layout.fillWidth: true
            role: "title"
            text: tile.value
        }

        Item {
            Layout.fillHeight: true
        }

        UvTag {
            text: tile.delta
            variant: tile.positive ? "success" : "danger"
        }

        UvProgressBar {
            Layout.fillWidth: true
            value: tile.progress
        }
    }
}
