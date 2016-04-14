ExternalProject_Add(qt
  PREFIX ${CMAKE_CURRENT_BINARY_DIR}
 #--Download step--------------
  DOWNLOAD_COMMAND wget -c https://download.qt.io/archive/qt/4.8/4.8.6/qt-everywhere-opensource-src-4.8.6.tar.gz
  DOWNLOAD_NAME qt-everywhere-opensource-src-4.8.6.tar.gz
  URL https://download.qt.io/archive/qt/4.8/4.8.6/qt-everywhere-opensource-src-4.8.6.tar.gz
  PATCH_COMMAND tar -xvzf ${CMAKE_CURRENT_BINARY_DIR}/src/qt-everywhere-opensource-src-4.8.6.tar.gz
 #--Configure step-------------
#  [SOURCE_DIR dir]            # Source dir to be used for build
  CONFIGURE_COMMAND ${CMAKE_CURRENT_BINARY_DIR}/src/qt/qt-everywhere-opensource-src-4.8.6/configure
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

