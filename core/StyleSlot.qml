import QtQuick

Loader {
    property Item control
    property string variant: "default"
    property var hints: ({})

    visible: status === Loader.Ready
}
