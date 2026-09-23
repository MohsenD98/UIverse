import QtQuick
import QtQuick.Layouts

Item {
    id: cell

    required property DashboardLayout layout
    required property string area

    readonly property var place: layout.place(area)

    default property alias content: contentArea.data

    Layout.row: place.row
    Layout.column: place.column
    Layout.rowSpan: place.rowSpan
    Layout.columnSpan: place.columnSpan
    Layout.preferredWidth: layout.columnWidth * place.columnSpan + layout.gap * (place.columnSpan - 1)
    Layout.preferredHeight: layout.rowHeight * place.rowSpan + layout.gap * (place.rowSpan - 1)

    Item {
        id: contentArea

        anchors.fill: parent
    }
}
