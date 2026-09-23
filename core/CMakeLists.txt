qt_add_library(UIverseCore STATIC)

set_source_files_properties(Style.qml PROPERTIES QT_QML_SINGLETON_TYPE TRUE)

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
        FillTrack.qml
        BackdropSample.qml
)

target_link_libraries(UIverseCore PRIVATE UIverseFontsplugin)
