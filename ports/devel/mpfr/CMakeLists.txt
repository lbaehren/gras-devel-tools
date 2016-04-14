find_package(GMP)

ExternalProject_Add(mpfr
#  [DEPENDS projects...]       # Targets on which the project depends
  PREFIX ${CMAKE_CURRENT_BINARY_DIR}
 #--Download step--------------
  DOWNLOAD_NAME mpfr-2.4.2.tar.bz2
  DOWNLOAD_DIR ${CMAKE_CURRENT_BINARY_DIR}/download
  URL ftp://ftp.gwdg.de/pub/misc/gcc/infrastructure/mpfr-2.4.2.tar.bz2
 #--Update/Patch step----------
#  [UPDATE_COMMAND cmd...]     # Source work-tree update command
#  [PATCH_COMMAND cmd...]      # Command to patch downloaded source
 #--Configure step-------------
  SOURCE_DIR ${CMAKE_CURRENT_BINARY_DIR}/source
  CONFIGURE_COMMAND ${CMAKE_CURRENT_BINARY_DIR}/source/configure --prefix=${CMAKE_INSTALL_PREFIX}
 #--Build step-----------------
#  [BINARY_DIR dir]            # Specify build dir location
#  [BUILD_COMMAND cmd...]      # Command to drive the native build
#  [BUILD_IN_SOURCE 1]         # Use source dir for build dir
 #--Install step---------------
  INSTALL_DIR ${CMAKE_INSTALL_PREFIX}
#  [INSTALL_COMMAND cmd...]    # Command to drive install after build
  )

