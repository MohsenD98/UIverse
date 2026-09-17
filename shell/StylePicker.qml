import QtQuick
import UIverse.Core
import UIverse.Styles

Row {
    id: picker

    readonly property Tokens s: ShellTheme.t

    spacing: s.unit * 0.75

    ShellButton {
        text: "‹"
        enabled: StyleRegistry.packs.length > 1
        onClicked: StyleRegistry.step(-1)
    }

    Repeater {
        model: StyleRegistry.packs

        ShellButton {
            required property var modelData
            required property int index

            text: modelData.name
            checkable: true
            checked: index === StyleRegistry.currentIndex
            onClicked: StyleRegistry.currentIndex = index
        }
    }

    ShellButton {
        text: "›"
        enabled: StyleRegistry.packs.length > 1
        onClicked: StyleRegistry.step(1)
    }
}
