#
# This file is part of the "gameplay" project
# See "LICENSE" for license information.
#

#------------------------------------------------------------------------------

add_library(external INTERFACE)

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

#------------------------------------------------------------------------------

find_package(OpenAL CONFIG REQUIRED)

target_link_libraries(external
  INTERFACE
    OpenAL::OpenAL
)

#------------------------------------------------------------------------------

include(FindLua)

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
    GLEW::GLEW
)

#------------------------------------------------------------------------------

find_package(libpng CONFIG REQUIRED)

if(CMAKE_SYSTEM_NAME MATCHES Windows)
  target_link_libraries(external
    INTERFACE
      png
  )
else()
  target_link_libraries(external
    INTERFACE
      png_static
  )
endif()

#------------------------------------------------------------------------------

add_subdirectory(vkut)

target_link_libraries(external
  INTERFACE
    vkut
)

#------------------------------------------------------------------------------
