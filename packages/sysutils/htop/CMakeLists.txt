ExternalProject_Add(htop
#  [DEPENDS projects...]       # Targets on which the project depends
  PREFIX ${CMAKE_CURRENT_BINARY_DIR}
 #--Download step--------------
  DOWNLOAD_DIR ${CMAKE_CURRENT_BINARY_DIR}/download
  GIT_REPOSITORY https://github.com/hishamhm/htop.git
 #--Update/Patch step----------
  PATCH_COMMAND ${CMAKE_CURRENT_BINARY_DIR}/source/autogen.sh
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

