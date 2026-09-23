qt_add_library(UIverseShell STATIC)

set_source_files_properties(ShellTheme.qml PROPERTIES QT_QML_SINGLETON_TYPE TRUE)

qt_add_qml_module(UIverseShell
    URI UIverse.Shell
    VERSION 1.0
    QML_FILES
        ShellTheme.qml
        ShellText.qml
        ShellButton.qml
        LabRoot.qml
        GalleryView.qml
        StyleCard.qml
        Workbench.qml
        StylePicker.qml
        RulesPanel.qml
        RulesSection.qml
        LawsSection.qml
        ContrastSection.qml
)

target_link_libraries(UIverseShell PRIVATE
    UIverseCoreplugin
    UIverseKitplugin
    UIverseStylesplugin
    UIverseAppsplugin
)
