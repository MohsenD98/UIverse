pragma ComponentBehavior: Bound
import QtQuick
import UIverse.Core

Rectangle {
    id: card

    required property StylePack pack
    signal activated()

    readonly property Tokens s: ShellTheme.t
    readonly property Tokens p: pack.tokens

    implicitWidth: s.unit * 38
    implicitHeight: s.unit * 28
    radius: s.radiusLg
    color: hover.hovered ? s.surfaceAlt : s.surface
    border.width: s.borderWidth
    border.color: hover.hovered || activeFocus ? pack.swatch : s.border
    activeFocusOnTab: true

    Behavior on color { ColorAnimation { duration: card.s.durationFast } }
    Behavior on border.color { ColorAnimation { duration: card.s.durationFast } }

    Keys.onReturnPressed: activated()
    Keys.onSpacePressed: activated()

    HoverHandler { id: hover; cursorShape: Qt.PointingHandCursor }
    TapHandler { onTapped: card.activated() }

    Rectangle {
        id: preview
        anchors { left: parent.left; right: parent.right; top: parent.top }
        anchors.margins: card.s.borderWidth
        height: card.s.unit * 15
        topLeftRadius: card.radius
        topRightRadius: card.radius
        color: card.p.bg
        clip: true

        Column {
            anchors.centerIn: parent
            spacing: card.s.unit

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
                spacing: card.s.unit * 0.75

                Repeater {
                    model: card.p.palette

                    Rectangle {
                        id: swatch

                        required property color modelData

                        width: card.s.unit * 3
                        height: card.s.unit
                        radius: Math.min(height / 2, card.p.radiusSm)
                        color: swatch.modelData
                    }
                }
            }
        }
    }

    Column {
        anchors { left: parent.left; right: parent.right; top: preview.bottom }
        anchors.margins: card.s.unit * 2
        spacing: card.s.unit * 0.5

        ShellText { role: "heading"; text: card.pack.name }

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
