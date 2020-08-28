#
# This file is part of the "gameplay" project
# See "LICENSE" for license information.
#

#------------------------------------------------------------------------------

if(CMAKE_SYSTEM_NAME MATCHES Windows)
    set(GAMEPLAY_EXE_TARGET WIN32)
elseif(CMAKE_SYSTEM_NAME MATCHES Darwin)
    set(GAMEPLAY_EXE_TARGET MACOSX_BUNDLE)
endif()

#------------------------------------------------------------------------------

add_executable(racer ${GAMEPLAY_EXE_TARGET}
    src/RacerGame.cpp
    src/RacerGame.h
)

#------------------------------------------------------------------------------

target_link_libraries(racer
  PRIVATE
    gameplay
)

#------------------------------------------------------------------------------

set_target_properties(racer
  PROPERTIES
    CXX_STANDARD 17
)

#------------------------------------------------------------------------------

if(${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
    COPY_RES_MAC(GAME_RES ${CMAKE_SOURCE_DIR}/samples/racer res/*)
    COPY_RES_MAC(GAMEPLAY_RES ${CMAKE_SOURCE_DIR}/gameplay
            res/shaders/* res/ui/* res/logo_powered_white.png)
    set(Apple_Resources
            ${GAME_RES}
            ${GAMEPLAY_RES}
            game.config)
    SET(EXEC_TYPE MACOSX_BUNDLE)

    SET_SOURCE_FILES_PROPERTIES(
            game.config
            PROPERTIES
            MACOSX_PACKAGE_LOCATION Resources
    )
    set( MACOSX_BUNDLE_INFO_STRING "\"${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_PATCH}\",\nCopyright 2016 gameplay3d contributors" )
    set( MACOSX_BUNDLE_SHORT_VERSION_STRING "${VERSION_MAJOR}.${VERSION_MINOR}" )
    set( MACOSX_BUNDLE_LONG_VERSION_STRING "${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_PATCH}" )
    set( MACOSX_BUNDLE_BUNDLE_VERSION "${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_PATCH}" )
    set( MACOSX_BUNDLE_COPYRIGHT "(C) gameplay3d contributors" )
    set( PLIST_TEMPLATE sample-racer-macosx.plist )
endif(${CMAKE_SYSTEM_NAME} MATCHES "Darwin")

#------------------------------------------------------------------------------
