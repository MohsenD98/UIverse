pragma ComponentBehavior: Bound
import QtQuick
import UIverse.Core

Column {
    id: section

    property string title
    property color accentColor: theme.accent
    property var relations: []

    readonly property Tokens theme: ShellTheme.tokens

    spacing: theme.unit * 1.5
    visible: relations.length > 0

    ShellText {
        role: "label"
        muted: true
        text: section.title
    }

    Repeater {
        model: section.relations

        Column {
            id: relation

            required property var modelData

            readonly property var law: UxLaws.find(modelData.law)

            width: section.width
            spacing: section.theme.unit * 0.25

            ShellText {
                width: parent.width
                text: relation.law ? relation.law.name : relation.modelData.law
                color: section.accentColor
                font.weight: section.theme.weightMedium
            }

            ShellText {
                width: parent.width
                text: relation.modelData.note
                wrapMode: Text.WordWrap
                lineHeight: section.theme.lineHeight
            }
        }
    }
}
