cmake_minimum_required(VERSION 3.16)
project(DrinkDispenserUI VERSION 1.0 LANGUAGES C CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

find_package(QT NAMES Qt5 Qt6 REQUIRED COMPONENTS Core)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Gui Quick QuickControls2)

qt_standard_project_setup()

qt_add_executable(DrinkDispenserUI WIN32 MACOSX_BUNDLE
    Controllers/systemcontroller.cpp Controllers/systemcontroller.h
    main.cpp
)
target_link_libraries(DrinkDispenserUI PRIVATE
    Qt::Core
    Qt::Gui
    Qt::Quick
    Qt::QuickControls2
)


# Resources:
set(qml_resource_files
    "UI/Assets/coffee-beans.png"
    "UI/Assets/coffee-cup.png"
    "UI/Assets/cold.png"
    "UI/Assets/drop.png"
    "UI/Assets/hot.png"
    "UI/Assets/previousCold.png"
    "UI/Assets/previousHot.png"
    "UI/Assets/resetCold.png"
    "UI/Assets/resetHot.png"
    "UI/Assets/snowflake.png"
    "UI/Assets/soda.png"
    "UI/Assets/softdrinks.png"
    "UI/Assets/tea.png"
    "UI/Assets/tickCold.png"
    "UI/Assets/tickHot.png"
    "UI/Assets/wifi.png"
    "UI/DispensingScreen.qml"
    "UI/DrinkSizePage.qml"
    "UI/DrinkTypePage.qml"
    "UI/FinishScreen.qml"
    "UI/HotColdSelectionScreen.qml"
    "UI/StatusBar.qml"
    "UI/main.qml"
)

qt_add_resources(DrinkDispenserUI "qml"
    PREFIX
        "/"
    FILES
        ${qml_resource_files}
)

install(TARGETS DrinkDispenserUI
    BUNDLE DESTINATION .
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

qt_generate_deploy_app_script(
    TARGET DrinkDispenserUI
    FILENAME_VARIABLE deploy_script
    NO_UNSUPPORTED_PLATFORM_ERROR
)
install(SCRIPT ${deploy_script})
