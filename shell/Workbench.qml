import QtQuick
import QtQuick.Layouts
import UIverse.Core
import UIverse.Styles
import UIverse.Apps

Rectangle {
    id: bench

    signal back()

    readonly property Tokens s: ShellTheme.t

    color: s.bg
    focus: true

    Keys.onLeftPressed: StyleRegistry.step(-1)
    Keys.onRightPressed: StyleRegistry.step(1)
    Keys.onEscapePressed: rules.open ? rules.open = false : bench.back()
    Keys.onPressed: event => {
        if (event.key === Qt.Key_R) {
            rules.open = !rules.open
            event.accepted = true
        }
    }

    Rectangle {
        id: bar

        anchors { left: parent.left; right: parent.right; top: parent.top }
        height: bench.s.controlHeight + bench.s.unit * 3
        color: bench.s.bgAlt

        RowLayout {
            anchors.fill: parent
            anchors.leftMargin: bench.s.unit * 2
            anchors.rightMargin: bench.s.unit * 2
            spacing: bench.s.unit * 2

            ShellButton {
                text: "← Gallery"
                onClicked: bench.back()
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
            anchors { left: parent.left; right: parent.right; bottom: parent.bottom }
            height: bench.s.borderWidth
            color: bench.s.border
        }
    }

    Item {
        id: stage

        anchors { left: parent.left; right: parent.right; top: bar.bottom; bottom: parent.bottom }
        clip: true

        ReferenceDashboard { anchors.fill: parent }

        RulesPanel {
            id: rules
            anchors { top: parent.top; bottom: parent.bottom }
            pack: StyleRegistry.current
        }
    }
}
