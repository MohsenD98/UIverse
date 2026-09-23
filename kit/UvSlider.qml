import QtQuick
import QtQuick.Templates as T
import UIverse.Core

T.Slider {
    id: slider

    property var hints: ({})
    readonly property Tokens tokens: Style.tokens

    implicitWidth: 180
    implicitHeight: Math.max(tokens.unit * 3, handle ? handle.implicitHeight : 0)
    padding: 0
    hoverEnabled: true

    background: StyleSlot {
        control: slider
        hints: slider.hints
        x: slider.leftPadding
        y: (slider.height - height) / 2
        width: slider.availableWidth
        height: implicitHeight
        sourceComponent: Style.pack ? Style.pack.sliderGroove : null
    }

    handle: StyleSlot {
        control: slider
        hints: slider.hints
        x: slider.leftPadding + slider.visualPosition * (slider.availableWidth - width)
        y: (slider.height - height) / 2
        sourceComponent: Style.pack ? Style.pack.sliderHandle : null
    }
}
