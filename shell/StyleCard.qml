pragma ComponentBehavior: Bound
import QtQuick
import UIverse.Core

Rectangle {
    id: card

    required property StylePack pack
    signal activated

    readonly property Tokens theme: ShellTheme.tokens
    readonly property Tokens p: pack.tokens

    implicitWidth: theme.unit * 38
    implicitHeight: theme.unit * 28
    radius: theme.radiusLg
    color: hover.hovered ? theme.surfaceAlt : theme.surface
    border.width: theme.borderWidth
    border.color: hover.hovered || activeFocus ? pack.swatch : theme.border
    activeFocusOnTab: true

    Behavior on color {
        ColorAnimation {
            duration: card.theme.durationFast
        }
    }
    Behavior on border.color {
        ColorAnimation {
            duration: card.theme.durationFast
        }
    }

    Keys.onReturnPressed: activated()
    Keys.onSpacePressed: activated()

    HoverHandler {
        id: hover
        cursorShape: Qt.PointingHandCursor
    }
    TapHandler {
        onTapped: card.activated()
    }

    Rectangle {
        id: preview
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
        }
        anchors.margins: card.theme.borderWidth
        height: card.theme.unit * 15
        topLeftRadius: card.radius
        topRightRadius: card.radius
        color: card.p.background
        clip: true

        Column {
            anchors.centerIn: parent
            spacing: card.theme.unit

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Aa"
                color: card.p.text
                font.family: card.p.displayFamily
                font.pixelSize: card.p.displaySize
                font.weight: card.p.weightDisplay
                font.letterSpacing: card.p.letterSpacingDisplay
            }

            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: card.theme.unit * 0.75

                Repeater {
                    model: card.p.palette

                    Rectangle {
                        id: swatch

                        required property color modelData

                        width: card.theme.unit * 3
                        height: card.theme.unit
                        radius: Math.min(height / 2, card.p.radiusSm)
                        color: swatch.modelData
                    }
                }
            }
        }
    }

    Column {
        anchors {
            left: parent.left
            right: parent.right
            top: preview.bottom
        }
        anchors.margins: card.theme.unit * 2
        spacing: card.theme.unit * 0.5

        ShellText {
            role: "heading"
            text: card.pack.name
        }

        ShellText {
            width: parent.width
            role: "small"
            muted: true
            text: card.pack.tagline
            wrapMode: Text.WordWrap
            maximumLineCount: 2
            elide: Text.ElideRight
        }
    }
}
