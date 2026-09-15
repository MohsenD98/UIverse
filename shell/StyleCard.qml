import QtQuick
import UIverse.Core

Rectangle {
    id: card

    required property StylePack pack
    signal activated()

    readonly property Tokens s: ShellTheme.t

    implicitWidth: 300
    implicitHeight: 220
    radius: s.radiusLg
    color: hover.hovered ? s.surfaceAlt : s.surface
    border.width: 1
    border.color: hover.hovered ? pack.swatch : s.border

    Behavior on color { ColorAnimation { duration: s.durationFast } }
    Behavior on border.color { ColorAnimation { duration: s.durationFast } }

    HoverHandler { id: hover }
    TapHandler { onTapped: card.activated() }

    Rectangle {
        id: preview
        anchors { left: parent.left; right: parent.right; top: parent.top }
        height: parent.height * 0.52
        topLeftRadius: card.radius
        topRightRadius: card.radius
        color: card.pack.tokens.bg
        clip: true

        Column {
            anchors.centerIn: parent
            spacing: card.s.unit

            Text {
                text: "Aa"
                color: card.pack.tokens.text
                font.family: card.pack.tokens.displayFamily
                font.pixelSize: card.pack.tokens.displaySize
                font.weight: card.pack.tokens.weightDisplay
                font.letterSpacing: card.pack.tokens.letterSpacingDisplay
            }

            Row {
                spacing: 6
                anchors.horizontalCenter: parent.horizontalCenter

                Repeater {
                    model: card.pack.tokens.palette

                    Rectangle {
                        required property var modelData
                        width: 22
                        height: 8
                        radius: Math.min(4, card.pack.tokens.radiusSm)
                        color: modelData
                    }
                }
            }
        }
    }

    Column {
        anchors { left: parent.left; right: parent.right; top: preview.bottom }
        anchors.margins: card.s.unit * 2
        spacing: card.s.unit * 0.5

        Text {
            text: card.pack.name
            color: card.s.text
            font.family: card.s.fontFamily
            font.pixelSize: card.s.fontSizeLg
            font.weight: Font.DemiBold
        }

        Text {
            width: parent.width
            text: card.pack.tagline
            color: card.s.textMuted
            font.family: card.s.fontFamily
            font.pixelSize: card.s.fontSizeSm
            wrapMode: Text.WordWrap
            maximumLineCount: 2
            elide: Text.ElideRight
        }
    }
}
