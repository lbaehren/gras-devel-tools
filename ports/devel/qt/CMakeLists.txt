
#_______________________________________________________________________________
#  Package configuration

set (PORT_VERSION_QT_MAJOR "5")
set (PORT_VERSION_QT_MINOR "6")
set (PORT_VERSION_QT_SERIES "${PORT_VERSION_QT_MAJOR}.${PORT_VERSION_QT_MINOR}")
set (PORT_VERSION_QT "${PORT_VERSION_QT_MAJOR}.${PORT_VERSION_QT_MINOR}.0")

#_______________________________________________________________________________
#  Package installation

ExternalProject_Add(qt
  PREFIX ${CMAKE_CURRENT_BINARY_DIR}
 #--Download step--------------
  DOWNLOAD_DIR ${CMAKE_CURRENT_BINARY_DIR}
  DOWNLOAD_NAME qt-everywhere-opensource-src-${PORT_VERSION_QT}.tar.gz
  URL http://download.qt.io/official_releases/qt/${PORT_VERSION_QT_SERIES}/${PORT_VERSION_QT}/single/qt-everywhere-opensource-src-${PORT_VERSION_QT}.tar.gz
 #--Update/Patch step----------
  PATCH_COMMAND cd ${CMAKE_CURRENT_BINARY_DIR} && tar -xf qt-everywhere-opensource-src-${PORT_VERSION_QT}.tar.gz
 #--Configure step-------------
 #   -D <string> ........ Add an explicit define to the preprocessor.
 #   -I <string> ........ Add an explicit include path.
 #   -L <string> ........ Add an explicit library path.
#  [SOURCE_DIR dir]            # Source dir to be used for build
  CONFIGURE_COMMAND ${CMAKE_CURRENT_BINARY_DIR}/qt-everywhere-opensource-src-${PORT_VERSION_QT}/configure --prefix=${CMAKE_INSTALL_PREFIX} --confirm-license --opensource
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
  )

