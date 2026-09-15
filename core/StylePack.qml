import QtQuick

QtObject {
    property string key
    property string name
    property string tagline
    property string era
    property color swatch: "#888888"

    property string summary
    property var rules: []
    property var antiRules: []
    property var reading: []

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
