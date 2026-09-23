pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import UIverse.Kit

UvPage {
    id: page

    Flickable {
        id: scroller

        anchors.fill: parent
        contentWidth: width
        contentHeight: content.implicitHeight
        boundsBehavior: Flickable.StopAtBounds
        clip: true

        ColumnLayout {
            id: content

            width: scroller.width
            spacing: page.tokens.gridGap * 1.5

            DashboardHeader {
                Layout.fillWidth: true
            }

            GridLayout {
                Layout.fillWidth: true
                columns: layout.columns
                columnSpacing: layout.gap
                rowSpacing: layout.gap

                DashboardLayout {
                    id: layout

                    mode: page.tokens.layoutMode
                    availableWidth: content.width
                    gap: page.tokens.gridGap
                    rowHeight: page.tokens.unit * 23
                    narrowBelow: page.tokens.unit * 90
                }

                Repeater {
                    model: DashboardData.stats

                    GridCell {
                        id: statCell

                        required property var modelData
                        required property int index

                        layout: layout
                        area: modelData.area

                        StatTile {
                            anchors.fill: parent
                            hints: ({
                                    "tile": statCell.index + 1
                                })
                            label: statCell.modelData.label
                            value: statCell.modelData.value
                            delta: statCell.modelData.delta
                            positive: statCell.modelData.positive
                            progress: statCell.modelData.progress
                        }
                    }
                }

                GridCell {
                    layout: layout
                    area: "chart"

                    BarChart {
                        anchors.fill: parent
                        hints: ({
                                "tile": 5
                            })
                        title: "Weekly engagement"
                        caption: "12 weeks"
                        values: DashboardData.engagement
                    }
                }

                GridCell {
                    layout: layout
                    area: "activity"

                    ActivityList {
                        anchors.fill: parent
                        hints: ({
                                "tile": 6
                            })
                        title: "Recent activity"
                        entries: DashboardData.activity
                    }
                }

                GridCell {
                    layout: layout
                    area: "controls"

                    ControlsPanel {
                        anchors.fill: parent
                        hints: ({
                                "tile": 0
                            })
                    }
                }
            }
        }
    }
}
