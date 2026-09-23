find_package(Qt6 REQUIRED COMPONENTS QuickTest)

qt_add_executable(tst_uiverse
    main.cpp
)

target_compile_definitions(tst_uiverse PRIVATE
    QUICK_TEST_SOURCE_DIR="${CMAKE_CURRENT_SOURCE_DIR}"
)

target_link_libraries(tst_uiverse PRIVATE
    Qt6::QuickTest
    UIverseModules
)

add_test(NAME uiverse COMMAND tst_uiverse)
set_tests_properties(uiverse PROPERTIES ENVIRONMENT "QT_QPA_PLATFORM=offscreen")
