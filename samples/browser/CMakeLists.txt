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

add_executable(browser ${GAMEPLAY_EXE_TARGET}
    src/Audio3DSample.cpp
    src/Audio3DSample.h
    src/AudioSample.cpp
    src/AudioSample.h
    src/BillboardSample.cpp
    src/BillboardSample.h
    src/FirstPersonCamera.cpp
    src/FirstPersonCamera.h
    src/FontSample.cpp
    src/FontSample.h
    src/FormsSample.cpp
    src/FormsSample.h
    src/GamepadSample.cpp
    src/GamepadSample.h
    src/GestureSample.cpp
    src/GestureSample.h
    src/Grid.cpp
    src/Grid.h
    src/InputSample.cpp
    src/InputSample.h
    src/LightSample.cpp
    src/LightSample.h
    src/MeshBatchSample.cpp
    src/MeshBatchSample.h
    src/MeshPrimitiveSample.cpp
    src/MeshPrimitiveSample.h
    src/ParticlesSample.cpp
    src/ParticlesSample.h
    src/PhysicsCollisionObjectSample.cpp
    src/PhysicsCollisionObjectSample.h
    src/PostProcessSample.cpp
    src/PostProcessSample.h
    src/Sample.cpp
    src/Sample.h
    src/SamplesGame.cpp
    src/SamplesGame.h
    src/SceneCreateSample.cpp
    src/SceneCreateSample.h
    src/SceneLoadSample.cpp
    src/SceneLoadSample.h
    src/SpriteBatchSample.cpp
    src/SpriteBatchSample.h
    src/SpriteSample.cpp
    src/SpriteSample.h
    src/TerrainSample.cpp
    src/TerrainSample.h
    src/TextureSample.cpp
    src/TextureSample.h
    src/TriangleSample.cpp
    src/TriangleSample.h
    src/WaterSample.cpp
    src/WaterSample.h)

#------------------------------------------------------------------------------

target_link_libraries(browser
  PRIVATE
    gameplay
)

#------------------------------------------------------------------------------

set_target_properties(browser
  PROPERTIES
    CXX_STANDARD 17
)

#------------------------------------------------------------------------------

if(${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
    MESSAGE("Game name is ${GAME_NAME}")
    COPY_RES_MAC(GAME_RES ${CMAKE_SOURCE_DIR}/samples/browser res/*)
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
    set( PLIST_TEMPLATE ${GAME_NAME}-macosx.plist )
endif(${CMAKE_SYSTEM_NAME} MATCHES "Darwin")

#------------------------------------------------------------------------------

