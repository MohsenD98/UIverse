qt_add_library(UIverseApps STATIC)

set_source_files_properties(reference/DashboardData.qml PROPERTIES QT_QML_SINGLETON_TYPE TRUE)

qt_add_qml_module(UIverseApps
    URI UIverse.Apps
    VERSION 1.0
    QML_FILES
        reference/ReferenceDashboard.qml
        reference/DashboardHeader.qml
        reference/DashboardLayout.qml
        reference/DashboardData.qml
        reference/GridCell.qml
        reference/StatTile.qml
        reference/BarChart.qml
        reference/ActivityList.qml
        reference/ControlsPanel.qml
)

target_link_libraries(UIverseApps PRIVATE
    UIverseCoreplugin
    UIverseKitplugin
)
