qt_add_library(UIverseKit STATIC)

qt_add_qml_module(UIverseKit
    URI UIverse.Kit
    VERSION 1.0
    QML_FILES
        UvPage.qml
        UvSurface.qml
        UvLabel.qml
        UvButton.qml
        UvTextField.qml
        UvSwitch.qml
        UvSlider.qml
        UvProgressBar.qml
        UvTag.qml
        UvDivider.qml
)

target_link_libraries(UIverseKit PRIVATE UIverseCoreplugin)
