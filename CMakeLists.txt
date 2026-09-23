cmake_minimum_required(VERSION 3.16)

project(UIverse VERSION 0.0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.8)

set(QT_QML_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/qml)

option(UIVERSE_BUILD_TOOLS "Build developer tools such as uiverse-snapshot" ON)
option(UIVERSE_BUILD_TESTS "Build the QML test suite" ON)

add_subdirectory(fonts)
add_subdirectory(core)
add_subdirectory(kit)
add_subdirectory(styles)
add_subdirectory(apps)
add_subdirectory(shell)

if(UIVERSE_BUILD_TOOLS)
    add_subdirectory(tools/snapshot)
endif()

if(UIVERSE_BUILD_TESTS AND NOT EMSCRIPTEN)
    enable_testing()
    add_subdirectory(tests)
endif()

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
    UIverseFontsplugin
    UIverseCoreplugin
    UIverseKitplugin
    UIverseStylesplugin
    UIverseAppsplugin
    UIverseShellplugin
)

install(TARGETS appUIverse
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

if(NOT EMSCRIPTEN)
    qt_generate_deploy_qml_app_script(
        TARGET appUIverse
        OUTPUT_SCRIPT deploy_script
        NO_UNSUPPORTED_PLATFORM_ERROR
    )
    install(SCRIPT ${deploy_script})
endif()
