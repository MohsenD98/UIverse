qt_add_library(UIverseStyleGlassmorphism STATIC)

qt_add_qml_module(UIverseStyleGlassmorphism
    URI UIverse.Styles.Glassmorphism
    VERSION 1.0
    QML_FILES
        GlassmorphismPack.qml
        about.mjs
        Aurora.qml
        GlassPanel.qml
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

target_link_libraries(UIverseStyleGlassmorphism PRIVATE UIverseCoreplugin)
