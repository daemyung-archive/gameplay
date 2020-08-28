#
# This file is part of the "gameplay" project
# See "LICENSE" for license information.
#

#------------------------------------------------------------------------------

add_library(external INTERFACE)

#------------------------------------------------------------------------------

include(FindLua)

#------------------------------------------------------------------------------

find_package(Bullet CONFIG REQUIRED)

target_include_directories(external
  INTERFACE
    ${BULLET_INCLUDE_DIR}
)

target_compile_definitions(external
  INTERFACE
    ${BULLET_DEFINITIONS}
)

target_link_libraries(external
  INTERFACE
    ${BULLET_LIBRARIES}
)
#
#message( hmhmhm + ${BULLET_DEFINITIONS})

#------------------------------------------------------------------------------

find_package(OpenAL CONFIG REQUIRED)

target_link_libraries(external
  INTERFACE
    OpenAL::OpenAL
)

#------------------------------------------------------------------------------

find_package(Lua REQUIRED)

target_include_directories(external
  INTERFACE
    ${LUA_INCLUDE_DIR}
)

target_compile_definitions(external
  INTERFACE
    LUA_COMPAT_APIINTCASTS
)

target_link_libraries(external
  INTERFACE
    ${LUA_LIBRARIES}
)

#------------------------------------------------------------------------------

find_package(Vorbis CONFIG REQUIRED)

target_link_libraries(external
  INTERFACE
    Vorbis::vorbis
    Vorbis::vorbisenc
    Vorbis::vorbisfile
)

#------------------------------------------------------------------------------

find_package(GLEW REQUIRED)

target_link_libraries(external
  INTERFACE
    GLEW::glew
)

#------------------------------------------------------------------------------

find_package(libpng CONFIG REQUIRED)

target_link_libraries(external
  INTERFACE
    png
)

#------------------------------------------------------------------------------
