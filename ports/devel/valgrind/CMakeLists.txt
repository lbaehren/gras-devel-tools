ExternalProject_Add(valgrind
#  [DEPENDS projects...]       # Targets on which the project depends
  PREFIX ${CMAKE_CURRENT_BINARY_DIR}
 #--Download step--------------
  URL http://valgrind.org/downloads/valgrind-3.11.0.tar.bz2
  URL_MD5 4ea62074da73ae82e0162d6550d3f129
 #--Update/Patch step----------
#  [UPDATE_COMMAND cmd...]     # Source work-tree update command
  PATCH_COMMAND ${CMAKE_CURRENT_BINARY_DIR}/src/valgrind/autogen.sh
 #--Configure step-------------
  CONFIGURE_COMMAND ${CMAKE_CURRENT_BINARY_DIR}/src/valgrind/configure --prefix=${CMAKE_INSTALL_PREFIX}
#  [CMAKE_COMMAND /.../cmake]  # Specify alternative cmake executable
#  [CMAKE_GENERATOR gen]       # Specify generator for native build
#  [CMAKE_GENERATOR_TOOLSET t] # Generator-specific toolset name
#  CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_INSTALL_PREFIX}
#  [CMAKE_CACHE_ARGS args...]  # Initial cache arguments, of the form -Dvar:string=on
 #--Build step-----------------
#  [BINARY_DIR dir]            # Specify build dir location
#  [BUILD_COMMAND cmd...]      # Command to drive the native build
#  [BUILD_IN_SOURCE 1]         # Use source dir for build dir
 #--Install step---------------
  INSTALL_DIR ${CMAKE_INSTALL_PREFIX}
#  [INSTALL_COMMAND cmd...]    # Command to drive install after build
 #--Test step------------------
  TEST_BEFORE_INSTALL 1
#  [TEST_AFTER_INSTALL 1]      # Add test step executed after install step
  TEST_COMMAND make check
 #--Custom targets-------------
#  [STEP_TARGETS st1 st2 ...]  # Generate custom targets for these steps
  )

