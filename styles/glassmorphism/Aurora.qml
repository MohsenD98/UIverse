pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Effects
import UIverse.Core

Item {
    id: aurora

    readonly property Tokens t: Style.t
    readonly property real downscale: 4
    readonly property var anchorsX: [0.12, 0.78, 0.42, 0.9]
    readonly property var anchorsY: [0.15, 0.2, 0.85, 0.7]
    property real phase

    NumberAnimation on phase {
        from: 0
        to: Math.PI * 2
        duration: 40000
        loops: Animation.Infinite
    }

    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop {
                position: 0
                color: aurora.t.bg
            }
            GradientStop {
                position: 1
                color: aurora.t.bgAlt
            }
        }
    }

    Item {
        id: blobs

        width: aurora.width / aurora.downscale
        height: aurora.height / aurora.downscale

        Repeater {
            model: aurora.t.palette

            Rectangle {
                id: blob

                required property var modelData
                required property int index

                readonly property real size: Math.max(blobs.width, blobs.height) * 0.5

                width: size
                height: size
                radius: size / 2
                color: modelData
                opacity: 0.75
                x: blobs.width * aurora.anchorsX[blob.index % 4] - blob.size / 2 + Math.cos(aurora.phase + blob.index * 1.7) * blob.size * 0.18
                y: blobs.height * aurora.anchorsY[blob.index % 4] - blob.size / 2 + Math.sin(aurora.phase + blob.index * 2.3) * blob.size * 0.14
            }
        }
    }

    ShaderEffectSource {
        id: blobTexture
        width: blobs.width
        height: blobs.height
        sourceItem: blobs
        hideSource: true
        visible: false
    }

    MultiEffect {
        width: blobs.width
        height: blobs.height
        scale: aurora.downscale
        transformOrigin: Item.TopLeft
        source: blobTexture
        autoPaddingEnabled: false
        blurEnabled: true
        blurMax: 48
        blur: 1
    }
}
