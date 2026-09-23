import QtQuick
import QtQuick.Templates as T
import UIverse.Core

T.Slider {
    id: slider

    property var hints: ({})

    readonly property Tokens tokens: Style.tokens

    implicitWidth: tokens.controlWidth
    implicitHeight: Math.max(Style.minimumTargetSize, handle ? handle.implicitHeight : 0)
    padding: 0
    hoverEnabled: true

    background: StyleSlot {
        control: slider
        part: "sliderGroove"
        x: slider.leftPadding
        y: (slider.height - height) / 2
        width: slider.availableWidth
        height: implicitHeight
    }

    handle: StyleSlot {
        control: slider
        part: "sliderHandle"
        x: slider.leftPadding + slider.visualPosition * (slider.availableWidth - width)
        y: (slider.height - height) / 2
    }
}
