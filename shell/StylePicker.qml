pragma ComponentBehavior: Bound
import QtQuick
import UIverse.Core
import UIverse.Styles

Row {
    id: picker

    property bool compact: false

    readonly property Tokens theme: ShellTheme.tokens

    spacing: theme.unit * 0.75

    ShellButton {
        text: "‹"
        enabled: StyleRegistry.packs.length > 1
        onClicked: StyleRegistry.step(-1)
    }

    Repeater {
        model: StyleRegistry.packs

        ShellButton {
            required property StylePack modelData
            required property int index

            visible: !picker.compact
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
