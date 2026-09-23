import QtQuick
import QtQuick.Effects
import UIverse.Core

SlotRect {
    id: panel

    property real cornerRadius: tokens.radiusLg
    property color tintColor: tokens.surface
    property color rimColor: tokens.border
    property bool raised: true

    RectangularShadow {
        anchors.fill: parent
        visible: panel.raised
        offset.y: panel.tokens.shadowOffsetY
        radius: panel.cornerRadius
        blur: panel.tokens.shadowBlur
        spread: -panel.tokens.unit
        color: Qt.alpha(panel.tokens.shadowColor, panel.tokens.shadowOpacity)
    }

    BackdropSample {
        id: sample
        anchors.fill: parent
    }

    Rectangle {
        id: shape
        anchors.fill: parent
        radius: panel.cornerRadius
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
        radius: panel.cornerRadius
        border.width: panel.tokens.borderWidth
        border.color: panel.rimColor
        gradient: Gradient {
            GradientStop {
                position: 0
                color: Qt.tint(panel.tintColor, Qt.alpha(panel.tokens.text, 0.06))
            }
            GradientStop {
                position: 1
                color: panel.tintColor
            }
        }
    }
}
