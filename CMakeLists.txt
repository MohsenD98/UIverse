cmake_minimum_required(VERSION 3.16)

project(UIverse VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick QuickControls2)

qt_standard_project_setup(REQUIRES 6.8)

set(QT_QML_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/qml)

add_subdirectory(core)
add_subdirectory(kit)
add_subdirectory(styles)
add_subdirectory(apps)

qt_add_executable(appUIverse
    main.cpp
)

qt_add_qml_module(appUIverse
    URI UIverse
    VERSION 1.0
    QML_FILES
        Main.qml
)

set_target_properties(appUIverse PROPERTIES
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appUIverse PRIVATE
    Qt6::Quick
    Qt6::QuickControls2
    UIverseCoreplugin
    UIverseKitplugin
    UIverseStylesplugin
    UIverseAppsplugin
)

install(TARGETS appUIverse
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
