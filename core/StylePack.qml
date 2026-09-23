import QtQuick

QtObject {
    property string key
    property string name
    property color swatch: "#888888"

    property var about: ({})
    readonly property string tagline: about.tagline ?? ""
    readonly property string era: about.era ?? ""
    readonly property string summary: about.summary ?? ""
    readonly property var dos: about.dos ?? []
    readonly property var donts: about.donts ?? []
    readonly property var reading: about.reading ?? []

    property Tokens tokens: Tokens {}

    property Component pageBackground
    property Component surface
    property Component buttonBackground
    property Component buttonContent
    property Component fieldBackground
    property Component switchIndicator
    property Component sliderGroove
    property Component sliderHandle
    property Component progressTrack
    property Component tagBackground
    property Component divider
}
