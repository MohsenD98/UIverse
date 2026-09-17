import QtQuick
import QtQuick.Layouts
import UIverse.Core
import UIverse.Kit

UvSurface {
    id: list

    property string title
    property var entries: []

    padding: t.unit * 2.5

    ColumnLayout {
        anchors.fill: parent
        spacing: list.t.unit * 1.5

        UvLabel {
            Layout.fillWidth: true
            role: "heading"
            text: list.title
        }

        Repeater {
            model: list.entries

            ColumnLayout {
                id: entry

                required property var modelData
                required property int index

                Layout.fillWidth: true
                spacing: list.t.unit * 1.5

                UvDivider {
                    Layout.fillWidth: true
                    visible: entry.index > 0
                }

                RowLayout {
                    Layout.fillWidth: true
                    spacing: list.t.unit * 2

                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 0

                        UvLabel {
                            Layout.fillWidth: true
                            text: entry.modelData.title
                            wrapMode: Text.NoWrap
                            elide: Text.ElideRight
                        }

                        UvLabel {
                            Layout.fillWidth: true
                            role: "caption"
                            muted: true
                            text: entry.modelData.meta
                        }
                    }

                    UvTag {
                        text: entry.modelData.status
                        variant: entry.modelData.tone
                    }
                }
            }
        }

        Item { Layout.fillHeight: true }
    }
}
