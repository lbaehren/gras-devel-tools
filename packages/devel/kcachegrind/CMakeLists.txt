ExternalProject_Add(kcachegrind
#  [DEPENDS projects...]       # Targets on which the project depends
  PREFIX kcachegrind
 #--Download step--------------
  URL http://kcachegrind.sourceforge.net/kcachegrind-0.7.4.tar.gz
 #--Configure step-------------
  SOURCE_DIR src
  CONFIGURE_COMMAND qmake ${CMAKE_CURRENT_BINARY_DIR}/src
#  [CMAKE_COMMAND /.../cmake]  # Specify alternative cmake executable
#  [CMAKE_GENERATOR gen]       # Specify generator for native build
#  [CMAKE_GENERATOR_TOOLSET t] # Generator-specific toolset name
#  CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_INSTALL_PREFIX}
#  [CMAKE_CACHE_ARGS args...]  # Initial cache arguments, of the form -Dvar:string=on
 #--Build step-----------------
#  [BINARY_DIR dir]            # Specify build dir location
  BUILD_COMMAND make -f ${CMAKE_CURRENT_BINARY_DIR}/kcachegrind/src/kcachegrind-build/Makefile
#  [BUILD_IN_SOURCE 1]         # Use source dir for build dir
 #--Install step---------------
  INSTALL_COMMAND cp ${CMAKE_CURRENT_BINARY_DIR}/kcachegrind/src/kcachegrind-build/qcachegrind/qcachegrind ${CMAKE_INSTALL_PREFIX}/bin
  INSTALL_DIR ${CMAKE_INSTALL_PREFIX}
  )

