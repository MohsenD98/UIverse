qt_add_library(UIverseStyles STATIC)

set_source_files_properties(StyleRegistry.qml PROPERTIES QT_QML_SINGLETON_TYPE TRUE)

qt_add_qml_module(UIverseStyles
    URI UIverse.Styles
    VERSION 1.0
    QML_FILES
        StyleRegistry.qml
)

target_link_libraries(UIverseStyles PRIVATE
    UIverseCoreplugin
    UIverseStyleMinimalismplugin
    UIverseStyleNeoBrutalismplugin
    UIverseStyleGlassmorphismplugin
    UIverseStyleBentoplugin
)
