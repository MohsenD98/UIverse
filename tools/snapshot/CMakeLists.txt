qt_add_executable(uiverse-snapshot
    main.cpp
)

qt_add_qml_module(uiverse-snapshot
    URI UIverse.Snapshot
    VERSION 1.0
    QML_FILES
        SnapshotWindow.qml
)

target_link_libraries(uiverse-snapshot PRIVATE
    Qt6::Quick
    UIverseCoreplugin
    UIverseKitplugin
    UIverseStylesplugin
    UIverseAppsplugin
    UIverseShellplugin
)
