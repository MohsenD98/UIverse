pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import UIverse.Kit

UvSurface {
    id: chart

    property string title
    property string caption
    property var values: []

    readonly property real peak: values.length ? Math.max(...values) : 1

    padding: t.unit * 2.5

    ColumnLayout {
        anchors.fill: parent
        spacing: chart.t.unit * 2

        RowLayout {
            Layout.fillWidth: true

            UvLabel {
                Layout.fillWidth: true
                role: "heading"
                text: chart.title
            }

            UvTag { text: chart.caption }
        }

        RowLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: chart.t.unit

            Repeater {
                model: chart.values

                Item {
                    id: bar

                    required property real modelData
                    required property int index

                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    UvSurface {
                        anchors.bottom: parent.bottom
                        width: parent.width
                        height: Math.max(chart.t.unit, bar.height * bar.modelData / chart.peak)
                        padding: 0
                        variant: bar.index === chart.values.length - 1 ? "accent" : "default"

                        Behavior on height {
                            NumberAnimation { duration: chart.t.durationBase; easing.type: chart.t.easingType }
                        }
                    }
                }
            }
        }
    }
}
