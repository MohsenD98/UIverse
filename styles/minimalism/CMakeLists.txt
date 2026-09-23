qt_add_library(UIverseStyleMinimalism STATIC)

qt_add_qml_module(UIverseStyleMinimalism
    URI UIverse.Styles.Minimalism
    VERSION 1.0
    QML_FILES
        MinimalismPack.qml
        about.mjs
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

target_link_libraries(UIverseStyleMinimalism PRIVATE UIverseCoreplugin)
