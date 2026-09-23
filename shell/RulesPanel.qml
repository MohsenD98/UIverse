pragma ComponentBehavior: Bound
import QtQuick
import UIverse.Core

Rectangle {
    id: panel

    property bool open: false
    property StylePack pack

    readonly property Tokens theme: ShellTheme.tokens

    width: Math.min(parent ? parent.width : theme.unit * 50, theme.unit * 50)
    x: parent ? (open ? parent.width - width : parent.width) : 0
    visible: x < (parent ? parent.width : 0)
    color: theme.backgroundAlt

    Behavior on x {
        NumberAnimation {
            duration: panel.theme.durationBase
            easing.type: panel.theme.easingType
        }
    }

    Rectangle {
        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
        }
        width: panel.theme.borderWidth
        color: panel.theme.border
    }

    Flickable {
        id: scroller
        anchors.fill: parent
        anchors.margins: panel.theme.unit * 3
        contentHeight: content.implicitHeight
        boundsBehavior: Flickable.StopAtBounds
        clip: true

        Column {
            id: content
            width: scroller.width
            spacing: panel.theme.unit * 3

            Column {
                width: parent.width
                spacing: panel.theme.unit

                ShellText {
                    width: parent.width
                    role: "label"
                    muted: true
                    wrapMode: Text.WordWrap
                    text: panel.pack ? panel.pack.era : ""
                }
                ShellText {
                    role: "title"
                    text: panel.pack ? panel.pack.name : ""
                }
                ShellText {
                    width: parent.width
                    text: panel.pack ? panel.pack.summary : ""
                    muted: true
                    wrapMode: Text.WordWrap
                    lineHeight: panel.theme.lineHeight
                }
            }

            RulesSection {
                width: parent.width
                title: "Do"
                marker: "+"
                markerColor: panel.theme.success
                items: panel.pack ? panel.pack.dos : []
            }

            RulesSection {
                width: parent.width
                title: "Avoid"
                marker: "−"
                markerColor: panel.theme.danger
                items: panel.pack ? panel.pack.donts : []
            }

            Column {
                width: parent.width
                spacing: panel.theme.unit
                visible: panel.pack && panel.pack.reading.length > 0

                ShellText {
                    role: "label"
                    muted: true
                    text: "Further reading"
                }

                Repeater {
                    model: panel.pack ? panel.pack.reading : []

                    ShellText {
                        id: reference

                        required property var modelData

                        width: parent.width
                        text: reference.modelData.label
                        color: panel.theme.accent
                        wrapMode: Text.WordWrap
                        font.underline: link.hovered

                        HoverHandler {
                            id: link
                            cursorShape: Qt.PointingHandCursor
                        }
                        TapHandler {
                            onTapped: Qt.openUrlExternally(reference.modelData.url)
                        }
                    }
                }
            }
        }
    }
}
