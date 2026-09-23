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
            "revenue": cell(0, 0, 2, 2),
            "users": cell(0, 2, 1, 1),
            "sessions": cell(0, 3, 1, 1),
            "churn": cell(1, 2, 1, 2),
            "chart": cell(2, 0, 2, 2),
            "controls": cell(2, 2, 2, 2),
            "activity": cell(4, 0, 2, 4)
        })

    readonly property var stack: ({
            "revenue": cell(0, 0, 1, 1),
            "users": cell(0, 1, 1, 1),
            "sessions": cell(0, 2, 1, 1),
            "churn": cell(0, 3, 1, 1),
            "chart": cell(1, 0, 2, 4),
            "activity": cell(3, 0, 3, 2),
            "controls": cell(3, 2, 3, 2)
        })

    readonly property var compact: ({
            "revenue": cell(0, 0, 1, 1),
            "users": cell(0, 1, 1, 1),
            "sessions": cell(1, 0, 1, 1),
            "churn": cell(1, 1, 1, 1),
            "chart": cell(2, 0, 2, 2),
            "activity": cell(4, 0, 3, 2),
            "controls": cell(7, 0, 3, 2)
        })

    function cell(row: int, column: int, rowSpan: int, columnSpan: int): var {
        return {
            "row": row,
            "column": column,
            "rowSpan": rowSpan,
            "columnSpan": columnSpan
        }
    }

    function place(area: string): var {
        if (narrow)
            return compact[area]
        return mode === "bento" ? bento[area] : stack[area]
    }
}
