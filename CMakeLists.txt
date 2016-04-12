#-------------------------------------------------------------------------------
# (c) Lars Baehren <lbaehren@gmail.com> (3016). All Rights Reserved.
# This software is distributed under the BSD 2-clause license.
#-------------------------------------------------------------------------------

## =============================================================================
##
## CMake project settings
##
## =============================================================================

## Name of the project handled by CMake
project (mettools)

set (PROJECT_VERSION_MAJOR 1)
set (PROJECT_VERSION_MINOR 0)
set (PROJECT_VERSION_PATCH 0)
set (PROJECT_VERSION "${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}.${PROJECT_VERSION_PATCH}")

## Minimum required version of CMake to configure the project
cmake_minimum_required (VERSION 2.8)

## CMake policy (https://cmake.org/Wiki/CMake_Policies)
cmake_policy (VERSION 2.8)

if (POLICY CMP0042)
cmake_policy (SET CMP0042 NEW)
endif (POLICY CMP0042)

# CMake modules
include(ExternalProject)
include(CheckTypeSize)

## =============================================================================
##
## System inspection
##
## =============================================================================

check_type_size("void*" SIZEOF_VOID_P BUILTIN_TYPES_ONLY)

## =============================================================================
##
## Configuration options
##
## =============================================================================

add_subdirectory(packages)

## =============================================================================
##
##  Configuration summary
##
## =============================================================================

message ("------------------------------------------------------------")
message ("[${PROJECT_NAME}] Configuration summary")
message ("------------------------------------------------------------")
message (" - Installation prefix : ${CMAKE_INSTALL_PREFIX}")
message ("------------------------------------------------------------")
message (" * System configuration" )
message (" .. Processor type ............. = ${CMAKE_SYSTEM_PROCESSOR}" )
message (" .. CMake executable ........... = ${CMAKE_COMMAND}" )
message (" .. CMake version .............. = ${CMAKE_VERSION}" )
message (" .. System name ................ = ${CMAKE_SYSTEM_NAME}" )
message (" .. System version ............. = ${CMAKE_SYSTEM_VERSION}" )
message (" .. C compiler ................. = ${CMAKE_C_COMPILER}" )
message (" .. C compiler flags ........... = ${CMAKE_C_FLAGS}" )
message (" .. C++ compiler ............... = ${CMAKE_CXX_COMPILER}" )
message (" .. C++ compiler flags ......... = ${CMAKE_CXX_FLAGS}" )
message (" .. size(void*) ................ = ${SIZEOF_VOID_P}")
message (" .. Memory checker ............. = ${MEMORYCHECK_COMMAND}" )
message ("------------------------------------------------------------")
message (" * CMake configuration:" )
message (" .. CMake executable ........... = ${CMAKE_COMMAND}" )
message (" .. CMake version .............. = ${CMAKE_VERSION}" )
message (" .. Module path ................ = ${CMAKE_MODULE_PATH}" )
message (" .. Installation prefix ........ = ${CMAKE_INSTALL_PREFIX}" )
message ("------------------------------------------------------------")
