ExternalProject_Add(dbus
#  [DEPENDS projects...]       # Targets on which the project depends
  PREFIX ${CMAKE_CURRENT_BINARY_DIR}
 #--Download step--------------
  DOWNLOAD_NAME dbus-1.11.2.tar.gz
  DOWNLOAD_DIR ${CMAKE_CURRENT_BINARY_DIR}
  DOWNLOAD_COMMAND wget -c https://dbus.freedesktop.org/releases/dbus/dbus-1.11.2.tar.gz
  URL https://dbus.freedesktop.org/releases/dbus/dbus-1.11.2.tar.gz
 #--Update/Patch step----------
#  [UPDATE_COMMAND cmd...]     # Source work-tree update command
  PATCH_COMMAND cd ${CMAKE_CURRENT_BINARY_DIR} && tar -xf dbus-1.11.2.tar.gz
 #--Configure step-------------
  SOURCE_DIR ${CMAKE_CURRENT_BINARY_DIR}/dbus-1.11.2
  CONFIGURE_COMMAND ${CMAKE_CURRENT_BINARY_DIR}/dbus-1.11.2/configure --prefix=${CMAKE_INSTALL_PREFIX}
 #--Build step-----------------
#  [BINARY_DIR dir]            # Specify build dir location
#  [BUILD_COMMAND cmd...]      # Command to drive the native build
#  [BUILD_IN_SOURCE 1]         # Use source dir for build dir
 #--Install step---------------
  INSTALL_DIR ${CMAKE_INSTALL_PREFIX}
#  [INSTALL_COMMAND cmd...]    # Command to drive install after build
  )

