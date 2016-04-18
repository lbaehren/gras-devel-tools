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

# - Check for the presence of GPERFTOOLS
#
# The following variables are set when GPERFTOOLS is found:
#  GPERFTOOLS_FOUND               = Set to true, if all components of GPERFTOOLS have been found.
#  GPERFTOOLS_INCLUDES            = Include path for the header files of GPERFTOOLS
#  GPERFTOOLS_LIBRARIES           = Link these to use GPERFTOOLS
#  GPERFTOOLS_TCMALLOC_LIBRARY    = Path to the tcmalloc library.
#  GPERFTOOLS_STACKTRACE_LIBRARY  = Path to the stacktrace library.
#  GPERFTOOLS_PROFILER_LIBRARY    = Path to the profiler library.
#  GPERFTOOLS_LFLAGS              = Linker flags (optional)

if (NOT GPERFTOOLS_FOUND)

  if (NOT GPERFTOOLS_ROOT_DIR)
    set (GPERFTOOLS_ROOT_DIR ${CMAKE_INSTALL_PREFIX})
  endif (NOT GPERFTOOLS_ROOT_DIR)

  ##____________________________________________________________________________
  ## Check for the header files

  find_path (GPERFTOOLS_INCLUDES
    NAMES google/heap-profiler.h google/heap-checker.h google/profiler.h
    HINTS ${GPERFTOOLS_ROOT_DIR} ${CMAKE_INSTALL_PREFIX}
    PATH_SUFFIXES include
    )

  ##____________________________________________________________________________
  ## Check for the libraries

  set (GPERFTOOLS_LIBRARIES "")

  foreach (_lib profiler stacktrace tcmalloc)
      # convert library name to upper case
      string(TOUPPER ${_lib} _var)
      # search for library
      find_library (GPERFTOOLS_${_var}_LIBRARY ${_lib}
        HINTS ${GPERFTOOLS_ROOT_DIR} ${CMAKE_INSTALL_PREFIX}
        PATH_SUFFIXES lib
        )
      # collect list of libraries
      if (GPERFTOOLS_${_var}_LIBRARY)
          list (APPEND GPERFTOOLS_LIBRARIES ${GPERFTOOLS_${_var}_LIBRARY})
      endif (GPERFTOOLS_${_var}_LIBRARY)
  endforeach (_lib)

  ##____________________________________________________________________________
  ## Check for the executable

  find_program (PPROF_EXECUTABLE pprof
    HINTS ${GPERFTOOLS_ROOT_DIR} ${CMAKE_INSTALL_PREFIX}
    PATH_SUFFIXES bin
    )

  ##____________________________________________________________________________
  ## Actions taken when all components have been found

  find_package_handle_standard_args (GPERFTOOLS DEFAULT_MSG GPERFTOOLS_LIBRARIES GPERFTOOLS_INCLUDES PPROF_EXECUTABLE)

  if (GPERFTOOLS_FOUND)
    if (NOT GPERFTOOLS_FIND_QUIETLY)
      message (STATUS "Found components for GPERFTOOLS")
      message (STATUS "GPERFTOOLS_ROOT_DIR  = ${GPERFTOOLS_ROOT_DIR}")
      message (STATUS "GPERFTOOLS_INCLUDES  = ${GPERFTOOLS_INCLUDES}")
      message (STATUS "GPERFTOOLS_LIBRARIES = ${GPERFTOOLS_LIBRARIES}")
      message (STATUS "PPROF_EXECUTABLE     = ${PPROF_EXECUTABLE}")
    endif (NOT GPERFTOOLS_FIND_QUIETLY)
  else (GPERFTOOLS_FOUND)
    if (GPERFTOOLS_FIND_REQUIRED)
      message (FATAL_ERROR "Could not find GPERFTOOLS!")
    endif (GPERFTOOLS_FIND_REQUIRED)
  endif (GPERFTOOLS_FOUND)

  ##____________________________________________________________________________
  ## Mark advanced variables

  mark_as_advanced (
    GPERFTOOLS_ROOT_DIR
    GPERFTOOLS_INCLUDES
    GPERFTOOLS_LIBRARIES
    )

endif (NOT GPERFTOOLS_FOUND)
