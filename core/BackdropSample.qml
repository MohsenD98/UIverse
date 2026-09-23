import QtQuick
import QtQuick.Effects

Item {
    id: sample

    property Item source: Style.backdrop
    property real blurRadius: Style.tokens.blurAmount

    readonly property real maxBlurRadius: 64
    readonly property real margin: Math.ceil(blurRadius)
    property real originX: 0
    property real originY: 0

    function updateOrigin(): void {
        if (!source)
            return
        const position = sample.mapToItem(source, 0, 0)
        if (position.x !== originX)
            originX = position.x
        if (position.y !== originY)
            originY = position.y
    }

    clip: true

    Component.onCompleted: updateOrigin()

    FrameAnimation {
        running: sample.source !== null && sample.width > 0
        onTriggered: sample.updateOrigin()
    }

    ShaderEffectSource {
        id: backdropSlice

        visible: false
        x: -sample.margin
        y: -sample.margin
        width: Math.max(1, sample.width + sample.margin * 2)
        height: Math.max(1, sample.height + sample.margin * 2)
        sourceItem: sample.source
        sourceRect: Qt.rect(sample.originX - sample.margin, sample.originY - sample.margin, width, height)
        recursive: false
    }

    MultiEffect {
        anchors.fill: backdropSlice
        visible: sample.source !== null
        source: backdropSlice
        autoPaddingEnabled: false
        blurEnabled: sample.blurRadius > 0
        blurMax: sample.maxBlurRadius
        blur: Math.min(1, sample.blurRadius / sample.maxBlurRadius)
    }
}
