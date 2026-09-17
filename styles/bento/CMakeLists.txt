qt_add_library(UIverseStyleBento STATIC)

qt_add_qml_module(UIverseStyleBento
    URI UIverse.Styles.Bento
    VERSION 1.0
    QML_FILES
        BentoPack.qml
        Surface.qml
        ButtonBackground.qml
        ButtonContent.qml
        Field.qml
        SwitchIndicator.qml
        SliderGroove.qml
        SliderHandle.qml
        ProgressTrack.qml
        TagBackground.qml
)

target_link_libraries(UIverseStyleBento PRIVATE UIverseCoreplugin)
