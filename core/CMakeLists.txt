qt_add_library(UIverseCore STATIC)

target_link_libraries(UIverseCore PRIVATE UIverseFontsplugin)

set_source_files_properties(Style.qml PROPERTIES QT_QML_SINGLETON_TYPE TRUE)

target_link_libraries(UIverseCore PRIVATE UIverseFontsplugin)

qt_add_qml_module(UIverseCore
    URI UIverse.Core
    VERSION 1.0
    QML_FILES
        Tokens.qml
        StylePack.qml
        StyleSlot.qml
        Style.qml
        SlotRect.qml
        SlotText.qml
        BackdropSample.qml
)

target_link_libraries(UIverseCore PRIVATE UIverseFontsplugin)
