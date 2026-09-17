pragma ComponentBehavior: Bound
import QtQuick
import UIverse.Core

Rectangle {
    id: panel

    property bool open: false
    property StylePack pack

    readonly property Tokens s: ShellTheme.t

    width: Math.min(parent ? parent.width : s.unit * 50, s.unit * 50)
    x: parent ? (open ? parent.width - width : parent.width) : 0
    visible: x < (parent ? parent.width : 0)
    color: s.bgAlt

    Behavior on x { NumberAnimation { duration: panel.s.durationBase; easing.type: panel.s.easingType } }

    Rectangle {
        anchors { left: parent.left; top: parent.top; bottom: parent.bottom }
        width: panel.s.borderWidth
        color: panel.s.border
    }

    Flickable {
        id: flick
        anchors.fill: parent
        anchors.margins: panel.s.unit * 3
        contentHeight: content.implicitHeight
        boundsBehavior: Flickable.StopAtBounds
        clip: true

        Column {
            id: content
            width: flick.width
            spacing: panel.s.unit * 3

            Column {
                width: parent.width
                spacing: panel.s.unit

                ShellText { role: "label"; muted: true; text: panel.pack ? panel.pack.era : "" }
                ShellText { role: "title"; text: panel.pack ? panel.pack.name : "" }
                ShellText {
                    width: parent.width
                    text: panel.pack ? panel.pack.summary : ""
                    muted: true
                    wrapMode: Text.WordWrap
                    lineHeight: panel.s.lineHeight
                }
            }

            RulesSection {
                width: parent.width
                title: "Do"
                marker: "+"
                markerColor: panel.s.success
                items: panel.pack ? panel.pack.rules : []
            }

            RulesSection {
                width: parent.width
                title: "Avoid"
                marker: "−"
                markerColor: panel.s.danger
                items: panel.pack ? panel.pack.antiRules : []
            }

            Column {
                width: parent.width
                spacing: panel.s.unit
                visible: panel.pack && panel.pack.reading.length > 0

                ShellText { role: "label"; muted: true; text: "Further reading" }

                Repeater {
                    model: panel.pack ? panel.pack.reading : []

                    ShellText {
                        id: reference

                        required property var modelData

                        width: parent.width
                        text: reference.modelData.label
                        color: panel.s.accent
                        wrapMode: Text.WordWrap
                        font.underline: link.hovered

                        HoverHandler { id: link; cursorShape: Qt.PointingHandCursor }
                        TapHandler { onTapped: Qt.openUrlExternally(reference.modelData.url) }
                    }
                }
            }
        }
    }
}
