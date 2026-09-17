import QtQuick
import QtQuick.Effects
import UIverse.Core

SlotRect {
    id: panel

    property real corner: t.radiusLg
    property color tint: t.surface
    property color rim: t.border
    property bool raised: true

    RectangularShadow {
        anchors.fill: parent
        visible: panel.raised
        offset.y: panel.t.shadowOffsetY
        radius: panel.corner
        blur: panel.t.shadowBlur
        spread: -panel.t.unit
        color: Qt.alpha(panel.t.shadowColor, panel.t.shadowOpacity)
    }

    BackdropSample {
        id: sample
        anchors.fill: parent
    }

    Rectangle {
        id: shape
        anchors.fill: parent
        radius: panel.corner
    }

    ShaderEffectSource {
        id: sampleTexture
        anchors.fill: parent
        sourceItem: sample
        hideSource: true
        visible: false
    }

    ShaderEffectSource {
        id: maskTexture
        anchors.fill: parent
        sourceItem: shape
        hideSource: true
        visible: false
    }

    MultiEffect {
        anchors.fill: parent
        source: sampleTexture
        maskEnabled: true
        maskSource: maskTexture
        maskThresholdMin: 0.5
        maskSpreadAtMin: 1.0
    }

    Rectangle {
        anchors.fill: parent
        radius: panel.corner
        border.width: panel.t.borderWidth
        border.color: panel.rim
        gradient: Gradient {
            GradientStop { position: 0; color: Qt.tint(panel.tint, Qt.alpha(panel.t.text, 0.06)) }
            GradientStop { position: 1; color: panel.tint }
        }
    }
}
