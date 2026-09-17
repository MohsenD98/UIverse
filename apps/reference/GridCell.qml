import QtQuick
import QtQuick.Layouts

Item {
    id: cell

    required property DashboardLayout layout
    required property string area

    readonly property var place: layout.place(area)

    default property alias content: holder.data

    Layout.row: place[0]
    Layout.column: place[1]
    Layout.rowSpan: place[2]
    Layout.columnSpan: place[3]
    Layout.preferredWidth: layout.columnWidth * place[3] + layout.gap * (place[3] - 1)
    Layout.preferredHeight: layout.rowHeight * place[2] + layout.gap * (place[2] - 1)

    Item {
        id: holder
        anchors.fill: parent
    }
}
