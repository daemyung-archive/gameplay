#
# This file is part of the "gameplay" project
# See "LICENSE" for license information.
#

#------------------------------------------------------------------------------

cmake_minimum_required(VERSION 3.15)

#------------------------------------------------------------------------------

project(gameplay VERSION 3.0.0)

#------------------------------------------------------------------------------

option(GAMEPLAY_USE_LUA_BINDING "Use Lua binding to gameplay" ON)
option(GAMEPLAY_BUILD_TOOL "Build gameplay tool" OFF)
option(GAMEPLAY_BUILD_SAMPLE "Build gameplay sample" ON)

#------------------------------------------------------------------------------

add_subdirectory(external)
add_subdirectory(gameplay)

#------------------------------------------------------------------------------

if(GAMEPLAY_BUILD_TOOL)
    add_subdirectory(tools/encoder)
    add_subdirectory(tools/luagen)
endif()

#------------------------------------------------------------------------------

if(GAMEPLAY_BUILD_SAMPLE)
    add_subdirectory(samples)
endif()

#------------------------------------------------------------------------------
