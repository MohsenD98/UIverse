qt_add_library(UIverseStyleNeoBrutalism STATIC)

qt_add_qml_module(UIverseStyleNeoBrutalism
    URI UIverse.Styles.NeoBrutalism
    VERSION 1.0
    QML_FILES
        NeoBrutalismPack.qml
        about.mjs
        HardBox.qml
        HardTrack.qml
        DotGrid.qml
        Surface.qml
        ButtonBackground.qml
        ButtonContent.qml
        FieldBackground.qml
        SwitchIndicator.qml
        SliderGroove.qml
        SliderHandle.qml
        ProgressTrack.qml
        TagBackground.qml
)

target_link_libraries(UIverseStyleNeoBrutalism PRIVATE UIverseCoreplugin UIverseFontsplugin)
