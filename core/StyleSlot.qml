import QtQuick

Loader {
    property Item ctl
    property string variant: "default"
    property var spec: ({})

    asynchronous: false
    visible: status === Loader.Ready
}
