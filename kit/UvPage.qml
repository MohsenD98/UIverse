import QtQuick
import UIverse.Core

Item {
    id: page

    property bool padded: true
    readonly property Tokens tokens: Style.tokens

    default property alias content: contentHost.data

    Item {
        id: backdropLayer
        anchors.fill: parent
        layer.enabled: true

        Rectangle {
            anchors.fill: parent
            color: page.tokens.background
            Behavior on color {
                ColorAnimation {
                    duration: page.tokens.durationBase
                }
            }
        }

        StyleSlot {
            anchors.fill: parent
            control: page
            sourceComponent: Style.pack ? Style.pack.pageBackground : null
        }
    }

    Item {
        id: contentHost
        anchors.fill: parent
        anchors.margins: page.padded ? page.tokens.pagePadding : 0
    }

    Component.onCompleted: Style.backdrop = backdropLayer
    Component.onDestruction: {
        if (Style.backdrop === backdropLayer)
            Style.backdrop = null
    }
}
