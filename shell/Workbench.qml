import QtQuick
import QtQuick.Layouts
import UIverse.Core
import UIverse.Styles
import UIverse.Apps

Rectangle {
    id: workbench

    signal back

    readonly property Tokens theme: ShellTheme.tokens

    color: theme.background
    focus: true

    Keys.onLeftPressed: StyleRegistry.step(-1)
    Keys.onRightPressed: StyleRegistry.step(1)
    Keys.onEscapePressed: {
        if (rules.open)
            rules.open = false
        else
            workbench.back()
    }
    Keys.onPressed: event => {
        if (event.key === Qt.Key_R) {
            rules.open = !rules.open
            event.accepted = true
        }
    }

    Rectangle {
        id: toolbar

        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
        }
        height: workbench.theme.controlHeight + workbench.theme.unit * 3
        color: workbench.theme.backgroundAlt

        RowLayout {
            anchors.fill: parent
            anchors.leftMargin: workbench.theme.unit * 2
            anchors.rightMargin: workbench.theme.unit * 2
            spacing: workbench.theme.unit * 2

            ShellButton {
                text: "← Gallery"
                onClicked: workbench.back()
            }

            ShellText {
                Layout.fillWidth: true
                role: "heading"
                text: StyleRegistry.current ? StyleRegistry.current.name : ""
                elide: Text.ElideRight
            }

            StylePicker {}

            ShellButton {
                text: "Rules"
                checkable: true
                checked: rules.open
                onClicked: rules.open = !rules.open
            }
        }

        Rectangle {
            anchors {
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }
            height: workbench.theme.borderWidth
            color: workbench.theme.border
        }
    }

    Item {
        id: stage

        anchors {
            left: parent.left
            right: parent.right
            top: toolbar.bottom
            bottom: parent.bottom
        }
        clip: true

        ReferenceDashboard {
            anchors.fill: parent
        }

        RulesPanel {
            id: rules
            anchors {
                top: parent.top
                bottom: parent.bottom
            }
            pack: StyleRegistry.current
        }
    }
}
