ExternalProject_Add(ccache
#  [DEPENDS projects...]       # Targets on which the project depends
  PREFIX ${CMAKE_CURRENT_BINARY_DIR}
 #--Download step--------------
  DOWNLOAD_COMMAND wget -c https://www.samba.org/ftp/ccache/ccache-3.2.5.tar.gz
  DOWNLOAD_DIR ${CMAKE_CURRENT_BINARY_DIR}
 #--Update/Patch step----------
  PATCH_COMMAND ${CMAKE_CURRENT_BINARY_DIR}/ccache-3.2.5/autogen.sh
 #--Configure step-------------
  SOURCE_DIR ${CMAKE_CURRENT_BINARY_DIR}/ccache-3.2.5
  CONFIGURE_COMMAND ${CMAKE_CURRENT_BINARY_DIR}/ccache-3.2.5/configure --prefix=${CMAKE_INSTALL_PREFIX}
 #--Build step-----------------
#  [BINARY_DIR dir]            # Specify build dir location
#  [BUILD_COMMAND cmd...]      # Command to drive the native build
#  [BUILD_IN_SOURCE 1]         # Use source dir for build dir
 #--Install step---------------
  INSTALL_DIR ${CMAKE_INSTALL_PREFIX}
  )

