#-------------------------------------------------------------------------------
# Copyright (c) 2016, Lars Baehren <lbaehren@gmail.com>
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without modification,
# are permitted provided that the following conditions are met:
#
#  * Redistributions of source code must retain the above copyright notice, this
#    list of conditions and the following disclaimer.
#  * Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#-------------------------------------------------------------------------------

# - Check for the presence of GMP
#
# The following variables are set when GMP is found:
#  GMP_FOUND      = Set to true, if all components of GMP have been found.
#  GMP_INCLUDES   = Include path for the header files of GMP
#  GMP_LIBRARIES  = Link these to use GMP
#  GMP_LFLAGS     = Linker flags (optional)

if (NOT GMP_FOUND)

  if (NOT GMP_ROOT_DIR)
    set (GMP_ROOT_DIR ${CMAKE_INSTALL_PREFIX})
  endif (NOT GMP_ROOT_DIR)

  ##____________________________________________________________________________
  ## Check for the header files

  find_path (GMP_INCLUDES
    NAMES gmp.h
    HINTS ${GMP_ROOT_DIR} ${CMAKE_INSTALL_PREFIX}
    PATH_SUFFIXES include
    )

  ##____________________________________________________________________________
  ## Check for the library

  find_library (GMP_LIBRARIES gmp
    HINTS ${GMP_ROOT_DIR} ${CMAKE_INSTALL_PREFIX}
    PATH_SUFFIXES lib
    )

  ##____________________________________________________________________________
  ## Actions taken when all components have been found

  find_package_handle_standard_args (GMP DEFAULT_MSG GMP_LIBRARIES GMP_INCLUDES)

  if (GMP_FOUND)
    if (NOT GMP_FIND_QUIETLY)
      message (STATUS "Found components for GMP")
      message (STATUS "GMP_ROOT_DIR  = ${GMP_ROOT_DIR}")
      message (STATUS "GMP_INCLUDES  = ${GMP_INCLUDES}")
      message (STATUS "GMP_LIBRARIES = ${GMP_LIBRARIES}")
    endif (NOT GMP_FIND_QUIETLY)
  else (GMP_FOUND)
    if (GMP_FIND_REQUIRED)
      message (FATAL_ERROR "Could not find GMP!")
    endif (GMP_FIND_REQUIRED)
  endif (GMP_FOUND)

  ##____________________________________________________________________________
  ## Mark advanced variables

  mark_as_advanced (
    GMP_ROOT_DIR
    GMP_INCLUDES
    GMP_LIBRARIES
    )

endif (NOT GMP_FOUND)
