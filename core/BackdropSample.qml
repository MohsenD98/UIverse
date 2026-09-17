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
        if (p.x !== originX)
            originX = p.x
        if (p.y !== originY)
            originY = p.y
    }

    clip: true

    Component.onCompleted: resync()

    FrameAnimation {
        running: sample.source !== null && sample.width > 0
        onTriggered: sample.resync()
    }

    ShaderEffectSource {
        id: grab
        visible: false
        x: -sample.pad
        y: -sample.pad
        width: Math.max(1, sample.width + sample.pad * 2)
        height: Math.max(1, sample.height + sample.pad * 2)
        sourceItem: sample.source
        sourceRect: Qt.rect(sample.originX - sample.pad, sample.originY - sample.pad, width, height)
        live: true
        recursive: false
    }

    MultiEffect {
        anchors.fill: grab
        visible: sample.source !== null
        source: grab
        autoPaddingEnabled: false
        blurEnabled: sample.blurRadius > 0
        blurMax: 64
        blur: Math.min(1.0, sample.blurRadius / 64)
    }
}
