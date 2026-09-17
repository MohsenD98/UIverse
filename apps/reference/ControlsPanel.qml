import QtQuick
import QtQuick.Layouts
import UIverse.Core
import UIverse.Kit

UvSurface {
    id: panel

    padding: t.unit * 2.5

    ColumnLayout {
        anchors.fill: parent
        spacing: panel.t.unit * 1.5

        UvLabel {
            Layout.fillWidth: true
            role: "heading"
            text: "Preferences"
        }

        UvTextField {
            Layout.fillWidth: true
            placeholderText: "Workspace name"
        }

        UvSwitch {
            text: "Weekly digest"
            checked: true
        }

        UvSwitch {
            text: "Anomaly alerts"
        }

        RowLayout {
            Layout.fillWidth: true

            UvLabel {
                Layout.fillWidth: true
                role: "label"
                muted: true
                text: "Sampling rate"
            }

            UvLabel {
                role: "mono"
                text: Math.round(sampling.value) + "%"
            }
        }

        UvSlider {
            id: sampling
            Layout.fillWidth: true
            from: 0
            to: 100
            value: 64
        }

        Item { Layout.fillHeight: true }

        RowLayout {
            Layout.fillWidth: true
            spacing: panel.t.unit

            Item { Layout.fillWidth: true }

            UvButton {
                text: "Discard"
                variant: "ghost"
            }

            UvButton {
                text: "Save changes"
            }
        }
    }
}
