import QtQuick
import QtQuick.Effects

Item {
    id: sample

    property Item source: Style.backdrop
    property real blurRadius: Style.t.blurAmount

    readonly property real pad: Math.ceil(blurRadius)
    property real originX: 0
    property real originY: 0

    function resync(): void {
        if (!source)
            return
        const p = sample.mapToItem(source, 0, 0)
        originX = p.x
        originY = p.y
    }

    clip: true

    onXChanged: resync()
    onYChanged: resync()
    onWidthChanged: resync()
    onHeightChanged: resync()
    onSourceChanged: resync()
    Component.onCompleted: resync()

    ShaderEffectSource {
        id: grab
        visible: false
        x: -sample.pad
        y: -sample.pad
        width: Math.max(1, sample.width + sample.pad * 2)
        height: Math.max(1, sample.height + sample.pad * 2)
        sourceItem: sample.source
        sourceRect: Qt.rect(sample.originX - sample.pad, sample.originY - sample.pad,
                            width, height)
        live: true
        recursive: false
    }

    MultiEffect {
        anchors.fill: grab
        visible: sample.source !== null
        source: grab
        blurEnabled: sample.blurRadius > 0
        blurMax: 64
        blur: Math.min(1.0, sample.blurRadius / 64)
    }
}
