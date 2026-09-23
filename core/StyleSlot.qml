import QtQuick

Loader {
    required property var control
    required property string part

    readonly property string variant: control?.variant ?? "default"
    readonly property var hints: control?.hints ?? ({})

    sourceComponent: Style.pack ? Style.pack[part] : null
    visible: status === Loader.Ready
}
