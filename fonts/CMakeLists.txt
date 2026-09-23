qt_add_library(UIverseFonts STATIC)

set_source_files_properties(Fonts.qml PROPERTIES QT_QML_SINGLETON_TYPE TRUE)

qt_add_qml_module(UIverseFonts
    URI UIverse.Fonts
    VERSION 1.0
    QML_FILES
        Fonts.qml
    RESOURCES
        Inter.ttf
        ArchivoBlack.ttf
        SpaceGrotesk.ttf
        JetBrainsMono.ttf
)
