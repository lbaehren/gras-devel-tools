ExternalProject_Add(nano
#  [DEPENDS projects...]       # Targets on which the project depends
  PREFIX ${CMAKE_CURRENT_BINARY_DIR}
 #--Download step--------------
  URL http://www.nano-editor.org/dist/v2.5/nano-2.5.3.tar.gz
 #--Configure step-------------
  CONFIGURE_COMMAND ${CMAKE_CURRENT_BINARY_DIR}/src/nano/configure --prefix=${CMAKE_INSTALL_PREFIX}
 #--Install step---------------
  INSTALL_DIR ${CMAKE_INSTALL_PREFIX}
  )
  
