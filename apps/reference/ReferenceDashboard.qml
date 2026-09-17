import QtQuick
import QtQuick.Layouts
import UIverse.Kit

UvPage {
    id: page

    Flickable {
        id: flick

        anchors.fill: parent
        contentWidth: width
        contentHeight: column.implicitHeight
        boundsBehavior: Flickable.StopAtBounds
        clip: true

        ColumnLayout {
            id: column

            width: flick.width
            spacing: page.t.gridGap * 1.5

            DashboardHeader { Layout.fillWidth: true }

            GridLayout {
                id: grid

                readonly property real gap: page.t.gridGap
                readonly property real columnWidth: (column.width - gap * (columns - 1)) / columns
                readonly property real rowHeight: page.t.unit * 23

                Layout.fillWidth: true
                columns: layout.columns
                columnSpacing: gap
                rowSpacing: gap

                DashboardLayout {
                    id: layout
                    mode: page.t.layoutMode
                    narrow: flick.width < page.t.unit * 90
                }

                GridCell {
                    place: layout.place("revenue")
                    columnWidth: grid.columnWidth; rowHeight: grid.rowHeight; gap: grid.gap
                    StatTile { anchors.fill: parent; spec: ({ "tile": 1 }); label: "Revenue"; value: "$48.2k"; delta: "+12.4%"; progress: 0.72 }
                }

                GridCell {
                    place: layout.place("users")
                    columnWidth: grid.columnWidth; rowHeight: grid.rowHeight; gap: grid.gap
                    StatTile { anchors.fill: parent; spec: ({ "tile": 2 }); label: "Active users"; value: "1,980"; delta: "+4.1%"; progress: 0.54 }
                }

                GridCell {
                    place: layout.place("sessions")
                    columnWidth: grid.columnWidth; rowHeight: grid.rowHeight; gap: grid.gap
                    StatTile { anchors.fill: parent; spec: ({ "tile": 3 }); label: "Avg. session"; value: "2m 47s"; delta: "−0.8%"; positive: false; progress: 0.38 }
                }

                GridCell {
                    place: layout.place("churn")
                    columnWidth: grid.columnWidth; rowHeight: grid.rowHeight; gap: grid.gap
                    StatTile { anchors.fill: parent; spec: ({ "tile": 4 }); label: "Churn"; value: "3.2%"; delta: "−1.1%"; progress: 0.18 }
                }

                GridCell {
                    place: layout.place("chart")
                    columnWidth: grid.columnWidth; rowHeight: grid.rowHeight; gap: grid.gap
                    BarChart {
                        anchors.fill: parent
                        spec: ({ "tile": 5 })
                        title: "Weekly engagement"
                        caption: "12 weeks"
                        values: DashboardData.engagement
                    }
                }

                GridCell {
                    place: layout.place("activity")
                    columnWidth: grid.columnWidth; rowHeight: grid.rowHeight; gap: grid.gap
                    ActivityList {
                        anchors.fill: parent
                        spec: ({ "tile": 6 })
                        title: "Recent activity"
                        entries: DashboardData.activity
                    }
                }

                GridCell {
                    place: layout.place("controls")
                    columnWidth: grid.columnWidth; rowHeight: grid.rowHeight; gap: grid.gap
                    ControlsPanel { anchors.fill: parent; spec: ({ "tile": 0 }) }
                }
            }
        }
    }
}
