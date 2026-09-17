import QtQuick
import QtQuick.Layouts

Item {
    id: cell

    property var place: [0, 0, 1, 1]
    property real columnWidth: 0
    property real rowHeight: 0
    property real gap: 0

    default property alias content: holder.data

    Layout.row: place[0]
    Layout.column: place[1]
    Layout.rowSpan: place[2]
    Layout.columnSpan: place[3]
    Layout.preferredWidth: columnWidth * place[3] + gap * (place[3] - 1)
    Layout.preferredHeight: rowHeight * place[2] + gap * (place[2] - 1)

    Item {
        id: holder
        anchors.fill: parent
    }
}
