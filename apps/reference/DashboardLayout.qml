import QtQuick

QtObject {
    property string mode: "stack"
    property real availableWidth: 0
    property real gap: 0
    property real rowHeight: 0
    property real narrowBelow: 0

    readonly property bool narrow: availableWidth < narrowBelow
    readonly property int columns: narrow ? 2 : 4
    readonly property real columnWidth: (availableWidth - gap * (columns - 1)) / columns

    readonly property var bento: ({
            "revenue": [0, 0, 2, 2],
            "users": [0, 2, 1, 1],
            "sessions": [0, 3, 1, 1],
            "churn": [1, 2, 1, 2],
            "chart": [2, 0, 2, 2],
            "controls": [2, 2, 2, 2],
            "activity": [4, 0, 2, 4]
        })

    readonly property var stack: ({
            "revenue": [0, 0, 1, 1],
            "users": [0, 1, 1, 1],
            "sessions": [0, 2, 1, 1],
            "churn": [0, 3, 1, 1],
            "chart": [1, 0, 2, 4],
            "activity": [3, 0, 3, 2],
            "controls": [3, 2, 3, 2]
        })

    readonly property var compact: ({
            "revenue": [0, 0, 1, 1],
            "users": [0, 1, 1, 1],
            "sessions": [1, 0, 1, 1],
            "churn": [1, 1, 1, 1],
            "chart": [2, 0, 2, 2],
            "activity": [4, 0, 3, 2],
            "controls": [7, 0, 3, 2]
        })

    function place(area: string): var {
        const table = narrow ? compact : mode === "bento" ? bento : stack
        return table[area]
    }
}
