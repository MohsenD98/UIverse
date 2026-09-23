import QtQuick
import UIverse.Core

Item {
    id: page

    readonly property Tokens tokens: Style.tokens

    default property alias content: contentArea.data

    Item {
        id: backdrop

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
            part: "pageBackground"
        }
    }

    Item {
        id: contentArea

        anchors.fill: parent
        anchors.margins: page.tokens.pagePadding
    }

    Component.onCompleted: Style.backdrop = backdrop
    Component.onDestruction: {
        if (Style.backdrop === backdrop)
            Style.backdrop = null
    }
}
